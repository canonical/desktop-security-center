//! Integration tests against a running snapd supporting apparmor-prompting
//!
//! These tests are written to interact with the system's running snapd process with the
//! apparmor-prompting feature enabled inside of a VM that has been set up using the Makefile
//! targets outlined in the README of this repo.
//!
//! Creation of the SnapdSocketClient needs to be handled before spawning the test snap so that
//! polling `after` is correct to pick up the prompt.
use aa_prompt_client::{
    cli_actions::run_scripted_client_loop,
    prompt_sequence::MatchError,
    snapd_client::{
        interfaces::{home::HomeInterface, SnapInterface},
        Action, Lifespan, PromptId, SnapdSocketClient, TypedPrompt,
    },
    Error, Result,
};
use serial_test::serial;
use simple_test_case::test_case;
use std::{
    env, fs,
    io::{self, ErrorKind},
    sync::mpsc::{channel, Receiver},
};
use tokio::{process::Command, spawn};
use uuid::Uuid;

const TEST_SNAP: &str = "aa-prompting-test";
const PROMPT_NOT_FOUND: &str = "no prompt with the given ID found for the given user";

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

fn get_home() -> String {
    env::var("HOME").expect("HOME env var to be set")
}

fn setup_test_dir(subdir: Option<&str>, files: &[(&str, &str)]) -> io::Result<(String, String)> {
    let prefix = Uuid::new_v4().to_string();
    let home = get_home();
    let path = match subdir {
        Some(s) => format!("{home}/test/{prefix}/{s}"),
        None => format!("{home}/test/{prefix}"),
    };

    fs::create_dir_all(&path)?;
    for (fname, contents) in files {
        fs::write(format!("{path}/{fname}"), contents)?;
    }

    Ok((prefix, path))
}

// We have this as a macro rather than a function so that we get the line numbers of the call site
// in test failures rather than the line numbers of the asserts within this helper
macro_rules! expect_single_prompt {
    ($c:expr, $expected_path:expr, $expected_permissions:expr) => {
        async {
            let mut pending = match $c.pending_prompts().await {
                Ok(pending) => pending,
                Err(e) => panic!("error pulling pending prompts: {e}"),
            };
            assert_eq!(pending.len(), 1, "expected a single prompt");

            let id = pending.remove(0);
            let p = match $c.prompt_details(&id).await {
                Ok(TypedPrompt::Home(p)) => p,
                Err(e) => panic!("error pulling prompt details: {e}"),
            };

            assert_eq!(p.snap(), TEST_SNAP);
            assert_eq!(p.path(), $expected_path);
            assert_eq!(p.requested_permissions(), $expected_permissions);

            (id, p)
        }
    };
}

// Included as a test to help with identifying when the VM hasn't been set up correctly
#[tokio::test]
async fn ensure_prompting_is_enabled() -> Result<()> {
    let c = SnapdSocketClient::default();
    assert!(c.is_prompting_enabled().await?, "prompting is not enabled");

    Ok(())
}

#[test_case(Action::Allow, "testing testing 1 2 3\n", ""; "allow")]
#[test_case(Action::Deny, "", "cat: <HOME>/test/<PATH>/test.txt: Permission denied\n"; "deny")]
#[tokio::test]
#[serial]
async fn happy_path_read_single(
    action: Action,
    expected_stdout: &str,
    expected_stderr: &str,
) -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let (prefix, dir_path) = setup_test_dir(None, &[("test.txt", expected_stdout)])?;

    let rx = spawn_for_output("aa-prompting-test.read", vec![prefix.clone()]);
    let (id, p) = expect_single_prompt!(&mut c, &format!("{dir_path}/test.txt"), &["read"]).await;

    c.reply_to_prompt(&id, HomeInterface::prompt_to_reply(p, action).into())
        .await?;
    let output = rx.recv().expect("to be able recv");

    assert_eq!(output.stdout, expected_stdout, "stdout");
    assert_eq!(
        output.stderr,
        expected_stderr
            .replace("<HOME>", &get_home())
            .replace("<PATH>", &prefix),
        "stderr"
    );

    Ok(())
}

