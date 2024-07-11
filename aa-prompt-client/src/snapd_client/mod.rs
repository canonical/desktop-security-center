use crate::{
    socket_client::{body_json, UnixSocketClient},
    Error, Result,
};
use chrono::{DateTime, SecondsFormat, Utc};
use hyper::Uri;
use prompt::RawPrompt;
use serde::{de::DeserializeOwned, Deserialize, Serialize};
use std::{collections::HashMap, env, str::FromStr};
use tracing::debug;

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

        let (channel, (publisher, mut channels)) = match res {
            Ok(data) => data,
            Err(_) => return Ok(None),
        };

        let updated_at = channels
            .remove(&channel)
            .unwrap_or_else(|| "unknown".to_string());

        let store_url = format!("snap://{name}");

        Ok(Some(SnapMeta {
            updated_at,
            store_url,
            publisher,
        }))
    }
}

#[derive(Debug, Default, Clone, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub struct SnapMeta {
    pub updated_at: String,
    pub store_url: String,
    pub publisher: String,
}

async fn meta_from_snap_details<C>(name: &str, client: &C) -> Result<String>
where
    C: Client,
{
    let SnapDetails { channel } = client.get_json(&format!("snaps/{name}")).await?;

    return Ok(channel);

    // Serde structs

    #[derive(Debug, Default, Deserialize)]
    #[serde(rename_all = "kebab-case")]
    struct SnapDetails {
        channel: String,
    }
}

async fn meta_from_find_details<C>(
    name: &str,
    client: &C,
) -> Result<(String, HashMap<String, String>)>
where
    C: Client,
{
    let mut find_details: Vec<FindDetails> = client.get_json(&format!("find?name={name}")).await?;
    let FindDetails {
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

    return Ok((publisher.display_name, channels));

    // Serde structs

    // See https://snapcraft.io/docs/snapd-api#heading--find for other available fields
    #[derive(Debug, Default, Deserialize)]
    #[serde(rename_all = "kebab-case")]
    struct FindDetails {
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
}
