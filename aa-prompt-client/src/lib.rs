pub mod cli_actions;
pub mod prompt_sequence;
pub mod snapd_client;

mod socket_client;

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

    #[error("invalid custom permissions: requested={requested:?} but available={available:?}")]
    InvalidCustomPermissions {
        requested: Vec<String>,
        available: Vec<String>,
    },

    #[error("{uri} is not valid: {reason}")]
    InvalidUri { reason: &'static str, uri: String },

    #[error("the apparmor-prompting feature is not available")]
    NotAvailable,

    #[error("the apparmor-prompting feature is not supported: {reason}")]
    NotSupported { reason: String },

    #[error("error message returned from snapd: {message}")]
    SnapdError { message: String },
}

pub type Result<T> = std::result::Result<T, Error>;
