# ACP Wire Format Reference

JSON-RPC 2.0 over stdio. Agent runs as subprocess — client writes to its stdin, reads from its stdout. stderr is for logs only.

## Message Shapes

### Request

```json
{ "jsonrpc": "2.0", "id": 1, "method": "session/new", "params": { ... } }
```

### Success Response

```json
{ "jsonrpc": "2.0", "id": 1, "result": { ... } }
```

### Error Response

```json
{ "jsonrpc": "2.0", "id": 1, "error": { "code": -32000, "message": "auth required", "data": {} } }
```

### Notification (no id, no response expected)

```json
{ "jsonrpc": "2.0", "method": "session/update", "params": { ... } }
```

---

## Full Initialize Handshake

```json
// Client → Agent
{
  "jsonrpc": "2.0", "id": 1, "method": "initialize",
  "params": {
    "protocolVersion": "1.0.0",
    "clientCapabilities": {
      "fs": { "readTextFile": true, "writeTextFile": true },
      "terminal": true,
      "mcp": { "sse": true, "http": true }
    },
    "clientInfo": { "name": "zed", "version": "0.139.0" }
  }
}

// Agent → Client
{
  "jsonrpc": "2.0", "id": 1,
  "result": {
    "protocolVersion": "1.0.0",
    "agentCapabilities": {
      "promptCapabilities": { "image": false, "audio": false, "embeddedContext": true },
      "mcpCapabilities": { "http": true, "sse": false },
      "loadSession": true,
      "slashCommands": [
        { "name": "review", "description": "Review current changes" }
      ]
    },
    "authMethods": [
      { "type": "agent", "id": "api_key", "name": "API Key" }
    ],
    "agentInfo": { "name": "my-agent", "version": "0.1.0" }
  }
}
```

## Authenticate

```json
// Client → Agent
{
  "jsonrpc": "2.0", "id": 2, "method": "authenticate",
  "params": { "methodId": "api_key" }
  // NOTE: AuthenticateRequest has NO "credentials" field. Secrets come from env vars
  //       (advertised via AuthMethodEnvVar) or a browser/terminal flow — not this message.
}
// Agent → Client
{ "jsonrpc": "2.0", "id": 2, "result": {} }
```

## session/new

```json
// Client → Agent
{
  "jsonrpc": "2.0", "id": 3, "method": "session/new",
  "params": {
    "cwd": "/home/user/project",
    "mcpServers": [
      { "name": "my-server", "url": "http://localhost:8080", "transport": "http" }
    ]
  }
}
// Agent → Client
{ "jsonrpc": "2.0", "id": 3, "result": { "sessionId": "uuid-1234", "modes": {} } }
```

## session/prompt with streaming

```json
// Client → Agent (request)
{
  "jsonrpc": "2.0", "id": 4, "method": "session/prompt",
  "params": {
    "sessionId": "uuid-1234",
    "prompt": [
      { "type": "text", "text": "fix the bug" }
    ]
    // NOTE: field is "prompt": Vec<ContentBlock>, NOT "messages". ContentBlock is a flat
    //       type-tagged object, not a {role, content} envelope.
  }
}

// Agent → Client (notification — no id)
{ "jsonrpc": "2.0", "method": "session/update", "params": {
    "sessionId": "uuid-1234",
    "update": { "sessionUpdate": "agent_message_chunk", "chunk": "Looking at the code..." }
}}
// ... more notifications ...

// Agent → Client (final response — matches id 4)
{ "jsonrpc": "2.0", "id": 4, "result": { "stopReason": "end_turn", "usage": { "inputTokens": 120, "outputTokens": 340 } } }
```

## session/cancel (notification)

```json
// Client → Agent — no id, no response expected
{ "jsonrpc": "2.0", "method": "session/cancel", "params": { "sessionId": "uuid-1234" } }
```

## session/close

```json
{ "jsonrpc": "2.0", "id": 5, "method": "session/close", "params": { "sessionId": "uuid-1234" } }
// → { "jsonrpc": "2.0", "id": 5, "result": {} }
```

## fs/read_text_file (agent → client)

```json
{ "jsonrpc": "2.0", "id": 10, "method": "fs/read_text_file", "params": { "path": "src/main.rs" } }
// → { "result": { "content": "fn main() { ... }" } }
```

## session/request_permission (agent → client)

```json
{
  "jsonrpc": "2.0", "id": 11, "method": "session/request_permission",
  "params": {
    "description": "Write to src/main.rs",
    "kind": "write",
    "path": "src/main.rs"
  }
}
// → { "result": { "outcome": { "type": "selected", "optionId": "allow" } } }
// RequestPermissionOutcome: Cancelled | Selected(SelectedPermissionOutcome { option_id })
// NOTE: "Approved" is NOT a valid variant — outcome is always Cancelled or Selected.
```

---

## Terminal API (5-method lifecycle)

All 5 terminal methods are agent → client requests.

### terminal/create

```json
// Agent → Client
{
  "jsonrpc": "2.0", "id": 20, "method": "terminal/create",
  "params": {
    "command": "cargo",
    "args": ["build", "--release"],
    "cwd": "/home/user/project",
    "env": { "RUST_LOG": "info" }
  }
}
// → { "result": { "terminalId": "term-1" } }
```

### terminal/output

Poll the output buffer of a running terminal. Returns buffered output since last poll.

```json
// Agent → Client
{
  "jsonrpc": "2.0", "id": 21, "method": "terminal/output",
  "params": { "terminalId": "term-1" }
}
// → { "result": { "output": "   Compiling myapp v0.1.0\n" } }
```

### terminal/wait_for_exit

Block until the process exits (or timeout). Agent calls this after reading all expected output.

```json
// Agent → Client
{
  "jsonrpc": "2.0", "id": 22, "method": "terminal/wait_for_exit",
  "params": { "terminalId": "term-1", "timeoutMs": 30000 }
}
// → { "result": { "exitCode": 0, "signal": null } }
```

### terminal/kill

Terminate a running process.

```json
// Agent → Client
{
  "jsonrpc": "2.0", "id": 23, "method": "terminal/kill",
  "params": { "terminalId": "term-1" }
}
// → { "result": {} }
```

### terminal/release

Clean up terminal resources after use. Call after `waitForExit` or `kill`.

```json
// Agent → Client
{
  "jsonrpc": "2.0", "id": 24, "method": "terminal/release",
  "params": { "terminalId": "term-1" }
}
// → { "result": {} }
```

---

## session/list

```json
// Client → Agent (paginated)
{
  "jsonrpc": "2.0", "id": 6, "method": "session/list",
  "params": { "cursor": null, "limit": 25 }
}
// → { "result": { "sessions": [
//     { "sessionId": "uuid-1", "title": "Fix auth bug", "createdAt": "...", "updatedAt": "..." }
//   ], "nextCursor": "uuid-1" } }
```

---

## session/set_mode

```json
// Client → Agent
{
  "jsonrpc": "2.0", "id": 7, "method": "session/set_mode",
  "params": { "sessionId": "uuid-1234", "modeId": "acceptEdits" }
  // NOTE: parameter is "modeId" (SetSessionModeRequest.mode_id → serde rename "modeId"), NOT "mode"
}
// → { "result": {} }
// modeId: "default" | "plan" | "acceptEdits" | "dontAsk" | "bypassPermissions"
```
