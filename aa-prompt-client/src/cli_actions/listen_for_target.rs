use crate::{
    snapd_client::{Action, Lifespan, SnapdSocketClient},
    Result,
};
use tracing::{debug, info};

pub async fn listen_for_target(
    mut c: SnapdSocketClient,
    snap: String,
    requested: Option<String>,
    action: Action,
    lifespan: Lifespan,
    duration: Option<String>,
    path: Option<String>,
) -> Result<()> {
    info!("beginning polling for prompts");
    loop {
        debug!("waiting for notices");
        let pending = c.pending_prompts().await?;
        debug!(?pending, "processing notices");
        for id in pending.iter() {
            debug!(?id, "pulling prompt details from snapd");
            let p = c.prompt_details(id).await?;
            if p.snap() != snap {
                debug!(target=%snap, prompt_snap=%p.snap(),"ignoring prompt: wrong snap");
                continue;
            }
            if let Some(path) = &requested {
                if p.path() != path {
                    debug!(target=%path, prompt_path=%p.path(),"ignoring prompt: wrong path");
                    continue;
                }
            }

            info!(?id, "got target prompt");
            let mut reply = p.into_reply(action);
            reply = match lifespan {
                Lifespan::Single => reply,
                Lifespan::Session => reply.for_session(),
                Lifespan::Forever => reply.for_forever(),
                Lifespan::Timespan => reply.for_timespan(duration.unwrap()),
            };

            if let Some(path) = path {
                reply = reply.with_custom_path_pattern(path);
            }

            info!(?id, ?reply, "replying to prompt");
            c.reply_to_prompt(id, reply).await?;

            return Ok(());
        }
    }
}
