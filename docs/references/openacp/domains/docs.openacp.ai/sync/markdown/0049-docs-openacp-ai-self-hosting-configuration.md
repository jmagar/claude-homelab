Configuration | OpenACP Docs
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
[](#config-file-location)
Config File Location
Each instance has its own configuration file:
Copy
```
`\<workspace\>/.openacp/config.json`
```
For example, the default instance lives at `\~/openacp-workspace/.openacp/config.json`. The path can be overridden with the `OPENACP\_CONFIG\_PATH` environment variable. The file is created automatically on first run with safe defaults.
##
[](#interactive-editor)
Interactive Editor
To edit config interactively while OpenACP is running:
Copy
```
`openacp config`
```
This opens a menu-driven editor with sections for Channels, Agent, Workspace, Security, Logging, Run Mode, API, and Tunnel. Changes are saved on exit. When the daemon is running, changes are applied immediately via the local API without requiring a restart (where supported).
##
[](#reconfigure-wizard)
Reconfigure Wizard
For a guided reconfiguration of core sections, use:
Copy
```
`openacp onboard`
```
This runs `runReconfigure()`, which loads your existing config, shows a summary, and lets you step through sections selectively. Sections available:
*
**Channels** — Add, modify, disable, or delete channel configurations. For each configured channel you can choose to modify settings, disable the bot without losing credentials, or permanently delete the channel config.
*
**Agents** — Select which installed agent to use as the default.
*
**Run Mode** — Switch between foreground and daemon mode, and toggle autostart on boot.
*
**Integrations** — Configure optional integrations (e.g., Claude CLI).
For the machine-readable schema with all field types and defaults, see the [Configuration Schema](/api-reference/configuration-schema). For a full list of environment variable overrides, see [Environment Variables](/api-reference/environment-variables).
##
[](#plugin-specific-settings)
Plugin-Specific Settings
With the microkernel plugin architecture, plugin-specific settings (Telegram botToken, speech providers, tunnel config, etc.) are now stored in per-plugin settings files:
The core `config.json` only contains: `defaultAgent`, `security`, `logging`, `runMode`, `autoStart`, and `sessionStore`.
Fields like `channels`, `tunnel`, `speech`, and `usage` in `config.json` are **legacy (auto-migrated)** — they are automatically migrated to their respective plugin `settings.json` files on startup. Existing configurations continue to work without manual changes.
##
[](#full-configuration-reference)
Full Configuration Reference
###
[](#channels)
`channels`
Channel adapters. Each key is a channel identifier. The built-in channels are `telegram` and `discord`.
**Telegram:**
Field
Type
Default
Description
`enabled`
boolean
`false`
Whether this channel is active
`botToken`
string
—
Telegram Bot API token
`chatId`
number
—
Forum group chat ID
`outputMode`
`low` | `medium` | `high`
`medium`
Detail level for agent output messages. The legacy key `displayVerbosity` is accepted for backward compatibility.
**Discord:**
###
[](#agents)
`agents`
Named map of ACP-compatible agent binaries. Each entry describes how to spawn the agent subprocess.
Field
Type
Default
Description
`command`
string
—
Executable name or path
`args`
string[]
`[]`
Additional CLI arguments
`env`
object
`{}`
Extra environment variables for the subprocess
`workingDirectory`
string
—
Override working directory (otherwise uses workspace)
###
[](#defaultagent)
`defaultAgent`
The agent key used when a new session is created. Must exist in `agents`.
###
[](#security)
`security`
Field
Type
Default
Description
`allowedUserIds`
string[]
`[]`
Allowlist of platform user IDs. Empty = all users allowed.
`maxConcurrentSessions`
number
`20`
Hard cap on active + initializing sessions across all channels.
`sessionTimeoutMinutes`
number
`60`
Idle session timeout in minutes.
See [Security](/self-hosting/security) for details.
###
[](#logging)
`logging`
See [Logging](/self-hosting/logging) for details.
###
[](#runmode)
`runMode`
`"foreground"` or `"daemon"`. Controls whether `openacp start` runs in the terminal or spawns a detached background process.
###
[](#autostart)
`autoStart`
If `true`, OpenACP installs a platform autostart entry (macOS LaunchAgent or Linux systemd user service) so the daemon starts on login. Managed automatically by the run mode setup in the config editor and onboard wizard.
###
[](#api)
`api`
The local REST API used by the CLI and web UI. `host` defaults to `127.0.0.1` (loopback only). Do not bind to `0.0.0.0` unless you have network-level access controls in place.
###
[](#tunnel)
`tunnel`
Field
Type
Default
Description
`enabled`
boolean
`false`
Enable tunnel
`port`
number
`3100`
Local port the tunnel exposes
`provider`
string
`"cloudflare"`
`cloudflare`, `ngrok`, `bore`, or `tailscale`
`options`
object
`{}`
Provider-specific options (domain, authtoken, etc.)
`auth.enabled`
boolean
`false`
Require bearer token on tunnel requests
###
[](#usage)
`usage`
Usage tracking. When `monthlyBudget` is set and usage reaches `warningThreshold` (80% by default), a notification is sent. Set `enabled: false` to disable tracking entirely.
###
[](#speech)
`speech`
Speech-to-text and text-to-speech configuration. Set `provider` to the key of a configured entry in `providers` to enable. `null` disables speech for that direction.
###
[](#sessionstore)
`sessionStore`
How long completed session records are retained before cleanup.
###
[](#integrations)
`integrations`
Managed automatically. Records which optional integrations are installed.
##
[](#environment-variable-overrides)
Environment Variable Overrides
The following environment variables override their corresponding config fields at startup. They do not modify the config file on disk.
Variable
Config path
`OPENACP\_CONFIG\_PATH`
*(config file path itself)*
`OPENACP\_TELEGRAM\_BOT\_TOKEN`
`channels.telegram.botToken`
`OPENACP\_TELEGRAM\_CHAT\_ID`
`channels.telegram.chatId`
`OPENACP\_DISCORD\_BOT\_TOKEN`
`channels.discord.botToken`
`OPENACP\_DISCORD\_GUILD\_ID`
`channels.discord.guildId`
`OPENACP\_SLACK\_BOT\_TOKEN`
`channels.slack.botToken`
`OPENACP\_SLACK\_APP\_TOKEN`
`channels.slack.appToken`
`OPENACP\_SLACK\_SIGNING\_SECRET`
`channels.slack.signingSecret`
`OPENACP\_DEFAULT\_AGENT`
`defaultAgent`
`OPENACP\_RUN\_MODE`
`runMode`
`OPENACP\_API\_PORT`
`api.port`
`OPENACP\_LOG\_LEVEL`
`logging.level`
`OPENACP\_LOG\_DIR`
`logging.logDir`
`OPENACP\_DEBUG`
Sets `logging.level` to `debug` (when `OPENACP\_LOG\_LEVEL` is not set)
`OPENACP\_TUNNEL\_ENABLED`
`tunnel.enabled`
`OPENACP\_TUNNEL\_PORT`
`tunnel.port`
`OPENACP\_TUNNEL\_PROVIDER`
`tunnel.provider`
`OPENACP\_SPEECH\_STT\_PROVIDER`
`speech.stt.provider`
`OPENACP\_SPEECH\_GROQ\_API\_KEY`
`speech.stt.providers.groq.apiKey`
Environment variables are applied after the config file is read and before Zod validation. They take precedence over file values.
##
[](#hot-reload)
Hot-Reload
When `openacp config` communicates changes via the local API (daemon mode), supported fields are applied to the running process immediately. Fields that require a full restart (e.g., channel credentials, API port) emit a `needsRestart` signal in the response.
##
[](#backward-compatibility)
Backward Compatibility
Every new config field uses `.default()` or `.optional()` in the Zod schema. This means an older `config.json` will always pass validation after an upgrade — missing fields are filled with their defaults. Fields are never renamed or removed without a migration.
Automatic migrations run at startup before validation. Current migrations:
*
`add-tunnel-section` — Adds the `tunnel` block if absent (pre-0.3 configs).
*
`fix-agent-commands` — Renames legacy agent command names to their current equivalents.
*
`migrate-agents-to-store` — Moves agent definitions from `config.json` into the separate `\<instance-root\>/agents.json` store.
Migrations mutate the raw JSON in place and write it back to disk if any change was made. No action is required from you.
[PreviousInstallation](/self-hosting/installation)[NextDaemon Mode](/self-hosting/daemon-mode)
Last updated 20 days ago
Was this helpful?