use crate::{
    prompt_sequence::{MatchError, PromptFilter, PromptSequence},
    recording::PromptRecording,
    snapd_client::{
        interfaces::{
            home::{HomeConstraintsFilter, HomeInterface},
            SnapInterface,
        },
        Action, PromptId, SnapMeta, SnapdSocketClient, TypedPrompt, TypedPromptReply,
    },
    Error, Result, SNAP_NAME,
};
use std::{env, time::Duration};
use tokio::select;
use tracing::{debug, error, info, warn};

// FIXME: having to hard code these is a problem.
// We need snapd to provide structured errors we can work with programatically.
const PROMPT_NOT_FOUND: &str = "no prompt with the given ID found for the given user";
const NO_PROMPTS_FOR_USER: &str = "no prompts found for the given user";

trait ReplyClient {
    async fn get_reply(
        &mut self,
        p: TypedPrompt,
        meta: Option<SnapMeta>,
        prev_error: Option<String>,
        rec: &mut PromptRecording,
    ) -> Result<TypedPromptReply>;

    /// We need to be able to check for when a [ScriptedClient] has successfully reached the end of
    /// its expected prompt sequence. Other clients should always return true.
    fn is_running(&self) -> bool;

    async fn reply_retrying_errors(
        &mut self,
        id: PromptId,
        prompt: TypedPrompt,
        snapd_client: &mut SnapdSocketClient,
        rec: &mut PromptRecording,
    ) -> Result<()> {
        rec.push_prompt(&prompt);
        let meta = snapd_client.snap_metadata(prompt.snap()).await;
        let mut reply = self
            .get_reply(prompt.clone(), meta.clone(), None, rec)
            .await?;

        debug!(?id, ?reply, "replying to prompt");
        rec.push_reply(&reply);

        while let Err(e) = snapd_client.reply_to_prompt(&id, reply).await {
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
            reply = self
                .get_reply(prompt.clone(), meta.clone(), Some(prev_error), rec)
                .await?;

            debug!(?id, ?reply, "replying to prompt");
            rec.push_reply(&reply);
        }

        Ok(())
    }
}

/// Run a simple client listener that processes notices and prompts serially
async fn run_client_loop<C: ReplyClient>(
    snapd_client: &mut SnapdSocketClient,
    mut reply_client: C,
    path: Option<String>,
) -> Result<()> {
    let mut rec = PromptRecording::new(path);

    while reply_client.is_running() {
        info!("polling for notices...");
        let pending = rec.await_pending_handling_ctrl_c(snapd_client).await?;

        debug!(?pending, "processing notices");
        for id in pending {
            debug!(?id, "pulling prompt details from snapd");
            let prompt = match snapd_client.prompt_details(&id).await {
                Ok(TypedPrompt::Home(p)) if rec.is_prompt_for_writing_output(&p) => {
                    return rec.allow_write(p, snapd_client).await;
                }

                Ok(p) => p,

                Err(e) => {
                    warn!(%e, "unable to pull prompt");
                    continue;
                }
            };

            reply_client
                .reply_retrying_errors(id, prompt, snapd_client, &mut rec)
                .await?;
        }
    }

    Ok(())
}

/// Handle prompts via a spawned flutter UI
pub async fn run_flutter_client_loop(
    snapd_client: &mut SnapdSocketClient,
    path: Option<String>,
) -> Result<()> {
    run_client_loop(snapd_client, FlutterClient::new(), path).await
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
    fn is_running(&self) -> bool {
        true
    }

    async fn get_reply(
        &mut self,
        prompt: TypedPrompt,
        meta: Option<SnapMeta>,
        prev_error: Option<String>,
        rec: &mut PromptRecording,
    ) -> Result<TypedPromptReply> {
        let TypedPrompt::Home(p) = prompt;
        let reply = HomeInterface
            .try_get_reply_from_ui(&self.cmd, p, meta, prev_error, rec)
            .await?;

        Ok(reply.into())
    }
}

