Overview | OpenACP Docs
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
OpenACP uses a **microkernel architecture**: a thin core provides infrastructure (sessions, events, config, plugin lifecycle), while all features -- adapters, security, speech, tunnels, usage tracking -- are implemented as plugins.
This means:
*
**Any feature can be added** without touching core code
*
**Any built-in can be replaced** by a community plugin using the `overrides` declaration
*
**Each module is self-contained** with explicit dependencies
*
**Plugins update independently** of the core
##
[](#message-flow)
Message Flow
Copy
```
`User (Telegram/Discord/Slack)
|
v
Adapter Plugin ← platform SDK listener
|
v
[middleware: message:incoming]
|
v
OpenACPCore ← route to session
|
v
Session ← prompt queue (serial processing)
|
v
[middleware: agent:beforePrompt]
|
v
AgentInstance ← ACP subprocess (Claude, etc.)
|
v
AgentEvents emitted
|
v
[middleware: agent:afterEvent]
|
v
MessageTransformer ← convert to OutgoingMessage
|
v
[middleware: message:outgoing]
|
v
Adapter Plugin ← deliver to platform
|
v
User sees response`
```
Every step marked with `[middleware: ...]` is a hook point where plugins can intercept, modify, or block the flow.
##
[](#core-vs-plugin-responsibilities)
Core vs Plugin Responsibilities
###
[](#what-stays-in-core)
What stays in core
Component
Why it's core
**EventBus**
Communication backbone -- must exist before any plugin
**ConfigManager**
Plugins need config to know if they're enabled
**SessionManager**
Every adapter and plugin interacts with sessions
**AgentManager**
ACP subprocess management, tightly coupled with sessions
**MessageTransformer**
Core pipeline that transforms agent events to messages
**Plugin infrastructure**
LifecycleManager, ServiceRegistry, MiddlewareChain, etc.
###
[](#what-lives-in-plugins)
What lives in plugins
Plugin
Service
What it does
`@openacp/telegram`
`adapter:telegram`
Telegram messaging adapter
`@openacp/discord`
`adapter:discord`
Discord messaging adapter
`@openacp/slack`
`adapter:slack`
Slack messaging adapter
`@openacp/security`
`security`
Access control, rate limiting
`@openacp/file-service`
`file-service`
File I/O for agents
`@openacp/speech`
`speech`
TTS/STT providers
`@openacp/tunnel`
`tunnel`
Expose local ports publicly
`@openacp/usage`
`usage`
Cost tracking and budgets
`@openacp/notifications`
`notifications`
Cross-session alerts
`@openacp/context`
`context`
Conversation history/resume
`@openacp/api-server`
`api-server`
REST API + SSE
##
[](#folder-structure)
Folder Structure
##
[](#boot-sequence)
Boot Sequence
Shutdown runs in reverse: stop accepting messages, teardown plugins in reverse order, cancel sessions, clean up.
##
[](#how-pieces-fit-together)
How Pieces Fit Together
The key insight is **inversion of control**. Core does not create services -- plugins do:
Core accesses services through the **ServiceRegistry**:
This means any service can be replaced by a community plugin that declares `overrides: '@openacp/security'` and registers a different implementation under the same service name.
##
[](#further-reading)
Further Reading
*
[Core Design](/architecture/core-design) -- detailed core module documentation
*
[Plugin System](/architecture/plugin-system) -- complete plugin infrastructure guide
*
[Command System](/architecture/command-system) -- how chat commands work
*
[Built-in Plugins](/architecture/built-in-plugins) -- reference for all 11 plugins
*
[Writing Plugins](/architecture/writing-plugins) -- step-by-step guide for plugin authors
[PreviousAssistant Mode](/features/assistant-mode)[NextCore Design](/architecture/core-design)
Last updated 1 month ago
Was this helpful?