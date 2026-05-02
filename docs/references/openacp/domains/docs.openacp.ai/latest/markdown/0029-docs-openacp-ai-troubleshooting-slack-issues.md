Slack Issues | OpenACP Docs
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
If you haven't finished initial setup, see the [Slack Setup guide](/platform-setup/slack) first.
###
[](#socket-mode-connection-fails-on-startup)
Socket Mode connection fails on startup
**Symptoms:** OpenACP exits immediately with an error like `Slack adapter requires botToken, appToken, and signingSecret` or the Bolt app fails to connect.
**Cause:** Socket Mode requires three credentials: a **Bot Token** (`xoxb-…`), an **App-Level Token** (`xapp-…`), and a **Signing Secret**. Missing any one of them prevents the adapter from starting.
**Solution:**
1.
In the [Slack API dashboard](https://api.slack.com/apps), open your app.
2.
**Bot Token**: Settings → **OAuth & Permissions** → copy the `xoxb-…` token.
3.
**App-Level Token**: Settings → **Basic Information** → **App-Level Tokens** → generate one with the `connections:write` scope. It starts with `xapp-`.
4.
**Signing Secret**: Settings → **Basic Information** → **App Credentials** → Signing Secret.
5.
Add all three to `\<instance-root\>/config.json` under `channels.slack`.
###
[](#bot-doesnt-respond-to-messages)
Bot doesn't respond to messages
**Symptoms:** You post in the session channel but the agent is silent, with no log output.
**Cause:** The Slack event router only processes messages in channels that have an active OpenACP session. Messages in other channels, DMs, or the notification channel are not routed to an agent.
**Solution:**
1.
Use `/new` to create a new session — this creates a dedicated channel for the conversation.
2.
Ensure Socket Mode is enabled for your app: Settings → **Socket Mode → Enable Socket Mode**.
3.
Check that the `message.channels` event subscription is present under **Event Subscriptions → Subscribe to bot events**.
4.
Verify `security.allowedUserIds` — if non-empty, your Slack user ID must be listed.
###
[](#not_allowed_token_type-error)
"not\_allowed\_token\_type" error
**Symptoms:** Logs show `not\_allowed\_token\_type` from the Slack API, or `auth.test() did not return user\_id`.
**Cause:** A User Token (`xoxp-…`) was provided where a Bot Token (`xoxb-…`) is required, or vice versa. The App-Level Token (`xapp-…`) was placed in the wrong field.
**Solution:**
*
`botToken` must be an `xoxb-…` token from **OAuth & Permissions**.
*
`appToken` must be an `xapp-…` token from **Basic Information → App-Level Tokens**.
*
Do not swap these — they serve different purposes. The bot token authenticates API calls; the app token opens the Socket Mode WebSocket connection.
###
[](#rate-limiting-causes-delayed-or-dropped-messages)
Rate limiting causes delayed or dropped messages
**Symptoms:** Responses are slow to appear, or logs show rate limit warnings from the Slack API.
**Cause:** Slack enforces per-method rate limits (Tier 1–4). Heavy usage — many concurrent sessions posting messages quickly — can exhaust these limits.
**Solution:**
*
OpenACP's `SlackSendQueue` serialises outbound API calls automatically to respect rate limits.
*
If you hit limits consistently, reduce `security.maxConcurrentSessions` in config.
*
Avoid bursting many messages at once; consider using `outputMode: "low"` in your config, or type `/outputmode low` in a session channel to reduce intermediate streaming updates.
###
[](#interactivity-permission-buttons-not-working)
Interactivity (permission buttons) not working
**Symptoms:** The agent posts a permission request with buttons, but clicking them does nothing.
**Cause:** Interactivity requires Socket Mode to be enabled. If the app is in HTTP mode or the app-level token is missing/invalid, button interactions are never delivered.
**Solution:**
1.
Enable Socket Mode: **Settings → Socket Mode → Enable**.
2.
Ensure the `appToken` (`xapp-…`) is valid and has the `connections:write` scope.
3.
Under **Interactivity & Shortcuts**, confirm that Interactivity is **On**.
4.
Restart OpenACP after enabling interactivity.
###
[](#voice-messages-are-not-transcribed)
Voice messages are not transcribed
**Symptoms:** You send a voice memo in Slack but the agent receives no text, or receives the file path instead of a transcription.
**Cause:** Slack voice clips are audio files. OpenACP downloads the file and passes it to the agent as an audio attachment — but this requires the bot to have the `files:read` scope, and the agent must support audio input.
If the download returns an HTML login page instead of binary audio, the `files:read` scope is missing.
**Solution:**
1.
Add `files:read` to your bot's OAuth scopes: **OAuth & Permissions → Bot Token Scopes → Add **`**files:read**`.
2.
Reinstall the app to the workspace (Slack requires reinstallation after scope changes): **Settings → Install App → Reinstall**.
3.
Confirm your agent supports audio input — agents that do not expose audio capability receive the file path as text instead.
###
[](#outputmode-command-does-nothing-or-returns-command-not-found)
`/outputmode` command does nothing or returns "command not found"
**Symptoms:** Typing `/outputmode` shows no autocomplete, or Slack says the command is not found.
**Cause:** The `/outputmode` slash command must be registered in the Slack app's configuration before Slack delivers its payloads to OpenACP.
**Solution:**
1.
In the [Slack API dashboard](https://api.slack.com/apps), open your app.
2.
Go to **Slash Commands** in the left sidebar.
3.
Click **Create New Command** and fill in:
*
**Command**: `/outputmode`
*
**Request URL**: leave blank (Socket Mode delivers the payload via WebSocket)
*
**Short Description**: `Change output verbosity`
*
**Usage Hint**: `[low|medium|high]`
*
Click **Save**.
*
Reinstall the app: **Settings → Install App → Reinstall to Workspace**.
*
Restart OpenACP.
###
[](#channel-creation-fails-or-produces-duplicate-channels)
Channel creation fails or produces duplicate channels
**Symptoms:** Each restart creates a new `#openacp-…` channel, or channel creation fails with a permissions error.
**Cause:** The bot needs `channels:manage` (for public channels) or `groups:write` (for private channels) scope to create channels. Duplicate channels appear when the saved `startupChannelId` in config has been deleted.
**Solution:**
1.
Add the required scope: **OAuth & Permissions → Bot Token Scopes → **`**channels:manage**` (or `groups:write` for private).
2.
Reinstall the app after adding scopes.
3.
If duplicate channels have accumulated, delete the extras in Slack and clear `startupChannelId` from `\<instance-root\>/config.json`. OpenACP will create one clean channel on next startup and save its ID for reuse.
[PreviousDiscord Issues](/troubleshooting/discord-issues)[NextAgent Issues](/troubleshooting/agent-issues)
Last updated 20 days ago
Was this helpful?