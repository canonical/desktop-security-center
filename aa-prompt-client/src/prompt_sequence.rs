use crate::snapd_client::{
    interfaces::{
        home::HomeInterface, ConstraintsFilter, ReplyConstraintsOverrides, SnapInterface,
    },
    Action, Lifespan, Prompt, PromptReply, TypedPrompt, TypedPromptReply,
};
use serde::{Deserialize, Serialize};
use std::{collections::VecDeque, fs};

#[allow(dead_code)]
#[derive(Debug, Default, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptSequence {
    version: u8,
    prompts: VecDeque<TypedPromptCase>,
    #[serde(skip, default)]
    index: usize,
}

impl PromptSequence {
    pub fn try_new_from_file(path: &str) -> crate::Result<Self> {
        Self::try_new_from_string(&fs::read_to_string(path)?)
    }

    pub fn try_new_from_string(content: &str) -> crate::Result<Self> {
        let seq = serde_json::from_str(content)?;

        Ok(seq)
    }

    pub fn try_match_next(&mut self, p: TypedPrompt) -> Result<TypedPromptReply, MatchError> {
        let case = match self.prompts.pop_front() {
            Some(case) => case,
            None => return Err(MatchError::NoPromptsRemaining),
        };

        match (case, p) {
            (TypedPromptCase::Home(case), TypedPrompt::Home(p)) => {
                let res = case
                    .into_reply_or_error(p, self.index)
                    .map(TypedPromptReply::Home);
                self.index += 1;
                res
            }
        }
    }

    pub fn is_empty(&self) -> bool {
        self.prompts.is_empty()
    }
}

