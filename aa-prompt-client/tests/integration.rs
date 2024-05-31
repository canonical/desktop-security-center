//! Integration tests against a running snapd supporting apparmor-prompting
//!
//! These tests are written to interact with the system's running snapd process with
//! the apparmor-prompting feature enabled.
use aa_prompt_client::{
    snapd_client::{Action, Lifespan, SnapdSocketClient},
    Result,
};
use simple_test_case::test_case;
use std::{
    fs,
    sync::mpsc::{channel, Receiver},
};
use tokio::{process::Command, spawn};

const TEST_SNAP: &str = "aa-prompting-test";

#[derive(Debug, Clone, PartialEq, Eq)]
struct Output {
    stdout: String,
    stderr: String,
}

fn spawn_for_output(cmd: &'static str) -> Receiver<Output> {
    let (tx, rx) = channel();

    spawn(async move {
        let mut c = Command::new(cmd);
        let output = c.output().await.expect("to be able to spawn child process");
        let stdout = String::from_utf8(output.stdout).expect("valid utf8");
        let stderr = String::from_utf8(output.stderr).expect("valid utf8");

        tx.send(Output { stdout, stderr }).expect("send to succeed");
    });

    rx
}

#[test_case(Action::Allow, "testing testing 1 2 3\n", ""; "allow")]
#[test_case(Action::Deny, "", "cat: /home/ubuntu/readme.txt: Permission denied\n"; "deny")]
#[tokio::test]
async fn happy_path_read_single(
    action: Action,
    expected_stdout: &str,
    expected_stderr: &str,
) -> Result<()> {
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
    assert_eq!(output.stdout, expected_stdout, "stdout");
    assert_eq!(output.stderr, expected_stderr, "stderr");

    Ok(())
}

#[test_case(Action::Allow; "allow")]
#[test_case(Action::Deny; "deny")]
#[tokio::test]
async fn happy_path_create_multiple(action: Action) -> Result<()> {
    let path_1 = "/home/ubuntu/top-levl-1.txt";
    let path_2 = "/home/ubuntu/top-levl-2.txt";
    let path_3 = "/home/ubuntu/top-levl-3.txt";

    for p in &[path_1, path_2, path_3] {
        _ = fs::remove_file(p); // Ignoring any errors around missing files
    }

    // Creating the client before spawning the test snap so that our polling `after`
    // is correct to pick up the read prompt.
    let mut c = SnapdSocketClient::default();

    spawn_for_output("aa-prompting-test.create");

    let pending = c.pending_prompts().await?;
    assert_eq!(pending.len(), 1, "expected a single prompt");

    let id = &pending[0];
    let p = c.prompt_details(id).await?;

    // The prompt should be for the first write we are attempting
    assert_eq!(p.snap(), TEST_SNAP);
    assert_eq!(p.path(), path_1);
    assert_eq!(p.requested_permissions(), &["write"]);

    let reply = p.build_reply(
        action,
        Lifespan::Timespan,
        Some("5s"),
        Some("/home/ubuntu/*"),
        None,
    );
    c.reply_to_prompt(id, reply).await?;

    // Our reply should have allowed the creation and writing to all three files
    for p in &[path_1, path_2, path_3] {
        if let Err(e) = fs::read_to_string(p) {
            panic!("unable to read {p}: {e}");
        };
    }

    Ok(())
}
