Discord Issues | OpenACP Docs
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
Run `openacp doctor` first — it validates your bot token and guild access automatically.
If you haven't finished initial setup, see the [Discord Setup guide](/platform-setup/discord) first.
###
[](#slash-commands-dont-appear-in-discord)
Slash commands don't appear in Discord
**Symptoms:** You type `/` in a Discord channel but no OpenACP commands are listed.
**Cause:** Slash commands are registered per-guild on startup. Either the bot hasn't started successfully, it hasn't been invited to the server with the `applications.commands` scope, or Discord's cache hasn't updated yet.
**Solution:**
1.
Invite the bot using a URL that includes both `bot` and `applications.commands` scopes. Generate this URL in the Discord Developer Portal under **OAuth2 → URL Generator**.
2.
Restart OpenACP — commands are registered on every startup via the Discord REST API.
3.
Discord can take a few minutes to propagate newly registered slash commands to clients. Wait a moment and try again.
###
[](#missing-intents-error-in-logs)
"Missing Intents" error in logs
**Symptoms:** Logs show an error like `Used disallowed intents` or `Missing Intents`, and the bot goes offline.
**Cause:** The Discord bot requires `Guilds`, `GuildMessages`, and `MessageContent` intents. `MessageContent` is a privileged intent that must be explicitly enabled in the Developer Portal.
**Solution:**
1.
Go to the [Discord Developer Portal](https://discord.com/developers/applications) → your application → **Bot**.
2.
Under **Privileged Gateway Intents**, enable **Message Content Intent**.
3.
Save changes and restart OpenACP.
###
[](#thread-creation-fails)
Thread creation fails
**Symptoms:** A new session starts but no thread appears in Discord, or logs show `Failed to create thread`.
**Cause:** The bot does not have permission to create threads in the forum channel, or the forum channel ID stored in config is stale (channel was deleted and recreated).
**Solution:**
1.
Ensure the bot has **Manage Threads** and **Send Messages in Threads** permissions in the forum channel.
2.
Delete the `forumChannelId` value from `\<instance-root\>/config.json` so OpenACP recreates the forum channel on next startup.
3.
If using a pre-existing forum channel, make sure it is a **Forum** type channel, not a regular text channel.
###
[](#bot-shows-as-offline)
Bot shows as offline
**Symptoms:** The bot's status dot in Discord is grey (offline) even though OpenACP is running.
**Cause:** The bot token is invalid or has been regenerated in the Developer Portal, or the bot failed to connect to the Discord Gateway.
**Solution:**
1.
Run `openacp doctor` — it calls `GET /users/@me` with your token and reports `401 Unauthorized` if the token is invalid.
2.
If the token has been regenerated, update it in `\<instance-root\>/config.json` (or the `DISCORD\_BOT\_TOKEN` environment variable) and restart.
3.
Check for `[DiscordAdapter] Initialization failed` in the logs for the specific error.
###
[](#unknown-interaction-errors)
"Unknown interaction" errors
**Symptoms:** Clicking permission buttons or slash commands produces a Discord "This interaction failed" message.
**Cause:** Discord requires interactions to be acknowledged within 3 seconds. If OpenACP is under heavy load or paused (e.g., waiting for agent startup), the interaction token expires.
**Solution:**
*
This is typically transient. Retry the action once OpenACP is idle.
*
If it happens consistently, check `[DiscordAdapter] interactionCreate handler error` in logs for the underlying cause.
*
Ensure the server running OpenACP has low latency to Discord's API (ideally under 1 second round-trip).
###
[](#messages-are-not-received-by-the-agent)
Messages are not received by the agent
**Symptoms:** You send a message in a thread but the agent doesn't respond and no log entries appear.
**Cause:** The `MessageContent` privileged intent is not enabled (Discord sends the message event but with an empty content field), or the message was sent outside an active session thread.
**Solution:**
1.
Enable **Message Content Intent** in the Discord Developer Portal (see "Missing Intents" above).
2.
Confirm you are writing in a thread that belongs to an active OpenACP session — messages in regular channels are ignored; only thread messages are routed to the agent.
3.
Check `security.allowedUserIds` — if populated, your Discord user ID must be listed.
###
[](#forum-channel-not-found-on-startup)
Forum channel not found on startup
**Symptoms:** OpenACP fails to start with `Guild not found` or creates duplicate forum channels on each restart.
**Cause:** The `guildId` is wrong, or the bot is not a member of the guild. Alternatively, the saved `forumChannelId` points to a deleted channel.
**Solution:**
1.
Run `openacp doctor` — it calls `GET /guilds/{guildId}` and returns a specific error (403 if the bot isn't in the server, 404 if the guild ID is wrong).
2.
To invite the bot: Developer Portal → **OAuth2 → URL Generator** → scopes: `bot`, `applications.commands` → permissions: `Manage Channels`, `Manage Threads`, `Send Messages`, `Send Messages in Threads`, `Read Message History`.
3.
Clear stale channel IDs from config and let OpenACP recreate them.
[PreviousTelegram Issues](/troubleshooting/telegram-issues)[NextSlack Issues](/troubleshooting/slack-issues)
Last updated 20 days ago
Was this helpful?