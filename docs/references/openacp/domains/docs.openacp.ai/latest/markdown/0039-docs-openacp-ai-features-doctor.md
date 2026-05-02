Doctor Diagnostics | OpenACP Docs
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
[](#what-it-is)
What it is
`openacp doctor` runs a suite of system health checks and reports the status of every major component. It is the fastest way to diagnose why something is not working — misconfigured tokens, missing agent binaries, stale PID files, corrupt sessions data, and more.
##
[](#running-doctor)
Running doctor
From the terminal:
Copy
```
`openacp doctor`
```
From inside Telegram or Discord, send `/doctor` in the Assistant topic.
Each check produces one or more results with a status of `pass`, `warn`, or `fail`. A summary line at the end shows total counts.
##
[](#checks)
Checks
Check
What it verifies
**Config**
Config file exists, is valid JSON, passes schema validation, and has no pending migrations
**Agents**
Each configured agent's binary exists on PATH; flags a missing default agent as a failure
**Telegram**
Bot token is set, the bot can reach the Telegram API, and the configured chat ID resolves to a supergroup with forum topics enabled
**Discord**
Bot token and guild ID are set, the bot can connect and access the configured guild
**Storage**
Instance root exists and is writable; `sessions.json` is valid; log directory exists and is writable
**Workspace**
The instance workspace directory (parent of `.openacp/`) exists and is readable
**Plugins**
Plugins directory exists; each installed plugin can be loaded without errors
**Daemon**
PID file is valid and the process is alive; API port file is valid; API port is in use by OpenACP (not another process)
**Tunnel**
Tunnel is enabled; configured provider is recognized; `cloudflared` binary is present (for Cloudflare provider); tunnel port is in valid range
##
[](#auto-fix)
Auto-fix
Some issues can be fixed automatically. When a fix is marked as safe (low risk), doctor applies it immediately and reports what was done. Examples of safe auto-fixes:
*
Applying pending config migrations
*
Removing a stale or invalid PID file
*
Removing an invalid API port file
*
Creating a missing log directory
*
Installing the `cloudflared` binary
Fixes that are risky (could cause data loss, such as resetting a corrupt sessions file) are listed as pending and require explicit confirmation before they are applied.
##
[](#exit-code)
Exit code
`openacp doctor` exits with code `0` if all checks pass or produce only warnings. It exits with code `1` if any check fails. This makes it usable in CI or startup scripts:
[PreviousApp Connectivity](/features/app-connectivity)[NextAssistant Mode](/features/assistant-mode)
Last updated 20 days ago
Was this helpful?