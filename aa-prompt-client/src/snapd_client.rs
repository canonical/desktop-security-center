use crate::{
    socket_client::{body_json, UnixSocketClient},
    Error, Result,
};
use chrono::{DateTime, SecondsFormat, Utc};
use hyper::Uri;
use serde::{de::DeserializeOwned, Deserialize, Serialize};
use std::{collections::BTreeMap, env, path::PathBuf, str::FromStr};
use strum::{Display, EnumString};
use tracing::debug;

const FEATURE_NAME: &str = "apparmor-prompting";
const LONG_POLL_TIMEOUT: &str = "1h";
const NOTICE_TYPES: &str = "interfaces-requests-prompt";
const SNAPD_BASE_URI: &str = "http://localhost/v2";
const SNAPD_SOCKET: &str = "/run/snapd.socket";
const SNAPD_SNAP_SOCKET: &str = "/run/snapd-snap.socket";

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
struct SnapdResponse<T> {
    #[serde(rename = "type")]
    ty: String,
    status_code: u16,
    status: String,
    result: ResOrErr<T>,
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(untagged)]
enum ResOrErr<T> {
    Res(T),
    Err { message: String },
}

/// Abstraction layer to make swapping out the underlying client possible for
/// testing.
#[allow(async_fn_in_trait)]
pub trait Client {
    async fn get_json<T>(&self, path: &str) -> Result<T>
    where
        T: DeserializeOwned;

    async fn post_json<T, U>(&self, path: &str, body: U) -> Result<T>
    where
        T: DeserializeOwned,
        U: Serialize;
}

impl Client for UnixSocketClient {
    async fn get_json<T>(&self, path: &str) -> Result<T>
    where
        T: DeserializeOwned,
    {
        let s = format!("{SNAPD_BASE_URI}/{path}");
        let uri = Uri::from_str(&s).map_err(|_| Error::InvalidUri {
            reason: "malformed",
            uri: s,
        })?;

        let res = self.get(uri).await?;

        let resp: SnapdResponse<T> = body_json(res).await?;
        match resp.result {
            ResOrErr::Res(t) => Ok(t),
            ResOrErr::Err { message } => Err(Error::SnapdError { message }),
        }
    }

    async fn post_json<T, U>(&self, path: &str, body: U) -> Result<T>
    where
        T: DeserializeOwned,
        U: Serialize,
    {
        let s = format!("{SNAPD_BASE_URI}/{path}");
        let uri = Uri::from_str(&s).map_err(|_| Error::InvalidUri {
            reason: "malformed",
            uri: s,
        })?;

        let res = self
            .post(uri, "application/json", serde_json::to_vec(&body)?)
            .await?;

        let resp: SnapdResponse<T> = body_json(res).await?;
        match resp.result {
            ResOrErr::Res(t) => Ok(t),
            ResOrErr::Err { message } => Err(Error::SnapdError { message }),
        }
    }
}

#[derive(Debug)]
pub struct SnapdClient<C>
where
    C: Client,
{
    client: C,
    notices_after: String,
}

pub type SnapdSocketClient = SnapdClient<UnixSocketClient>;

impl Default for SnapdSocketClient {
    fn default() -> Self {
        Self::new()
    }
}

impl SnapdSocketClient {
    pub fn new() -> Self {
        Self::new_with_notices_after(Utc::now())
    }

    pub fn new_with_notices_after(dt: DateTime<Utc>) -> Self {
        let socket = if env::var("SNAP_NAME").is_ok() {
            SNAPD_SNAP_SOCKET
        } else {
            SNAPD_SOCKET
        };

        Self {
            client: UnixSocketClient::new(socket),
            notices_after: dt.to_rfc3339_opts(SecondsFormat::Nanos, true),
        }
    }
}