/// Handle prompts using scripted client interactions
pub async fn run_scripted_client_loop(
    snapd_client: &mut SnapdSocketClient,
    path: String,
    grace_period: Option<u64>,
) -> Result<()> {
    let scripted_client = ScriptedClient::try_new_allowing_script_read(path, snapd_client.clone())?;
    info!(
        script=%scripted_client.path,
        n_prompts=%scripted_client.seq.len(),
        "running provided script"
    );
    run_client_loop(snapd_client, scripted_client, None).await?;

    let grace_period = match grace_period {
        Some(n) => n,
        None => return Ok(()),
    };

    info!(seconds=%grace_period, "sequence complete, entering grace period");
    select! {
        _ = tokio::time::sleep(Duration::from_secs(grace_period)) => Ok(()),
        res = grace_period_deny_and_error(snapd_client) => res,
    }
}

/// Poll for outstanding prompts and auto-deny them before returning an error. This function will
/// loop until at least one un-actioned prompt is encountered.
async fn grace_period_deny_and_error(snapd_client: &mut SnapdSocketClient) -> Result<()> {
    loop {
        let ids = snapd_client.pending_prompts().await?;
        let mut prompts = Vec::with_capacity(ids.len());

        for id in ids {
            let prompt = match snapd_client.prompt_details(&id).await {
                Ok(p) => p,
                Err(_) => continue,
            };

            snapd_client
                .reply_to_prompt(&id, prompt.clone().into_deny_once())
                .await?;

            prompts.push(prompt);
        }

        // It is possible that all of the prompts we saw a notice for were already actioned or
        // otherwise no longer available when we attempt to pull the details from snapd. We only
        // error if there was a non-zero number of unaction prompts.
        if !prompts.is_empty() {
            return Err(Error::FailedPromptSequence {
                error: MatchError::UnexpectedPrompts { prompts },
            });
        }
    }
}

struct ScriptedClient {
    seq: PromptSequence,
    path: String,
}

impl ScriptedClient {
    fn try_new_allowing_script_read(
        path: String,
        mut snapd_client: SnapdSocketClient,
    ) -> Result<Self> {
        // We need to spawn a task to wait for the read prompt we generate when reading in our
        // script file. We can't handle this in the main poll loop as we need to construct the
        // client up front.
        let mut filter = PromptFilter::default();
        let mut constraints = HomeConstraintsFilter::default();
        constraints
            .try_with_path(format!(".*/{path}"))
            .expect("valid regex");
        filter
            .with_snap(SNAP_NAME)
            .with_interface("home")
            .with_constraints(constraints);

        tokio::task::spawn(async move {
            loop {
                let pending = snapd_client.pending_prompts().await.unwrap();
                for id in pending {
                    match snapd_client.prompt_details(&id).await {
                        Ok(TypedPrompt::Home(inner)) if filter.matches(&inner).is_success() => {
                            debug!("allowing read of script file");
                            let reply = HomeInterface::prompt_to_reply(inner, Action::Allow)
                                .for_timespan("10s") // Using a timespan so our rule auto-removes
                                .into();
                            snapd_client.reply_to_prompt(&id, reply).await.unwrap();
                            return;
                        }

                        _ => (),
                    };
                }
            }
        });

        let seq = PromptSequence::try_new_from_file(&path)?;

        Ok(Self { seq, path })
    }
}

impl ReplyClient for ScriptedClient {
    async fn get_reply(
        &mut self,
        prompt: TypedPrompt,
        _: Option<SnapMeta>,
        prev_error: Option<String>,
        _: &mut PromptRecording, // No UI input to record
    ) -> Result<TypedPromptReply> {
        if let Some(error) = prev_error {
            return Err(Error::FailedPromptSequence {
                error: MatchError::UnexpectedError { error },
            });
        }

        match prompt {
            TypedPrompt::Home(inner) if inner.constraints.path == self.path => {
                Ok(TypedPromptReply::Home(
                    // Using a timespan so our rule auto-removes
                    HomeInterface::prompt_to_reply(inner, Action::Allow).for_timespan("10s"),
                ))
            }

            _ => match self.seq.try_match_next(prompt) {
                Ok(reply) => Ok(reply),
                Err(error) => Err(Error::FailedPromptSequence { error }),
            },
        }
    }

    fn is_running(&self) -> bool {
        !self.seq.is_empty()
    }
}
