//! Types for working with apparmor prompts
use crate::{
    snapd_client::{
        interfaces::{home::HomeInterface, SnapInterface},
        SnapMeta,
    },
    Error, Result,
};
use serde::{Deserialize, Serialize};
use strum::{Display, EnumString};

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(untagged)]
pub enum TypedPrompt {
    Home(Prompt<HomeInterface>),
}

impl TypedPrompt {
    pub fn into_deny_once(self) -> TypedPromptReply {
        let Self::Home(p) = self;
        HomeInterface::prompt_to_reply(p, Action::Deny).into()
    }

    pub fn id(&self) -> &PromptId {
        let Self::Home(p) = self;
        &p.id
    }

    pub fn snap(&self) -> &str {
        let Self::Home(p) = self;
        &p.snap
    }
}

impl TryFrom<RawPrompt> for TypedPrompt {
    type Error = Error;

    fn try_from(raw: RawPrompt) -> Result<Self> {
        match raw.interface.as_str() {
            "home" => Ok(TypedPrompt::Home(raw.try_into()?)),

            interface => Err(Error::UnsupportedInterface {
                interface: interface.to_string(),
            }),
        }
    }
}

impl From<Prompt<HomeInterface>> for TypedPrompt {
    fn from(value: Prompt<HomeInterface>) -> Self {
        Self::Home(value)
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct RawPrompt {
    pub(crate) id: PromptId,
    pub(crate) timestamp: String,
    pub(crate) snap: String,
    pub(crate) interface: String,
    pub(crate) constraints: serde_json::Value,
}

impl<I> TryFrom<RawPrompt> for Prompt<I>
where
    I: SnapInterface,
{
    type Error = Error;

    fn try_from(
        RawPrompt {
            id,
            timestamp,
            snap,
            interface,
            constraints,
        }: RawPrompt,
    ) -> Result<Self> {
        Ok(Prompt {
            id,
            timestamp,
            snap,
            interface,
            constraints: serde_json::from_value(constraints)?,
        })
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

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct Prompt<I>
where
    I: SnapInterface,
{
    pub(crate) id: PromptId,
    pub(crate) timestamp: String,
    pub(crate) snap: String,
    pub(crate) interface: String,
    pub(crate) constraints: I::Constraints,
}

impl<I> Prompt<I>
where
    I: SnapInterface,
{
    pub fn id(&self) -> &str {
        &self.id.0
    }

    pub fn snap(&self) -> &str {
        &self.snap
    }

    pub fn timestamp(&self) -> &str {
        &self.timestamp
    }

    pub fn interface(&self) -> &str {
        &self.interface
    }
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptReply<I>
where
    I: SnapInterface,
{
    pub(crate) action: Action,
    pub(crate) lifespan: Lifespan,
    #[serde(skip_serializing_if = "Option::is_none")]
    pub(crate) duration: Option<String>,
    pub(crate) constraints: I::ReplyConstraints,
}

impl<I> PromptReply<I>
where
    I: SnapInterface,
{
    /// Set this reply to apply for the remainder of the user's current session.
    pub fn for_session(mut self) -> Self {
        self.lifespan = Lifespan::Session;
        self
    }

    /// Set this reply to create a new permanent rule.
    pub fn for_forever(mut self) -> Self {
        self.lifespan = Lifespan::Forever;
        self
    }

    /// Set this reply to apply for the specified timespan.
    ///
    /// Timespans are provided in the format parsable by go's [ParseDuration](https://pkg.go.dev/time#ParseDuration).
    pub fn for_timespan(mut self, duration: impl Into<String>) -> Self {
        self.lifespan = Lifespan::Timespan;
        self.duration = Some(duration.into());
        self
    }
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct UiInput<I>
where
    I: SnapInterface,
{
    pub(crate) id: PromptId,
    pub(crate) meta: SnapMeta,
    pub(crate) data: I::UiInputData,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(untagged)]
pub enum TypedUiInput {
    Home(UiInput<HomeInterface>),
}

impl TypedUiInput {
    pub fn id(&self) -> &PromptId {
        let Self::Home(input) = self;
        &input.id
    }

    pub fn from_prompt(prompt: TypedPrompt, meta: Option<SnapMeta>) -> Self {
        let TypedPrompt::Home(p) = prompt;
        Self::Home(HomeInterface.map_ui_input(p, meta))
    }
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
pub struct PromptId(pub String);

#[derive(
    Debug, Default, Clone, Copy, PartialEq, Eq, Deserialize, Serialize, Display, EnumString,
)]
#[serde(rename_all = "lowercase")]
#[strum(serialize_all = "lowercase")]
pub enum Action {
    Allow,
    #[default]
    Deny,
}

#[derive(
    Debug, Default, Clone, Copy, PartialEq, Eq, Deserialize, Serialize, Display, EnumString,
)]
#[serde(rename_all = "lowercase")]
#[strum(serialize_all = "lowercase")]
pub enum Lifespan {
    #[default]
    Single,
    Session,
    Forever,
    Timespan,
}

#[cfg(test)]
mod tests {
    use super::*;

    const RAW_PROMPT: &str = r#"{
  "id": "0000000000000002",
  "timestamp": "2024-08-14T07:28:22.694800024Z",
  "snap": "firefox",
  "interface": "home",
  "constraints": {}
}"#;

    #[test]
    fn raw_prompt_deserializes() {
        let raw: RawPrompt = serde_json::from_str(RAW_PROMPT).unwrap();
        let expected = RawPrompt {
            id: PromptId("0000000000000002".to_string()),
            timestamp: "2024-08-14T07:28:22.694800024Z".to_string(),
            snap: "firefox".to_string(),
            interface: "home".to_string(),
            constraints: serde_json::json!({}),
        };

        assert_eq!(raw, expected);
    }
}