impl<C> SnapdClient<C>
where
    C: Client,
{
    /// Check whether or not the apparmor-prompting feature is enabled on this system
    pub async fn is_prompting_enabled(&self) -> Result<bool> {
        let info: SysInfo = self.client.get_json("system-info").await?;

        info.prompting_enabled()
    }

    /// HTTP long poll on the /v2/notices API from snapd to await prompt requests for the user we
    /// are running under.
    ///
    /// Calling this method will update our [Self::notices_after] field when we successfully obtain
    /// new notices from snapd.
    pub async fn pending_prompts(&mut self) -> Result<Vec<PromptId>> {
        let path = format!(
            "notices?types={NOTICE_TYPES}&timeout={LONG_POLL_TIMEOUT}&after={}",
            self.notices_after
        );

        let notices: Vec<Notice> = self.client.get_json(&path).await?;
        if let Some(n) = notices.last() {
            n.last_occurred.clone_into(&mut self.notices_after);
        }

        return Ok(notices.into_iter().map(|n| n.key).collect());

        // serde structs

        #[derive(Debug, Deserialize)]
        #[serde(rename_all = "kebab-case")]
        struct Notice {
            key: PromptId,
            last_occurred: String,
        }
    }

    /// Pull details for a specific prompt from snapd
    pub async fn prompt_details(&self, id: &PromptId) -> Result<Prompt> {
        let prompt: Prompt = self
            .client
            .get_json(&format!("interfaces/requests/prompts/{}", id.0))
            .await?;

        // TODO: Pull and merge in the additional metadata we need for rendering
        // the UI (window ID, icon, publisher details etc)

        Ok(prompt)
    }

    /// Submit a reply to the given prompt to snapd
    pub async fn reply_to_prompt(&self, id: &PromptId, reply: PromptReply) -> Result<()> {
        let resp: Vec<String> = self
            .client
            .post_json(&format!("interfaces/requests/prompts/{}", id.0), reply)
            .await?;

        debug!(prompt = id.0, ?resp, "response from snapd");

        Ok(())
    }
}

#[derive(Debug, Default, Deserialize)]
struct SysInfo {
    features: BTreeMap<String, Feature>,
}

impl SysInfo {
    fn prompting_enabled(mut self) -> Result<bool> {
        let f = self
            .features
            .remove(FEATURE_NAME)
            .ok_or(Error::NotAvailable)?;

        match f.unsupported_reason {
            Some(reason) => Err(Error::NotSupported { reason }),
            None => Ok(f.supported && f.enabled),
        }
    }
}

