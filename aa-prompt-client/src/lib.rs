pub mod cli_actions;
pub mod prompt_sequence;
pub mod snapd_client;

mod recording;
mod socket_client;
mod util;

pub(crate) const SNAP_NAME: &str = "apparmor-prompting";

#[derive(Debug, thiserror::Error)]
pub enum Error {
    #[error(transparent)]
    Hyper(#[from] hyper::Error),

    #[error(transparent)]
    HyperHttp(#[from] hyper::http::Error),

    #[error(transparent)]
    Io(#[from] std::io::Error),

    #[error(transparent)]
    Json(#[from] serde_json::Error),

    #[error(transparent)]
    Regex(#[from] regex::Error),

    #[error("invalid custom permissions: requested={requested:?} but available={available:?}")]
    InvalidCustomPermissions {
        requested: Vec<String>,
        available: Vec<String>,
    },

    #[error("{version} is not supported recording version.")]
    InvalidRecordingVersion { version: u8 },

    #[error("{uri} is not valid: {reason}")]
    InvalidUri { reason: &'static str, uri: String },

    #[error("the apparmor-prompting feature is not available")]
    NotAvailable,

    #[error("the apparmor-prompting feature is not supported: {reason}")]
    NotSupported { reason: String },

    #[error("error message returned from snapd: {message}")]
    SnapdError { message: String },

    #[error("{interface} is not currently supported for apparmor prompting")]
    UnsupportedInterface { interface: String },
}

pub type Result<T> = std::result::Result<T, Error>;
