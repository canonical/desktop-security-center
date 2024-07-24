//! The GRPC server that handles incoming connections from client UIs.
use crate::{
    daemon::{worker::ReadOnlyActivePrompt, ActionedPrompt},
    protos::{
        apparmor_prompting::{
            self, get_current_prompt_response::Prompt, home_prompt::MoreOption,
            prompt_reply::PromptReply::HomePromptReply, prompt_reply_response::PromptReplyType,
            HomePatternType, MetaData, PromptReply,
        },
        AppArmorPrompting, AppArmorPromptingServer, GetCurrentPromptResponse, HomePrompt,
        PromptReplyResponse, ResolveHomePatternTypeResponse,
    },
    snapd_client::{
        self,
        interfaces::home::{HomeInterface, HomeReplyConstraints, PatternType, TypedPathPattern},
        PromptId, PromptReply as SnapPromptReply, SnapdSocketClient, TypedPromptReply,
        TypedUiInput, UiInput,
    },
};
use std::error::Error;
use tokio::{net::UnixListener, sync::mpsc::UnboundedSender};
use tonic::{async_trait, Code, Request, Response, Status};

macro_rules! map_enum {
    ($from:ident => $to:ident; [$($variant:ident),+]; $val:expr;) => {
        match $val {
            $(
                $from::$variant => $to::$variant,
            )+
        }
    };

    ($fmod:ident::$from:ident => $tmod:ident::$to:ident; [$($variant:ident),+]; $val:expr;) => {
        match $val {
            $(
                $fmod::$from::$variant => $tmod::$to::$variant,
            )+
        }
    };
}

#[async_trait]
pub trait ReplyToPrompt: Send + Sync + 'static {
    async fn reply(
        &self,
        id: &PromptId,
        reply: TypedPromptReply,
    ) -> Result<Vec<PromptId>, Box<(dyn Error + Send + Sync)>>;
}

#[derive(Clone)]
pub struct Client {
    pub client: SnapdSocketClient,
}

#[async_trait]
impl ReplyToPrompt for Client {
    async fn reply(
        &self,
        id: &PromptId,
        reply: TypedPromptReply,
    ) -> Result<Vec<PromptId>, Box<dyn Error + Send + Sync>> {
        let prompts = self.client.reply_to_prompt(id, reply).await?;
        Ok(prompts)
    }
}

pub fn new_server_and_listener<T: ReplyToPrompt>(
    client: T,
    active_prompt: ReadOnlyActivePrompt,
    tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
    socket_path: String,
) -> (AppArmorPromptingServer<Service<T>>, UnixListener)
where
    T: ReplyToPrompt + Clone,
{
    let service = Service::new(client.clone(), active_prompt, tx_actioned_prompts);
    let listener = UnixListener::bind(&socket_path).expect("to be able to bind to our socket");

    (AppArmorPromptingServer::new(service), listener)
}

pub struct Service<T: ReplyToPrompt + Send + Sync> {
    client: T,
    active_prompt: ReadOnlyActivePrompt,
    tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
}

impl<T: ReplyToPrompt + Send + Sync> Service<T> {
    pub fn new(
        client: T,
        active_prompt: ReadOnlyActivePrompt,
        tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
    ) -> Self {
        Self {
            client,
            active_prompt,
            tx_actioned_prompts,
        }
    }
}

#[async_trait]
impl<T: ReplyToPrompt + Send + Sync> AppArmorPrompting for Service<T> {
    async fn get_current_prompt(
        &self,
        _request: Request<()>,
    ) -> Result<Response<GetCurrentPromptResponse>, Status> {
        let prompt = self
            .active_prompt
            .get()
            .map(|TypedUiInput::Home(p)| map_home_response(p));

        Ok(Response::new(GetCurrentPromptResponse { prompt }))
    }

    async fn reply_to_prompt(
        &self,
        request: Request<PromptReply>,
    ) -> Result<Response<PromptReplyResponse>, Status> {
        let req = request.into_inner();

        let reply = map_prompt_reply(req.clone())?;

        let id = PromptId(req.prompt_id.clone());
        let others = match self.client.reply(&id, reply).await {
            Ok(res) => res,

            // FIXME: We need to check for snapd errors vs other errors rather than just
            // stringifying the error itself here.
            Err(e) => {
                return Ok(Response::new(PromptReplyResponse {
                    prompt_reply_type: PromptReplyType::Unknown as i32,
                    message: e.to_string(),
                }))
            }
        };

        if let Err(e) = self.tx_actioned_prompts.send(ActionedPrompt { id, others }) {
            panic!("send on closed channel: {e}");
        }

        Ok(Response::new(PromptReplyResponse {
            prompt_reply_type: PromptReplyType::Success as i32,
            message: "success".to_string(),
        }))
    }

