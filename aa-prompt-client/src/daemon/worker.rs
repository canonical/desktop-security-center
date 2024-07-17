use crate::{
    daemon::{ActionedPrompt, EnrichedPrompt},
    snapd_client::{PromptId, TypedUiInput},
    Result,
};
use std::sync::{Arc, Mutex};
use tokio::sync::mpsc::Receiver;
use tracing::error;

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

pub struct Worker {
    ch_prompts: Receiver<EnrichedPrompt>,
    active_prompt: Arc<Mutex<Option<TypedUiInput>>>,
    ch_actioned_prompts: Receiver<ActionedPrompt>,
    prompts_to_drop: Vec<PromptId>,
    dead_prompts: Vec<PromptId>,
}

impl Worker {
    pub fn new(
        ch_prompts: Receiver<EnrichedPrompt>,
        ch_actioned_prompts: Receiver<ActionedPrompt>,
    ) -> Self {
        Self {
            ch_prompts,
            active_prompt: Arc::new(Mutex::new(None)),
            ch_actioned_prompts,
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
        loop {
            let prompt = match self.ch_prompts.recv().await {
                Some(p) => p,
                None => return Ok(()), // log here?
            };

            if self.prompts_to_drop.contains(&prompt.prompt.id()) {
                self.prompts_to_drop.retain(|id| id != prompt.prompt.id());
                continue;
            }

            let input = TypedUiInput::from_prompt(prompt.prompt, prompt.meta);
            let mut guard = match self.active_prompt.lock() {
                Ok(guard) => guard,
                Err(err) => err.into_inner(),
            };
            guard.replace(input);

            // FIXME: the UI closing without replying or actioning multiple prompts gets tricky (when can we spawn the next UI?)
            // - spawn the UI to display the prompt

            // FIXME: needs to be done over a timeout
            // - if recv'd prompt is dead, drop it and try again
            let ActionedPrompt { id, others } = match self.ch_actioned_prompts.recv().await {
                Some(actioned) => actioned,
                None => return Ok(()),
            };

            self.prompts_to_drop.extend(others);
            let mut guard = match self.active_prompt.lock() {
                Ok(guard) => guard,
                Err(err) => err.into_inner(),
            };
            match guard.take() {
                Some(p) if p.id() == &id => (),
                Some(_) => {
                    error!(id=%id.0, "dead id");
                    self.dead_prompts.push(id);
                }
                None => error!("active prompt was empty"),
            }
        }
    }
}
