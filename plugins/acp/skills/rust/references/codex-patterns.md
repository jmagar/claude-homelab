# Production Patterns from codex-acp

These patterns are extracted from the codex-acp reference implementation. Apply them in any Rust ACP agent.

> **Source:** `~/workspace/acp/codex-acp/` — patterns below are extracted and self-contained, but the full source is available for deeper reference.

---

## OnceLock Global Connection

Store the `AgentSideConnection` in a `OnceLock` so any part of the codebase can call `session_notification`, `read_text_file`, etc. without passing the connection through the call tree.

```rust
use agent_client_protocol::AgentSideConnection;
use std::sync::{Arc, OnceLock};

// In lib.rs — set exactly once when the connection is created.
pub static ACP_CLIENT: OnceLock<Arc<AgentSideConnection>> = OnceLock::new();

// In main / run():
let (client, io_task) = AgentSideConnection::new(agent, stdout, stdin, |fut| {
    tokio::task::spawn_local(fut);
});
if ACP_CLIENT.set(Arc::new(client)).is_err() {
    return Err(std::io::Error::other("ACP client already set"));
}
io_task.await?;

// From anywhere in the codebase:
fn get_client() -> &'static AgentSideConnection {
    ACP_CLIENT.get().expect("ACP client not yet initialised")
}
```

> **Why OnceLock over passing `conn` around:** `AgentSideConnection` is `!Send` (SDK uses `Rc`). Passing it via `Arc<Mutex<>>` doesn't work. OnceLock with `Arc<AgentSideConnection>` lets any `spawn_local` task access the connection without ownership problems.

---

## SessionClient — Error-Tolerant Notification Wrapper

Wrap the connection access in a thin struct that holds the `session_id` and implements `send_notification()` as a fire-and-log (never fatal) operation.

```rust
use agent_client_protocol::{Client, SessionNotification, SessionUpdate};
use std::sync::Arc;

struct SessionClient {
    session_id: SessionId,
    client: Arc<dyn Client>,
}

impl SessionClient {
    fn new(session_id: SessionId) -> Self {
        Self {
            session_id,
            client: ACP_CLIENT.get().expect("client not set").clone(),
        }
    }

    /// Send a session/update notification to the client.
    /// Errors are logged, never propagated — a broken pipe does not abort the agent.
    async fn send_notification(&self, update: SessionUpdate) {
        if let Err(e) = self
            .client
            .session_notification(SessionNotification::new(self.session_id.clone(), update))
            .await
        {
            tracing::error!("Failed to send session notification: {:?}", e);
        }
    }

    /// Helper: send an agent message chunk from a plain string.
    async fn send_agent_text(&self, text: impl Into<String>) {
        // text.into() → String → ContentBlock via From<T: Into<String>>
        self.send_notification(SessionUpdate::AgentMessageChunk(
            ContentChunk::new(text.into().into()),
        ))
        .await;
    }
}
```

> **Key decision:** `send_notification` swallows errors. If the client disconnects mid-prompt, don't abort the agent turn — just stop sending updates. The final `PromptResponse` will still be delivered.

---

## String → ContentBlock Conversion

`ContentBlock` implements `From<T: Into<String>>`, converting to `ContentBlock::Text(TextContent::new(s))`. Use this to avoid verbose struct construction.

```rust
// These are all equivalent:
ContentChunk::new("hello".into())                              // &str → ContentBlock
ContentChunk::new(String::from("hello").into())               // String → ContentBlock
ContentChunk::new(ContentBlock::Text(TextContent::new("hello")))  // explicit

// Content::new() takes impl Into<ContentBlock>, so strings work directly:
Content::new("fn main() { ... }")    // compiles — &str: Into<ContentBlock>

// WRONG — ContentChunk::new takes ContentBlock, not impl Into:
// ContentChunk::new("hello")         ← compile error
```

---

## Session State with DashMap

Use `DashMap` instead of `std::sync::Mutex<HashMap>` for session state in async contexts. `std::sync::Mutex` can deadlock under Tokio's executor if held across `.await` points.

```rust
use dashmap::DashMap;
use std::sync::Arc;

struct MyAgent {
    sessions: Arc<DashMap<String, Arc<tokio::sync::Mutex<SessionState>>>>,
}
```

---

## Filesystem Sandboxing

Scope all file reads/writes to the session `cwd`. Reject paths that escape via `../`.