    async fn resolve_home_pattern_type(
        &self,
        _: Request<String>,
    ) -> Result<Response<ResolveHomePatternTypeResponse>, Status> {
        // FIXME: finish this endpoint
        Err(Status::new(
            Code::Unimplemented,
            "this endpoint is not yet implemented",
        ))
    }
}

fn map_prompt_reply(mut reply: PromptReply) -> Result<TypedPromptReply, Status> {
    let prompt_type = reply.prompt_reply.take().ok_or(Status::new(
        Code::InvalidArgument,
        "recieved empty prompt_reply",
    ))?;

    Ok(TypedPromptReply::Home(SnapPromptReply::<HomeInterface> {
        action: map_enum!(
            apparmor_prompting::Action => snapd_client::Action;
            [Allow, Deny];
            reply.action();
        ),
        lifespan: map_enum!(
            apparmor_prompting::Lifespan => snapd_client::Lifespan;
            [Single, Session, Forever];
            reply.lifespan();
        ),
        duration: None, // we never use the Timespan variant
        constraints: match prompt_type {
            HomePromptReply(home_prompt_reply) => HomeReplyConstraints {
                path_pattern: home_prompt_reply.path_pattern,
                permissions: home_prompt_reply.permissions,
                available_permissions: Vec::new(), //????
            },
        },
    }))
}

