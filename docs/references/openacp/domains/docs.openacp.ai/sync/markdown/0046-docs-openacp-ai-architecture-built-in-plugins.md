Built-in Plugins | OpenACP Docs
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
OpenACP ships with 11 built-in plugins. They live in `src/plugins/` and are loaded automatically on boot. Built-in plugins cannot be uninstalled, but they can be disabled.
##
[](#adapter-plugins)
Adapter Plugins
###
[](#openacp-telegram)
@openacp/telegram
Telegram messaging adapter using the grammY framework.
*
**Service**: `adapter:telegram`
*
**Dependencies**: `@openacp/security`, `@openacp/file-service`
*
**Permissions**: `services:register`, `kernel:access`, `events:read`, `events:emit`, `commands:register`
**What it does**: Connects OpenACP to Telegram. Creates forum topics for sessions, renders agent output as HTML messages with inline keyboards, handles permission buttons, and supports voice messages.
**Settings** (`settings.json`):
Key
Type
Description
`botToken`
string
Telegram Bot Token from @BotFather
`chatId`
string
Supergroup Chat ID
`outputMode`
`'low' | 'medium' | 'high'`
How much agent output to show. The legacy key `displayVerbosity` is accepted for backward compatibility.
**Commands**: `/outputmode`, `/verbosity` (deprecated alias for `/outputmode`), `/archive` (adapter-specific), plus overrides for `/new`, `/resume`, `/settings` with multi-step wizards.
###
[](#openacp-discord)
@openacp/discord
Discord messaging adapter using discord.js.
*
**Service**: `adapter:discord`
*
**Dependencies**: `@openacp/security`, `@openacp/file-service`
*
**Permissions**: `services:register`, `kernel:access`, `events:read`, `events:emit`, `commands:register`
**What it does**: Connects OpenACP to Discord. Creates threads for sessions, renders output with embeds and markdown, registers slash commands, and supports file uploads.
**Settings**:
Key
Type
Description
`botToken`
string
Discord Bot Token
`guildId`
string
Discord Server ID
`outputMode`
`'low' | 'medium' | 'high'`
How much agent output to show. The legacy key `displayVerbosity` is accepted for backward compatibility.
**Commands**: `/outputmode`, `/verbosity` (deprecated alias).
###
[](#openacp-slack)
@openacp/slack
Slack messaging adapter using @slack/bolt.
*
**Service**: `adapter:slack`
*
**Dependencies**: `@openacp/security`, `@openacp/file-service`
*
**Permissions**: `services:register`, `kernel:access`, `events:read`, `events:emit`, `commands:register`
**What it does**: Connects OpenACP to Slack via Socket Mode. Creates channels/threads for sessions, renders output with Block Kit, and handles interactive components.
**Settings**:
Key
Type
Description
`botToken`
string
Slack Bot Token
`appToken`
string
Slack App-Level Token (for Socket Mode)
`signingSecret`
string
Slack Signing Secret
##
[](#service-plugins)
Service Plugins
###
[](#openacp-security)
@openacp/security
Access control and rate limiting.
*
**Service**: `security` (implements `SecurityService`)
*
**Dependencies**: none
*
**Permissions**: `services:register`, `events:read`, `middleware:register`
**What it does**: Checks if users are allowed to interact with OpenACP (`allowedUserIds`), enforces session limits (`maxConcurrentSessions`), and provides user role management.
**Service interface**:
**Commands**: `/bypass on|off` -- toggle auto-approve mode for all permissions.
**Config**: Uses core `config.json` security section (`allowedUserIds`, `maxConcurrentSessions`).
###
[](#openacp-file-service)
@openacp/file-service
File I/O for agent operations.
*
**Service**: `file-service` (implements `FileServiceInterface`)
*
**Dependencies**: none
*
**Permissions**: `services:register`, `middleware:register`
**What it does**: Handles file operations that agents request -- saving attachments, resolving file paths, reading file contents with line ranges, and audio format conversion (OGG to WAV for speech).
**Service interface**:
###
[](#openacp-speech)
@openacp/speech
Text-to-speech and speech-to-text with pluggable providers.
*
**Service**: `speech` (implements `SpeechServiceInterface`)
*
**Dependencies**: `@openacp/file-service`
*
**Optional dependencies**: none
*
**Permissions**: `services:register`, `services:use`, `commands:register`
**What it does**: Provides TTS (text-to-speech) and STT (speech-to-text) capabilities. Ships with two built-in providers: Edge TTS and Groq STT. Community plugins can add more providers via `registerTTSProvider()` / `registerSTTProvider()`.
**Service interface**:
**Settings**:
Key
Type
Description
`stt.provider`
string
STT provider name (default: `'groq'`)
`tts.provider`
string
TTS provider name (default: `'edge-tts'`)
**Commands**: `/tts on|off` -- toggle text-to-speech for the current session.
**Extension point**: Community plugins can add providers:
###
[](#openacp-tunnel)
@openacp/tunnel
Expose local ports publicly via tunnel providers.
*
**Service**: `tunnel` (implements `TunnelServiceInterface`)
*
**Dependencies**: none
*
**Permissions**: `services:register`, `commands:register`
**What it does**: Creates public URLs for local development servers. Useful when agents need to preview web applications they're building. Ships with providers: Cloudflare Tunnel, ngrok, bore, tailscale.
**Service interface**:
**Settings**:
Key
Type
Description
`enabled`
boolean
Enable tunnel on startup
`provider`
string
Tunnel provider (`'cloudflare'`, `'ngrok'`, `'bore'`, `'tailscale'`)
**Commands**: `/tunnel start|stop|status`, `/tunnels` -- manage and list tunnels.
###
[](#openacp-usage)
@openacp/usage
Cost tracking and budget management.
*
**Service**: `usage` (implements `UsageService`)
*
**Dependencies**: none
*
**Permissions**: `services:register`, `events:read`, `commands:register`, `storage:read`, `storage:write`
**What it does**: Tracks API usage costs per session and month. Enforces monthly budgets and sends warnings when approaching limits.
**Service interface**:
**Settings**:
Key
Type
Description
`enabled`
boolean
Enable usage tracking
`monthlyBudget`
number
Monthly budget in USD
**Commands**: `/usage` -- view usage summary and budget status.
###
[](#openacp-notifications)
@openacp/notifications
Cross-session notification delivery.
*
**Service**: `notifications` (implements `NotificationService`)
*
**Dependencies**: none
*
**Permissions**: `services:register`, `events:read`
**What it does**: Delivers notifications across sessions. When a session completes, errors, or hits a budget warning, notifications are sent to dedicated notification channels/topics on all active adapters.
**Service interface**:
###
[](#openacp-context)
@openacp/context
Conversation history and session resume.
*
**Service**: `context` (implements `ContextService`)
*
**Dependencies**: none
*
**Permissions**: `services:register`, `events:read`, `storage:read`, `storage:write`
**What it does**: Stores conversation context and enables session resume. When resuming a session, builds a context summary that can be injected into the new agent's initial prompt. Supports pluggable context providers.
**Service interface**:
###
[](#openacp-api-server)
@openacp/api-server
REST API, Server-Sent Events, and authentication for external integrations.
*
**Service**: `api-server` (implements `ApiServerService`)
*
**Dependencies**: `@openacp/security`
*
**Permissions**: `services:register`, `kernel:access`, `events:read`
**What it does**: Exposes a Fastify-based REST API with schema validation (Zod), Swagger/OpenAPI documentation, CORS, and rate limiting. Provides session management, prompt delivery, agent events via SSE, JWT authentication, and file viewer routes. Plugins can register additional routes via `ApiServerService.registerPlugin()`.
**Settings**:
Key
Type
Description
`port`
number
HTTP port (default: `21420`)
**Key capabilities**:
*
**Structured routes** — `/api/v1/\*` endpoints for sessions, agents, config, system, commands, and auth
*
**JWT authentication** — two-tier auth with secret token (master key) and scoped JWT access tokens
*
**SSE streaming** — real-time session events, agent output, and health pings via `GET /api/v1/sse/sessions/:id/stream`
*
**File viewer** — serves file, diff, and output viewer routes (merged from the former standalone viewer server)
*
**Plugin extensibility** — plugins register additional Fastify routes via the `ApiServerService`
*
**Swagger UI** — auto-generated API documentation at `/docs`
See the [REST API reference](/api-reference/rest-api) for the full endpoint list.
###
[](#sse-manager-part-of-openacp-api-server)
SSE Manager (part of @openacp/api-server)
The SSE (Server-Sent Events) manager is integrated into the API server plugin rather than being a separate plugin. It provides real-time event streaming for app clients.
**What it does**: Broadcasts session lifecycle events, agent output, and health pings over SSE connections. Supports per-session filtering and automatic cleanup on disconnect.
**Event types**:
Event
Description
`session:created`
A new session was created
`session:updated`
Session state changed (status, name, etc.)
`session:deleted`
A session was destroyed
`agent:event`
Agent output (text, tool calls, errors)
`permission:request`
A permission request is pending
`health`
Periodic health ping (every 30s) with memory and uptime stats
**Connection**: `GET /api/v1/sse/sessions/:id/stream?token=\<jwt\>` for per-session streams, or `GET /api/events?token=\<api-secret\>` for all events.
**Reconnect support**: A 100-event circular buffer per session enables replay on reconnect — if the client missed fewer than 100 events, they are replayed on reconnection.
##
[](#plugin-dependency-graph)
Plugin Dependency Graph
Plugins at the top (no deps) load first. Adapter plugins load last since they depend on services being available.
##
[](#further-reading)
Further Reading
*
[Architecture Overview](/architecture/architecture) -- high-level picture
*
[Plugin System](/architecture/plugin-system) -- how plugins work
*
[Writing Plugins](/architecture/writing-plugins) -- build your own
*
[Command System](/architecture/command-system) -- how commands are registered and dispatched
[PreviousCommand System](/architecture/command-system)[NextWriting Plugins](/architecture/writing-plugins)
Last updated 28 days ago
Was this helpful?