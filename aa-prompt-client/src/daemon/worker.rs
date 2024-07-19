use crate::{
    daemon::{ActionedPrompt, EnrichedPrompt},
    snapd_client::{PromptId, TypedUiInput},
    Result,
};
use std::{
    env,
    sync::{Arc, Mutex},
    time::Duration,
};
use tokio::{process::Command, sync::mpsc::UnboundedReceiver, time::timeout};
use tracing::{debug, error, span, Level};

const RECV_TIMEOUT: Duration = Duration::from_millis(200);

#[derive(Debug, Clone, Copy)]
enum Recv {
    Success,
    Timeout,
    DeadPrompt,
    ChannelClosed,
}

pub struct ReadOnlyActivePrompt {
    active_prompt: Arc<Mutex<Option<TypedUiInput>>>,
}

impl ReadOnlyActivePrompt {
    pub fn get(&self) -> Option<TypedUiInput> {
        let guard = match self.active_prompt.lock() {
            Ok(guard) => guard,
            Err(err) => err.into_inner(),
        };
        guard.clone()
    }
}

#[derive(Debug)]
pub struct Worker {
    rx_prompts: UnboundedReceiver<EnrichedPrompt>,
    active_prompt: Arc<Mutex<Option<TypedUiInput>>>,
    rx_actioned_prompts: UnboundedReceiver<ActionedPrompt>,
    prompts_to_drop: Vec<PromptId>,
    dead_prompts: Vec<PromptId>,
}

impl Worker {
    pub fn new(
        rx_prompts: UnboundedReceiver<EnrichedPrompt>,
        rx_actioned_prompts: UnboundedReceiver<ActionedPrompt>,
    ) -> Self {
        Self {
            rx_prompts,
            active_prompt: Arc::new(Mutex::new(None)),
            rx_actioned_prompts,
            prompts_to_drop: Vec::new(),
            dead_prompts: Vec::new(),
        }
    }

    pub fn read_only_active_prompt(&self) -> ReadOnlyActivePrompt {
        ReadOnlyActivePrompt {
            active_prompt: self.active_prompt.clone(),
        }
    }

    pub async fn run(mut self) -> Result<()> {
        let snap = env::var("SNAP").expect("SNAP env var to be set");
        let cmd = format!("{snap}/bin/apparmor-prompt/apparmor_prompt");

        loop {
            let ep = match self.rx_prompts.recv().await {
                Some(ep) => ep,
                None => return Ok(()), // channel now closed
            };

            let span = span!(target: "worker", Level::INFO, "Prompt", id=%ep.prompt.id().0);
            let _enter = span.enter();

            debug!("got prompt");

            if self.prompts_to_drop.contains(ep.prompt.id()) {
                debug!("dropping prompt");
                self.prompts_to_drop.retain(|id| id != ep.prompt.id());
                continue;
            }

            let expected_id = ep.prompt.id().clone();
            self.update_active_prompt(ep);

            // FIXME: the UI closing without replying or actioning multiple prompts gets tricky (when can we spawn the next UI?)
            debug!("spawning UI");
            Command::new(&cmd).spawn()?.wait().await?;

            loop {
                match self.wait_for_expected_prompt(&expected_id).await {
                    Recv::Success | Recv::Timeout => break,
                    Recv::DeadPrompt => continue,
                    Recv::ChannelClosed => return Ok(()),
                }
            }

            self.active_prompt
                .lock()
                .expect("grpc server panicked")
                .take();
        }
    }

    fn update_active_prompt(&mut self, EnrichedPrompt { prompt, meta }: EnrichedPrompt) {
        let input = TypedUiInput::from_prompt(prompt, meta);
        let mut guard = match self.active_prompt.lock() {
            Ok(guard) => guard,
            Err(err) => err.into_inner(),
        };
        guard.replace(input);
    }

    async fn wait_for_expected_prompt(&mut self, expected_id: &PromptId) -> Recv {
        match timeout(RECV_TIMEOUT, self.rx_actioned_prompts.recv()).await {
            Ok(Some(ActionedPrompt { id, others })) => {
                debug!(recv_id=%id.0, "reply sent for prompt");
                self.prompts_to_drop.extend(others);

                if !self.dead_prompts.contains(&id) {
                    return Recv::Success;
                }
                self.dead_prompts.retain(|i| i != expected_id);
                Recv::DeadPrompt
            }

            Ok(None) => Recv::ChannelClosed, // channel now closed

            Err(_) => {
                error!(id=%expected_id.0, "timeout waiting for ack from grpc server");
                self.dead_prompts.push(expected_id.clone());
                Recv::Timeout
            }
        }
    }
}
