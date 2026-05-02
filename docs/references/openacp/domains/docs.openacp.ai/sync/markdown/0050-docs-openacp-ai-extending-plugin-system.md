Plugin System | OpenACP Docs
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
**> Note:
**> This page provides a quick overview of plugin management from a user&#x27;s perspective. For the full technical deep dive into the plugin infrastructure, see
[> Architecture &gt; Plugin System
](/architecture/plugin-system)> .
##
[](#what-are-plugins)
What Are Plugins?
Plugins are modules that extend OpenACP with new capabilities. Everything beyond the core kernel is a plugin: messaging adapters (Telegram, Discord, Slack), security, speech, tunnels, usage tracking, and more.
Plugins can:
*
Register **services** that other plugins consume
*
Register **chat commands** available on all platforms
*
Register **middleware** to intercept and modify message flows
*
Subscribe to **events** for cross-plugin communication
*
Use **storage** for persistent data
##
[](#installing-a-plugin)
Installing a Plugin
Copy
```
`openacp plugin install @community/my-plugin`
```
If the plugin has `essential: true`, its interactive `install()` hook runs immediately. Otherwise, it's registered and available on next restart.
##
[](#listing-plugins)
Listing Plugins
Shows all installed plugins with their version, source (builtin/npm), and enabled state.
##
[](#configuring-a-plugin)
Configuring a Plugin
Runs the plugin's interactive `configure()` hook.
##
[](#disabling-enabling)
Disabling / Enabling
Built-in plugins cannot be uninstalled, but they can be disabled.
##
[](#uninstalling)
Uninstalling
##
[](#plugin-interface-quick-reference)
Plugin Interface (Quick Reference)
##
[](#further-reading)
Further Reading
*
[Architecture \> Plugin System](/architecture/plugin-system) -- complete plugin infrastructure deep dive
*
[Architecture \> Writing Plugins](/architecture/writing-plugins) -- step-by-step guide for plugin authors
*
[Architecture \> Built-in Plugins](/architecture/built-in-plugins) -- reference for all 11 built-in plugins
*
[Architecture \> Command System](/architecture/command-system) -- how chat commands work
*
[Building Adapters](/extending/building-adapters) -- building adapter plugins specifically
[PreviousGetting Started: Your First Plugin](/extending/getting-started-plugin)[NextPlugin SDK Reference](/extending/plugin-sdk-reference)
Last updated 28 days ago
Was this helpful?