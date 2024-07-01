//! Each snapd interface is handled slightly differently in terms of how we handle processing
//! prompts for it and how we generate the UI for the user.
use crate::{
    prompt_sequence::MatchAttempt,
    snapd_client::{Action, Lifespan, Prompt, PromptReply},
};
use serde::{de::DeserializeOwned, Deserialize, Serialize};
use std::fmt;

pub mod home;

use home::HomeInterface;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(untagged)]
pub enum TypedPrompt {
    Home(Prompt<HomeInterface>),
}

impl From<Prompt<HomeInterface>> for TypedPrompt {
    fn from(value: Prompt<HomeInterface>) -> Self {
        Self::Home(value)
    }
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(untagged)]
pub enum TypedPromptReply {
    Home(PromptReply<HomeInterface>),
}

impl From<PromptReply<HomeInterface>> for TypedPromptReply {
    fn from(value: PromptReply<HomeInterface>) -> Self {
        Self::Home(value)
    }
}

pub trait SnapdInterface: fmt::Debug + Clone {
    const NAME: &'static str;

    type Constraints: fmt::Debug + Clone + Serialize + DeserializeOwned;
    type ReplyConstraints: fmt::Debug + Clone + Serialize + DeserializeOwned;
    type ConstraintsFilter: ConstraintsFilter<Constraints = Self::Constraints>;

    type UiInput: Clone + Serialize + DeserializeOwned;
    type UiReply: Clone + Serialize + DeserializeOwned;

    fn default_constraints_from_prompt(
        &self,
        constraints: Self::Constraints,
    ) -> Self::ReplyConstraints;

    fn prompt_to_reply(&self, prompt: Prompt<Self>, action: Action) -> PromptReply<Self> {
        PromptReply {
            action,
            lifespan: Lifespan::Single,
            duration: None,
            constraints: self.default_constraints_from_prompt(prompt.constraints),
        }
    }

    fn prompt_to_ui_input(
        &self,
        prompt: Prompt<Self>,
        previous_error_message: Option<String>,
    ) -> Self::UiInput;

    fn map_ui_reply(&self, reply: Self::UiReply) -> PromptReply<Self>;
}

pub trait ConstraintsFilter: Default + fmt::Debug + Clone + Serialize + DeserializeOwned {
    type Constraints: fmt::Debug + Clone + Serialize + DeserializeOwned;

    fn matches(&self, constraints: &Self::Constraints) -> MatchAttempt
    where
        Self: Sized;
}