#[derive(Debug, Default, Deserialize)]
#[serde(rename_all = "kebab-case")]
struct Feature {
    enabled: bool,
    supported: bool,
    unsupported_reason: Option<String>,
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
pub struct PromptId(pub String);

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct Prompt {
    pub(crate) id: PromptId,
    pub(crate) timestamp: String,
    pub(crate) snap: String,
    pub(crate) interface: String,
    pub(crate) constraints: Constraints,
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub(crate) struct Constraints {
    pub(crate) path: String,
    pub(crate) permissions: Vec<String>,
    pub(crate) available_permissions: Vec<String>,
}

impl Prompt {
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

    pub fn path(&self) -> &str {
        &self.constraints.path
    }

    pub fn requested_permissions(&self) -> &[String] {
        &self.constraints.permissions
    }

    /// Convert this [Prompt] into a [PromptReply] with a default lifespan of [Lifespan::Single]
    /// and constraints matching those that were requested in the initial prompt.
    ///
    /// The returned `PromptReply` supports a builder API for modifying the details of the reply.
    pub fn into_reply(self, action: Action) -> PromptReply {
        PromptReply {
            action,
            lifespan: Lifespan::Single,
            duration: None,
            constraints: ReplyConstraints {
                path_pattern: self.constraints.path,
                permissions: self.constraints.permissions,
            },
            available_permissions: self.constraints.available_permissions,
        }
    }

    pub fn into_reply_from_ui(self, p: UiPromptReply) -> PromptReply {
        PromptReply {
            action: p.action,
            lifespan: p.lifespan,
            duration: None,
            constraints: ReplyConstraints {
                path_pattern: p.path_pattern,
                permissions: p.permissions,
            },
            available_permissions: self.constraints.available_permissions,
        }
    }

    pub fn as_ui_prompt_input(&self, previous_error_message: Option<String>) -> UiPromptInput {
        let (initial_options, more_options) = self.ui_options();

        UiPromptInput {
            snap_name: self.snap.clone(),
            requested_path: self.path().to_string(),
            requested_permissions: self.constraints.permissions.clone(),
            available_permissions: self.constraints.available_permissions.clone(),
            previous_error_message,
            initial_options,
            more_options,
        }
    }

    fn ui_options(&self) -> (Vec<InitialOption>, Vec<PathAndDescription>) {
        let home_dir = env::var("SNAP_REAL_HOME")
            .map(|p| format!("{p}/**"))
            .expect("to be running inside of a snap");

        let parent_dir = PathBuf::from(self.path())
            .parent()
            .map(|pb| format!("{}/**", pb.to_string_lossy()))
            .expect("requested path to have a parent");

        let initial_options = vec![
            InitialOption::new("Allow Always", UiPromptReply::as_requested(self)),
            InitialOption::new_with_path(self, "Allow Directory", &parent_dir),
            InitialOption::new_with_path(self, "Allow Home", &home_dir),
            InitialOption::new(
                "Deny Once",
                UiPromptReply {
                    action: Action::Deny,
                    lifespan: Lifespan::Single,
                    ..UiPromptReply::as_requested(self)
                },
            ),
        ];

        let mut more_options = vec![PathAndDescription::new("Requested Path", self.path())];

        if self.path().ends_with('/') {
            more_options.push(PathAndDescription::new(
                "Directory Contents",
                format!("{}**", self.path()),
            ));
        }

        if parent_dir != home_dir {
            more_options.push(PathAndDescription::new("Parent Directory", parent_dir));
        }

        more_options.push(PathAndDescription::new("Home Directory", home_dir));

        (initial_options, more_options)
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct UiPromptInput {
    snap_name: String,
    requested_path: String,
    requested_permissions: Vec<String>,
    available_permissions: Vec<String>,
    previous_error_message: Option<String>,
    initial_options: Vec<InitialOption>,
    more_options: Vec<PathAndDescription>,
}

#[derive(Debug, Clone, PartialEq, Eq, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct PathAndDescription {
    description: &'static str,
    path_pattern: String,
}

impl PathAndDescription {
    fn new(description: &'static str, path_pattern: impl Into<String>) -> Self {
        Self {
            description,
            path_pattern: path_pattern.into(),
        }
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct InitialOption {
    button_text: String,
    reply: UiPromptReply,
}

impl InitialOption {
    fn new(button_text: &str, reply: UiPromptReply) -> Self {
        Self {
            button_text: button_text.to_string(),
            reply,
        }
    }

    fn new_with_path(p: &Prompt, button_text: &str, path_pattern: impl Into<String>) -> Self {
        InitialOption::new(
            button_text,
            UiPromptReply {
                path_pattern: path_pattern.into(),
                ..UiPromptReply::as_requested(p)
            },
        )
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct UiPromptReply {
    action: Action,
    lifespan: Lifespan,
    path_pattern: String,
    permissions: Vec<String>,
}

impl UiPromptReply {
    fn as_requested(p: &Prompt) -> Self {
        Self {
            action: Action::Allow,
            lifespan: Lifespan::Forever,
            path_pattern: p.path().to_string(),
            permissions: p.requested_permissions().to_vec(),
        }
    }
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptReply {
    action: Action,
    lifespan: Lifespan,
    #[serde(skip_serializing_if = "Option::is_none")]
    duration: Option<String>,
    constraints: ReplyConstraints,
    #[serde(skip)]
    available_permissions: Vec<String>,
}

impl PromptReply {
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
            .all(|p| self.available_permissions.contains(p))
        {
            self.constraints.permissions = permissions;
            Ok(self)
        } else {
            Err(Error::InvalidCustomPermissions {
                requested: permissions,
                available: self.available_permissions,
            })
        }
    }
}

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

#[derive(Debug, Default, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
struct ReplyConstraints {
    path_pattern: String,
    permissions: Vec<String>,
}

#[cfg(test)]
mod tests {
    use super::*;
    use simple_test_case::test_case;

    #[derive(Debug)]
    enum Enabled {
        Ok(bool),
        NotSupported(&'static str),
    }

    #[test_case(false, None, Enabled::Ok(false); "supported but not enabled")]
    #[test_case(true, None, Enabled::Ok(true); "supported and enabled")]
    #[test_case(false, Some("foo"), Enabled::NotSupported("foo"); "unsupported and not enabled")]
    #[test_case(true, Some("foo"), Enabled::NotSupported("foo"); "unsupported but enabled")]
    #[test]
    fn prompting_enabled_works(enabled: bool, unsupported_reason: Option<&str>, expected: Enabled) {
        let mut features = BTreeMap::default();
        features.insert(
            FEATURE_NAME.to_string(),
            Feature {
                enabled,
                supported: unsupported_reason.is_none(),
                unsupported_reason: unsupported_reason.map(String::from),
            },
        );

        let s = SysInfo { features };

        match (s.prompting_enabled(), expected) {
            (Ok(got), Enabled::Ok(wanted)) => assert_eq!(got, wanted, "boolean return was wrong"),
            (Err(Error::NotSupported { reason }), Enabled::NotSupported(s)) => {
                assert_eq!(reason, s)
            }
            (got, wanted) => panic!("expected {wanted:?}, got {got:?}"),
        }
    }

    #[test]
    fn prompting_enabled_errors_correctly_when_not_available() {
        let s = SysInfo::default();

        match s.prompting_enabled() {
            Err(Error::NotAvailable) => (),
            res => panic!("expected NotAvailable, got {res:?}"),
        }
    }

    #[test_case(&["read"], &["read", "write"]; "some not in available")]
    #[test_case(&["read"], &["write"]; "none in available")]
    #[test]
    fn invalid_reply_permissions_error(available: &[&str], requested: &[&str]) {
        let reply = PromptReply {
            available_permissions: available.iter().map(|&s| s.into()).collect(),
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
