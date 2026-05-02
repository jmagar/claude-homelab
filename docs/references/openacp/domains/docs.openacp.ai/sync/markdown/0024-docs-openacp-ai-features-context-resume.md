Context Resume | OpenACP Docs
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
When you start a new coding session, the agent has no memory of what happened in previous sessions. The context resume feature solves this by injecting a structured summary of past conversations — what you asked, what the agent did, which files it touched — directly into the new session's context window.
This lets you continue work naturally. The agent knows the history without you having to re-explain the project, the decisions already made, or the state of in-progress tasks.
##
[](#how-it-works)
How it works
When you resume a session, OpenACP collects conversation history from your previous sessions — what you asked, what the agent did, and which files were changed. This history is formatted as a summary and injected into the new session so the agent has full context.
OpenACP automatically records conversation history for every session. It captures your prompts, the agent's responses, tool calls, file edits, and permission decisions. History is stored locally in `\<instance-root\>/history/`, one file per session.
When multiple past sessions are relevant, history is merged chronologically. OpenACP automatically adjusts the level of detail based on how many sessions are included — recent sessions get full detail, older ones get shorter summaries. If the combined history is too large, the oldest sessions are trimmed first.
###
[](#entire.io-support)
Entire.io support
OpenACP can also read conversation history from [Entire.io](https://entire.io) git checkpoints. This is used as a fallback when local history is not available.
##
[](#technical-details)
Technical details
Under the hood, the `ContextManager` maintains a list of registered context providers. Two are built in:
*
**HistoryProvider** — records conversation history directly within OpenACP via middleware hooks (`agent:beforePrompt`, `agent:afterEvent`, `permission:afterResolve`).
*
**EntireProvider** — reads conversation history from Entire.io git checkpoints.
Results are cached on disk at `\<instance-root\>/cache/entire/` so that repeated requests for the same query do not re-read and re-parse transcript files. Providers are pluggable — plugins can register custom context providers.
##
[](#adaptive-rendering-modes)
Adaptive rendering modes
Conversation history can be long. To avoid consuming the entire context window, OpenACP automatically selects a rendering mode based on how many conversation turns are included:
Mode
Turns
What is included
`full`
up to 10
Full text of all user messages and assistant responses; full diffs and file writes
`balanced`
11 to 25
User messages in full; diffs truncated to 12 lines; file writes truncated to 15 lines
`compact`
more than 25
User messages in full; edits shown as a one-line summary with line counts; writes shown as filename and line count only
If the history is still too large after switching to `compact` mode, the oldest sessions are dropped until it fits.
A note is always appended reminding the agent that the history may be outdated and should not be taken as ground truth for current file contents.
##
[](#resume-command)
/resume command
Send `/resume` in any session topic to attach context from recent sessions to your next prompt. The command accepts the same query types as the provider:
The injected context appears as a collapsible block above your message so you can verify what was included before the agent processes it.
##
[](#token-estimation)
Token estimation
Token counts are estimated as `floor(characters / 4)`, which approximates GPT-style tokenization. This estimate is used both to select the rendering mode and to decide whether to truncate. The estimate is intentionally conservative — actual token counts vary by model and content type.
To see how many tokens a context block would consume before sending, use:
This reports the session count, turn count, rendering mode, and estimated token count without attaching the context.
[PreviousTunnel & Port Forwarding](/features/tunnel)[NextOutput Modes](/features/output-modes)
Last updated 20 days ago
Was this helpful?