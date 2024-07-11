//! A simple command line prompting client
use aa_prompt_client::{
    cli_actions::{run_echo_loop, run_flutter_client_loop, run_scripted_client_loop},
    snapd_client::SnapdSocketClient,
    Result,
};
use clap::{Parser, Subcommand};
use std::io::stderr;
use tracing::subscriber::set_global_default;
use tracing_subscriber::FmtSubscriber;

#[derive(Debug, Subcommand)]
enum Command {
    /// Run the testing flutter UI as a persistent client.
    Flutter {
        /// Optionally record events to a specified file on Ctrl-C
        #[clap(short, long, value_name = "FILE")]
        record: Option<String>,
    },

    /// Echo all prompts seen on stdout
    Echo {
        /// Optionally record events to a specified file on Ctrl-C
        #[clap(short, long, value_name = "FILE")]
        record: Option<String>,
    },

    /// Run a scripted client expecting a given sequence of prompts
    Scripted {
        /// The path to the input JSON file
        #[clap(short, long, value_name = "FILE")]
        script: String,

        /// The number of seconds to wait following completion of the script to check for any
        /// unexpected additional prompts.
        #[clap(short, long, value_name = "SECONDS")]
        grace_period: Option<u64>,
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

    let mut c = SnapdSocketClient::default();
    if !c.is_prompting_enabled().await? {
        println!("error: prompting is not enabled");
        return Ok(());
    }

    match command {
        Command::Echo { record } => run_echo_loop(&mut c, record).await,
        Command::Flutter { record } => run_flutter_client_loop(&mut c, record).await,
        Command::Scripted {
            script,
            grace_period,
        } => run_scripted_client_loop(&mut c, script, grace_period).await,
    }
}
