Configuration Schema | OpenACP Docs
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
Config is stored at `\<workspace\>/.openacp/config.json` (e.g. `\~/openacp-workspace/.openacp/config.json`). The file is created with defaults on first run. All fields support backward-compatible migrations; old configs load without errors.
Edit interactively with `openacp config`, or set individual values with `openacp config set \<path\> \<value\>`.
##
[](#channels)
channels
Channel adapters. Each adapter key under `channels` is an object. The built-in Telegram and Discord adapters ship with OpenACP; Slack and others are plugin-based.
###
[](#channels.telegram)
channels.telegram.\*
Field
Type
Default
Description
`channels.telegram.enabled`
boolean
`false`
Enable the Telegram adapter
`channels.telegram.botToken`
string
`"YOUR\_BOT\_TOKEN\_HERE"`
Telegram Bot API token (from @BotFather)
`channels.telegram.chatId`
number
`0`
Telegram group/supergroup chat ID
`channels.telegram.notificationTopicId`
number | null
`null`
Forum topic ID for system notifications
`channels.telegram.assistantTopicId`
number | null
`null`
Forum topic ID for the Assistant
`channels.telegram.outputMode`
`"low"` | `"medium"` | `"high"`
`"medium"`
Controls how much detail is shown in messages. The legacy key `displayVerbosity` is accepted for backward compatibility.
###
[](#channels.discord)
channels.discord.\*
Field
Type
Default
Description
`channels.discord.enabled`
boolean
`false`
Enable the Discord adapter
`channels.discord.botToken`
string
`"YOUR\_DISCORD\_BOT\_TOKEN\_HERE"`
Discord bot token
`channels.discord.guildId`
string
`""`
Discord server (guild) ID
`channels.discord.forumChannelId`
string | null
`null`
Forum channel ID for session threads
`channels.discord.notificationChannelId`
string | null
`null`
Channel ID for system notifications
`channels.discord.assistantThreadId`
string | null
`null`
Thread ID for the Assistant
`channels.discord.outputMode`
`"low"` | `"medium"` | `"high"`
`"medium"`
Adapter-level output detail. Overridden per session via `/outputmode session`. 3-level cascade: session → adapter → global → `"medium"`. The legacy key `displayVerbosity` is auto-migrated on startup.
###
[](#channels.slack)
channels.slack.\*
Slack support is provided via a plugin adapter. Fields follow the schema below when the Slack plugin is installed.
Field
Type
Default
Description
`channels.slack.enabled`
boolean
`false`
Enable the Slack adapter
`channels.slack.botToken`
string
—
Slack bot OAuth token (`xoxb-...`)
`channels.slack.appToken`
string
—
Slack app-level token for Socket Mode (`xapp-...`)
`channels.slack.signingSecret`
string
—
Slack signing secret for request verification
`channels.slack.notificationChannelId`
string
—
Channel ID for system notifications
`channels.slack.allowedUserIds`
string[]
`[]`
Slack user IDs permitted to interact
`channels.slack.channelPrefix`
string
`"openacp"`
Prefix for auto-created Slack channels
`channels.slack.autoCreateSession`
boolean
`true`
Auto-create a session on first message
`channels.slack.startupChannelId`
string
—
Channel to post startup notification to
###
[](#base-channel-fields-all-adapters)
Base channel fields (all adapters)
Field
Type
Default
Description
`enabled`
boolean
`false`
Whether this channel is active
`adapter`
string
—
Package name for plugin-based adapters
`outputMode`
`"low"` | `"medium"` | `"high"`
`"medium"`
Message detail level. The legacy key `displayVerbosity` is accepted for backward compatibility.
##
[](#agents)
agents
Map of named agent configurations. Each key is an agent name used in `defaultAgent` and session creation.
Field
Type
Default
Description
`agents.\<name\>.command`
string
—
Executable to spawn (e.g. `claude-agent-acp`)
`agents.\<name\>.args`
string[]
`[]`
Arguments passed to the command
`agents.\<name\>.workingDirectory`
string
—
Default working directory for this agent
`agents.\<name\>.env`
object
`{}`
Additional environment variables for the subprocess
**Example**
##
[](#outputmode)
outputMode
Field
Type
Default
Description
`outputMode`
`"low"` | `"medium"` | `"high"`
`"medium"`
Global default output mode. Overridden per adapter via `channels.\<name\>.outputMode` and per session via `/outputmode session`. See [Output Modes](/features/output-modes).
##
[](#defaultagent)
defaultAgent
Field
Type
Default
Description
`defaultAgent`
string
`"claude"`
Agent name used when no agent is specified in a session
##
[](#workspace)
workspace
Field
Type
Default
Description
`workspace.allowExternalWorkspaces`
boolean
`true`
Whether sessions can use working directories outside the workspace root
The workspace base directory is derived automatically from the instance root parent — it is no longer a config field. The directory containing `.openacp/` is the workspace.
##
[](#security)
security
Field
Type
Default
Description
`security.allowedUserIds`
string[]
`[]`
Whitelist of channel user IDs permitted to start sessions. Empty list allows all users.
`security.maxConcurrentSessions`
number
`20`
Maximum number of simultaneously active sessions
`security.sessionTimeoutMinutes`
number
`60`
Minutes of inactivity before a session is automatically closed
##
[](#logging)
logging
Field
Type
Default
Description
`logging.level`
`"silent"` | `"debug"` | `"info"` | `"warn"` | `"error"` | `"fatal"`
`"info"`
Log verbosity level
`logging.logDir`
string
`"\<instance-root\>/logs"`
Directory for log files
`logging.maxFileSize`
string | number
`"10m"`
Maximum size per log file before rotation
`logging.maxFiles`
number
`7`
Number of rotated log files to retain
`logging.sessionLogRetentionDays`
number
`30`
Days to retain per-session log files
##
[](#api)
api
Field
Type
Default
Description
`api.port`
number
`21420`
Port for the local REST API server
`api.host`
string
`"127.0.0.1"`
Host/interface to bind. Change to `0.0.0.0` to expose externally (not recommended without firewall rules).
##
[](#runmode)
runMode
Field
Type
Default
Description
`runMode`
`"foreground"` | `"daemon"`
`"foreground"`
How `openacp` (no args) starts the server. `daemon` forks to a background process.
##
[](#autostart)
autoStart
Field
Type
Default
Description
`autoStart`
boolean
`false`
Whether to register OpenACP as a system service that starts on login
##
[](#sessionstore)
sessionStore
Field
Type
Default
Description
`sessionStore.ttlDays`
number
`30`
Days before session records are purged from the store
##
[](#tunnel)
tunnel
Field
Type
Default
Description
`tunnel.enabled`
boolean
`false`
Enable the built-in tunnel service. When `true`, the tunnel auto-starts on server boot with keepalive monitoring.
`tunnel.provider`
`"cloudflare"` | `"ngrok"` | `"bore"` | `"tailscale"`
`"cloudflare"`
Tunnel provider
`tunnel.options`
object
`{}`
Provider-specific options (passed through to the tunnel process)
`tunnel.maxUserTunnels`
number
`5`
Maximum number of simultaneous user-created tunnels
`tunnel.storeTtlMinutes`
number
`60`
Minutes before expired tunnel entries are cleaned up
##
[](#usage)
usage
Field
Type
Default
Description
`usage.enabled`
boolean
`true`
Track token/cost usage per session
`usage.monthlyBudget`
number
—
Monthly spending limit in `usage.currency`
`usage.warningThreshold`
number
`0.8`
Fraction of budget at which to send a warning (0–1)
`usage.currency`
string
`"USD"`
Currency for budget tracking
`usage.retentionDays`
number
`90`
Days to retain usage records
##
[](#speech)
speech
###
[](#speech.stt)
speech.stt.\*
Field
Type
Default
Description
`speech.stt.provider`
string | null
`null`
Active STT provider name (e.g. `"groq"`)
`speech.stt.providers.\<name\>.apiKey`
string
—
API key for the named provider
`speech.stt.providers.\<name\>.model`
string
—
Model identifier for the named provider
###
[](#speech.tts)
speech.tts.\*
Field
Type
Default
Description
`speech.tts.provider`
string | null
`null`
Active TTS provider name
`speech.tts.providers.\<name\>.apiKey`
string
—
API key for the named provider
`speech.tts.providers.\<name\>.model`
string
—
Model identifier for the named provider
##
[](#agentswitch)
agentSwitch
Controls the behavior of the `/switch` command.
Field
Type
Default
Description
`agentSwitch.labelHistory`
boolean
`true`
When `true`, agent names are prepended to messages in the conversation history injected into the new agent during a switch. Helps the incoming agent distinguish which AI produced which response.
**Example**
##
[](#integrations)
integrations
Tracks installed agent integrations (managed automatically by `openacp agents install` / `openacp integrate`).
Field
Type
Description
`integrations.\<name\>.installed`
boolean
Whether the integration is installed
`integrations.\<name\>.installedAt`
string
ISO 8601 timestamp of installation
[PreviousREST API](/api-reference/rest-api)[NextEnvironment Variables](/api-reference/environment-variables)
Last updated 20 days ago
Was this helpful?