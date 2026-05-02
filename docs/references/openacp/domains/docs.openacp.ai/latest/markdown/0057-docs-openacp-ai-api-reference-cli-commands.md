CLI Commands | OpenACP Docs
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
All commands are invoked as `openacp \<command\> [subcommand] [options]`. Every command accepts `-h` / `--help` for inline help.
##
[](#json-output)
JSON Output
Many commands accept a `--json` flag for machine-readable output. When `--json` is passed:
*
Output is a single line of valid JSON on stdout
*
Exit code `0` for success, non-zero for errors
*
All progress indicators and ANSI codes are suppressed
**Success envelope (exit 0):**
Copy
```
`{ "success": true, "data": { ... } }`
```
**Error envelope (exit non-zero):**
Copy
```
`{ "success": false, "error": { "code": "ERROR\_CODE", "message": "Human-readable description" } }`
```
Commands that support `--json` are noted in their options tables below.
##
[](#adopt)
adopt
Transfers an existing external agent session into OpenACP so it appears as a messaging thread. Requires a running daemon.
**Usage**
**Options**
Flag
Description
`--cwd \<path\>`
Working directory for the session (default: current directory)
`--channel \<name\>`
Target channel adapter, e.g. `telegram`, `discord` (default: first registered)
`--json`
Output result as JSON
**Examples**
**JSON output** (`data` shape):
##
[](#attach)
attach
Connects to a running daemon and displays live status with log tailing. Useful for monitoring a daemon instance without opening a separate terminal.
**Usage**
Shows the daemon's current status (uptime, sessions, adapters, tunnel) and tails the log file. Press Ctrl+C to detach.
##
[](#agents)
agents
Browse and manage AI coding agents from the ACP Registry.
**Usage**
###
[](#agents-no-subcommand)
agents (no subcommand)
Lists all installed agents and agents available to install from the registry.
**Example**
**JSON output** (`data` shape):
###
[](#agents-install)
agents install
Installs an agent from the ACP Registry. Automatically installs the handoff integration if the agent supports it.
Flag
Description
`--force`
Reinstall even if already installed
`--json`
Output result as JSON
**JSON output** (`data` shape):
###
[](#agents-uninstall)
agents uninstall
Removes an installed agent and its handoff integration (if any).
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
###
[](#agents-info)
agents info
Shows version, distribution type, command, setup steps, and installation status for an agent.
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
###
[](#agents-run)
agents run
Runs the agent's CLI directly (useful for first-run login and configuration). ACP-specific flags are automatically stripped before passing arguments.
Use `--` to separate OpenACP flags from agent-specific arguments.
###
[](#agents-refresh)
agents refresh
Force-refreshes the agent catalog from the ACP Registry, bypassing the normal staleness check.
##
[](#api)
api
Interacts with a running OpenACP daemon over the local REST API. Requires a running daemon (`openacp start`).
All `api` subcommands support `--json` for machine-readable output.
**Usage**
###
[](#api-cancel)
api cancel
Cancels a session.
###
[](#api-cleanup)
api cleanup
Deletes finished topics from channel adapters.
`--status` accepts a comma-separated list (e.g. `finished,error`). Defaults to finished topics.
###
[](#api-config)
api config
Shows or updates runtime config. Prefer `openacp config` for general use — it works whether the daemon is running or not.
###
[](#api-bypass)
api bypass
Enables or disables bypass permissions for a session. When enabled, the agent runs destructive commands without confirmation prompts.
###
[](#api-delete-topic)
api delete-topic
Deletes a topic for a given session ID.
`--force` deletes even if the session is currently active.
###
[](#api-health)
api health
Shows system health: status, uptime, version, memory, session counts, adapters, and tunnel status.
###
[](#api-new)
api new
Creates a new session.
Both `agent` and `workspace` are optional. Uses `defaultAgent` from config if omitted. `workspace` defaults to the current working directory.
###
[](#api-notify)
api notify
Sends a notification message to all registered channel adapters.
All remaining arguments are joined into the message.
###
[](#api-restart)
api restart
Sends a restart signal to the running daemon.
###
[](#api-send)
api send
Sends a prompt to a session. The prompt is enqueued; responses arrive asynchronously via the channel adapter.
All arguments after `\<session-id\>` are joined as the prompt.
###
[](#api-session)
api session
Shows detailed information about one session.
###
[](#api-status)
api status
Lists all active sessions with ID, agent, status, and name.
###
[](#api-topics)
api topics
Lists topics across all channel adapters.
`--status` accepts a comma-separated filter (e.g. `active,finished`).
###
[](#api-tunnel)
api tunnel
Shows tunnel status (provider, URL).
###
[](#api-version)
api version
Shows the version of the currently running daemon.
##
[](#dev)
dev
Runs OpenACP with a local plugin loaded in development mode. Compiles TypeScript automatically, starts `tsc --watch` for hot-reload, and boots the server with the plugin.
**Usage**
**Options**
Flag
Description
`--no-watch`
Disable file watching (no hot-reload)
`--verbose`
Enable verbose logging
**Examples**
See [Dev Mode](/extending/dev-mode) for the full guide.
##
[](#config)
config
Views and edits configuration. Works with both a running and a stopped daemon.
**Usage**
`openacp config` (no args) opens an interactive terminal editor. When the daemon is running, changes are applied live via the API; otherwise the config file is edited directly.
`openacp config set` applies a single value by dot-notation path. Values are JSON-parsed if possible, otherwise treated as strings. Supports `--json` for scripted use.
**JSON output for **`**config set**` (`data` shape):
##
[](#doctor)
doctor
Runs system diagnostics. Checks config validity, agent availability, dependencies, and connectivity. Fixable issues can be auto-repaired interactively.
**Usage**
Flag
Description
`--dry-run`
Report issues only; do not apply any fixes
`--json`
Output result as JSON (implies `--dry-run`; always exits 0 — check `summary.failed` for health)
**JSON output** (`data` shape):
##
[](#install)
install
Installs a plugin from npm into `\<instance-root\>/plugins/`. Supports built-in plugins, community npm packages, and pinning a specific version with `@version` syntax.
**Usage**
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
This is an alias for `openacp plugin add`. See [plugin install](/api-reference/cli-commands#plugin-install) for details.
##
[](#integrate)
integrate
Manages agent integrations that enable features like session handoff from an agent to OpenACP.
**Usage**
##
[](#logs)
logs
Tails the daemon log file (last 50 lines, then follows new output). Equivalent to `tail -f`. Press Ctrl+C to stop.
**Usage**
Log directory is configured via `logging.logDir` (default: `\<instance-root\>/logs/`).
##
[](#onboard)
onboard
Runs the first-run setup wizard if no config exists. If config already exists, runs the reconfiguration wizard, which allows modifying or disabling individual channels, agents, workspace settings, run mode, and integrations. Individual sections (e.g. a specific channel) can be modified, disabled, or deleted without affecting the rest of the config.
**Usage**
##
[](#plugin-create)
plugin create
Scaffolds a new OpenACP plugin project with all boilerplate: TypeScript config, test setup, lifecycle hooks, and package.json.
**Usage**
Runs an interactive wizard that prompts for:
*
Plugin name (npm package name, e.g. `@myorg/my-plugin`)
*
Description
*
Author
*
License
Creates a directory with `src/index.ts`, `src/\_\_tests\_\_/index.test.ts`, `package.json`, `tsconfig.json`, `CLAUDE.md` (AI agent context), `PLUGIN\_GUIDE.md` (developer guide), and config files.
**Example**
See [Getting Started: Your First Plugin](/extending/getting-started-plugin) for a full walkthrough.
##
[](#plugin-install)
plugin install
Installs a plugin package. Works with both built-in plugins and community plugins published to npm. Supports `@version` syntax to pin a specific version. After npm install, checks the plugin's `engines.openacp` field and warns if the installed CLI version is older than the minimum required.
**Usage**
Flag
Description
`--json`
Output result as JSON
**Examples**
**JSON output** (`data` shape):
Community plugins are installed via `npm install` into `\<instance-root\>/plugins/node\_modules/`. The plugin's `install()` hook is called if defined.
##
[](#plugin-configure)
plugin configure
Runs the configuration flow for an installed plugin. Calls the plugin's `configure()` hook, which typically presents interactive prompts to update settings.
**Usage**
**Example**
##
[](#plugin-enable-disable)
plugin enable / disable
Enables or disables an installed plugin without removing it. Disabled plugins are skipped during server startup.
**Usage**
Flag
Description
`--json`
Output result as JSON
**Examples**
**JSON output** (`data` shape):
##
[](#remote)
remote
Generates access links for connecting app clients to a running OpenACP instance. Displays local URL, tunnel URL (if enabled), app deep link, and a QR code.
**Usage**
Flag
Description
`--json`
Output result as JSON (no QR code printed)
The generated link includes a single-use access code valid for 30 minutes. The app exchanges this code for a JWT token on first use.
**Example output**
**JSON output** (`data` shape):
See [App Connectivity](/features/app-connectivity) for the full guide.
##
[](#plugins)
plugins
Lists all plugins installed in the current instance's `plugins/` directory.
**Usage**
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
##
[](#reset)
reset
Deletes the current instance data and allows starting fresh. This is destructive — config, plugins, and session data for the instance are removed. The daemon must be stopped first.
**Usage**
Prompts for confirmation before proceeding.
##
[](#restart)
restart
Restarts the daemon. By default uses the same run mode as configured; use `--foreground` or `--daemon` to override.
**Usage**
Flag
Description
`--foreground`
Restart in foreground mode (not compatible with `--json`)
`--daemon`
Restart as background daemon
`--json`
Output result as JSON (always uses daemon mode)
**JSON output** (`data` shape):
##
[](#setup)
setup
Writes a minimal `config.json` to an instance root. Used for non-interactive setup (e.g., scripted deployments and the desktop app onboarding flow).
**Usage**
**Options**
Flag
Description
`--agent \<name\>`
Required. Agent name(s) to configure. Comma-separated for multiple.
`--dir \<path\>`
Workspace directory. Defaults to auto-detected or current directory.
`--run-mode`
`daemon` (default) or `foreground`.
`--json`
Output result as JSON.
**Examples**
**JSON output** (`data` shape):
##
[](#instances)
instances
Manages registered OpenACP instances in the shared instance registry (`\~/.openacp/instances.json`).
**Usage**
###
[](#instances-list)
instances list
Lists all instances registered in the global registry with their ID, name, directory, and running status.
**JSON output** (`data` shape):
###
[](#instances-create)
instances create
Creates or registers an instance at the specified workspace directory.
*
If `\<workspace\>/.openacp/` already exists but is not registered, it is registered.
*
Otherwise a new instance root is created with a minimal config.
Flag
Description
`--dir \<path\>`
Required. Workspace directory for the instance.
`--from \<path\>`
Copy config from an existing instance workspace.
`--name \<id\>`
Instance ID to register under.
`--agent \<name\>`
Default agent name (used in non-interactive mode).
`--no-interactive`
Skip interactive prompts; write a minimal config immediately.
`--json`
Output result as JSON.
**JSON output** (`data` shape):
##
[](#start)
start
Starts OpenACP as a background daemon. Requires an existing instance config — run `openacp` first to set up, or use `openacp setup` for non-interactive setup.
**Usage**
**Options**
Flag
Description
`--local`
Use `.openacp/` instance in the current directory.
`--dir \<path\>`
Use a specific workspace directory.
`--json`
Output result as JSON.
**JSON output** (`data` shape):
##
[](#status)
status
Shows whether the OpenACP daemon is running and its PID.
**Usage**
Flag
Description
`--all`
Show status of all registered instances, not just the current one
`--id \<id\>`
Show status of a specific instance
`--json`
Output result as JSON
**JSON output** (`data` shape — all instances):
**JSON output** (`data` shape — single instance with `--id`):
##
[](#stop)
stop
Sends a stop signal to the running daemon.
**Usage**
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
##
[](#tunnel)
tunnel
Manages tunnels to local ports. Requires a running daemon.
**Usage**
###
[](#tunnel-add)
tunnel add
Creates a tunnel to a local port.
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
###
[](#tunnel-list)
tunnel list
Lists all active tunnels with their ports, labels, and public URLs.
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
###
[](#tunnel-stop)
tunnel stop
Stops the tunnel for a specific local port.
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
###
[](#tunnel-stop-all)
tunnel stop-all
Stops all user tunnels.
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
##
[](#uninstall)
uninstall
Removes an adapter plugin.
**Usage**
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
##
[](#update)
update
Checks npm for the latest version of `@openacp/cli` and installs it if an update is available.
**Usage**
##
[](#no-command-foreground)
(no command / --foreground)
Running `openacp` with no arguments starts the server. On first run, the setup wizard launches. After setup, behavior depends on `runMode` in config:
*
`foreground` — runs in the current terminal.
*
`daemon` — spawns a background process and exits.
If a daemon is already running, `openacp` shows a rich status display with an interactive menu instead of an error:
*
**r** — restart the daemon
*
**f** — restart in foreground mode
*
**s** — show full status
*
**l** — tail logs
*
**q** — quit
The startup display shows which instance is active and its directory path.
`openacp --foreground` forces foreground mode regardless of config.
##
[](#version)
version
Prints the installed version. Also available as `--version` / `-v`.
**Usage**
Flag
Description
`--json`
Output result as JSON
**JSON output** (`data` shape):
##
[](#help-h)
--help / -h
Prints the top-level help message listing all commands.
[PreviousOverview](/api-reference/api-reference)[NextREST API](/api-reference/rest-api)
Last updated 20 days ago
Was this helpful?