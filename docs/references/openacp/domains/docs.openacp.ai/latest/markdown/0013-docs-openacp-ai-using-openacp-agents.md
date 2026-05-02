Agents | OpenACP Docs
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
Agents are the AI processes that OpenACP connects you to. Each agent implements the Agent Client Protocol (ACP) and exposes a prompt interface. OpenACP manages spawning, communication, and lifecycle.
##
[](#browsing-available-agents)
Browsing available agents
Use `/agents` to see what is installed and what is available to install:
Copy
```
`/agents`
```
The response has two sections:
*
**Installed** — agents ready to use, with a checkmark
*
**Available to install** — agents from the registry, with install buttons
The available list is paginated (6 per page) with Prev/Next navigation. Agents marked with a warning icon have unmet dependencies — tap the warning to see what is missing.
The registry is fetched from `cdn.agentclientprotocol.com` and cached locally for 24 hours.
##
[](#installing-an-agent)
Installing an agent
From the `/agents` list, tap the install button next to any agent. Or use the command directly:
Copy
```
`/install claude
/install gemini
/install codex`
```
Progress updates appear in-line as the installation runs — downloading, extracting, configuring. After success, a button lets you start a session with the new agent immediately.
Some agents require additional setup after installation. Setup steps appear as copyable commands, for example:
##
[](#uninstalling-an-agent)
Uninstalling an agent
Agents can be uninstalled from the CLI (see [CLI Commands](/api-reference/cli-commands) for the full command reference):
This removes the agent's binary and configuration from `\~/.openacp/agents/`. Any existing sessions using that agent are not affected until they end.
##
[](#switching-agent-per-session)
Switching agent per session
Pass the agent name to `/new` to use a specific agent for a session:
If you have only one agent installed, it is selected automatically.
##
[](#switching-agents-mid-conversation)
Switching agents mid-conversation
Use `/switch` to change the agent handling the current session without starting a new thread or topic:
The conversation history from the current session is automatically injected into the new agent, so it has full context of what was discussed. If you switch back to a previously used agent without having sent any new user prompts since the last switch, the old session is resumed (provided the agent supports resume). Otherwise a new session is started with the history prepended.
To label messages in the history with the agent name that produced them, use:
This is controlled globally by the `agentSwitch.labelHistory` config option (default: `true`).
For full details see [Agent Switch](/features/agent-switch).
##
[](#default-agent)
Default agent
The default agent is used when you create a session without specifying one. Configure it in `\<instance-root\>/config.json` (e.g. `\~/openacp-workspace/.openacp/config.json`):
Or use `/settings` to change it in-chat.
##
[](#agent-types)
Agent types
Agents are distributed in four ways:
Type
Description
Example
`npx`
Runs via Node.js package runner
`npx @anthropic-ai/claude-code`
`uvx`
Runs via Python package runner (uv)
`uvx goose`
`binary`
Platform-specific binary download
`codex`
`custom`
User-defined command and arguments
Any local tool
OpenACP detects which distribution method is appropriate for your platform and handles installation automatically. If a required runtime (`node`, `npx`, `uv`, `uvx`) is missing, the agent shows as unavailable with an install hint.
##
[](#popular-agents)
Popular agents
Agent
Distribution
Notes
Claude (claude-code)
npx
Requires Anthropic API key or Claude login
Gemini CLI
npx
Requires Google AI API key
Codex CLI
binary
Requires OpenAI API key
Goose
uvx
Requires Python / uv
Use `/agents` for the current full list — the registry is updated independently of OpenACP releases.
##
[](#agent-capabilities)
Agent capabilities
Some agents declare capabilities that OpenACP uses to enable features:
*
**Audio** — If an agent supports native audio input, voice attachments are passed directly rather than transcribed
*
**Commands** — Agents can publish a list of slash commands that appear as skill shortcuts in the session topic
Capabilities are detected automatically when a session starts.
##
[](#custom-agents)
Custom agents
You can add a custom agent directly to your config without going through the registry:
The agent must implement the ACP protocol to communicate with OpenACP.
[PreviousSessions](/using-openacp/sessions)[NextPermissions](/using-openacp/permissions)
Last updated 20 days ago
Was this helpful?