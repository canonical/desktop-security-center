use crate::{
    socket_client::{body_json, UnixSocketClient},
    Error, Result,
};
use chrono::{DateTime, SecondsFormat, Utc};
use serde::{de::DeserializeOwned, Deserialize, Serialize};
use std::collections::BTreeMap;
use tracing::debug;

const FEATURE_NAME: &str = "apparmor-prompting";
const LONG_POLL_TIMEOUT: &str = "1h";
const NOTICE_TYPES: &str = "interfaces-requests-prompt";
const SNAPD_BASE_URI: &str = "http://localhost/v2";
const SNAPD_SOCKET: &str = "/run/snapd.socket";

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
    Err { message: String },
    Res(T),
}

#[derive(Debug)]
pub struct SnapdClient {
    client: UnixSocketClient,
    notices_after: String,
}

impl Default for SnapdClient {
    fn default() -> Self {
        Self::new()
    }
}

impl SnapdClient {
    pub fn new() -> Self {
        Self::new_with_notices_after(Utc::now())
    }

    pub fn new_with_notices_after(dt: DateTime<Utc>) -> Self {
        Self {
            client: UnixSocketClient::new(SNAPD_SOCKET),
            notices_after: dt.to_rfc3339_opts(SecondsFormat::Nanos, true),
        }
    }

    async fn get_json<T>(&self, path: &str) -> Result<T>
    where
        T: DeserializeOwned,
    {
        let res = self
            .client
            .get(
                format!("{SNAPD_BASE_URI}/{path}")
                    .parse()
                    .expect("valid uri"),
            )
            .await?;

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
        let res = self
            .client
            .post(
                format!("{SNAPD_BASE_URI}/{path}")
                    .parse()
                    .expect("valid uri"),
                "application/json",
                serde_json::to_vec(&body)?,
            )
            .await?;

        let resp: SnapdResponse<T> = body_json(res).await?;
        match resp.result {
            ResOrErr::Res(t) => Ok(t),
            ResOrErr::Err { message } => Err(Error::SnapdError { message }),
        }
    }

    /// Check whether or not the apparmor-prompting feature is enabled on this system
    pub async fn is_prompting_enabled(&self) -> Result<bool> {
        let info: SysInfo = self.get_json("system-info").await?;

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

        let notices: Vec<Notice> = self.get_json(&path).await?;
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
    pub async fn prompt_details(&self, p: &PromptId) -> Result<Prompt> {
        let prompt: Prompt = self
            .get_json(&format!("interfaces/requests/prompts/{}", p.0))
            .await?;

        Ok(prompt)
    }

    pub async fn reply_to_prompt(&self, p: &PromptId, reply: PromptReply) -> Result<()> {
        let resp: serde_json::Value = self
            .post_json(&format!("interfaces/requests/prompts/{}", p.0), reply)
            .await?;

        debug!(prompt = p.0, ?resp, "response from snapd");

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
pub struct PromptId(String);

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct Prompt {
    id: PromptId,
    timestamp: String,
    snap: String,
    interface: String,
    constraints: Constraints,
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
struct Constraints {
    path: String,
    permissions: Vec<String>,
    available_permissions: Vec<String>,
}

impl Prompt {
    pub fn summary(&self) -> String {
        format!(
            "\
id:          {}
snap:        {}
timestamp:   {}
path:        {}
permissions: {:?}
",
            self.id.0,
            self.snap,
            self.timestamp,
            self.constraints.path,
            self.constraints.permissions
        )
    }

    fn simple_reply(self, action: Action, lifespan: Lifespan) -> PromptReply {
        PromptReply {
            action,
            lifespan,
            duration: None,
            constraints: ReplyConstraints {
                path_pattern: self.constraints.path,
                permissions: self.constraints.permissions,
            },
        }
    }

    pub fn into_allow_once(self) -> PromptReply {
        self.simple_reply(Action::Allow, Lifespan::Single)
    }

    pub fn into_deny_once(self) -> PromptReply {
        self.simple_reply(Action::Deny, Lifespan::Single)
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "kebab-case")]
pub struct PromptReply {
    action: Action,
    lifespan: Lifespan,
    #[serde(skip_serializing_if = "Option::is_none")]
    duration: Option<String>,
    constraints: ReplyConstraints,
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "lowercase")]
enum Action {
    Allow,
    Deny,
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(rename_all = "lowercase")]
enum Lifespan {
    Single,
    Session,
    Forever,
    Timespan,
}

#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
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
}
