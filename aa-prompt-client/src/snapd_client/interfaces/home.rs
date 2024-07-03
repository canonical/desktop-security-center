use crate::{
    field_matches,
    prompt_sequence::{MatchAttempt, MatchFailure},
    snapd_client::{
        interfaces::{ConstraintsFilter, Prompt, PromptReply, SnapInterface},
        Action, Error, Lifespan, Result,
    },
};
use serde::{Deserialize, Serialize};
use std::{env, path::PathBuf};

impl Prompt<HomeInterface> {
    pub fn path(&self) -> &str {
        &self.constraints.path
    }

    pub fn requested_permissions(&self) -> &[String] {
        &self.constraints.permissions
    }
}

impl PromptReply<HomeInterface> {
    /// Specify a custom path pattern to replace the one originally requested in the parent [Prompt].
    ///
    /// If the path pattern provided is invalid or does not apply to the path originally requested
    /// in the parent prompt then submitting this reply will result in an error being returned by
    /// snapd.
    pub fn with_custom_path_pattern(mut self, path_pattern: impl Into<String>) -> Self {
        self.constraints.path_pattern = path_pattern.into();
        self
    }

    /// Attempt to set a custom permission set for this reply.
    ///
    /// This method will error if the requested permissions are not available on the parent
    /// [Prompt].
    pub fn try_with_custom_permissions(mut self, permissions: Vec<String>) -> Result<Self> {
        if permissions
            .iter()
            .all(|p| self.constraints.available_permissions.contains(p))
        {
            self.constraints.permissions = permissions;
            Ok(self)
        } else {
            Err(Error::InvalidCustomPermissions {
                requested: permissions,
                available: self.constraints.available_permissions,
            })
        }
    }
}

/// The interface for allowing access to the user's home directory.
#[derive(Debug, Default, Clone, Deserialize, Serialize)]
pub struct HomeInterface;

impl HomeInterface {
    fn ui_options(&self, prompt: &Prompt<Self>) -> (Vec<InitialOption>, Vec<PathAndDescription>) {
        let path = &prompt.constraints.path;
        let home_dir = env::var("SNAP_REAL_HOME")
            .map(|p| format!("{p}/**"))
            .expect("to be running inside of a snap");
        let parent_dir = PathBuf::from(path)
            .parent()
            .map(|pb| format!("{}/**", pb.to_string_lossy()))
            .expect("requested path to have a parent");

        let initial_options = vec![
            // TODO: (sminez) re-enable once we have settled on what the initial options are
            // InitialOption::new("Allow Always", HomeUiReply::as_requested(prompt)),
            // InitialOption::new_with_path(prompt, "Allow Directory", &parent_dir),
            // InitialOption::new_with_path(prompt, "Allow Home", &home_dir),
            // InitialOption::new(
            //     "Deny Once",
            //     HomeUiReply {
            //         action: Action::Deny,
            //         lifespan: Lifespan::Single,
            //         ..HomeUiReply::as_requested(prompt)
            //     },
            // ),
        ];

        let mut more_options = vec![PathAndDescription::new("Requested Path", path)];

        if path.ends_with('/') {
            more_options.push(PathAndDescription::new(
                "Directory Contents",
                format!("{}**", &prompt.constraints.path),
            ));
        }

        if parent_dir != home_dir {
            more_options.push(PathAndDescription::new("Parent Directory", parent_dir));
        }

        more_options.push(PathAndDescription::new("Home Directory", home_dir));

        (initial_options, more_options)
    }
}

impl SnapInterface for HomeInterface {
    const NAME: &'static str = "home";

    type Constraints = HomeConstraints;
    type ReplyConstraints = HomeReplyConstraints;
    type ConstraintsFilter = HomeConstraintsFilter;

    type UiInput = HomeUiInput;
    type UiReply = HomeUiReply;

    fn prompt_to_reply(prompt: Prompt<Self>, action: Action) -> PromptReply<Self> {
        PromptReply {
            action,
            lifespan: Lifespan::Single,
            duration: None,
            constraints: HomeReplyConstraints {
                path_pattern: prompt.constraints.path,
                permissions: prompt.constraints.permissions,
                available_permissions: prompt.constraints.available_permissions,
            },
        }
    }

    fn map_ui_input(
        &self,
        prompt: Prompt<Self>,
        previous_error_message: Option<String>,
    ) -> Self::UiInput {
        let (initial_options, more_options) = self.ui_options(&prompt);

        HomeUiInput {
            snap_name: prompt.snap.clone(),
            requested_path: prompt.constraints.path.to_string(),
            requested_permissions: prompt.constraints.permissions.clone(),
            available_permissions: prompt.constraints.available_permissions.clone(),
            previous_error_message,
            initial_options,
            more_options,
        }
    }

