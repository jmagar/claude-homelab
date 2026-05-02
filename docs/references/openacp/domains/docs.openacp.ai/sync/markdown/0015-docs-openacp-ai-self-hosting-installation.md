Installation | OpenACP Docs
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
[](#system-requirements)
System Requirements
Requirement
Minimum
Node.js
20 or later
Package manager
npm (bundled with Node) or pnpm
Operating system
macOS, Linux
Windows
Supported via WSL2
No database, no Docker, no external services required beyond the messaging platform bots you configure.
##
[](#one-liner-install-recommended)
One-liner install (recommended)
The fastest way to install OpenACP on macOS or Linux:
Copy
```
`curl -fsSL https://raw.githubusercontent.com/Open-ACP/OpenACP/main/scripts/install.sh | bash`
```
The script automatically:
1.
Detects your platform (macOS or Linux).
2.
Checks for Node.js 20+ and installs it if missing.
3.
Installs `@openacp/cli` globally via npm.
4.
Launches the setup wizard.
No prior setup required — the script handles everything.
##
[](#install-via-npm)
Install via npm
If you prefer to manage Node.js yourself, install OpenACP directly from npm:
###
[](#verify-the-installation)
Verify the installation
This prints the installed version (e.g., `2026.401.1`) and exits. If the command is not found, ensure your npm global bin directory is on `PATH`.
##
[](#first-run-and-setup-wizard)
First Run and Setup Wizard
The first time you run `openacp` (bare command, no arguments), the CLI detects that no instance exists and launches the interactive setup wizard automatically.
The wizard walks you through:
1.
**Channel selection** — Telegram, Discord, or both.
2.
**Bot credentials** — Token and chat/guild ID, validated live against the platform API.
3.
**Agent selection** — Which ACP-compatible agent binary to use (e.g., `claude-agent-acp`).
4.
**Run mode** — Foreground (interactive) or daemon (background process with optional autostart on boot).
After completing the wizard, an instance is created at `\~/openacp-workspace/.openacp/` and the server starts.
To re-run the wizard at any time:
##
[](#data-directory)
Data Directory
OpenACP separates shared data (used across all instances) from per-instance state.
**Shared store** — lives at `\~/.openacp/` and is never an instance itself:
**Instance** — lives at `\<workspace\>/.openacp/` (default: `\~/openacp-workspace/.openacp/`):
You can override the config path with the `OPENACP\_CONFIG\_PATH` environment variable.
##
[](#running-from-source)
Running from Source
If you want to hack on OpenACP or run an unreleased version:
For watch mode during development:
The source build uses the same instance directories as the published package, so you can switch between them freely.
[PreviousOverview](/self-hosting/self-hosting)[NextConfiguration](/self-hosting/configuration)
Last updated 20 days ago
Was this helpful?