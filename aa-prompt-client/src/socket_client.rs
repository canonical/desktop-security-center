use crate::Result;
use http_body_util::{BodyExt, Empty, Full};
use hyper::{
    body::{Body, Bytes, Incoming},
    client::conn::http1,
    header::{CONTENT_TYPE, HOST},
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

    async fn do_req<T>(&self, req: Request<T>) -> Result<Response<Incoming>>
    where
        T: Body + Send + Sync + 'static,
        T::Error: std::error::Error + Send + Sync,
        T::Data: Send + Sync,
    {
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

    pub async fn get(&self, uri: Uri) -> Result<Response<Incoming>> {
        let req = Request::builder()
            .uri(uri.path_and_query().expect("valid uri").as_str())
            .header(HOST, uri.authority().expect("valid uri").as_str())
            .body(Empty::<Bytes>::new())?;

        self.do_req(req).await
    }

    pub async fn post(
        &self,
        uri: Uri,
        content_type: &str,
        body: Vec<u8>,
    ) -> Result<Response<Incoming>> {
        let req = Request::builder()
            .method("POST")
            .uri(uri.path_and_query().expect("valid uri").as_str())
            .header(HOST, uri.authority().expect("valid uri").as_str())
            .header(CONTENT_TYPE, content_type)
            .body(Full::new(Bytes::from(body)))?;

        self.do_req(req).await
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