fn map_home_response(input: UiInput<HomeInterface>) -> Prompt {
    Prompt::HomePrompt(HomePrompt {
        meta_data: Some(MetaData {
            prompt_id: input.id.0,
            snap_name: input.meta.name,
            store_url: input.meta.store_url,
            publisher: input.meta.publisher,
            updated_at: input.meta.updated_at,
        }),
        requested_path: input.data.requested_path,
        requested_permissions: input.data.requested_permissions,
        available_permissions: input.data.available_permissions,
        more_options: input
            .data
            .more_options
            .into_iter()
            .map(
                |TypedPathPattern {
                     pattern_type,
                     path_pattern,
                 }| {
                    let home_pattern_type = map_enum!(
                        PatternType => HomePatternType;
                        [
                            RequestedDirectory, RequestedFile, TopLevelDirectory, HomeDirectory,
                            MatchingFileExtension, ArchiveFiles, AudioFiles, DocumentFiles,
                            ImageFiles, VideoFiles
                        ];
                        pattern_type;
                    );

                    MoreOption {
                        home_pattern_type: home_pattern_type as i32,
                        path_pattern,
                    }
                },
            )
            .collect(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use std::{
        error::Error,
        fs,
        sync::{Arc, Mutex},
    };

    use apparmor_prompting::{Action, Lifespan};
    use hyper_util::rt::TokioIo;
    use simple_test_case::test_case;
    use tokio::{self, net::UnixStream, sync::mpsc::unbounded_channel};
    use tokio_stream::wrappers::UnixListenerStream;
    use tonic::transport::{Endpoint, Uri};
    use tonic::{async_trait, transport::Server, Request};
    use tower::service_fn;

    use crate::{
        daemon::worker::ReadOnlyActivePrompt,
        protos::apparmor_prompting::app_armor_prompting_client::AppArmorPromptingClient,
        snapd_client::{interfaces::home::HomeUiInputData, PromptId, SnapMeta, TypedPromptReply},
    };

    #[derive(Clone)]
    struct MockClient {
        want_err: bool,
    }

    #[async_trait]
    impl ReplyToPrompt for MockClient {
        async fn reply(
            &self,
            _id: &PromptId,
            _reply: TypedPromptReply,
        ) -> Result<Vec<PromptId>, Box<dyn Error + Send + Sync>> {
            if self.want_err {
                Err(Box::new(std::io::Error::new(
                    std::io::ErrorKind::Other,
                    "error requested of mock snapd client",
                )))
            } else {
                Ok(Vec::new())
            }
        }
    }

    #[test_case("empty_prompt", true; "empty prompt")]
    #[test_case("non_empty_prompt", false; "non-empty prompt")]
    #[tokio::test]
    async fn test_get_current_prompt(test_name: &str, empty_active_prompt: bool) {
        let mock_client = MockClient { want_err: false };
        let (tx_actioned_prompts, _rx_actioned_prompts) = unbounded_channel();

        let active_prompt = if empty_active_prompt {
            ReadOnlyActivePrompt {
                active_prompt: Arc::new(Mutex::new(None)),
            }
        } else {
            ReadOnlyActivePrompt {
                active_prompt: Arc::new(Mutex::new(Some(TypedUiInput::Home(UiInput::<
                    HomeInterface,
                > {
                    id: PromptId("foo".to_string()),
                    meta: SnapMeta {
                        name: "foo".to_string(),
                        updated_at: "foo".to_string(),
                        store_url: "foo".to_string(),
                        publisher: "foo".to_string(),
                    },
                    data: HomeUiInputData {
                        requested_path: "foo".to_string(),
                        requested_permissions: Vec::new(),
                        available_permissions: Vec::new(),
                        initial_options: Vec::new(),
                        more_options: Vec::new(),
                    },
                })))),
            }
        };

        let want = if empty_active_prompt {
            None
        } else {
            Some(Prompt::HomePrompt(HomePrompt {
                meta_data: Some(MetaData {
                    prompt_id: "foo".to_string(),
                    snap_name: "foo".to_string(),
                    store_url: "foo".to_string(),
                    publisher: "foo".to_string(),
                    updated_at: "foo".to_string(),
                }),
                requested_path: "foo".to_string(),
                requested_permissions: Vec::new(),
                available_permissions: Vec::new(),
                more_options: Vec::new(),
            }))
        };
        let test_name = Arc::new(test_name.to_string());
        let path = format!("/tmp/{}_socket", test_name);
        let _ = fs::remove_file(&path); // Remove the old socket file if it exists

        let (server, listener) = new_server_and_listener(
            mock_client,
            active_prompt,
            tx_actioned_prompts,
            path.clone(),
        );

        let incoming = UnixListenerStream::new(listener);

        // No choice but to do this https://github.com/hyperium/tonic/blob/master/examples/src/uds/client.rs
        let channel = Endpoint::try_from("http://[::]:50051")
            .unwrap()
            .connect_with_connector(service_fn(move |_: Uri| {
                let path = Arc::clone(&test_name);
                async move {
                    let path = format!("/tmp/{}_socket", path);
                    // Connect to a Uds socket
                    Ok::<_, std::io::Error>(TokioIo::new(UnixStream::connect(path).await?))
                }
            }))
            .await
            .unwrap();
        let mut client = AppArmorPromptingClient::new(channel);

        tokio::spawn(async move {
            Server::builder()
                .add_service(server)
                .serve_with_incoming(incoming)
                .await
                .unwrap();
        });

        let resp = client
            .get_current_prompt(Request::new(()))
            .await
            .unwrap()
            .into_inner()
            .prompt;

        assert_eq!(resp, want);
    }

    #[test_case("error_when_map_prompt_reply_fails", true, false, false, true; "Error when map_prompt_reply fails")]
    #[test_case("returns_unknown_error_code_when_snapd_returns_an_error", false, true, false, false; "Returns unknown error code when snapd returns an error")]
    #[test_case("error_when_returning_actioned_prompts_returns_an_error", false, false, true, true; "Error when returning actioned prompts returns an error")]
    #[test_case("succesfully_reply_to_a_prompt", false, false, false, false; "Succesfully reply to a prompt")]
    #[tokio::test]
    async fn test_reply_to_prompt(
        test_name: &str,
        map_prompt_reply_err: bool,
        snapd_err: bool,
        tx_err: bool,
        want_err: bool,
    ) {
        let mock_client = MockClient {
            want_err: snapd_err,
        };
        let (tx_actioned_prompts, rx_actioned_prompts) = unbounded_channel();

        if tx_err {
            drop(rx_actioned_prompts);
        }

        let active_prompt = ReadOnlyActivePrompt {
            active_prompt: Arc::new(Mutex::new(None)),
        };

        let test_name = Arc::new(test_name.to_string());
        let path = format!("/tmp/{}_socket", test_name);
        let _ = fs::remove_file(&path); // Remove the old socket file if it exists

        let (server, listener) = new_server_and_listener(
            mock_client,
            active_prompt,
            tx_actioned_prompts,
            path.clone(),
        );

        let incoming = UnixListenerStream::new(listener);

        // No choice but to do this https://github.com/hyperium/tonic/blob/master/examples/src/uds/client.rs
        let channel = Endpoint::try_from("http://[::]:50051")
            .unwrap()
            .connect_with_connector(service_fn(move |_: Uri| {
                let path = Arc::clone(&test_name);
                async move {
                    let path = format!("/tmp/{}_socket", path);
                    // Connect to a Uds socket
                    Ok::<_, std::io::Error>(TokioIo::new(UnixStream::connect(path).await?))
                }
            }))
            .await
            .unwrap();
        let mut client = AppArmorPromptingClient::new(channel);

        tokio::spawn(async move {
            Server::builder()
                .add_service(server)
                .serve_with_incoming(incoming)
                .await
                .unwrap();
        });

        let resp = client
            .reply_to_prompt(Request::new(PromptReply {
                prompt_id: "foo".to_string(),
                action: Action::Allow as i32,
                lifespan: Lifespan::Single as i32,
                prompt_reply: if map_prompt_reply_err {
                    None
                } else {
                    Some(HomePromptReply(apparmor_prompting::HomePromptReply {
                        path_pattern: "foo".to_string(),
                        permissions: Vec::new(),
                    }))
                },
            }))
            .await;

        if want_err {
            assert!(matches!(resp, Err(_)));
            return;
        }

        if snapd_err {
            assert_eq!(
                resp.unwrap().into_inner().prompt_reply_type,
                PromptReplyType::Unknown as i32
            )
        }
    }
}
