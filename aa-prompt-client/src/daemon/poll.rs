//! The poll loop for pulling prompt details from snapd
//!
//! The poll loop is responsible for handling out long polling on the notices API and then pulling
//! all of the required data we need from snapd in order to be able to serve the prompt UI. The
//! enriched prompts themselves are simply passed off on a channel for downstream consumption and
//! mapping into the data required for the prompt UI.
use crate::{
    daemon::EnrichedPrompt,
    snapd_client::{SnapMeta, SnapdSocketClient},
    Result,
};
use std::collections::HashMap;
use tokio::sync::mpsc::UnboundedSender;
use tracing::{debug, trace, warn};

struct MetaCache {
    inner: HashMap<String, SnapMeta>,
}

impl MetaCache {
    // TODO: need to have a timeout on how long we keep this cached or see if there is a notice we
    // can subscribe to which tells us when a snap has been updated
    async fn get(&mut self, snap: &str, client: &SnapdSocketClient) -> Option<SnapMeta> {
        match self.inner.get(snap) {
            Some(meta) => Some(meta.clone()),
            None => {
                let meta = client.snap_metadata(snap).await;
                if let Some(meta) = &meta {
                    self.inner.insert(snap.to_string(), meta.clone());
                }
                meta
            }
        }
    }
}

pub async fn poll_for_prompts(
    mut client: SnapdSocketClient,
    tx: UnboundedSender<EnrichedPrompt>,
) -> Result<()> {
    let mut meta_cache = MetaCache {
        inner: HashMap::new(),
    };

    loop {
        trace!("polling for notices");
        let pending = client.pending_prompts().await?;

        debug!(?pending, "processing notices");
        for id in pending {
            debug!(?id, "pulling prompt details from snapd");
            let prompt = match client.prompt_details(&id).await {
                Ok(p) => p,

                // TODO: be smarter about which errors need to be logged
                Err(e) => {
                    warn!(%e, "unable to pull prompt");
                    continue;
                }
            };

            let meta = meta_cache.get(prompt.snap(), &client).await;

            if let Err(error) = tx.send(EnrichedPrompt { prompt, meta }) {
                warn!(%error, "receiver channel for enriched prompts has been dropped. Exiting.");
                return Ok(());
            }
        }
    }
}
