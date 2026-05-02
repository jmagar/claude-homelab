---
name: acp
version: "1.0.0"
description: >-
  This skill should be used when implementing an ACP (Agent Client Protocol) agent or client in
  Rust using the agent-client-protocol crate, handling session/prompt or session/update wire
  messages, wiring up streaming notifications via conn.session_notification(), implementing the
  initialize/authenticate/session lifecycle handlers, or debugging JSON-RPC 2.0 stdio transport
  issues. Also applies when working with the codex-acp reference implementation or authoring
  bidirectional stdio agents for Zed or VS Code.
---

# Agent Client Protocol (ACP) — Rust

ACP is a JSON-RPC 2.0 protocol for bidirectional communication between AI coding agents and editor clients (Zed, VS Code, etc.). Agents run as subprocesses — clients write to stdin, read from stdout. stderr is for logs only, never protocol data.

**SDK crate:** `agent-client-protocol` on crates.io — provides `Agent`, `Client`, `AgentSideConnection`, `ClientSideConnection`, `SessionNotification`
**SDK source:** `~/workspace/acp/rust-sdk/` — canonical source for trait signatures, read this before writing any impl
**Production reference:** `~/workspace/acp/codex-acp/` (Rust agent for OpenAI/Codex)
**Schema types only:** `~/workspace/acp/agent-client-protocol/` — this is `agent-client-protocol-schema`, the schema crate (`InitializeRequest`, `AuthMethod`, etc.). It does **not** contain `Agent`/`Client` traits. The SDK crate re-exports all schema types plus the runtime layer.

---

## Cargo.toml

```toml
[dependencies]
agent-client-protocol = "0"               # types + transport (AgentSideConnection, Agent trait)
tokio = { version = "1", features = ["full"] }
tokio-util = { version = "0.7", features = ["compat"] }  # required: .compat() / .compat_write() bridge
futures = "0.3"                           # AsyncRead/AsyncWrite traits expected by AgentSideConnection
async-trait = "0.1"
anyhow = "1"
uuid = { version = "1", features = ["v4"] }
dashmap = "5"   # preferred over std::sync::Mutex<HashMap> in async contexts
```

---

## Session Lifecycle (condensed)

```
initialize  →  authenticate  →  session/new  →  session/prompt (streaming)  →  session/cancel
```

All streaming happens via `session/update` notifications sent **from agent to client** during prompt execution. The final `PromptResponse` matches the original `session/prompt` request id.

See `references/wire-format.md` for full JSON examples of every message.

---

## Implementing an Agent

Implement the `Agent` trait and run it on stdio:

```rust
// CRITICAL: use ?Send — the SDK uses Rc internally and requires LocalSet.
#[async_trait::async_trait(?Send)]
impl Agent for MyAgent {
    async fn initialize(&self, req: InitializeRequest) -> acp::Result<InitializeResponse>;
    async fn authenticate(&self, req: AuthenticateRequest) -> acp::Result<AuthenticateResponse>;
    async fn new_session(&self, req: NewSessionRequest) -> acp::Result<NewSessionResponse>;

    // prompt() takes ONLY PromptRequest — there is NO SessionNotifier parameter.
    // Streaming updates are sent via conn.session_notification() from a background task.
    // See "Streaming Notifications" section below for the required mpsc channel pattern.
    async fn prompt(&self, req: PromptRequest) -> acp::Result<PromptResponse>;

    // Method name is cancel (NOT on_cancel). Returns Result<()>.
    async fn cancel(&self, notification: CancelNotification) -> acp::Result<()>;

    // Optional methods (default: Err(Error::method_not_found())):
    //   load_session, set_session_mode, set_session_config_option, list_sessions
    // UNSTABLE (behind feature flags): close_session, fork_session, resume_session, set_session_model
}

// Entry point — use current_thread flavor (?Send trait requires LocalSet).
// MUST use .compat() / .compat_write() — AgentSideConnection expects futures::AsyncRead/AsyncWrite,
// NOT tokio::io traits. These are different trait families.
#[tokio::main(flavor = "current_thread")]
async fn main() -> anyhow::Result<()> {
    use tokio_util::compat::{TokioAsyncReadCompatExt, TokioAsyncWriteCompatExt};

    let (notif_tx, mut notif_rx) = tokio::sync::mpsc::unbounded_channel::<NotifMsg>();
    let agent = Arc::new(MyAgent { notif_tx, sessions: Arc::new(DashMap::new()) });

    tokio::task::LocalSet::new().run_until(async move {
        // conn implements Client — use it to call session_notification, request_permission, etc.
        // io_task drives the stdio read/write loop.
        let (conn, io_task) = AgentSideConnection::new(
            agent,
            tokio::io::stdout().compat_write(), // outgoing
            tokio::io::stdin().compat(),         // incoming
            |fut| { tokio::task::spawn_local(fut); },
        );

        // Background task: receive (notification, done_tx) from agent, send via conn.
        tokio::task::spawn_local(async move {
            while let Some((notif, done_tx)) = notif_rx.recv().await {
                if conn.session_notification(notif).await.is_err() { break; }
                let _ = done_tx.send(());
            }
        });

        io_task.await
    }).await
}
```

