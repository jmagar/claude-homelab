Permissions | OpenACP Docs
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
AI agents sometimes need to perform actions that could have side effects — running shell commands, writing files, making network requests, or modifying system state. OpenACP gates these actions with explicit permission requests so you stay in control.
##
[](#why-permissions-exist)
Why permissions exist
Agents operating autonomously can take actions with real consequences: deleting files, pushing code, installing packages, or calling external APIs. Permissions give you a checkpoint before anything consequential happens. You decide whether to allow or deny each action before the agent proceeds.
##
[](#how-permission-requests-work)
How permission requests work
When an agent needs to perform a gated action, it sends a permission request to OpenACP. OpenACP forwards this to your chat as an inline keyboard message:
1.
A description of the action the agent wants to take appears in the session topic
2.
Buttons show the available options — typically "Allow" and "Deny", but some agents offer additional choices
3.
Tap a button to respond
4.
The agent receives your decision and continues (or stops)
The agent is paused while waiting for your response. No further processing happens until the permission is resolved.
##
[](#timeout)
Timeout
If you do not respond to a permission request within **10 minutes**, it is automatically denied. The agent receives a rejection and the action does not proceed. You can then send a new message to continue working.
This timeout exists to prevent sessions from blocking indefinitely when you are not present.
##
[](#bypass-permissions)
Bypass permissions
If you trust the agent completely for a session and do not want to approve each action individually, you can enable bypass permissions:
**Telegram:**
**Via the session control keyboard:** Tap the "Enable Bypass Permissions" button that appears in the session setup message.
When bypass permissions is on, all permission requests are auto-approved immediately without showing buttons. The session topic shows a warning.
Bypass permissions is **per-session** — it does not affect other sessions and resets when the session ends.
Use this only when you have reviewed the agent's plan and are confident in what it will do. Common use case: running a long automated task where interruptions for permission approval would be impractical.
##
[](#reviewing-what-was-approved)
Reviewing what was approved
Permission approvals are logged. Use `/status` to see the current session state, or check the session topic history to review what was approved during a session.
For server-wide access controls (user allowlists, session limits), see [Security](/self-hosting/security).
##
[](#disabling-bypass-permissions)
Disabling bypass permissions
Run `/disable\_bypass` (Telegram) or `/bypass` (Discord) inside the session topic, or tap the "Disable Bypass Permissions" button in the session control keyboard.
Normal permission prompts resume immediately.
[PreviousAgents](/using-openacp/agents)[NextVoice & Speech](/using-openacp/voice-and-speech)
Last updated 28 days ago
Was this helpful?