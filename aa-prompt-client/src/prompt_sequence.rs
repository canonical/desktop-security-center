use crate::snapd_client::{Constraints, Prompt, PromptReply};
use serde::{Deserialize, Serialize};

#[allow(dead_code)]
#[derive(Debug, Default, Clone, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptSequence {
    version: u8,
    prompts: Vec<PromptCase>,
}

#[derive(Debug, Default, Clone, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptCase {
    prompt_filter: PromptFilter,
    reply: PromptReply,
}

impl PromptCase {
    pub fn into_reply_or_error(self, p: Prompt) -> Result<PromptReply, Vec<MatchFailure>> {
        match self.prompt_filter.matches(&p) {
            MatchAttempt::Success => Ok(self.reply),
            MatchAttempt::Failure(failures) => Err(failures),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum MatchAttempt {
    Success,
    Failure(Vec<MatchFailure>),
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
pub struct MatchFailure {
    field: &'static str,
    expected: String,
    seen: String,
}

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
pub struct PromptFilter {
    snap: Option<String>,
    interface: Option<String>, // should this be an enum?
    constraints: Option<ConstraintsFilter>,
}

impl PromptFilter {
    pub fn matches(&self, p: &Prompt) -> MatchAttempt {
        let mut failures = Vec::new();
        field_matches!(self, p, failures, snap);
        field_matches!(self, p, failures, interface);

        match &self.constraints {
            Some(c) => c.matches(&p.constraints, failures),
            None => {
                if failures.is_empty() {
                    MatchAttempt::Success
                } else {
                    MatchAttempt::Failure(failures)
                }
            }
        }
    }
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(untagged)]
enum ConstraintsFilter {
    Home(HomeConstraints),
}

#[derive(Debug, Serialize, Deserialize, Clone)]
#[serde(rename_all = "kebab-case")]
struct HomeConstraints {
    path: Option<String>,
    permissions: Option<Vec<String>>,
    available_permissions: Option<Vec<String>>,
}

impl ConstraintsFilter {
    fn matches(&self, constraints: &Constraints, mut failures: Vec<MatchFailure>) -> MatchAttempt {
        match self {
            Self::Home(hc) => {
                field_matches!(hc, constraints, failures, path);
                field_matches!(hc, constraints, failures, permissions);
                field_matches!(hc, constraints, failures, available_permissions);
            }
        }

        if failures.is_empty() {
            MatchAttempt::Success
        } else {
            MatchAttempt::Failure(failures)
        }
    }
}

impl Default for ConstraintsFilter {
    fn default() -> Self {
        Self::Home(HomeConstraints {
            path: None,
            permissions: None,
            available_permissions: None,
        })
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::snapd_client::PromptId;
    use simple_test_case::{dir_cases, test_case};

    #[dir_cases("resources/filter-serialize-tests")]
    #[test]
    fn simple_serialize_works(path: &str, data: &str) {
        let res = serde_json::from_str::<'_, PromptFilter>(data);

        assert!(res.is_ok(), "error parsing {path}: {:?}", res);
    }

    #[test]
    fn all_fields_deserializes_correctly() {
        let data = include_str!("../resources/filter-serialize-tests/all_fields_home.json");
        let res = serde_json::from_str::<'_, PromptFilter>(data);

        assert!(res.is_ok(), "error {:?}", res);

        match res.unwrap() {
            PromptFilter {
                snap,
                interface,
                constraints:
                    Some(ConstraintsFilter::Home(HomeConstraints {
                        path,
                        permissions,
                        available_permissions,
                    })),
            } => {
                assert_eq!(snap.as_deref(), Some("snapName"));
                assert_eq!(interface.as_deref(), Some("home"));
                assert_eq!(path.as_deref(), Some("/home/foo/bar"));
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
        let filter: PromptFilter = serde_json::from_str(filter_str).unwrap();
        let p = Prompt {
            id: PromptId("id".to_string()),
            interface: "home".to_string(),
            timestamp: "".to_string(),
            snap: "test".to_string(),
            constraints: Constraints {
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
        let res = serde_json::from_str::<'_, PromptSequence>(data);

        assert!(res.is_ok(), "error parsing {path}: {:?}", res);
    }
}
