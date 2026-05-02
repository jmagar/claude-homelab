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
This document covers everything about OpenACP's plugin system: the interface, lifecycle, context API, permissions, error isolation, settings, and loading order.
##
[](#openacpplugin-interface)
OpenACPPlugin Interface
Every plugin exports an object conforming to this interface:
Copy
```
`interface OpenACPPlugin {
// === Identity ===
name: string // '@openacp/security' or '@community/translator'
version: string // semver, e.g. '1.0.0'
description?: string // shown in plugin list
// === Dependencies ===
pluginDependencies?: Record\<string, string\> // name -\> semver range
optionalPluginDependencies?: Record\<string, string\> // used if available
// === Override ===
overrides?: string // replace a built-in plugin entirely
// === Permissions ===
permissions?: PluginPermission[] // defaults to [] (no capabilities)
// === Settings ===
settingsSchema?: ZodSchema // validation for settings.json
essential?: boolean // true = needs setup before system can run
// === Runtime lifecycle ===
setup(ctx: PluginContext): Promise\<void\> // called every boot
teardown?(): Promise\<void\> // called on shutdown
// === Install lifecycle ===
install?(ctx: InstallContext): Promise\<void\> // first-time setup
uninstall?(ctx: InstallContext, opts: { purge: boolean }): Promise\<void\>
configure?(ctx: InstallContext): Promise\<void\> // reconfigure
migrate?(ctx: MigrateContext, oldSettings: unknown, oldVersion: string): Promise\<unknown\>
}`
```
###
[](#field-details)
Field Details
Field
Required
Description
`name`
Yes
Unique identifier. Must match `/^[@a-z0-9][a-z0-9.\_\\/-]\*$/`
`version`
Yes
Semver version string
`pluginDependencies`
No
Plugins that must load before this one
`optionalPluginDependencies`
No
Used if available, graceful degrade if not
`overrides`
No
Name of built-in plugin to replace
`permissions`
No
Defaults to `[]` -- no capabilities
`settingsSchema`
No
Zod schema for validating settings
`essential`
No
If true, plugin needs interactive setup before system can run
`setup()`
Yes
Called every boot in dependency order (30s timeout)
`teardown()`
No
Called on shutdown in reverse order (10s timeout)
`install()`
No
Interactive first-time setup
`configure()`
No
Interactive reconfiguration
`migrate()`
No
Non-interactive settings migration on version change
`uninstall()`
No
Cleanup on removal
##
[](#plugin-lifecycle)
Plugin Lifecycle
###
[](#lifecycle-hooks-in-detail)
Lifecycle hooks in detail
Hook
Trigger
Interactive?
Has Services?
`install()`
`openacp plugins install \<name\>` or first-run
Yes
No
`migrate()`
Boot -- stored version differs from plugin version
No
No
`configure()`
`openacp plugins configure \<name\>`
Yes
No
`setup()`
Every boot, after migrate
No
Yes
`teardown()`
Shutdown
No
Yes
`uninstall()`
`openacp plugins uninstall \<name\>`
Yes
No
###
[](#boot-sequence-for-a-single-plugin)
Boot sequence for a single plugin
##
[](#plugincontext-api)
PluginContext API
Every plugin receives a `PluginContext` in its `setup()` call. The context is scoped -- methods check permissions and auto-cleanup on teardown.
###
[](#pluginstorage)
PluginStorage
Per-plugin key-value store backed by a JSON file at `\~/.openacp/plugins/data/{plugin-name}/kv.json`.
Writes are serialized per plugin. The `getDataDir()` method returns an absolute path where the plugin can store anything (SQLite databases, large files, caches, etc.).
##
[](#permissions-model)
Permissions Model
Plugins declare required permissions in their `permissions` array. Each `PluginContext` method checks permission before executing.
If a plugin calls a method without the required permission, a `PluginPermissionError` is thrown immediately. This error counts against the plugin's error budget.
Omitting `permissions` entirely defaults to `[]` -- the plugin can only run code in `setup()` and use `ctx.log`.
##
[](#error-isolation)
Error Isolation
Every interaction with a plugin is wrapped in error handling. A plugin crash never takes down core or other plugins.
###
[](#error-budget)
Error budget
Community plugins have an error budget: **10 errors per hour** (configurable). When exceeded:
1.
Plugin is auto-disabled for the rest of the runtime
2.
All middleware, event handlers, and service calls stop executing
3.
Event `plugin:disabled` is emitted
4.
Warning logged
Built-in plugins are exempt from error budgets -- bugs should be fixed in code.
###
[](#per-call-isolation)
Per-call isolation
###
[](#recovery)
Recovery
*
Disable is runtime-only -- does NOT persist to config
*
Next restart re-enables the plugin and resets the budget
*
Manual re-enable during runtime is not supported in v1
###
[](#error-behavior-by-context)
Error behavior by context
Context
Behavior
Middleware chain
Skip handler, pass original payload to next
Event handler
Swallow error, other listeners still receive event
Service call
Throw to caller, caller handles gracefully
setup() throws
Plugin marked failed, dependents cascade-skipped
teardown() throws
Logged, continue with next plugin
##
[](#settings-system)
Settings System
Each plugin has its own `settings.json` file, managed independently.
###
[](#directory-structure)
Directory structure
###
[](#settingsapi)
SettingsAPI
Available in `InstallContext` for interactive lifecycle hooks.
###
[](#settingsmanager)
SettingsManager
Core module that creates `SettingsAPI` instances per plugin and handles validation.
Validation runs after:
1.
`migrate()` returns new settings
2.
`install()` completes
3.
API/Web UI updates settings
Validation failure prevents boot -- the plugin is marked as failed.
##
[](#plugin-registry)
Plugin Registry
Tracks all installed plugins in `\~/.openacp/plugins.json`:
###
[](#pluginregistry-class)
PluginRegistry class
Built-in plugins cannot be uninstalled (source `builtin`). They can only be disabled:
##
[](#plugin-discovery-and-loading-order)
Plugin Discovery and Loading Order
###
[](#discovery)
Discovery
1.
**Built-in plugins**: imported from `src/plugins/\*/index.ts`, marked as trusted
2.
**Community plugins**: read from `\~/.openacp/plugins/package.json` dependencies, checksums verified against `\~/.openacp/plugins/checksums.json`
###
[](#filtering)
Filtering
*
Config `enabled: false` -\> skip
*
No config entry for built-in -\> enabled by default
*
No config entry for community -\> disabled by default
###
[](#override-resolution)
Override resolution
If a plugin declares `overrides: '@openacp/security'`, the overridden plugin is removed from the load list entirely. The overriding plugin takes its place.
###
[](#dependency-validation)
Dependency validation
1.
Build dependency graph (nodes = plugins, edges = `pluginDependencies`)
2.
Detect circular dependencies (DFS) -- skip all plugins in cycle
3.
Check missing required dependencies -- skip plugin and all its dependents
4.
Check semver ranges -- log warning on mismatch, still attempt to load
5.
Optional dependencies: log info if missing, plugin handles `undefined` from `getService()`
###
[](#topological-sort)
Topological sort
Within the same depth level, load order is determined by registration order.
##
[](#legacy-migration)
Legacy Migration
When upgrading from pre-plugin config.json (all settings in one file):
1.
Core detects: config.json has plugin fields AND plugins.json does not exist
2.
Create plugins.json, auto-register all built-in plugins
3.
For each built-in: extract legacy config, call `plugin.install()` with `legacyConfig`
4.
Plugin reads `legacyConfig` -\> saves to settings.json (no interactive prompts)
5.
Strip plugin-specific fields from config.json
6.
Normal boot continues
If migration fails for one plugin, legacy config is kept for retry on next boot.
##
[](#further-reading)
Further Reading
*
[Architecture Overview](/architecture/architecture) -- high-level picture
*
[Core Design](/architecture/core-design) -- core module details
*
[Writing Plugins](/architecture/writing-plugins) -- step-by-step plugin development guide
*
[Built-in Plugins](/architecture/built-in-plugins) -- all 11 built-in plugins documented
[PreviousCore Design](/architecture/core-design)[NextCommand System](/architecture/command-system)
Last updated 1 month ago
Was this helpful?