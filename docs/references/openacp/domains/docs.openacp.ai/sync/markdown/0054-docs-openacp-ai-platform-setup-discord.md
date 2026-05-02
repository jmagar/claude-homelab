Discord | OpenACP Docs
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
This guide walks you through creating a Discord bot and connecting it to OpenACP. Each coding session gets its own thread in a dedicated forum channel, keeping your conversations organized and easy to navigate.
##
[](#prerequisites)
Prerequisites
*
A Discord account with permission to manage a server (or create a new one)
*
OpenACP installed: `npm install -g @openacp/cli`
*
At least one ACP agent installed (e.g., `claude-agent-acp`)
##
[](#step-1-create-a-discord-application)
Step 1: Create a Discord Application
1.
Go to the [Discord Developer Portal](https://discord.com/developers/applications).
2.
Click **New Application** in the top right.
3.
Enter a name for your application (e.g., `OpenACP`).
4.
Click **Create**.
You are now on the application's General Information page. Note the **Application ID** — you will need it when generating the OAuth2 invite URL.
##
[](#step-2-create-a-bot-and-copy-the-token)
Step 2: Create a Bot and Copy the Token
1.
In the left sidebar, click **Bot**.
2.
Click **Reset Token** and confirm the action.
3.
**Copy the token immediately** and save it somewhere safe. Discord only shows it once.
The token looks like:
Copy
```
`MTI3NTxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
```
4.
Under **Privileged Gateway Intents**, enable:
*
**Message Content Intent** — required for OpenACP to read the content of messages sent in threads.
Leave **Server Members Intent** and **Presence Intent** disabled unless your use case requires them.
**> Security note:
**> Your bot token grants full control over the bot. Never share it publicly or commit it to a repository.
##
[](#step-3-generate-an-oauth2-invite-url)
Step 3: Generate an OAuth2 Invite URL
1.
In the left sidebar, go to **OAuth2** → **URL Generator**.
2.
Under **Scopes**, check:
*
`bot`
*
`applications.commands`
*
Under **Bot Permissions**, check the following:
*
**Manage Channels** — create the `openacp-sessions` forum channel and `openacp-notifications` text channel
*
**Send Messages** — send messages in channels
*
**Send Messages in Threads** — respond inside session threads
*
**Create Public Threads** — create a new thread per session
*
**Manage Threads** — archive, unarchive, and rename threads
*
**Manage Messages** — edit and delete bot messages
*
**Embed Links** — send rich embeds
*
**Attach Files** — send files, images, and audio
*
**Read Message History** — read thread history
*
**Use Slash Commands** — register `/new`, `/cancel`, `/status`, etc.
*
**Add Reactions** — add status emoji reactions
*
Copy the **Generated URL** that appears at the bottom of the page.
**Alternatively**, use the permission integer directly. OpenACP requires permission integer `**328565073936**`, which covers all the permissions above. Build the invite URL manually:
Replace `YOUR\_APP\_ID` with the Application ID from Step 1.
##
[](#step-4-invite-the-bot-to-your-server)
Step 4: Invite the Bot to Your Server
1.
Open the generated OAuth2 URL (from Step 3) in your browser.
2.
Select the server you want to add the bot to.
3.
Review the requested permissions.
4.
Click **Authorize**.
5.
Complete the CAPTCHA if prompted.
The bot now appears in your server's member list (shown as offline until OpenACP starts).
##
[](#step-5-get-your-server-guild-id)
Step 5: Get Your Server (Guild) ID
1.
In Discord, go to **User Settings** → **Advanced**.
2.
Enable **Developer Mode**.
3.
Close settings.
4.
Right-click your server name in the left sidebar.
5.
Click **Copy Server ID**.
This is the Guild ID. It is a numeric snowflake ID between 17 and 20 digits, for example:
##
[](#step-6-optional-pre-create-a-forum-channel)
Step 6: (Optional) Pre-Create a Forum Channel
OpenACP automatically creates a forum channel named `openacp-sessions` on first start if one does not exist. If your server has **Community** mode enabled, it creates a Forum Channel (with full forum post support). If Community mode is not enabled, it falls back to a text channel with threads.
If you want to pre-create the channel yourself:
1.
Create a **Forum Channel** in your server and name it `openacp-sessions`.
2.
After starting OpenACP, paste the channel ID into `config.json` under `channels.discord.forumChannelId`.
This step is optional — OpenACP will create and manage the channel automatically.
##
[](#step-7-configure-openacp)
Step 7: Configure OpenACP
Edit `\<workspace\>/.openacp/config.json` (e.g. `\~/openacp-workspace/.openacp/config.json`) and fill in the Discord section (see the [full configuration reference](/self-hosting/configuration) for all available options):
Field
Description
`enabled`
Set to `true` to activate the Discord adapter
`botToken`
The bot token from Step 2
`guildId`
Your server's Guild ID from Step 5
`forumChannelId`
Leave `null` — OpenACP creates `openacp-sessions` automatically on first start
`notificationChannelId`
Leave `null` — OpenACP creates `openacp-notifications` automatically on first start
`assistantThreadId`
Leave `null` — OpenACP creates the Assistant thread automatically on first start
**> Tip:
**> Run
`> openacp
`> (the interactive setup wizard) to configure this interactively. It validates your bot token and prompts for the Guild ID.
##
[](#step-8-start-openacp-and-test)
Step 8: Start OpenACP and Test
Start OpenACP:
Expected output:
Open your Discord server. You should see two new channels created automatically:
*
`**#openacp-sessions**` — forum channel where each session gets its own thread
*
`**#openacp-notifications**` — text channel for completion summaries and alerts
To create your first session, type `/new` in any channel:
##
[](#step-9-slash-commands)
Step 9: Slash Commands
Slash commands are registered automatically when OpenACP starts (guild-scoped, so they appear within seconds).
Command
Description
`/new [agent] [workspace]`
Create a new coding session
`/newchat`
New session with the same agent and workspace as the current one
`/cancel`
Cancel the active session in the current thread
`/status`
Show current session status or system status
`/sessions`
List all active sessions
`/menu`
Open the session control panel
`/handoff`
Get a terminal command to resume the session locally
`/agents`
Browse available agents
`/install \<name\>`
Install an agent
`/outputmode [low|medium|high|reset] [session]`
Set output detail level; use `session` scope to override for the current thread only
`/verbosity`
Deprecated alias for `/outputmode`
`/bypass`
Toggle auto-approval of all permission requests
`/tts [on|off]`
Toggle text-to-speech for the current session
`/settings`
Change configuration in-chat
`/doctor`
Run system diagnostics
`/integrate`
Manage agent integrations
`/restart`
Restart OpenACP
`/update`
Update to the latest version
`/clear`
Reset the assistant session history
`/help`
Show help
##
[](#how-sessions-work)
How Sessions Work
Each `/new` command creates a **forum thread** in `#openacp-sessions`:
*
**Real-time streaming** — agent responses appear as the model generates output, with periodic message edits to minimize Discord API calls.
*
**Tool card embeds** — while the agent is working, tool activity is grouped into a single embed with a colored sidebar (🔵 running, 🟢 done, 🔴 error). An action row appears below with `[🔇 Low] [📊 Medium] [🔍 High] [❌ Cancel]` buttons to switch output detail level or abort the session without any slash commands.
*
**Auto-naming** — after the first prompt, the thread is renamed to a short summary of the task.
*
**File and image support** — attach files, screenshots, or voice messages directly in the thread (up to 25 MB per file).
*
**Permission buttons** — when the agent needs approval to run a command or modify a file, **Allow** and **Reject** buttons appear in the thread.
*
**Skill commands** — available agent skills are shown as clickable buttons.
*
**Session end** — when the agent finishes, a `✅ Done` message appears and a completion notification is posted to `#openacp-notifications` with a deep link back to the thread.
Ended or cancelled sessions are archived and locked rather than permanently deleted, preserving the full conversation history.
##
[](#environment-variables)
Environment Variables
Override config values using environment variables:
Variable
Config path
`OPENACP\_DISCORD\_BOT\_TOKEN`
`channels.discord.botToken`
`OPENACP\_DISCORD\_GUILD\_ID`
`channels.discord.guildId`
##
[](#troubleshooting)
Troubleshooting
**Bot does not respond to slash commands**
*
Confirm you included `applications.commands` in the OAuth2 scopes when generating the invite URL.
*
Guild-scoped commands register within seconds of startup. Try `/help` to verify the bot is online.
*
Re-invite the bot with the correct scopes if slash commands are missing.
**"Guild not found" error on startup**
*
Double-check the `guildId` in your config. It should be the numeric Server ID (17–20 digits), not the server name.
*
Ensure the bot has been invited to that server.
**"Missing Permissions" errors**
*
The bot needs **Manage Channels** to create the sessions and notification channels.
*
Check that the bot's role is above any roles that might be restricting permissions.
*
Check channel-level permission overrides — they can block the bot even if server-level permissions are correct.
**"Message Content Intent" error**
*
Go to the Developer Portal → your application → **Bot** → enable **Message Content Intent** under Privileged Gateway Intents.
**Channels are created as text channels instead of forum channels**
*
This happens when the server does not have Community mode enabled. OpenACP falls back to a text channel with threads. To use Forum Channels, enable Community mode in your server settings.
**Files not sending or receiving**
*
The bot needs **Attach Files** permission.
*
Discord's free tier has a 25 MB file size limit per message. Files larger than this are rejected with a warning.
For more detailed troubleshooting, see [Discord Issues](/troubleshooting/discord-issues).
[PreviousTelegram](/platform-setup/telegram)[NextSlack](/platform-setup/slack)
Last updated 21 days ago
Was this helpful?