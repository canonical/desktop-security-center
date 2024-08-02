//! The GRPC server that handles incoming connections from client UIs.
use crate::{
    daemon::{worker::ReadOnlyActivePrompt, ActionedPrompt},
    protos::{
        apparmor_prompting::{
            self, get_current_prompt_response::Prompt, home_prompt::PatternOption,
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
    Error, NO_PROMPTS_FOR_USER, PROMPT_NOT_FOUND,
};
use tokio::{net::UnixListener, sync::mpsc::UnboundedSender};
use tonic::{async_trait, Code, Request, Response, Status};
use tracing::{info, warn};

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
    async fn reply(&self, id: &PromptId, reply: TypedPromptReply) -> crate::Result<Vec<PromptId>>;
}

#[async_trait]
impl ReplyToPrompt for SnapdSocketClient {
    async fn reply(&self, id: &PromptId, reply: TypedPromptReply) -> crate::Result<Vec<PromptId>> {
        self.reply_to_prompt(id, reply).await
    }
}

pub fn new_server_and_listener<T: ReplyToPrompt + Clone>(
    client: T,
    active_prompt: ReadOnlyActivePrompt,
    tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
    socket_path: String,
) -> (AppArmorPromptingServer<Service<T>>, UnixListener) {
    let service = Service::new(client.clone(), active_prompt, tx_actioned_prompts);
    let listener = UnixListener::bind(&socket_path).expect("to be able to bind to our socket");

    (AppArmorPromptingServer::new(service), listener)
}

pub struct Service<T: ReplyToPrompt> {
    client: T,
    active_prompt: ReadOnlyActivePrompt,
    tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
}

impl<T: ReplyToPrompt> Service<T> {
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
impl<T: ReplyToPrompt> AppArmorPrompting for Service<T> {
    async fn get_current_prompt(
        &self,
        _request: Request<()>,
    ) -> Result<Response<GetCurrentPromptResponse>, Status> {
        let prompt = match self.active_prompt.get() {
            Some(TypedUiInput::Home(input)) => {
                let id = &input.id.0;
                info!(%id, "serving request for active prompt (id={id})");
                Some(map_home_response(input))
            }

            None => {
                warn!("got request for current prompt but there is no active prompt");
                None
            }
        };

        Ok(Response::new(GetCurrentPromptResponse { prompt }))
    }

    async fn reply_to_prompt(
        &self,
        request: Request<PromptReply>,
    ) -> Result<Response<PromptReplyResponse>, Status> {
        let req = request.into_inner();
        let reply = map_prompt_reply(req.clone())?;
        let id = PromptId(req.prompt_id.clone());

        info!(id=%id.0, "replying to prompt id={}", id.0);
        let resp = match self.client.reply(&id, reply).await {
            Ok(others) => {
                if let Err(e) = self.tx_actioned_prompts.send(ActionedPrompt { id, others }) {
                    panic!("send on closed tx_actioned_prompts channel: {e}");
                }

                PromptReplyResponse {
                    prompt_reply_type: PromptReplyType::Success as i32,
                    message: "success".to_string(),
                }
            }

            Err(Error::SnapdError { message })
                if [NO_PROMPTS_FOR_USER, PROMPT_NOT_FOUND].contains(&message.as_ref()) =>
            {
                warn!(id=%id.0, "prompt not found (id={})", id.0);
                PromptReplyResponse {
                    prompt_reply_type: PromptReplyType::PromptNotFound as i32,
                    message: "prompt not found".to_string(),
                }
            }

            Err(e) => {
                warn!(id=%id.0, "got error from snapd when replying to prompt (id={}): {e}", id.0);
                PromptReplyResponse {
                    prompt_reply_type: PromptReplyType::Unknown as i32,
                    message: e.to_string(),
                }
            }
        };

        Ok(Response::new(resp))
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
                available_permissions: Vec::new(),
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
        initial_permissions: input.data.initial_permissions,
        available_permissions: input.data.available_permissions,
        initial_pattern_option: input.data.initial_pattern_option as i32,
        pattern_options: input
            .data
            .pattern_options
            .into_iter()
            .map(
                |TypedPathPattern {
                     pattern_type,
                     path_pattern,
                     show_initially,
                 }| {
                    let home_pattern_type = map_enum!(
                        PatternType => HomePatternType;
                        [
                            RequestedDirectory, RequestedFile, TopLevelDirectory,
                            HomeDirectory, MatchingFileExtension, ContainingDirectory
                        ];
                        pattern_type;
                    );

                    PatternOption {
                        home_pattern_type: home_pattern_type as i32,
                        path_pattern,
                        show_initially,
                    }
                },
            )
            .collect(),
    })
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::{
        daemon::worker::ReadOnlyActivePrompt,
        protos::apparmor_prompting::{
            app_armor_prompting_client::AppArmorPromptingClient, prompt_reply, Action, Lifespan,
        },
        snapd_client::{interfaces::home::HomeUiInputData, PromptId, SnapMeta, TypedPromptReply},
        Error,
    };
    use hyper_util::rt::TokioIo;
    use simple_test_case::test_case;
    use std::{
        fs, io,
        ops::{Deref, DerefMut},
    };
    use tokio::{
        net::UnixStream,
        sync::mpsc::{unbounded_channel, UnboundedSender},
    };
    use tokio_stream::wrappers::UnixListenerStream;
    use tonic::{
        async_trait,
        transport::{Channel, Endpoint, Server, Uri},
        Request,
    };
    use tower::service_fn;
    use uuid::Uuid;

    #[derive(Clone)]
    struct MockClient {
        want_err: bool,
        expected_reply: Option<TypedPromptReply>,
    }

    #[async_trait]
    impl ReplyToPrompt for MockClient {
        async fn reply(
            &self,
            _id: &PromptId,
            reply: TypedPromptReply,
        ) -> crate::Result<Vec<PromptId>> {
            if self.want_err {
                return Err(Error::Io(io::Error::new(
                    io::ErrorKind::Other,
                    "error requested of mock snapd client",
                )));
            }
            if let Some(expected_reply) = self.expected_reply.clone() {
                match (reply, expected_reply) {
                    (TypedPromptReply::Home(reply), TypedPromptReply::Home(expected_reply)) => {
                        assert_eq!(reply, expected_reply, "Replies did not match");
                    }
                }
            }

            Ok(Vec::new())
        }
    }

    // Ensure that our test sockets get cleaned up when the client is dropped
    #[derive(Debug)]
    struct SelfCleaningClient {
        inner: AppArmorPromptingClient<Channel>,
        socket_path: String,
    }

    impl Drop for SelfCleaningClient {
        fn drop(&mut self) {
            let _ = fs::remove_file(&self.socket_path);
        }
    }

    impl Deref for SelfCleaningClient {
        type Target = AppArmorPromptingClient<Channel>;

        fn deref(&self) -> &Self::Target {
            &self.inner
        }
    }

    impl DerefMut for SelfCleaningClient {
        fn deref_mut(&mut self) -> &mut Self::Target {
            &mut self.inner
        }
    }

    async fn setup_server_and_client(
        mock_client: MockClient,
        active_prompt: ReadOnlyActivePrompt,
        tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
    ) -> SelfCleaningClient {
        let test_name = Uuid::new_v4().to_string();
        let socket_path = format!("/tmp/{test_name}_socket");
        let _ = fs::remove_file(&socket_path); // Remove the old socket file if it exists

        let (server, listener) = new_server_and_listener(
            mock_client,
            active_prompt,
            tx_actioned_prompts,
            socket_path.clone(),
        );

        tokio::spawn(async move {
            Server::builder()
                .add_service(server)
                .serve_with_incoming(UnixListenerStream::new(listener))
                .await
                .unwrap();
        });

        let path = socket_path.clone();
        // No choice but to do this https://github.com/hyperium/tonic/blob/master/examples/src/uds/client.rs
        let channel = Endpoint::from_static("https://not-used.com")
            .connect_with_connector(service_fn(move |_: Uri| {
                let path = path.clone();
                async { Ok::<_, io::Error>(TokioIo::new(UnixStream::connect(path).await?)) }
            }))
            .await
            .unwrap();

        SelfCleaningClient {
            inner: AppArmorPromptingClient::new(channel),
            socket_path,
        }
    }

    fn ui_input() -> TypedUiInput {
        TypedUiInput::Home(UiInput::<HomeInterface> {
            id: PromptId("1".to_string()),
            meta: SnapMeta {
                name: "2".to_string(),
                updated_at: "3".to_string(),
                store_url: "4".to_string(),
                publisher: "5".to_string(),
            },
            data: HomeUiInputData {
                requested_path: "6".to_string(),
                requested_permissions: Vec::new(),
                available_permissions: Vec::new(),
                initial_permissions: Vec::new(),
                pattern_options: Vec::new(),
                initial_pattern_option: 0,
            },
        })
    }

    fn prompt() -> Prompt {
        Prompt::HomePrompt(HomePrompt {
            meta_data: Some(MetaData {
                prompt_id: "1".to_string(),
                snap_name: "2".to_string(),
                store_url: "4".to_string(),
                publisher: "5".to_string(),
                updated_at: "3".to_string(),
            }),
            requested_path: "6".to_string(),
            requested_permissions: Vec::new(),
            available_permissions: Vec::new(),
            initial_permissions: Vec::new(),
            pattern_options: Vec::new(),
            initial_pattern_option: 0,
        })
    }

    fn prompt_reply(prompt_reply_inner: Option<prompt_reply::PromptReply>) -> PromptReply {
        PromptReply {
            prompt_id: "1".to_string(),
            action: Action::Allow as i32,
            lifespan: Lifespan::Single as i32,
            prompt_reply: prompt_reply_inner,
        }
    }

    fn prompt_reply_inner() -> Option<prompt_reply::PromptReply> {
        Some(HomePromptReply(apparmor_prompting::HomePromptReply {
            path_pattern: "6".to_string(),
            permissions: Vec::new(),
        }))
    }

    fn typed_prompt_reply() -> TypedPromptReply {
        TypedPromptReply::Home(SnapPromptReply::<HomeInterface> {
            action: snapd_client::Action::Allow,
            lifespan: snapd_client::Lifespan::Single,
            duration: None,
            constraints: HomeReplyConstraints {
                path_pattern: "6".to_string(),
                permissions: Vec::new(),
                available_permissions: Vec::new(),
            },
        })
    }

    struct ExpectedErrors {
        snapd_err: bool,
        tx_err: bool,
        want_err: bool,
    }

    #[test_case(None, None; "empty prompt")]
    #[test_case(Some(ui_input()), Some(prompt()); "non-empty prompt")]
    #[tokio::test]
    async fn test_get_current_prompt(ui_input: Option<TypedUiInput>, expected: Option<Prompt>) {
        // Test setup
        let mock_client = MockClient {
            want_err: false,
            expected_reply: None,
        };
        let (tx_actioned_prompts, _rx_actioned_prompts) = unbounded_channel();
        let active_prompt = ReadOnlyActivePrompt::new(ui_input);
        let mut client =
            setup_server_and_client(mock_client, active_prompt, tx_actioned_prompts).await;

        // Run test
        let resp = client
            .get_current_prompt(Request::new(()))
            .await
            .unwrap()
            .into_inner()
            .prompt;

        // Check output
        assert_eq!(resp, expected);
    }

    // TODO(matt): include diff (see notes) and add to logic / tests
    #[test_case(prompt_reply(None), ExpectedErrors{snapd_err: false, tx_err: false, want_err: true}; "Error when map_prompt_reply fails")]
    #[test_case(prompt_reply(prompt_reply_inner()), ExpectedErrors{snapd_err: true, tx_err: false, want_err: false}; "Returns unknown error code when snapd returns an error")]
    #[test_case(prompt_reply(prompt_reply_inner()), ExpectedErrors{snapd_err: false, tx_err: true, want_err: true}; "Error when returning actioned prompts returns an error")]
    #[test_case(prompt_reply(prompt_reply_inner()), ExpectedErrors{snapd_err: false, tx_err: false, want_err: false}; "Succesfully reply to a prompt")]
    #[tokio::test]
    async fn test_reply_to_prompt(prompt_reply: PromptReply, expected_errors: ExpectedErrors) {
        // Test setup
        let mock_client = MockClient {
            want_err: expected_errors.snapd_err,
            expected_reply: Some(typed_prompt_reply()),
        };
        let (tx_actioned_prompts, rx_actioned_prompts) = unbounded_channel();
        let mut rx_actioned_prompts = Some(rx_actioned_prompts);
        if expected_errors.tx_err {
            rx_actioned_prompts = None;
        }
        let active_prompt = ReadOnlyActivePrompt::new(None);
        let mut client =
            setup_server_and_client(mock_client, active_prompt, tx_actioned_prompts).await;

        // Run the test
        let resp = client.reply_to_prompt(Request::new(prompt_reply)).await;

        // Check test output
        if expected_errors.want_err {
            assert!(resp.is_err());
            return;
        }
        if expected_errors.snapd_err {
            assert_eq!(
                resp.unwrap().into_inner().prompt_reply_type,
                PromptReplyType::Unknown as i32
            );
            return;
        }
        assert_eq!(
            resp.unwrap().into_inner().prompt_reply_type,
            PromptReplyType::Success as i32
        );
        if let Some(mut rx) = rx_actioned_prompts {
            let received_prompt_id = rx.recv().await.unwrap();
            assert_eq!(received_prompt_id.id.0, "1".to_string());
        }
    }
}
