use crate::{
    socket_client::{body_json, UnixSocketClient},
    Error, Result,
};
use chrono::{DateTime, SecondsFormat, Utc};
use hyper::Uri;
use prompt::RawPrompt;
use serde::{de::DeserializeOwned, Deserialize, Serialize};
use std::{collections::HashMap, env, str::FromStr};
use tracing::{debug, error};

pub mod interfaces;
mod prompt;

pub use prompt::{Action, Lifespan, Prompt, PromptId, PromptReply, TypedPrompt, TypedPromptReply};

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

// NOTE: The ordering of the enum variants matters here as it is used by serde when deserializing
// data to work out which variant we have. If we ever have a valid snapd response that also
// contains the `message` key then it will not deserialize correctly.
#[derive(Debug, Clone, PartialEq, Eq, Deserialize, Serialize)]
#[serde(untagged)]
enum ResOrErr<T> {
    Err { message: String },
    Res(T),
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

#[derive(Debug, Clone)]
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
    pub async fn prompt_details(&self, id: &PromptId) -> Result<TypedPrompt> {
        let prompt: RawPrompt = self
            .client
            .get_json(&format!("interfaces/requests/prompts/{}", id.0))
            .await?;

        prompt.try_into()
    }

    /// Submit a reply to the given prompt to snapd
    pub async fn reply_to_prompt(&self, id: &PromptId, reply: TypedPromptReply) -> Result<()> {
        let resp: Vec<String> = self
            .client
            .post_json(&format!("interfaces/requests/prompts/{}", id.0), reply)
            .await?;

        debug!(prompt = id.0, ?resp, "response from snapd");

        Ok(())
    }

    /// Pull metadata for rendering apparmor prompts using the `snap` and `find` snapd endpoints.
    pub async fn snap_metadata(&self, name: &str) -> Result<Option<SnapMeta>> {
        let res = tokio::try_join!(
            meta_from_snap_details(name, &self.client),
            meta_from_find_details(name, &self.client),
        );

        let ((channel, icon_file), (store_url, publisher, mut channels)) = match res {
            Ok(data) => data,
            Err(_) => return Ok(None),
        };

        let updated_at = channels
            .remove(&channel)
            .unwrap_or_else(|| "unknown".to_string());

        Ok(Some(SnapMeta {
            updated_at,
            store_url,
            publisher,
            icon_file,
        }))
    }
}

#[derive(Debug, Default, Clone, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct SnapMeta {
    pub updated_at: String,
    pub store_url: String,
    pub publisher: String,
    pub icon_file: Option<String>,
}

async fn meta_from_snap_details<C>(name: &str, client: &C) -> Result<(String, Option<String>)>
where
    C: Client,
{
    debug!(%name, "fetching snap metadata");
    let SnapDetails { channel, apps } = client.get_json(&format!("snaps/{name}")).await?;
    let desktop_file = desktop_file_path_from_details(apps, name);
    let icon_file = match desktop_file.as_ref() {
        Some(f) => {
            debug!(path=%f, "reading desktop file");
            match tokio::fs::read_to_string(f).await {
                Ok(content) => {
                    debug!(path=%f, "extracting icon path");
                    match content.lines().find(|l| l.starts_with("Icon=")) {
                        Some(line) => line.split_once('=').map(|(_, path)| path.to_string()),
                        None => None,
                    }
                }
                Err(e) => {
                    error!(path=%f, "unable to read desktop file: {e}");
                    None
                }
            }
        }

        None => {
            debug!(%name, "no desktop file found");
            None
        }
    };

    return Ok((channel, icon_file));

    // Serde structs

    #[derive(Debug, Default, Deserialize)]
    #[serde(rename_all = "kebab-case")]
    struct SnapDetails {
        channel: String,
        #[serde(default)]
        apps: Vec<AppDetails>,
    }
}

