Building Adapters | OpenACP Docs
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
This guide walks through building a complete custom channel adapter from scratch.
##
[](#what-is-a-channeladapter)
What Is a ChannelAdapter?
A `ChannelAdapter` is the bridge between OpenACP's core and a specific messaging platform. It has two responsibilities:
*
**Inbound**: receive messages from the platform and call `core.handleIncomingMessage()`.
*
**Outbound**: implement methods that core calls to deliver agent output back to the platform.
OpenACP provides an abstract base class `ChannelAdapter\<TCore\>` with default no-op implementations for optional methods. You extend it and implement the required abstracts.
##
[](#message-flow)
Message Flow
Copy
```
`Platform user sends message
↓
YourAdapter (platform SDK listener)
↓
core.handleIncomingMessage(IncomingMessage)
↓
OpenACPCore → Session → AgentInstance (ACP subprocess)
↓
AgentEvents emitted
↓
core calls adapter.sendMessage() / sendPermissionRequest() / sendNotification()
↓
YourAdapter delivers to platform`
```
The adapter is always the outermost layer. Core never talks to the platform directly.
##
[](#step-1-extend-channeladapter)
Step 1 — Extend ChannelAdapter
The generic parameter `TCore` types `this.core`. Use `OpenACPCore` for full type safety.
##
[](#step-2-implement-start-and-stop)
Step 2 — Implement start() and stop()
`start()` initializes your platform SDK, registers listeners, and begins receiving messages. `stop()` tears everything down cleanly.
##
[](#step-3-handle-inbound-messages)
Step 3 — Handle Inbound Messages
When the platform delivers a user message, convert it to `IncomingMessage` and call `core.handleIncomingMessage()`:
`handleIncomingMessage` looks up or creates a session for the `(channelId, threadId, userId)` combination and enqueues the prompt.
##
[](#step-4-implement-sendmessage)
Step 4 — Implement sendMessage()
Core calls `sendMessage()` for every agent output event (text chunks, tool calls, usage summaries, errors, etc.).
`OutgoingMessage.type` can be: `text`, `thought`, `tool\_call`, `tool\_update`, `plan`, `usage`, `session\_end`, `error`, `attachment`, `system\_message`. You decide which types to surface in your UI.
##
[](#step-5-implement-sendpermissionrequest)
Step 5 — Implement sendPermissionRequest()
When an agent needs user approval before taking an action, core calls `sendPermissionRequest()`. You must render the options and eventually call `core.resolvePermission()`.
##
[](#step-6-implement-sendnotification)
Step 6 — Implement sendNotification()
Notifications are summary alerts (session completed, error, budget warning). They are typically sent to a dedicated notification channel or thread.
##
[](#step-7-implement-session-thread-lifecycle)
Step 7 — Implement Session Thread Lifecycle
Core manages sessions and expects the adapter to maintain corresponding UI threads (channels, topics, threads):
`deleteSessionThread` and `archiveSessionTopic` are optional — the base class provides no-op defaults.
##
[](#step-8-register-with-core)
Step 8 — Register With Core
Before calling `core.start()`, register your adapter:
##
[](#step-9-package-as-a-plugin)
Step 9 — Package as a Plugin
Adapter plugins implement `OpenACPPlugin` and register themselves in `setup()`:
Adapter implementations can extend `MessagingAdapter` (for platforms with threads/topics) or `StreamAdapter` (for simpler integrations) from `@openacp/plugin-sdk`, instead of extending `ChannelAdapter` directly.
**> Note:
**> The previous
`> AdapterFactory
`> pattern is no longer used. All adapter registration now goes through the plugin system.
##
[](#complete-minimal-adapter)
Complete Minimal Adapter
[PreviousDev Mode](/extending/dev-mode)[NextAdapter Reference](/extending/adapter-reference)
Last updated 1 month ago
Was this helpful?