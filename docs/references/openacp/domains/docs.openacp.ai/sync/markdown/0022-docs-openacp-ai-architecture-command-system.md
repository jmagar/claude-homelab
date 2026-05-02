Command System | OpenACP Docs
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
OpenACP has a centralized command system for chat commands (`/new`, `/cancel`, `/tts`, etc.). Commands are registered by core and plugins, dispatched by adapters, and rendered using platform-specific renderers.
This system covers **chat commands only** (Telegram, Discord, Slack), not CLI commands (`openacp start`, `openacp plugins install`).
##
[](#how-it-works)
How It Works
Copy
```
`User types /tts on
|
v
Adapter receives text
|
v
CommandRegistry.execute('/tts on', { channelId, userId, sessionId })
|
v
Find handler for 'tts'
|
v
Handler runs, returns CommandResponse
|
v
Adapter renders response (inline keyboard, embed, block kit, etc.)`
```
##
[](#core-types)
Core Types
###
[](#commanddef)
CommandDef
###
[](#commandargs)
CommandArgs
The `reply()` method is an escape hatch for commands that need mid-execution feedback (e.g., `/update` sends "Checking..." then "Updating..." then "Done"). Most commands just return a `CommandResponse`.
###
[](#commandresponse)
CommandResponse
##
[](#commandregistry)
CommandRegistry
##
[](#system-commands-vs-plugin-commands)
System Commands vs Plugin Commands
###
[](#system-commands)
System commands
Registered by core during boot, before plugins load. These handle fundamental operations:
Command
Description
`/new`
Create new session
`/newchat`
New chat in same agent
`/cancel`
Cancel current session
`/status`
Show session status
`/sessions`
List all sessions
`/resume`
Resume a session
`/agents`
List available agents
`/install`
Install new agent
`/help`
Show all commands (auto-generated)
`/menu`
Show main menu
`/restart`
Restart OpenACP
`/update`
Update and restart
`/doctor`
System diagnostics
`/clear`
Clear session history
###
[](#plugin-commands)
Plugin commands
Registered by plugins in their `setup()` via `ctx.registerCommand()`:
Command
Plugin
Description
`/tts`
`@openacp/speech`
Toggle text-to-speech
`/tunnel`
`@openacp/tunnel`
Manage tunnels
`/tunnels`
`@openacp/tunnel`
List active tunnels
`/usage`
`@openacp/usage`
View usage and cost
`/bypass`
`@openacp/security`
Toggle auto-approve mode
##
[](#namespace-conflict-resolution)
Namespace Conflict Resolution
Every plugin command has two names:
*
**Qualified**: `pluginScope:commandName` -- always unique (e.g., `speech:tts`)
*
**Short**: `commandName` -- available if no conflict (e.g., `tts`)
###
[](#rules)
Rules
1.
**System commands always win** -- plugins cannot override system command short names
2.
**First plugin wins** -- first plugin to register a short name keeps it
3.
**Later conflicts get qualified name only** -- the first registrant is not affected
4.
**Warning logged** on conflict
###
[](#example)
Example
##
[](#adapter-dispatch-and-rendering)
Adapter Dispatch and Rendering
###
[](#generic-dispatch)
Generic dispatch
Each adapter adds ONE generic dispatch handler that replaces all hardcoded command handlers:
###
[](#response-renderers)
Response renderers
Adapters provide platform-specific renderers for each response type. Default renderers in the `MessagingAdapter` base class provide plain text fallback.
**Telegram** renders `menu` as inline keyboards, `confirm` as Yes/No buttons:
**Discord** renders `menu` as select menus, `list` as embeds.
**Slack** renders using Block Kit sections.
###
[](#button-callback-data)
Button callback data
Commands triggered by button clicks use the `c/` prefix:
Other callback prefixes remain unchanged: `p:` for permission buttons, etc.
##
[](#two-layer-architecture-for-complex-commands)
Two-Layer Architecture for Complex Commands
Some commands need multi-step interactive flows that vary by platform:
*
`/new` on Telegram: create forum topic, show agent picker keyboard, workspace selection
*
`/new` on Discord: use slash command options, channel creation
*
`/resume`: session scanner, session picker UI
###
[](#how-it-works-1)
How it works
**Layer 1 -- Core logic** (portable): handler returns a simple `CommandResponse`. Works on all adapters.
**Layer 2 -- Platform orchestration** (adapter-specific): adapter registers its own handler for the same command, using `reply()` for multi-step feedback and platform-specific APIs.
###
[](#override-priority)
Override priority
1.
**Adapter-specific handler** (matches current `channelId`) -\> highest priority
2.
**Core handler** -\> fallback
If Telegram registers its own `/new` handler, Telegram users get the rich wizard. Discord users (without an override) get the simpler core handler with a menu response.
##
[](#writing-a-plugin-command)
Writing a Plugin Command
Here's a complete example of a plugin that registers a command:
This command will:
*
Be available as `/weather` on all adapters (short name, no conflict)
*
Also available as `/weather:weather` (qualified name)
*
Appear in `/help` under "Plugin" category
*
Render as a list on Telegram (plain text), Discord (embed), and Slack (blocks)
##
[](#boot-flow)
Boot Flow
##
[](#further-reading)
Further Reading
*
[Architecture Overview](/architecture/architecture) -- high-level picture
*
[Plugin System](/architecture/plugin-system) -- plugin infrastructure
*
[Built-in Plugins](/architecture/built-in-plugins) -- commands each plugin provides
*
[Writing Plugins](/architecture/writing-plugins) -- how to create plugins with commands
[PreviousPlugin System](/architecture/plugin-system)[NextBuilt-in Plugins](/architecture/built-in-plugins)
Last updated 28 days ago
Was this helpful?