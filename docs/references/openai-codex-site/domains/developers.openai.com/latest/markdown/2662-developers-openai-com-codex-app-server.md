App Server – Codex | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
### Getting Started
* [ Overview ](/codex)
* [ Quickstart ](/codex/quickstart)
* [ Explore use cases ](/codex/use-cases)
* [ Pricing ](/codex/pricing)
* Concepts
* [ Prompting ](/codex/prompting)
* [ Customization ](/codex/concepts/customization)
* [ Memories ](/codex/memories)
* [ Chronicle ](/codex/memories/chronicle)
* [ Sandboxing ](/codex/concepts/sandboxing)
* [ Subagents ](/codex/concepts/subagents)
* [ Workflows ](/codex/workflows)
* [ Models ](/codex/models)
* [ Cyber Safety ](/codex/concepts/cyber-safety)
### Using Codex
* App
* [ Overview ](/codex/app)
* [ Features ](/codex/app/features)
* [ Settings ](/codex/app/settings)
* [ Review ](/codex/app/review)
* [ Automations ](/codex/app/automations)
* [ Worktrees ](/codex/app/worktrees)
* [ Local Environments ](/codex/app/local-environments)
* [ In-app browser ](/codex/app/browser)
* [ Computer Use ](/codex/app/computer-use)
* [ Commands ](/codex/app/commands)
* [ Windows ](/codex/app/windows)
* [ Troubleshooting ](/codex/app/troubleshooting)
* IDE Extension
* [ Overview ](/codex/ide)
* [ Features ](/codex/ide/features)
* [ Settings ](/codex/ide/settings)
* [ IDE Commands ](/codex/ide/commands)
* [ Slash commands ](/codex/ide/slash-commands)
* CLI
* [ Overview ](/codex/cli)
* [ Features ](/codex/cli/features)
* [ Command Line Options ](/codex/cli/reference)
* [ Slash commands ](/codex/cli/slash-commands)
* Web
* [ Overview ](/codex/cloud)
* [ Environments ](/codex/cloud/environments)
* [ Internet Access ](/codex/cloud/internet-access)
* Integrations
* [ GitHub ](/codex/integrations/github)
* [ Slack ](/codex/integrations/slack)
* [ Linear ](/codex/integrations/linear)
* Codex Security
* [ Overview ](/codex/security)
* [ Setup ](/codex/security/setup)
* [ Improving the threat model ](/codex/security/threat-model)
* [ FAQ ](/codex/security/faq)
### Configuration
* Config File
* [ Config Basics ](/codex/config-basic)
* [ Advanced Config ](/codex/config-advanced)
* [ Config Reference ](/codex/config-reference)
* [ Sample Config ](/codex/config-sample)
* [ Speed ](/codex/speed)
* [ Rules ](/codex/rules)
* [ Hooks ](/codex/hooks)
* [ AGENTS.md ](/codex/guides/agents-md)
* [ MCP ](/codex/mcp)
* Plugins
* [ Overview ](/codex/plugins)
* [ Build plugins ](/codex/plugins/build)
* [ Skills ](/codex/skills)
* [ Subagents ](/codex/subagents)
### Administration
* [ Authentication ](/codex/auth)
* [ Agent approvals & security ](/codex/agent-approvals-security)
* [ Remote connections ](/codex/remote-connections)
* Enterprise
* [ Admin Setup ](/codex/enterprise/admin-setup)
* [ Governance ](/codex/enterprise/governance)
* [ Managed configuration ](/codex/enterprise/managed-configuration)
* [ Windows ](/codex/windows)
### Automation
* [ Non-interactive Mode ](/codex/noninteractive)
* [ Codex SDK ](/codex/sdk)
* [ App Server ](/codex/app-server)
* [ MCP Server ](/codex/guides/agents-sdk)
* [ GitHub Action ](/codex/github-action)
### Learn
* [ Best practices ](/codex/learn/best-practices)
* [ Videos ](/codex/videos)
* [ Community ](/community)
* Blog
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
* [ View all ](/blog/topic/codex)
* Cookbooks
* [ Codex Prompting Guide ](/cookbook/examples/gpt-5/codex_prompting_guide)
* [ Modernizing your Codebase with Codex ](/cookbook/examples/codex/code_modernization)
* [ View all ](/cookbook/topic/codex)
* [ Building AI Teams ](/codex/guides/build-ai-native-engineering-team)
### Releases
* [ Changelog ](/codex/changelog)
* [ Feature Maturity ](/codex/feature-maturity)
* [ Open Source ](/codex/open-source)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Codex app-server is the interface Codex uses to power rich clients (for example, the Codex VS Code extension). Use it when you want a deep integration inside your own product: authentication, conversation history, approvals, and streamed agent events. The app-server implementation is open source in the Codex GitHub repository ([openai/codex/codex-rs/app-server](https://github.com/openai/codex/tree/main/codex-rs/app-server)). See the [Open Source](/codex/open-source) page for the full list of open-source Codex components.
If you are automating jobs or running Codex in CI, use the
[Codex SDK](/codex/sdk) instead.
## Protocol
Like [MCP](https://modelcontextprotocol.io/), `codex app-server` supports bidirectional communication using JSON-RPC 2.0 messages (with the `"jsonrpc":"2.0"` header omitted on the wire).
Supported transports:
* `stdio` (`--listen stdio://`, default): newline-delimited JSON (JSONL).
* `websocket` (`--listen ws://IP:PORT`, experimental and unsupported): one JSON-RPC message per WebSocket text frame.
* `off` (`--listen off`): don’t expose a local transport.
When you run with `--listen ws://IP:PORT`, the same listener also serves basic HTTP health probes:
* `GET /readyz` returns `200 OK` once the listener accepts new connections.
* `GET /healthz` returns `200 OK` when the request doesn’t include an `Origin` header.
* Requests with an `Origin` header are rejected with `403 Forbidden`.
WebSocket transport is experimental and unsupported. Loopback listeners such as `ws://127.0.0.1:PORT` are appropriate for localhost and SSH port-forwarding workflows. Non-loopback WebSocket listeners currently allow unauthenticated connections by default during rollout, so configure WebSocket auth before exposing one remotely.
Supported WebSocket auth flags:
* `--ws-auth capability-token --ws-token-file /absolute/path`
* `--ws-auth capability-token --ws-token-sha256 HEX`
* `--ws-auth signed-bearer-token --ws-shared-secret-file /absolute/path`
For signed bearer tokens, you can also set `--ws-issuer`, `--ws-audience`, and `--ws-max-clock-skew-seconds`. Clients present the credential as `Authorization: Bearer \<token\>` during the WebSocket handshake, and app-server enforces auth before JSON-RPC `initialize`.
Prefer `--ws-token-file` over passing raw bearer tokens on the command line. Use `--ws-token-sha256` only when the client keeps the raw high-entropy token in a separate local secret store; the hash is only a verifier, and clients still need the original token.
In WebSocket mode, app-server uses bounded queues. When request ingress is full, the server rejects new requests with JSON-RPC error code `-32001` and message `"Server overloaded; retry later."` Clients should retry with an exponentially increasing delay and jitter.
## Message schema
Requests include `method`, `params`, and `id`:
```
`{ "method": "thread/start", "id": 10, "params": { "model": "gpt-5.4" } }`
```
Responses echo the `id` with either `result` or `error`:
```
`{ "id": 10, "result": { "thread": { "id": "thr\_123" } } }`
```
```
`{ "id": 10, "error": { "code": 123, "message": "Something went wrong" } }`
```
Notifications omit `id` and use only `method` and `params`:
```
`{ "method": "turn/started", "params": { "turn": { "id": "turn\_456" } } }`
```
You can generate a TypeScript schema or a JSON Schema bundle from the CLI. Each output is specific to the Codex version you ran, so the generated artifacts match that version exactly:
```
`codex app-server generate-ts --out ./schemas
codex app-server generate-json-schema --out ./schemas`
```
## Getting started
1. Start the server with `codex app-server` (default stdio transport) or `codex app-server --listen ws://127.0.0.1:4500` (experimental WebSocket transport).
2. Connect a client over the selected transport, then send `initialize` followed by the `initialized` notification.
3. Start a thread and a turn, then keep reading notifications from the active transport stream.
Example (Node.js / TypeScript):
```
`import { spawn } from "node:child\_process";
import readline from "node:readline";
const proc = spawn("codex", ["app-server"], {
stdio: ["pipe", "pipe", "inherit"],
});
const rl = readline.createInterface({ input: proc.stdout });
const send = (message: unknown) =\> {
proc.stdin.write(`${JSON.stringify(message)}\\n`);
};
let threadId: string | null = null;
rl.on("line", (line) =\> {
const msg = JSON.parse(line) as any;
console.log("server:", msg);
if (msg.id === 1 && msg.result?.thread?.id && !threadId) {
threadId = msg.result.thread.id;
send({
method: "turn/start",
id: 2,
params: {
threadId,
input: [{ type: "text", text: "Summarize this repo." }],
},
});
}
});
send({
method: "initialize",
id: 0,
params: {
clientInfo: {
name: "my\_product",
title: "My Product",
version: "0.1.0",
},
},
});
send({ method: "initialized", params: {} });
send({ method: "thread/start", id: 1, params: { model: "gpt-5.4" } });`
```
## Core primitives
* **Thread**: A conversation between a user and the Codex agent. Threads contain turns.
* **Turn**: A single user request and the agent work that follows. Turns contain items and stream incremental updates.
* **Item**: A unit of input or output (user message, agent message, command runs, file change, tool call, and more).
Use the thread APIs to create, list, or archive conversations. Drive a conversation with turn APIs and stream progress via turn notifications.
## Lifecycle overview
* **Initialize once per connection**: Immediately after opening a transport connection, send an `initialize` request with your client metadata, then emit `initialized`. The server rejects any request on that connection before this handshake.
* **Start (or resume) a thread**: Call `thread/start` for a new conversation, `thread/resume` to continue an existing one, or `thread/fork` to branch history into a new thread id.
* **Begin a turn**: Call `turn/start` with the target `threadId` and user input. Optional fields override model, personality, `cwd`, sandbox policy, and more.
* **Steer an active turn**: Call `turn/steer` to append user input to the currently in-flight turn without creating a new turn.
* **Stream events**: After `turn/start`, keep reading notifications on stdout: `thread/archived`, `thread/unarchived`, `item/started`, `item/completed`, `item/agentMessage/delta`, tool progress, and other updates.
* **Finish the turn**: The server emits `turn/completed` with final status when the model finishes or after a `turn/interrupt` cancellation.
## Initialization
Clients must send a single `initialize` request per transport connection before invoking any other method on that connection, then acknowledge with an `initialized` notification. Requests sent before initialization receive a `Not initialized` error, and repeated `initialize` calls on the same connection return `Already initialized`.
The server returns the user agent string it will present to upstream services plus `platformFamily` and `platformOs` values that describe the runtime target. Set `clientInfo` to identify your integration.
`initialize.params.capabilities` also supports per-connection notification opt-out via `optOutNotificationMethods`, which is a list of exact method names to suppress for that connection. Matching is exact (no wildcards/prefixes). Unknown method names are accepted and ignored.
**Important**: Use `clientInfo.name` to identify your client for the OpenAI Compliance Logs Platform. If you are developing a new Codex integration intended for enterprise use, please contact OpenAI to get it added to a known clients list. For more context, see the [Codex logs reference](https://chatgpt.com/admin/api-reference#tag/Logs:-Codex).
Example (from the Codex VS Code extension):
```
`{
"method": "initialize",
"id": 0,
"params": {
"clientInfo": {
"name": "codex\_vscode",
"title": "Codex VS Code Extension",
"version": "0.1.0"
}
}
}`
```
Example with notification opt-out:
```
`{
"method": "initialize",
"id": 1,
"params": {
"clientInfo": {
"name": "my\_client",
"title": "My Client",
"version": "0.1.0"
},
"capabilities": {
"experimentalApi": true,
"optOutNotificationMethods": ["thread/started", "item/agentMessage/delta"]
}
}
}`
```
## Experimental API opt-in
Some app-server methods and fields are intentionally gated behind `experimentalApi` capability.
* Omit `capabilities` (or set `experimentalApi` to `false`) to stay on the stable API surface, and the server rejects experimental methods/fields.
* Set `capabilities.experimentalApi` to `true` to enable experimental methods and fields.
```
`{
"method": "initialize",
"id": 1,
"params": {
"clientInfo": {
"name": "my\_client",
"title": "My Client",
"version": "0.1.0"
},
"capabilities": {
"experimentalApi": true
}
}
}`
```
If a client sends an experimental method or field without opting in, app-server rejects it with:
`\<descriptor\> requires experimentalApi capability`
## API overview
* `thread/start` - create a new thread; emits `thread/started` and automatically subscribes you to turn/item events for that thread.
* `thread/resume` - reopen an existing thread by id so later `turn/start` calls append to it.
* `thread/fork` - fork a thread into a new thread id by copying stored history; emits `thread/started` for the new thread.
* `thread/read` - read a stored thread by id without resuming it; set `includeTurns` to return full turn history. Returned `thread` objects include runtime `status`.
* `thread/list` - page through stored thread logs; supports cursor-based pagination plus `modelProviders`, `sourceKinds`, `archived`, `cwd`, and `searchTerm` filters. Returned `thread` objects include runtime `status`.
* `thread/turns/list` - page through a stored thread’s turn history without resuming it.
* `thread/loaded/list` - list the thread ids currently loaded in memory.
* `thread/name/set` - set or update a thread’s user-facing name for a loaded thread or a persisted rollout; emits `thread/name/updated`.
* `thread/goal/set` - set the goal for a loaded thread (experimental; requires `capabilities.experimentalApi`); emits `thread/goal/updated`.
* `thread/goal/get` - read the current goal for a loaded thread (experimental; requires `capabilities.experimentalApi`).
* `thread/goal/clear` - clear the goal for a loaded thread (experimental; requires `capabilities.experimentalApi`); emits `thread/goal/cleared`.
* `thread/metadata/update` - patch SQLite-backed stored thread metadata; currently supports persisted `gitInfo`.
* `thread/archive` - move a thread’s log file into the archived directory; returns `{}` on success and emits `thread/archived`.
* `thread/unsubscribe` - unsubscribe this connection from thread turn/item events. If this was the last subscriber, the server unloads the thread after a no-subscriber inactivity grace period and emits `thread/closed`.
* `thread/unarchive` - restore an archived thread rollout back into the active sessions directory; returns the restored `thread` and emits `thread/unarchived`.
* `thread/status/changed` - notification emitted when a loaded thread’s runtime `status` changes.
* `thread/compact/start` - trigger conversation history compaction for a thread; returns `{}` immediately while progress streams via `turn/\*` and `item/\*` notifications.
* `thread/shellCommand` - run a user-initiated shell command against a thread. This runs outside the sandbox with full access and doesn’t inherit the thread sandbox policy.
* `thread/backgroundTerminals/clean` - stop all running background terminals for a thread (experimental; requires `capabilities.experimentalApi`).
* `thread/rollback` - drop the last N turns from the in-memory context and persist a rollback marker; returns the updated `thread`.
* `turn/start` - add user input to a thread and begin Codex generation; responds with the initial `turn` and streams events. For `collaborationMode`, `settings.developer\_instructions: null` means “use built-in instructions for the selected mode.”
* `thread/inject\_items` - append raw Responses API items to a loaded thread’s model-visible history without starting a user turn.
* `turn/steer` - append user input to the active in-flight turn for a thread; returns the accepted `turnId`.
* `turn/interrupt` - request cancellation of an in-flight turn; success is `{}` and the turn ends with `status: "interrupted"`.
* `review/start` - kick off the Codex reviewer for a thread; emits `enteredReviewMode` and `exitedReviewMode` items.
* `command/exec` - run a single command under the server sandbox without starting a thread/turn.
* `command/exec/write` - write `stdin` bytes to a running `command/exec` session or close `stdin`.
* `command/exec/resize` - resize a running PTY-backed `command/exec` session.
* `command/exec/terminate` - stop a running `command/exec` session.
* `command/exec/outputDelta` (notify) - emitted for base64-encoded stdout/stderr chunks from a streaming `command/exec` session.
* `model/list` - list available models (set `includeHidden: true` to include entries with `hidden: true`) with effort options, optional `upgrade`, and `inputModalities`.
* `modelProvider/capabilities/read` - read provider capability bounds for model/provider combinations (experimental; requires `capabilities.experimentalApi`).
* `experimentalFeature/list` - list feature flags with lifecycle stage metadata and cursor pagination.
* `experimentalFeature/enablement/set` - patch in-memory runtime enablement for supported feature keys such as `apps` and `plugins`.
* `collaborationMode/list` - list collaboration mode presets (experimental, no pagination).
* `skills/list` - list skills for one or more `cwd` values (supports `forceReload` and optional `perCwdExtraUserRoots`).
* `skills/changed` (notify) - emitted when watched local skill files change.
* `marketplace/add` - add a remote plugin marketplace and persist it into the user’s marketplace config.
* `marketplace/upgrade` - refresh a configured Git marketplace, or all configured Git marketplaces when you omit the marketplace name.
* `plugin/list` - list discovered plugin marketplaces and plugin state, including install/auth policy metadata, marketplace load errors, featured plugin ids, and local, Git, or remote plugin source metadata.
* `plugin/read` - read one plugin by marketplace path or remote marketplace name and plugin name, including bundled skills, apps, and MCP server names when those details are available.
* `plugin/install` - install a plugin from a marketplace path or remote marketplace name.
* `plugin/uninstall` - uninstall an installed plugin.
* `app/list` - list available apps (connectors) with pagination plus accessibility/enabled metadata.
* `skills/config/write` - enable or disable skills by path.
* `mcpServer/oauth/login` - start an OAuth login for a configured MCP server; returns an authorization URL and emits `mcpServer/oauthLogin/completed` on completion.
* `tool/requestUserInput` - prompt the user with 1-3 short questions for a tool call (experimental); questions can set `isOther` for a free-form option.
* `config/mcpServer/reload` - reload MCP server configuration from disk and queue a refresh for loaded threads.
* `mcpServerStatus/list` - list MCP servers, tools, resources, and auth status (cursor + limit pagination). Use `detail: "full"` for full data or `detail: "toolsAndAuthOnly"` to omit resources.
* `mcpServer/resource/read` - read a single MCP resource through an initialized MCP server.
* `mcpServer/tool/call` - call a tool on a thread’s configured MCP server.
* `mcpServer/startupStatus/updated` (notify) - emitted when a configured MCP server’s startup status changes for a loaded thread.
* `windowsSandbox/setupStart` - start Windows sandbox setup for `elevated` or `unelevated` mode; returns quickly and later emits `windowsSandbox/setupCompleted`.
* `feedback/upload` - submit a feedback report (classification + optional reason/logs + conversation id, plus optional `extraLogFiles` attachments).
* `config/read` - fetch the effective configuration on disk after resolving configuration layering.
* `externalAgentConfig/detect` - detect external-agent artifacts that can be migrated with `includeHome` and optional `cwds`; each detected item includes `cwd` (`null` for home).
* `externalAgentConfig/import` - apply selected external-agent migration items by passing explicit `migrationItems` with `cwd` (`null` for home). Supported item types include config, skills, `AGENTS.md`, plugins, MCP server config, subagents, hooks, commands, and sessions; plugin imports emit `externalAgentConfig/import/completed`.
* `config/value/write` - write a single configuration key/value to the user’s `config.toml` on disk.
* `config/batchWrite` - apply configuration edits atomically to the user’s `config.toml` on disk.
* `configRequirements/read` - fetch requirements from `requirements.toml` and/or MDM, including allow-lists, pinned `featureRequirements`, and residency/network requirements (or `null` if you haven’t set any up).
* `fs/readFile`, `fs/writeFile`, `fs/createDirectory`, `fs/getMetadata`, `fs/readDirectory`, `fs/remove`, `fs/copy`, `fs/watch`, `fs/unwatch`, and `fs/changed` (notify) - operate on absolute filesystem paths through the app-server v2 filesystem API.
Plugin summaries include a `source` union. Local plugins return
`{ "type": "local", "path": ... }`, Git-backed marketplace entries return
`{ "type": "git", "url": ..., "path": ..., "refName": ..., "sha": ... }`,
and remote catalog entries return `{ "type": "remote" }`. For remote-only
catalog entries, `PluginMarketplaceEntry.path` can be `null`; pass
`remoteMarketplaceName` instead of `marketplacePath` when reading or installing
those plugins.
## Models
### List models (`model/list`)
Call `model/list` to discover available models and their capabilities before rendering model or personality selectors.
```
`{ "method": "model/list", "id": 6, "params": { "limit": 20, "includeHidden": false } }
{ "id": 6, "result": {
"data": [{
"id": "gpt-5.4",
"model": "gpt-5.4",
"displayName": "GPT-5.4",
"hidden": false,
"defaultReasoningEffort": "medium",
"supportedReasoningEfforts": [{
"reasoningEffort": "low",
"description": "Lower latency"
}],
"inputModalities": ["text", "image"],
"supportsPersonality": true,
"isDefault": true
}],
"nextCursor": null
} }`
```
Each model entry can include:
* `supportedReasoningEfforts` - supported effort options for the model.
* `defaultReasoningEffort` - suggested default effort for clients.
* `upgrade` - optional recommended upgrade model id for migration prompts in clients.
* `upgradeInfo` - optional upgrade metadata for migration prompts in clients.
* `hidden` - whether the model is hidden from the default picker list.
* `inputModalities` - supported input types for the model (for example `text`, `image`).
* `supportsPersonality` - whether the model supports personality-specific instructions such as `/personality`.
* `isDefault` - whether the model is the recommended default.
By default, `model/list` returns picker-visible models only. Set `includeHidden: true` if you need the full list and want to filter on the client side using `hidden`.
When `inputModalities` is missing (older model catalogs), treat it as `["text", "image"]` for backward compatibility.
### List experimental features (`experimentalFeature/list`)
Use this endpoint to discover feature flags with metadata and lifecycle stage:
```
`{ "method": "experimentalFeature/list", "id": 7, "params": { "limit": 20 } }
{ "id": 7, "result": {
"data": [{
"name": "unified\_exec",
"stage": "beta",
"displayName": "Unified exec",
"description": "Use the unified PTY-backed execution tool.",
"announcement": "Beta rollout for improved command execution reliability.",
"enabled": false,
"defaultEnabled": false
}],
"nextCursor": null
} }`
```
`stage` can be `beta`, `underDevelopment`, `stable`, `deprecated`, or `removed`. For non-beta flags, `displayName`, `description`, and `announcement` may be `null`.
## Threads
* `thread/read` reads a stored thread without subscribing to it; set `includeTurns` to include turns.
* `thread/turns/list` pages through a stored thread’s turn history without resuming it.
* `thread/list` supports cursor pagination plus `modelProviders`, `sourceKinds`, `archived`, `cwd`, and `searchTerm` filtering.
* `thread/loaded/list` returns the thread IDs currently in memory.
* `thread/archive` moves the thread’s persisted JSONL log into the archived directory.
* `thread/metadata/update` patches stored thread metadata, currently including persisted `gitInfo`.
* `thread/unsubscribe` unsubscribes the current connection from a loaded thread and can trigger `thread/closed` after an inactivity grace period.
* `thread/unarchive` restores an archived thread rollout back into the active sessions directory.
* `thread/compact/start` triggers compaction and returns `{}` immediately.
* `thread/rollback` drops the last N turns from the in-memory context and records a rollback marker in the thread’s persisted JSONL log.
* `thread/inject\_items` appends raw Responses API items to a loaded thread’s model-visible history without starting a user turn.
### Start or resume a thread
Start a fresh thread when you need a new Codex conversation.
```
`{ "method": "thread/start", "id": 10, "params": {
"model": "gpt-5.4",
"cwd": "/Users/me/project",
"approvalPolicy": "never",
"sandbox": "workspaceWrite",
"personality": "friendly",
"serviceName": "my\_app\_server\_client"
} }
{ "id": 10, "result": {
"thread": {
"id": "thr\_123",
"preview": "",
"ephemeral": false,
"modelProvider": "openai",
"createdAt": 1730910000
}
} }
{ "method": "thread/started", "params": { "thread": { "id": "thr\_123" } } }`
```
`serviceName` is optional. Set it when you want app-server to tag thread-level metrics with your integration’s service name.
To continue a stored session, call `thread/resume` with the `thread.id` you recorded earlier. The response shape matches `thread/start`. You can also pass the same configuration overrides supported by `thread/start`, such as `personality`:
```
`{ "method": "thread/resume", "id": 11, "params": {
"threadId": "thr\_123",
"personality": "friendly"
} }
{ "id": 11, "result": { "thread": { "id": "thr\_123", "name": "Bug bash notes", "ephemeral": false } } }`
```
Resuming a thread doesn’t update `thread.updatedAt` (or the rollout file’s modified time) by itself. The timestamp updates when you start a turn.
If you mark an enabled MCP server as `required` in config and that server fails to initialize, `thread/start` and `thread/resume` fail instead of continuing without it.
`dynamicTools` on `thread/start` is an experimental field (requires `capabilities.experimentalApi = true`). Codex persists these dynamic tools in the thread rollout metadata and restores them on `thread/resume` when you don’t supply new dynamic tools.
If you resume with a different model than the one recorded in the rollout, Codex emits a warning and applies a one-time model-switch instruction on the next turn.
To branch from a stored session, call `thread/fork` with the `thread.id`. This creates a new thread id and emits a `thread/started` notification for it:
```
`{ "method": "thread/fork", "id": 12, "params": { "threadId": "thr\_123" } }
{ "id": 12, "result": { "thread": { "id": "thr\_456" } } }
{ "method": "thread/started", "params": { "thread": { "id": "thr\_456" } } }`
```
When a user-facing thread title has been set, app-server hydrates `thread.name` on `thread/list`, `thread/read`, `thread/resume`, `thread/unarchive`, and `thread/rollback` responses. `thread/start` and `thread/fork` may omit `name` (or return `null`) until a title is set later.
### Read a stored thread (without resuming)
Use `thread/read` when you want stored thread data but don’t want to resume the thread or subscribe to its events.
* `includeTurns` - when `true`, the response includes the thread’s turns; when `false` or omitted, you get the thread summary only.
* Returned `thread` objects include runtime `status` (`notLoaded`, `idle`, `systemError`, or `active` with `activeFlags`).
```
`{ "method": "thread/read", "id": 19, "params": { "threadId": "thr\_123", "includeTurns": true } }
{ "id": 19, "result": { "thread": { "id": "thr\_123", "name": "Bug bash notes", "ephemeral": false, "status": { "type": "notLoaded" }, "turns": [] } } }`
```
Unlike `thread/resume`, `thread/read` doesn’t load the thread into memory or emit `thread/started`.
### List thread turns
Use `thread/turns/list` to page a stored thread’s turn history without resuming it. Results default to newest-first so clients can fetch older turns with `nextCursor`. The response also includes `backwardsCursor`; pass it as `cursor` with `sortDirection: "asc"` to fetch turns newer than the first item from the earlier page.
```
`{ "method": "thread/turns/list", "id": 20, "params": {
"threadId": "thr\_123",
"limit": 50,
"sortDirection": "desc"
} }
{ "id": 20, "result": {
"data": [],
"nextCursor": "older-turns-cursor-or-null",
"backwardsCursor": "newer-turns-cursor-or-null"
} }`
```
### List threads (with pagination & filters)
`thread/list` lets you render a history UI. Results default to newest-first by `createdAt`. Filters apply before pagination. Pass any combination of:
* `cursor` - opaque string from a prior response; omit for the first page.
* `limit` - server defaults to a reasonable page size if unset.
* `sortKey` - `created\_at` (default) or `updated\_at`.
* `modelProviders` - restrict results to specific providers; unset, null, or an empty array includes all providers.
* `sourceKinds` - restrict results to specific thread sources. When omitted or `[]`, the server defaults to interactive sources only: `cli` and `vscode`.
* `archived` - when `true`, list archived threads only. When `false` or omitted, list non-archived threads (default).
* `cwd` - restrict results to threads whose session current working directory exactly matches this path.
* `searchTerm` - search stored thread summaries and metadata before pagination.
`sourceKinds` accepts the following values:
* `cli`
* `vscode`
* `exec`
* `appServer`
* `subAgent`
* `subAgentReview`
* `subAgentCompact`
* `subAgentThreadSpawn`
* `subAgentOther`
* `unknown`
Example:
```
`{ "method": "thread/list", "id": 20, "params": {
"cursor": null,
"limit": 25,
"sortKey": "created\_at"
} }
{ "id": 20, "result": {
"data": [
{ "id": "thr\_a", "preview": "Create a TUI", "ephemeral": false, "modelProvider": "openai", "createdAt": 1730831111, "updatedAt": 1730831111, "name": "TUI prototype", "status": { "type": "notLoaded" } },
{ "id": "thr\_b", "preview": "Fix tests", "ephemeral": true, "modelProvider": "openai", "createdAt": 1730750000, "updatedAt": 1730750000, "status": { "type": "notLoaded" } }
],
"nextCursor": "opaque-token-or-null"
} }`
```
When `nextCursor` is `null`, you have reached the final page.
### Update stored thread metadata
Use `thread/metadata/update` to patch stored thread metadata without resuming the thread. Today this supports persisted `gitInfo`; omitted fields are left unchanged, and explicit `null` clears a stored value.
```
`{ "method": "thread/metadata/update", "id": 21, "params": {
"threadId": "thr\_123",
"gitInfo": { "branch": "feature/sidebar-pr" }
} }
{ "id": 21, "result": {
"thread": {
"id": "thr\_123",
"gitInfo": { "sha": null, "branch": "feature/sidebar-pr", "originUrl": null }
}
} }`
```
### Track thread status changes
`thread/status/changed` is emitted whenever a loaded thread’s runtime status changes. The payload includes `threadId` and the new `status`.
```
`{
"method": "thread/status/changed",
"params": {
"threadId": "thr\_123",
"status": { "type": "active", "activeFlags": ["waitingOnApproval"] }
}
}`
```
### List loaded threads
`thread/loaded/list` returns thread IDs currently loaded in memory.
```
`{ "method": "thread/loaded/list", "id": 21 }
{ "id": 21, "result": { "data": ["thr\_123", "thr\_456"] } }`
```
### Unsubscribe from a loaded thread
`thread/unsubscribe` removes the current connection’s subscription to a thread. The response status is one of:
* `unsubscribed` when the connection was subscribed and is now removed.
* `notSubscribed` when the connection wasn’t subscribed to that thread.
* `notLoaded` when the thread isn’t loaded.
If this was the last subscriber, the server keeps the thread loaded until it has no subscribers and no thread activity for 30 minutes. When the grace period expires, app-server unloads the thread and emits a `thread/status/changed` transition to `notLoaded` plus `thread/closed`.
```
`{ "method": "thread/unsubscribe", "id": 22, "params": { "threadId": "thr\_123" } }
{ "id": 22, "result": { "status": "unsubscribed" } }`
```
If the thread later expires:
```
`{ "method": "thread/status/changed", "params": {
"threadId": "thr\_123",
"status": { "type": "notLoaded" }
} }
{ "method": "thread/closed", "params": { "threadId": "thr\_123" } }`
```
### Archive a thread
Use `thread/archive` to move the persisted thread log (stored as a JSONL file on disk) into the archived sessions directory.
```
`{ "method": "thread/archive", "id": 22, "params": { "threadId": "thr\_b" } }
{ "id": 22, "result": {} }
{ "method": "thread/archived", "params": { "threadId": "thr\_b" } }`
```
Archived threads won’t appear in future calls to `thread/list` unless you pass `archived: true`.
### Unarchive a thread
Use `thread/unarchive` to move an archived thread rollout back into the active sessions directory.
```
`{ "method": "thread/unarchive", "id": 24, "params": { "threadId": "thr\_b" } }
{ "id": 24, "result": { "thread": { "id": "thr\_b", "name": "Bug bash notes" } } }
{ "method": "thread/unarchived", "params": { "threadId": "thr\_b" } }`
```
### Trigger thread compaction
Use `thread/compact/start` to trigger manual history compaction for a thread. The request returns immediately with `{}`.
App-server emits progress as standard `turn/\*` and `item/\*` notifications on the same `threadId`, including a `contextCompaction` item lifecycle (`item/started` then `item/completed`).
```
`{ "method": "thread/compact/start", "id": 25, "params": { "threadId": "thr\_b" } }
{ "id": 25, "result": {} }`
```
### Run a thread shell command
Use `thread/shellCommand` for user-initiated shell commands that belong to a thread. The request returns immediately with `{}` while progress streams through standard `turn/\*` and `item/\*` notifications.
This API runs outside the sandbox with full access and doesn’t inherit the thread sandbox policy. Clients should expose it only for explicit user-initiated commands.
If the thread already has an active turn, the command runs as an auxiliary action on that turn and its formatted output is injected into the turn’s message stream. If the thread is idle, app-server starts a standalone turn for the shell command.
```
`{ "method": "thread/shellCommand", "id": 26, "params": { "threadId": "thr\_b", "command": "git status --short" } }
{ "id": 26, "result": {} }`
```
### Clean background terminals
Use `thread/backgroundTerminals/clean` to stop all running background terminals associated with a thread. This method is experimental and requires `capabilities.experimentalApi = true`.
```
`{ "method": "thread/backgroundTerminals/clean", "id": 27, "params": { "threadId": "thr\_b" } }
{ "id": 27, "result": {} }`
```
### Roll back recent turns
Use `thread/rollback` to remove the last `numTurns` entries from the in-memory context and persist a rollback marker in the rollout log. The returned `thread` includes `turns` populated after the rollback.
```
`{ "method": "thread/rollback", "id": 28, "params": { "threadId": "thr\_b", "numTurns": 1 } }
{ "id": 28, "result": { "thread": { "id": "thr\_b", "name": "Bug bash notes", "ephemeral": false } } }`
```
## Turns
The `input` field accepts a list of items:
* `{ "type": "text", "text": "Explain this diff" }`
* `{ "type": "image", "url": "https://.../design.png" }`
* `{ "type": "localImage", "path": "/tmp/screenshot.png" }`
You can override configuration settings per turn (model, effort, personality, `cwd`, sandbox policy, summary). When specified, these settings become the defaults for later turns on the same thread. `outputSchema` applies only to the current turn. For `sandboxPolicy.type = "externalSandbox"`, set `networkAccess` to `restricted` or `enabled`; for `workspaceWrite`, `networkAccess` remains a boolean.
For `turn/start.collaborationMode`, `settings.developer\_instructions: null` means “use built-in instructions for the selected mode” rather than clearing mode instructions.
### Sandbox read access (`ReadOnlyAccess`)
`sandboxPolicy` supports explicit read-access controls:
* `readOnly`: optional `access` (`{ "type": "fullAccess" }` by default, or restricted roots).
* `workspaceWrite`: optional `readOnlyAccess` (`{ "type": "fullAccess" }` by default, or restricted roots).
Restricted read access shape:
```
`{
"type": "restricted",
"includePlatformDefaults": true,
"readableRoots": ["/Users/me/shared-read-only"]
}`
```
On macOS, `includePlatformDefaults: true` appends a curated platform-default Seatbelt policy for restricted-read sessions. This improves tool compatibility without broadly allowing all of `/System`.
Examples:
```
`{ "type": "readOnly", "access": { "type": "fullAccess" } }`
```
```
`{
"type": "workspaceWrite",
"writableRoots": ["/Users/me/project"],
"readOnlyAccess": {
"type": "restricted",
"includePlatformDefaults": true,
"readableRoots": ["/Users/me/shared-read-only"]
},
"networkAccess": false
}`
```
### Start a turn
```
`{ "method": "turn/start", "id": 30, "params": {
"threadId": "thr\_123",
"input": [ { "type": "text", "text": "Run tests" } ],
"cwd": "/Users/me/project",
"approvalPolicy": "unlessTrusted",
"sandboxPolicy": {
"type": "workspaceWrite",
"writableRoots": ["/Users/me/project"],
"networkAccess": true
},
"model": "gpt-5.4",
"effort": "medium",
"summary": "concise",
"personality": "friendly",
"outputSchema": {
"type": "object",
"properties": { "answer": { "type": "string" } },
"required": ["answer"],
"additionalProperties": false
}
} }
{ "id": 30, "result": { "turn": { "id": "turn\_456", "status": "inProgress", "items": [], "error": null } } }`
```
### Inject items into a thread
Use `thread/inject\_items` to append prebuilt Responses API items to a loaded thread’s prompt history without starting a user turn. These items are persisted to the rollout and included in subsequent model requests.
```
`{ "method": "thread/inject\_items", "id": 31, "params": {
"threadId": "thr\_123",
"items": [
{
"type": "message",
"role": "assistant",
"content": [{ "type": "output\_text", "text": "Previously computed context." }]
}
]
} }
{ "id": 31, "result": {} }`
```
### Steer an active turn
Use `turn/steer` to append more user input to the active in-flight turn.
* Include `expectedTurnId`; it must match the active turn id.
* The request fails if there is no active turn on the thread.
* `turn/steer` doesn’t emit a new `turn/started` notification.
* `turn/steer` doesn’t accept turn-level overrides (`model`, `cwd`, `sandboxPolicy`, or `outputSchema`).
```
`{ "method": "turn/steer", "id": 32, "params": {
"threadId": "thr\_123",
"input": [ { "type": "text", "text": "Actually focus on failing tests first." } ],
"expectedTurnId": "turn\_456"
} }
{ "id": 32, "result": { "turnId": "turn\_456" } }`
```
### Start a turn (invoke a skill)
Invoke a skill explicitly by including `$\<skill-name\>` in the text input and adding a `skill` input item alongside it.
```
`{ "method": "turn/start", "id": 33, "params": {
"threadId": "thr\_123",
"input": [
{ "type": "text", "text": "$skill-creator Add a new skill for triaging flaky CI and include step-by-step usage." },
{ "type": "skill", "name": "skill-creator", "path": "/Users/me/.codex/skills/skill-creator/SKILL.md" }
]
} }
{ "id": 33, "result": { "turn": { "id": "turn\_457", "status": "inProgress", "items": [], "error": null } } }`
```
### Interrupt a turn
```
`{ "method": "turn/interrupt", "id": 31, "params": { "threadId": "thr\_123", "turnId": "turn\_456" } }
{ "id": 31, "result": {} }`
```
On success, the turn finishes with `status: "interrupted"`.
## Review
`review/start` runs the Codex reviewer for a thread and streams review items. Targets include:
* `uncommittedChanges`
* `baseBranch` (diff against a branch)
* `commit` (review a specific commit)
* `custom` (free-form instructions)
Use `delivery: "inline"` (default) to run the review on the existing thread, or `delivery: "detached"` to fork a new review thread.
Example request/response:
```
`{ "method": "review/start", "id": 40, "params": {
"threadId": "thr\_123",
"delivery": "inline",
"target": { "type": "commit", "sha": "1234567deadbeef", "title": "Polish tui colors" }
} }
{ "id": 40, "result": {
"turn": {
"id": "turn\_900",
"status": "inProgress",
"items": [
{ "type": "userMessage", "id": "turn\_900", "content": [ { "type": "text", "text": "Review commit 1234567: Polish tui colors" } ] }
],
"error": null
},
"reviewThreadId": "thr\_123"
} }`
```
For a detached review, use `"delivery": "detached"`. The response is the same shape, but `reviewThreadId` will be the id of the new review thread (different from the original `threadId`). The server also emits a `thread/started` notification for that new thread before streaming the review turn.
Codex streams the usual `turn/started` notification followed by an `item/started` with an `enteredReviewMode` item:
```
`{
"method": "item/started",
"params": {
"item": {
"type": "enteredReviewMode",
"id": "turn\_900",
"review": "current changes"
}
}
}`
```
When the reviewer finishes, the server emits `item/started` and `item/completed` containing an `exitedReviewMode` item with the final review text:
```
`{
"method": "item/completed",
"params": {
"item": {
"type": "exitedReviewMode",
"id": "turn\_900",
"review": "Looks solid overall..."
}
}
}`
```
Use this notification to render the reviewer output in your client.
## Command execution
`command/exec` runs a single command (`argv` array) under the server sandbox without creating a thread.
```
`{ "method": "command/exec", "id": 50, "params": {
"command": ["ls", "-la"],
"cwd": "/Users/me/project",
"sandboxPolicy": { "type": "workspaceWrite" },
"timeoutMs": 10000
} }
{ "id": 50, "result": { "exitCode": 0, "stdout": "...", "stderr": "" } }`
```
Use `sandboxPolicy.type = "externalSandbox"` if you already sandbox the server process and want Codex to skip its own sandbox enforcement. For external sandbox mode, set `networkAccess` to `restricted` (default) or `enabled`. For `readOnly` and `workspaceWrite`, use the same optional `access` / `readOnlyAccess` structure shown above.
Notes:
* The server rejects empty `command` arrays.
* `sandboxPolicy` accepts the same shape used by `turn/start` (for example, `dangerFullAccess`, `readOnly`, `workspaceWrite`, `externalSandbox`).
* When omitted, `timeoutMs` falls back to the server default.
* Set `tty: true` for PTY-backed sessions, and use `processId` when you plan to follow up with `command/exec/write`, `command/exec/resize`, or `command/exec/terminate`.
* Set `streamStdoutStderr: true` to receive `command/exec/outputDelta` notifications while the command is running.
### Read admin requirements (`configRequirements/read`)
Use `configRequirements/read` to inspect the effective admin requirements loaded from `requirements.toml` and/or MDM.
```
`{ "method": "configRequirements/read", "id": 52, "params": {} }
{ "id": 52, "result": {
"requirements": {
"allowedApprovalPolicies": ["onRequest", "unlessTrusted"],
"allowedSandboxModes": ["readOnly", "workspaceWrite"],
"featureRequirements": {
"personality": true,
"unified\_exec": false
},
"network": {
"enabled": true,
"allowedDomains": ["api.openai.com"],
"allowUnixSockets": ["/tmp/example.sock"],
"dangerouslyAllowAllUnixSockets": false
}
}
} }`
```
`result.requirements` is `null` when no requirements are configured. See the docs on [`requirements.toml`](/codex/config-reference#requirementstoml) for details on supported keys and values.
### Windows sandbox setup (`windowsSandbox/setupStart`)
Custom Windows clients can trigger sandbox setup asynchronously instead of blocking on startup checks.
```
`{ "method": "windowsSandbox/setupStart", "id": 53, "params": { "mode": "elevated" } }
{ "id": 53, "result": { "started": true } }`
```
App-server starts setup in the background and later emits a completion notification:
```
`{
"method": "windowsSandbox/setupCompleted",
"params": { "mode": "elevated", "success": true, "error": null }
}`
```
Modes:
* `elevated` - run the elevated Windows sandbox setup path.
* `unelevated` - run the legacy setup/preflight path.
## Filesystem
The v2 filesystem APIs operate on absolute paths. Use `fs/watch` when a client needs to invalidate UI state after a file or directory changes.
```
`{ "method": "fs/watch", "id": 54, "params": {
"watchId": "0195ec6b-1d6f-7c2e-8c7a-56f2c4a8b9d1",
"path": "/Users/me/project/.git/HEAD"
} }
{ "id": 54, "result": { "path": "/Users/me/project/.git/HEAD" } }
{ "method": "fs/changed", "params": {
"watchId": "0195ec6b-1d6f-7c2e-8c7a-56f2c4a8b9d1",
"changedPaths": ["/Users/me/project/.git/HEAD"]
} }
{ "method": "fs/unwatch", "id": 55, "params": {
"watchId": "0195ec6b-1d6f-7c2e-8c7a-56f2c4a8b9d1"
} }
{ "id": 55, "result": {} }`
```
Watching a file emits `fs/changed` for that file path, including updates delivered by replace or rename operations.
## Events
Event notifications are the server-initiated stream for thread lifecycles, turn lifecycles, and the items within them. After you start or resume a thread, keep reading the active transport stream for `thread/started`, `thread/archived`, `thread/unarchived`, `thread/closed`, `thread/status/changed`, `turn/\*`, `item/\*`, and `serverRequest/resolved` notifications.
### Notification opt-out
Clients can suppress specific notifications per connection by sending exact method names in `initialize.params.capabilities.optOutNotificationMethods`.
* Exact-match only: `item/agentMessage/delta` suppresses only that method.
* Unknown method names are ignored.
* Applies to the current `thread/\*`, `turn/\*`, `item/\*`, and related v2 notifications.
* Doesn’t apply to requests, responses, or errors.
### Fuzzy file search events (experimental)
The fuzzy file search session API emits per-query notifications:
* `fuzzyFileSearch/sessionUpdated` - `{ sessionId, query, files }` with the current matches for the active query.
* `fuzzyFileSearch/sessionCompleted` - `{ sessionId }` once indexing and matching for that query completes.
### Windows sandbox setup events
* `windowsSandbox/setupCompleted` - `{ mode, success, error }` emitted after a `windowsSandbox/setupStart` request finishes.
### Turn events
* `turn/started` - `{ turn }` with the turn id, empty `items`, and `status: "inProgress"`.
* `turn/completed` - `{ turn }` where `turn.status` is `completed`, `interrupted`, or `failed`; failures carry `{ error: { message, codexErrorInfo?, additionalDetails? } }`.
* `turn/diff/updated` - `{ threadId, turnId, diff }` with the latest aggregated unified diff across every file change in the turn.
* `turn/plan/updated` - `{ turnId, explanation?, plan }` whenever the agent shares or changes its plan; each `plan` entry is `{ step, status }` with `status` in `pending`, `inProgress`, or `completed`.
* `thread/tokenUsage/updated` - usage updates for the active thread.
`turn/diff/updated` and `turn/plan/updated` currently include empty `items` arrays even when item events stream. Use `item/\*` notifications as the source of truth for turn items.
### Items
`ThreadItem` is the tagged union carried in turn responses and `item/\*` notifications. Common item types include:
* `userMessage` - `{id, content}` where `content` is a list of user inputs (`text`, `image`, or `localImage`).
* `agentMessage` - `{id, text, phase?}` containing the accumulated agent reply. When present, `phase` uses Responses API wire values (`commentary`, `final\_answer`).
* `plan` - `{id, text}` containing proposed plan text in plan mode. Treat the final `plan` item from `item/completed` as authoritative.
* `reasoning` - `{id, summary, content}` where `summary` holds streamed reasoning summaries and `content` holds raw reasoning blocks.
* `commandExecution` - `{id, command, cwd, status, commandActions, aggregatedOutput?, exitCode?, durationMs?}`.
* `fileChange` - `{id, changes, status}` describing proposed edits; `changes` list `{path, kind, diff}`.
* `mcpToolCall` - `{id, server, tool, status, arguments, result?, error?}`.
* `dynamicToolCall` - `{id, tool, arguments, status, contentItems?, success?, durationMs?}` for client-executed dynamic tool invocations.
* `collabToolCall` - `{id, tool, status, senderThreadId, receiverThreadId?, newThreadId?, prompt?, agentStatus?}`.
* `webSearch` - `{id, query, action?}` for web search requests issued by the agent.
* `imageView` - `{id, path}` emitted when the agent invokes the image viewer tool.
* `enteredReviewMode` - `{id, review}` sent when the reviewer starts.
* `exitedReviewMode` - `{id, review}` emitted when the reviewer finishes.
* `contextCompaction` - `{id}` emitted when Codex compacts the conversation history.
For `webSearch.action`, the action `type` can be `search` (`query?`, `queries?`), `openPage` (`url?`), or `findInPage` (`url?`, `pattern?`).
The app server deprecates the legacy `thread/compacted` notification; use the `contextCompaction` item instead.
All items emit two shared lifecycle events:
* `item/started` - emits the full `item` when a new unit of work begins; the `item.id` matches the `itemId` used by deltas.
* `item/completed` - sends the final `item` once work finishes; treat this as the authoritative state.
### Item deltas
* `item/agentMessage/delta` - appends streamed text for the agent message.
* `item/plan/delta` - streams proposed plan text. The final `plan` item may not exactly equal the concatenated deltas.
* `item/reasoning/summaryTextDelta` - streams readable reasoning summaries; `summaryIndex` increments when a new summary section opens.
* `item/reasoning/summaryPartAdded` - marks a boundary between reasoning summary sections.
* `item/reasoning/textDelta` - streams raw reasoning text (when supported by the model).
* `item/commandExecution/outputDelta` - streams stdout/stderr for a command; append deltas in order.
* `item/fileChange/outputDelta` - contains the tool call response of the underlying `apply\_patch` tool call.
## Errors
If a turn fails, the server emits an `error` event with `{ error: { message, codexErrorInfo?, additionalDetails? } }` and then finishes the turn with `status: "failed"`. When an upstream HTTP status is available, it appears in `codexErrorInfo.httpStatusCode`.
Common `codexErrorInfo` values include:
* `ContextWindowExceeded`
* `UsageLimitExceeded`
* `HttpConnectionFailed` (4xx/5xx upstream errors)
* `ResponseStreamConnectionFailed`
* `ResponseStreamDisconnected`
* `ResponseTooManyFailedAttempts`
* `BadRequest`, `Unauthorized`, `SandboxError`, `InternalServerError`, `Other`
When an upstream HTTP status is available, the server forwards it in `httpStatusCode` on the relevant `codexErrorInfo` variant.
## Approvals
Depending on a user’s Codex settings, command execution and file changes may require approval. The app-server sends a server-initiated JSON-RPC request to the client, and the client responds with a decision payload.
* Command execution decisions: `accept`, `acceptForSession`, `decline`, `cancel`, or `{ "acceptWithExecpolicyAmendment": { "execpolicy\_amendment": ["cmd", "..."] } }`.
* File change decisions: `accept`, `acceptForSession`, `decline`, `cancel`.
* Requests include `threadId` and `turnId` - use them to scope UI state to the active conversation.
* The server resumes or declines the work and ends the item with `item/completed`.
### Command execution approvals
Order of messages:
1. `item/started` shows the pending `commandExecution` item with `command`, `cwd`, and other fields.
2. `item/commandExecution/requestApproval` includes `itemId`, `threadId`, `turnId`, optional `reason`, optional `command`, optional `cwd`, optional `commandActions`, optional `proposedExecpolicyAmendment`, optional `networkApprovalContext`, and optional `availableDecisions`. When `initialize.params.capabilities.experimentalApi = true`, the payload can also include experimental `additionalPermissions` describing requested per-command sandbox access. Any filesystem paths inside `additionalPermissions` are absolute on the wire.
3. Client responds with one of the command execution approval decisions above.
4. `serverRequest/resolved` confirms that the pending request has been answered or cleared.
5. `item/completed` returns the final `commandExecution` item with `status: completed | failed | declined`.
When `networkApprovalContext` is present, the prompt is for managed network access (not a general shell-command approval). The current v2 schema exposes the target `host` and `protocol`; clients should render a network-specific prompt and not rely on `command` being a user-meaningful shell command preview.
Codex groups concurrent network approval prompts by destination (`host`, protocol, and port). The app-server may therefore send one prompt that unblocks multiple queued requests to the same destination, while different ports on the same host are treated separately.
### File change approvals
Order of messages:
1. `item/started` emits a `fileChange` item with proposed `changes` and `status: "inProgress"`.
2. `item/fileChange/requestApproval` includes `itemId`, `threadId`, `turnId`, optional `reason`, and optional `grantRoot`.
3. Client responds with one of the file change approval decisions above.
4. `serverRequest/resolved` confirms that the pending request has been answered or cleared.
5. `item/completed` returns the final `fileChange` item with `status: completed | failed | declined`.
### `tool/requestUserInput`
When the client responds to `item/tool/requestUserInput`, app-server emits `serverRequest/resolved` with `{ threadId, requestId }`. If the pending request is cleared by turn start, turn completion, or turn interruption before the client answers, the server emits the same notification for that cleanup.
### Dynamic tool calls (experimental)
`dynamicTools` on `thread/start` and the corresponding `item/tool/call` request or response flow are experimental APIs.
When a dynamic tool is invoked during a turn, app-server emits:
1. `item/started` with `item.type = "dynamicToolCall"`, `status = "inProgress"`, plus `tool` and `arguments`.
2. `item/tool/call` as a server request to the client.
3. The client response payload with returned content items.
4. `item/completed` with `item.type = "dynamicToolCall"`, the final `status`, and any returned `contentItems` or `success` value.
### MCP tool-call approvals (apps)
App (connector) tool calls can also require approval. When an app tool call has side effects, the server may elicit approval with `tool/requestUserInput` and options such as **Accept**, **Decline**, and **Cancel**. Destructive tool annotations always trigger approval even when the tool also advertises less-privileged hints. If the user declines or cancels, the related `mcpToolCall` item completes with an error instead of running the tool.
## Skills
Invoke a skill by including `$\<skill-name\>` in the user text input. Add a `skill` input item (recommended) so the server injects full skill instructions instead of relying on the model to resolve the name.
```
`{
"method": "turn/start",
"id": 101,
"params": {
"threadId": "thread-1",
"input": [
{
"type": "text",
"text": "$skill-creator Add a new skill for triaging flaky CI."
},
{
"type": "skill",
"name": "skill-creator",
"path": "/Users/me/.codex/skills/skill-creator/SKILL.md"
}
]
}
}`
```
If you omit the `skill` item, the model will still parse the `$\<skill-name\>` marker and try to locate the skill, which can add latency.
Example:
```
`$skill-creator Add a new skill for triaging flaky CI and include step-by-step usage.`
```
Use `skills/list` to fetch available skills (optionally scoped by `cwds`, with `forceReload`). You can also include `perCwdExtraUserRoots` to scan extra absolute paths as `user` scope for specific `cwd` values. App-server ignores entries whose `cwd` isn’t present in `cwds`. `skills/list` may reuse a cached result per `cwd`; set `forceReload: true` to refresh from disk. When present, the server reads `interface` and `dependencies` from `SKILL.json`.
```
`{ "method": "skills/list", "id": 25, "params": {
"cwds": ["/Users/me/project", "/Users/me/other-project"],
"forceReload": true,
"perCwdExtraUserRoots": [
{
"cwd": "/Users/me/project",
"extraUserRoots": ["/Users/me/shared-skills"]
}
]
} }
{ "id": 25, "result": {
"data": [{
"cwd": "/Users/me/project",
"skills": [
{
"name": "skill-creator",
"description": "Create or update a Codex skill",
"enabled": true,
"interface": {
"displayName": "Skill Creator",
"shortDescription": "Create or update a Codex skill"
},
"dependencies": {
"tools": [
{
"type": "env\_var",
"value": "GITHUB\_TOKEN",
"description": "GitHub API token"
},
{
"type": "mcp",
"value": "github",
"transport": "streamable\_http",
"url": "https://example.com/mcp"
}
]
}
}
],
"errors": []
}]
} }`
```
The server also emits `skills/changed` notifications when watched local skill files change. Treat this as an invalidation signal and rerun `skills/list` with your current params when needed.
To enable or disable a skill by path:
```
`{
"method": "skills/config/write",
"id": 26,
"params": {
"path": "/Users/me/.codex/skills/skill-creator/SKILL.md",
"enabled": false
}
}`
```
## Apps (connectors)
Use `app/list` to fetch available apps. In the CLI/TUI, `/apps` is the user-facing picker; in custom clients, call `app/list` directly. Each entry includes both `isAccessible` (available to the user) and `isEnabled` (enabled in `config.toml`) so clients can distinguish install/access from local enabled state. App entries can also include optional `branding`, `appMetadata`, and `labels` fields.
```
`{ "method": "app/list", "id": 50, "params": {
"cursor": null,
"limit": 50,
"threadId": "thread-1",
"forceRefetch": false
} }
{ "id": 50, "result": {
"data": [
{
"id": "demo-app",
"name": "Demo App",
"description": "Example connector for documentation.",
"logoUrl": "https://example.com/demo-app.png",
"logoUrlDark": null,
"distributionChannel": null,
"branding": null,
"appMetadata": null,
"labels": null,
"installUrl": "https://chatgpt.com/apps/demo-app/demo-app",
"isAccessible": true,
"isEnabled": true
}
],
"nextCursor": null
} }`
```
If you provide `threadId`, app feature gating (`features.apps`) uses that thread’s config snapshot. When omitted, app-server uses the latest global config.
`app/list` returns after both accessible apps and directory apps load. Set `forceRefetch: true` to bypass app caches and fetch fresh data. Cache entries are only replaced when refreshes succeed.
The server also emits `app/list/updated` notifications whenever either source (accessible apps or directory apps) finishes loading. Each notification includes the latest merged app list.
```
`{
"method": "app/list/updated",
"params": {
"data": [
{
"id": "demo-app",
"name": "Demo App",
"description": "Example connector for documentation.",
"logoUrl": "https://example.com/demo-app.png",
"logoUrlDark": null,
"distributionChannel": null,
"branding": null,
"appMetadata": null,
"labels": null,
"installUrl": "https://chatgpt.com/apps/demo-app/demo-app",
"isAccessible": true,
"isEnabled": true
}
]
}
}`
```
Invoke an app by inserting `$\<app-slug\>` in the text input and adding a `mention` input item with the `app://\<id\>` path (recommended).
```
`{
"method": "turn/start",
"id": 51,
"params": {
"threadId": "thread-1",
"input": [
{
"type": "text",
"text": "$demo-app Pull the latest updates from the team."
},
{
"type": "mention",
"name": "Demo App",
"path": "app://demo-app"
}
]
}
}`
```
### Config RPC examples for app settings
Use `config/read`, `config/value/write`, and `config/batchWrite` to inspect or update app controls in `config.toml`.
Read the effective app config shape (including `\_default` and per-tool overrides):
```
`{ "method": "config/read", "id": 60, "params": { "includeLayers": false } }
{ "id": 60, "result": {
"config": {
"apps": {
"\_default": {
"enabled": true,
"destructive\_enabled": true,
"open\_world\_enabled": true
},
"google\_drive": {
"enabled": true,
"destructive\_enabled": false,
"default\_tools\_approval\_mode": "prompt",
"tools": {
"files/delete": { "enabled": false, "approval\_mode": "approve" }
}
}
}
}
} }`
```
Update a single app setting:
```
`{
"method": "config/value/write",
"id": 61,
"params": {
"keyPath": "apps.google\_drive.default\_tools\_approval\_mode",
"value": "prompt",
"mergeStrategy": "replace"
}
}`
```
Apply multiple app edits atomically:
```
`{
"method": "config/batchWrite",
"id": 62,
"params": {
"edits": [
{
"keyPath": "apps.\_default.destructive\_enabled",
"value": false,
"mergeStrategy": "upsert"
},
{
"keyPath": "apps.google\_drive.tools.files/delete.approval\_mode",
"value": "approve",
"mergeStrategy": "upsert"
}
]
}
}`
```
### Detect and import external agent config
Use `externalAgentConfig/detect` to discover external-agent artifacts that can be migrated, then pass the selected entries to `externalAgentConfig/import`.
Detection example:
```
`{ "method": "externalAgentConfig/detect", "id": 63, "params": {
"includeHome": true,
"cwds": ["/Users/me/project"]
} }
{ "id": 63, "result": {
"items": [
{
"itemType": "AGENTS\_MD",
"description": "Import /Users/me/project/CLAUDE.md to /Users/me/project/AGENTS.md.",
"cwd": "/Users/me/project"
},
{
"itemType": "SKILLS",
"description": "Copy skill folders from /Users/me/.claude/skills to /Users/me/.agents/skills.",
"cwd": null
}
]
} }`
```
Import example:
```
`{ "method": "externalAgentConfig/import", "id": 64, "params": {
"migrationItems": [
{
"itemType": "AGENTS\_MD",
"description": "Import /Users/me/project/CLAUDE.md to /Users/me/project/AGENTS.md.",
"cwd": "/Users/me/project"
}
]
} }
{ "id": 64, "result": {} }`
```
When a request includes plugin imports, the server emits `externalAgentConfig/import/completed` after the import finishes. This notification may arrive immediately after the response or after background remote imports complete.
Supported `itemType` values are `AGENTS\_MD`, `CONFIG`, `SKILLS`, `PLUGINS`,
and `MCP\_SERVER\_CONFIG`. For `PLUGINS` items, `details.plugins` lists each
`marketplaceName` and the `pluginNames` Codex can try to migrate. Detection
returns only items that still have work to do. For example, Codex skips AGENTS
migration when `AGENTS.md` already exists and is non-empty, and skill imports
don’t overwrite existing skill directories.
When detecting plugins from `.claude/settings.json`, Codex reads configured
marketplace sources from `extraKnownMarketplaces`. If `enabledPlugins` contains
plugins from `claude-plugins-official` but the marketplace source is missing,
Codex infers `anthropics/claude-plugins-official` as the source.
## Auth endpoints
The JSON-RPC auth/account surface exposes request/response methods plus server-initiated notifications (no `id`). Use these to determine auth state, start or cancel logins, logout, inspect ChatGPT rate limits, and notify workspace owners about depleted credits or usage limits.
### Authentication modes
Codex supports these authentication modes. `account/updated.authMode` shows the active mode and includes the current ChatGPT `planType` when available. `account/read` also reports account and plan details.
* **API key (`apikey`)** - the caller supplies an OpenAI API key with `type: "apiKey"`, and Codex stores it for API requests.
* **ChatGPT managed (`chatgpt`)** - Codex owns the ChatGPT OAuth flow, persists tokens, and refreshes them automatically. Start with `type: "chatgpt"` for the browser flow or `type: "chatgptDeviceCode"` for the device-code flow.
* **ChatGPT external tokens (`chatgptAuthTokens`)** - experimental and intended for host apps that already own the user’s ChatGPT auth lifecycle. The host app supplies an `accessToken`, `chatgptAccountId`, and optional `chatgptPlanType` directly, and must refresh the token when asked.
### API overview
* `account/read` - fetch current account info; optionally refresh tokens.
* `account/login/start` - begin login (`apiKey`, `chatgpt`, `chatgptDeviceCode`, or experimental `chatgptAuthTokens`).
* `account/login/completed` (notify) - emitted when a login attempt finishes (success or error).
* `account/login/cancel` - cancel a pending managed ChatGPT login by `loginId`.
* `account/logout` - sign out; triggers `account/updated`.
* `account/updated` (notify) - emitted whenever auth mode changes (`authMode`: `apikey`, `chatgpt`, `chatgptAuthTokens`, or `null`) and includes `planType` when available.
* `account/chatgptAuthTokens/refresh` (server request) - request fresh externally managed ChatGPT tokens after an authorization error.
* `account/rateLimits/read` - fetch ChatGPT rate limits.
* `account/rateLimits/updated` (notify) - emitted whenever a user’s ChatGPT rate limits change.
* `account/sendAddCreditsNudgeEmail` - ask ChatGPT to email a workspace owner about depleted credits or a reached usage limit.
* `mcpServer/oauthLogin/completed` (notify) - emitted after a `mcpServer/oauth/login` flow finishes; payload includes `{ name, success, error? }`.
* `mcpServer/startupStatus/updated` (notify) - emitted when a configured MCP server’s startup status changes for a loaded thread; payload includes `{ name, status, error }`.
### 1) Check auth state
Request:
```
`{ "method": "account/read", "id": 1, "params": { "refreshToken": false } }`
```
Response examples:
```
`{ "id": 1, "result": { "account": null, "requiresOpenaiAuth": false } }`
```
```
`{ "id": 1, "result": { "account": null, "requiresOpenaiAuth": true } }`
```
```
`{
"id": 1,
"result": { "account": { "type": "apiKey" }, "requiresOpenaiAuth": true }
}`
```
```
`{
"id": 1,
"result": {
"account": {
"type": "chatgpt",
"email": "user@example.com",
"planType": "pro"
},
"requiresOpenaiAuth": true
}
}`
```
Field notes:
* `refreshToken` (boolean): set `true` to force a token refresh in managed ChatGPT mode. In external token mode (`chatgptAuthTokens`), app-server ignores this flag.
* `requiresOpenaiAuth` reflects the active provider; when `false`, Codex can run without OpenAI credentials.
### 2) Log in with an API key
1. Send:
```
`{
"method": "account/login/start",
"id": 2,
"params": { "type": "apiKey", "apiKey": "sk-..." }
}`
```
2. Expect:
```
`{ "id": 2, "result": { "type": "apiKey" } }`
```
3. Notifications:
```
`{
"method": "account/login/completed",
"params": { "loginId": null, "success": true, "error": null }
}`
```
```
`{
"method": "account/updated",
"params": { "authMode": "apikey", "planType": null }
}`
```
### 3) Log in with ChatGPT (browser flow)
1. Start:
```
`{ "method": "account/login/start", "id": 3, "params": { "type": "chatgpt" } }`
```
```
`{
"id": 3,
"result": {
"type": "chatgpt",
"loginId": "\<uuid\>",
"authUrl": "https://chatgpt.com/...&redirect\_uri=http%3A%2F%2Flocalhost%3A\<port\>%2Fauth%2Fcallback"
}
}`
```
2. Open `authUrl` in a browser; the app-server hosts the local callback.
3. Wait for notifications:
```
`{
"method": "account/login/completed",
"params": { "loginId": "\<uuid\>", "success": true, "error": null }
}`
```
```
`{
"method": "account/updated",
"params": { "authMode": "chatgpt", "planType": "plus" }
}`
```
### 3b) Log in with ChatGPT (device-code flow)
Use this flow when your client owns the sign-in ceremony or when a browser callback is brittle.
1. Start:
```
`{
"method": "account/login/start",
"id": 4,
"params": { "type": "chatgptDeviceCode" }
}`
```
```
`{
"id": 4,
"result": {
"type": "chatgptDeviceCode",
"loginId": "\<uuid\>",
"verificationUrl": "https://auth.openai.com/codex/device",
"userCode": "ABCD-1234"
}
}`
```
2. Show `verificationUrl` and `userCode` to the user; the frontend owns the UX.
3. Wait for notifications:
```
`{
"method": "account/login/completed",
"params": { "loginId": "\<uuid\>", "success": true, "error": null }
}`
```
```
`{
"method": "account/updated",
"params": { "authMode": "chatgpt", "planType": "plus" }
}`
```
### 3c) Log in with externally managed ChatGPT tokens (`chatgptAuthTokens`)
Use this experimental mode only when a host application owns the user’s ChatGPT auth lifecycle and supplies tokens directly. Clients must set `capabilities.experimentalApi = true` during `initialize` before using this login type.
1. Send:
```
`{
"method": "account/login/start",
"id": 7,
"params": {
"type": "chatgptAuthTokens",
"accessToken": "\<jwt\>",
"chatgptAccountId": "org-123",
"chatgptPlanType": "business"
}
}`
```
2. Expect:
```
`{ "id": 7, "result": { "type": "chatgptAuthTokens" } }`
```
3. Notifications:
```
`{
"method": "account/login/completed",
"params": { "loginId": null, "success": true, "error": null }
}`
```
```
`{
"method": "account/updated",
"params": { "authMode": "chatgptAuthTokens", "planType": "business" }
}`
```
When the server receives a `401 Unauthorized`, it may request refreshed tokens from the host app:
```
`{
"method": "account/chatgptAuthTokens/refresh",
"id": 8,
"params": { "reason": "unauthorized", "previousAccountId": "org-123" }
}
{ "id": 8, "result": { "accessToken": "\<jwt\>", "chatgptAccountId": "org-123", "chatgptPlanType": "business" } }`
```
The server retries the original request after a successful refresh response. Requests time out after about 10 seconds.
### 4) Cancel a ChatGPT login
```
`{ "method": "account/login/cancel", "id": 4, "params": { "loginId": "\<uuid\>" } }
{ "method": "account/login/completed", "params": { "loginId": "\<uuid\>", "success": false, "error": "..." } }`
```
### 5) Logout
```
`{ "method": "account/logout", "id": 5 }
{ "id": 5, "result": {} }
{ "method": "account/updated", "params": { "authMode": null, "planType": null } }`
```
### 6) Rate limits (ChatGPT)
```
`{ "method": "account/rateLimits/read", "id": 6 }
{ "id": 6, "result": {
"rateLimits": {
"limitId": "codex",
"limitName": null,
"primary": { "usedPercent": 25, "windowDurationMins": 15, "resetsAt": 1730947200 },
"secondary": null,
"rateLimitReachedType": null
},
"rateLimitsByLimitId": {
"codex": {
"limitId": "codex",
"limitName": null,
"primary": { "usedPercent": 25, "windowDurationMins": 15, "resetsAt": 1730947200 },
"secondary": null,
"rateLimitReachedType": null
},
"codex\_other": {
"limitId": "codex\_other",
"limitName": "codex\_other",
"primary": { "usedPercent": 42, "windowDurationMins": 60, "resetsAt": 1730950800 },
"secondary": null,
"rateLimitReachedType": null
}
}
} }
{ "method": "account/rateLimits/updated", "params": {
"rateLimits": {
"limitId": "codex",
"primary": { "usedPercent": 31, "windowDurationMins": 15, "resetsAt": 1730948100 }
}
} }`
```
Field notes:
* `rateLimits` is the backward-compatible single-bucket view.
* `rateLimitsByLimitId` (when present) is the multi-bucket view keyed by metered `limit\_id` (for example `codex`).
* `limitId` is the metered bucket identifier.
* `limitName` is an optional user-facing label for the bucket.
* `usedPercent` is current usage within the quota window.
* `windowDurationMins` is the quota window length.
* `resetsAt` is a Unix timestamp (seconds) for the next reset.
* `planType` is included when the backend returns the ChatGPT plan associated with a bucket.
* `credits` is included when the backend returns remaining workspace credit details.
* `rateLimitReachedType` identifies the backend-classified limit state when one has been reached.
### 7) Notify a workspace owner about a limit
Use `account/sendAddCreditsNudgeEmail` to ask ChatGPT to email a workspace owner when credits are depleted or a usage limit has been reached.
```
`{ "method": "account/sendAddCreditsNudgeEmail", "id": 7, "params": { "creditType": "credits" } }
{ "id": 7, "result": { "status": "sent" } }`
```
Use `creditType: "credits"` when workspace credits are depleted, or `creditType: "usage\_limit"` when the workspace usage limit has been reached. If the owner was already notified recently, the response status is `cooldown\_active`.