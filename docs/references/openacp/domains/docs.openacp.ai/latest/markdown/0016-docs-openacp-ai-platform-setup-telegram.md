Telegram | OpenACP Docs
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
This guide walks you through connecting OpenACP to Telegram. OpenACP uses a Telegram group with Topics enabled — each coding session gets its own topic thread for an organized, isolated workspace.
**> Prerequisites:
**
1.
> A Telegram group (any size)
2.
**> Topics enabled
**> — Group Settings → Edit → Topics
3.
**> Bot is admin with &quot;Manage Topics&quot; permission
**> — Group Settings → Administrators
> If these aren&#x27;t set up when OpenACP first starts, it will send instructions to your group&#x27;s General topic and keep retrying automatically.
##
[](#prerequisites)
Prerequisites
*
A Telegram account
*
OpenACP installed: `npm install -g @openacp/cli`
*
At least one ACP agent installed (e.g., `claude-agent-acp`)
##
[](#step-1-create-a-bot-via-botfather)
Step 1: Create a Bot via BotFather
1.
Open Telegram and search for [@BotFather](https://t.me/BotFather), or click that link.
2.
Send the command `/newbot`.
3.
BotFather will ask for a name — enter a display name (e.g., `My OpenACP Bot`).
4.
BotFather will then ask for a username — enter a unique username ending in `bot` (e.g., `myopenacp\_bot`).
5.
BotFather replies with your **bot token**. It looks like:
Copy
```
`123456789:AAFxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx`
```
6.
Copy and save this token somewhere safe. You will need it in Step 6.
**> Important:
**> Your bot token is a secret. Anyone with this token can control your bot. Never share it publicly or commit it to version control.
##
[](#step-2-create-a-group-with-topics-enabled)
Step 2: Create a Group with Topics Enabled
OpenACP requires a Telegram group with the **Topics** feature enabled. Topics create thread-like channels — one per coding session.
1.
In Telegram, tap the compose icon and select **New Group**.
2.
Add your bot as a member (search for its username).
3.
Give the group a name (e.g., `OpenACP`) and create it.
4.
Open the group → tap the group name at the top → **Edit** (pencil icon).
5.
Scroll down and enable **Topics**.
6.
Save the changes.
##
[](#step-3-add-the-bot-as-admin)
Step 3: Add the Bot as Admin
The bot must be an administrator with the following permissions to manage topics and send messages:
1.
Open the group → tap the group name → **Administrators**.
2.
Tap **Add Administrator**.
3.
Search for your bot by username and select it.
4.
Make sure these permissions are enabled:
*
**Manage Topics** — required to create and rename session topics
*
**Send Messages** — required to send responses
*
**Delete Messages** — recommended for cleanup
*
Tap **Save**.
> OpenACP validates that the bot is an administrator during setup. If it is not, setup will fail with an error and prompt you to fix it.
##
[](#step-4-get-the-chat-id)
Step 4: Get the Chat ID
The Chat ID is the unique numeric identifier for your group. You need it for the config.
**Option A: Use the OpenACP setup wizard (recommended)**
The interactive wizard auto-detects your Chat ID. Run:
When prompted for the Chat ID, send any message in your group. The wizard polls the Telegram API for updates and reports the group it sees:
**Option B: Use @RawDataBot**
Forward any message from your group to [@RawDataBot](https://t.me/raw_data_bot). It replies with the raw update JSON, which includes `"chat": {"id": -1001234567890, ...}`. The Chat ID is the negative number starting with `-100`.
**Option C: Use the Telegram API directly**
Replace `\<YOUR\_TOKEN\>` with your bot token. Send a message in the group first, then open this URL. Look for `"chat": {"id": ...}` in the response.
##
[](#step-5-configure-openacp)
Step 5: Configure OpenACP
Edit `\<workspace\>/.openacp/config.json` (e.g. `\~/openacp-workspace/.openacp/config.json`) and fill in the Telegram section (see the [full configuration reference](/self-hosting/configuration) for all available options):
Field
Description
`enabled`
Set to `true` to activate the Telegram adapter
`botToken`
The token from BotFather (Step 1)
`chatId`
The group's Chat ID — negative number starting with `-100` (Step 4)
`notificationTopicId`
Leave `null` — OpenACP creates this topic on first start
`assistantTopicId`
Leave `null` — OpenACP creates this topic on first start
**> Tip:
**> You can also run
`> openacp
`> (the interactive setup wizard) instead of editing the file manually. The wizard validates your token and auto-detects the Chat ID.
##
[](#step-6-start-openacp-and-test)
Step 6: Start OpenACP and Test
Start OpenACP:
Expected output:
Open your Telegram group. You should see two new topics appear automatically.
To create your first coding session, use the `/new` command in the group's **General** topic or the **Assistant** topic:
OpenACP creates a new topic thread for this session.
##
[](#step-7-system-topics-auto-created-on-first-start)
Step 7: System Topics (Auto-Created on First Start)
On first start, OpenACP automatically creates two system topics in your group:
Topic
Purpose
**Notifications** (`📋 Notifications`)
Receives completion summaries, error alerts, and permission request notifications with deep links back to the relevant session topic
**Assistant** (`🤖 Assistant`)
An always-on AI helper session. Send questions here to get guidance on using OpenACP, creating sessions, or troubleshooting
The topic IDs are saved to your config automatically:
On subsequent restarts, OpenACP reuses these existing topics rather than creating new ones.
##
[](#step-8-session-topics)
Step 8: Session Topics
Each `/new` command creates a dedicated forum topic for that coding session:
*
**Real-time streaming** — agent responses appear as the model generates them, with message edits batched at \~1-second intervals to avoid Telegram rate limits.
*
**Auto-naming** — after the first prompt, the topic is renamed to a short 5-word summary of the task (e.g., `Add login form to app`).
*
**Prompt queue** — send multiple messages while the agent is processing; they are queued and processed in order.
*
**Permission buttons** — when the agent needs approval to run a command or modify a file, inline **Allow / Always Allow / Reject** buttons appear in the topic.
*
**Skill commands** — the agent publishes available skills as inline buttons, pinned at the top of the topic.
*
**Viewer links** — if the tunnel feature is enabled, tool calls include clickable links to an in-browser file or diff viewer.
When the session ends, the topic stays open for reference. Use `/cancel` to cancel a running session.
##
[](#environment-variables)
Environment Variables
You can pass credentials via environment variables instead of editing the config file. This is useful in scripts or CI environments:
Variable
Config path
`OPENACP\_TELEGRAM\_BOT\_TOKEN`
`channels.telegram.botToken`
`OPENACP\_TELEGRAM\_CHAT\_ID`
`channels.telegram.chatId`
Environment variables take precedence over values in `config.json`.
##
[](#troubleshooting)
Troubleshooting
**Bot is not responding**
*
Confirm the bot is added to the group and is an administrator.
*
Verify `enabled: true` in the config.
*
Check `\<instance-root\>/logs/` for error messages.
**"Chat must be a group" error**
*
Make sure you are using a group (not a channel). Channels are not supported.
*
If the group was just created, wait a moment and try again.
**Topics not appearing after first start**
*
If OpenACP cannot create topics, it sends a message to the group's General topic with instructions.
*
Follow the instructions in that message: enable Topics and/or grant the bot "Manage Topics" permission.
*
OpenACP retries automatically every 30 seconds — no need to restart.
**Chat ID is not detected**
*
Make sure you sent a message in the group after adding the bot.
*
Press `m` in the setup wizard to enter the Chat ID manually.
For more detailed troubleshooting, see [Telegram Issues](/troubleshooting/telegram-issues).
[PreviousChoose Your Platform](/platform-setup/platform-setup)[NextDiscord](/platform-setup/discord)
Last updated 20 days ago
Was this helpful?