Core Design | OpenACP Docs
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
This document covers the core modules that form OpenACP's kernel -- the infrastructure that exists before any plugin loads.
##
[](#openacpcore)
OpenACPCore
The main orchestrator. Routes messages between adapters and sessions, enforces security, and provides the service registry for plugin lookups.
Copy
```
`class OpenACPCore {
constructor(opts: {
configManager: ConfigManager
serviceRegistry: ServiceRegistry
lifecycleManager: LifecycleManager
settingsManager: SettingsManager
pluginRegistry: PluginRegistry
})
// Adapter management
registerAdapter(name: string, adapter: IChannelAdapter): void
getAdapter(name: string): IChannelAdapter | undefined
// Message routing
handleIncomingMessage(msg: IncomingMessage): Promise\<void\>
// Session management (delegates to SessionManager)
handleNewSession(channelId: string, userId: string, agentName?: string): Promise\<void\>
cancelSession(sessionId: string): Promise\<void\>
resolvePermission(sessionId: string, requestId: string, optionId: string): Promise\<void\>
// Service lookups (lazy, via ServiceRegistry)
get security(): SecurityService | undefined
get fileService(): FileServiceInterface | undefined
get notifications(): NotificationService | undefined
}`
```
After the microkernel refactor, `OpenACPCore` no longer creates services directly. All services are registered by plugins during `setup()` and accessed through typed getters backed by the ServiceRegistry.
##
[](#session-and-sessionmanager)
Session and SessionManager
###
[](#sessionmanager)
SessionManager
Manages the lifecycle of all sessions. Handles creation, lookup, destruction, and enforces limits.
###
[](#session)
Session
Wraps an `AgentInstance` with:
*
**Prompt queue** -- messages are processed serially, never in parallel
*
**Auto-naming** -- after the first prompt, asks the agent to summarize the conversation into a short title
*
**Lifecycle management** -- tracks state (idle, processing, waiting\_permission, ended)
*
**Config options** -- stores agent-declared config options (`ConfigOption[]`) for modes, models, and toggles
*
**Agent switch tracking** -- maintains `agentSwitchHistory` with timestamps and prompt counts per agent
Sessions emit events through the EventBus that plugins can subscribe to (e.g., `session:afterDestroy` for cleanup).
###
[](#lazy-session-resume)
Lazy session resume
When a command or message targets a session that has been evicted from memory (e.g., after a server restart), `core.getOrResumeSession()` transparently loads the session record from the store and resumes it. This means commands dispatched to dormant sessions work without the user manually restarting the session.
##
[](#agentinstance)
AgentInstance
The bridge between OpenACP and an AI coding agent. Spawns the agent as a subprocess, communicates via the Agent Client Protocol (ACP), and converts ACP events into internal `AgentEvent` types.
Key sub-managers extracted from AgentInstance:
*
**TerminalManager** -- manages agent terminal/shell sessions
*
**McpManager** -- handles MCP (Model Context Protocol) server connections
*
**AuthHandler** -- handles agent authentication flows
##
[](#lifecyclemanager)
LifecycleManager
Orchestrates plugin boot and shutdown in dependency order.
###
[](#boot)
Boot
1.
Receives list of discovered plugins (already topo-sorted)
2.
For each plugin in order:
*
Check version mismatch with stored version -\> call `migrate()` if needed
*
Validate settings against `settingsSchema`
*
Create `PluginContext` scoped to this plugin's permissions
*
Call `plugin.setup(ctx)` with a 30-second timeout
*
On failure: mark plugin as failed, cascade-skip all dependents
*
After all plugins: emit `system:commands-ready`, then `system:ready`
###
[](#shutdown)
Shutdown
1.
Emit `system:shutdown`
2.
30-second grace period for in-flight prompts
3.
Call `plugin.teardown()` in **reverse** dependency order (10s timeout each)
4.
Auto-cleanup: remove event listeners, middleware, commands for each plugin
5.
Cancel remaining sessions, destroy agent subprocesses
6.
Clear ServiceRegistry, flush EventBus, save state
##
[](#serviceregistry)
ServiceRegistry
Central registry for service discovery. Plugins register services during `setup()`, and other plugins (or core) look them up by name.
###
[](#registration-rules)
Registration rules
Scenario
Behavior
First registration for a name
Accept
Duplicate by built-in (no override)
Startup error -- must fix
Duplicate by community (no override)
Error -- community plugin skipped
Duplicate with `overrides` declared
Replace -- overridden plugin's setup() never called
`get()` before registration
Returns `undefined`
`get()` for required dependency's service
Guaranteed non-undefined (loaded in order)
###
[](#built-in-service-interfaces)
Built-in service interfaces
All built-in plugins register services with typed interfaces. Community plugins that override or consume these must implement the same interface:
*
`SecurityService` -- `checkAccess()`, `checkSessionLimit()`, `getUserRole()`
*
`FileServiceInterface` -- `saveFile()`, `resolveFile()`, `readTextFileWithRange()`
*
`NotificationService` -- `notify()`, `notifyAll()`
*
`UsageService` -- `trackUsage()`, `checkBudget()`, `getSummary()`
*
`SpeechServiceInterface` -- `textToSpeech()`, `speechToText()`
*
`TunnelServiceInterface` -- `getPublicUrl()`, `isConnected()`, `start()`, `stop()`
*
`ContextService` -- `buildContext()`, `registerProvider()`
##
[](#eventbus)
EventBus
In-memory typed event emitter. The communication backbone for inter-plugin messaging.
Plugins subscribe with `ctx.on()` (requires `events:read` permission) and emit with `ctx.emit()` (requires `events:emit` permission).
###
[](#system-events)
System events
Event
When
`kernel:booted`
Core infrastructure initialized
`plugin:loaded`
A plugin completed setup()
`plugin:failed`
A plugin's setup() threw or timed out
`plugin:disabled`
A plugin was auto-disabled (error budget)
`system:commands-ready`
All commands registered, adapters can sync
`system:ready`
System fully operational
`system:shutdown`
Shutdown initiated
Plugins can also emit custom events, but community plugins must prefix event names with their plugin name (e.g., `@community/translator:translated`).
##
[](#middlewarechain)
MiddlewareChain
Pipeline engine with 18 hook points covering every ACP interaction. Each hook has a typed payload.
*
Return `next()` -- pass through unchanged
*
Return modified payload -- transform and continue
*
Return `null` -- block/skip (stop the chain)
###
[](#hook-points)
Hook points
Hook
Modifiable?
Purpose
`message:incoming`
Yes
Intercept user messages
`message:outgoing`
Yes
Modify messages before delivery
`agent:beforePrompt`
Yes
Transform prompts before sending to agent
`agent:beforeEvent`
Yes
Filter agent events
`agent:afterEvent`
Read-only
Observe agent events
`turn:start`
Read-only
Track turn starts
`turn:end`
Read-only
Track turn completions
`fs:beforeRead`
Yes
Control file reads
`fs:beforeWrite`
Yes
Control file writes
`terminal:beforeCreate`
Yes
Control process spawning
`terminal:afterExit`
Read-only
Observe process exits
`permission:beforeRequest`
Yes
Auto-resolve permissions
`permission:afterResolve`
Read-only
Observe permission decisions
`session:beforeCreate`
Yes
Control session creation
`session:afterDestroy`
Read-only
Observe session cleanup
`mode:beforeChange`
Yes
Control mode changes
`model:beforeChange`
Yes
Control model selection
`config:beforeChange`
Yes
Control config changes
###
[](#execution-order)
Execution order
1.
**Base order**: topological sort -- plugins loaded earlier run their middleware first
2.
**Priority override**: reorders within the same dependency level only (priority cannot violate dependency order)
3.
**Same level + same priority**: registration order
Each handler has a 5-second timeout. Timeout or error skips the handler, passes the original payload to the next handler, and increments the plugin's error budget.
##
[](#configmanager)
ConfigManager
Zod-validated configuration from `\<instance-root\>/config.json` (e.g. `\~/openacp-workspace/.openacp/config.json`). After the plugin refactor, config.json contains **core settings only**:
Plugin-specific settings live in per-plugin `settings.json` files under `\<instance-root\>/plugins/data/@scope/name/settings.json`, managed by the SettingsManager.
##
[](#messagetransformer)
MessageTransformer
Converts ACP `AgentEvent` objects into `OutgoingMessage` types that adapters can render. Decoupled from plugins -- uses ServiceRegistry for optional enrichment (e.g., tunnel URLs for file viewer links).
The transformer produces `OutgoingMessage` with types: `text`, `thought`, `tool\_call`, `tool\_update`, `plan`, `usage`, `session\_end`, `error`, `attachment`, `system\_message`.
##
[](#instancecontext)
InstanceContext
Encapsulates all resolved paths for a single OpenACP instance. Every core module (ConfigManager, SessionStore, AgentStore) receives an `InstanceContext` instead of hardcoding `\~/.openacp/`.
The `InstanceRegistry` at `\~/.openacp/instances.json` tracks all instances by ID, enabling `openacp status --all` to show every instance's state. See [Multi-Instance](/features/multi-instance) for the user-facing guide.
##
[](#adapter-primitives)
Adapter Primitives
Shared framework in `src/core/adapter-primitives/` that adapter plugins build on:
*
**MessagingAdapter** -- base class for Telegram/Discord/Slack with drafts, queues, rate limiting, tool tracking. Subclasses implement `send()`, `editMessage()`, and platform-specific rendering.
*
**StreamAdapter** -- lightweight base for WebSocket/API transports. Just `emit()` and `broadcast()`.
*
**IRenderer + BaseRenderer** -- separates rendering logic from adapter logic. Each platform provides its own renderer (HTML for Telegram, Markdown+Embeds for Discord, Block Kit for Slack).
*
**DraftManager** -- buffers text chunks and sends periodic batch updates
*
**SendQueue** -- rate-limited message queue with per-category intervals
*
**ToolCallTracker** -- tracks tool calls to enable message editing on status updates
*
**ActivityTracker** -- manages thinking indicators and tool state aggregation
*
**OutputModeResolver** -- resolves the 3-level cascade (session → adapter → global → default)
*
**ToolStateMap** -- accumulates tool events into a unified state for rendering
*
**DisplaySpecBuilder** -- builds display specifications per output mode level
*
**ThoughtBuffer** -- buffers thinking content for deferred rendering
*
**ToolCardState** -- manages debounced tool card updates (batches rapid events)
##
[](#further-reading)
Further Reading
*
[Architecture Overview](/architecture/architecture) -- high-level picture
*
[Plugin System](/architecture/plugin-system) -- complete plugin infrastructure
*
[Command System](/architecture/command-system) -- how chat commands work
[PreviousOverview](/architecture/architecture)[NextPlugin System](/architecture/plugin-system)
Last updated 20 days ago
Was this helpful?