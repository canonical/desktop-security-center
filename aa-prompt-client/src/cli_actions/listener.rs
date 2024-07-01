use crate::{
    recording::PromptRecording,
    snapd_client::{
        interfaces::{
            home::{HomeInterface, HomeUiReply},
            SnapdInterface, TypedPrompt, TypedPromptReply,
        },
        Action, PromptId, SnapdSocketClient,
    },
    Error, Result,
};
use std::env;
use tokio::process::Command;
use tracing::{debug, error, info, warn};

// FIXME: having to hard code this is a problem.
// We need snapd to provide structured errors we can work with programatically.
const PROMPT_NOT_FOUND: &str = "no prompt with the given ID found for the given user";
const NO_PROMPTS_FOR_USER: &str = "no prompts found for the given user";

trait ReplyClient {
    async fn get_reply(&self, p: Prompt, prev_error: Option<String>) -> Result<PromptReply>;

    async fn reply_retrying_errors(
        &self,
        c: &mut SnapdSocketClient,
        rec: &mut PromptRecording,
        id: PromptId,
        p: Prompt,
    ) -> Result<()> {
        rec.push_prompt(&p);
        let mut reply = self.get_reply(p.clone(), None).await?;

        debug!(?id, ?reply, "replying to prompt");
        rec.push_reply(&reply);

        while let Err(e) = c.reply_to_prompt(&id, reply).await {
            rec.push_error(&e);

            let prev_error = match e {
                Error::SnapdError { message } if message == NO_PROMPTS_FOR_USER => {
                    warn!(?id, "no prompts found for user");
                    return Ok(());
                }

                Error::SnapdError { message } if message == PROMPT_NOT_FOUND => {
                    warn!(?id, "prompt has already been actioned");
                    return Ok(());
                }

                Error::SnapdError { message } => message,

                _ => {
                    error!(%e, "unexpected error in replying to prompt");
                    return Err(e);
                }
            };

            debug!(%prev_error, "error returned from snapd, retrying");
            reply = self.get_reply(p.clone(), Some(prev_error)).await?;

            debug!(?id, ?reply, "replying to prompt");
            rec.push_reply(&reply);
        }

        Ok(())
    }
}

/// Run a simple client listener that processes notices and prompts serially
async fn run_client_loop<C: ReplyClient>(
    mut c: SnapdSocketClient,
    client: C,
    path: Option<String>,
) -> Result<()> {
    let mut rec = PromptRecording::new(path);

    loop {
        println!("polling for notices...");
        let pending = rec.await_pending_handling_ctrl_c(&mut c).await?;

        info!(?pending, "processing notices");
        for id in pending {
            debug!(?id, "pulling prompt details from snapd");
            let p = match c.prompt_details(&id).await {
                Ok(p) if rec.is_prompt_for_writing_output(&p) => {
                    return rec.allow_write(p, &c).await;
                }

                Ok(p) => p,

                Err(e) => {
                    warn!(%e, "unable to pull prompt");
                    continue;
                }
            };

            client
                .reply_retrying_errors(&mut c, &mut rec, id, p)
                .await?;
        }
    }
}

/// Handle prompts via a spawned flutter UI
pub async fn run_flutter_client_loop(c: SnapdSocketClient, path: Option<String>) -> Result<()> {
    run_client_loop(c, FlutterClient::new(), path).await
}

struct FlutterClient {
    cmd: String,
}

impl FlutterClient {
    fn new() -> Self {
        let snap = env::var("SNAP").expect("SNAP env var to be set");
        let cmd = format!("{snap}/bin/apparmor_prompt");

        Self { cmd }
    }
}

impl ReplyClient for FlutterClient {
    async fn get_reply(&self, p: Prompt, prev_error: Option<String>) -> Result<PromptReply> {
        let input = serde_json::to_string(&p.as_ui_prompt_input(prev_error))?;
        debug!(input, "prompt details for the flutter ui");

        let output = Command::new(&self.cmd).arg(&input).output().await?;
        debug!(
            raw_stdout = %String::from_utf8(output.stdout.clone()).unwrap(),
            "raw output from the flutter ui"
        );

        // If the user closes out the prompt without submitting a reply we will get nothing on
        // stdout so we treat that as "deny once".
        if output.stdout.is_empty() {
            return Ok(HomeInterface.prompt_to_reply(p, Action::Deny).into());
        }

        let ui_reply: HomeUiReply = serde_json::from_slice(&output.stdout)?;
        debug!(?ui_reply, "parsed reply from the flutter ui");

        Ok(HomeInterface.map_ui_reply(ui_reply).into())
    }
}
