# ACP Message Reference

All 24 ACP methods with direction, type, and purpose.

| Method | Direction | Type | Purpose |
|--------|-----------|------|---------|
| `initialize` | Client → Agent | Request | Capability exchange — always first |
| `authenticate` | Client → Agent | Request | Credential handshake |
| `session/new` | Client → Agent | Request | Create session with working dir |
| `session/load` | Client → Agent | Request | Resume existing session by ID |
| `session/list` | Client → Agent | Request | Paginated session listing |
| `session/fork` | Client → Agent | Request | Branch from existing session |
| `session/resume` | Client → Agent | Request | Resume after disconnection |
| `session/prompt` | Client → Agent | Request | Send user message, stream response |
| `session/update` | Agent → Client | Notification | Streaming progress (tool calls, chunks) |
| `session/cancel` | Client → Agent | Notification | Interrupt running prompt |
| `session/close` | Client → Agent | Request | End session cleanly |
| `session/set_mode` | Client → Agent | Request | Change permission mode |
| `session/set_model` | Client → Agent | Request | Change model |
| `session/set_config_option` | Client → Agent | Request | Agent-specific config |
| `fs/readTextFile` | Agent → Client | Request | Read file (permission-gated) |
| `fs/writeTextFile` | Agent → Client | Request | Write file (permission-gated) |
| `request/permission` | Agent → Client | Request | Ask user approval for action |
| `terminal/create` | Agent → Client | Request | Spawn process |
| `terminal/output` | Agent → Client | Request | Poll terminal output buffer |
| `terminal/wait_for_exit` | Agent → Client | Request | Block until process exits |
| `terminal/kill` | Agent → Client | Request | Kill process |
| `terminal/release` | Agent → Client | Request | Clean up terminal handle |
| `ext/*` | Both | Either | Protocol extensions (custom routing) |

---

## SessionUpdate Variants (11 total — 10 stable + 1 unstable)

All sent as `session/update` notifications from agent to client.

| Variant | Description | Stability |
|---------|-------------|-----------|
| `agent_message_chunk` | Streamed response text | Stable |
| `agent_thought_chunk` | Internal reasoning (shown collapsed in UI) | Stable |
| `user_message_chunk` | Echo of user message (rare; client-confirm) | Stable |
| `tool_call` | New tool execution initiated | Stable |
| `tool_call_update` | Tool result / status / completion | Stable |
| `plan` | Agent's multi-step execution plan | Stable |
| `available_commands_update` | Commands available for the user | Stable |
| `current_mode_update` | Session permission mode changed | Stable |
| `config_option_update` | Session config option changed | Stable |
| `session_info_update` | Session title / timestamps (stable v0.11.1) | Stable |
| `usage_update` | Token count + cost tracking | **Unstable** (`unstable_session_usage`) |

---

## Session Modes

| Mode | Behavior |
|------|----------|
| `default` | Agent asks permission for writes |
| `plan` | Agent only plans, no execution |
| `acceptEdits` | Auto-accept all file edits |
| `dontAsk` | Skip all permission dialogs |
| `bypassPermissions` | No restrictions (dangerous) |

Set via `session/setMode` request or returned in `NewSessionResponse.modes`.

---

## Error Codes

### Standard JSON-RPC 2.0

| Code | Name | Meaning |
|------|------|---------|
| `-32700` | ParseError | Invalid JSON |
| `-32600` | InvalidRequest | Not a valid JSON-RPC request |
| `-32601` | MethodNotFound | Method doesn't exist |
| `-32602` | InvalidParams | Invalid / missing parameters |
| `-32603` | InternalError | Server-side error |

### ACP-Specific

| Code | Name | Meaning | Stability |
|------|------|---------|-----------|
| `-32800` | RequestCancelled | Execution aborted by cancel | **Unstable** (`unstable_cancel_request`) |
| `-32000` | AuthRequired | Auth needed before operation | Stable |
| `-32002` | ResourceNotFound | File / resource not found | Stable |

### SDK Helper Constructors

```rust
Error::parse_error()
Error::invalid_request()
Error::method_not_found()
Error::invalid_params()
Error::internal_error()
Error::auth_required()                      // -32000
Error::resource_not_found(uri)              // -32002
Error::request_cancelled()                  // -32800 (unstable_cancel_request)
Error::into_internal_error(std_error)       // wraps std::error::Error as -32603
```

Return errors from `Agent` trait methods as `Err(anyhow::anyhow!("msg"))` — the SDK maps them to JSON-RPC error objects (code -32603) automatically. Use `Error::auth_required()` explicitly when auth fails to send -32000.
