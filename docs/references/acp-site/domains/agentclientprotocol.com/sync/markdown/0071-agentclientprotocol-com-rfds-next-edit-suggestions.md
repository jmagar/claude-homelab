Next Edit Suggestions - Agent Client Protocol
[Protocol
](/get-started/introduction)[RFDs
](/rfds/about)[Community
](/community/communication)[Publications
](/publications)[Updates
](/updates)[Brand
](/brand)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://agentclientprotocol.com/llms.txt
](https://agentclientprotocol.com/llms.txt)
> Use this file to discover all available pages before exploring further.
Author(s): [@anna239](https://github.com/anna239)
##
[​
](#elevator-pitch)
Elevator pitch
>
> What are you proposing to change?
>
Add a **Next Edit Suggestion (NES)** capability to ACP, allowing agents to provide predictive code edits. The protocol is designed around **capability negotiation**: agents declare what events and context they can consume, and clients provide only what was requested.
##
[​
](#status-quo)
Status quo
>
> How do things work today and what problems does this cause? Why would we change things?
>
ACP currently has no mechanism for agents to provide inline edit predictions. Each client–agent pair implements NES through proprietary protocols.
##
[​
](#what-we-propose-to-do-about-it)
What we propose to do about it
>
> What are you proposing to improve the situation?
>
Introduce a `nes` capability that agents advertise during initialization. The capability declares:
* **Events** the agent wants to receive (file lifecycle notifications).
* **Context** the agent wants attached to each suggestion request.
The client inspects these declarations and provides only what was requested, minimizing overhead for simple agents while allowing rich context for advanced ones.
###
[​
](#capability-advertisement)
Capability advertisement
During `initialize`, the agent includes a `nes` field in `agentCapabilities`:
```
`{
"agentCapabilities": {
"nes": {
"events": {
"document": {
"didOpen": {},
"didChange": {
"syncKind": "incremental"
},
"didClose": {},
"didSave": {},
"didFocus": {}
}
},
"context": {
"recentFiles": {
"maxCount": 10
},
"relatedSnippets": {},
"editHistory": {
"maxCount": 6
},
"userActions": {
"maxCount": 16
},
"openFiles": {},
"diagnostics": {}
}
}
}
}
`
```
All fields under `events` and `context` are optional — an agent advertises only what it can use.
####
[​
](#client-capabilities)
Client capabilities
The **client** advertises its own NES-related capabilities in the `initialize` request. The client declares which suggestion kinds it supports beyond the basic `edit` kind. Agents should only suggest kinds that the client has advertised.
```
`{
"clientCapabilities": {
"nes": {
"jump": {},
"rename": {},
"searchAndReplace": {}
}
}
}
`
```
Each entry corresponds to a suggestion kind (see [Suggestion kinds](#suggestion-kinds) below). If a kind is absent, the agent must not produce suggestions of that kind.
###
[​
](#session-lifecycle)
Session lifecycle
If the `nes` capability is present, the client may call `nes/start` to begin an NES session. An NES session is **separate from and independent of** the ACP chat session — it has its own session ID, its own lifecycle, and its own stream of events and requests. A single ACP connection may have any number of active NES sessions alongside any number of chat sessions. The NES session is started via `nes/start` and closed via `nes/close`; it does not inherit state from, or share context with, chat sessions.
The agent can also use the existing `configOptions` mechanism to expose NES-related settings (model selection, debounce preferences, enabled/disabled state, etc.).
##
[​
](#implementation-details-and-plan)
Implementation details and plan
>
> Tell me more about your implementation. What is your detailed implementation plan?
>
###
[​
](#position-encoding)
Position encoding
All `Position` objects in NES use zero-based line and zero-based character offsets, following the same conventions as [LSP 3.17](https://microsoft.github.io/language-server-protocol/specifications/lsp/3.17/specification/#position). The meaning of the `character` offset depends on the negotiated **position encoding**.
Three encoding kinds are supported:
* `"utf-16"` — character offsets count UTF-16 code units. This is the **default** and must be supported by all clients and agents.
* `"utf-32"` — character offsets count Unicode code points.
* `"utf-8"` — character offsets count UTF-8 code units (bytes).
**Negotiation:** The client may declare the position encodings it supports in the `initialize` request via `clientCapabilities.positionEncodings`, listed in order of preference. The agent selects one from the client’s list and declares it in its `initialize` response as `agentCapabilities.positionEncoding`. If the client omits `positionEncodings`, or the agent omits `positionEncoding` in its response, both sides default to `"utf-16"`.
Client `initialize` request (excerpt):
```
`{
"clientCapabilities": {
"positionEncodings": ["utf-32", "utf-16"]
}
}
`
```
Agent `initialize` response (excerpt):
```
`{
"agentCapabilities": {
"nes": { ... },
"positionEncoding": "utf-32"
}
}
`
```
The negotiated encoding applies to all `Position` and `Range` values exchanged within NES — events, suggestion requests, and suggestion responses.
###
[​
](#events)
Events
Events are fire-and-forget notifications from client to agent. Every event is scoped to the NES session identified by the `sessionId` returned from `nes/start`. The client sends them only if the corresponding key is present in the agent’s advertised `events` capability (e.g. `nes.events.document` for NES).
####
[​
](#document/didopen)
`document/didOpen`
Sent when a file is opened in the editor.
```
`{
"jsonrpc": "2.0",
"method": "document/didOpen",
"params": {
"sessionId": "session\_abc123",
"uri": "file:///path/to/file.rs",
"languageId": "rust",
"version": 1,
"text": "fn main() {\\n println!(\\"hello\\");\\n}\\n"
}
}
`
```
####
[​
](#document/didchange)
`document/didChange`
Sent when a file is edited. Supports two sync modes declared by the agent:
* `"full"` — client sends entire file content each time.
* `"incremental"` — client sends only the changed ranges.
**Incremental:**
```
`{
"jsonrpc": "2.0",
"method": "document/didChange",
"params": {
"sessionId": "session\_abc123",
"uri": "file:///path/to/file.rs",
"version": 2,
"contentChanges": [
{
"range": {
"start": { "line": 1, "character": 4 },
"end": { "line": 1, "character": 4 }
},
"text": "let x = 42;\\n "
}
]
}
}
`
```
**Full:**
```
`{
"jsonrpc": "2.0",
"method": "document/didChange",
"params": {
"sessionId": "session\_abc123",
"uri": "file:///path/to/file.rs",
"version": 2,
"contentChanges": [
{
"text": "fn main() {\\n let x = 42;\\n println!(\\"hello\\");\\n}\\n"
}
]
}
}
`
```
####
[​
](#document/didclose)
`document/didClose`
Sent when a file is closed.
```
`{
"jsonrpc": "2.0",
"method": "document/didClose",
"params": {
"sessionId": "session\_abc123",
"uri": "file:///path/to/file.rs"
}
}
`
```
####
[​
](#document/didsave)
`document/didSave`
Sent when a file is saved.
```
`{
"jsonrpc": "2.0",
"method": "document/didSave",
"params": {
"sessionId": "session\_abc123",
"uri": "file:///path/to/file.rs"
}
}
`
```
####
[​
](#document/didfocus)
`document/didFocus`
Sent when a file becomes the active editor tab. Unlike `document/didOpen` (which fires once when a file is first opened), `document/didFocus` fires every time the user switches to a file, including files that are already open. This is the primary trigger for agents that need to refresh context on tab switch (e.g. re-indexing relevant code snippets).
```
`{
"jsonrpc": "2.0",
"method": "document/didFocus",
"params": {
"sessionId": "session\_abc123",
"uri": "file:///path/to/file.rs",
"version": 2,
"position": { "line": 5, "character": 12 },
"visibleRange": {
"start": { "line": 0, "character": 0 },
"end": { "line": 45, "character": 0 }
}
}
}
`
```
The `position` is the current cursor position. The `visibleRange` is the portion of the file currently visible in the editor viewport.
###
[​
](#suggestion-request)
Suggestion request
The client requests a suggestion by calling `nes/suggest`. Context fields are included only if the agent declared interest in the corresponding `nes.context` key.
```
`{
"jsonrpc": "2.0",
"id": 42,
"method": "nes/suggest",
"params": {
"sessionId": "session\_abc123",
"uri": "file:///path/to/file.rs",
"version": 2,
"position": { "line": 5, "character": 12 },
"selection": {
"start": { "line": 5, "character": 4 },
"end": { "line": 5, "character": 12 }
},
"triggerKind": "automatic",
"context": {
"recentFiles": [
{
"uri": "file:///path/to/utils.rs",
"languageId": "rust",
"text": "pub fn helper() -\> i32 { 42 }\\n"
}
],
"relatedSnippets": [
{
"uri": "file:///path/to/types.rs",
"excerpts": [
{
"startLine": 10,
"endLine": 25,
"text": "pub struct Config {\\n pub name: String,\\n ...\\n}"
}
]
}
],
"editHistory": [
{
"uri": "file:///path/to/file.rs",
"diff": "--- a/file.rs\\n+++ b/file.rs\\n@@ -3,0 +3,1 @@\\n+ let x = 42;"
}
],
"userActions": [
{
"action": "insertChar",
"uri": "file:///path/to/file.rs",
"position": { "line": 5, "character": 12 },
"timestampMs": 1719400000000
},
{
"action": "cursorMovement",
"uri": "file:///path/to/file.rs",
"position": { "line": 10, "character": 0 },
"timestampMs": 1719400001200
}
],
"openFiles": [
{
"uri": "file:///path/to/utils.rs",
"languageId": "rust",
"visibleRange": {
"start": { "line": 0, "character": 0 },
"end": { "line": 30, "character": 0 }
},
"lastFocusedMs": 1719399998000
},
{
"uri": "file:///path/to/types.rs",
"languageId": "rust",
"visibleRange": null,
"lastFocusedMs": 1719399990000
}
],
"diagnostics": [
{
"uri": "file:///path/to/file.rs",
"range": {
"start": { "line": 5, "character": 0 },
"end": { "line": 5, "character": 10 }
},
"severity": "error",
"message": "cannot find value `foo` in this scope"
}
]
}
}
}
`
```
`selection` is the current text selection range, if any. When the selection is empty (cursor is a point), this field may be omitted or have `start` equal to `end`. Agents can use selection state to predict replacements or transformations of the selected text.
`triggerKind` is one of:
* `"automatic"` — triggered by user typing or cursor movement
* `"diagnostic"` — triggered by a diagnostic (error/warning) appearing at or near the cursor position. The client includes the relevant diagnostics in the `diagnostics` context field so the agent can target a fix.
* `"manual"` — triggered by explicit user action (keyboard shortcut)
###
[​
](#suggestion-response)
Suggestion response
A suggestion is one of several kinds, each identified by the `kind` field. The `edit` kind is always supported; other kinds (`jump`, `rename`, `searchAndReplace`) require the client to advertise support in its capabilities.
**Edit suggestion:**
```
`{
"jsonrpc": "2.0",
"id": 42,
"result": {
"suggestions": [
{
"id": "sugg\_001",
"kind": "edit",
"uri": "file:///path/to/other\_file.rs",
"edits": [
{
"range": {
"start": { "line": 5, "character": 0 },
"end": { "line": 5, "character": 10 }
},
"newText": "let result = helper();"
}
],
"cursorPosition": { "line": 5, "character": 22 }
}
]
}
}
`
```
**Jump suggestion:**
```
`{
"jsonrpc": "2.0",
"id": 42,
"result": {
"suggestions": [
{
"id": "sugg\_002",
"kind": "jump",
"uri": "file:///path/to/other\_file.rs",
"position": { "line": 15, "character": 4 }
}
]
}
}
`
```
**Rename suggestion:**
```
`{
"jsonrpc": "2.0",
"id": 42,
"result": {
"suggestions": [
{
"id": "sugg\_003",
"kind": "rename",
"uri": "file:///path/to/file.rs",
"position": { "line": 5, "character": 10 },
"newName": "calculateTotal"
}
]
}
}
`
```
**Search-and-replace suggestion:**
```
`{
"jsonrpc": "2.0",
"id": 42,
"result": {
"suggestions": [
{
"id": "sugg\_004",
"kind": "searchAndReplace",
"uri": "file:///path/to/file.rs",
"search": "oldFunction",
"replace": "newFunction",
"isRegex": false
}
]
}
}
`
```
A response may contain a mix of suggestion kinds. The client decides how to present them (e.g. inline ghost text for edits, a navigation hint for jumps). Agents must only include suggestion kinds that the client has advertised in its capabilities (except `edit`, which is always supported).
Each suggestion contains:
* `id` — unique identifier for accept/reject tracking.
* `kind` — the suggestion kind (see [Suggestion kinds](#suggestion-kinds) below).
Edit suggestions additionally contain:
* `uri` — the file to edit.
* `edits` — one or more text edits to apply.
* `cursorPosition` — optional suggested cursor position after applying edits.
Jump suggestions additionally contain:
* `uri` — the file to navigate to.
* `position` — the target position within that file.
Rename suggestions additionally contain:
* `uri` — the file URI containing the symbol.
* `position` — the position of the symbol to rename.
* `newName` — the new name for the symbol.
Search-and-replace suggestions additionally contain:
* `uri` — the file URI to search within. Can be a folder, then operation is performed in all the files in this folder.
* `search` — the text or pattern to find.
* `replace` — the replacement text.
* `isRegex` (`boolean`, optional) — whether `search` is a regular expression. Defaults to `false`.
###
[​
](#accept-/-reject)
Accept / Reject
```
`{
"jsonrpc": "2.0",
"method": "nes/accept",
"params": {
"sessionId": "session\_abc123",
"id": "sugg\_001"
}
}
`
```
```
`{
"jsonrpc": "2.0",
"method": "nes/reject",
"params": {
"sessionId": "session\_abc123",
"id": "sugg\_001",
"reason": "rejected"
}
}
`
```
`reason` is one of:
* `"rejected"` — the user explicitly dismissed the suggestion (e.g. pressed Escape or typed something incompatible).
* `"ignored"` — the suggestion was shown but the user continued editing without interacting with it, and the context changed enough to invalidate it.
* `"replaced"` — the suggestion was superseded by a newer suggestion before the user could act on it.
* `"cancelled"` — the request was cancelled before the agent returned a response (e.g. the user typed quickly and the previous request became stale).
The `reason` field is optional. Providing granular reasons allows agents to improve their models — for example, a `"replaced"` suggestion carries different training signal than an explicit `"rejected"`.
###
[​
](#nes-session-start)
NES session start
The client provides workspace metadata when starting a session. This information is static for the lifetime of the session.
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "nes/start",
"params": {
"workspaceUri": "file:///Users/alice/projects/my-app",
"workspaceFolders": [
{
"uri": "file:///Users/alice/projects/my-app",
"name": "my-app"
}
],
"repository": {
"name": "my-app",
"owner": "alice",
"remoteUrl": "https://github.com/alice/my-app.git"
}
}
}
`
```
All fields in `params` are optional. The `repository` field is omitted if the workspace is not a git repository or the info is unavailable.
Response:
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"sessionId": "session\_abc123"
}
}
`
```
The returned `sessionId` scopes all subsequent NES events, requests, and notifications for that session.
####
[​
](#error-handling)
Error handling
The agent may reject `nes/start` with an error. In particular, agents that require authentication may return an `auth\_required` error:
```
`{
"jsonrpc": "2.0",
"id": 1,
"error": {
"code": -32000,
"message": "Authentication required",
"data": {
"reason": "auth\_required"
}
}
}
`
```
Clients **must** be prepared to handle `auth\_required` errors on `nes/start`. The recommended behavior is to prompt the user to authenticate (e.g. sign in or provide credentials) and retry the `nes/start` call after authentication succeeds. Clients should not silently ignore this error or assume NES is unavailable — the agent may be fully functional once the user authenticates.
###
[​
](#nes-session-close)
NES session close
The client closes an NES session by calling `nes/close`. The agent **must** cancel any ongoing work related to the NES session and free up any resources associated with it.
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "nes/close",
"params": {
"sessionId": "session\_abc123"
}
}
`
```
Response:
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {}
}
`
```
###
[​
](#suggestion-kinds)
Suggestion kinds
The `kind` field in each suggestion identifies its type. The following kinds are defined:
* **`edit`** — A text edit suggestion. Always supported; does not require a client capability.
* **`jump`** — Navigate to a different file/position. Requires `jump` in client capabilities.
* **`rename`** — Rename a symbol across the workspace. Requires `rename` in client capabilities.
* **`searchAndReplace`** — Search and replace text within a file/folder. Requires `searchAndReplace` in client capabilities.
Additional suggestion kinds may be added to the protocol in the future. Agents must only produce suggestions whose `kind` the client has advertised (except `edit`, which is always supported).
###
[​
](#config-options)
Config options
The agent can use the existing `configOptions` mechanism from ACP to expose NES-related settings. For example, an agent might return config options like:
```
`{
"configOptions": [
{
"id": "nes\_model",
"name": "Prediction Model",
"category": "model",
"type": "enum",
"currentValue": "fast",
"options": [
{ "value": "fast", "label": "Fast" },
{ "value": "accurate", "label": "Accurate" }
]
}
]
}
`
```
##
[​
](#frequently-asked-questions)
Frequently asked questions
>
> What questions have arisen over the course of authoring this document or during subsequent discussions?
>
###
[​
](#why-separate-events-from-context)
Why separate events from context?
Events and context serve different purposes and have different delivery models:
* **Events** are pushed as they happen — they allow the agent to maintain internal state (like an LSP server tracking open documents). This is the model Copilot uses.
* **Context** is attached to each request — it allows stateless agents to receive everything they need in one call. This is the model Zed Predict and Supermaven use.
A note about Cursor: Cursor has a separate context-collection phase (`RefreshTabContext`) that involves vector DB lookup and is triggered on file open, tab switch, and significant edits. The event-based approach supports this flow: an NES agent can listen for `document/didOpen`, `document/didFocus`, and accumulated `document/didChange` events to self-trigger its own context refresh. The `document/didFocus` event (with cursor position and visible range) and workspace metadata from `nes/start` provide all the inputs Cursor’s `RefreshTabContext` needs.
An agent may want both (events for incremental file tracking + context for edit history), or just one. The capability split lets each agent pick the model that fits its architecture.
###
[​
](#why-not-reuse-lsp’s-textdocument/didopen-etc-directly)
Why not reuse LSP’s `textDocument/didOpen` etc. directly?
LSP’s document sync notifications carry the same information, but:
1. ACP is not LSP — reusing method names could cause confusion in implementations that bridge both.
2. We may want to evolve the event payloads independently (e.g. adding metadata fields).
3. Using `document/` as a generic namespace keeps these methods reusable across different ACP capabilities (NES, and potentially others in the future) without tying them to a single feature.
###
[​
](#how-does-this-relate-to-pr-#325)
How does this relate to PR #325?
This RFD covers the session lifecycle and also suggests a protocol that would cover a variety of different nes providers
###
[​
](#why-provide-workspace-info-in-nes/start)
Why provide workspace info in `nes/start`?
Agents that perform server-side indexing (embedding-based retrieval, semantic search) need to know which repository they’re working with. This metadata — workspace root, repo name/owner, remote URL — is static for the session lifetime, so it belongs in the session start rather than being repeated on every request or requiring a separate query.
###
[​
](#what-alternative-approaches-did-you-consider)
What alternative approaches did you consider?
1. **Context-only** — Pass all file content, edit history, and metadata as context fields on each `nes/suggest` request, with no event notifications. This is simpler for stateless agents but forces the client to assemble and transmit potentially large payloads on every request, even when nothing changed. It also prevents agents from maintaining their own incremental state (e.g. an internal file mirror or semantic index).
2. **Events-only** — Rely entirely on event notifications (`didOpen`, `didChange`, etc.) and have the agent maintain all state internally, with `nes/suggest` sending only the cursor position. This is efficient on the wire but requires every agent to implement stateful document tracking, which is a high barrier for simple agents that just want the code around the cursor.
3. **Events + context (chosen)** — Allow agents to declare both. An agent that wants to track files incrementally can request events; an agent that prefers stateless request-response can request context fields; a sophisticated agent can use both (events for file sync, context for edit history and definition excerpts). This gives each agent the flexibility to pick the model that fits its architecture without imposing unnecessary complexity.
##
[​
](#revision-history)
Revision history
* 2026-02-22: Initial draft