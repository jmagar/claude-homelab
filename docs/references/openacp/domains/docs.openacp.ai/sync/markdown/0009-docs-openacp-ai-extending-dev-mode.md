Dev Mode | OpenACP Docs
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
Dev mode lets you load a local plugin into a running OpenACP instance with automatic hot-reload on file changes. This is the fastest way to develop and debug plugins.
##
[](#what-is-dev-mode)
What Is Dev Mode?
When you run `openacp dev \<path\>`, OpenACP:
1.
Compiles your plugin's TypeScript (if `tsconfig.json` exists)
2.
Starts `tsc --watch` in the background for continuous compilation
3.
Boots the OpenACP server with your local plugin loaded alongside all other plugins
4.
Watches the `dist/` directory for changes and reloads your plugin automatically
Your plugin runs in the same environment as a production install -- same PluginContext, same services, same event bus. The only difference is that it is loaded from a local path instead of `\~/.openacp/plugins/`.
##
[](#usage)
Usage
Copy
```
`openacp dev \<plugin-path\> [options]`
```
**Options:**
Flag
Description
`--no-watch`
Disable file watching (no hot-reload, no `tsc --watch`)
`--verbose`
Enable verbose logging (shows `tsc --watch` output and debug logs)
**Examples:**
##
[](#typescript-support)
TypeScript Support
Dev mode automatically handles TypeScript compilation:
1.
**Initial compile**: Runs `npx tsc` in your plugin directory before starting the server. If compilation fails, the process exits with an error.
2.
**Watch mode**: Unless `--no-watch` is passed, starts `npx tsc --watch --preserveWatchOutput` in the background. Output is hidden unless `--verbose` is set.
3.
**Auto-reload**: When `tsc --watch` recompiles and updates files in `dist/`, the plugin is automatically reloaded.
If your plugin is plain JavaScript (no `tsconfig.json`), the TypeScript steps are skipped and the plugin is loaded directly.
##
[](#hot-reload-behavior)
Hot-Reload Behavior
###
[](#what-happens-on-file-change)
What happens on file change
When a file in your plugin's `dist/` directory changes:
1.
The current plugin instance's `teardown()` is called (if defined)
2.
The plugin module is re-imported from `dist/index.js`
3.
The new plugin's `setup()` is called with a fresh `PluginContext`
4.
Services, commands, middleware, and event listeners are re-registered
###
[](#how-esm-cache-busting-works)
How ESM cache busting works
Node.js caches ESM modules by URL. To force a fresh import on reload, the dev loader copies `dist/index.js` to a temporary file with a unique name, imports from there, then cleans up the temp file. This ensures you always get the latest code.
###
[](#limitations)
Limitations
*
**Entry file only**: The watcher monitors `dist/index.js`. If your plugin imports other local modules, those modules are also refreshed as part of the re-import, but changes to deeply nested dependencies may require a manual restart.
*
**State loss**: On reload, all in-memory state from the previous plugin instance is lost. Use `ctx.storage` for data that should survive reloads.
*
**Side effects**: If your plugin creates external resources (database connections, webhooks), make sure `teardown()` cleans them up to avoid leaks on reload.
##
[](#debugging-tips)
Debugging Tips
###
[](#enable-verbose-logging)
Enable verbose logging
This shows:
*
TypeScript compiler output (errors and warnings)
*
Plugin load/unload events
*
All debug-level log messages from your plugin
###
[](#use-ctx.log-for-plugin-logging)
Use ctx.log for plugin logging
In dev mode with `--verbose`, all log levels are visible.
###
[](#check-the-openacp-logs)
Check the OpenACP logs
If the server logs to a file (configured via `logging.logDir`), tail those logs in another terminal:
##
[](#troubleshooting)
Troubleshooting
###
[](#typescript-compilation-fails)
TypeScript compilation fails
Fix the TypeScript errors in your source code and run `openacp dev` again. The initial compile must succeed before the server starts.
###
[](#plugin-not-found)
Plugin not found
Make sure the path exists and is a directory containing either `dist/index.js` (compiled) or `src/index.ts` (source).
###
[](#built-plugin-not-found)
Built plugin not found
Your plugin has source files but no compiled output. Run `npm run build` in the plugin directory first, or let `openacp dev` handle it (it compiles automatically if `tsconfig.json` exists).
###
[](#invalid-plugin)
Invalid plugin
Your plugin must have a default export that includes at least `name` (string) and `setup` (function). Check your `src/index.ts`:
###
[](#changes-not-taking-effect)
Changes not taking effect
If hot-reload does not pick up your changes:
1.
Check that `tsc --watch` is running (use `--verbose` to see its output)
2.
Verify that `dist/index.js` is being updated (check its modification time)
3.
Try stopping and restarting `openacp dev`
4.
If using `--no-watch`, rebuild manually with `npm run build`
##
[](#further-reading)
Further Reading
*
[Getting Started: Your First Plugin](/extending/getting-started-plugin) -- end-to-end tutorial
*
[Plugin SDK Reference](/extending/plugin-sdk-reference) -- complete API reference
*
[Writing Plugins](/architecture/writing-plugins) -- full guide to plugin APIs
[PreviousPlugin SDK Reference](/extending/plugin-sdk-reference)[NextBuilding Adapters](/extending/building-adapters)
Last updated 1 month ago
Was this helpful?