async fn meta_from_find_details<C>(
    name: &str,
    client: &C,
) -> Result<(String, String, HashMap<String, String>)>
where
    C: Client,
{
    debug!(%name, "fetching find metadata");
    let mut find_details: Vec<FindDetails> = client.get_json(&format!("find?name={name}")).await?;
    let FindDetails {
        store_url,
        publisher,
        channels,
    } = find_details.remove(0);

    let channels = channels
        .into_iter()
        .map(|(channel, data)| {
            let released_at = data
                .released_at
                .split_once('T')
                .map(|(s, _)| s.to_owned())
                .unwrap_or(data.released_at);

            (channel, released_at)
        })
        .collect();

    return Ok((store_url, publisher.display_name, channels));

    // Serde structs

    // See https://snapcraft.io/docs/snapd-api#heading--find for other available fields
    #[derive(Debug, Default, Deserialize)]
    #[serde(rename_all = "kebab-case")]
    struct FindDetails {
        store_url: String,
        publisher: Publisher,
        channels: HashMap<String, Channel>,
    }

    #[derive(Debug, Default, Deserialize)]
    #[serde(rename_all = "kebab-case")]
    struct Publisher {
        display_name: String,
    }

    #[derive(Debug, Default, Deserialize)]
    #[serde(rename_all = "kebab-case")]
    struct Channel {
        released_at: String,
    }
}

#[derive(Debug, Default, Deserialize)]
#[serde(rename_all = "kebab-case")]
struct AppDetails {
    name: String,
    desktop_file: Option<String>,
}

/// Following the same approach as used in https://github.com/snapcore/snapd-desktop-integration/blob/main/src/sdi-helpers.c
///   - If there is only one desktop file returned we use that
///   - If there are multiple we prefer the one assigned to the app matching the snap name
///   - Otherwise we take the first available or None if the list is empty
fn desktop_file_path_from_details(mut details: Vec<AppDetails>, app_name: &str) -> Option<String> {
    details.retain(|d| d.desktop_file.is_some());

    match details.len() {
        0 => return None,
        1 => return details[0].desktop_file.take(),
        _ => (),
    }

    let mut first = None;

    for d in details.into_iter() {
        if d.name == app_name {
            return d.desktop_file;
        } else if first.is_none() {
            first = d.desktop_file;
        }
    }

    first
}

#[derive(Debug, Default, Deserialize)]
struct SysInfo {
    features: HashMap<String, Feature>,
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
        let mut features = HashMap::default();
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

    fn ad(name: &str, desktop_file: Option<&str>) -> AppDetails {
        AppDetails {
            name: name.into(),
            desktop_file: desktop_file.map(Into::into),
        }
    }
    #[test_case(vec![], None; "no details")]
    #[test_case(vec![ad("foo", None)], None; "single result with no desktop file")]
    #[test_case(
        vec![ad("foo", Some("foo.desktop"))],
        Some("foo.desktop"); "single result matching name"
    )]
    #[test_case(
        vec![ad("bar", Some("bar.desktop"))],
        Some("bar.desktop"); "single result no matching name"
    )]
    #[test_case(
        vec![ad("foo", Some("foo.desktop")), ad("bar", Some("bar.desktop"))],
        Some("foo.desktop"); "two results matching name first"
    )]
    #[test_case(
        vec![ad("bar", Some("bar.desktop")), ad("foo", Some("foo.desktop"))],
        Some("foo.desktop"); "two results matching name second"
    )]
    #[test_case(
        vec![ad("foo", None), ad("bar", Some("bar.desktop"))],
        Some("bar.desktop"); "matching name has no desktop file"
    )]
    #[test_case(
        vec![ad("foo", None), ad("bar", None)],
        None; "multiple with no desktop files"
    )]
    #[test]
    fn dektop_file_path_from_details_selects_correct_path(
        details: Vec<AppDetails>,
        expected: Option<&str>,
    ) {
        let res = desktop_file_path_from_details(details, "foo");
        assert_eq!(res.as_deref(), expected);
    }
}
