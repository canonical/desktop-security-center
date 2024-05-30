use aa_prompt_client::{
    snapd_client::{PromptId, SnapdSocketClient},
    Result,
};
use std::io::{stdin, stdout, Write};
use tracing::subscriber::set_global_default;
use tracing::{info, warn};
use tracing_subscriber::FmtSubscriber;

#[tokio::main]
async fn main() -> Result<()> {
    let subscriber = FmtSubscriber::builder()
        .with_env_filter("debug")
        .with_writer(stdout)
        .finish();

    set_global_default(subscriber).expect("unable to set a global tracing subscriber");

    let c = SnapdSocketClient::default();

    if !c.is_prompting_enabled().await? {
        warn!("prompting is not enabled");
        return Ok(());
    }

    info!("prompting is enabled");
    run_simple_client(c).await
}

async fn run_simple_client(mut c: SnapdSocketClient) -> Result<()> {
    let mut prev_id = PromptId::default();

    loop {
        info!("polling for notices...");
        let pending = c.pending_prompts().await?;

        info!(?pending, "processing pending prompts");
        for id in pending {
            // TODO: handle this in pending_prompts
            if id == prev_id {
                continue;
            }

            let p = c.prompt_details(&id).await?;
            println!("{}", p.summary());

            let reply = if should_allow()? {
                p.into_allow_once()
            } else {
                p.into_deny_once()
            };

            c.reply_to_prompt(&id, reply).await?;
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