```rust
fn resolve_path(&self, path: &Path, cwd: &Path) -> anyhow::Result<PathBuf> {
    // Resolve relative to session cwd, not process cwd
    let full = if path.is_absolute() {
        path.to_path_buf()
    } else {
        cwd.join(path)
    };

    // Use std::path::absolute() (Rust 1.82+) — resolves ../ without requiring the path to exist.
    // Do NOT use canonicalize() here — it returns Err on non-existent paths,
    // which breaks write operations to new files before they're created.
    let abs = std::path::absolute(&full)
        .unwrap_or(full);

    // Reject anything that escapes the session root
    let abs_cwd = std::path::absolute(cwd).unwrap_or(cwd.to_path_buf());
    if !abs.starts_with(&abs_cwd) {
        anyhow::bail!("path escapes session root: {}", path.display());
    }
    Ok(abs)
}
```

---

## Auth Guard Before new_session

Check authentication succeeded before creating a session. Codex-acp calls `check_auth()` at the top of `new_session` so invalid credentials fail fast before any session state is allocated.

```rust
async fn new_session(&self, request: NewSessionRequest) -> acp::Result<NewSessionResponse> {
    // Reject if authenticate() was not called or failed.
    self.check_auth().await?;
    // ... proceed to allocate session state
}

async fn check_auth(&self) -> acp::Result<()> {
    if self.auth.is_none() {
        return Err(acp::Error::auth_required());
    }
    Ok(())
}
```

---

## Authenticate via env vars / method_id

`AuthenticateRequest` carries only `method_id` — there is **no** `credentials` field. The actual secrets come from env vars (advertised via `AuthMethodEnvVar`) or from a browser/terminal flow. Validate `method_id` against what you advertised in `initialize`.

```rust
async fn authenticate(&self, req: AuthenticateRequest) -> acp::Result<AuthenticateResponse> {
    match req.method_id.as_str() {
        "openai_api_key" => {
            // Env var was set by the client or already present — just check it.
            if std::env::var("OPENAI_API_KEY").is_err() {
                return Err(acp::Error::auth_required());
            }
            Ok(AuthenticateResponse::new())
        }
        _ => Err(acp::Error::method_not_found()),
    }
}
```

---

## Session Listing with Pagination

```rust
// 25 per page; cursor = last session ID from previous page
// Truncate display titles to 120 grapheme clusters
use unicode_segmentation::UnicodeSegmentation;

fn truncate_title(raw: &str) -> String {
    raw.graphemes(true).take(120).collect()
}

async fn list_sessions(&self, cursor: Option<&str>, limit: usize) -> Vec<SessionSummary> {
    let mut all = self.sessions.iter()
        .map(|e| e.key().clone())
        .collect::<Vec<_>>();
    // DashMap iteration order is non-deterministic — sort for stable pagination.
    all.sort();

    let start = match cursor {
        None => 0,
        Some(id) => all.iter().position(|s| s == id).map(|i| i + 1).unwrap_or(0),
    };

    all[start..].iter().take(limit).cloned().collect()
}
```

---

## MCP Server Name Normalization

MCP server names must not contain whitespace. Replace spaces with underscores when forwarding from client config.

```rust
fn normalize_mcp_name(name: &str) -> String {
    name.split_whitespace().collect::<Vec<_>>().join("_")
}
```

---

## Graceful Cancellation

Check a cancellation signal inside the prompt loop with `biased tokio::select!` to race the LLM stream against the cancel signal.

```rust
use tokio::sync::watch;

// In SessionState:
cancel_tx: watch::Sender<bool>,
cancel_rx: watch::Receiver<bool>,

// In Agent::cancel():
async fn cancel(&self, notification: CancelNotification) -> acp::Result<()> {
    if let Some(state) = self.sessions.get(&notification.session_id) {
        let _ = state.cancel_tx.send(true);
    }
    Ok(())
}

// In Agent::prompt() — race LLM chunks vs cancel:
async fn prompt(&self, req: PromptRequest) -> acp::Result<PromptResponse> {
    let client = SessionClient::new(req.session_id.clone().into());
    let mut cancel = self.sessions.get(&req.session_id)
        .map(|s| s.cancel_rx.clone())
        .ok_or_else(acp::Error::internal_error)?;

    loop {
        tokio::select! {
            // biased: checks cancel first every iteration (prevents starvation
            // when chunk spam is fast).
            biased;
            _ = cancel.changed() => {
                if *cancel.borrow() {
                    return Ok(PromptResponse::new(StopReason::Cancelled));
                }
            }
            chunk = llm_stream.next() => {
                match chunk {
                    Some(text) => client.send_agent_text(text).await,
                    None => break,
                }
            }
        }
    }

    Ok(PromptResponse::new(StopReason::EndTurn))
}
```

> **`biased` is required:** Without it, Tokio's `select!` uses a fair random branch selection. Under rapid LLM chunk generation, the cancel branch can be starved indefinitely. `biased` ensures cancel is checked on every iteration.
