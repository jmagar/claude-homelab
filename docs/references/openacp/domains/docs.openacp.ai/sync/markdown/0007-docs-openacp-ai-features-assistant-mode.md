Assistant Mode | OpenACP Docs
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
Assistant mode is a dedicated agent session that runs in a special "Assistant" topic inside your Telegram forum group. Unlike regular coding sessions — where each topic is a direct line to a specific agent working on a specific project — the Assistant topic is a management interface. It understands your OpenACP setup and can create sessions, check status, cancel stuck sessions, manage configuration, install agents, and troubleshoot issues, all through natural language.
##
[](#the-assistant-topic)
The Assistant topic
When OpenACP starts with the Telegram adapter, it automatically creates (or finds an existing) "Assistant" forum topic. This happens before any user sessions are created.
On startup, the Assistant sends a welcome message summarizing the current state:
*
Number of active and total sessions
*
Installed agents and which is the default
*
Any sessions in error state
A dedicated agent session is spawned for the Assistant topic using the configured `defaultAgent`. A system prompt is injected that gives the agent full awareness of OpenACP's current state: active session count, topic status breakdown, installed agents, available agents in the ACP Registry, workspace base directory, and STT configuration.
##
[](#difference-from-regular-sessions)
Difference from regular sessions
Regular session
Assistant topic
Purpose
Work on a coding task
Manage OpenACP itself
Workspace
A specific project directory
OpenACP's workspace base directory
Auto-naming
Yes, after first prompt
Fixed name: "Assistant"
Commands available
Agent-specific
Full `openacp api ...` command set
One per user
No, unlimited
Yes, one global Assistant
The Assistant runs `openacp api ...` commands silently and presents results as natural language. Users never see raw CLI output unless they ask for it.
##
[](#what-you-can-ask-the-assistant)
What you can ask the Assistant
*
"Create a new session for my React app in `\~/code/my-app`"
*
"What sessions are currently running?"
*
"Cancel the stuck session"
*
"Clean up all finished topics"
*
"Install the Gemini agent"
*
"Set my monthly budget to $30"
*
"Enable voice transcription with Groq"
*
"Why is session X in error state?"
*
"Restart the daemon"
##
[](#configuration)
Configuration
The Assistant uses the `defaultAgent` from your config. No special configuration is needed. If you want to change which agent powers the Assistant, update `defaultAgent` in `\<instance-root\>/config.json`:
The Assistant topic is created with `initialName: "Assistant"` to prevent the auto-naming system from renaming it based on the first message content.
[PreviousDoctor Diagnostics](/features/doctor)[NextOverview](/architecture/architecture)
Last updated 20 days ago
Was this helpful?