use crate::{
    snapd_client::{Action, Lifespan, Prompt, PromptReply, SnapdSocketClient, UiPromptReply},
    Result,
};
use std::{
    fs,
    future::Future,
    io::{stdin, stdout, Write},
};
use tokio::{process::Command, select, signal::ctrl_c};
use tracing::{debug, info, warn};

pub async fn listen_for_target(
    mut c: SnapdSocketClient,
    snap: String,
    requested: Option<String>,
    action: Action,
    lifespan: Lifespan,
    duration: Option<String>,
    path: Option<String>,
) -> Result<()> {
    info!("beginning polling for prompts");
    loop {
        debug!("waiting for notices");
        let pending = c.pending_prompts().await?;
        debug!(?pending, "processing notices");
        for id in pending.iter() {
            debug!(?id, "pulling prompt details from snapd");
            let p = c.prompt_details(id).await?;
            if p.snap() != snap {
                debug!(target=%snap, prompt_snap=%p.snap(),"ignoring prompt: wrong snap");
                continue;
            }
            if let Some(path) = &requested {
                if p.path() != path {
                    debug!(target=%path, prompt_path=%p.path(),"ignoring prompt: wrong path");
                    continue;
                }
            }

            info!(?id, "got target prompt");
            let mut reply = p.into_reply(action);
            reply = match lifespan {
                Lifespan::Single => reply,
                Lifespan::Session => reply.for_session(),
                Lifespan::Forever => reply.for_forever(),
                Lifespan::Timespan => reply.for_timespan(duration.unwrap()),
            };

            if let Some(path) = path {
                reply = reply.with_custom_path_pattern(path);
            }

            info!(?id, ?reply, "replying to prompt");
            c.reply_to_prompt(id, reply).await?;

            return Ok(());
        }
    }
}

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

/// This is a bare bones client implementation that only supports responding to prompts
/// with "allow single" or "deny single".
pub async fn run_client_loop<F, Fut>(mut c: SnapdSocketClient, get_reply: F) -> Result<()>
where
    F: Fn(Prompt) -> Fut,
    Fut: Future<Output = Result<PromptReply>>,
{
    loop {
        println!("polling for notices...");
        let pending = c.pending_prompts().await?;

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

            let reply = (get_reply)(p).await?;

            debug!(?id, ?reply, "replying to prompt");
            if let Err(e) = c.reply_to_prompt(&id, reply).await {
                warn!(%e, "error in replying to prompt");
            }
        }
    }
}

/// This is a bare bones client implementation that only supports responding to prompts
/// with "allow single" or "deny single".
pub async fn run_flutter_client_loop(c: SnapdSocketClient) -> Result<()> {
    run_client_loop(c, get_reply_from_flutter_ui).await
}

async fn get_reply_from_flutter_ui(p: Prompt) -> Result<PromptReply> {
    let input = serde_json::to_string(&p.as_ui_prompt_input())?;
    let output = Command::new("./bundle/apparmor_prompt")
        .arg(input)
        .output()
        .await?;

    let ui_reply: UiPromptReply = serde_json::from_slice(&output.stdout)?;

    Ok(p.into_reply_from_ui(ui_reply))
}

/// This is a bare bones client implementation that only supports responding to prompts
/// with "allow single" or "deny single".
pub async fn run_simple_client_loop(c: SnapdSocketClient) -> Result<()> {
    run_client_loop(c, get_reply_from_user_input).await
}

async fn get_reply_from_user_input(p: Prompt) -> Result<PromptReply> {
    println!("{}", summary(&p));
    print!("> allow this prompt request? (y/n): ");
    stdout().flush()?;

    let mut user_input = String::new();
    stdin().read_line(&mut user_input)?;
    let user_input = user_input.trim();
    let should_allow = matches!(user_input, "y" | "Y");

    let reply = if should_allow {
        p.into_reply(Action::Allow)
    } else {
        p.into_reply(Action::Deny)
    };

    Ok(reply)
}

fn summary(p: &Prompt) -> String {
    format!(
        "\
id:          {}
snap:        {}
timestamp:   {}
path:        {}
permissions: {:?}
",
        p.id(),
        p.snap(),
        p.timestamp(),
        p.path(),
        p.requested_permissions()
    )
}
