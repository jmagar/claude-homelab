Session Persistence | OpenACP Docs
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
##
[](#sessions-survive-restarts)
Sessions survive restarts
When you stop and restart OpenACP, your sessions are not lost. OpenACP saves session records to disk as they are created and updated, so everything — session names, which agent was running, which Telegram topic or Discord thread they belonged to — is restored automatically on restart.
You can continue sending messages to an existing session topic after a restart. OpenACP reconnects to the agent process if it is still alive, or starts a new agent session linked to the same topic.
##
[](#what-happens-after-a-restart)
What happens after a restart
1.
OpenACP reloads all saved sessions and restores them in your messaging app.
2.
Sessions that were active before the restart appear in their previous state.
3.
Sending a new message in an existing session topic reconnects to the agent automatically.
4.
If the agent process did not survive the restart, the session shows an error notification. You can create a new session or use `/resume` to continue with history attached.
##
[](#automatic-cleanup)
Automatic cleanup
Old session records are cleaned up automatically. By default, sessions that have not been active for **30 days** are removed. Active sessions are never cleaned up regardless of age.
You can configure the retention period in the instance `config.json`:
Copy
```
`{
"sessionStore": {
"ttlDays": 30
}
}`
```
##
[](#technical-details)
Technical details
Session records are stored in `\<instance-root\>/sessions.json`. Each record stores:
Field
Description
`sessionId`
Unique OpenACP session ID
`agentSessionId`
ID assigned by the agent subprocess
`channelId`
Which adapter owns this session (`telegram`, `discord`, etc.)
`agentName`
Name of the agent (e.g. `claude`, `gemini`)
`workingDirectory`
Filesystem path the agent is working in
`status`
`initializing`, `active`, `idle`, `finished`, `error`
`name`
Display name auto-assigned after the first prompt
`threadId`
Platform thread or topic ID
`createdAt` / `lastActiveAt`
Timestamps for session lifecycle
Writes are debounced to avoid excessive disk I/O. The file is flushed on process exit to prevent data loss. If the file is unreadable on startup, OpenACP logs the error and starts with an empty session map rather than crashing.
[PreviousUsage & Budget](/features/usage-and-budget)[NextSession Handoff](/features/session-handoff)
Last updated 20 days ago
Was this helpful?