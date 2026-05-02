Daemon Mode | OpenACP Docs
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
[](#foreground-vs-daemon)
Foreground vs Daemon
OpenACP can run in two modes, controlled by the `runMode` config field.
**Foreground** (`runMode: "foreground"`) — The process stays attached to your terminal. Log output is printed to stdout. The process exits when you close the terminal or press Ctrl+C. Use this during initial setup, debugging, or when you want to watch logs in real time.
**Daemon** (`runMode: "daemon"`) — The process detaches from the terminal and runs in the background. Output is written to a log file. The process survives terminal closure. This is the recommended mode for production self-hosting.
##
[](#commands)
Commands
All daemon commands use the `openacp` CLI:
Copy
```
`openacp start # Start (foreground or daemon depending on runMode config)
openacp stop # Send SIGTERM to the daemon, wait up to 5 s, then SIGKILL
openacp status # Print running/stopped and PID if running
openacp logs # Tail the daemon log file
openacp restart # stop + start
openacp attach # Connect to running daemon: show status + tail logs`
```
###
[](#openacp-start)
`openacp start`
When `runMode` is `daemon`, this spawns a detached child process (`--daemon-child` flag) and returns immediately. The child writes its PID to the PID file and begins accepting messages.
When `runMode` is `foreground`, this runs the server in the current process.
###
[](#openacp-stop)
`openacp stop`
Reads the PID file and sends `SIGTERM`. Polls every 100 ms for up to 5 seconds waiting for the process to exit. If the process does not exit within 5 seconds, `SIGKILL` is sent. The PID file is removed after a successful stop.
Calling `stop` also removes the running marker file (`\<instance-root\>/running`), which suppresses autostart on the next boot.
###
[](#openacp-restart)
`openacp restart`
Equivalent to `stop` followed by `start`. If no daemon is running, it skips the stop step and starts a new one. Useful after updating OpenACP to pick up the new version without manually stopping first.
###
[](#openacp-status)
`openacp status`
Checks whether the PID in the PID file is alive (using `kill -0`). Cleans up stale PID files automatically.
###
[](#openacp-logs)
`openacp logs`
Tails `\<instance-root\>/logs/openacp.log`. In daemon mode this is where all server output goes.
###
[](#openacp-attach)
`openacp attach`
Connects to a running daemon and shows a rich status display (uptime, active sessions, adapters, tunnel status) followed by live log tailing. Press Ctrl+C to detach without affecting the daemon.
Useful when you want to monitor a daemon that was started earlier or by autostart, without managing it as a foreground process.
##
[](#smart-startup)
Smart startup
When you run `openacp` (no arguments) and a daemon is already running, instead of printing an error, OpenACP shows a rich status display with an interactive menu:
Key
Action
`r`
Restart the daemon
`f`
Restart in foreground mode
`s`
Show full status details
`l`
Tail the log file
`q`
Quit
The display shows which instance is active and its directory path.
You can force a specific mode on startup:
##
[](#file-locations)
File Locations
All runtime files live inside the instance root (`\<workspace\>/.openacp/`):
File
Path
Purpose
PID file
`\<instance-root\>/openacp.pid`
Process ID of the running daemon
Log file
`\<instance-root\>/logs/openacp.log`
Daemon stdout/stderr and application logs
Running marker
`\<instance-root\>/running`
Written on start, removed on stop; used to decide whether to autostart on boot
Port file
`\<instance-root\>/api.port`
Current API port (written by the server on startup)
##
[](#autostart-on-boot)
Autostart on Boot
OpenACP can register itself to start automatically when you log in. This is configured separately per platform.
###
[](#macos-launchagent)
macOS — LaunchAgent
On macOS, autostart uses a user-level `launchd` plist:
When autostart is enabled, the plist is written and loaded with `launchctl load`. The daemon is configured with `RunAtLoad: true` and `KeepAlive` set to restart on non-zero exit. Log output goes to `\<instance-root\>/logs/openacp.log`.
To enable autostart from the CLI:
Or via onboard:
To remove the LaunchAgent:
This runs `launchctl unload` and deletes the plist file.
###
[](#linux-systemd-user-service)
Linux — systemd User Service
On Linux, autostart uses a systemd user service:
When autostart is enabled, the unit file is written and enabled with `systemctl --user enable openacp`. The service uses `Restart=on-failure`.
To enable or disable, use the same `openacp config` or `openacp onboard` flow as on macOS.
###
[](#windows)
Windows
Autostart is not supported natively on Windows. Use WSL2 and follow the Linux instructions, or configure a Windows Task Scheduler entry manually pointing to the WSL binary.
##
[](#when-to-use-each-mode)
When to Use Each Mode
Scenario
Recommended mode
First-time setup
Foreground — watch the logs live
Debugging a problem
Foreground with `OPENACP\_DEBUG=true`
Persistent personal server
Daemon with autostart enabled
CI / container
Foreground (process managed by container runtime)
Server with uptime requirements
Daemon + systemd (Linux) or LaunchAgent (macOS)
[PreviousConfiguration](/self-hosting/configuration)[NextSecurity](/self-hosting/security)
Last updated 20 days ago
Was this helpful?