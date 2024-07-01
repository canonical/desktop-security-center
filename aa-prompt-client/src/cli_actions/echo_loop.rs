use crate::{recording::PromptRecording, snapd_client::SnapdSocketClient, Result};
use tracing::{debug, info, warn};

pub async fn run_echo_loop(mut c: SnapdSocketClient, path: Option<String>) -> Result<()> {
    let mut rec = PromptRecording::new(path);

    loop {
        debug!("waiting for notices");
        let pending = rec.await_pending_handling_ctrl_c(&mut c).await?;

        info!(?pending, "processing notices");
        for id in pending {
            debug!(?id, "pulling prompt details from snapd");
            match c.prompt_details(&id).await {
                Ok(p) if rec.is_prompt_for_writing_output(&p) => {
                    return rec.allow_write(p, &c).await;
                }

                Ok(p) => {
                    println!("{}", serde_json::to_string(&p)?);
                    rec.push_prompt(&p);
                }

                Err(e) => warn!(%e, "unable to pull prompt"),
            }
        }
    }
}
