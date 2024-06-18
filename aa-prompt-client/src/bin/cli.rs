//! A simple command line prompting client
use aa_prompt_client::{
    cli_actions::{
        listen_for_target, run_echo_loop, run_flutter_client_loop, run_simple_client_loop,
    },
    snapd_client::{Action, Lifespan, SnapdSocketClient},
    Result,
};
use clap::{Parser, Subcommand};
use std::io::stderr;
use tracing::subscriber::set_global_default;
use tracing_subscriber::FmtSubscriber;

#[derive(Debug, Subcommand)]
enum Command {
    /// Run a simple allow/deny once listener
    Loop,

    /// Run the testing flutter UI as a persistent client.
    ///
    /// Assumes that the `apparmor_prompt` binary is in the working directory.
    Flutter,

    /// Echo all prompts seen on stdout
    Echo {
        /// Optionally record events to a specified file on Ctrl-C
        #[clap(short, long, value_name = "FILE")]
        record: Option<String>,
    },

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
        /// A custom path to reply with
        #[clap(long)]
        path: Option<String>,
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
            .with_writer(stderr)
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
            path,
        } => listen_for_target(c, snap, requested, action, lifespan, duration, path).await,

        Command::Echo { record } => run_echo_loop(c, record).await,

        Command::Flutter => run_flutter_client_loop(c).await,

        Command::Loop => run_simple_client_loop(c).await,
    }
}