#[test_case(Action::Allow, Lifespan::Timespan; "allow timespan")]
#[test_case(Action::Allow, Lifespan::Session; "allow session")]
#[test_case(Action::Allow, Lifespan::Forever; "allow forever")]
#[test_case(Action::Deny, Lifespan::Timespan; "deny timespan")]
#[test_case(Action::Deny, Lifespan::Session; "deny session")]
#[test_case(Action::Deny, Lifespan::Forever; "deny forever")]
#[tokio::test]
#[serial]
async fn happy_path_create_multiple(action: Action, lifespan: Lifespan) -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let (prefix, dir_path) = setup_test_dir(None, &[])?;

    let _rx = spawn_for_output("aa-prompting-test.create", vec![prefix]);
    let path = format!("{dir_path}/test-1.txt");
    let (id, p) = expect_single_prompt!(&mut c, &path, &["write"]).await;
    let mut reply =
        HomeInterface::prompt_to_reply(p, action).with_custom_path_pattern(format!("{dir_path}/*"));

    reply = match lifespan {
        Lifespan::Timespan => reply.for_timespan("1s"),
        Lifespan::Session => reply.for_session(),
        Lifespan::Forever => reply.for_forever(),
        Lifespan::Single => {
            panic!("SETUP ERROR: this test requires actioning multiple prompts with a single reply")
        }
    };

    c.reply_to_prompt(&id, reply.into()).await?;

    // We're just using the recv to wait for the test snap to finish running
    // so we don't care about the output
    // FIXME: work out why this hangs even when the test snap has output
    // _ = rx.recv().expect("to be able recv");
    tokio::time::sleep(std::time::Duration::from_millis(50)).await;

    let files = &[
        ("test-1.txt", "test\n"),
        ("test-2.txt", "test\n"),
        ("test-3.txt", "test\n"),
    ];

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

#[tokio::test]
#[serial]
async fn requesting_an_unknown_prompt_id_is_an_error() -> Result<()> {
    let c = SnapdSocketClient::default();
    let res = c.prompt_details(&PromptId("invalid".to_string())).await;

    match res {
        Err(Error::SnapdError { message }) => {
            assert_eq!(message, PROMPT_NOT_FOUND, "unexpected message")
        }
        Err(e) => panic!("expected a snapd error, got: {e}"),
        Ok(p) => panic!("expected an error, got {p:?}"),
    }

    Ok(())
}

// FIXME: we will want to have these errors returned in a way that allows to present a meaningful
// error message to the user.
#[test_case("not a valid custom path!", "invalid path pattern"; "malformed path")]
#[test_case("/home/bob/*", "constraints in reply do not match original request"; "invalid path")]
#[tokio::test]
#[serial]
async fn incorrect_custom_paths_error(reply_path: &str, expected_prefix: &str) -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let (prefix, dir_path) = setup_test_dir(None, &[("test.txt", "test")])?;

    let _rx = spawn_for_output("aa-prompting-test.read", vec![prefix]);
    let (id, p) = expect_single_prompt!(&mut c, &format!("{dir_path}/test.txt"), &["read"]).await;
    let reply = HomeInterface::prompt_to_reply(p, Action::Allow)
        .with_custom_path_pattern(reply_path)
        .into();

    match c.reply_to_prompt(&id, reply).await {
        Err(Error::SnapdError { message }) => assert!(
            message.starts_with(expected_prefix),
            "message format not as expected: {message}"
        ),
        Err(e) => panic!("expected a snapd error, got: {e}"),
        Ok(_) => panic!("should have errored but got an OK response"),
    }

    Ok(())
}

