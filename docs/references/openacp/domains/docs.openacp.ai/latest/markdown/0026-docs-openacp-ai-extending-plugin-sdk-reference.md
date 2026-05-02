Plugin SDK Reference | OpenACP Docs
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
The `@openacp/plugin-sdk` package provides types, base classes, adapter primitives, and testing utilities for building OpenACP plugins.
##
[](#installation)
Installation
Copy
```
`npm install --save-dev @openacp/plugin-sdk`
```
##
[](#type-exports)
Type Exports
All types are re-exported from the main entry point:
Copy
```
`import type { OpenACPPlugin, PluginContext } from '@openacp/plugin-sdk'`
```
###
[](#plugin-interfaces)
Plugin Interfaces
Type
Description
`OpenACPPlugin`
Main plugin interface. All plugins must default-export an object matching this shape.
`PluginContext`
Context passed to `setup()`. Provides services, events, commands, middleware, storage, and logging.
`PluginPermission`
Union type of all permission strings (e.g., `'events:read'`, `'services:register'`).
`PluginStorage`
Key-value storage interface available via `ctx.storage`.
`InstallContext`
Context passed to `install()`, `configure()`, and `uninstall()`. Provides terminal I/O and settings.
`MigrateContext`
Context passed to `migrate()`. Provides logging.
`TerminalIO`
Interactive terminal interface wrapping `@clack/prompts`.
`SettingsAPI`
Read/write interface for plugin settings.
###
[](#command-types)
Command Types
Type
Description
`CommandDef`
Command definition including name, description, usage, category, and handler.
`CommandArgs`
Arguments passed to a command handler (raw text, sessionId, channelId, userId, reply function).
`CommandResponse`
Response from a command handler (text, error, menu, list, etc.).
`MenuOption`
A selectable option in a menu-type command response.
`ListItem`
An item in a list-type command response.
###
[](#service-interfaces)
Service Interfaces
Type
Description
`SecurityService`
Access control and session limit checking.
`FileServiceInterface`
File saving, resolving, and format conversion.
`NotificationService`
Send notifications to users.
`UsageService`
Token/cost tracking and budget checking.
`SpeechServiceInterface`
Text-to-speech and speech-to-text.
`TunnelServiceInterface`
Port tunneling and public URL management.
`ContextService`
Context building and provider registration for agent sessions.
###
[](#adapter-types)
Adapter Types
Type
Description
`IChannelAdapter`
Interface that all channel adapters must implement.
`OutgoingMessage`
Message sent from OpenACP to a channel.
`PermissionRequest`
Permission prompt sent to the user.
`PermissionOption`
A selectable option in a permission request.
`NotificationMessage`
Notification sent to the notification channel.
`AgentCommand`
Command received from a channel adapter.
##
[](#base-classes)
Base Classes
Exported from the main entry point:
###
[](#messagingadapter)
MessagingAdapter
Abstract base class for channel adapters (Telegram, Discord, Slack, etc.). Implements `IChannelAdapter` with common patterns for session threading and message routing.
Use this when building a new platform adapter.
###
[](#streamadapter)
StreamAdapter
Extends `MessagingAdapter` with streaming support. Handles chunked message updates, buffering, and periodic batch sends.
Use this when your platform supports message editing (e.g., Telegram, Discord).
###
[](#baserenderer)
BaseRenderer
Base class for rendering agent output into platform-specific formats. Handles markdown conversion, code block formatting, and tool call display.
Use this to customize how agent responses appear on your platform.
##
[](#adapter-primitives)
Adapter Primitives
Reusable building blocks for adapter implementations:
Class
Description
`SendQueue`
Serial message queue that ensures messages are sent one at a time. Prevents race conditions when multiple messages arrive simultaneously.
`DraftManager`
Manages streaming message drafts. Buffers text chunks and sends periodic batch updates to the platform.
`ToolCallTracker`
Tracks active tool calls (file edits, shell commands, etc.) and generates status displays.
`ActivityTracker`
Monitors agent activity and manages typing indicators.
##
[](#testing-utilities)
Testing Utilities
Import from the `/testing` subpath:
###
[](#createtestcontext-opts)
createTestContext(opts)
Creates a test-friendly `PluginContext` for unit-testing plugin `setup()` and runtime behavior. All state is in-memory, the logger is silent, and services can be pre-populated.
**Options:**
Option
Type
Description
`pluginName`
`string`
Required. The plugin name.
`pluginConfig`
`Record\<string, unknown\>`
Plugin settings available as `ctx.pluginConfig`. Default: `{}`.
`permissions`
`string[]`
Simulated permissions. Default: all permitted.
`services`
`Record\<string, unknown\>`
Pre-registered services available via `ctx.getService()`.
**Returns: **`**TestPluginContext**`
Extends `PluginContext` with inspection properties:
Property / Method
Type
Description
`registeredServices`
`Map\<string, unknown\>`
Services registered via `registerService()`.
`registeredCommands`
`Map\<string, CommandDef\>`
Commands registered via `registerCommand()`.
`registeredMiddleware`
`Array\<{ hook, opts }\>`
Middleware registered via `registerMiddleware()`.
`emittedEvents`
`Array\<{ event, payload }\>`
Events emitted via `emit()`.
`sentMessages`
`Array\<{ sessionId, content }\>`
Messages sent via `sendMessage()`.
`executeCommand(name, args?)`
`Promise\<CommandResponse\>`
Dispatch a registered command by name for testing.
**Example:**
###
[](#createtestinstallcontext-opts)
createTestInstallContext(opts)
Creates a test-friendly `InstallContext` for unit-testing `install()`, `configure()`, and `uninstall()` hooks. Terminal prompts are automatically answered from a response map.
**Options:**
Option
Type
Description
`pluginName`
`string`
Required. The plugin name.
`legacyConfig`
`Record\<string, unknown\>`
Simulated legacy config data (for migration testing).
`terminalResponses`
`Record\<string, unknown[]\>`
Auto-answers for terminal prompts, keyed by method name.
**Terminal auto-answering:**
The `terminalResponses` map provides answers for each prompt method. Responses are consumed in order (queue). If the queue is empty, sensible defaults are returned:
*
`text` -\> `''`
*
`password` -\> `''`
*
`confirm` -\> `false`
*
`select` -\> `undefined`
*
`multiselect` -\> `[]`
**Returns: **`**InstallContext**`** with extra properties:**
Property
Type
Description
`terminalCalls`
`Array\<{ method, args }\>`
Log of all terminal prompt calls made.
`settingsData`
`Map\<string, unknown\>`
In-memory settings store.
**Example:**
###
[](#mockservices)
mockServices
Factory functions that create mock implementations of OpenACP service interfaces. Each function returns a fully-typed object with sensible defaults. Pass `overrides` to customize specific methods.
####
[](#mockservices.security-overrides)
mockServices.security(overrides?)
####
[](#mockservices.fileservice-overrides)
mockServices.fileService(overrides?)
####
[](#mockservices.notifications-overrides)
mockServices.notifications(overrides?)
####
[](#mockservices.usage-overrides)
mockServices.usage(overrides?)
####
[](#mockservices.speech-overrides)
mockServices.speech(overrides?)
####
[](#mockservices.tunnel-overrides)
mockServices.tunnel(overrides?)
####
[](#mockservices.context-overrides)
mockServices.context(overrides?)
**Using mockServices with createTestContext:**
##
[](#further-reading)
Further Reading
*
[Getting Started: Your First Plugin](/extending/getting-started-plugin) -- step-by-step tutorial
*
[Writing Plugins](/architecture/writing-plugins) -- full guide to services, middleware, events, and storage
*
[Dev Mode](/extending/dev-mode) -- development workflow with hot-reload
[PreviousPlugin System](/extending/plugin-system)[NextDev Mode](/extending/dev-mode)
Last updated 1 month ago
Was this helpful?