#[derive(Debug, Serialize, Deserialize)]
#[serde(untagged)]
enum TypedPromptCase {
    Home(PromptCase<HomeInterface>),
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptCase<I>
where
    I: SnapInterface,
{
    prompt_filter: PromptFilter<I>,
    reply: PromptReplyTemplate<I>,
}

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptReplyTemplate<I>
where
    I: SnapInterface,
{
    action: Action,
    lifespan: Lifespan,
    constraints: I::ReplyConstraintsOverrides,
}

impl<I> PromptCase<I>
where
    I: SnapInterface,
{
    pub fn into_reply_or_error(
        self,
        p: Prompt<I>,
        index: usize,
    ) -> Result<PromptReply<I>, MatchError> {
        match self.prompt_filter.matches(&p) {
            MatchAttempt::Success => {
                let mut reply = I::prompt_to_reply(p, self.reply.action);
                reply.lifespan = self.reply.lifespan;
                reply.constraints = self.reply.constraints.apply(reply.constraints);

                Ok(reply)
            }

            MatchAttempt::Failure(failures) => Err(MatchError::MatchFailures { index, failures }),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, thiserror::Error)]
pub enum MatchError {
    #[error("prompt {index} did not match the provided sequence: {failures:?}")]
    MatchFailures {
        index: usize,
        failures: Vec<MatchFailure>,
    },

    #[error("the provided prompt sequence has no prompts remaining")]
    NoPromptsRemaining,

    #[error("unexpected error received when replying to prompt: {error}")]
    UnexpectedError { error: String },

    #[error("expected next prompt to have interface={expected} but got {seen}")]
    WrongInterface { expected: String, seen: String },
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum MatchAttempt {
    Success,
    Failure(Vec<MatchFailure>),
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct MatchFailure {
    pub field: &'static str,
    pub expected: String,
    pub seen: String,
}

#[macro_export]
macro_rules! field_matches {
    ($self:ident, $other:ident, $failures:ident, $field:ident) => {
        if let Some(field) = &$self.$field {
            if field != &$other.$field {
                $failures.push(MatchFailure {
                    field: stringify!($field),
                    expected: format!("{:?}", field),
                    seen: format!("{:?}", $other.$field),
                });
            }
        }
    };
}

#[derive(Debug, Default, Clone, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptFilter<I>
where
    I: SnapInterface,
{
    snap: Option<String>,
    interface: Option<String>,
    constraints: Option<I::ConstraintsFilter>,
}

impl<I> PromptFilter<I>
where
    I: SnapInterface,
{
    pub fn with_snap(&mut self, snap: impl Into<String>) -> &mut Self {
        self.snap = Some(snap.into());
        self
    }

    pub fn with_interface(&mut self, interface: impl Into<String>) -> &mut Self {
        self.interface = Some(interface.into());
        self
    }

    pub fn with_constraints(&mut self, constraints: I::ConstraintsFilter) -> &mut Self {
        self.constraints = Some(constraints);
        self
    }

    pub fn matches(&self, p: &Prompt<I>) -> MatchAttempt {
        let mut failures = Vec::new();
        field_matches!(self, p, failures, snap);
        field_matches!(self, p, failures, interface);

        match &self.constraints {
            None if failures.is_empty() => MatchAttempt::Success,
            None => MatchAttempt::Failure(failures),
            Some(c) => match c.matches(&p.constraints) {
                MatchAttempt::Success if failures.is_empty() => MatchAttempt::Success,
                MatchAttempt::Success => MatchAttempt::Failure(failures),
                MatchAttempt::Failure(c_failures) => {
                    failures.extend(c_failures);
                    MatchAttempt::Failure(failures)
                }
            },
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::snapd_client::{
        interfaces::home::{HomeConstraints, HomeConstraintsFilter},
        PromptId,
    };
    use simple_test_case::{dir_cases, test_case};

    #[dir_cases("resources/filter-serialize-tests")]
    #[test]
    fn simple_serialize_works(path: &str, data: &str) {
        let res = serde_json::from_str::<'_, PromptFilter<HomeInterface>>(data);

        assert!(res.is_ok(), "error parsing {path}: {:?}", res);
    }

    #[test]
    fn all_fields_deserializes_correctly() {
        let data = include_str!("../resources/filter-serialize-tests/all_fields_home.json");
        let res = serde_json::from_str::<'_, PromptFilter<HomeInterface>>(data);

        assert!(res.is_ok(), "error {:?}", res);

        match res.unwrap() {
            PromptFilter {
                snap,
                interface,
                constraints:
                    Some(HomeConstraintsFilter {
                        path,
                        permissions,
                        available_permissions,
                    }),
            } => {
                assert_eq!(snap.as_deref(), Some("snapName"));
                assert_eq!(interface.as_deref(), Some("home"));
                assert_eq!(
                    path.map(|re| re.to_string()).as_deref(),
                    Some("/home/foo/bar")
                );
                assert_eq!(permissions, Some(vec!["read".to_string()]));
                assert_eq!(
                    available_permissions,
                    Some(vec![
                        "read".to_string(),
                        "write".to_string(),
                        "execute".to_string()
                    ])
                );
            }
            f => panic!("invalid filter: {f:?}"),
        }
    }

    fn mf(field: &'static str, expected: &str, seen: &str) -> MatchFailure {
        MatchFailure {
            field,
            expected: expected.to_string(),
            seen: seen.to_string(),
        }
    }

    #[test_case(r#"{}"#, MatchAttempt::Success; "empty filter")]
    #[test_case(r#"{ "interface": "home" }"#, MatchAttempt::Success; "interface matching")]
    #[test_case(
        r#"{ "interface": "home", "constraints": { "path": "/home/foo/bar" } }"#,
        MatchAttempt::Success;
        "interface and path matching"
    )]
    #[test_case(
        r#"{ "interface": "camera" }"#,
        MatchAttempt::Failure(vec![mf("interface", "\"camera\"", "\"home\"")]);
        "interface non-matching"
    )]
    #[test_case(
        r#"{ "interface": "home", "constraints": { "path": "/home/wrong/path" } }"#,
        MatchAttempt::Failure(vec![mf("path", "\"/home/wrong/path\"", "\"/home/foo/bar\"")]);
        "interface matching path non-matching"
    )]
    #[test_case(
        r#"{ "interface": "camera", "constraints": { "path": "/home/wrong/path" } }"#,
        MatchAttempt::Failure(vec![
            mf("interface", "\"camera\"", "\"home\""),
            mf("path", "\"/home/wrong/path\"", "\"/home/foo/bar\""),
        ]);
        "interface and path non-matching"
    )]
    #[test]
    fn filter_matches(filter_str: &str, expected: MatchAttempt) {
        let filter: PromptFilter<HomeInterface> = serde_json::from_str(filter_str).unwrap();
        let p = Prompt {
            id: PromptId("id".to_string()),
            interface: "home".to_string(),
            timestamp: "".to_string(),
            snap: "test".to_string(),
            constraints: HomeConstraints {
                path: "/home/foo/bar".to_string(),
                permissions: vec!["read".to_string()],
                available_permissions: vec!["read".to_string(), "write".to_string()],
            },
        };

        assert_eq!(filter.matches(&p), expected);
    }

    #[dir_cases("resources/prompt-sequence-tests")]
    #[test]
    fn deserialize_prompt_sequence_works(path: &str, data: &str) {
        let res = PromptSequence::try_new_from_string(data);

        assert!(res.is_ok(), "error parsing {path}: {:?}", res);
    }
}
