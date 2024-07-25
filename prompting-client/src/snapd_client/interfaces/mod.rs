//! Each snapd interface is handled slightly differently in terms of how we handle processing
//! prompts for it and how we generate the UI for the user.
use crate::{
    prompt_sequence::MatchAttempt,
    recording::PromptRecording,
    snapd_client::{Action, Prompt, PromptReply},
    Result,
};
use serde::{de::DeserializeOwned, Serialize};
use std::fmt;
use tokio::process::Command;
use tracing::debug;

use super::{prompt::UiInput, SnapMeta};

pub mod home;

#[allow(async_fn_in_trait)]
pub trait SnapInterface: fmt::Debug + Clone {
    const NAME: &'static str;

    type Constraints: fmt::Debug + Clone + Serialize + DeserializeOwned;
    type ReplyConstraints: fmt::Debug + Clone + Serialize + DeserializeOwned;

    type ConstraintsFilter: ConstraintsFilter<Constraints = Self::Constraints>;
    type ReplyConstraintsOverrides: ReplyConstraintsOverrides<
        ReplyConstraints = Self::ReplyConstraints,
    >;

    type UiInputData: fmt::Debug + Clone + Serialize + DeserializeOwned;
    type UiReply: fmt::Debug + Clone + Serialize + DeserializeOwned;

    fn prompt_to_reply(prompt: Prompt<Self>, action: Action) -> PromptReply<Self>;

    fn map_ui_input(&self, prompt: Prompt<Self>, meta: Option<SnapMeta>) -> UiInput<Self>;

    fn map_ui_reply(&self, reply: Self::UiReply) -> PromptReply<Self>;

    async fn try_get_reply_from_ui(
        &self,
        cmd: &str,
        prompt: Prompt<Self>,
        meta: Option<SnapMeta>,
        rec: &mut PromptRecording,
    ) -> Result<PromptReply<Self>> {
        let input = self.map_ui_input(prompt.clone(), meta);
        let json_input = serde_json::to_value(&input)?;
        debug!(%json_input, "prompt details for the flutter ui");

        let output = Command::new(cmd)
            .arg(&json_input.to_string())
            .output()
            .await?;

        debug!(
            raw_stdout = %String::from_utf8(output.stdout.clone()).unwrap(),
            "raw output from the flutter ui"
        );
        rec.push_ui_input(json_input);

        // If the user closes out the prompt without submitting a reply we will get nothing on
        // stdout so we treat that as "deny once".
        if output.stdout.is_empty() {
            return Ok(Self::prompt_to_reply(prompt, Action::Deny));
        }

        let ui_reply: Self::UiReply = serde_json::from_slice(&output.stdout)?;
        debug!(?ui_reply, "parsed reply from the flutter ui");

        Ok(self.map_ui_reply(ui_reply))
    }
}

pub trait ConstraintsFilter: Default + fmt::Debug + Clone + Serialize + DeserializeOwned {
    type Constraints: fmt::Debug + Clone + Serialize + DeserializeOwned;

    fn matches(&self, constraints: &Self::Constraints) -> MatchAttempt;
}

pub trait ReplyConstraintsOverrides:
    Default + fmt::Debug + Clone + Serialize + DeserializeOwned
{
    type ReplyConstraints: fmt::Debug + Clone + Serialize + DeserializeOwned;

    fn apply(self, constraints: Self::ReplyConstraints) -> Self::ReplyConstraints;
}
