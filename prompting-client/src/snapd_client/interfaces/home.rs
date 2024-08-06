use crate::{
    field_matches,
    prompt_sequence::{MatchAttempt, MatchFailure},
    snapd_client::{
        interfaces::{
            ConstraintsFilter, Prompt, PromptReply, ReplyConstraintsOverrides, SnapInterface,
        },
        prompt::UiInput,
        Action, Error, Lifespan, Result, SnapMeta,
    },
    util::serde_option_regex,
};
use regex::Regex;
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
#[derive(Debug, Default, Clone, Deserialize, Serialize, PartialEq, Eq)]
pub struct HomeInterface;

struct PatternOptions {
    initial_pattern_option: usize,
    pattern_options: Vec<TypedPathPattern>,
}

impl PatternOptions {
    /// Build out the UI Pattern options based on how we categorise the path that was requested in
    /// the prompt.
    ///
    /// Details of the cases and rationale behind how we handle this can be found here:
    ///   https://www.figma.com/board/1DIGbaCf4ZjTcShYjLiAIi/24.10-AppArmor-prompting---MVP-logic?node-id=0-1&t=4kUtDaqmQEvLA8v7-0
    fn new(path: &str, home_dir: &str) -> Self {
        let cpath = CategorisedPath::from_path(path);

        let mut options = vec![TypedPathPattern::after_more_options(
            PatternType::HomeDirectory,
            format!("{home_dir}/**"),
        )];

        if !(cpath.is_home_dir() || cpath.is_top_level()) {
            options.push(cpath.top_level_dir_pattern());
        }

        if cpath.is_nested_file() {
            options.push(cpath.containing_dir_pattern());
        }

        if !cpath.is_home_dir() {
            options.push(cpath.requested_path_pattern());
        }

        if !cpath.is_dir {
            if let Some(opt) = cpath.matching_extension_pattern(home_dir) {
                options.push(opt);
            }
        }

        Self {
            initial_pattern_option: 1,
            pattern_options: options,
        }
    }
}

fn home_dir_from_env() -> String {
    env::var("SNAP_REAL_HOME").expect("to be running inside of a snap")
}

impl HomeInterface {
    fn ui_options(&self, prompt: &Prompt<Self>) -> PatternOptions {
        let path = &prompt.constraints.path;
        PatternOptions::new(path, &home_dir_from_env())
    }
}

impl SnapInterface for HomeInterface {
    const NAME: &'static str = "home";

    type Constraints = HomeConstraints;
    type ReplyConstraints = HomeReplyConstraints;

    type ConstraintsFilter = HomeConstraintsFilter;
    type ReplyConstraintsOverrides = HomeReplyConstraintsOverrides;

    type UiInputData = HomeUiInputData;
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

