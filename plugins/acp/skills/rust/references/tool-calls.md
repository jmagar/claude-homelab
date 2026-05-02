# ACP Tool Calls Reference

## ToolKind Variants (10 total)

The enum is `ToolKind` (not `ToolCallKind`). Serialized as `snake_case` in JSON.

| Rust variant | `kind` string | Semantic meaning |
|---|---|---|
| `ToolKind::Read` | `"read"` | Reading files or data |
| `ToolKind::Edit` | `"edit"` | Modifying files or content |
| `ToolKind::Delete` | `"delete"` | Removing files or data |
| `ToolKind::Move` | `"move"` | Moving or renaming files |
| `ToolKind::Search` | `"search"` | Searching for information |
| `ToolKind::Execute` | `"execute"` | Running commands or code |
| `ToolKind::Think` | `"think"` | Internal reasoning or planning |
| `ToolKind::Fetch` | `"fetch"` | Retrieving external data |
| `ToolKind::SwitchMode` | `"switch_mode"` | Changing session mode |
| `ToolKind::Other` | `"other"` | Default / uncategorized |

`ToolKind::Other` is the default — omitted from JSON when serializing with `skip_serializing_if`.

---

## ToolCallStatus Variants (4 total)

Serialized as `snake_case` in JSON. `Pending` is the default.

| Rust variant | JSON value | Meaning |
|---|---|---|
| `ToolCallStatus::Pending` | `"pending"` | Awaiting approval or input streaming |
| `ToolCallStatus::InProgress` | `"in_progress"` | Currently running |
| `ToolCallStatus::Completed` | `"completed"` | Finished successfully |
| `ToolCallStatus::Failed` | `"failed"` | Finished with error |

> **`Started` does not exist.** Use `InProgress` for running announcements.

---

## Tool Call Notification (full JSON)

```json
{
  "jsonrpc": "2.0", "method": "session/update",
  "params": {
    "sessionId": "uuid-1234",
    "update": {
      "sessionUpdate": "tool_call",
      "toolCall": {
        "toolCallId": "tc-1",
        "title": "Read src/main.rs",
        "kind": "read",
        "status": "in_progress",
        "content": [],
        "locations": [{ "path": "src/main.rs", "line": 42 }],
        "rawInput": { "filePath": "src/main.rs" }
      }
    }
  }
}
```

## Tool Call Update (completion)

```json
{
  "jsonrpc": "2.0", "method": "session/update",
  "params": {
    "sessionId": "uuid-1234",
    "update": {
      "sessionUpdate": "tool_call_update",
      "toolCallUpdate": {
        "toolCallId": "tc-1",
        "status": "completed",
        "content": [
          { "type": "content", "content": { "type": "text", "text": "fn main() { ... }" } }
        ]
      }
    }
  }
}
```

> **JSON shape:** `ToolCallUpdate` uses `#[serde(flatten)]` on `fields`, so `status` and `content` appear as siblings of `toolCallId` in JSON — not nested. The Rust construction is different (see below).

---

## Streaming Deduplication (CRITICAL for clients)

When an agent streams a prompt response, tool calls appear **twice**:
1. During streaming → `tool_call` notification (first encounter)
2. In the full assistant message replay → another apparent `tool_call` (second encounter)

Without deduplication, clients render each tool action twice. Guard with a seen set:

```rust
// In SessionState or prompt context
let mut seen_tool_calls: HashSet<String> = HashSet::new();

// When emitting a tool call:
if seen_tool_calls.contains(&tool_call_id) {
    // Second encounter from message replay — send update, not duplicate start
    notifier.send(SessionUpdate::ToolCallUpdate(ToolCallUpdate::new(
        tool_call_id.clone(),
        ToolCallUpdateFields::new().status(ToolCallStatus::Completed).content(result_content),
    ))).await?;
} else {
    // First encounter during streaming — announce the tool call
    seen_tool_calls.insert(tool_call_id.clone());
    notifier.send(SessionUpdate::ToolCall(
        ToolCall::new(tool_call_id.clone(), "Working...").status(ToolCallStatus::InProgress),
    )).await?;
}
```

---

## Terminal Tool Lifecycle (3-part)

Bash / shell tools with live terminal output follow a 3-notification sequence:

```rust
// 1. Announce: tool_call with terminal_info in _meta
notifier.send(SessionUpdate::ToolCall(
    ToolCall::new("tc-bash-1", "cargo build --release")
        .kind(ToolKind::Execute)
        .status(ToolCallStatus::InProgress)
        .meta(serde_json::json!({
            "terminal_info": { "terminal_id": "tc-bash-1" }
        })),
)).await?;

// 2. Stream output (zero or more): tool_call_update with terminal_output in _meta
notifier.send(SessionUpdate::ToolCallUpdate(ToolCallUpdate::new(
    "tc-bash-1",
    ToolCallUpdateFields::new().status(ToolCallStatus::InProgress),
).meta(serde_json::json!({
    "terminal_output": { "terminal_id": "tc-bash-1", "data": "Building...\n" }
})))).await?;

// 3. Complete: tool_call_update with terminal_exit in _meta
notifier.send(SessionUpdate::ToolCallUpdate(ToolCallUpdate::new(
    "tc-bash-1",
    ToolCallUpdateFields::new()
        .status(ToolCallStatus::Completed)
        .content(vec![ToolCallContent::Content(Content::new(
            ContentBlock::Text { text: full_output }
        ))]),
).meta(serde_json::json!({
    "terminal_exit": { "terminal_id": "tc-bash-1", "exit_code": 0, "signal": null }
})))).await?;
```

---

## Extensibility via `_meta`

Any message accepts `_meta` for custom data — unknown keys are ignored:

```rust
ToolCallUpdate::new("tc-1", ToolCallUpdateFields::new().status(ToolCallStatus::Completed))
    .meta(serde_json::json!({ "terminal_id": "term-1", "custom_key": "value" }))
```

---

## Rust Pattern: Sending Tool Calls

`ToolCall` and `ToolCallUpdate` use builder patterns — **no `Default` impl, no struct literal with `..`**.

```rust
use agent_client_protocol::types::{
    ToolCall, ToolCallUpdate, ToolCallUpdateFields, ToolCallContent,
    ToolCallLocation, ToolKind, ToolCallStatus, ContentBlock, Content,
};

async fn prompt(
    &self,
    req: PromptRequest,
    notifier: SessionNotifier,
) -> anyhow::Result<PromptResponse> {
    // 1. Announce before tool execution
    notifier.send(SessionUpdate::ToolCall(
        ToolCall::new("tc-1", "Read src/lib.rs")
            .kind(ToolKind::Read)
            .status(ToolCallStatus::InProgress)
            .locations(vec![ToolCallLocation::new("src/lib.rs")]),
    )).await?;

    // 2. Execute (e.g. call fs/readTextFile via client handle)

    // 3. Notify completion with result
    notifier.send(SessionUpdate::ToolCallUpdate(ToolCallUpdate::new(
        "tc-1",
        ToolCallUpdateFields::new()
            .status(ToolCallStatus::Completed)
            .content(vec![ToolCallContent::Content(Content::new(
                ContentBlock::Text { text: "fn main() { ... }".into() }
            ))]),
    ))).await?;

    Ok(PromptResponse { stop_reason: "end_turn".into(), usage: None })
}
```
