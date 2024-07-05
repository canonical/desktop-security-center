use crate::{
    prompt_sequence::{MatchError, PromptSequence},
    recording::PromptRecording,
    snapd_client::{
        interfaces::{home::HomeInterface, SnapInterface},
        PromptId, SnapdSocketClient, TypedPrompt, TypedPromptReply,
    },
    Error, Result,
};
use std::env;
use tracing::{debug, error, info, warn};

// FIXME: having to hard code this is a problem.
// We need snapd to provide structured errors we can work with programatically.
const PROMPT_NOT_FOUND: &str = "no prompt with the given ID found for the given user";
const NO_PROMPTS_FOR_USER: &str = "no prompts found for the given user";

trait ReplyClient {
    async fn get_reply(
        &mut self,
        p: TypedPrompt,
        prev_error: Option<String>,
        rec: &mut PromptRecording,
    ) -> Result<TypedPromptReply>;

    /// We need to be able to check for when a ScriptedClient has successfully reached the end of
    /// its expected prompt sequence. Other clients should always return true.
    fn running(&self) -> bool;

    async fn reply_retrying_errors(
        &mut self,
        id: PromptId,
        p: TypedPrompt,
        c: &mut SnapdSocketClient,
        rec: &mut PromptRecording,
    ) -> Result<()> {
        rec.push_prompt(&p);
        let mut reply = self.get_reply(p.clone(), None, rec).await?;

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
            reply = self.get_reply(p.clone(), Some(prev_error), rec).await?;

            debug!(?id, ?reply, "replying to prompt");
            rec.push_reply(&reply);
        }

        Ok(())
    }
}

/// Run a simple client listener that processes notices and prompts serially
async fn run_client_loop<C: ReplyClient>(
    mut c: SnapdSocketClient,
    mut client: C,
    path: Option<String>,
) -> Result<()> {
    let mut rec = PromptRecording::new(path);

    while client.running() {
        println!("polling for notices...");
        let pending = rec.await_pending_handling_ctrl_c(&mut c).await?;

        info!(?pending, "processing notices");
        for id in pending {
            debug!(?id, "pulling prompt details from snapd");
            let p = match c.prompt_details(&id).await {
                Ok(TypedPrompt::Home(p)) if rec.is_prompt_for_writing_output(&p) => {
                    return rec.allow_write(p, &c).await;
                }

                Ok(p) => p,

                Err(e) => {
                    warn!(%e, "unable to pull prompt");
                    continue;
                }
            };

            client
                .reply_retrying_errors(id, p, &mut c, &mut rec)
                .await?;
        }
    }

    Ok(())
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
        let cmd = format!("{snap}/bin/apparmor-prompt/apparmor_prompt");

        Self { cmd }
    }
}

impl ReplyClient for FlutterClient {
    fn running(&self) -> bool {
        true
    }

    async fn get_reply(
        &mut self,
        prompt: TypedPrompt,
        prev_error: Option<String>,
        rec: &mut PromptRecording,
    ) -> Result<TypedPromptReply> {
        let TypedPrompt::Home(p) = prompt;
        let reply = HomeInterface
            .try_get_reply_from_ui(&self.cmd, p, prev_error, rec)
            .await?;

        Ok(reply.into())
    }
}

/// Handle prompts using scripted client interactions
pub async fn run_scripted_client_loop(c: SnapdSocketClient, path: &str) -> Result<()> {
    run_client_loop(c, ScriptedClient::try_new(path)?, None).await
}

struct ScriptedClient {
    seq: PromptSequence,
}

impl ScriptedClient {
    fn try_new(path: &str) -> Result<Self> {
        let seq = PromptSequence::try_new_from_file(path)?;

        Ok(Self { seq })
    }
}

impl ReplyClient for ScriptedClient {
    async fn get_reply(
        &mut self,
        prompt: TypedPrompt,
        prev_error: Option<String>,
        _: &mut PromptRecording, // No UI input to record
    ) -> Result<TypedPromptReply> {
        if let Some(error) = prev_error {
            return Err(Error::FailedPromptSequence {
                error: MatchError::UnexpectedError { error },
            });
        }

        match self.seq.try_match_next(prompt) {
            Ok(reply) => Ok(reply),
            Err(error) => Err(Error::FailedPromptSequence { error }),
        }
    }

    fn running(&self) -> bool {
        !self.seq.is_empty()
    }
}
