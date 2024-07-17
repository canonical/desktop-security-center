use crate::{
    prompt_sequence::PromptFilter,
    snapd_client::{
        interfaces::{
            home::{HomeConstraintsFilter, HomeInterface},
            SnapInterface,
        },
        Action, Prompt, PromptId, SnapdSocketClient, TypedPrompt, TypedPromptReply,
    },
    Error, Result, SNAP_NAME,
};
use serde::{Deserialize, Serialize};
use std::{fs, process::exit};
use tokio::{select, signal::ctrl_c};
use tracing::info;

#[derive(Debug, Clone, Serialize, Deserialize)]
#[serde(tag = "kind", rename_all = "camelCase")]
pub enum Event {
    Prompt { data: TypedPrompt },
    UiInput { data: serde_json::Value },
    Reply { data: TypedPromptReply },
    Error { data: String },
}

#[derive(Debug, Clone, Serialize, Deserialize)]
pub struct PromptRecording {
    #[serde(skip)]
    version: u8, // currently only v1
    #[serde(skip)]
    path: Option<String>,
    #[serde(skip)]
    filter: Option<PromptFilter<HomeInterface>>,
    events: Vec<Event>,
}

impl PromptRecording {
    pub fn new(path: Option<String>) -> Self {
        let filter = path.clone().map(|output_file| {
            info!(%output_file, "recording enabled");
            let mut filter = PromptFilter::default();
            let mut constraints = HomeConstraintsFilter::default();
            constraints
                .try_with_path(format!(".*/{output_file}"))
                .expect("valid regex");
            filter
                .with_snap(SNAP_NAME)
                .with_interface("home")
                .with_constraints(constraints);

            filter
        });

        Self {
            version: 1,
            events: Vec::new(),
            filter,
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

    pub fn push_prompt(&mut self, p: &TypedPrompt) {
        if self.is_recording() {
            self.events.push(Event::Prompt { data: p.clone() })
        }
    }

    pub fn push_ui_input(&mut self, data: serde_json::Value) {
        if self.is_recording() {
            self.events.push(Event::UiInput { data });
        }
    }

    pub fn push_reply(&mut self, r: &TypedPromptReply) {
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
                        exit(0);
                    });

                    Ok(Vec::new())
                } else {
                    exit(0);
                }

            }
        }
    }

    pub fn is_prompt_for_writing_output(&self, p: &Prompt<HomeInterface>) -> bool {
        match self.filter.as_ref() {
            Some(f) => f.matches(p).is_success(),
            None => false,
        }
    }

    pub async fn allow_write(&self, p: Prompt<HomeInterface>, c: &SnapdSocketClient) -> Result<()> {
        let id = p.id.clone();
        let reply = HomeInterface::prompt_to_reply(p, Action::Allow)
            .for_timespan("10s") // Using a timespan so our rule auto-removes
            .try_with_custom_permissions(vec!["read".to_string(), "write".to_string()])?
            .into();

        info!("auto-replying to our own prompt for creating output file");
        c.reply_to_prompt(&id, reply).await?;

        Ok(())
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    const SELF_WRITE_PROMPT: &str = r#"{
        "id": "C7PLOQW54HGFM===",
        "timestamp": "2024-07-03T13:33:25.52039535Z",
        "snap": "apparmor-prompting",
        "interface": "home",
        "constraints": {
          "path": "/home/ubuntu/test.json",
          "permissions": [
            "write"
          ],
          "available-permissions": [
            "read",
            "write",
            "execute"
          ]
        }
      }"#;

    #[test]
    fn is_prompt_for_writing_output_works() {
        let rec = PromptRecording::new(Some("test.json".to_string()));
        let prompt: Prompt<HomeInterface> = serde_json::from_str(SELF_WRITE_PROMPT).unwrap();

        assert!(rec.is_prompt_for_writing_output(&prompt));
    }
}
