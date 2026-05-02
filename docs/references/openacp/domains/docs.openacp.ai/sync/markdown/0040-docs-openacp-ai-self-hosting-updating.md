Updating | OpenACP Docs
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
[](#check-your-current-version)
Check Your Current Version
Copy
```
`openacp --version`
```
This prints the version from the installed package (e.g., `2026.401.1`). The version is read from `package.json` bundled with the binary.
OpenACP also checks for updates automatically at startup. If a newer version is available on npm, you are prompted:
Copy
```
`Update available: 2026.327.1 → 2026.401.1
? Update now before starting?`
```
Selecting yes runs `npm install -g @openacp/cli@latest` in-process and exits, asking you to re-run your command with the new version. Set `OPENACP\_SKIP\_UPDATE\_CHECK=true` to suppress this prompt.
##
[](#update)
Update
Copy
```
`npm update -g @openacp/cli`
```
Or to pin to a specific version:
Copy
```
`npm install -g @openacp/[[emailprotected]](/cdn-cgi/l/email-protection)`
```
If you are running from source, pull and rebuild:
Copy
```
`git pull
pnpm install
pnpm build`
```
##
[](#backward-compatibility-guarantee)
Backward Compatibility Guarantee
OpenACP guarantees that existing config files, session data, and stored state continue to work after any minor or patch upgrade without manual intervention.
Specific commitments:
*
**Config schema**: New fields always have `.default()` or `.optional()` in the Zod schema. An older config file will never fail validation after an upgrade.
*
**CLI commands and flags**: Existing commands and flags are never removed or renamed in a minor/patch release. Deprecated commands are kept operational with a warning until the next major version.
*
**Plugin API**: Plugin-facing interfaces maintain backward compatibility within a major version.
*
**Data files**: All instance files (sessions, topics, state) are handled defensively — unknown fields are preserved and old formats are migrated automatically.
*
**Instance migration**: If an existing global instance is detected at `\~/.openacp/` on first run after upgrade, it is automatically migrated to `\~/openacp-workspace/.openacp/`. No manual action required.
##
[](#automatic-config-migrations)
Automatic Config Migrations
When OpenACP starts, it runs all pending config migrations before validation. Migrations are applied to the raw JSON in memory and written back to disk if any change was made. You do not need to edit the file manually after an upgrade.
Current migrations (run in order):
1.
`**add-tunnel-section**` — Adds the `tunnel` block with Cloudflare defaults if the key is absent.
2.
`**fix-agent-commands**` — Renames legacy agent command values to their current names.
3.
`**migrate-agents-to-store**` — Moves agent definitions from `config.json` into the separate `\<instance-root\>/agents.json` store introduced in a later release.
In addition, a one-time **global instance migration** runs at CLI startup. If a legacy `\~/.openacp/config.json` is detected, it is automatically moved to `\~/openacp-workspace/.openacp/` and registered in the instance registry.
Migrations are idempotent: running them multiple times has no effect.
##
[](#post-upgrade-checks)
Post-Upgrade Checks
After upgrading, start OpenACP normally:
If there are any issues with the config (e.g., a field that could not be migrated), the process prints the validation errors and exits with a non-zero code. Review the output and correct the config file at `\<instance-root\>/config.json`.
For plugin adapters installed under `\<instance-root\>/plugins/`, re-install them after a major upgrade to ensure API compatibility:
[PreviousLogging](/self-hosting/logging)[NextOverview](/features/features)
Last updated 20 days ago
Was this helpful?