use crate::{
    snapd_client::{Action, Prompt, PromptId, PromptReply, SnapdSocketClient},
    Error, Result, SNAP_NAME,
};
use serde::{Deserialize, Serialize};
use std::{fs, process::exit};
use tokio::{select, signal::ctrl_c};
use tracing::info;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(tag = "kind", rename_all = "lowercase")]
pub enum Event {
    Prompt { data: Prompt },
    Reply { data: PromptReply },
    Error { data: String },
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PromptRecording {
    #[serde(skip)]
    path: Option<String>,
    #[serde(skip)]
    version: u8, // currently only v1
    events: Vec<Event>,
}

impl PromptRecording {
    pub fn new(path: Option<String>) -> Self {
        if let Some(output_file) = &path {
            info!(%output_file, "recording enabled");
        }

        Self {
            version: 1,
            events: Vec::new(),
            path,
        }
    }

    #[allow(dead_code)]
    pub fn validate(&self) -> Result<()> {
        if self.version != 1 {
            return Err(Error::InvalidRecordingVersion {
                version: self.version,
            });
        }

        Ok(())
    }

    pub fn is_recording(&self) -> bool {
        self.path.is_some()
    }

    pub fn is_empty(&self) -> bool {
        self.events.is_empty()
    }

    pub fn push_prompt(&mut self, p: &Prompt) {
        if self.is_recording() {
            self.events.push(Event::Prompt { data: p.clone() })
        }
    }

    pub fn push_reply(&mut self, r: &PromptReply) {
        if self.is_recording() {
            self.events.push(Event::Reply { data: r.clone() })
        }
    }

    pub fn push_error(&mut self, err: &Error) {
        if self.is_recording() {
            self.events.push(Event::Error {
                data: err.to_string(),
            })
        }
    }

    pub async fn await_pending_handling_ctrl_c(
        &self,
        c: &mut SnapdSocketClient,
    ) -> Result<Vec<PromptId>> {
        select! {
            res = c.pending_prompts() => res,
            _ = ctrl_c() => {
                info!("got ctrl-c");
                if self.is_recording() && !self.is_empty() {
                    let path = self.path.clone().unwrap();
                    let rec = self.clone();

                    info!(n=%rec.events.len(), %path, "writing events to file");
                    tokio::task::spawn(async move {
                        fs::write(path, serde_json::to_string(&rec).unwrap()).unwrap();
                    });

                    Ok(Vec::new())
                } else {
                    exit(0);
                }

            }
        }
    }

    pub fn is_prompt_for_writing_output(&self, p: &Prompt) -> bool {
        // TODO: better handling of checking the structure of the prompt we are looking for
        p.snap() == SNAP_NAME
    }

    pub async fn allow_write(&self, p: Prompt, c: &SnapdSocketClient) -> Result<()> {
        let id = p.id.clone();
        let reply = p
            .into_reply(Action::Allow)
            .for_forever()
            .try_with_custom_permissions(vec!["read".to_string(), "write".to_string()])?;

        info!("auto-replying to our own prompt for creating output file");
        c.reply_to_prompt(&id, reply).await
    }
}
