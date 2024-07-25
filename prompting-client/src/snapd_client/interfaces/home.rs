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
use std::{
    env,
    path::{Path, PathBuf},
};

// Common file extensions
const ARCHIVE_EXTENSIONS: [&str; 8] = ["7z", "bz2", "gz", "rar", "tar", "tar", "xz", "zip"];
const AUDIO_EXTENSIONS: [&str; 6] = ["aac", "flac", "m4a", "mp3", "ogg", "wav"];
const DOCUMENT_EXTENSIONS: [&str; 14] = [
    "doc", "docx", "epub", "md", "odp", "ods", "odt", "pdf", "ppt", "pptx", "rtf", "txt", "xls",
    "xlsx",
];
const IMAGE_EXTENSIONS: [&str; 8] = ["gif", "jpeg", "jpg", "png", "tif", "tiff", "webp", "xcf"];
const VIDEO_EXTENSIONS: [&str; 4] = ["avi", "mkv", "mov", "mp4"];

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
    fn ui_options(&self, prompt: &Prompt<Self>) -> (Vec<InitialOption>, Vec<TypedPathPattern>) {
        let home_dir = env::var("SNAP_REAL_HOME").expect("to be running inside of a snap");
        let path = &prompt.constraints.path;

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

        let more_options = build_more_options(path, &home_dir);

        (initial_options, more_options)
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
        let (initial_options, more_options) = self.ui_options(&prompt);
        let meta = meta.unwrap_or_else(|| SnapMeta {
            name: prompt.snap,
            updated_at: String::default(),
            store_url: String::default(),
            publisher: String::default(),
        });

        UiInput {
            id: prompt.id,
            meta,
            data: HomeUiInputData {
                requested_path: prompt.constraints.path,
                requested_permissions: prompt.constraints.permissions,
                available_permissions: prompt.constraints.available_permissions,
                initial_options,
                more_options,
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

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct HomeUiInputData {
    pub(crate) requested_path: String,
    pub(crate) requested_permissions: Vec<String>,
    pub(crate) available_permissions: Vec<String>,
    pub(crate) initial_options: Vec<InitialOption>,
    pub(crate) more_options: Vec<TypedPathPattern>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "camelCase")]
pub struct TypedPathPattern {
    pub(crate) pattern_type: PatternType,
    pub(crate) path_pattern: String,
}

impl TypedPathPattern {
    fn new(pattern_type: PatternType, path_pattern: impl Into<String>) -> Self {
        Self {
            pattern_type,
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

// Using strings rather than Paths as we can't use filesystem operations
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
enum PathCategory {
    Directory,
    ArchiveFile,
    AudioFile,
    DocumentFile,
    ImageFile,
    VideoFile,
    MiscFile,
}

impl PathCategory {
    // NOTE: only doing this from "ends in a slash" means some of the UI text will be wrong for
    // files without an extension
    fn from_path(p: &str) -> Self {
        if p.ends_with('/') {
            Self::Directory
        } else if ARCHIVE_EXTENSIONS.iter().any(|e| p.ends_with(e)) {
            Self::ArchiveFile
        } else if AUDIO_EXTENSIONS.iter().any(|e| p.ends_with(e)) {
            Self::AudioFile
        } else if DOCUMENT_EXTENSIONS.iter().any(|e| p.ends_with(e)) {
            Self::DocumentFile
        } else if IMAGE_EXTENSIONS.iter().any(|e| p.ends_with(e)) {
            Self::ImageFile
        } else if VIDEO_EXTENSIONS.iter().any(|e| p.ends_with(e)) {
            Self::VideoFile
        } else {
            Self::MiscFile
        }
    }

    const fn pattern_type(&self) -> PatternType {
        if matches!(self, PathCategory::Directory) {
            PatternType::RequestedDirectory
        } else {
            PatternType::RequestedFile
        }
    }

    fn ftype_option(&self, home_dir: &str) -> Option<TypedPathPattern> {
        let ftype_path = |exts: &[&str]| format!("{home_dir}/**/*.{{{}}}", exts.join(","));

        match self {
            PathCategory::ArchiveFile => Some(TypedPathPattern::new(
                PatternType::ArchiveFiles,
                ftype_path(&ARCHIVE_EXTENSIONS),
            )),
            PathCategory::AudioFile => Some(TypedPathPattern::new(
                PatternType::AudioFiles,
                ftype_path(&AUDIO_EXTENSIONS),
            )),
            PathCategory::DocumentFile => Some(TypedPathPattern::new(
                PatternType::DocumentFiles,
                ftype_path(&DOCUMENT_EXTENSIONS),
            )),
            PathCategory::ImageFile => Some(TypedPathPattern::new(
                PatternType::ImageFiles,
                ftype_path(&IMAGE_EXTENSIONS),
            )),
            PathCategory::VideoFile => Some(TypedPathPattern::new(
                PatternType::VideoFiles,
                ftype_path(&VIDEO_EXTENSIONS),
            )),
            _ => None,
        }
    }
}

fn top_level_dir_option(pb: &Path) -> Option<TypedPathPattern> {
    let comps: Vec<_> = pb.iter().take(4).collect();
    if comps.len() < 4 || comps[3].to_string_lossy().contains('.') {
        return None;
    }
    let top_level: PathBuf = comps.into_iter().collect();

    Some(TypedPathPattern::new(
        PatternType::TopLevelDirectory,
        format!("{}/**", top_level.to_string_lossy()),
    ))
}

fn build_more_options(path: &str, home_dir: &str) -> Vec<TypedPathPattern> {
    let category = PathCategory::from_path(path);
    let pb = PathBuf::from(path);
    let pattern_type = category.pattern_type();

    let mut more_options = vec![TypedPathPattern::new(pattern_type, path)];

    if let Some(opt) = top_level_dir_option(&pb) {
        more_options.push(opt);
    }

    more_options.push(TypedPathPattern::new(
        PatternType::HomeDirectory,
        format!("{home_dir}/**"),
    ));

    if pattern_type == PatternType::RequestedFile {
        if let Some(ext) = pb.extension() {
            let ext = ext.to_string_lossy();
            more_options.push(TypedPathPattern::new(
                PatternType::MatchingFileExtension,
                format!("{home_dir}/**/*.{ext}"),
            ));
        }
    }

    if let Some(opt) = category.ftype_option(home_dir) {
        more_options.push(opt);
    }

    more_options
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
pub enum PatternType {
    RequestedDirectory,
    RequestedFile,
    TopLevelDirectory,
    HomeDirectory,
    MatchingFileExtension,
    ArchiveFiles,
    AudioFiles,
    DocumentFiles,
    ImageFiles,
    VideoFiles,
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

    #[test_case("/home/user/Downloads/foo/bar.txt"; "nested file")]
    #[test_case("/home/user/Downloads/"; "top level dir with trailing slash")]
    #[test_case("/home/user/Downloads"; "top level dir without trailing slash")]
    #[test]
    fn top_level_dir_works_when_dir_exists(path: &str) {
        let opt = top_level_dir_option(&PathBuf::from(path)).unwrap();

        assert_eq!(opt.pattern_type, PatternType::TopLevelDirectory);
        assert_eq!(opt.path_pattern, "/home/user/Downloads/**");
    }

    #[test_case("/home/user/foo.txt"; "top level file")]
    #[test_case("/home/user/"; "home dir with trailing slash")]
    #[test_case("/home/user"; "home dir without trailing slash")]
    #[test]
    fn invalid_top_level_dir_is_none(path: &str) {
        let opt = top_level_dir_option(&PathBuf::from(path));
        assert!(opt.is_none());
    }

    #[test]
    fn ftype_option_creates_a_valid_path_pattern() {
        let opt = PathCategory::VideoFile.ftype_option("/home/user").unwrap();
        assert_eq!(opt.path_pattern, "/home/user/**/*.{avi,mkv,mov,mp4}");
    }

    #[test_case(
        "/home/user/Downloads/",
        &[PatternType::RequestedDirectory, PatternType::TopLevelDirectory, PatternType::HomeDirectory];
        "top level directory"
    )]
    #[test_case(
        "/home/user/Downloads/foo.jpeg",
        &[
            PatternType::RequestedFile,
            PatternType::TopLevelDirectory,
            PatternType::HomeDirectory,
            PatternType::MatchingFileExtension,
            PatternType::ImageFiles,
        ];
        "jpeg in Downloads"
    )]
    #[test_case(
        "/home/user/bar.zip",
        &[
            PatternType::RequestedFile,
            PatternType::HomeDirectory,
            PatternType::MatchingFileExtension,
            PatternType::ArchiveFiles,
        ];
        "zip in home folder"
    )]
    #[test_case(
        "/home/user/custom/strange.file",
        &[
            PatternType::RequestedFile,
            PatternType::TopLevelDirectory,
            PatternType::HomeDirectory,
            PatternType::MatchingFileExtension,
        ];
        "unknown file extension"
    )]
    #[test]
    fn building_more_options_works(path: &str, expected: &[PatternType]) {
        let opts = build_more_options(path, "/home/user");
        let descriptions: Vec<PatternType> = opts.iter().map(|pd| pd.pattern_type).collect();

        assert_eq!(descriptions, expected);
    }
}