    fn map_ui_reply(&self, reply: Self::UiReply) -> PromptReply<Self> {
        PromptReply {
            action: reply.action,
            lifespan: reply.lifespan,
            duration: None,
            constraints: HomeReplyConstraints {
                path_pattern: reply.path_pattern,
                permissions: reply.permissions,
                available_permissions: Vec::new(),
            },
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct HomeConstraints {
    pub(crate) path: String,
    pub(crate) permissions: Vec<String>,
    pub(crate) available_permissions: Vec<String>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct HomeUiInput {
    snap_name: String,
    requested_path: String,
    requested_permissions: Vec<String>,
    available_permissions: Vec<String>,
    previous_error_message: Option<String>,
    initial_options: Vec<InitialOption>,
    more_options: Vec<PathAndDescription>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct PathAndDescription {
    description: String,
    path_pattern: String,
}

impl PathAndDescription {
    fn new(description: impl Into<String>, path_pattern: impl Into<String>) -> Self {
        Self {
            description: description.into(),
            path_pattern: path_pattern.into(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct InitialOption {
    button_text: String,
    reply: HomeUiReply,
}

// TODO: (sminez) re-enable once we have settled on what the initial options are
// impl InitialOption {
//     fn new(button_text: &str, reply: HomeUiReply) -> Self {
//         Self {
//             button_text: button_text.to_string(),
//             reply,
//         }
//     }

//     fn new_with_path(
//         p: &Prompt<HomeInterface>,
//         button_text: &str,
//         path_pattern: impl Into<String>,
//     ) -> Self {
//         InitialOption::new(
//             button_text,
//             HomeUiReply {
//                 path_pattern: path_pattern.into(),
//                 ..HomeUiReply::as_requested(p)
//             },
//         )
//     }
// }

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct HomeUiReply {
    action: Action,
    lifespan: Lifespan,
    path_pattern: String,
    permissions: Vec<String>,
}

// TODO: (sminez) re-enable once we have settled on what the initial options are
// impl HomeUiReply {
//     fn as_requested(p: &Prompt<HomeInterface>) -> Self {
//         Self {
//             action: Action::Allow,
//             lifespan: Lifespan::Forever,
//             path_pattern: p.constraints.path.to_string(),
//             permissions: p.constraints.permissions.to_vec(),
//         }
//     }
// }

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct HomeReplyConstraints {
    path_pattern: String,
    permissions: Vec<String>,
    #[serde(skip)]
    available_permissions: Vec<String>,
}

#[derive(Debug, Default, Serialize, Deserialize, Clone)]
#[serde(rename_all = "kebab-case")]
pub struct HomeConstraintsFilter {
    pub path: Option<String>,
    pub permissions: Option<Vec<String>>,
    pub available_permissions: Option<Vec<String>>,
}

impl HomeConstraintsFilter {
    pub fn with_path(&mut self, path: impl Into<String>) -> &mut Self {
        self.path = Some(path.into());
        self
    }

    pub fn with_permissions(&mut self, permissions: Vec<impl Into<String>>) -> &mut Self {
        self.permissions = Some(permissions.into_iter().map(|p| p.into()).collect());
        self
    }

    pub fn with_available_permissions(&mut self, permissions: Vec<impl Into<String>>) -> &mut Self {
        self.available_permissions = Some(permissions.into_iter().map(|p| p.into()).collect());
        self
    }
}

impl ConstraintsFilter for HomeConstraintsFilter {
    type Constraints = HomeConstraints;

    fn matches(&self, constraints: &Self::Constraints) -> MatchAttempt {
        let mut failures = Vec::new();

        field_matches!(self, constraints, failures, path);
        field_matches!(self, constraints, failures, permissions);
        field_matches!(self, constraints, failures, available_permissions);

        if failures.is_empty() {
            MatchAttempt::Success
        } else {
            MatchAttempt::Failure(failures)
        }
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::snapd_client::{RawPrompt, TypedPrompt};
    use simple_test_case::test_case;

    const HOME_PROMPT: &str = r#"{
      "id": "C7OUCCDWCE6CC===",
      "timestamp": "2024-06-28T19:15:37.321782305Z",
      "snap": "firefox",
      "interface": "home",
      "constraints": {
        "path": "/home/ubuntu/Downloads/",
        "permissions": [
          "read"
        ],
        "available-permissions": [
          "read",
          "write",
          "execute"
        ]
      }
    }"#;

    #[test]
    fn deserializing_a_home_prompt_works() {
        let raw: RawPrompt = serde_json::from_str(HOME_PROMPT).unwrap();
        assert_eq!(raw.interface, "home");

        let p: TypedPrompt = raw.try_into().unwrap();
        assert!(matches!(p, TypedPrompt::Home(_)));
    }

    #[test_case(&["read"], &["read", "write"]; "some not in available")]
    #[test_case(&["read"], &["write"]; "none in available")]
    #[test]
    fn invalid_reply_permissions_error(available: &[&str], requested: &[&str]) {
        let reply = PromptReply {
            constraints: HomeReplyConstraints {
                available_permissions: available.iter().map(|&s| s.into()).collect(),
                ..Default::default()
            },
            ..Default::default()
        };

        let res = reply.try_with_custom_permissions(requested.iter().map(|&s| s.into()).collect());
        match res {
            Err(Error::InvalidCustomPermissions { .. }) => (),
            Err(e) => panic!("expected InvalidCustomPermissions, got {e}"),
            Ok(_) => panic!("should have errored"),
        }
    }
}
