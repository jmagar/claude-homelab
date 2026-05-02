Logging | OpenACP Docs
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
[](#log-levels)
Log Levels
OpenACP uses [Pino](https://github.com/pinojs/pino) for structured logging. The valid levels, in ascending severity order, are:
Level
When to use
`silent`
Suppress all output
`debug`
Verbose internals — ACP events, session state transitions, config loads
`info`
Normal operational events — server start, session created/completed, channel connected
`warn`
Non-fatal issues — stale PID file, insecure file permissions, failed validation with fallback
`error`
Failures that affect functionality but do not crash the process
`fatal`
Unrecoverable errors before process exit
The default level is `info`.
##
[](#configuration)
Configuration
Copy
```
`"logging": {
"level": "info",
"logDir": "\<instance-root\>/logs",
"maxFileSize": "10m",
"maxFiles": 7,
"sessionLogRetentionDays": 30
}`
```
Field
Type
Default
Description
`level`
string
`"info"`
Minimum level to emit
`logDir`
string
`"\<instance-root\>/logs"`
Directory for log files. Defaults to the `logs/` subdirectory of the instance root.
`maxFileSize`
string | number
`"10m"`
Maximum size per log file before rotation. Accepts bytes or suffixes: `k`, `m`, `g`.
`maxFiles`
number
`7`
Number of rotated log files to keep.
`sessionLogRetentionDays`
number
`30`
Per-session log files older than this are deleted at startup.
Change these values via `openacp config` (Logging section) or by editing `\<instance-root\>/config.json` directly.
##
[](#log-files)
Log Files
The main log file is:
This file receives all log output from the running process, including the daemon's stdout and stderr when in daemon mode. It is rotated using `pino-roll` when it reaches `maxFileSize`. Up to `maxFiles` rotated files are retained.
To tail the log in real time:
Or directly:
##
[](#per-session-logs)
Per-Session Logs
Each session gets its own log file under:
Session log entries are written simultaneously to the session file and to the main `openacp.log` (with the `sessionId` field present on every record). This lets you review a single session's history in isolation without filtering the combined log.
Session log files are cleaned up automatically at startup. Any file in `\<instance-root\>/logs/sessions/` whose last modification time is older than `sessionLogRetentionDays` days is deleted.
##
[](#debug-mode)
Debug Mode
To enable debug logging without editing the config file, set `OPENACP\_DEBUG=true`:
This sets the log level to `debug` at runtime, provided `OPENACP\_LOG\_LEVEL` is not also set. Debug output includes:
*
Full ACP event payloads from agent subprocesses
*
Session state machine transitions
*
Config load and migration details
*
API request routing
You can also override the level directly:
##
[](#structured-json-format)
Structured JSON Format
Log entries are written to files as newline-delimited JSON (Pino's default format). Each line is a self-contained JSON object. Example:
The terminal transport uses `pino-pretty` for human-readable coloured output. The file transport writes raw JSON for easy ingestion by log aggregators (Loki, Datadog, etc.).
Common fields on every log record:
Field
Description
`level`
Numeric Pino level (10=trace, 20=debug, 30=info, 40=warn, 50=error, 60=fatal)
`time`
Unix timestamp in milliseconds
`module`
Source module (e.g., `"core"`, `"session"`, `"api-server"`)
`sessionId`
Present on session-scoped records
`msg`
Human-readable message
[PreviousSecurity](/self-hosting/security)[NextUpdating](/self-hosting/updating)
Last updated 20 days ago
Was this helpful?