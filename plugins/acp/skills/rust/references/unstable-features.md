# ACP Unstable Features Reference

All 9 unstable feature flags in the `agent-client-protocol` crate. Each is independently activatable; use the umbrella `unstable` to enable all.

> **Source verified:** `~/workspace/agent-client-protocol/` (schema crate, v0.11.2) and `~/workspace/codex-acp/Cargo.toml`

---

## Enabling Unstable Features

```toml
# Enable all unstable features at once (codex-acp pattern)
agent-client-protocol = { version = "0", features = ["unstable"] }

# Enable individually — only what you need
agent-client-protocol = { version = "0", features = [
    "unstable_session_fork",
    "unstable_session_usage",
] }
```

---

## Feature Table

| Feature flag | Method / Types unlocked | Status |
|---|---|---|
| `unstable_session_close` | `session/close` · `CloseSessionRequest` · `CloseSessionResponse` · `SessionCloseCapabilities` | Unstable |
| `unstable_session_fork` | `session/fork` · `ForkSessionRequest` · `ForkSessionResponse` · `SessionForkCapabilities` | Unstable |
| `unstable_session_resume` | `session/resume` · `ResumeSessionRequest` · `ResumeSessionResponse` · `SessionResumeCapabilities` | Unstable |
| `unstable_session_model` | `session/set_model` · adds `model` to `NewSessionCapabilities` and `LoadSessionCapabilities` | Unstable |
| `unstable_session_usage` | `usage: Option<Usage>` on `PromptResponse` · `UsageUpdate` `SessionUpdate` variant | Unstable |
| `unstable_message_id` | `message_id: Option<String>` on `PromptRequest` + `user_message_id: Option<String>` on `PromptResponse` (UUID format) | Unstable |
| `unstable_auth_methods` | Additional `AuthMethodType` variants for richer credential formats | Unstable |
| `unstable_cancel_request` | `CancelRequestNotification` (cancel-as-request) · error code `-32800` `RequestCancelled` | Unstable |
| `unstable_boolean_config` | Boolean values in `session/set_config_option` · `SessionConfigValueBoolean` variant | Unstable |

---

## Feature Details

### `unstable_session_close`

Enables the `session/close` method, which allows a client to cleanly terminate a session.

```rust
// In initialize response — advertise support
AgentCapabilities {
    // Only present with unstable_session_close feature
    close_session: Some(SessionCloseCapabilities { .. }),
    ..Default::default()
}

// Request
CloseSessionRequest { session_id: "uuid-1234".into(), meta: None }

// Response
CloseSessionResponse {}
```

> ⚠️ **Still unstable as of v0.11.2** — the schema crate still gates this behind `#[cfg(feature = "unstable_session_close")]`. Do not expect it without enabling the feature flag.

---

### `unstable_session_fork`

Branch an existing session into a new one, sharing history up to the fork point. Useful for exploring multiple approaches without re-running earlier steps.

```rust
ForkSessionRequest {
    session_id: "uuid-1234".into(),
    // Optional: fork from a specific message
    message_id: None,
    cwd: Some("/home/user/project".into()),
    meta: None,
}

ForkSessionResponse {
    session_id: "uuid-fork-5678".into(),
}
```

Advertise capability in `InitializeResponse`:
```rust
AgentCapabilities {
    fork_session: Some(SessionForkCapabilities { .. }),
    ..Default::default()
}
```

`claude-agent-acp` exposes this as `unstable_forkSession()`.

---

### `unstable_session_resume`

Resume a session after client disconnection. Replays buffered updates the client missed.

```rust
ResumeSessionRequest {
    session_id: "uuid-1234".into(),
    meta: None,
}

ResumeSessionResponse {
    // Replayed updates
}
```

Advertise capability:
```rust
AgentCapabilities {
    resume_session: Some(SessionResumeCapabilities { .. }),
    ..Default::default()
}
```

`claude-agent-acp` exposes this as `unstable_resumeSession()`.

---

### `unstable_session_model`

Allows the client to change the LLM model mid-session via `session/set_model`. Also adds a `model` field to `NewSessionCapabilities` and `LoadSessionCapabilities` so agents can advertise which models they support.