> **GOTCHA — no SessionNotifier in prompt():** `SessionNotifier` does **not** exist in the SDK. `prompt()` receives only `PromptRequest`. Send streaming updates via `conn.session_notification()` called from a background task. The agent communicates with the background task via an mpsc channel stored in `self`.

> **GOTCHA — will not compile without compat:** `tokio::io::stdin()` does NOT implement `futures::AsyncRead`. Always use `.compat()` (read) and `.compat_write()` (write) from `tokio_util::compat`. Without `?Send` and `LocalSet`, the runtime panics on `!Send` types.

For a complete working skeleton see **`examples/agent-impl.rs`**.

Key points:
- Advertise only capabilities the agent actually supports in `InitializeResponse`
- Use `ProtocolVersion::V1` (not `LATEST`) in `InitializeResponse::new()`
- Return `Err(acp::Error::auth_required())` explicitly on auth failure (maps to JSON-RPC -32000)
- Use `tokio::io::stdin/stdout()` with `.compat()` — never `std::io` in an async context (blocks executor)
- Use `DashMap` for session state, not `std::sync::Mutex<HashMap>` (deadlock risk under Tokio)
- Add `#![deny(clippy::print_stdout, clippy::print_stderr)]` — one stray `println!` corrupts the binary protocol stream

---

## Streaming Notifications Pattern

The `prompt()` method has no access to the connection. To stream updates during a prompt turn, use an mpsc channel:

```rust
// In the agent struct:
type NotifMsg = (SessionNotification, tokio::sync::oneshot::Sender<()>);
struct MyAgent {
    notif_tx: tokio::sync::mpsc::UnboundedSender<NotifMsg>,
    sessions: Arc<DashMap<String, SessionState>>,
}

// Helper method for sending updates from prompt():
async fn send_update(&self, session_id: &str, update: SessionUpdate) -> acp::Result<()> {
    let (done_tx, done_rx) = tokio::sync::oneshot::channel();
    let notif = SessionNotification::new(session_id.to_string(), update);
    self.notif_tx.send((notif, done_tx)).map_err(|_| acp::Error::internal_error())?;
    done_rx.await.map_err(|_| acp::Error::internal_error())
}

// In prompt() — use self.send_update() to stream:
async fn prompt(&self, req: PromptRequest) -> acp::Result<PromptResponse> {
    self.send_update(&req.session_id, SessionUpdate::AgentMessageChunk(
        ContentChunk::new("Thinking...".into())  // .into() converts &str → ContentBlock
    )).await?;
    Ok(PromptResponse::new(StopReason::EndTurn))
}

// In main() — background task owns conn, drains the channel:
tokio::task::spawn_local(async move {
    while let Some((notif, done_tx)) = notif_rx.recv().await {
        if conn.session_notification(notif).await.is_err() { break; }
        let _ = done_tx.send(());
    }
});
```

> **GOTCHA — ContentChunk::new takes ContentBlock:** `ContentChunk::new(content: ContentBlock)` — NOT a bare `&str`. Use `ContentChunk::new("text".into())` which works because `From<T: Into<String>> for ContentBlock` is implemented — `"text".into()` becomes `ContentBlock::Text(TextContent::new("text"))`. `ContentChunk::new("text")` is a compile error.

