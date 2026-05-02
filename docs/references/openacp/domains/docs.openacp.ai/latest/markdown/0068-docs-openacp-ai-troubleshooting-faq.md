FAQ | OpenACP Docs
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
###
[](#what-operating-systems-does-openacp-support)
What operating systems does OpenACP support?
OpenACP runs on macOS, Linux, and Windows (via WSL). It requires Node.js 20 or later. Native Windows (PowerShell/CMD) is not officially tested — WSL 2 is recommended on Windows.
###
[](#can-i-run-multiple-bots-for-different-platforms-at-the-same-time)
Can I run multiple bots for different platforms at the same time?
Yes. OpenACP supports multiple channel adapters simultaneously. You can enable Telegram, Discord, and Slack in the same `config.json` — all three will start when you run `openacp start`. Each platform gets its own adapter instance sharing a single agent backend.
###
[](#is-my-data-private-does-openacp-send-data-anywhere)
Is my data private? Does OpenACP send data anywhere?
OpenACP itself does not collect or transmit any telemetry. All data stays on your machine in the instance directory (`\<workspace\>/.openacp/`). Your messages are sent directly from your machine to the AI agent (e.g., Claude, Codex) via the agent's own API. Review each agent's privacy policy independently — OpenACP is just the bridge.
###
[](#does-openacp-cost-money)
Does OpenACP cost money?
OpenACP is free and open source. However, the AI agents it connects to (Claude, Codex, Gemini, etc.) may have their own costs. Check the pricing page for whichever agent you use. Some agents (Gemini, Qwen) have free tiers. See `openacp agents list` for setup notes per agent.
###
[](#can-i-use-openacp-without-telegram)
Can I use OpenACP without Telegram?
Yes. Telegram is the default adapter used in the quick-start guide, but it is not required. Discord and Slack adapters are built in. You can also build a custom adapter by implementing the `ChannelAdapter` abstract class. Disable Telegram entirely by setting `channels.telegram.enabled: false` in your config.
###
[](#how-many-concurrent-sessions-can-i-run)
How many concurrent sessions can I run?
This is controlled by `security.maxConcurrentSessions` in the instance `config.json`. The default is intentionally low to prevent resource exhaustion. Each session spawns one agent subprocess — increase the limit carefully based on available RAM and CPU.
###
[](#does-openacp-work-offline-or-with-local-models)
Does OpenACP work offline or with local models?
OpenACP works with any agent that implements the ACP protocol. If your agent uses a local model (e.g., via Ollama), it will work offline. Agents like Goose support local model providers out of the box. The OpenACP server itself does not need internet access — only the agent subprocess does (if it calls a remote API).
###
[](#how-do-i-back-up-my-sessions-and-configuration)
How do I back up my sessions and configuration?
All persistent state is stored in the instance directory (`\<workspace\>/.openacp/`):
*
`config.json` — your full configuration
*
`sessions.json` — session metadata
*
`history/` — conversation history
Back up the entire `\<workspace\>/.openacp/` directory (e.g. `\~/openacp-workspace/.openacp/`). To restore on a new machine, copy it back, reinstall OpenACP (`npm install -g @openacp/cli`), and register the instance with `openacp instances create --dir \<workspace\>`.
###
[](#can-multiple-people-use-the-same-openacp-instance)
Can multiple people use the same OpenACP instance?
OpenACP supports multiple users via the `security.allowedUserIds` setting. Add each user's platform-specific ID to the list:
Each user gets their own session thread. Note that all sessions share the same agent configuration and working directory root — there is no per-user isolation of the filesystem.
###
[](#openacp-crashed-and-left-orphaned-agent-processes.-how-do-i-clean-up)
OpenACP crashed and left orphaned agent processes. How do I clean up?
When OpenACP exits uncleanly, agent subprocesses may continue running. Find and stop them:
On next startup, OpenACP will create fresh sessions. If a session record in `\<instance-root\>/sessions.json` references an agent session that no longer exists, OpenACP will fall back to starting a new agent session automatically rather than crashing.
###
[](#how-do-i-report-a-bug-or-request-a-feature)
How do I report a bug or request a feature?
Open an issue on the [OpenACP GitHub repository](https://github.com/Open-ACP/OpenACP). Before filing, run `openacp doctor` and include its output. Enable debug logging with `OPENACP\_DEBUG=true openacp start` and attach the relevant log section.
[PreviousAgent Issues](/troubleshooting/agent-issues)
Last updated 4 days ago
Was this helpful?