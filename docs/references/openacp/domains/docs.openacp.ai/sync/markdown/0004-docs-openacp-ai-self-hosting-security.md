Security | OpenACP Docs
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
[](#user-allowlist)
User Allowlist
By default, any user who can send messages to your bot can create sessions. To restrict access to a specific set of users, populate `security.allowedUserIds` in your config:
Copy
```
`"security": {
"allowedUserIds": ["123456789", "987654321"]
}`
```
Values are platform user IDs as strings. For Telegram, this is the numeric user ID. For Discord, it is the user snowflake.
When the list is non-empty, `SecurityGuard.checkAccess()` rejects any incoming message whose `userId` is not in the list. The user receives no response (the message is silently dropped). An empty list means all users are allowed — this is the default and is appropriate when your bot is in a private group that only you can access.
To find your user ID:
*
**Telegram**: Message `@userinfobot` or `@getidsbot`.
*
**Discord**: Enable Developer Mode in Settings, then right-click your username and select "Copy User ID".
##
[](#concurrent-session-limits)
Concurrent Session Limits
Copy
```
`"security": {
"maxConcurrentSessions": 20
}`
```
This is a hard cap on the number of sessions with status `active` or `initializing` across all channels at any given moment. When the limit is reached, new incoming messages are rejected with a "Session limit reached" response until an existing session completes.
The default of 20 is generous for personal use. Reduce it if you are on a machine with limited resources or want to prevent accidental runaway usage.
##
[](#session-timeout)
Session Timeout
Sessions that have been idle (no new prompt sent) for longer than this value are eligible for automatic cleanup. The default is 60 minutes.
##
[](#api-authentication)
API Authentication
The REST API uses a two-tier authentication system:
###
[](#secret-token-master-key)
Secret token (master key)
The API secret is stored in `\<instance-root\>/api-secret` (e.g. `\~/openacp-workspace/.openacp/api-secret`). This file is created automatically on first start with `0600` permissions. The token is a 64-character hex string generated with `crypto.randomBytes(32)`.
The secret token provides full administrative access. Use it for:
*
CLI-to-daemon communication (handled automatically).
*
Issuing JWT access tokens for apps and integrations.
At startup, if the file permissions are more permissive than `0600`, a warning is logged:
###
[](#jwt-access-tokens)
JWT access tokens
For app clients and remote access, OpenACP issues scoped JWT tokens. Unlike the secret token, JWTs are:
*
**Scoped** — assigned a role (`admin`, `operator`, or `viewer`) with predefined permissions.
*
**Revokable** — can be revoked individually via the API.
*
**Time-limited** — expire after a configurable period, with a 7-day refresh window.
*
**Stateful** — tracked in `\<instance-root\>/tokens.json` with last-used timestamps.
####
[](#roles)
Roles
Role
Capabilities
`admin`
Full access: manage sessions, config, agents, tokens
`operator`
Create/manage sessions, send prompts, view config
`viewer`
Read-only: view sessions, status, and events
####
[](#issuing-tokens)
Issuing tokens
Tokens are issued by authenticating with the secret token:
Or use `openacp remote` to generate a one-time access code that can be exchanged for a JWT (see [App Connectivity](/features/app-connectivity)).
####
[](#revoking-tokens)
Revoking tokens
###
[](#network-security)
Network security
Do not expose the API port externally. The default `host: "127.0.0.1"` binding ensures the API is only reachable from localhost. If you change `api.host` to `0.0.0.0`, the server logs a warning — ensure your firewall blocks external access to port `21420`.
For remote access, use a tunnel instead of exposing the port directly. The tunnel provides HTTPS encryption and access control via one-time codes.
##
[](#bypass-permissions)
Bypass Permissions
Some agent operations (file writes, command execution) require explicit user approval via permission request buttons in the chat. This is the default behavior. For details on how permissions work from a user's perspective, see [Permissions](/using-openacp/permissions).
If an agent is configured to run without permission prompts (agent-side configuration), ensure your allowlist is restricted to trusted users only, since any allowlisted user will have the ability to trigger unrestricted agent actions.
##
[](#best-practices)
Best Practices
1.
**Always set **`**allowedUserIds**` unless your bot is already in a fully private, access-controlled group. Even a private Telegram group can have its invite link shared accidentally.
2.
**Keep **`**api-secret**`** at **`**0600**`. The CLI warns you if it is not. Run `chmod 600 \<instance-root\>/api-secret` if needed.
3.
**Do not change **`**api.host**`** to **`**0.0.0.0**` unless you have a specific need and have locked down port `21420` with firewall rules. Use tunnels for remote access instead.
4.
**Review **`**maxConcurrentSessions**` if you share the bot with multiple users. A session per user is reasonable; 20 concurrent ACP agent subprocesses can be resource-intensive.
5.
**Rotate the API secret** by deleting `\<instance-root\>/api-secret` and restarting the daemon. A new token is generated automatically. All existing JWT tokens issued from the old secret become invalid.
6.
**Use daemon mode with autostart** for persistent deployments so the server does not silently go offline after a reboot.
7.
**Revoke unused JWT tokens** periodically. Use `GET /api/v1/auth/tokens` to list active tokens and their last-used timestamps. Revoke any you no longer need.
[PreviousDaemon Mode](/self-hosting/daemon-mode)[NextLogging](/self-hosting/logging)
Last updated 20 days ago
Was this helpful?