//! The daemon prompting client for apparmor prompting
use aa_prompt_client::{daemon::run_daemon, snapd_client::SnapdSocketClient, Result};
use clap::Parser;
use std::io::stderr;
use tracing::subscriber::set_global_default;
use tracing_subscriber::FmtSubscriber;

/// The apparmor prompting client daemon
#[derive(Debug, Parser)]
#[clap(about, long_about = None)]
struct Args {
    #[clap(short, long, action = clap::ArgAction::Count)]
    verbose: u8,
}

#[tokio::main]
async fn main() -> Result<()> {
    let Args { verbose } = Args::parse();

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

    run_daemon(c).await
}
