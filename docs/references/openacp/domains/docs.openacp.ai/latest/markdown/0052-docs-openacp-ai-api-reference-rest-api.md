REST API | OpenACP Docs
GitBook Assistant
##### Good morning
I'm here to help you with the docs.
What is this page about?What should I read next?Can you give an example?
⌘Ctrli
AI Based on your context
Send
[](/)
* [README](/)
*
Getting Started
* [Overview](/getting-started/getting-started)
* [What is OpenACP?](/getting-started/what-is-openacp)
* [Quick Start](/getting-started/quick-start)
* [For Contributors](/getting-started/for-contributors)
*
Platform Setup
* [Choose Your Platform](/platform-setup/platform-setup)
* [Telegram](/platform-setup/telegram)
* [Discord](/platform-setup/discord)
* [Slack](/platform-setup/slack)
*
Using OpenACP
* [Overview](/using-openacp/using-openacp)
* [Chat Commands](/using-openacp/chat-commands)
* [Sessions](/using-openacp/sessions)
* [Agents](/using-openacp/agents)
* [Permissions](/using-openacp/permissions)
* [Voice & Speech](/using-openacp/voice-and-speech)
* [Files & Media](/using-openacp/files-and-media)
*
Self-Hosting
* [Overview](/self-hosting/self-hosting)
* [Installation](/self-hosting/installation)
* [Configuration](/self-hosting/configuration)
* [Daemon Mode](/self-hosting/daemon-mode)
* [Security](/self-hosting/security)
* [Logging](/self-hosting/logging)
* [Updating](/self-hosting/updating)
*
Features
* [Overview](/features/features)
* [Tunnel & Port Forwarding](/features/tunnel)
* [Context Resume](/features/context-resume)
* [Output Modes](/features/output-modes)
* [Usage & Budget](/features/usage-and-budget)
* [Session Persistence](/features/session-persistence)
* [Session Handoff](/features/session-handoff)
* [Agent Switch](/features/agent-switch)
* [Workspaces](/features/multi-instance)
* [App Connectivity](/features/app-connectivity)
* [Doctor Diagnostics](/features/doctor)
* [Assistant Mode](/features/assistant-mode)
*
Architecture
* [Overview](/architecture/architecture)
* [Core Design](/architecture/core-design)
* [Plugin System](/architecture/plugin-system)
* [Command System](/architecture/command-system)
* [Built-in Plugins](/architecture/built-in-plugins)
* [Writing Plugins](/architecture/writing-plugins)
*
Extending
* [Overview](/extending/extending)
* [Getting Started: Your First Plugin](/extending/getting-started-plugin)
* [Plugin System](/extending/plugin-system)
* [Plugin SDK Reference](/extending/plugin-sdk-reference)
* [Dev Mode](/extending/dev-mode)
* [Building Adapters](/extending/building-adapters)
* [Adapter Reference](/extending/adapter-reference)
* [Contributing](/extending/contributing)
*
API Reference
* [Overview](/api-reference/api-reference)
* [CLI Commands](/api-reference/cli-commands)
* [REST API](/api-reference/rest-api)
* [Configuration Schema](/api-reference/configuration-schema)
* [Environment Variables](/api-reference/environment-variables)
*
Troubleshooting
* [Common Issues](/troubleshooting/troubleshooting)
* [Telegram Issues](/troubleshooting/telegram-issues)
* [Discord Issues](/troubleshooting/discord-issues)
* [Slack Issues](/troubleshooting/slack-issues)
* [Agent Issues](/troubleshooting/agent-issues)
* [FAQ](/troubleshooting/faq)
[Powered by GitBook](https://www.gitbook.com/?utm_source=content&amp;utm_medium=trademark&amp;utm_campaign=xDIegDd7TZzhXcvU0Y6N&amp;utm_content=site_RPD3m)[](https://www.gitbook.com/?utm_source=content&amp;utm_medium=trademark&amp;utm_campaign=xDIegDd7TZzhXcvU0Y6N&amp;utm_content=site_RPD3m)
On this page
The OpenACP daemon exposes a local HTTP API used by the CLI and the web dashboard.
**Base URL:** `http://127.0.0.1:21420` (configurable via `api.host` and `api.port`)
**Auth:** Two-tier authentication:
1.
**Secret token** — from `\<instance-root\>/api-secret` (full admin access)
2.
**JWT access token** — scoped, revokable tokens issued by the auth system
Copy
```
`# Using secret token
TOKEN=$(cat \~/openacp-workspace/.openacp/api-secret)
curl -H "Authorization: Bearer $TOKEN" http://localhost:21420/api/sessions
# Using JWT token
curl -H "Authorization: Bearer $JWT" http://localhost:21420/api/sessions`
```
The secret file is created automatically with mode `0600` on first start. Protect it like an SSH private key.
**Exempt from auth:** `GET /api/health`, `GET /api/version`.
**Body size limit:** 1 MB.
**API documentation:** Swagger UI is available at `/docs` when the server is running.
##
[](#health-and-system)
Health & System
###
[](#get-api-health)
GET /api/health
Returns daemon health. No auth required.
**Response**
`uptime` is milliseconds since daemon start. `sessions.active` counts sessions with status `active` or `initializing`.
###
[](#get-api-version)
GET /api/version
Returns daemon version string. No auth required.
**Response**
###
[](#post-api-restart)
POST /api/restart
Sends a restart signal to the daemon. The daemon exits cleanly and the process manager (or `openacp start`) restarts it.
**Response**
Returns `501` if restart is not available in the current run mode.
###
[](#get-api-adapters)
GET /api/adapters
Lists registered channel adapters.
**Response**
##
[](#sessions)
Sessions
###
[](#get-api-sessions)
GET /api/sessions
Lists all sessions (active, finished, cancelled, error).
**Response**
Session `status` values: `initializing`, `active`, `finished`, `cancelled`, `error`.
###
[](#get-api-sessions-id)
GET /api/sessions/:id
Returns details for a single session.
**Response**
Returns `404` if not found.
###
[](#post-api-sessions)
POST /api/sessions
Creates a new session.
**Request body** (all fields optional)
`agent` defaults to `defaultAgent` from config. `workspace` defaults to the instance workspace directory (parent of `.openacp/`).
**Response**
Returns `429` if `maxConcurrentSessions` is reached.
Permissions are auto-approved for sessions created via the API when no channel adapter is attached.
###
[](#delete-api-sessions-id)
DELETE /api/sessions/:id
Cancels a session.
**Response**
Returns `404` if not found.
###
[](#post-api-sessions-id-prompt)
POST /api/sessions/:id/prompt
Enqueues a prompt for a session. The session processes prompts serially; `queueDepth` indicates how many are waiting.
**Request body**
**Response**
Returns `400` if the session is `cancelled`, `finished`, or `error`. Returns `404` if not found.
###
[](#patch-api-sessions-id-bypass)
PATCH /api/sessions/:id/bypass
Enables or disables bypass permissions for a session.
**Request body**
**Response**
###
[](#post-api-sessions-id-permission)
POST /api/sessions/:id/permission
Resolves a pending permission request for a session.
**Request body**
**Response**
Returns `400` if there is no matching pending request.
###
[](#post-api-sessions-id-summary)
POST /api/sessions/:id/summary
Requests the agent to generate a summary name for the session.
**Response**
###
[](#post-api-sessions-id-archive)
POST /api/sessions/:id/archive
Archives a session.
**Response**
###
[](#post-api-sessions-adopt)
POST /api/sessions/adopt
Adopts an existing external agent session and surfaces it as a messaging thread.
**Request body**
`agent` and `agentSessionId` are required. `cwd` defaults to the daemon's working directory. `channel` defaults to the first registered adapter.
**Response**
`status` is `"existing"` if the session was already active (topic is pinged instead of created). Returns `429` on session limit, `400` for unsupported agent.
##
[](#agents)
Agents
###
[](#get-api-agents)
GET /api/agents
Lists agents configured in the daemon.
**Response**
##
[](#configuration)
Configuration
###
[](#get-api-config)
GET /api/config
Returns the full runtime config. Sensitive fields (`botToken`, `token`, `apiKey`, `secret`, `password`, `webhookSecret`) are redacted to `"\*\*\*"`.
**Response**
###
[](#patch-api-config)
PATCH /api/config
Updates a single config value by dot-notation path. Only fields marked as `safe` in the config registry can be modified via the API.
**Request body**
`value` can be any JSON type. String values that parse as JSON are used as-is.
**Response**
`needsRestart: true` means the change requires a daemon restart to take effect. Returns `403` for fields not in the safe-fields scope.
###
[](#get-api-config-editable)
GET /api/config/editable
Returns metadata about editable config fields (used by the web dashboard). Includes `path`, `displayName`, `group`, `type`, `options`, `value`, and `hotReload`.
##
[](#topics)
Topics
Topics represent channel adapter threads (Telegram forum topics, Discord threads, etc.).
###
[](#get-api-topics)
GET /api/topics
Lists all topics. Optionally filter by status.
**Query params**
Param
Description
`status`
Comma-separated status filter, e.g. `active,finished`
**Response**
Returns `501` if topic management is not available (no adapter with topic support).
###
[](#delete-api-topics-sessionid)
DELETE /api/topics/:sessionId
Deletes the topic for a session. Returns `409` if the session is active and `--force` is not set. Returns `403` for system topics.
**Query params**
Param
Description
`force`
Set to `true` to delete even if the session is active
**Response**
###
[](#post-api-topics-cleanup)
POST /api/topics/cleanup
Deletes all topics matching the given statuses. Returns counts of deleted and failed topics.
**Request body** (optional)
**Response**
##
[](#tunnel)
Tunnel
###
[](#get-api-tunnel)
GET /api/tunnel
Returns tunnel status for the primary tunnel service.
**Response** (when enabled)
**Response** (when disabled)
###
[](#get-api-tunnel-list)
GET /api/tunnel/list
Lists all active user tunnels.
**Response**
###
[](#post-api-tunnel)
POST /api/tunnel
Creates a new tunnel to a local port.
**Request body**
`port` is required. `label` and `sessionId` are optional.
**Response**
Returns `400` if the tunnel service is not enabled.
###
[](#delete-api-tunnel-port)
DELETE /api/tunnel/:port
Stops the tunnel for a specific local port.
**Response**
###
[](#delete-api-tunnel)
DELETE /api/tunnel
Stops all user tunnels.
**Response**
##
[](#notifications)
Notifications
###
[](#post-api-notify)
POST /api/notify
Sends a notification message to all registered channel adapters (e.g. to the Notifications topic in Telegram).
**Request body**
**Response**
##
[](#session-config)
Session Config
###
[](#get-api-sessions-id-config)
GET /api/sessions/:id/config
Returns the agent-declared config options for a session (modes, models, toggles).
**Response**
###
[](#put-api-sessions-id-config-configid)
PUT /api/sessions/:id/config/:configId
Updates a config option value for a session.
**Request body**
**Response**
##
[](#authentication)
Authentication
###
[](#post-api-v1-auth-tokens)
POST /api/v1/auth/tokens
Creates a new JWT access token. Requires secret token authentication.
**Request body**
**Response**
###
[](#get-api-v1-auth-tokens)
GET /api/v1/auth/tokens
Lists all active tokens (secret token auth required).
**Response**
###
[](#delete-api-v1-auth-tokens-id)
DELETE /api/v1/auth/tokens/:id
Revokes a token by ID. Requires secret token authentication.
**Response**
###
[](#get-api-v1-auth-me)
GET /api/v1/auth/me
Returns information about the current token (works with both secret and JWT).
**Response**
###
[](#post-api-v1-auth-codes)
POST /api/v1/auth/codes
Generates a one-time access code (for app connectivity). Requires secret token auth.
**Response**
The code is valid for 30 minutes and can be used exactly once.
###
[](#post-api-v1-auth-exchange)
POST /api/v1/auth/exchange
Exchanges a one-time code for a JWT token. No prior authentication required.
**Request body**
**Response**
Returns `401` if the code is expired or already used.
##
[](#server-sent-events)
Server-Sent Events
###
[](#get-api-events)
GET /api/events
SSE stream of real-time daemon events. Auth via query parameter (EventSource cannot set headers).
Returns a persistent SSE connection. Events include session lifecycle changes, agent output, and health pings (every 30 seconds).
###
[](#get-api-v1-sse-sessions-id-stream)
GET /api/v1/sse/sessions/:id/stream
Per-session SSE stream. Requires JWT authentication via query parameter.
Streams only events for the specified session. Supports reconnect replay — if fewer than 100 events were missed, they are replayed on reconnection. Multiple clients can connect to the same session stream simultaneously.
**Event types**: `agent:event`, `session:updated`, `permission:request`, `health`.
[PreviousCLI Commands](/api-reference/cli-commands)[NextConfiguration Schema](/api-reference/configuration-schema)
Last updated 20 days ago
Was this helpful?