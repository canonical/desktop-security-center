use crate::{
    daemon::{poll::poll_for_prompts, server::new_server_and_listener, worker::Worker},
    snapd_client::{PromptId, SnapMeta, SnapdSocketClient, TypedPrompt},
    Result,
};
use std::{env, fs};
use tokio::sync::mpsc::unbounded_channel;
use tokio_stream::wrappers::UnixListenerStream;
use tonic::transport::Server;
use tracing::{error, info};

mod poll;
mod server;
mod worker;

// Poll loop -> worker
#[derive(Debug, Clone)]
pub struct EnrichedPrompt {
    prompt: TypedPrompt,
    meta: Option<SnapMeta>,
}

// Server -> worker
#[derive(Debug, Clone)]
pub struct ActionedPrompt {
    id: PromptId,
    others: Vec<PromptId>,
}

/// Start our backgroud polling and processing loops before dropping into running the tonic GRPC
/// server for handling incoming requestes from the Flutter UI client.
pub async fn run_daemon(c: SnapdSocketClient) -> Result<()> {
    let (tx_prompts, rx_prompts) = unbounded_channel();
    let (tx_actioned, rx_actioned) = unbounded_channel();

    let mut worker = Worker::new(rx_prompts, rx_actioned);
    let active_prompt = worker.read_only_active_prompt();

    let path =
        env::var("PROMPTING_CLIENT_SOCKET").expect("PROMPTING_CLIENT_SOCKET env var to be set");
    if let Err(e) = fs::remove_file(&path) {
        error!("Failed to remove old socket file: {}. Error: {}", path, e);
    }
    let (server, listener) = new_server_and_listener(c.clone(), active_prompt, tx_actioned, path);

    info!("spawning poll loop");
    tokio::spawn(poll_for_prompts(c, tx_prompts));

    info!("spawning worker thread");
    tokio::spawn(async move { worker.run().await });

    info!("serving incoming grpc connections");
    let res = Server::builder()
        .add_service(server)
        .serve_with_incoming(UnixListenerStream::new(listener))
        .await;

    if let Err(error) = res {
        error!(%error, "grpc server fatal error");
        panic!("{error}");
    }

    Ok(())
}
