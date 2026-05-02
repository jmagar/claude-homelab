Sessions | OpenACP Docs
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
A session is an isolated conversation between you and an AI agent. Each session has its own context window, working directory, and state. On Telegram, sessions get their own forum topic. On Discord, sessions get their own thread.
##
[](#creating-a-session)
Creating a session
Use `/new` to start a session:
Copy
```
`/new # interactive — choose agent and workspace
/new claude \~/code/my-project # create directly`
```
If you have multiple agents installed, an inline keyboard lets you pick one. You then choose or type a workspace directory — the folder the agent will read, write, and run code in.
##
[](#session-lifecycle)
Session lifecycle
A session goes through several stages during its life:
1.
**Starting up** — The session is being created and the AI agent is warming up. This usually takes a few seconds.
2.
**Active** — The session is ready. You can send messages and the agent will respond. This is where you spend most of your time.
3.
**Done** — The agent finished its work. The session topic stays open for reference.
Sometimes things go differently:
*
**Error** — Something went wrong, but you can usually recover by sending another message. OpenACP will try to reconnect the agent automatically.
*
**Cancelled** — You stopped the session with `/cancel`. The session topic stays open and you can start a new one.
Use `/status` inside a session topic to see the current state.
##
[](#auto-naming)
Auto-naming
After you send your first message, OpenACP silently asks the agent to generate a 5-word title. The session topic or thread is renamed automatically. You never see this internal prompt — it runs in the background and does not affect your conversation.
If naming fails, the session falls back to `Session \<id\>`.
##
[](#concurrent-sessions)
Concurrent sessions
You can run multiple sessions at the same time. The default limit is 20 concurrent active sessions. This is configurable via `maxConcurrentSessions` in your config file.
If the limit is reached, `/new` returns an error message. Cancel or finish an existing session to free a slot.
##
[](#session-timeout)
Session timeout
Sessions have an inactivity timeout (default: 60 minutes). If no prompt is sent within the timeout period, the session is automatically cancelled. The timeout is configurable.
##
[](#resuming-sessions)
Resuming sessions
Sessions that are `finished` or have been idle since a restart can often be resumed by simply sending a message in the existing topic or thread. OpenACP will reconnect to the agent process if possible.
Sessions that went offline (e.g., after a server restart) are automatically resumed when you send a message to their topic. This happens transparently — you do not need to manually restart the session.
For richer resume with full conversation history, use `/resume` (Telegram only). This loads context from Entire checkpoints or OpenACP's built-in history recorder — previous sessions' work is injected into the new session's context window. See the `/resume` section in [Chat Commands](/using-openacp/chat-commands) for query formats.
##
[](#session-settings)
Session settings
Some agents let you change settings mid-conversation — like switching between different modes or models:
Available options depend on the agent you are using. When an agent updates its available options, the session reflects the changes automatically.
##
[](#cancelling-a-prompt)
Cancelling a prompt
`/cancel` inside a session topic aborts the running prompt and clears the queue. The session stays in `active` state — you can send another message immediately.
This does not end the session. If you want to permanently stop a session and remove its topic, use `/archive`.
##
[](#starting-a-new-chat-in-the-same-session)
Starting a new chat in the same session
`/newchat` creates a fresh conversation window with the same agent and workspace, without going through the full setup flow. Run it inside an existing session topic. A new topic is created and a link is posted in the original topic.
##
[](#viewing-all-sessions)
Viewing all sessions
Use `/sessions` to list every session with its status emoji:
*
Green circle — active
*
Yellow circle — initializing
*
Check mark — finished
*
Red X — error
*
Stop sign — cancelled
On Telegram, cleanup buttons let you bulk-remove finished, errored, or all sessions from the list and their topics from the group.
[PreviousChat Commands](/using-openacp/chat-commands)[NextAgents](/using-openacp/agents)
Last updated 28 days ago
Was this helpful?