Getting Started: Your First Plugin | OpenACP Docs
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
This is a **hands-on tutorial** that walks you through creating, developing, testing, and publishing an OpenACP plugin from scratch. No prior knowledge of OpenACP internals is required.
**> Looking for the full API reference?
**> See
[> Writing Plugins — Full API Reference
](/architecture/writing-plugins)> for every API surface including services, middleware, events, settings, storage, and overrides.
##
[](#prerequisites)
Prerequisites
*
**Node.js** 18+ installed
*
**npm** or **pnpm** installed
*
**OpenACP** installed globally (`npm install -g @openacp/cli`)
*
A working OpenACP setup (run `openacp onboard` if you haven't yet)
##
[](#step-1-scaffold-a-new-plugin)
Step 1: Scaffold a New Plugin
Run the scaffold command:
Copy
```
`openacp plugin create`
```
You will be prompted for:
Copy
```
`◆ Create a new OpenACP plugin
│
◇ Plugin name (e.g., @myorg/adapter-matrix)
│ @myorg/hello-world
│
◇ Description
│ A greeting plugin for OpenACP
│
◇ Author
│ Your Name \<[[emailprotected]](/cdn-cgi/l/email-protection)\>
│
◇ License
│ MIT
│
◆ Plugin scaffolded!
│
│ Next steps
│
│ cd hello-world
│ npm install
│ npm run build
│ npm test
│
│ # Start development with hot-reload:
│ openacp dev .
│
└ Plugin @myorg/hello-world created in ./hello-world`
```
The scaffold creates a directory named after your plugin (without the scope prefix):
##
[](#step-2-explore-the-template)
Step 2: Explore the Template
The scaffold generates two documentation files to help you (and your tools) work with the plugin:
*
**CLAUDE.md** — A comprehensive technical reference for AI coding agents. Contains the full plugin API, all 19 middleware hooks, permissions, testing utilities, and code patterns. An agent with zero prior context can read this file and write a complete plugin.
*
**PLUGIN\_GUIDE.md** — A shorter, practical guide for human developers. Covers the development workflow, code examples for common tasks (commands, services, middleware, settings), testing, and publishing.
###
[](#package.json)
package.json
Key fields in the generated `package.json`:
The `engines.openacp` field declares the minimum OpenACP CLI version required by your plugin. When users install your plugin, OpenACP checks this field and warns if their CLI version is too old. The `peerDependencies` on `@openacp/cli` serves the same purpose for npm's dependency resolver.
The `@openacp/plugin-sdk` package provides all types, base classes, and testing utilities you need.
###
[](#src-index.ts)
src/index.ts
The generated entry point contains every lifecycle hook with inline documentation:
**Lifecycle hooks summary:**
Hook
When it runs
Purpose
`setup(ctx)`
Server startup (dependency order)
Register services, commands, middleware, event listeners
`teardown()`
Server shutdown (reverse order)
Clean up timers, connections, resources
`install(ctx)`
`openacp plugin add`
Interactive first-time configuration
`configure(ctx)`
`openacp plugin configure`
Re-configure settings
`migrate(ctx, old, ver)`
Boot, when version changed
Migrate settings between versions
`uninstall(ctx, opts)`
`openacp plugin remove`
Clean up external resources
##
[](#step-3-development-workflow)
Step 3: Development Workflow
Install dependencies and build:
###
[](#hot-reload-development)
Hot-reload development
Start OpenACP in dev mode, pointing to your plugin directory:
This will:
1.
Compile your TypeScript
2.
Start `tsc --watch` in the background
3.
Boot OpenACP with your plugin loaded
4.
Reload your plugin automatically when files change
See [Dev Mode](/extending/dev-mode) for the full guide.
###
[](#run-tests)
Run tests
Tests use Vitest and the `@openacp/plugin-sdk/testing` utilities.
##
[](#step-4-implement-your-plugin)
Step 4: Implement Your Plugin
Let's turn the template into a greeting plugin that responds to a `/hello` command and logs session events.
Replace the contents of `src/index.ts`:
Build and test:
Now in your messaging platform, type `/hello` or `/hello Alice` to see the plugin respond.
##
[](#step-5-test-your-plugin)
Step 5: Test Your Plugin
The scaffold includes a basic test. Let's expand it using the SDK testing utilities.
Replace `src/\_\_tests\_\_/index.test.ts`:
Run:
See [Plugin SDK Reference](/extending/plugin-sdk-reference) for the full testing API including `createTestContext`, `createTestInstallContext`, and `mockServices`.
##
[](#step-6-configure-and-install)
Step 6: Configure and Install
###
[](#install-your-plugin-locally)
Install your plugin locally
For testing with a real OpenACP instance (not dev mode):
###
[](#plugin-settings)
Plugin settings
If your plugin needs configuration (API keys, preferences), define a `settingsSchema` with Zod and use the `install()` hook:
###
[](#enable-disable)
Enable / disable
###
[](#reconfigure)
Reconfigure
##
[](#step-7-publish)
Step 7: Publish
###
[](#prepare-for-publishing)
Prepare for publishing
1.
Update `version` in both `package.json` and `src/index.ts`
2.
Make sure `main` points to `dist/index.js`
3.
Ensure `keywords` includes `openacp` and `openacp-plugin`
###
[](#build-and-publish)
Build and publish
###
[](#how-users-install-your-plugin)
How users install your plugin
This downloads from npm into `\~/.openacp/plugins/`, validates the plugin interface, and runs `install()` if defined.
###
[](#list-your-plugin-in-the-registry)
List your plugin in the registry
After publishing to npm, add your plugin to the [OpenACP Plugin Registry](https://github.com/Open-ACP/plugin-registry) so users can discover it via `openacp plugin search`:
1.
Fork [Open-ACP/plugin-registry](https://github.com/Open-ACP/plugin-registry)
2.
Create `plugins/myorg--hello-world.json` with your plugin metadata
3.
Submit a PR — CI auto-validates and auto-merges
See [Contributing \> Publishing a Plugin to the Registry](/extending/contributing#publishing-a-plugin-to-the-registry) for the full guide.
##
[](#next-steps)
Next Steps
*
[Writing Plugins](/architecture/writing-plugins) -- full reference for all plugin APIs (services, middleware, events, storage)
*
[Plugin SDK Reference](/extending/plugin-sdk-reference) -- complete API reference for types, base classes, and testing utilities
*
[Dev Mode](/extending/dev-mode) -- detailed guide for the development workflow
*
[Plugin System](/extending/plugin-system) -- how the plugin infrastructure works under the hood
[PreviousOverview](/extending/extending)[NextPlugin System](/extending/plugin-system)
Last updated 23 days ago
Was this helpful?