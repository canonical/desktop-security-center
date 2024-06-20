use crate::{snapd_client::SnapdSocketClient, Result};
use std::fs;
use tokio::{select, signal::ctrl_c};
use tracing::{debug, info, warn};

pub async fn run_echo_loop(mut c: SnapdSocketClient, path: Option<String>) -> Result<()> {
    let recording = path.is_some();
    let mut prompts = Vec::new();

    loop {
        debug!("waiting for notices");
        let pending = select! {
            res = c.pending_prompts() => res?,
            _ = ctrl_c() => {
                if recording {
                    fs::write(path.unwrap(), serde_json::to_string(&prompts)?)?;
                }

                return Ok(());
            }
        };

        info!(?pending, "processing notices");
        for id in pending {
            debug!(?id, "pulling prompt details from snapd");
            let p = match c.prompt_details(&id).await {
                Ok(p) => p,
                Err(e) => {
                    warn!(%e, "unable to pull prompt");
                    continue;
                }
            };

            println!("{}", serde_json::to_string(&p)?);
            if recording {
                prompts.push(p);
            }
        }
    }
}