#[tokio::test]
#[serial]
async fn invalid_timeperiod_duration_errors() -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let (prefix, dir_path) = setup_test_dir(None, &[("test.txt", "test")])?;

    let _rx = spawn_for_output("aa-prompting-test.read", vec![prefix]);
    let (id, p) = expect_single_prompt!(&mut c, &format!("{dir_path}/test.txt"), &["read"]).await;
    let reply = HomeInterface::prompt_to_reply(p, Action::Allow)
        .for_timespan("foo")
        .into();

    match c.reply_to_prompt(&id, reply).await {
        Err(Error::SnapdError { message }) => assert!(
            message.starts_with("error parsing duration string:"),
            "message format not as expected: {message}"
        ),
        Err(e) => panic!("expected a snapd error, got: {e}"),
        Ok(_) => panic!("should have errored but got an OK response"),
    }

    Ok(())
}

#[test_case(Action::Allow, "testing testing 1 2 3\n", ""; "allow")]
#[test_case(Action::Deny, "", "cat: <HOME>/test/<PATH>/test.txt: Permission denied\n"; "deny")]
#[tokio::test]
#[serial]
async fn replying_multiple_times_errors(
    action: Action,
    expected_stdout: &str,
    expected_stderr: &str,
) -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let (prefix, dir_path) = setup_test_dir(None, &[("test.txt", expected_stdout)])?;

    let rx = spawn_for_output("aa-prompting-test.read", vec![prefix.clone()]);
    let (id, p) = expect_single_prompt!(&mut c, &format!("{dir_path}/test.txt"), &["read"]).await;

    // first reply should work fine
    c.reply_to_prompt(
        &id,
        HomeInterface::prompt_to_reply(p.clone(), action).into(),
    )
    .await?;
    let output = rx.recv().expect("to be able recv");

    assert_eq!(output.stdout, expected_stdout, "stdout");
    assert_eq!(
        output.stderr,
        expected_stderr
            .replace("<HOME>", &get_home())
            .replace("<PATH>", &prefix),
        "stderr"
    );

    // second reply should error because the prompt no longer exists in snapd
    let res = c
        .reply_to_prompt(
            &id,
            HomeInterface::prompt_to_reply(p.clone(), action).into(),
        )
        .await;

    match res {
        Err(Error::SnapdError { message }) => {
            assert_eq!(message, PROMPT_NOT_FOUND, "unexpected message")
        }
        Err(e) => panic!("expected a snapd error, got: {e}"),
        Ok(p) => panic!("expected an error, got {p:?}"),
    }

    Ok(())
}

#[tokio::test]
#[serial]
async fn overwriting_a_file_works() -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let (prefix, dir_path) = setup_test_dir(None, &[])?;

    let rx = spawn_for_output(
        "aa-prompting-test.create-single",
        vec![prefix.clone(), "before".to_string()],
    );
    let (id, p) = expect_single_prompt!(&mut c, &format!("{dir_path}/test.txt"), &["write"]).await;

    let reply = HomeInterface::prompt_to_reply(p, Action::Allow)
        .for_forever()
        .into();
    c.reply_to_prompt(&id, reply).await?;
    tokio::time::sleep(std::time::Duration::from_millis(50)).await;

    // The file should have been created and contain the correct content
    let res = fs::read_to_string(format!("{dir_path}/test.txt"));
    assert_eq!(res.expect("file should exist"), "before");

    // Not expecting another prompt due to previous allow always reply
    let _rx = spawn_for_output(
        "aa-prompting-test.create-single",
        vec![prefix, "after".to_string()],
    );
    tokio::time::sleep(std::time::Duration::from_millis(300)).await;
    let output = rx.recv().expect("to be able recv");
    assert_eq!(output.stdout, "done\n");
    assert_eq!(output.stderr, "");

    // The file should now contain the updated content
    let res = fs::read_to_string(format!("{dir_path}/test.txt"));
    assert_eq!(res.expect("file should exist"), "after");

    Ok(())
}

