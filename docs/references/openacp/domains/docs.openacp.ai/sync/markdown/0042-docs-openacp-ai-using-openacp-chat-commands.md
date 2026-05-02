Chat Commands | OpenACP Docs
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
OpenACP responds to commands sent in your chat platform. This page covers every available command, how to use it, and which platforms support it.
##
[](#platform-comparison)
Platform comparison
Command
Telegram
Discord
Notes
`/new`
Yes
Yes (`/new`)
Create a new agent session
`/newchat`
Yes
Yes
New chat, same agent and workspace
`/cancel`
Yes
Yes
Cancel current session prompt
`/status`
Yes
Yes
Show session or system status
`/sessions`
Yes
Yes
List all sessions
`/agents`
Yes
Yes
Browse installed and available agents
`/install`
Yes
Yes
Install an agent
`/menu`
Yes
Yes
Show interactive menu
`/resume`
Yes
No
Resume from Entire checkpoints
`/settings`
Yes
Yes
Change configuration in-chat
`/doctor`
Yes
Yes
Run system diagnostics
`/tunnel`
Yes
No
Create a public URL for a local port
`/tunnels`
Yes
No
List active tunnels
`/enable\_bypass`
Yes
No
Auto-approve all permissions
`/disable\_bypass`
Yes
No
Restore normal permission prompts
`/bypass`
No
Yes
Toggle bypass permissions (Discord)
`/text\_to\_speech`
Yes
No
Toggle TTS for a session
`/tts`
No
Yes
Toggle TTS (Discord)
`/outputmode`
Yes
Yes
Set output detail level (replaces `/verbosity`)
`/verbosity`
Yes
Yes
Deprecated — use `/outputmode` instead
`/usage`
Yes
No
View token usage and cost
`/archive`
Yes
No
Archive a session topic
`/summary`
Yes
No
Generate an AI summary of a session
`/mode`
Yes
Yes
Switch agent mode (code, architect, etc.)
`/model`
Yes
Yes
Switch agent model
`/thought`
Yes
Yes
Toggle thinking/reasoning mode
`/dangerous`
Yes
Yes
Toggle dangerous/bypass permissions mode
`/switch`
Yes
Yes
Switch to a different agent mid-conversation
`/handoff`
Yes
Yes
Continue session in your terminal
`/integrate`
Yes
Yes
Manage agent integrations
`/restart`
Yes
Yes
Restart OpenACP
`/update`
Yes
Yes
Update to latest version
`/clear`
Yes
Yes
Clear assistant history
`/help`
Yes
Yes
Show help text
##
[](#command-reference)
Command reference
###
[](#new-agent-workspace)
`/new [agent] [workspace]`
Create a new agent session. If you omit arguments, OpenACP walks you through an interactive picker: choose your agent, then your project directory.
On Telegram, each session gets its own topic. On Discord, a new thread is created in the configured channel.
###
[](#newchat)
`/newchat`
Start a fresh conversation with the same agent and workspace as the current session. Run this inside an existing session topic or thread. Useful when you want a clean context without changing your setup.
###
[](#cancel)
`/cancel`
Abort the currently running prompt. The session stays active — you can send another message immediately. Run this inside a session topic or thread.
###
[](#status)
`/status`
Show status for the current session (when run inside a session topic) or a system-wide summary of all sessions (when run in the main chat).
Session status includes: name, agent, status, workspace path, and queue depth.
###
[](#sessions)
`/sessions`
List all sessions with their status and names. On Telegram, this also provides cleanup buttons to remove finished, errored, or all sessions.
###
[](#agents)
`/agents`
Browse installed and available agents. Installed agents are shown first, then the full registry with install buttons. The registry is paginated six entries at a time.
###
[](#install-less-than-name-greater-than)
`/install \<name\>`
Install an agent by name.
Progress updates appear in-line. After installation, a button lets you start a session with the new agent immediately. If post-install setup steps are needed (e.g. API key configuration), they appear as copyable commands.
###
[](#menu)
`/menu`
Display an interactive inline keyboard with quick access to: New Session, Sessions, Status, Agents, Settings, Integrate, Restart, Update, Help, and Doctor.
###
[](#resume-telegram-only)
`/resume` (Telegram only)
Resume a session with conversation history loaded from Entire checkpoints. Supports multiple query formats:
After the query, a workspace picker lets you choose which repository to load context from.
###
[](#settings)
`/settings`
Open an interactive settings panel. Toggle and select configuration values without editing config files. Some changes take effect immediately; others require a restart. Changes that need a restart show a notification.
###
[](#doctor)
`/doctor`
Run system diagnostics. Checks configuration, agent dependencies, disk access, and connectivity. Results are shown inline with pass/warn/fail status. Fixable issues show a "Fix" button.
###
[](#tunnel-less-than-port-greater-than-label-telegram-only)
`/tunnel \<port\> [label]` (Telegram only)
Create a public HTTPS URL for a local port. Useful when an agent starts a dev server and you need to access it from outside.
###
[](#tunnels-telegram-only)
`/tunnels` (Telegram only)
List all active tunnels with their public URLs and stop buttons.
###
[](#enable_bypass-disable_bypass-telegram-bypass-discord)
`/enable\_bypass` / `/disable\_bypass` (Telegram) · `/bypass` (Discord)
Toggle bypass permissions for the current session. When enabled, all permission requests are auto-approved without showing buttons. Run inside a session topic. See [Permissions](/using-openacp/permissions) for details.
###
[](#text_to_speech-on-or-off-telegram-tts-on-or-off-discord)
`/text\_to\_speech [on|off]` (Telegram) · `/tts [on|off]` (Discord)
Toggle text-to-speech for the current session. Without an argument, enables TTS for the next message only. With `on`, enables persistently. With `off`, disables.
###
[](#outputmode-low-or-medium-or-high)
`/outputmode low|medium|high`
Set how much detail OpenACP shows for agent activity. Supports a 3-level cascade: session override → adapter default → global default.
*
`low` — compact icon grid (minimal noise)
*
`medium` — tool titles, descriptions, output summaries (default)
*
`high` — full inline output, plan list, viewer links for long results, thinking viewer link
On Discord, an action row with `[🔇 Low] [📊 Medium] [🔍 High] [❌ Cancel]` buttons appears below the tool card while the agent is working, so you can switch mode without typing a command.
###
[](#verbosity-low-or-medium-or-high-deprecated)
`/verbosity low|medium|high` (deprecated)
Alias for `/outputmode`. Use `/outputmode` instead.
###
[](#usage-today-or-week-or-month-telegram-only)
`/usage [today|week|month]` (Telegram only)
Show a token usage and cost report. Without arguments, shows today, this week, and this month. Pass a period to see just that range.
###
[](#archive-telegram-only)
`/archive` (Telegram only)
Archive the current session: stops the agent, marks the session as cancelled, and permanently deletes the Telegram topic. This cannot be undone.
###
[](#summary-telegram-only)
`/summary` (Telegram only)
Ask the agent to summarize what it has accomplished in the current session. Works inside a session topic.
###
[](#mode-mode-name)
`/mode [mode-name]`
Switch the agent's operating mode. Without an argument, shows a menu of available modes declared by the agent (e.g., `code`, `architect`, `ask`).
Available modes depend on the agent — they are declared via the ACP config options protocol.
###
[](#model-model-name)
`/model [model-name]`
Switch the agent's model. Without an argument, shows available models.
###
[](#thought-on-or-off)
`/thought [on|off]`
Toggle the agent's thinking/reasoning mode. When enabled, the agent shows its reasoning process.
###
[](#dangerous-on-or-off)
`/dangerous [on|off]`
Toggle dangerous/bypass permissions mode for the current session. When enabled, the agent can perform destructive operations without confirmation prompts. This is equivalent to `/bypass` but routed through the agent's config options when available.
###
[](#switch-agent-name-or-label-on-or-off)
`/switch [agent-name | label on|off]`
Switch to a different agent mid-conversation. The current conversation history is injected into the new agent so context is preserved.
If you switch back to a previously used agent without having sent any user prompts in the current session, the old session is resumed (if the agent supports resume). Otherwise a new session is created with the conversation history injected.
The session thread or topic remains the same across all switches — only the agent handling the conversation changes.
See [Agent Switch](/features/agent-switch) for the full feature guide.
###
[](#handoff)
`/handoff`
Generate a terminal command to continue the current session in your local terminal. The agent session ID is included so context is preserved.
###
[](#integrate)
`/integrate`
Manage agent integrations — for example, installing the handoff integration that lets you resume sessions from the terminal.
###
[](#restart)
`/restart`
Restart OpenACP. Use this after configuration changes that cannot be hot-reloaded, or when something is stuck.
###
[](#update)
`/update`
Check for a newer version and update in place. OpenACP restarts automatically after a successful update.
###
[](#clear)
`/clear`
Reset the assistant session history. Only works in the Assistant topic on Telegram.
###
[](#help)
`/help`
Show a quick-reference help message.
[PreviousOverview](/using-openacp/using-openacp)[NextSessions](/using-openacp/sessions)
Last updated 24 days ago
Was this helpful?