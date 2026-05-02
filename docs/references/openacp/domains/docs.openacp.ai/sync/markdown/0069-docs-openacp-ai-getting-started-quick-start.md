Quick Start | OpenACP Docs
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
This guide gets you from zero to chatting with an AI agent in your Telegram (or Discord, or Slack) in about ten minutes.
##
[](#what-youll-need)
What you'll need
*
**Node.js 20 or later** — check with `node --version`
*
**A bot token** for your chat platform:
*
Telegram: create one via [@BotFather](https://t.me/BotFather)
*
Discord: create one in the [Discord Developer Portal](https://discord.com/developers/applications)
*
Slack: create one at [api.slack.com/apps](https://api.slack.com/apps)
*
**An ACP-compatible agent** installed on your machine (e.g. `claude` CLI, `gemini` CLI)
##
[](#step-1-install-openacp)
Step 1: Install OpenACP
Copy
```
`npm install -g @openacp/cli`
```
Verify it installed:
Copy
```
`openacp --version`
```
##
[](#step-2-run-the-setup-wizard)
Step 2: Run the setup wizard
The first time you run `openacp`, it detects there's no config and launches an interactive setup wizard that walks you through:
1.
**Choose your platform** — Telegram, Discord, or Slack
2.
**Enter your bot token** — paste the token you created above
3.
**Validate the token** — confirms it can reach the platform API
4.
**Detect agents** — scans your system for installed ACP-compatible agents
5.
**Choose run mode** — foreground (for testing) or daemon (runs in background)
Most prompts have sensible defaults — just press Enter to accept them.
##
[](#step-3-start-openacp)
Step 3: Start OpenACP
If you chose foreground mode:
If you chose daemon mode, it started automatically. Check with:
##
[](#step-4-chat-with-your-ai-agent)
Step 4: Chat with your AI agent
Open the Telegram group (or Discord server, or Slack channel) linked to your bot and send:
OpenACP creates a **session** — a dedicated thread between you and an AI agent. On Telegram this becomes a forum topic, on Discord and Slack a thread.
Now send a real message:
You should see:
*
**Streaming text** — the agent's response arrives piece by piece in real time
*
**Tool calls** — status updates like `🔧 Running: read\_file src/main.ts` when the agent reads files or runs commands
*
**Permission requests** — some actions show **Approve** / **Deny** buttons and wait for your response
*
**Auto-naming** — the session topic gets renamed based on your first message
##
[](#step-5-useful-commands)
Step 5: Useful commands
Command
What it does
`/new`
Start a new session with a fresh agent
`/cancel`
Stop the current response
`/status`
Check the status of your active session
`/menu`
Open the action menu
For the full list, see [Chat Commands](/using-openacp/chat-commands).
##
[](#what-just-happened)
What just happened?
When you ran `openacp start`, OpenACP:
1.
Loaded your config from `\~/openacp-workspace/.openacp/config.json`
2.
Connected your bot to the chat platform
3.
Started listening for messages
When you sent `/new`, OpenACP:
1.
Created a new **Session** for you
2.
Spawned an **AgentInstance** — a subprocess running your AI agent via ACP
3.
Routed your message to the agent and streamed the response back to chat
##
[](#your-data-directory)
Your data directory
OpenACP stores instance data in `\<workspace\>/.openacp/` (default: `\~/openacp-workspace/.openacp/`):
Path
What's in it
`config.json`
Your configuration (bot token, agent, allowed users)
`sessions.json`
Active and recent session metadata
`usage.json`
Token and cost tracking
`logs/`
Application logs
`files/`
Files shared through the chat
`plugins/`
Installed plugins
`history/`
Per-session conversation history
Shared data (agent binaries, instance registry) is kept in `\~/.openacp/` and is used across all instances.
To reconfigure at any time:
##
[](#next-steps)
Next steps
*
**Platform setup** — detailed guides for [Telegram](/platform-setup/telegram), [Discord](/platform-setup/discord), and [Slack](/platform-setup/slack)
*
[**Configuration**](/self-hosting/configuration) — all config options explained
*
[**Agents**](/using-openacp/agents) — configure and switch between agents
*
[**Daemon Mode**](/self-hosting/daemon-mode) — running OpenACP as a background service
*
[**Voice & Speech**](/using-openacp/voice-and-speech) — voice messages and audio responses
[PreviousWhat is OpenACP?](/getting-started/what-is-openacp)[NextFor Contributors](/getting-started/for-contributors)
Last updated 20 days ago
Was this helpful?