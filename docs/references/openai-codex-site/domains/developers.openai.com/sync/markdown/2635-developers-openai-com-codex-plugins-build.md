Build plugins – Codex | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Docs Use cases
### Getting Started
* [ Overview ](/codex)
* [ Quickstart ](/codex/quickstart)
* [ Explore use cases ](/codex/use-cases)
* [ Pricing ](/codex/pricing)
* Concepts
* [ Prompting ](/codex/prompting)
* [ Customization ](/codex/concepts/customization)
* [ Memories ](/codex/memories)
* [ Chronicle ](/codex/memories/chronicle)
* [ Sandboxing ](/codex/concepts/sandboxing)
* [ Subagents ](/codex/concepts/subagents)
* [ Workflows ](/codex/workflows)
* [ Models ](/codex/models)
* [ Cyber Safety ](/codex/concepts/cyber-safety)
### Using Codex
* App
* [ Overview ](/codex/app)
* [ Features ](/codex/app/features)
* [ Settings ](/codex/app/settings)
* [ Review ](/codex/app/review)
* [ Automations ](/codex/app/automations)
* [ Worktrees ](/codex/app/worktrees)
* [ Local Environments ](/codex/app/local-environments)
* [ In-app browser ](/codex/app/browser)
* [ Computer Use ](/codex/app/computer-use)
* [ Commands ](/codex/app/commands)
* [ Windows ](/codex/app/windows)
* [ Troubleshooting ](/codex/app/troubleshooting)
* IDE Extension
* [ Overview ](/codex/ide)
* [ Features ](/codex/ide/features)
* [ Settings ](/codex/ide/settings)
* [ IDE Commands ](/codex/ide/commands)
* [ Slash commands ](/codex/ide/slash-commands)
* CLI
* [ Overview ](/codex/cli)
* [ Features ](/codex/cli/features)
* [ Command Line Options ](/codex/cli/reference)
* [ Slash commands ](/codex/cli/slash-commands)
* Web
* [ Overview ](/codex/cloud)
* [ Environments ](/codex/cloud/environments)
* [ Internet Access ](/codex/cloud/internet-access)
* Integrations
* [ GitHub ](/codex/integrations/github)
* [ Slack ](/codex/integrations/slack)
* [ Linear ](/codex/integrations/linear)
* Codex Security
* [ Overview ](/codex/security)
* [ Setup ](/codex/security/setup)
* [ Improving the threat model ](/codex/security/threat-model)
* [ FAQ ](/codex/security/faq)
### Configuration
* Config File
* [ Config Basics ](/codex/config-basic)
* [ Advanced Config ](/codex/config-advanced)
* [ Config Reference ](/codex/config-reference)
* [ Sample Config ](/codex/config-sample)
* [ Speed ](/codex/speed)
* [ Rules ](/codex/rules)
* [ Hooks ](/codex/hooks)
* [ AGENTS.md ](/codex/guides/agents-md)
* [ MCP ](/codex/mcp)
* Plugins
* [ Overview ](/codex/plugins)
* [ Build plugins ](/codex/plugins/build)
* [ Skills ](/codex/skills)
* [ Subagents ](/codex/subagents)
### Administration
* [ Authentication ](/codex/auth)
* [ Agent approvals & security ](/codex/agent-approvals-security)
* [ Remote connections ](/codex/remote-connections)
* Enterprise
* [ Admin Setup ](/codex/enterprise/admin-setup)
* [ Governance ](/codex/enterprise/governance)
* [ Managed configuration ](/codex/enterprise/managed-configuration)
* [ Windows ](/codex/windows)
### Automation
* [ Non-interactive Mode ](/codex/noninteractive)
* [ Codex SDK ](/codex/sdk)
* [ App Server ](/codex/app-server)
* [ MCP Server ](/codex/guides/agents-sdk)
* [ GitHub Action ](/codex/github-action)
### Learn
* [ Best practices ](/codex/learn/best-practices)
* [ Videos ](/codex/videos)
* [ Community ](/community)
* Blog
* [ Using skills to accelerate OSS maintenance ](/blog/skills-agents-sdk)
* [ Building frontend UIs with Codex and Figma ](/blog/building-frontend-uis-with-codex-and-figma)
* [ View all ](/blog/topic/codex)
* Cookbooks
* [ Codex Prompting Guide ](/cookbook/examples/gpt-5/codex_prompting_guide)
* [ Modernizing your Codebase with Codex ](/cookbook/examples/codex/code_modernization)
* [ View all ](/cookbook/topic/codex)
* [ Building AI Teams ](/codex/guides/build-ai-native-engineering-team)
### Releases
* [ Changelog ](/codex/changelog)
* [ Feature Maturity ](/codex/feature-maturity)
* [ Open Source ](/codex/open-source)
[API Dashboard](https://platform.openai.com/login)
Copy Page
This page is for plugin authors. If you want to browse, install, and use
plugins in Codex, see [Plugins](/codex/plugins). If you are still iterating on
one repo or one personal workflow, start with a local skill. Build a plugin
when you want to share that workflow across teams, bundle app integrations or
MCP config, or publish a stable package.
## Create a plugin with `$plugin-creator`
For the fastest setup, use the built-in `$plugin-creator` skill.
It scaffolds the required `.codex-plugin/plugin.json` manifest and can also
generate a local marketplace entry for testing. If you already have a plugin
folder, you can still use `$plugin-creator` to wire it into a local
marketplace.
### Build your own curated plugin list
A marketplace is a JSON catalog of plugins. `$plugin-creator` can generate one
for a single plugin, and you can keep adding entries to that same marketplace
to build your own curated list for a repo, team, or personal workflow.
In Codex, each marketplace appears as a selectable source in the plugin
directory. Use `$REPO\_ROOT/.agents/plugins/marketplace.json` for a repo-scoped
list or `\~/.agents/plugins/marketplace.json` for a personal list. Add one
entry per plugin under `plugins[]`, point each `source.path` at the plugin
folder with a `./`-prefixed path relative to the marketplace root, and set
`interface.displayName` to the label you want Codex to show in the marketplace
picker. Then restart Codex. After that, open the plugin directory, choose your
marketplace, and browse or install the plugins in that curated list.
You don’t need a separate marketplace per plugin. One marketplace can expose a
single plugin while you are testing, then grow into a larger curated catalog as
you add more plugins.
### Add a marketplace from the CLI
Use `codex plugin marketplace add` when you want Codex to install and track a
marketplace source for you instead of editing `config.toml` by hand.
```
`codex plugin marketplace add owner/repo
codex plugin marketplace add owner/repo --ref main
codex plugin marketplace add https://github.com/example/plugins.git --sparse .agents/plugins
codex plugin marketplace add ./local-marketplace-root`
```
Marketplace sources can be GitHub shorthand (`owner/repo` or
`owner/repo@ref`), HTTP or HTTPS Git URLs, SSH Git URLs, or local marketplace root
directories. Use `--ref` to pin a Git ref, and repeat `--sparse PATH` to use a
sparse checkout for Git-backed marketplace repos. `--sparse` is valid only for
Git marketplace sources.
To refresh or remove configured marketplaces:
```
`codex plugin marketplace upgrade
codex plugin marketplace upgrade marketplace-name
codex plugin marketplace remove marketplace-name`
```
### Create a plugin manually
Start with a minimal plugin that packages one skill.
1. Create a plugin folder with a manifest at `.codex-plugin/plugin.json`.
```
`mkdir -p my-first-plugin/.codex-plugin`
```
`my-first-plugin/.codex-plugin/plugin.json`
```
`{
"name": "my-first-plugin",
"version": "1.0.0",
"description": "Reusable greeting workflow",
"skills": "./skills/"
}`
```
Use a stable plugin `name` in kebab-case. Codex uses it as the plugin
identifier and component namespace.
1. Add a skill under `skills/\<skill-name\>/SKILL.md`.
```
`mkdir -p my-first-plugin/skills/hello`
```
`my-first-plugin/skills/hello/SKILL.md`
```
`---
name: hello
description: Greet the user with a friendly message.
---
Greet the user warmly and ask how you can help.`
```
1. Add the plugin to a marketplace. Use `$plugin-creator` to generate one, or
follow [Build your own curated plugin list](#build-your-own-curated-plugin-list)
to wire the plugin into Codex manually.
From there, you can add MCP config, app integrations, or marketplace metadata
as needed.
### Install a local plugin manually
Use a repo marketplace or a personal marketplace, depending on who should be
able to access the plugin or curated list.
Choose an option
RepoPersonal
Add a marketplace file at `$REPO\_ROOT/.agents/plugins/marketplace.json`
and store your plugins under `$REPO\_ROOT/plugins/`.
**Repo marketplace example**
Step 1: Copy the plugin folder into `$REPO\_ROOT/plugins/my-plugin`.
```
`mkdir -p ./plugins
cp -R /absolute/path/to/my-plugin ./plugins/my-plugin`
```
Step 2: Add or update `$REPO\_ROOT/.agents/plugins/marketplace.json` so
that `source.path` points to that plugin directory with a `./`-prefixed
relative path:
```
`{
"name": "local-repo",
"plugins": [
{
"name": "my-plugin",
"source": {
"source": "local",
"path": "./plugins/my-plugin"
},
"policy": {
"installation": "AVAILABLE",
"authentication": "ON\_INSTALL"
},
"category": "Productivity"
}
]
}`
```
Step 3: Restart Codex and verify that the plugin appears.
The marketplace file points to the plugin location, so those directories are
examples rather than fixed requirements. Codex resolves `source.path` relative
to the marketplace root, not relative to the `.agents/plugins/` folder. See
[Marketplace metadata](#marketplace-metadata) for the file format.
After you change the plugin, update the plugin directory that your marketplace
entry points to and restart Codex so the local install picks up the new files.
### Marketplace metadata
If you maintain a repo marketplace, define it in
`$REPO\_ROOT/.agents/plugins/marketplace.json`. For a personal marketplace, use
`\~/.agents/plugins/marketplace.json`. A marketplace file controls plugin
ordering and install policies in Codex-facing catalogs. It can represent one
plugin while you are testing or a curated list of plugins that you want Codex
to show together under one marketplace name. Before you add a plugin to a
marketplace, make sure its `version`, publisher metadata, and install-surface
copy are ready for other developers to see.
```
`{
"name": "local-example-plugins",
"interface": {
"displayName": "Local Example Plugins"
},
"plugins": [
{
"name": "my-plugin",
"source": {
"source": "local",
"path": "./plugins/my-plugin"
},
"policy": {
"installation": "AVAILABLE",
"authentication": "ON\_INSTALL"
},
"category": "Productivity"
},
{
"name": "research-helper",
"source": {
"source": "local",
"path": "./plugins/research-helper"
},
"policy": {
"installation": "AVAILABLE",
"authentication": "ON\_INSTALL"
},
"category": "Productivity"
}
]
}`
```
* Use top-level `name` to identify the marketplace.
* Use `interface.displayName` for the marketplace title shown in Codex.
* Add one object per plugin under `plugins` to build a curated list that Codex
shows under that marketplace title.
* Point each plugin entry’s `source.path` at the plugin directory you want
Codex to load. For repo installs, that often lives under `./plugins/`. For
personal installs, a common pattern is `./.codex/plugins/\<plugin-name\>`.
* Keep `source.path` relative to the marketplace root, start it with `./`, and
keep it inside that root.
* For local entries, `source` can also be a plain string path such as
`"./plugins/my-plugin"`.
* Always include `policy.installation`, `policy.authentication`, and
`category` on each plugin entry.
* Use `policy.installation` values such as `AVAILABLE`,
`INSTALLED\_BY\_DEFAULT`, or `NOT\_AVAILABLE`.
* Use `policy.authentication` to decide whether auth happens on install or
first use.
The marketplace controls where Codex loads the plugin from. A local
`source.path` can point somewhere else if your plugin lives outside those
example directories. A marketplace file can live in the repo where you are
developing the plugin or in a separate marketplace repo, and one marketplace
file can point to one plugin or many.
Marketplace entries can also point at Git-backed plugin sources. Use
`"source": "url"` when the plugin lives at the repository root, or
`"source": "git-subdir"` when the plugin lives in a subdirectory:
```
`{
"name": "remote-helper",
"source": {
"source": "git-subdir",
"url": "https://github.com/example/codex-plugins.git",
"path": "./plugins/remote-helper",
"ref": "main"
},
"policy": {
"installation": "AVAILABLE",
"authentication": "ON\_INSTALL"
},
"category": "Productivity"
}`
```
Git-backed entries may use `ref` or `sha` selectors. If Codex can’t resolve a
marketplace entry’s source, it skips that plugin entry instead of failing the
whole marketplace.
### How Codex uses marketplaces
A plugin marketplace is a JSON catalog of plugins that Codex can read and
install.
Codex can read marketplace files from:
* the curated marketplace that powers the official Plugin Directory
* a repo marketplace at `$REPO\_ROOT/.agents/plugins/marketplace.json`
* a Claude-style marketplace at `$REPO\_ROOT/.claude-plugin/marketplace.json`
* a personal marketplace at `\~/.agents/plugins/marketplace.json`
You can install any plugin exposed through a marketplace. Codex installs
plugins into
`\~/.codex/plugins/cache/$MARKETPLACE\_NAME/$PLUGIN\_NAME/$VERSION/`. For local
plugins, `$VERSION` is `local`, and Codex loads the installed copy from that
cache path rather than directly from the marketplace entry.
You can enable or disable each plugin individually. Codex stores each plugin’s
on or off state in `\~/.codex/config.toml`.
## Package and distribute plugins
### Plugin structure
Every plugin has a manifest at `.codex-plugin/plugin.json`. It can also include
a `skills/` directory, an `.app.json` file that points at one or more apps or
connectors, an `.mcp.json` file that configures MCP servers, lifecycle config,
and assets used to present the plugin across supported surfaces.
* my-plugin/
* .codex-plugin/
*
plugin.json Required: plugin manifest
* skills/
* my-skill/
*
SKILL.md Optional: skill instructions
*
.app.json Optional: app or connector mappings
*
.mcp.json Optional: MCP server configuration
* hooks/
*
hooks.json Optional: lifecycle configuration
*
assets/ Optional: icons, logos, screenshots
Only `plugin.json` belongs in `.codex-plugin/`. Keep `skills/`, `assets/`,
`.mcp.json`, `.app.json`, and lifecycle config files at the plugin root.
Published plugins typically use a richer manifest than the minimal example that
appears in quick-start scaffolds. The manifest has three jobs:
* Identify the plugin.
* Point to bundled components such as skills, apps, or MCP servers.
* Provide install-surface metadata such as descriptions, icons, and legal
links.
Here’s a complete manifest example:
```
`{
"name": "my-plugin",
"version": "0.1.0",
"description": "Bundle reusable skills and app integrations.",
"author": {
"name": "Your team",
"email": "team@example.com",
"url": "https://example.com"
},
"homepage": "https://example.com/plugins/my-plugin",
"repository": "https://github.com/example/my-plugin",
"license": "MIT",
"keywords": ["research", "crm"],
"skills": "./skills/",
"mcpServers": "./.mcp.json",
"apps": "./.app.json",
"hooks": "./hooks/hooks.json",
"interface": {
"displayName": "My Plugin",
"shortDescription": "Reusable skills and apps",
"longDescription": "Distribute skills and app integrations together.",
"developerName": "Your team",
"category": "Productivity",
"capabilities": ["Read", "Write"],
"websiteURL": "https://example.com",
"privacyPolicyURL": "https://example.com/privacy",
"termsOfServiceURL": "https://example.com/terms",
"defaultPrompt": [
"Use My Plugin to summarize new CRM notes.",
"Use My Plugin to triage new customer follow-ups."
],
"brandColor": "#10A37F",
"composerIcon": "./assets/icon.png",
"logo": "./assets/logo.png",
"screenshots": ["./assets/screenshot-1.png"]
}
}`
```
`.codex-plugin/plugin.json` is the required entry point. The other manifest
fields are optional, but published plugins commonly use them.
### Manifest fields
Use the top-level fields to define package metadata and point to bundled
components:
* `name`, `version`, and `description` identify the plugin.
* `author`, `homepage`, `repository`, `license`, and `keywords` provide
publisher and discovery metadata.
* `skills`, `mcpServers`, `apps`, and `hooks` point to bundled components
relative to the plugin root.
* `interface` controls how install surfaces present the plugin.
Use the `interface` object for install-surface metadata:
* `displayName`, `shortDescription`, and `longDescription` control the title
and descriptive copy.
* `developerName`, `category`, and `capabilities` add publisher and capability
metadata.
* `websiteURL`, `privacyPolicyURL`, and `termsOfServiceURL` provide external
links.
* `defaultPrompt`, `brandColor`, `composerIcon`, `logo`, and `screenshots`
control starter prompts and visual presentation.
### Path rules
* Keep manifest paths relative to the plugin root and start them with `./`.
* Store visual assets such as `composerIcon`, `logo`, and `screenshots` under
`./assets/` when possible.
* Use `skills` for bundled skill folders, `apps` for `.app.json`,
`mcpServers` for `.mcp.json`, and `hooks` for lifecycle config.
* If you omit `hooks` and the plugin includes `./hooks/hooks.json`, Codex loads
that default lifecycle config automatically.
### Bundled MCP servers and lifecycle config
`mcpServers` can point to an `.mcp.json` file that contains either a direct
server map or a wrapped `mcp\_servers` object.
Direct server map:
```
`{
"docs": {
"command": "docs-mcp",
"args": ["--stdio"]
}
}`
```
Wrapped server map:
```
`{
"mcp\_servers": {
"docs": {
"command": "docs-mcp",
"args": ["--stdio"]
}
}
}`
```
`hooks` can point to one lifecycle JSON file, an array of lifecycle JSON files,
an inline lifecycle object, or an array of inline lifecycle objects. File paths
must follow the same `./`-prefixed plugin-root path rules as other manifest
paths. If you omit the manifest field, Codex still checks `./hooks/hooks.json`.
### Publish official public plugins
Adding plugins to the official Plugin Directory is coming soon.
Self-serve plugin publishing and management are coming soon.