//! A simple command line prompting client
use aa_prompt_client::{
    snapd_client::{Action, Lifespan, PromptId, SnapdSocketClient},
    Result,
};
use clap::{Parser, Subcommand};
use std::io::{stdin, stdout, Write};
use tracing::subscriber::set_global_default;
use tracing::{debug, info, warn};
use tracing_subscriber::FmtSubscriber;

#[derive(Debug, Subcommand)]
enum Command {
    /// Run a simple allow/deny once listener
    Loop,
    /// Listen for and handle a single targetted prompt
    Target {
        /// The name of the snap triggering the expected prompt
        #[clap(long)]
        snap: String,
        /// Optionally restrict to prompts requesting a specific path
        #[clap(long)]
        requested: Option<String>,

        /// The action to reply with (allow/deny)
        #[clap(long)]
        action: Action,
        /// The lifespan the reply should apply for (single/session/forever/timespan)
        #[clap(long)]
        lifespan: Lifespan,
        /// When lifespan is 'timespan', the duration that should be applied
        #[arg(long, required_if_eq("lifespan", "timespan"))]
        duration: Option<String>,
    },
}

/// A simple command line prompting client
#[derive(Debug, Parser)]
#[clap(about, long_about = None)]
struct Args {
    #[clap(subcommand)]
    command: Command,
    #[clap(short, long, action = clap::ArgAction::Count)]
    verbose: u8,
}

#[tokio::main]
async fn main() -> Result<()> {
    let Args { command, verbose } = Args::parse();

    if verbose > 0 {
        let level = if verbose == 1 { "info" } else { "debug" };
        let subscriber = FmtSubscriber::builder()
            .with_env_filter(level)
            .with_writer(stdout)
            .finish();
        set_global_default(subscriber).expect("unable to set a global tracing subscriber");
    }

    let c = SnapdSocketClient::default();
    if !c.is_prompting_enabled().await? {
        println!("error: prompting is not enabled");
        return Ok(());
    }

    match command {
        Command::Target {
            snap,
            requested,
            action,
            lifespan,
            duration,
        } => handle_target(c, snap, requested, action, lifespan, duration).await,

        Command::Loop => run_simple_client_loop(c).await,
    }
}

async fn handle_target(
    mut c: SnapdSocketClient,
    snap: String,
    requested: Option<String>,
    action: Action,
    lifespan: Lifespan,
    duration: Option<String>,
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

            info!(?id, ?reply, "replying to prompt");
            c.reply_to_prompt(id, reply).await?;

            return Ok(());
        }
    }
}

/// This is a bare bones client implementation that only supports responding to prompts
/// with "allow single" or "deny single".
async fn run_simple_client_loop(mut c: SnapdSocketClient) -> Result<()> {
    let mut prev_id = PromptId::default();

    loop {
        println!("polling for notices...");
        let pending = c.pending_prompts().await?;

        info!(?pending, "processing notices");
        for id in pending {
            if id == prev_id {
                continue;
            }

            debug!(?id, "pulling prompt details from snapd");
            let p = match c.prompt_details(&id).await {
                Ok(p) => p,
                Err(e) => {
                    warn!(%e, "unable to pull prompt");
                    continue;
                }
            };
            println!("{}", p.summary());

            let reply = if should_allow()? {
                p.into_reply(Action::Allow)
            } else {
                p.into_reply(Action::Deny)
            };

            debug!(?id, ?reply, "replying to prompt");
            if let Err(e) = c.reply_to_prompt(&id, reply).await {
                warn!(%e, "error in replying to prompt");
            }

            prev_id = id;
        }
    }
}

fn should_allow() -> Result<bool> {
    print!("> allow this prompt request? (y/n): ");
    stdout().flush()?;

    let mut user_input = String::new();
    stdin().read_line(&mut user_input)?;
    let user_input = user_input.trim();

    Ok(matches!(user_input, "y" | "Y"))
}
