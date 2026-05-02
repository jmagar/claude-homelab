Agent Switch | OpenACP Docs
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
Agent switch lets you change which AI agent is handling your session mid-conversation, without losing context. You start a conversation with one agent, then switch to another — the new agent receives the full conversation history and picks up where the previous one left off.
The thread or topic in your messaging platform stays the same. Only the agent handling the conversation changes.
##
[](#use-cases)
Use cases
*
You are using Claude Code for a task and want to compare how Gemini CLI approaches the same problem.
*
Your current agent is slow or hitting rate limits and you want to temporarily switch to another.
*
You want to use a specialized agent for a sub-task, then return to your primary agent.
##
[](#usage)
Usage
Run `/switch` inside an existing session topic or thread:
Copy
```
`/switch # show a menu of available agents
/switch claude # switch directly to the claude agent
/switch gemini # switch directly to the gemini agent`
```
When you run `/switch \<agent\>`, OpenACP:
1.
Collects the conversation history from the current session.
2.
Starts a new session with the target agent (or resumes an existing one — see below).
3.
Injects the conversation history into the new agent as context.
4.
Routes all subsequent messages to the new agent.
##
[](#session-resume)
Session resume
If you switch back to an agent you used earlier in the same thread, and no new user prompts were sent since you last left that agent, OpenACP will attempt to resume the old session rather than creating a new one. This avoids redundant context injection and preserves any in-progress agent state.
Resume only applies when the agent supports it via ACP. If the agent does not support resume, a new session is always created with history injected.
##
[](#history-labels)
History labels
When conversation history is injected into the new agent, OpenACP can prefix each assistant message with the name of the agent that produced it. This helps the incoming agent distinguish between its own prior responses and those from a different model.
Labels are enabled by default. To toggle:
This setting is also controlled by the `agentSwitch.labelHistory` config option:
With labels enabled, injected history looks like:
With labels disabled, the history is injected as-is without any prefixes.
##
[](#configuration)
Configuration
Field
Type
Default
Description
`agentSwitch.labelHistory`
boolean
`true`
Prefix assistant messages in injected history with the agent name
Configure via `\<instance-root\>/config.json` or the `/settings` command.
##
[](#platform-support)
Platform support
Platform
Supported
Telegram
Yes
Discord
Yes
Slack
Yes
##
[](#notes)
Notes
*
Only agents that are installed and ready can be switched to. Use `/agents` to check what is installed.
*
The original session thread or topic is preserved across all switches.
*
Switching does not cancel an in-progress prompt. If the current agent is actively running, cancel it first with `/cancel` before switching.
*
When a switch is in progress, OpenACP emits a "Switching from A to B..." system message and `session:agentSwitch` events (`starting` / `succeeded` / `failed`) so UIs can show loading and error states while the switch is running.
[PreviousSession Handoff](/features/session-handoff)[NextWorkspaces](/features/multi-instance)
Last updated 20 days ago
Was this helpful?