```rust
// In new_session or load_session capabilities (unstable_session_model)
NewSessionCapabilities {
    modes: vec!["default".into(), "acceptEdits".into()],
    model: Some("claude-opus-4-5".into()),
}

// session/set_model request
SetModelRequest {
    session_id: "uuid-1234".into(),
    model: "claude-sonnet-4-6".into(),
    meta: None,
}

SetModelResponse {}
```

`claude-agent-acp` exposes this as `unstable_setSessionModel()`.

---

### `unstable_session_usage`

Adds token usage tracking to prompt responses and session updates.

```rust
// In PromptResponse — only present with unstable_session_usage
PromptResponse {
    stop_reason: "end_turn".into(),
    usage: Some(Usage {
        input_tokens: 1200,
        output_tokens: 340,
        cache_read_tokens: None,
        cache_creation_tokens: None,
    }),
}
```

Also unlocks the `UsageUpdate` `SessionUpdate` variant — sent as `session/update` notifications with running token totals. The `usage_update` variant is marked **unstable** in the `SessionUpdate` enum.

> The `session_info_update` variant (session title + timestamps) is **stable** and does NOT require this flag — don't conflate the two.

---

### `unstable_message_id`

Adds stable identifiers to individual messages, enabling clients and agents to reference specific messages (e.g., for forking from a particular turn).

```rust
// PromptRequest — client sets a UUID to track this message
PromptRequest::new("uuid-1234", messages)
    .set_message_id("msg-uuid-abcd")  // unstable_message_id

// PromptResponse — agent echoes it back (or assigns one if client didn't)
PromptResponse {
    stop_reason: "end_turn".into(),
    user_message_id: Some("msg-uuid-abcd".into()),  // unstable_message_id
    usage: None,
    meta: None,
}
```

> Both clients and agents **MUST** use UUID format for message IDs.

---

### `unstable_auth_methods`

Extends the `AuthMethodType` enum with additional credential format variants beyond the baseline `"agent"` type. Allows agents to advertise richer auth schemes.

The baseline `AuthMethod` struct remains stable. This flag enables additional variants that some agents and clients may not yet support. Gracefully degrade if the client doesn't recognize the extended type.

---

### `unstable_cancel_request`

Normally `session/cancel` is a notification (no response expected). This flag adds a `CancelRequestNotification` type that makes cancellation a tracked request and also enables error code **-32800** (`RequestCancelled`).

```rust
// Error constructor (only available with unstable_cancel_request)
Error::request_cancelled()  // code: -32800

// CancelRequestNotification — cancel a specific in-flight request by ID
CancelRequestNotification {
    request_id: RequestId::from(4),  // matches the session/prompt id
    meta: None,
}
```

Without this flag, `session/cancel` is a fire-and-forget notification and there is no -32800 error code. The `on_cancel()` method in the `Agent` trait handles the notification form and is **stable**.

---

### `unstable_boolean_config`

Extends `session/set_config_option` to accept boolean values in addition to string values. Adds `SessionConfigValueBoolean` variant to `SessionConfigOptionValue`.

```rust
// Without unstable_boolean_config: only string values
session/set_config_option { id: "some-option", value: "true" }

// With unstable_boolean_config: proper boolean values
SessionConfigOptionValue::Boolean(SessionConfigValueBoolean { value: true })
```

Agents that advertise boolean config options must enable this flag and handle both `Boolean` and `String` variants for backward compatibility.

---

## Stability Notes

- As of **v0.11.2** (schema crate), **all 9 features remain unstable**. The crate version number does not indicate that any feature has been promoted to stable.
- `codex-acp` enables `features = ["unstable"]` (all 9) — this is the recommended pattern for production agents that need the full feature set.
- `session_info_update` (`session/update` with session title) is **stable** and available without any feature flag.
- The stable `Agent::on_cancel()` trait method handles `session/cancel` as a notification. `unstable_cancel_request` is only needed for the request/response variant and the -32800 error code.

---

## Checking Stabilization

Since features graduate over time, verify current status before assuming stability:

```bash
# Check the schema crate source directly
grep -r "unstable_session_close" ~/workspace/agent-client-protocol/src/ | grep "#\[cfg"
# No output = stabilized (or feature removed)
# Output present = still behind feature flag

# Check crates.io for the latest combined transport crate version
cargo search agent-client-protocol
```
