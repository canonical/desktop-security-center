use aa_prompt_client::{snapd_client::SnapdClient, Result};

#[tokio::main]
async fn main() -> Result<()> {
    let c = SnapdClient::default();

    if c.is_prompting_enabled().await? {
        println!("prompting is enabled");
    } else {
        println!("prompting is not enabled");
    }

    Ok(())
}
