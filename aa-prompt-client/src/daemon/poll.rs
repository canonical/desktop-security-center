//! The poll loop for pulling prompt details from snapd
//!
//! The poll loop is responsible for handling out long polling on the notices API and then pulling
//! all of the required data we need from snapd in order to be able to serve the prompt UI. The
//! enriched prompts themselves are simply passed off on a channel for downstream consumption and
//! mapping into the data required for the prompt UI.
use crate::{
    daemon::EnrichedPrompt,
    snapd_client::{PromptId, SnapMeta, SnapdSocketClient, TypedPrompt},
    Error, Result, NO_PROMPTS_FOR_USER, PROMPT_NOT_FOUND,
};
use std::collections::HashMap;
use tokio::sync::mpsc::UnboundedSender;
use tracing::{debug, error, info, warn};

#[derive(Debug, Clone)]
struct PollLoopState {
    client: SnapdSocketClient,
    tx: UnboundedSender<EnrichedPrompt>,
    meta_cache: HashMap<String, SnapMeta>,
    running: bool,
}

impl PollLoopState {
    fn new(client: SnapdSocketClient, tx: UnboundedSender<EnrichedPrompt>) -> Self {
        Self {
            client,
            tx,
            meta_cache: Default::default(),
            running: true,
        }
    }

    // FIXME: need to have a timeout on how long we keep this cached or see if there is a notice we
    // can subscribe to which tells us when a snap has been updated
    async fn get(&mut self, snap: &str) -> Option<SnapMeta> {
        match self.meta_cache.get(snap) {
            Some(meta) => Some(meta.clone()),
            None => {
                let meta = self.client.snap_metadata(snap).await;
                if let Some(meta) = &meta {
                    self.meta_cache.insert(snap.to_string(), meta.clone());
                }
                meta
            }
        }
    }

    async fn pull_and_process_prompt(&mut self, id: PromptId) {
        debug!(?id, "pulling prompt details from snapd");
        let prompt = match self.client.prompt_details(&id).await {
            Ok(p) => p,

            Err(Error::SnapdError { message })
                if message == PROMPT_NOT_FOUND || message == NO_PROMPTS_FOR_USER =>
            {
                return
            }

            Err(e) => {
                warn!(%e, "unable to pull prompt");
                return;
            }
        };

        self.process_prompt(prompt).await;
    }

    async fn process_prompt(&mut self, prompt: TypedPrompt) {
        let meta = self.get(prompt.snap()).await;

        if let Err(error) = self.tx.send(EnrichedPrompt { prompt, meta }) {
            warn!(%error, "receiver channel for enriched prompts has been dropped. Exiting.");
            self.running = false;
        }
    }

    /// Catch up on all pending prompts before dropping into polling the notices API
    async fn handle_initial_prompts(&mut self) {
        info!("checking for pending prompts");
        let pending = match self.client.all_pending_prompt_details().await {
            Err(error) => {
                error!(%error, "unable to pull pending prompts");
                return;
            }
            Ok(pending) if pending.is_empty() => {
                info!("no currently pending prompts");
                return;
            }
            Ok(pending) => pending,
        };

        info!(n_prompts=%pending.len(), "processing pending prompts");
        let mut seen = Vec::with_capacity(pending.len());
        for prompt in pending {
            seen.push(prompt.id().clone());
            self.process_prompt(prompt).await;
        }

        // The timestamps we get back from the prompts API are not semantically compatible with
        // the ones that we need to provide for the notices API, so we deliberately set up an
        // overlap between pulling all pending prompts first before pulling pending prompt IDs
        // and updating our internal `after` timestamp.
        let pending = match self.client.pending_prompt_ids().await {
            Ok(pending) => pending,
            Err(error) => {
                error!(%error, "unable to pull pending prompt ids");
                return;
            }
        };

        for id in pending {
            if !seen.contains(&id) {
                self.pull_and_process_prompt(id).await;
            }
        }
    }
}

pub async fn poll_for_prompts(
    client: SnapdSocketClient,
    tx: UnboundedSender<EnrichedPrompt>,
) -> Result<()> {
    let mut state = PollLoopState::new(client, tx);
    state.handle_initial_prompts().await;

    while state.running {
        info!("polling for notices");
        let pending = match state.client.pending_prompt_ids().await {
            Ok(pending) => pending,
            Err(error) => {
                error!(%error, "unable to pull prompt ids. retrying");
                continue;
            }
        };

        debug!(?pending, "processing notices");
        for id in pending {
            state.pull_and_process_prompt(id).await;
        }
    }

    Ok(())
}
