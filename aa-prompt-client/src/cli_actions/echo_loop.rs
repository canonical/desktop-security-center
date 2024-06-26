use crate::{
    snapd_client::{Action, Prompt, SnapdSocketClient},
    Result,
};
use serde::{Deserialize, Serialize};
use std::{fs, process::exit};
use tokio::{select, signal::ctrl_c};
use tracing::{debug, error, info, warn};

const SNAP_NAME: &str = "apparmor-prompting";

#[derive(Debug, Serialize, Deserialize)]
struct PromptRecording {
    version: u8, // currently only v1
    prompts: Vec<Prompt>,
}

impl PromptRecording {
    pub fn new() -> Self {
        Self {
            version: 1,
            prompts: Vec::new(),
        }
    }
}

pub async fn run_echo_loop(mut c: SnapdSocketClient, path: Option<String>) -> Result<()> {
    let recording_prompts = match &path {
        Some(path) => {
            info!(%path, "recording enabled: triggering prompt for later creation of output file");
            let path = path.clone();
            // We need to make use of the home interface ourselves in order to be able to create
            // our output file when recording, so we listen for and allow the creation of the
            // recording file on startup.
            tokio::task::spawn(async move {
                // @olivercalder these are the back to back writes that result in the file being
                // truncated but not written to. Also see the integration test that has been added
                // around overwriting an existing file for the behaviour observed from the shell:
                //   printf "%s" "$content" > "$FILE_PATH"
                //
                // Source for 'fs::write': https://doc.rust-lang.org/src/std/fs.rs.html#339-344
                // Source for 'File::create': https://doc.rust-lang.org/src/std/fs.rs.html#403-405
                debug!(%path, "creating output file");
                match fs::write(&path, "1") {
                    Ok(_) => debug!("output file created"),
                    Err(e) => {
                        error!(%e, "unable to create output file");
                        exit(1);
                    }
                }
                match fs::write(&path, "2") {
                    Ok(_) => debug!("output file created"),
                    Err(e) => {
                        error!(%e, "unable to create output file");
                        exit(1);
                    }
                }
            });

            true
        }

        None => false,
    };

    let mut rec = PromptRecording::new();

    loop {
        debug!("waiting for notices");
        let pending = select! {
            res = c.pending_prompts() => res?,
            _ = ctrl_c() => {
                if recording_prompts && !rec.prompts.is_empty() {
                    let path = path.unwrap();
                    info!(n=%rec.prompts.len(), %path, "writing prompts to file");
                    fs::write(path, serde_json::to_string(&rec)?)?;
                }

                return Ok(());
            }
        };

        info!(?pending, "processing notices");
        for id in pending {
            debug!(?id, "pulling prompt details from snapd");
            match c.prompt_details(&id).await {
                Ok(p) if p.snap() == SNAP_NAME => {
                    let id = p.id.clone();
                    let reply = p
                        .into_reply(Action::Allow)
                        .for_forever()
                        .try_with_custom_permissions(vec![
                            "read".to_string(),
                            "write".to_string(),
                        ])?;
                    info!("auto-replying to our own prompt for creating output file");
                    c.reply_to_prompt(&id, reply).await?;
                }

                Ok(p) => {
                    println!("{}", serde_json::to_string(&p)?);
                    if recording_prompts {
                        rec.prompts.push(p);
                    }
                }

                Err(e) => warn!(%e, "unable to pull prompt"),
            }
        }
    }
}
