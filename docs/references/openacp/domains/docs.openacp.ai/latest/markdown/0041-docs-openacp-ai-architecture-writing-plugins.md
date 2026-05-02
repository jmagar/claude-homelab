Writing Plugins | OpenACP Docs
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
This is the **complete API reference** for building OpenACP plugins. It covers every API surface: services, commands, middleware, events, settings, storage, overrides, and publishing.
**> New to plugin development?
**> Start with
[> Getting Started: Your First Plugin
](/extending/getting-started-plugin)> — a hands-on tutorial that walks you through scaffolding, developing, testing, and publishing your first plugin. Come back here when you need the full API details.
**> Plugin SDK
**> : For type exports, base classes, and testing utilities, see the
[> Plugin SDK Reference
](/extending/plugin-sdk-reference)> .
**> Dev Mode
**> : For hot-reload development workflow, see the
[> Dev Mode guide
](/extending/dev-mode)> .
##
[](#plugin-structure)
Plugin Structure
A plugin is a module that exports an `OpenACPPlugin` object. At minimum:
Copy
```
`my-plugin/
src/
index.ts \<- exports OpenACPPlugin
package.json
tsconfig.json`
```
###
[](#minimal-plugin)
Minimal Plugin
Copy
```
`// src/index.ts
import type { OpenACPPlugin, PluginContext } from '@openacp/cli'
export default {
name: '@community/my-plugin',
version: '1.0.0',
description: 'My first OpenACP plugin',
permissions: [],
async setup(ctx: PluginContext) {
ctx.log.info('My plugin loaded!')
},
} satisfies OpenACPPlugin`
```
This plugin does nothing useful, but it's valid. It loads on boot, logs a message, and that's it.
##
[](#declaring-dependencies)
Declaring Dependencies
If your plugin needs services from other plugins, declare them as dependencies:
###
[](#overriding-a-built-in)
Overriding a built-in
To replace a built-in plugin entirely:
When `overrides` is set, the overridden plugin's `setup()` never runs. Your plugin takes its place in the dependency graph.
##
[](#declaring-permissions)
Declaring Permissions
Permissions control what your plugin can do. Only request what you need:
Calling a method without the required permission throws `PluginPermissionError`, which counts against your error budget.
##
[](#using-the-plugincontext-api)
Using the PluginContext API
###
[](#registering-a-service)
Registering a service
Other plugins can then access your service:
###
[](#subscribing-to-events)
Subscribing to events
Event listeners are automatically cleaned up on teardown.
###
[](#emitting-events)
Emitting events
Community plugins must prefix event names with their plugin name:
Built-in plugins can use short names (e.g., `security:blocked`).
###
[](#sending-messages-to-sessions)
Sending messages to sessions
Messages go through the `message:outgoing` middleware chain, so other plugins can modify them before delivery.
##
[](#registering-commands)
Registering Commands
Your command will be available as `/translate` (if no conflict) and `/my-plugin:translate` (qualified name, always available).
Return a `CommandResponse` object -- adapters handle rendering automatically. See [Command System](/architecture/command-system) for all response types.
##
[](#registering-middleware)
Registering Middleware
Middleware lets you intercept and modify the message flow:
###
[](#blocking-a-flow)
Blocking a flow
Return `null` to stop the chain:
###
[](#available-hooks)
Available hooks
See [Core Design \> MiddlewareChain](/architecture/core-design#middlewarechain) for the full list of 18 hook points and their payload types.
##
[](#settings-schema-and-install-flow)
Settings Schema and Install Flow
If your plugin needs configuration, define a settings schema and install hook:
###
[](#installcontext)
InstallContext
The `install()`, `configure()`, and `uninstall()` hooks receive an `InstallContext`:
###
[](#terminalio)
TerminalIO
Wraps `@clack/prompts` for interactive flows:
##
[](#using-plugin-storage)
Using Plugin Storage
For persistent data beyond settings (caches, state, databases):
##
[](#testing-your-plugin)
Testing Your Plugin
Create a test file alongside your plugin:
##
[](#publishing-to-npm)
Publishing to npm
###
[](#package.json)
package.json
###
[](#build-and-publish)
Build and publish
###
[](#users-install-your-plugin)
Users install your plugin
This runs `npm install` into `\~/.openacp/plugins/`, validates the plugin interface, and calls `install()` if the plugin has `essential: true`.
##
[](#checklist)
Checklist
Before publishing:
*
Plugin exports an `OpenACPPlugin` object (default export)
*
`name` follows `@scope/name` convention
*
`version` is valid semver
*
`permissions` only includes what's needed
*
`pluginDependencies` declares all required plugins
*
`settingsSchema` validates all settings (if applicable)
*
`install()` handles both fresh install and legacy migration
*
`migrate()` handles version upgrades
*
`teardown()` cleans up resources (timers, connections)
*
Tests cover setup, commands, and error cases
*
`package.json` has `@openacp/cli` as peer dependency
##
[](#further-reading)
Further Reading
*
[Getting Started: Your First Plugin](/extending/getting-started-plugin) -- scaffold, develop, test, and publish
*
[Plugin SDK Reference](/extending/plugin-sdk-reference) -- types, base classes, and testing utilities
*
[Dev Mode](/extending/dev-mode) -- hot-reload development workflow
*
[Plugin System](/architecture/plugin-system) -- complete plugin infrastructure
*
[Command System](/architecture/command-system) -- command registration and rendering
*
[Built-in Plugins](/architecture/built-in-plugins) -- examples of real plugins
*
[Core Design](/architecture/core-design) -- core modules your plugin interacts with
[PreviousBuilt-in Plugins](/architecture/built-in-plugins)[NextOverview](/extending/extending)
Last updated 28 days ago
Was this helpful?