    fn map_ui_input(&self, prompt: Prompt<Self>, meta: Option<SnapMeta>) -> UiInput<Self> {
        let PatternOptions {
            initial_pattern_option,
            pattern_options,
        } = self.ui_options(&prompt);
        let meta = meta.unwrap_or_else(|| SnapMeta {
            name: prompt.snap,
            updated_at: String::default(),
            store_url: String::default(),
            publisher: String::default(),
        });

        // We elevate the initially selected permissions in the ui from write -> read/write
        // in order to minimise the number of prompts users encounter in the common case that
        // an app wants to interact with a file after writing it.
        let mut initial_permissions = prompt.constraints.permissions.clone();
        if prompt.constraints.is_only_write() {
            initial_permissions.push("read".to_string());
        }

        UiInput {
            id: prompt.id,
            meta,
            data: HomeUiInputData {
                requested_path: prompt.constraints.path,
                home_dir: home_dir_from_env(),
                requested_permissions: prompt.constraints.permissions.clone(),
                available_permissions: prompt.constraints.available_permissions,
                initial_permissions,
                pattern_options,
                initial_pattern_option,
            },
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

#[derive(Default, Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct HomeConstraints {
    pub(crate) path: String,
    pub(crate) permissions: Vec<String>,
    pub(crate) available_permissions: Vec<String>,
}

impl HomeConstraints {
    fn is_only_write(&self) -> bool {
        self.permissions.len() == 1 && self.permissions[0] == "write"
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct HomeUiInputData {
    pub(crate) requested_path: String,
    pub(crate) home_dir: String,
    pub(crate) requested_permissions: Vec<String>,
    pub(crate) available_permissions: Vec<String>,
    pub(crate) initial_permissions: Vec<String>,
    pub(crate) initial_pattern_option: usize,
    pub(crate) pattern_options: Vec<TypedPathPattern>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct TypedPathPattern {
    pub(crate) pattern_type: PatternType,
    pub(crate) path_pattern: String,
    pub(crate) show_initially: bool,
}

impl TypedPathPattern {
    fn new(
        pattern_type: PatternType,
        path_pattern: impl Into<String>,
        show_initially: bool,
    ) -> Self {
        Self {
            pattern_type,
            path_pattern: path_pattern.into(),
            show_initially,
        }
    }

    fn initial(pattern_type: PatternType, path_pattern: impl Into<String>) -> Self {
        Self::new(pattern_type, path_pattern, true)
    }

    fn after_more_options(pattern_type: PatternType, path_pattern: impl Into<String>) -> Self {
        Self::new(pattern_type, path_pattern, false)
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct HomeUiReply {
    action: Action,
    lifespan: Lifespan,
    path_pattern: String,
    permissions: Vec<String>,
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct HomeReplyConstraints {
    pub(crate) path_pattern: String,
    pub(crate) permissions: Vec<String>,
    #[serde(skip)]
    pub(crate) available_permissions: Vec<String>,
}

#[derive(Debug, Default, Serialize, Deserialize, Clone)]
#[serde(rename_all = "kebab-case")]
pub struct HomeConstraintsFilter {
    #[serde(with = "serde_option_regex", default)]
    pub path: Option<Regex>,
    pub permissions: Option<Vec<String>>,
    pub available_permissions: Option<Vec<String>>,
}

impl HomeConstraintsFilter {
    pub fn try_with_path(&mut self, path: impl Into<String>) -> Result<&mut Self> {
        let re = Regex::new(&path.into())?;
        self.path = Some(re);
        Ok(self)
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

        if let Some(re) = &self.path {
            if !re.is_match(&constraints.path) {
                failures.push(MatchFailure {
                    field: "path",
                    expected: format!("{:?}", re.to_string()),
                    seen: format!("{:?}", constraints.path),
                });
            }
        }

        field_matches!(self, constraints, failures, permissions);
        field_matches!(self, constraints, failures, available_permissions);

        if failures.is_empty() {
            MatchAttempt::Success
        } else {
            MatchAttempt::Failure(failures)
        }
    }
}

#[derive(Debug, Default, Serialize, Deserialize, Clone)]
#[serde(rename_all = "kebab-case")]
pub struct HomeReplyConstraintsOverrides {
    pub path_pattern: Option<String>,
    pub permissions: Option<Vec<String>>,
}

impl ReplyConstraintsOverrides for HomeReplyConstraintsOverrides {
    type ReplyConstraints = HomeReplyConstraints;

    fn apply(self, mut constraints: Self::ReplyConstraints) -> Self::ReplyConstraints {
        if let Some(path_pattern) = self.path_pattern {
            constraints.path_pattern = path_pattern;
        }
        if let Some(permissions) = self.permissions {
            constraints.permissions = permissions;
        }

        constraints
    }
}

#[derive(Debug, Clone, PartialEq, Eq)]
struct CategorisedPath<'a> {
    raw_path: &'a str,
    path: PathBuf,
    is_dir: bool,
}

impl<'a> CategorisedPath<'a> {
    fn from_path(path: &'a str) -> Self {
        let is_dir = path.ends_with('/');

        Self {
            raw_path: path,
            path: PathBuf::from(path),
            is_dir,
        }
    }

    fn is_home_dir(&self) -> bool {
        self.path.iter().count() == 3
    }

    fn is_top_level(&self) -> bool {
        self.path.iter().count() == 4
    }

    fn is_nested_file(&self) -> bool {
        self.path.iter().count() > 5 && !self.is_dir
    }

    fn requested_path_pattern(&self) -> TypedPathPattern {
        let pattern_type = if self.is_dir {
            PatternType::RequestedDirectory
        } else {
            PatternType::RequestedFile
        };

        TypedPathPattern::initial(pattern_type, self.raw_path)
    }

    fn top_level_dir_pattern(&self) -> TypedPathPattern {
        debug_assert!(!(self.is_home_dir() || self.is_top_level()));
        let top_level: PathBuf = self.path.iter().take(4).collect();

        TypedPathPattern::initial(
            PatternType::TopLevelDirectory,
            format!("{}/**", top_level.to_string_lossy()),
        )
    }

    fn containing_dir_pattern(&self) -> TypedPathPattern {
        debug_assert!(self.is_nested_file());
        let mut segments: Vec<_> = self.path.iter().collect();
        segments.pop();
        let pb: PathBuf = segments.into_iter().collect();

        TypedPathPattern::initial(
            PatternType::ContainingDirectory,
            format!("{}/**", pb.to_string_lossy()),
        )
    }

    fn matching_extension_pattern(&self, home_dir: &str) -> Option<TypedPathPattern> {
        debug_assert!(!self.is_dir);
        match self.path.extension() {
            Some(ext) => {
                let ext = ext.to_string_lossy();
                Some(TypedPathPattern::after_more_options(
                    PatternType::MatchingFileExtension,
                    format!("{home_dir}/**/*.{ext}"),
                ))
            }
            _ => None,
        }
    }
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum PatternType {
    RequestedDirectory,
    RequestedFile,
    TopLevelDirectory,
    ContainingDirectory,
    HomeDirectory,
    MatchingFileExtension,
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

    #[test_case("/home/user/", false; "home dir")]
    #[test_case("/home/user/foo.txt", true; "top level file")]
    #[test_case("/home/user/Documents", true; "top level dir")]
    #[test_case("/home/user/Documents/foo.txt", false; "nested file")]
    #[test_case("/home/user/Documents/banking", false; "nested dir")]
    #[test_case("/home/user/Documents/foo.txt", false; "file in top level dir")]
    #[test]
    fn is_top_level(path: &str, is_top_level: bool) {
        let cpath = CategorisedPath::from_path(path);
        assert_eq!(cpath.is_top_level(), is_top_level);
    }

    #[test_case("/home/user/", false; "home dir")]
    #[test_case("/home/user/foo.txt", false; "top level file")]
    #[test_case("/home/user/Documents", false; "top level dir")]
    #[test_case("/home/user/Documents/foo/bar.txt", true; "nested file")]
    #[test_case("/home/user/Documents/banking", false; "nested dir")]
    #[test_case("/home/user/Documents/foo.txt", false; "file in top level dir")]
    #[test]
    fn is_nested_file(path: &str, is_nested_file: bool) {
        let cpath = CategorisedPath::from_path(path);
        assert_eq!(cpath.is_nested_file(), is_nested_file);
    }

    #[test_case(
        "/home/user/bar.zip",
        &[
            PatternType::HomeDirectory,
            PatternType::RequestedFile,
            PatternType::MatchingFileExtension,
        ];
        "file in home folder"
    )]
    #[test_case(
        "/home/user/bar",
        &[
            PatternType::HomeDirectory,
            PatternType::RequestedFile,
        ];
        "file in home folder without extension"
    )]
    #[test_case(
        "/home/user/Pictures/nested/foo.jpeg",
        &[
            PatternType::HomeDirectory,
            PatternType::TopLevelDirectory,
            PatternType::ContainingDirectory,
            PatternType::RequestedFile,
            PatternType::MatchingFileExtension,
        ];
        "file in sub-folder"
    )]
    #[test_case(
        "/home/user/Pictures/nested/foo",
        &[
            PatternType::HomeDirectory,
            PatternType::TopLevelDirectory,
            PatternType::ContainingDirectory,
            PatternType::RequestedFile,
        ];
        "file in sub-folder without extension"
    )]
    #[test_case(
        "/home/user/Downloads/foo.jpeg",
        &[
            PatternType::HomeDirectory,
            PatternType::TopLevelDirectory,
            PatternType::RequestedFile,
            PatternType::MatchingFileExtension,
        ];
        "file in top level folder"
    )]
    #[test_case(
        "/home/user/Downloads/foo",
        &[
            PatternType::HomeDirectory,
            PatternType::TopLevelDirectory,
            PatternType::RequestedFile,
        ];
        "file in top level folder without extension"
    )]
    #[test_case(
        "/home/user/Downloads/stuff/",
        &[
            PatternType::HomeDirectory,
            PatternType::TopLevelDirectory,
            PatternType::RequestedDirectory,
        ];
        "sub-folder"
    )]
    #[test_case(
        "/home/user/Downloads/",
        &[
            PatternType::HomeDirectory,
            PatternType::RequestedDirectory,
        ];
        "top level folder"
    )]
    #[test_case(
        "/home/user/",
        &[
            PatternType::HomeDirectory,
        ];
        "home folder"
    )]
    #[test]
    fn building_options_works(path: &str, expected: &[PatternType]) {
        let p = PatternOptions::new(path, "/home/user");
        let descriptions: Vec<PatternType> =
            p.pattern_options.iter().map(|pd| pd.pattern_type).collect();

        assert_eq!(descriptions, expected);
    }
}
