Workspaces | OpenACP Docs
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
[](#what-are-workspaces)
What are workspaces?
A **workspace** is a directory on your machine that contains an OpenACP instance. Every instance lives inside its workspace as `\<workspace\>/.openacp/`. The workspace directory is also what AI agents use as their working root.
Workspaces let you run completely independent OpenACP setups on the same machine. Each workspace has its own settings, sessions, and data — they do not interfere with each other.
You might want multiple workspaces when you need:
*
A **work** setup with one Telegram group and budget limits, and a **personal** setup with a different group and no limits.
*
A **project-specific** setup that uses a different default agent or different permissions.
*
A **testing** setup where you try out new plugins without breaking your main bot.
##
[](#directory-structure)
Directory structure
Each workspace follows this layout:
Copy
```
`\<workspace\>/
.openacp/ ← instance data (config, sessions, plugins, logs, etc.)
... ← your project files (agents work here)`
```
A lightweight shared store at `\~/.openacp/` holds data shared across all instances (agent binaries, the instance registry, CLI tools). It is **not** an instance itself.
Copy
```
`\~/.openacp/
instances.json ← registry: maps instance ID → workspace path
agents/ ← shared agent binaries
bin/ ← shared CLI tools
cache/ ← ACP Registry cache`
```
##
[](#creating-your-first-workspace)
Creating your first workspace
Run `openacp` (no arguments) from the directory you want to use as your workspace. If no instance is found, the setup wizard launches:
The wizard creates `\~/openacp-workspace/.openacp/`, writes your config, and registers the instance.
You can also use the non-interactive setup command:
##
[](#creating-additional-workspaces)
Creating additional workspaces
Navigate to the new workspace directory and run the setup wizard:
Or non-interactively:
You can copy structure from an existing instance so you don't have to reinstall plugins and agents from scratch:
This copies your installed plugins, plugin packages, and agent definitions — but **not** credentials or sensitive settings (bot tokens, API keys, channel IDs). After cloning, run `openacp config` or `openacp onboard` in the new workspace to enter your credentials for the new instance.
##
[](#switching-between-workspaces)
Switching between workspaces
OpenACP automatically resolves the active instance based on where you run the command:
*
**Inside a workspace directory** (or any subdirectory) with `.openacp/config.json` → uses that instance automatically.
*
**Anywhere else** → prompts you to select from registered instances.
To be explicit about which instance to use:
After resolution, the CLI prints a hint so you always know which instance is active:
##
[](#listing-all-instances)
Listing all instances
This shows every registered instance with its name, directory, and running status.
##
[](#how-workspaces-stay-separate)
How workspaces stay separate
Each instance runs independently:
*
**Separate settings** — each instance has its own `config.json`. Changing the agent in one instance does not affect the other.
*
**Separate sessions** — conversations in one instance are not visible in another.
*
**Separate bots** — each instance can connect to a different Telegram group or Discord server, or use different bot tokens.
*
**Separate ports** — if multiple instances are running simultaneously, they use different network ports automatically.
##
[](#when-do-you-need-multiple-workspaces)
When do you need multiple workspaces?
Most users only need one workspace. Consider adding another when:
*
You want a **completely different bot configuration** for a project (different group, different agents, different budget).
*
You are **developing or testing plugins** and do not want to risk your main setup.
*
You manage **multiple teams** that each need their own isolated OpenACP environment.
If you just want to switch between different agents or projects within the same bot, you do not need a new workspace — use sessions and the `/new` command instead.
[PreviousAgent Switch](/features/agent-switch)[NextApp Connectivity](/features/app-connectivity)
Last updated 20 days ago
Was this helpful?