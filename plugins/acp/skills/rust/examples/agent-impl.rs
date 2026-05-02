// Complete ACP agent implementation skeleton (Rust)
// Based on ~/workspace/acp/rust-sdk/ SDK source.
// Use as a starting point for new agents.
//
// Cargo.toml dependencies:
//   agent-client-protocol = "0"
//   tokio = { version = "1", features = ["full"] }
//   tokio-util = { version = "0.7", features = ["compat"] }   # REQUIRED: compat bridge
//   futures = "0.3"                                            # REQUIRED: AsyncRead/AsyncWrite traits
//   async-trait = "0.1"
//   anyhow = "1"
//   uuid = { version = "1", features = ["v4"] }
//   dashmap = "5"

// CRITICAL: deny stdout/stderr printing — any stray println! corrupts the binary protocol stream
#![deny(clippy::print_stdout, clippy::print_stderr)]

use agent_client_protocol::{
    self as acp, Agent, AgentCapabilities, AgentSideConnection, AuthMethod, AuthMethodAgent,
    AuthenticateRequest, AuthenticateResponse, CancelNotification, Content, ContentChunk,
    Implementation, InitializeRequest, InitializeResponse, McpCapabilities, NewSessionRequest,
    NewSessionResponse, PromptCapabilities, PromptRequest, PromptResponse, ProtocolVersion,
    SessionNotification, SessionUpdate, StopReason, ToolCall, ToolCallContent, ToolCallLocation,
    ToolCallStatus, ToolCallUpdate, ToolCallUpdateFields, ToolKind,
};
use dashmap::DashMap;
use std::sync::Arc;
use tokio::sync::{mpsc, oneshot, watch};

// ─── Notification channel ────────────────────────────────────────────────────
// prompt() cannot call conn.session_notification() directly because prompt() has
// no reference to the connection. Instead, a background task owns the connection
// and reads from this channel. The oneshot confirms delivery so prompt() can
// sequence updates correctly before returning PromptResponse.
type NotifMsg = (SessionNotification, oneshot::Sender<()>);

// ─── Agent state ─────────────────────────────────────────────────────────────
struct MyAgent {
    notif_tx: mpsc::UnboundedSender<NotifMsg>,
    // DashMap is preferred over std::sync::Mutex<HashMap> — avoids deadlocks under Tokio.
    sessions: Arc<DashMap<String, SessionState>>,
}

struct SessionState {
    cwd: std::path::PathBuf,
    // watch channel for graceful cancellation — signalled from cancel(), raced in prompt().
    cancel_tx: watch::Sender<bool>,
    cancel_rx: watch::Receiver<bool>,
}

impl MyAgent {
    // Helper: queue a SessionUpdate and block until the background task has sent it.
    async fn send_update(&self, session_id: &str, update: SessionUpdate) -> acp::Result<()> {
        let (done_tx, done_rx) = oneshot::channel();
        let notification = SessionNotification::new(session_id.to_string(), update);
        self.notif_tx
            .send((notification, done_tx))
            .map_err(|_| acp::Error::internal_error())?;
        done_rx.await.map_err(|_| acp::Error::internal_error())
    }
}

// ─── Agent trait ─────────────────────────────────────────────────────────────
// CRITICAL: must use ?Send — the SDK uses Rc internally and requires LocalSet.
#[async_trait::async_trait(?Send)]
impl Agent for MyAgent {
    // All response types are #[non_exhaustive] — MUST use builder methods, not struct literals.
    async fn initialize(&self, _req: InitializeRequest) -> acp::Result<InitializeResponse> {
        Ok(InitializeResponse::new(ProtocolVersion::V1)
            .agent_capabilities(
                AgentCapabilities::new()
                    .prompt_capabilities(PromptCapabilities::new().embedded_context(true))
                    .mcp_capabilities(McpCapabilities::new().http(true))
                    .load_session(true),
            )
            .agent_info(Implementation::new("my-agent", "0.1.0"))
            .auth_methods(vec![AuthMethod::Agent(AuthMethodAgent::new(
                "api_key", "API Key",
            ))]))
    }

    async fn authenticate(&self, req: AuthenticateRequest) -> acp::Result<AuthenticateResponse> {
        // Validate req.method_id — the AuthMethodId identifies which auth method was chosen.
        // Return Err on failure so the SDK sends JSON-RPC error code -32000.
        let _ = req.method_id; // replace with real validation
        Ok(AuthenticateResponse::default())
    }

    async fn new_session(&self, req: NewSessionRequest) -> acp::Result<NewSessionResponse> {
        let session_id = uuid::Uuid::new_v4().to_string();
        let (cancel_tx, cancel_rx) = watch::channel(false);
        // req.cwd is PathBuf (not Option<PathBuf>) — always present
        self.sessions.insert(
            session_id.clone(),
            SessionState {
                cwd: req.cwd,
                cancel_tx,
                cancel_rx,
            },
        );
        Ok(NewSessionResponse::new(session_id))
    }

