App Connectivity | OpenACP Docs
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
[](#what-it-is)
What it is
App connectivity lets desktop and web clients connect to a running OpenACP instance — both on the same machine and remotely (via tunnel). This enables GUI apps, web dashboards, and mobile clients to interact with your OpenACP server.
##
[](#connecting-from-the-same-machine)
Connecting from the same machine
Apps running on the same machine can discover and connect to OpenACP automatically. No setup is needed — the app reads credentials from a local file that only your user account can access.
##
[](#connecting-remotely-phone-another-computer)
Connecting remotely (phone, another computer)
For remote connections, run:
Copy
```
`openacp remote`
```
This displays:
*
**Local URL** — for same-machine access
*
**Tunnel URL** — public HTTPS URL via your configured tunnel provider
*
**QR code** — scan from your phone to connect instantly
Each link contains a **one-time access code** that expires after 30 minutes. This means:
*
The link only works once — sharing it twice does not work
*
No long-lived secrets appear in browser history or chat logs
*
The code is exchanged for a secure token on first use
If `tunnel.enabled` is `true` in your config, the tunnel starts automatically and `openacp remote` uses the existing tunnel URL.
##
[](#connection-methods)
Connection methods
Method
Best for
How it works
Local auto-discovery
Desktop apps on the same machine
App reads credentials from a local file
`openacp remote` link
Sharing with your phone or a teammate
One-time code, exchanged for a secure token
QR code
Quick mobile app setup
Same as remote link, but you scan instead of copy-paste
##
[](#technical-details)
Technical details
*
Local discovery uses the instance registry at `\~/.openacp/instances.json`. The API port is read from `\<instance-root\>/api.port` and authentication uses `\<instance-root\>/api-secret` directly.
*
Remote access codes are generated via `POST /api/v1/auth/codes` and exchanged for JWT tokens via `POST /api/v1/auth/exchange`. JWTs can be refreshed within a 7-day window.
*
See [Security](/self-hosting/security) for details on roles, scopes, and token management.
[PreviousWorkspaces](/features/multi-instance)[NextDoctor Diagnostics](/features/doctor)
Last updated 28 days ago
Was this helpful?