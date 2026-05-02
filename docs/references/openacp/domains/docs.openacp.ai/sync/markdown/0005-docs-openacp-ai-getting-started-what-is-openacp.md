What is OpenACP? | OpenACP Docs
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
OpenACP is a bridge between the AI coding agents running on your machine and the messaging apps you already use every day — Telegram, Discord, and Slack.
Think of it as a **universal remote for AI agents**. Instead of jumping between a terminal, a browser, and an IDE just to ask an agent to fix a bug, you send a message in your chat app and get the results back right there — streaming, in real time.
##
[](#how-it-works)
How it works
Copy
```
`You (Telegram / Discord / Slack)
↓
OpenACP
↓
AI Agent (Claude Code, Gemini CLI, Codex, ...)
↓
Your codebase`
```
You send a prompt from your phone or desktop. OpenACP receives it, forwards it to the AI agent running on your machine, and streams the response back to your chat. If the agent needs a permission (like writing a file or running a command), you get a button to approve or deny — right in the chat.
##
[](#supported-platforms)
Supported platforms
OpenACP ships with first-class support for **Telegram**, **Discord**, and **Slack**. Additional platforms can be added through the plugin system — see [Extending OpenACP](/extending/extending).
##
[](#supported-agents)
Supported agents
OpenACP works with any agent that speaks the **Agent Client Protocol (ACP)**. That currently covers 28+ agents, including:
*
Claude Code
*
Gemini CLI
*
OpenAI Codex
*
GitHub Copilot
*
Cursor
*
Cline
*
goose
*
Amp
*
...and many more
If your favorite agent supports ACP, it works with OpenACP. If it doesn't yet, the plugin system lets you add adapters.
##
[](#what-can-you-do-with-it)
What can you do with it?
*
**Code from your phone.** Review a PR, ask an agent to fix a failing test, or kick off a refactor — while you're away from your desk.
*
**Team collaboration with AI.** Shared Telegram groups or Discord channels where the whole team can interact with the same agent.
*
**Code review via chat.** Paste a diff, ask for a review, get a detailed response without leaving the conversation.
##
[](#what-is-acp)
What is ACP?
ACP (Agent Client Protocol) is an open standard that defines how tools like editors and CLIs communicate with AI agents. It handles things like streaming responses, tool calls, and permission requests in a consistent way — so OpenACP doesn't need to know the internals of each agent. For a deeper dive, see the [ACP Guide](https://agentclientprotocol.com/).
##
[](#your-data-stays-on-your-machine)
Your data stays on your machine
OpenACP is **self-hosted**. Everything — config, session history, logs — lives in `\~/.openacp/` on the machine where you run it. Nothing is sent to any OpenACP server. The AI agent itself may call external APIs (like Anthropic or OpenAI), but that's between you and the agent.
[PreviousOverview](/getting-started/getting-started)[NextQuick Start](/getting-started/quick-start)
Last updated 1 month ago
Was this helpful?