#[tokio::test]
#[serial]
async fn scripted_client_works_with_simple_matching() -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let seq = include_str!("../resources/prompt-sequence-tests/e2e_write_test.json");
    let (prefix, dir_path) = setup_test_dir(None, &[("seq.json", seq)])?;

    let _rx = spawn_for_output("aa-prompting-test.create", vec![prefix]);
    let res = run_scripted_client_loop(&mut c, format!("{dir_path}/seq.json"), None).await;
    tokio::time::sleep(std::time::Duration::from_millis(50)).await;

    if let Err(e) = res {
        panic!("unexpected error running scripted client: {e}");
    }

    let files = &[
        ("test-1.txt", "test\n"),
        ("test-2.txt", "test\n"),
        ("test-3.txt", "test\n"),
    ];

    for (p, s) in files {
        let res = fs::read_to_string(format!("{dir_path}/{p}"));
        assert_eq!(res.expect("file should exist"), *s);
    }

    Ok(())
}

#[tokio::test]
#[serial]
async fn invalid_prompt_sequence_reply_errors() -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let seq = include_str!("../resources/prompt-sequence-tests/e2e_erroring_write_test.json");
    let (prefix, dir_path) = setup_test_dir(None, &[("seq.json", seq)])?;

    spawn_for_output("aa-prompting-test.create", vec![prefix]);
    let res = run_scripted_client_loop(&mut c, format!("{dir_path}/seq.json"), None).await;

    match res {
        Err(Error::FailedPromptSequence {
            error: MatchError::UnexpectedError { error },
        }) => {
            assert!(
                error.starts_with("constraints in reply do not match original request"),
                "{error}"
            );
        }
        Err(e) => panic!("unexpected error: {e}"),
        Ok(()) => panic!("expected client to error but it ran to completion"),
    }

    Ok(())
}

#[tokio::test]
#[serial]
async fn unexpected_prompt_in_sequence_errors() -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let seq = include_str!("../resources/prompt-sequence-tests/e2e_wrong_path_test.json");
    let (prefix, dir_path) = setup_test_dir(None, &[("seq.json", seq)])?;

    spawn_for_output("aa-prompting-test.create", vec![prefix]);
    let res = run_scripted_client_loop(&mut c, format!("{dir_path}/seq.json"), None).await;

    match res {
        Err(Error::FailedPromptSequence {
            error: MatchError::MatchFailures { index, failures },
        }) => {
            assert_eq!(index, 1);
            assert_eq!(failures[0].field, "path");
            assert_eq!(failures[1].field, "permissions");
        }
        Err(e) => panic!("unexpected error: {e}"),
        Ok(()) => panic!("expected client to error but it ran to completion"),
    }

    Ok(())
}

#[tokio::test]
#[serial]
async fn prompt_after_a_sequence_with_grace_period_errors() -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let seq = include_str!(
        "../resources/prompt-sequence-tests/e2e_unexpected_additional_prompt_test.json"
    );
    let (prefix, dir_path) = setup_test_dir(None, &[("seq.json", seq)])?;

    let _rx = spawn_for_output("aa-prompting-test.create", vec![prefix]);
    let res = run_scripted_client_loop(&mut c, format!("{dir_path}/seq.json"), Some(5)).await;

    match res {
        Err(Error::FailedPromptSequence {
            error: MatchError::UnexpectedPrompts { .. },
        }) => Ok(()),
        Err(e) => panic!("unexpected error: {e}"),
        Ok(()) => panic!("expected client to error but it ran to completion"),
    }
}

#[tokio::test]
#[serial]
async fn prompt_after_a_sequence_without_grace_period_is_ok() -> Result<()> {
    let mut c = SnapdSocketClient::default();
    let seq = include_str!(
        "../resources/prompt-sequence-tests/e2e_unexpected_additional_prompt_test.json"
    );
    let (prefix, dir_path) = setup_test_dir(None, &[("seq.json", seq)])?;

    let _rx = spawn_for_output("aa-prompting-test.create", vec![prefix]);
    let res = run_scripted_client_loop(&mut c, format!("{dir_path}/seq.json"), None).await;

    // Sleep to create a gap between this test and the next so that the outstanding prompts do not
    // get picked up as part of that test. Without this we are racey around what the first prompt
    // seen by the next test case is.
    tokio::time::sleep(std::time::Duration::from_millis(100)).await;

    match res {
        Ok(()) => Ok(()),
        Err(e) => panic!("unexpected error: {e}"),
    }
}
