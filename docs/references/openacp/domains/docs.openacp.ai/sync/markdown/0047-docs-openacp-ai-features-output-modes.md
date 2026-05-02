Output Modes | OpenACP Docs
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
[](#what-are-output-modes)
What are output modes?
When your AI agent works on a task, it does many things behind the scenes: reading files, editing code, running commands, thinking through problems. Output modes let you choose **how much of that activity you want to see** in your chat.
Think of it like a camera zoom:
*
**Zoomed out** (`low`) — you see the big picture only. The agent is working, and you will see the final result.
*
**Normal view** (`medium`) — you see what the agent is doing at a glance: which files it is reading, what commands it is running, and short summaries of the results.
*
**Zoomed in** (`high`) — you see everything: the agent's reasoning, full command output, complete file diffs, and detailed progress.
##
[](#the-three-modes)
The three modes
###
[](#low-just-tell-me-when-it-is-done)
Low — "Just tell me when it is done"
Best for: non-technical users, managers, or when you are on mobile and do not want chat noise.
What you see:
*
A compact row of small icons showing the types of tools the agent is using (file, terminal, search, etc.)
*
The agent's final text response
What you do not see:
*
File names and contents
*
Command output
*
The agent's thinking process
###
[](#medium-show-me-the-highlights-default)
Medium — "Show me the highlights" (default)
Best for: most users, day-to-day coding.
What you see:
*
Tool names and short descriptions ("Editing `src/app.ts`", "Running `npm test`")
*
File names involved in each operation
*
Short summaries of command output
*
The agent's final text response
What you do not see:
*
Full command output (available via viewer links when output is large)
*
The agent's internal reasoning
###
[](#high-show-me-everything)
High — "Show me everything"
Best for: developers debugging issues, reviewing agent work in detail, or when you want to understand exactly what the agent is doing.
What you see:
*
Everything from medium mode, plus:
*
Full command output inline
*
The agent's thinking/reasoning process
*
Complete code diffs
*
Detailed plan steps
*
Links to the viewer for very large output
##
[](#changing-the-output-mode)
Changing the output mode
###
[](#quick-change-in-chat)
Quick change in chat
Type this in any chat where OpenACP is active:
This changes the default for all sessions on that platform (Telegram, Discord, or Slack).
To change it for **just the current session** (without affecting other sessions):
To go back to the default:
###
[](#on-discord)
On Discord
While the agent is working, buttons appear below the activity card: **Low**, **Medium**, **High**. Tap one to switch instantly — no command needed.
###
[](#on-slack)
On Slack
Type `/outputmode` to open a settings panel where you can pick a mode with radio buttons and choose whether the change applies to just this session or all sessions.
##
[](#how-defaults-work)
How defaults work
Output mode follows a simple priority rule — the most specific setting wins:
1.
**This session** — if you set `/outputmode session high`, this session shows full detail.
2.
**This platform** — if you set `/outputmode low` in Telegram, all Telegram sessions default to low (unless a session has its own override).
3.
**Global default** — the fallback when nothing else is set. Default is `medium`.
**Example**: You set Telegram to `low` because you check it on your phone. Discord stays at `medium`. But for one tricky debugging session in Telegram, you set `/outputmode session high` to see everything. That session shows full detail while all other Telegram sessions stay quiet.
##
[](#which-mode-should-i-use)
Which mode should I use?
Situation
Recommended mode
Checking progress on your phone
`low`
Normal coding sessions
`medium`
Debugging why something failed
`high`
Sharing your screen with a non-technical audience
`low`
Reviewing what the agent changed before merging
`high`
Running many sessions simultaneously
`low` or `medium`
[PreviousContext Resume](/features/context-resume)[NextUsage & Budget](/features/usage-and-budget)
Last updated 28 days ago
Was this helpful?