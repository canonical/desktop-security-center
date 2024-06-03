//! Integration tests against a running snapd supporting apparmor-prompting
//!
//! These tests are written to interact with the system's running snapd process with
//! the apparmor-prompting feature enabled inside of a VM that has been set up using
//! the Makefile targets outlined in the README of this repo.
use aa_prompt_client::{
    snapd_client::{Action, Lifespan, SnapdSocketClient},
    Result,
};
use serial_test::serial;
use simple_test_case::test_case;
use std::{
    fs,
    io::{self, ErrorKind},
    sync::mpsc::{channel, Receiver},
};
use tokio::{process::Command, spawn};
use uuid::Uuid;

const TEST_SNAP: &str = "aa-prompting-test";

#[derive(Debug, Clone, PartialEq, Eq)]
struct Output {
    stdout: String,
    stderr: String,
}

fn spawn_for_output(cmd: &'static str, args: Vec<String>) -> Receiver<Output> {
    let (tx, rx) = channel();

    spawn(async move {
        let mut c = Command::new(cmd);
        c.args(args);
        let output = c.output().await.expect("to be able to spawn child process");
        let stdout = String::from_utf8(output.stdout).expect("valid utf8");
        let stderr = String::from_utf8(output.stderr).expect("valid utf8");

        tx.send(Output { stdout, stderr }).expect("send to succeed");
    });

    rx
}

fn setup_test_dir(subdir: Option<&str>, files: &[(&str, &str)]) -> io::Result<(String, String)> {
    let prefix = Uuid::new_v4().to_string();
    let path = match subdir {
        Some(s) => format!("/home/ubuntu/test/{prefix}/{s}"),
        None => format!("/home/ubuntu/test/{prefix}"),
    };

    fs::create_dir_all(&path)?;
    for (fname, contents) in files {
        fs::write(format!("{path}/{fname}"), contents)?;
    }

    Ok((prefix, path))
}

#[test_case(Action::Allow, "testing testing 1 2 3\n", ""; "allow")]
#[test_case(Action::Deny, "", "cat: /home/ubuntu/test/<PATH>/test.txt: Permission denied\n"; "deny")]
#[tokio::test]
#[serial]
async fn happy_path_read_single(
    action: Action,
    expected_stdout: &str,
    expected_stderr: &str,
) -> Result<()> {
    // Creating the client before spawning the test snap so that our polling `after`
    // is correct to pick up the prompt.
    let mut c = SnapdSocketClient::default();
    let (prefix, dir_path) = setup_test_dir(None, &[("test.txt", expected_stdout)])?;

    let rx = spawn_for_output("aa-prompting-test.read", vec![prefix.clone()]);

    let pending = c.pending_prompts().await?;
    assert_eq!(pending.len(), 1, "expected a single prompt");

    let id = &pending[0];
    let p = c.prompt_details(id).await?;

    assert_eq!(p.snap(), TEST_SNAP);
    assert_eq!(p.path(), format!("{dir_path}/test.txt"));
    assert_eq!(p.requested_permissions(), &["read"]);

    let reply = p.simple_reply(action, Lifespan::Single);
    c.reply_to_prompt(id, reply).await?;

    let output = rx.recv().expect("to be able recv");
    assert_eq!(output.stdout, expected_stdout, "stdout");
    assert_eq!(
        output.stderr,
        expected_stderr.replace("<PATH>", &prefix),
        "stderr"
    );

    Ok(())
}

#[test_case(Action::Allow; "allow")]
#[test_case(Action::Deny; "deny")]
#[tokio::test]
#[serial]
async fn happy_path_create_multiple(action: Action) -> Result<()> {
    // Creating the client before spawning the test snap so that our polling `after`
    // is correct to pick up the prompt.
    let mut c = SnapdSocketClient::default();
    println!("setup test dir");
    let (prefix, dir_path) = setup_test_dir(None, &[])?;

    println!("spawn test snap");
    let _rx = spawn_for_output("aa-prompting-test.create", vec![prefix]);

    println!("await prompts");
    let pending = c.pending_prompts().await?;
    assert_eq!(pending.len(), 1, "expected a single prompt");

    let id = &pending[0];
    println!("await prompt details");
    let p = c.prompt_details(id).await?;

    let files = &[
        ("test-1.txt", "test\n"),
        ("test-2.txt", "test\n"),
        ("test-3.txt", "test\n"),
    ];

    // The prompt should be for the first write we are attempting
    assert_eq!(p.snap(), TEST_SNAP);
    assert_eq!(p.path(), format!("{dir_path}/test-1.txt"));
    assert_eq!(p.requested_permissions(), &["write"]);

    println!("reply");
    let reply = p.build_reply(
        action,
        Lifespan::Timespan,
        Some("1s"),
        Some(format!("{dir_path}/*")),
        None,
    );
    c.reply_to_prompt(id, reply).await?;

    println!("wait for test snap to exit");
    // We're just using the recv to wait for the test snap to finish running
    // so we don't care about the output
    // FIXME: work out why this hangs even when the test snap has output
    // _ = rx.recv().expect("to be able recv");
    tokio::time::sleep(std::time::Duration::from_millis(200)).await;

    println!("check files");
    for (p, s) in files {
        let res = fs::read_to_string(format!("{dir_path}/{p}"));
        match action {
            Action::Allow => assert_eq!(res.expect("file should exist"), *s),
            Action::Deny => assert_eq!(
                res.expect_err("file should not exist").kind(),
                ErrorKind::NotFound
            ),
        }
    }

    Ok(())
}
