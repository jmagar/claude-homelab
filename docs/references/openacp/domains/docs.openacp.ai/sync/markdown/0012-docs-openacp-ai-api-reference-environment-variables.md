Environment Variables | OpenACP Docs
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
Environment variables override values in `\~/.openacp/config.json` at startup. They do not modify the config file.
All overrides are applied before Zod schema validation, so the final config is always validated.
Variable
Config Equivalent
Type
Description
`OPENACP\_TELEGRAM\_BOT\_TOKEN`
`channels.telegram.botToken`
string
Telegram Bot API token
`OPENACP\_TELEGRAM\_CHAT\_ID`
`channels.telegram.chatId`
number
Telegram chat/supergroup ID (parsed as integer)
`OPENACP\_DISCORD\_BOT\_TOKEN`
`channels.discord.botToken`
string
Discord bot token
`OPENACP\_DISCORD\_GUILD\_ID`
`channels.discord.guildId`
string
Discord server (guild) ID
`OPENACP\_SLACK\_BOT\_TOKEN`
`channels.slack.botToken`
string
Slack bot OAuth token (`xoxb-...`)
`OPENACP\_SLACK\_APP\_TOKEN`
`channels.slack.appToken`
string
Slack app-level token for Socket Mode (`xapp-...`)
`OPENACP\_SLACK\_SIGNING\_SECRET`
`channels.slack.signingSecret`
string
Slack signing secret
`OPENACP\_DEFAULT\_AGENT`
`defaultAgent`
string
Agent name to use when none is specified
`OPENACP\_RUN\_MODE`
`runMode`
`"foreground"` | `"daemon"`
How `openacp` starts the server
`OPENACP\_API\_PORT`
`api.port`
number
REST API listen port (parsed as integer)
`OPENACP\_LOG\_LEVEL`
`logging.level`
string
Log level (`silent`, `debug`, `info`, `warn`, `error`, `fatal`)
`OPENACP\_LOG\_DIR`
`logging.logDir`
string
Directory for log files
`OPENACP\_DEBUG`
`logging.level` → `"debug"`
any
Set to any non-empty value to enable debug logging. Ignored if `OPENACP\_LOG\_LEVEL` is also set.
`OPENACP\_TUNNEL\_ENABLED`
`tunnel.enabled`
boolean
Set to `"true"` or `"false"` to enable/disable the tunnel service
`OPENACP\_TUNNEL\_PORT`
`tunnel.port`
number
Tunnel service listen port (parsed as integer)
`OPENACP\_TUNNEL\_PROVIDER`
`tunnel.provider`
string
Tunnel provider (`cloudflare`, `ngrok`, `bore`, `tailscale`)
`OPENACP\_SPEECH\_STT\_PROVIDER`
`speech.stt.provider`
string
Active speech-to-text provider name
`OPENACP\_SPEECH\_GROQ\_API\_KEY`
`speech.stt.providers.groq.apiKey`
string
API key for the Groq STT provider
`OPENACP\_CONFIG\_PATH`
—
string
Override the config file path (default: `\<instance-root\>/config.json`)
`OPENACP\_INSTANCE\_ROOT`
—
string
Set the instance root directory. Overrides auto-detection and CLI flags. See [Multi-Instance](/features/multi-instance).
##
[](#plugin-level-environment-variables)
Plugin-Level Environment Variables
With the plugin architecture, channel-specific and feature-specific environment variables are now handled by individual plugins in their `setup()` method. The following variables are **plugin-level** (processed by the respective plugin, not core):
*
**Telegram plugin:** `OPENACP\_TELEGRAM\_BOT\_TOKEN`, `OPENACP\_TELEGRAM\_CHAT\_ID`
*
**Discord plugin:** `OPENACP\_DISCORD\_BOT\_TOKEN`, `OPENACP\_DISCORD\_GUILD\_ID`
*
**Slack plugin:** `OPENACP\_SLACK\_BOT\_TOKEN`, `OPENACP\_SLACK\_APP\_TOKEN`, `OPENACP\_SLACK\_SIGNING\_SECRET`
*
**Speech plugin:** `OPENACP\_SPEECH\_STT\_PROVIDER`, `OPENACP\_SPEECH\_GROQ\_API\_KEY`
*
**Tunnel plugin:** `OPENACP\_TUNNEL\_ENABLED`, `OPENACP\_TUNNEL\_PORT`, `OPENACP\_TUNNEL\_PROVIDER`
These remain functional for backward compatibility but are read by each plugin rather than by core config loading.
**Core-level** variables (processed by OpenACPCore directly): `OPENACP\_CONFIG\_PATH`, `OPENACP\_DEFAULT\_AGENT`, `OPENACP\_RUN\_MODE`, `OPENACP\_API\_PORT`, `OPENACP\_LOG\_LEVEL`, `OPENACP\_LOG\_DIR`, `OPENACP\_DEBUG`.
##
[](#notes)
Notes
*
`**OPENACP\_DEBUG**` is a convenience shorthand. Setting `OPENACP\_LOG\_LEVEL=debug` is equivalent and takes precedence.
*
`**OPENACP\_CONFIG\_PATH**` does not correspond to a config field; it controls where the config file is read from and is evaluated before any config is loaded.
*
Numeric fields (`OPENACP\_TELEGRAM\_CHAT\_ID`, `OPENACP\_API\_PORT`, `OPENACP\_TUNNEL\_PORT`) are converted to integers automatically.
*
Boolean fields (`OPENACP\_TUNNEL\_ENABLED`) are compared to the string `"true"` — any other value is treated as `false`.
*
Env vars take precedence over `config.json` but are not persisted; `openacp config set` modifies the file.
[PreviousConfiguration Schema](/api-reference/configuration-schema)[NextCommon Issues](/troubleshooting/troubleshooting)
Last updated 20 days ago
Was this helpful?