---

## Implementing a Client

Implement the `Client` trait to handle agent requests:

```rust
// CRITICAL: use ?Send — same requirement as Agent.
#[async_trait::async_trait(?Send)]
impl Client for MyClient {
    // REQUIRED: receives session/update notifications (streaming chunks, tool calls, etc.).
    // Route by SessionUpdate variant to render in the UI.
    async fn session_notification(&self, args: SessionNotification) -> acp::Result<()>;

    // REQUIRED: agent calls this before any destructive operation.
    // Returns RequestPermissionResponse (wraps outcome), NOT RequestPermissionOutcome directly.
    // Outcome: Cancelled | Selected(SelectedPermissionOutcome::new(option_id))
    async fn request_permission(&self, args: RequestPermissionRequest) -> acp::Result<RequestPermissionResponse>;

    // Optional (default: Err(method_not_found)) — only needed if you advertise fs capability:
    async fn read_text_file(&self, args: ReadTextFileRequest) -> acp::Result<ReadTextFileResponse>;
    async fn write_text_file(&self, args: WriteTextFileRequest) -> acp::Result<WriteTextFileResponse>;
    // Optional terminal methods: create_terminal, terminal_output, release_terminal,
    //                            wait_for_terminal_exit, kill_terminal
}

// Spawn agent subprocess and connect.
// Arg order: (client_handler, outgoing→agent_stdin, incoming←agent_stdout, spawner)
// conn implements Agent — call conn.initialize(), conn.prompt(), etc. to drive the session.
let (conn, io_task) = ClientSideConnection::new(
    MyClient,
    agent_stdin.compat_write(),  // outgoing
    agent_stdout.compat(),       // incoming
    |fut| { tokio::task::spawn_local(fut); },
);
// Drive session in a spawned task; await io_task to run until connection closes.
```

For a complete working skeleton see **`examples/client-impl.rs`**.

---

## Tool Calls (streaming)

Send `ToolCall` before executing a tool, then `ToolCallUpdate` with the result. Use `self.send_update()` from the streaming pattern above.

```rust
// Before tool execution — builder pattern, no Default impl
self.send_update(&req.session_id, SessionUpdate::ToolCall(
    ToolCall::new("tc-1", "Read src/main.rs")
        .kind(ToolKind::Read)
        .status(ToolCallStatus::InProgress)
        .locations(vec![ToolCallLocation::new("src/main.rs")]),
)).await?;

// After tool execution — ToolCallUpdateFields builder, #[serde(flatten)] in wire format
self.send_update(&req.session_id, SessionUpdate::ToolCallUpdate(ToolCallUpdate::new(
    "tc-1",
    ToolCallUpdateFields::new()
        .status(ToolCallStatus::Completed)
        .content(vec![ToolCallContent::Content(Content::new(
            ContentBlock::Text { text: result },
        ))]),
))).await?;
```

> **GOTCHA — no struct literals:** `ToolCall` and `ToolCallUpdate` have no `Default` impl. Use the builder pattern — `ToolCall::new(id, title).kind(...).status(...)`. `ToolCallStatus::Started` does **not** exist; use `InProgress`. The enum is `ToolKind` (not `ToolCallKind`).

For all 10 `ToolKind` variants, JSON wire format, streaming deduplication, and `_meta` extensibility see **`references/tool-calls.md`**.

---

## Reference Files

These reference files contain detail beyond the core guide above:

- **`references/wire-format.md`** — Full JSON-RPC examples for every message type (initialize handshake, authenticate, session/new, session/prompt with streaming, terminal API, session/list, fs/readTextFile, request/permission). Reach for this when debugging wire format mismatches or building a client from scratch.
- **`references/message-reference.md`** — Complete table of all 24 ACP methods (direction, type, purpose), all 11 `SessionUpdate` variants (10 stable + 1 unstable), session modes, and error codes. Reach for this when you need to look up a specific method or understand what messages are available.
- **`references/tool-calls.md`** — Tool call kinds table, full JSON wire examples for `tool_call` and `tool_call_update` notifications, streaming deduplication pattern, `_meta` extensibility, terminal tool lifecycle, and the Rust sending pattern. Reach for this when wiring up tool call streaming.
- **`references/codex-patterns.md`** — Production patterns extracted from codex-acp: `OnceLock` global client, `SessionClient` error-tolerant notification wrapper, `DashMap` session state, `LocalSet` + compat wiring, filesystem sandboxing, auth guard before `new_session`, session listing with pagination, MCP name normalization, graceful cancellation with `biased tokio::select!`. Reach for this when implementing production-grade agent features.
- **`references/unstable-features.md`** — All 9 unstable feature flags with Cargo.toml activation syntax, types, and stability tracking. Reach for this when enabling optional ACP features (session/fork, usage tracking, etc.) or checking if a feature has been stabilized.

