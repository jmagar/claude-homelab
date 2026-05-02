Session Handoff | OpenACP Docs
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
Session handoff lets you transfer a running agent session from your terminal to your phone (or any other device with Telegram or Discord), or in the other direction. You start a session in the terminal, realize you want to continue the conversation on the go, and hand it off to your messaging app with a single command.
No state is lost. The agent process keeps running; only the "owner" of the session changes from the terminal to the chat interface.
##
[](#use-case-terminal-to-phone)
Use case: terminal to phone
A typical flow:
1.
You are working at your desk with Claude Code or OpenCode open in the terminal.
2.
You need to step away but want to keep supervising the agent.
3.
You run `openacp integrate` (or trigger the `/openacp:handoff` slash command from inside the agent).
4.
The session appears as a new topic in your Telegram group or Discord server.
5.
You continue sending prompts and approving permission requests from your phone.
##
[](#how-to-set-up-handoff)
How to set up handoff
###
[](#step-1-install-the-integration)
Step 1: Install the integration
Run the integrate command and follow the prompts:
You will be asked which agent to integrate (Claude Code, OpenCode, Cursor, Gemini CLI, GitHub Copilot, Cline, Codex, etc.). The command installs the needed integration so your agent can hand off sessions to OpenACP.
To uninstall later:
###
[](#step-2-use-the-handoff-command)
Step 2: Use the handoff command
Once integrated, you can hand off any session from your terminal to your messaging app:
The session appears as a new topic in your Telegram group or Discord server. You can continue sending prompts and approving permission requests from your phone.
##
[](#requirements)
Requirements
*
The OpenACP daemon must be running (`openacp start`) on the same machine as the terminal agent.
*
At least one messaging adapter (Telegram, Discord, or Slack) must be configured and connected.
*
`jq` is required only for hook-based integrations (Claude/Cursor/Gemini/Cline). OpenCode plugin integration does not require `jq`.
##
[](#supported-agents)
Supported agents
Currently supported agents include Claude Code, OpenCode, Cursor, Gemini CLI, GitHub Copilot CLI, Cline, OpenAI Codex, and others. Run `openacp integrate --list` to see the full list.
##
[](#technical-details)
Technical details
Most handoff integrations rely on two shell scripts installed by `openacp integrate`:
*
**Inject hook** (`openacp-inject-session.sh`) — runs as an agent hook on every conversation turn, reads the agent's session ID from the hook payload, and injects it as a context variable.
*
**Handoff script** (`openacp-handoff.sh`) — calls `openacp adopt \<agent\> \<session\_id\>` to register the terminal session with the running OpenACP daemon, making it visible in the messaging platform.
For OpenCode, handoff is installed via a command + plugin pair under `\~/.config/opencode/`:
*
**Command** (`commands/openacp-handoff.md`) — provides `/openacp:handoff`.
*
**Plugin** (`plugins/openacp-handoff.js`) — injects current OpenCode session ID so the command can call `openacp adopt opencode \<session\_id\>`.
If OpenCode is started with `--pure`, plugins are disabled and session ID injection is unavailable. In this mode, `/openacp:handoff` is not supported.
[PreviousSession Persistence](/features/session-persistence)[NextAgent Switch](/features/agent-switch)
Last updated 24 days ago
Was this helpful?