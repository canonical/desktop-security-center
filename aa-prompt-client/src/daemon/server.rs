//! The GRPC server that handles incoming connections from client UIs.
use crate::{
    daemon::{worker::ReadOnlyActivePrompt, ActionedPrompt},
    protos::{
        apparmor_prompting::{
            get_current_prompt_response::Prompt, home_prompt::MoreOption,
            prompt_reply::PromptReply::HomePromptReply, prompt_reply_response::PromptReplyType,
            HomePatternType, MetaData, PromptReply,
        },
        AppArmorPrompting, AppArmorPromptingServer, GetCurrentPromptResponse, HomePrompt,
        PromptReplyResponse, ResolveHomePatternTypeResponse,
    },
    snapd_client::{
        interfaces::home::{HomeInterface, HomeReplyConstraints, PatternType, TypedPathPattern},
        PromptId, PromptReply as SnapPromptReply, SnapdSocketClient, TypedPromptReply,
        TypedUiInput, UiInput,
    },
};
use std::{env, fs};
use tokio::{net::UnixListener, sync::mpsc::UnboundedSender};
use tonic::{async_trait, Code, Request, Response, Status};

macro_rules! map_enum {
    ($val:expr => $name:ident; [$($variant:ident),+]) => {
        match $val {
            $(
                $crate::protos::apparmor_prompting::$name::$variant =>
                    $crate::snapd_client::$name::$variant,
            )+
        }
    }
}

pub fn new_server_and_listener(
    client: SnapdSocketClient,
    active_prompt: ReadOnlyActivePrompt,
    tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
) -> (AppArmorPromptingServer<Service>, UnixListener) {
    let service = Service::new(client.clone(), active_prompt, tx_actioned_prompts);
    let snap_dir = env::var("SNAP").expect("SNAP env var to be set");
    let path = format!("{}/apparmor-prompting.sock", snap_dir);
    let _ = fs::remove_file(&path); // Remove the old socket file if it exists
    let listener = UnixListener::bind(&path).expect("to be able to bind to our socket");

    (AppArmorPromptingServer::new(service), listener)
}

pub struct Service {
    client: SnapdSocketClient,
    active_prompt: ReadOnlyActivePrompt,
    tx_actioned_prompts: UnboundedSender<ActionedPrompt>,
}

impl Service {
    pub fn new(
        client: SnapdSocketClient,
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
impl AppArmorPrompting for Service {
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
        let others = match self.client.reply_to_prompt(&id, reply).await {
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
        action: map_enum!(reply.action() => Action; [Allow, Deny]),
        lifespan: map_enum!(reply.lifespan() => Lifespan; [Single, Session, Forever]),
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
            store_url: input.meta.store_url.unwrap_or_default(),
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
                    let home_pattern_type = match pattern_type {
                        PatternType::RequestedDirectory => HomePatternType::RequestedDirectory,
                        PatternType::RequestedFile => HomePatternType::RequestedFile,
                        PatternType::TopLevelDirectory => HomePatternType::TopLevelDirectory,
                        PatternType::HomeDirectory => HomePatternType::HomeDirectory,
                        PatternType::MatchingFileExtension => {
                            HomePatternType::MatchingFileExtension
                        }
                        PatternType::ArchiveFiles => HomePatternType::ArchiveFiles,
                        PatternType::AudioFiles => HomePatternType::AudioFiles,
                        PatternType::DocumentFiles => HomePatternType::DocumentFiles,
                        PatternType::ImageFiles => HomePatternType::ImageFiles,
                        PatternType::VideoFiles => HomePatternType::VideoFiles,
                    };
                    MoreOption {
                        home_pattern_type: home_pattern_type as i32,
                        path_pattern,
                    }
                },
            )
            .collect(),
    })
}