---

## Examples

- **`examples/agent-impl.rs`** — Complete `Agent` trait implementation skeleton with `DashMap` session state, mpsc notification channel, tool call notifications, and correct `tokio::io` usage.
- **`examples/client-impl.rs`** — Complete `Client` trait implementation skeleton with subprocess spawning, `session_notification` handler, file I/O handlers, and permission handling.

---

## Quick Checklists

### New Rust ACP Agent

- [ ] `#![deny(clippy::print_stdout, clippy::print_stderr)]` in crate root — one stray `println!` corrupts the binary protocol stream
- [ ] Use `#[async_trait::async_trait(?Send)]` — NOT `#[async_trait]`; the SDK uses Rc internally
- [ ] Run `AgentSideConnection` inside `tokio::task::LocalSet` — required for `!Send` types
- [ ] Use `#[tokio::main(flavor = "current_thread")]` — matches the `?Send` trait requirement
- [ ] Add `use tokio_util::compat::{TokioAsyncReadCompatExt, TokioAsyncWriteCompatExt}` — then call `.compat()` / `.compat_write()` on tokio IO types (they do NOT implement `futures::AsyncRead/Write` natively)
- [ ] `AgentSideConnection::new` returns `(conn, io_task)` — **use `conn`** for `session_notification`; don't discard it
- [ ] Store an `mpsc::UnboundedSender<NotifMsg>` in the agent — this is how `prompt()` sends streaming updates
- [ ] Spawn a background task that drains the channel and calls `conn.session_notification()`
- [ ] `initialize` — advertise only capabilities the agent actually supports; use `ProtocolVersion::V1`
- [ ] `authenticate` — validate credentials; return `Err(acp::Error::auth_required())` on failure
- [ ] `new_session` — generate UUID, store state in `DashMap`; `req.cwd` is `PathBuf` (not `Option<PathBuf>`)
- [ ] `prompt` — only takes `PromptRequest` (no SessionNotifier!); use `send_update()` helper for streaming
- [ ] `cancel` (not `on_cancel`) — store a `watch::Sender<bool>` in session state, signal it; race with `biased tokio::select!` in prompt loop
- [ ] Keep stderr for logs only — never write protocol data to stderr
- [ ] Sandbox file paths to session `cwd` — reject `../` escapes using `std::path::absolute()`

### New Rust ACP Client

- [ ] Use `#[async_trait::async_trait(?Send)]` — NOT `#[async_trait]`
- [ ] Spawn agent binary with `tokio::process::Command`, pipe stdio
- [ ] `ClientSideConnection::new` arg order: `(client, outgoing→agent_stdin, incoming←agent_stdout, spawner)`
- [ ] `ClientSideConnection::new` returns `(conn, io_task)` — use `conn.initialize()` etc. to drive the session
- [ ] Implement `session_notification` — **required**; route `SessionUpdate` variants to render in UI
- [ ] Implement `request_permission` — **required**; show user dialog, return `Cancelled` or `Selected(SelectedPermissionOutcome::new(option_id))`
- [ ] Implement `read_text_file`/`write_text_file` only if you advertise `fs` capability in `InitializeRequest`
- [ ] Handle all `SessionUpdate` variants (chunk, tool_call, tool_call_update, thought)
- [ ] Send `session/cancel` via `conn.cancel(CancelNotification::new(session_id))` on user interrupt
- [ ] Render tool calls using `kind` to pick appropriate UI (diff, file path, terminal)
- [ ] Gracefully degrade for capabilities the agent doesn't advertise
