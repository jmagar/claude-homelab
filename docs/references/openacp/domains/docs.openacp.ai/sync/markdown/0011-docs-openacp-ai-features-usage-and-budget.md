Usage & Budget | OpenACP Docs
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
[](#token-tracking)
Token tracking
Every time an agent completes a prompt, OpenACP records a usage entry containing the session ID, timestamp, number of tokens consumed, and cost in USD (if the agent reports it). These records are stored in `\<instance-root\>/usage.json`.
You can query usage summaries for different time periods:
Period
Covers
`today`
From midnight local time to now
`week`
Rolling 7-day window
`month`
Current calendar month (1st of month to now)
`all`
All records within the retention window
Each summary includes total tokens, total cost, number of distinct sessions, and the record count.
##
[](#monthly-budget)
Monthly budget
Set a spending limit in the instance `config.json`:
Copy
```
`{
"usage": {
"monthlyBudget": 20.00,
"warningThreshold": 0.8
}
}`
```
Field
Default
Description
`monthlyBudget`
none
Monthly spending limit in USD. Leave unset to disable budget checking.
`warningThreshold`
`0.8`
Fraction of the budget at which to send a warning (0.8 = 80%)
##
[](#warning-and-exceeded-notifications)
Warning and exceeded notifications
When a session completes and usage crosses a threshold, OpenACP sends a notification to your connected platform (Telegram or Discord):
*
**Warning** — sent once when monthly cost reaches `warningThreshold \* monthlyBudget`. Shows a progress bar and current percentage.
*
**Exceeded** — sent once when monthly cost reaches or exceeds `monthlyBudget`. Includes a note that sessions are **not blocked** — this is a soft limit only.
Notifications are de-duplicated: the same status level is not sent again within the same calendar month. At the start of a new month the counter resets automatically.
Example notification:
##
[](#retention)
Retention
Usage records older than the configured retention period are deleted automatically. The default is **90 days**.
To configure retention:
##
[](#technical-details)
Technical details
Usage data is stored in `\<instance-root\>/usage.json`. Writes are batched to avoid excessive disk I/O. The file is saved on process exit to prevent data loss. If the file is corrupt on startup, OpenACP saves a backup and starts fresh.
[PreviousOutput Modes](/features/output-modes)[NextSession Persistence](/features/session-persistence)
Last updated 20 days ago
Was this helpful?