    // IMPORTANT: prompt() does NOT receive a SessionNotifier or connection handle.
    // Use self.send_update() to emit streaming updates via the background task.
    async fn prompt(&self, req: PromptRequest) -> acp::Result<PromptResponse> {
        let mut cancel = self
            .sessions
            .get(&req.session_id)
            .map(|s| s.cancel_rx.clone())
            .ok_or_else(acp::Error::internal_error)?;

        // 1. Announce a tool call before executing it.
        //    ToolCall: builder pattern — no Default impl, no struct literal with `..`.
        self.send_update(
            &req.session_id,
            SessionUpdate::ToolCall(
                ToolCall::new("tc-1", "Reading file")
                    .kind(ToolKind::Read)
                    .status(ToolCallStatus::InProgress)
                    .locations(vec![ToolCallLocation::new("src/main.rs")]),
            ),
        )
        .await?;

        // 2. Execute the tool.
        //    For client fs calls (read_text_file / request_permission), share the conn
        //    via Rc<AgentSideConnection> or a separate request/response channel — same
        //    mpsc pattern as send_update above.

        // 3. Report tool result.
        //    ToolCallUpdateFields: builder — fields are #[serde(flatten)] in JSON.
        self.send_update(
            &req.session_id,
            SessionUpdate::ToolCallUpdate(ToolCallUpdate::new(
                "tc-1",
                ToolCallUpdateFields::new()
                    .status(ToolCallStatus::Completed)
                    .content(vec![ToolCallContent::Content(Content::new(
                        // &str/.into() → ContentBlock via From<T: Into<String>> impl
                        "fn main() { ... }",
                    ))]),
            )),
        )
        .await?;

        // 4. Stream response text — race against cancellation.
        //    biased: checks cancel first every iteration (prevents starvation).
        //    AgentMessageChunk wraps ContentChunk::new(), not a bare string.
        loop {
            tokio::select! {
                biased;
                _ = cancel.changed() => {
                    if *cancel.borrow() {
                        return Ok(PromptResponse::new(StopReason::Cancelled));
                    }
                }
                // Replace with: chunk = llm_stream.next() => { ... }
                _ = async {} => {
                    self.send_update(
                        &req.session_id,
                        // "text".into() → ContentBlock via From<T: Into<String>> impl
                        SessionUpdate::AgentMessageChunk(ContentChunk::new("Done reading the file.".into())),
                    )
                    .await?;
                    break;
                }
            }
        }

        Ok(PromptResponse::new(StopReason::EndTurn))
    }

    // session/cancel arrives as a notification — signal the watch channel.
    // Method name is cancel (not on_cancel). Return type is Result<()>.
    async fn cancel(&self, notification: CancelNotification) -> acp::Result<()> {
        if let Some(state) = self.sessions.get(&notification.session_id) {
            let _ = state.cancel_tx.send(true);
        }
        Ok(())
    }
}

// ─── Entry point ─────────────────────────────────────────────────────────────
// Use current_thread flavor — the Agent trait is ?Send (SDK uses Rc internally).
// CRITICAL: AgentSideConnection expects futures::AsyncRead/AsyncWrite, NOT tokio::io types.
// Must use .compat() / .compat_write() from tokio-util.
#[tokio::main(flavor = "current_thread")]
async fn main() -> anyhow::Result<()> {
    use tokio_util::compat::{TokioAsyncReadCompatExt, TokioAsyncWriteCompatExt};

    let (notif_tx, mut notif_rx) = mpsc::unbounded_channel::<NotifMsg>();
    let agent = MyAgent {
        notif_tx,
        sessions: Arc::new(DashMap::new()),
    };

    // LocalSet is required — AgentSideConnection uses !Send types internally.
    tokio::task::LocalSet::new()
        .run_until(async move {
            // conn implements Client — use it to call session_notification, request_permission, etc.
            // io_task drives the stdio read/write loop — await it to run until the connection closes.
            let (conn, io_task) = AgentSideConnection::new(
                agent,
                tokio::io::stdout().compat_write(), // outgoing
                tokio::io::stdin().compat(),        // incoming
                |fut| {
                    tokio::task::spawn_local(fut);
                },
            );

            // Background task: drain the notification channel and send to client via conn.
            tokio::task::spawn_local(async move {
                while let Some((notification, done_tx)) = notif_rx.recv().await {
                    if conn.session_notification(notification).await.is_err() {
                        break;
                    }
                    let _ = done_tx.send(());
                }
            });

            io_task.await
        })
        .await
}
