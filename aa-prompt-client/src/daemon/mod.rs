use crate::{
    snapd_client::{PromptId, SnapMeta, SnapdSocketClient, TypedPrompt},
    Result,
};

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

/// TODO: add shutdown channels to the structs

/// Start our backgroud polling and processing loops before dropping into running the tonic GRPC
/// server for handling incoming requestes from the Flutter UI client.
pub async fn run_daemon(c: SnapdSocketClient) -> Result<()> {
    // - create channels:
    //   - one for the poll loop to send EnrichedPrompts to the worker
    //   - one for the worker to send TypedUiInputs to the server
    //   - one for the server to send actioned Prompt IDs to the worker
    // - start the poll loop
    // - start the worker
    // - run the server here
    todo!("implement kicking of the required tasks");
}
