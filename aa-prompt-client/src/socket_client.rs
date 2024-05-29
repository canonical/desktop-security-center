use crate::Result;
use http_body_util::{BodyExt, Empty};
use hyper::{
    body::{Bytes, Incoming},
    client::conn::http1,
    header::HOST,
    Request, Response, Uri,
};
use hyper_util::rt::TokioIo;
use serde::de::DeserializeOwned;
use std::path::PathBuf;
use tokio::net::UnixStream;

#[derive(Debug)]
pub(crate) struct UnixSocketClient {
    socket_path: PathBuf,
}

impl UnixSocketClient {
    pub fn new<P>(path: P) -> Self
    where
        P: Into<PathBuf>,
    {
        Self {
            socket_path: path.into(),
        }
    }

    pub async fn get(&self, uri: Uri) -> Result<Response<Incoming>> {
        let authority = uri.authority().unwrap().clone();

        let req = Request::builder()
            .uri(uri.path())
            .header(HOST, authority.as_str())
            .body(Empty::<Bytes>::new())?;

        let stream = UnixStream::connect(&self.socket_path).await?;
        let (mut sender, conn) = http1::handshake(TokioIo::new(stream)).await?;
        tokio::task::spawn(async move {
            if let Err(err) = conn.await {
                println!("Connection failed: {:?}", err);
            }
        });

        let res = sender.send_request(req).await?;

        Ok(res)
    }
}

pub(crate) async fn body_json<T>(res: Response<Incoming>) -> Result<T>
where
    T: DeserializeOwned,
{
    let bytes = res.into_body().collect().await.map(|buf| buf.to_bytes())?;
    let t: T = serde_json::from_slice(&bytes)?;

    Ok(t)
}
