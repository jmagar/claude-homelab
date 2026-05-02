// Complete ACP client implementation skeleton (Rust)
// Based on ~/workspace/acp/rust-sdk/ SDK source.
// Use as a starting point for new clients / editors.
//
// Cargo.toml dependencies:
//   agent-client-protocol = "0"
//   tokio = { version = "1", features = ["full", "process"] }
//   tokio-util = { version = "0.7", features = ["compat"] }   # REQUIRED: compat bridge
//   futures = "0.3"                                            # REQUIRED: AsyncRead/AsyncWrite traits
//   async-trait = "0.1"
//   anyhow = "1"

// CRITICAL: deny stdout/stderr printing — stray output corrupts the protocol stream
#![deny(clippy::print_stdout, clippy::print_stderr)]

use agent_client_protocol::{
    self as acp,
    Client, ClientSideConnection,
    ReadTextFileRequest, ReadTextFileResponse,
    RequestPermissionOutcome, RequestPermissionRequest, RequestPermissionResponse,
    SelectedPermissionOutcome, SessionNotification, WriteTextFileRequest, WriteTextFileResponse,
};

struct MyClient;

// CRITICAL: must use ?Send — the SDK uses Rc internally and requires LocalSet.
#[async_trait::async_trait(?Send)]
impl Client for MyClient {
    // REQUIRED: agent sends session/update notifications here (streaming chunks, tool calls).
    // Clients SHOULD continue accepting updates even after sending session/cancel.
    async fn session_notification(&self, notification: SessionNotification) -> acp::Result<()> {
        // Route by SessionUpdate variant to render in the UI:
        //   SessionUpdate::AgentMessageChunk(chunk) → append chunk.text to the message pane
        //   SessionUpdate::ToolCall(call) → show tool call with call.kind for appropriate icon
        //   SessionUpdate::ToolCallUpdate(update) → update tool call status/content
        //   SessionUpdate::AgentThoughtChunk(chunk) → show collapsed reasoning
        //   SessionUpdate::SessionInfoUpdate(_) → update session title/timestamps
        let _ = notification;
        Ok(())
    }

    // REQUIRED: agent calls this before any potentially sensitive operation.
    // Returns RequestPermissionResponse wrapping an outcome — NOT the outcome directly.
    // Outcome variants: Cancelled | Selected(SelectedPermissionOutcome::new(option_id))
    // To auto-approve: RequestPermissionOutcome::Selected(SelectedPermissionOutcome::new(req.options[0].id))
    // Return Cancelled if the session was cancelled mid-prompt.
    async fn request_permission(
        &self,
        _req: RequestPermissionRequest,
    ) -> acp::Result<RequestPermissionResponse> {
        // Replace with real UI dialog logic that selects from _req.options.
        Ok(RequestPermissionResponse::new(RequestPermissionOutcome::Cancelled))
    }

    // Optional (default: Err(method_not_found)) — implement only if client advertises fs capability.
    // Only available if client's InitializeRequest advertises clientCapabilities.fs.readTextFile = true.
    async fn read_text_file(
        &self,
        req: ReadTextFileRequest,
    ) -> acp::Result<ReadTextFileResponse> {
        let content = tokio::fs::read_to_string(&req.path)
            .await
            .map_err(|_| acp::Error::resource_not_found(req.path.to_string_lossy()))?;
        Ok(ReadTextFileResponse::new(content))
    }

    // Optional (default: Err(method_not_found)) — implement only if client advertises fs capability.
    async fn write_text_file(
        &self,
        req: WriteTextFileRequest,
    ) -> acp::Result<WriteTextFileResponse> {
        tokio::fs::write(&req.path, &req.content)
            .await
            .map_err(|_| acp::Error::internal_error())?;
        Ok(WriteTextFileResponse::default())
    }
}

/// Spawn the agent binary as a subprocess, run the ACP connection, and use it.
async fn connect_to_agent(agent_bin: &str) -> anyhow::Result<()> {
    use tokio_util::compat::{TokioAsyncReadCompatExt, TokioAsyncWriteCompatExt};

    let mut child = tokio::process::Command::new(agent_bin)
        .stdin(std::process::Stdio::piped())
        .stdout(std::process::Stdio::piped())
        // stderr is the agent's log channel — inherit or redirect as needed.
        .stderr(std::process::Stdio::inherit())
        .spawn()?;

    let agent_stdout = child.stdout.take().expect("stdout piped");
    let agent_stdin = child.stdin.take().expect("stdin piped");

    // ClientSideConnection expects futures::AsyncRead/AsyncWrite — NOT tokio::io types.
    // Must use .compat() (read) / .compat_write() (write) from tokio-util.
    // Arg order: (client_handler, outgoing→agent_stdin, incoming←agent_stdout, spawner)
    // conn implements Agent — call conn.initialize(), conn.prompt(), etc. to drive the session.
    // io_task drives the stdio loop — await it until the connection closes.
    let (conn, io_task) = ClientSideConnection::new(
        MyClient,
        agent_stdin.compat_write(), // outgoing: client writes to agent's stdin
        agent_stdout.compat(),      // incoming: client reads from agent's stdout
        |fut| { tokio::task::spawn_local(fut); },
    );

    // Drive the session protocol: initialize → authenticate → new_session → prompt → ...
    // This must be done concurrently with io_task (use spawn_local or select!).
    tokio::task::spawn_local(async move {
        use agent_client_protocol::{Agent as _, InitializeRequest, NewSessionRequest, PromptRequest, ProtocolVersion};
        use agent_client_protocol_schema::ContentBlock;

        let init_resp = conn.initialize(InitializeRequest::new(ProtocolVersion::V1)).await?;
        // Check init_resp.auth_methods — call conn.authenticate() if required.
        let _ = init_resp;

        let session = conn.new_session(NewSessionRequest::new(".".into())).await?;
        let _prompt_resp = conn.prompt(PromptRequest::new(
            session.session_id,
            vec![ContentBlock::Text { text: "Hello, agent!".into() }],
        )).await?;

        acp::Result::Ok(())
    });

    io_task.await.map_err(Into::into)
}

#[tokio::main(flavor = "current_thread")]
async fn main() -> anyhow::Result<()> {
    tokio::task::LocalSet::new()
        .run_until(connect_to_agent("./my-agent"))
        .await
}
