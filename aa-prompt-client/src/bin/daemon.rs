//! The daemon prompting client for apparmor prompting
use aa_prompt_client::{daemon::run_daemon, snapd_client::SnapdSocketClient, Error, Result};
use std::io::stdout;
use tracing::subscriber::set_global_default;
use tracing::warn;
use tracing_subscriber::{layer::SubscriberExt, FmtSubscriber};

#[tokio::main]
async fn main() -> Result<()> {
    let builder = FmtSubscriber::builder()
        .with_env_filter("info")
        .with_writer(stdout)
        .with_filter_reloading();

    // TODO: (sminez) support modifying the logging level at runtime via dbus
    // let reload_handle = builder.reload_handle();
    let journald_layer = tracing_journald::layer().expect("unable to open journald socket");
    let subscriber = builder.finish().with(journald_layer);

    set_global_default(subscriber).expect("unable to set a global tracing subscriber");

    let c = SnapdSocketClient::default();
    if !c.is_prompting_enabled().await? {
        warn!("the prompting feature is not enabled: exiting");
        return Err(Error::NotEnabled);
    }

    run_daemon(c).await
}
