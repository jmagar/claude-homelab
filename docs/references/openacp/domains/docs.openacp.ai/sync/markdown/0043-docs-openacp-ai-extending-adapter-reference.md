Adapter Reference | OpenACP Docs
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
Complete API reference for the `ChannelAdapter` abstract class and the types it works with.
##
[](#channeladapter-methods)
ChannelAdapter Methods
###
[](#required-abstract)
Required (abstract)
Method
Signature
Description
`start`
`() =\> Promise\<void\>`
Connect to the platform, register listeners, begin accepting messages.
`stop`
`() =\> Promise\<void\>`
Disconnect from the platform and release all resources.
`sendMessage`
`(sessionId: string, content: OutgoingMessage) =\> Promise\<void\>`
Deliver agent output to the session's thread. Called for every agent event.
`sendPermissionRequest`
`(sessionId: string, request: PermissionRequest) =\> Promise\<void\>`
Present a permission prompt to the user and collect their choice.
`sendNotification`
`(notification: NotificationMessage) =\> Promise\<void\>`
Send a summary notification (completion, error, budget warning).
`createSessionThread`
`(sessionId: string, name: string) =\> Promise\<string\>`
Create a platform thread/channel for a new session. Returns the platform thread ID.
`renameSessionThread`
`(sessionId: string, newName: string) =\> Promise\<void\>`
Rename the platform thread after auto-naming resolves.
###
[](#optional-no-op-defaults-provided)
Optional (no-op defaults provided)
Method
Signature
Description
`deleteSessionThread`
`(sessionId: string) =\> Promise\<void\>`
Delete the platform thread when a session is cleaned up.
`sendSkillCommands`
`(sessionId: string, commands: AgentCommand[]) =\> Promise\<void\>`
Register dynamic slash commands or menu entries surfaced by the agent.
`cleanupSkillCommands`
`(sessionId: string) =\> Promise\<void\>`
Remove dynamic commands when the session ends.
`archiveSessionTopic`
`(sessionId: string) =\> Promise\<void\>`
Archive (rather than delete) the session thread — for platforms that support it (e.g. Telegram forum topics).
###
[](#constructor)
Constructor
Both values are stored as public/protected properties:
*
`this.core` — the `OpenACPCore` instance (typed by generic `TCore`)
*
`this.config` — the raw config block for this adapter from `\<instance-root\>/config.json`
##
[](#key-types)
Key Types
###
[](#incomingmessage)
IncomingMessage
Represents a message arriving from a user on the platform. Pass this to `core.handleIncomingMessage()`.
###
[](#attachment)
Attachment
###
[](#outgoingmessage)
OutgoingMessage
Delivered to `sendMessage()`. The `type` field tells you what kind of agent output this is.
###
[](#permissionrequest)
PermissionRequest
Sent to `sendPermissionRequest()`. The adapter must present the options to the user and call `core.resolvePermission(sessionId, request.id, chosenOptionId)`.
###
[](#notificationmessage)
NotificationMessage
Sent to `sendNotification()`. Typically delivered to a dedicated notifications channel, not the session thread.
###
[](#agentcommand)
AgentCommand
Used in `sendSkillCommands()`. Represents a dynamic slash command or action the agent has registered.
###
[](#channelconfig)
ChannelConfig
Passed as the second constructor argument. At minimum it carries `enabled: boolean`, plus any adapter-specific fields from config.
###
[](#plugin-registration-replaces-adapterfactory)
Plugin Registration (replaces AdapterFactory)
Adapter plugins now implement the `OpenACPPlugin` interface. Instead of exporting an `AdapterFactory`, plugins register their adapter in the `setup()` method:
Adapter implementations should extend `MessagingAdapter` (for full-featured platforms with threads/topics) or `StreamAdapter` (for simpler stream-based integrations) from `@openacp/plugin-sdk`.
##
[](#adapter-lifecycle)
Adapter Lifecycle
During the running phase, the order of calls is:
1.
User sends message → adapter calls `core.handleIncomingMessage()`
2.
Core creates/resumes session, enqueues prompt
3.
Agent emits events → core calls `adapter.sendMessage()` for each
4.
Agent needs approval → core calls `adapter.sendPermissionRequest()`
5.
Session completes → core calls `adapter.sendNotification()`
6.
If auto-naming is configured → core calls `adapter.renameSessionThread()` after first prompt
##
[](#agentevent-types)
AgentEvent Types
`AgentEvent` is the union type emitted by `AgentInstance`. Adapters do not consume these directly — core translates them into `OutgoingMessage` calls on the adapter. For reference:
`type`
Key fields
Description
`text`
`content: string`
Agent response text chunk
`thought`
`content: string`
Internal agent reasoning
`tool\_call`
`id`, `name`, `status`, `content`
A tool invocation
`tool\_update`
`id`, `name`, `status`, `content`
Progress update on a tool call
`plan`
`entries: PlanEntry[]`
Multi-step plan with status per entry
`usage`
`tokensUsed`, `contextSize`, `cost`
Resource usage summary
`commands\_update`
`commands: AgentCommand[]`
Dynamic commands from the agent
`image\_content`
`data: string`, `mimeType: string`
Base64 image output
`audio\_content`
`data: string`, `mimeType: string`
Base64 audio output
`session\_end`
`reason: string`
Agent has ended the session
`error`
`message: string`
An error from the agent
`system\_message`
`message: string`
Internal system message
[PreviousBuilding Adapters](/extending/building-adapters)[NextContributing](/extending/contributing)
Last updated 20 days ago
Was this helpful?