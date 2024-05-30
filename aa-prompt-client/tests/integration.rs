//! Integration tests against a running snapd supporting apparmor-prompting
use aa_prompt_client::{
    snapd_client::{Action, Lifespan, SnapdSocketClient},
    Result,
};
use simple_test_case::test_case;
use std::sync::mpsc::{channel, Receiver};
use tokio::{process::Command, spawn};

const TEST_SNAP: &str = "aa-prompting-test";

fn spawn_for_output(cmd: &'static str) -> Receiver<String> {
    let (tx, rx) = channel();
    spawn(async move {
        let mut c = Command::new(cmd);
        let output = c.output().await.expect("to be able to spawn child process");
        let s = String::from_utf8(output.stdout).expect("valid utf8");

        tx.send(s).expect("send to succeed");
    });

    rx
}

#[test_case(Action::Allow, "testing testing 1 2 3"; "allow")]
#[test_case(Action::Deny, "cat: /home/ubuntu/readme.txt: Permission denied"; "deny")]
#[tokio::test]
async fn happy_path_read(action: Action, expected: &str) -> Result<()> {
    // TODO: ensure that test file is present
    let path = "/home/ubuntu/readme.txt";

    // Creating the client before spawning the test snap so that our polling `after`
    // is correct to pick up the read prompt.
    let mut c = SnapdSocketClient::default();

    let rx = spawn_for_output("aa-prompting-test.read");

    let pending = c.pending_prompts().await?;
    assert_eq!(pending.len(), 1, "expected a single prompt");

    let id = &pending[0];
    let p = c.prompt_details(id).await?;

    assert_eq!(p.snap(), TEST_SNAP);
    assert_eq!(p.path(), path);
    assert_eq!(p.requested_permissions(), &["read"]);

    let reply = p.simple_reply(action, Lifespan::Single);
    c.reply_to_prompt(id, reply).await?;

    let output = rx.recv().expect("to be able recv");
    assert_eq!(output, expected);

    Ok(())
}
