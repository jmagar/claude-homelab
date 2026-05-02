Config basics – Codex | OpenAI Developers
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
Codex reads configuration details from more than one location. Your personal defaults live in `\~/.codex/config.toml`, and you can add project overrides with `.codex/config.toml` files. For security, Codex loads project `.codex/` layers only when you trust the project.
## Codex configuration file
Codex stores user-level configuration at `\~/.codex/config.toml`. To scope settings to a specific project or subfolder, add a `.codex/config.toml` file in your repo.
To open the configuration file from the Codex IDE extension, select the gear icon in the top-right corner, then select **Codex Settings \> Open config.toml**.
The CLI and IDE extension share the same configuration layers. You can use them to:
* Set the default model and provider.
* Configure [approval policies and sandbox settings](/codex/agent-approvals-security#sandbox-and-approvals).
* Configure [MCP servers](/codex/mcp).
## Configuration precedence
Codex resolves values in this order (highest precedence first):
1. CLI flags and `--config` overrides
2. [Profile](/codex/config-advanced#profiles) values (from `--profile \<name\>`)
3. Project config files: `.codex/config.toml`, ordered from the project root down to your current working directory (closest wins; trusted projects only)
4. User config: `\~/.codex/config.toml`
5. System config (if present): `/etc/codex/config.toml` on Unix
6. Built-in defaults
Use that precedence to set shared defaults at the top level and keep profiles focused on the values that differ.
If you mark a project as untrusted, Codex skips project-scoped `.codex/` layers, including project-local config, hooks, and rules. User and system config still load, including user/global hooks and rules.
For one-off overrides via `-c`/`--config` (including TOML quoting rules), see [Advanced Config](/codex/config-advanced#one-off-overrides-from-the-cli).
On managed machines, your organization may also enforce constraints via
`requirements.toml` (for example, disallowing `approval\_policy = "never"` or
`sandbox\_mode = "danger-full-access"`). See [Managed
configuration](/codex/enterprise/managed-configuration) and [Admin-enforced
requirements](/codex/enterprise/managed-configuration#admin-enforced-requirements-requirementstoml).
## Common configuration options
Here are a few options people change most often:
#### Default model
Choose the model Codex uses by default in the CLI and IDE.
```
`model = "gpt-5.5"`
```
#### Approval prompts
Control when Codex pauses to ask before running generated commands.
```
`approval\_policy = "on-request"`
```
For behavior differences between `untrusted`, `on-request`, and `never`, see [Run without approval prompts](/codex/agent-approvals-security#run-without-approval-prompts) and [Common sandbox and approval combinations](/codex/agent-approvals-security#common-sandbox-and-approval-combinations).
#### Sandbox level
Adjust how much filesystem and network access Codex has while executing commands.
```
`sandbox\_mode = "workspace-write"`
```
For mode-by-mode behavior (including protected `.git`/`.codex` paths and network defaults), see [Sandbox and approvals](/codex/agent-approvals-security#sandbox-and-approvals), [Protected paths in writable roots](/codex/agent-approvals-security#protected-paths-in-writable-roots), and [Network access](/codex/agent-approvals-security#network-access).
#### Permission profiles
Use a named permission profile when you want one reusable filesystem or network policy across sessions:
```
`default\_permissions = ":workspace"`
```
Built-in profiles include `:read-only`, `:workspace`, and `:danger-no-sandbox`. For custom filesystem or network rules, define `[permissions.\<name\>]` tables and set `default\_permissions` to that name.
#### Windows sandbox mode
When running Codex natively on Windows, set the native sandbox mode to `elevated` in the `windows` table. Use `unelevated` only if you don’t have administrator permissions or if elevated setup fails.
```
`[windows]
sandbox = "elevated" # Recommended
# sandbox = "unelevated" # Fallback if admin permissions/setup are unavailable`
```
#### Web search mode
Codex enables web search by default for local tasks and serves results from a web search cache. The cache is an OpenAI-maintained index of web results, so cached mode returns pre-indexed results instead of fetching live pages. This reduces exposure to prompt injection from arbitrary live content, but you should still treat web results as untrusted. If you are using `--yolo` or another [full access sandbox setting](/codex/agent-approvals-security#common-sandbox-and-approval-combinations), web search defaults to live results. Choose a mode with `web\_search`:
* `"cached"` (default) serves results from the web search cache.
* `"live"` fetches the most recent data from the web (same as `--search`).
* `"disabled"` turns off the web search tool.
```
`web\_search = "cached" # default; serves results from the web search cache
# web\_search = "live" # fetch the most recent data from the web (same as --search)
# web\_search = "disabled"`
```
#### Reasoning effort
Tune how much reasoning effort the model applies when supported.
```
`model\_reasoning\_effort = "high"`
```
#### Communication style
Set a default communication style for supported models.
```
`personality = "friendly" # or "pragmatic" or "none"`
```
You can override this later in an active session with `/personality` or per thread/turn when using the app-server APIs.
#### TUI keymap
Customize terminal shortcuts under `tui.keymap`. Context-specific bindings override `tui.keymap.global`, and an empty list unbinds the action.
```
`[tui.keymap.global]
open\_transcript = "ctrl-t"
[tui.keymap.composer]
submit = ["enter", "ctrl-m"]`
```
#### Command environment
Control which environment variables Codex forwards to spawned commands.
```
`[shell\_environment\_policy]
include\_only = ["PATH", "HOME"]`
```
#### Log directory
Override where Codex writes local log files such as `codex-tui.log`.
```
`log\_dir = "/absolute/path/to/codex-logs"`
```
For one-off runs, you can also set it from the CLI:
```
`codex -c log\_dir=./.codex-log`
```
## Feature flags
Use the `[features]` table in `config.toml` to toggle optional and experimental capabilities.
```
`[features]
shell\_snapshot = true # Speed up repeated commands`
```
### Supported features
|Key|Default|Maturity|Description|
|`apps`|false|Experimental|Enable ChatGPT Apps/connectors support|
|`codex\_hooks`|true|Stable|Enable lifecycle hooks from `hooks.json` or inline `[hooks]`. See [Hooks](/codex/hooks).|
|`fast\_mode`|true|Stable|Enable Fast mode selection and the `service\_tier = "fast"` path|
|`memories`|false|Stable|Enable [Memories](/codex/memories)|
|`multi\_agent`|true|Stable|Enable subagent collaboration tools|
|`personality`|true|Stable|Enable personality selection controls|
|`shell\_snapshot`|true|Stable|Snapshot your shell environment to speed up repeated commands|
|`shell\_tool`|true|Stable|Enable the default `shell` tool|
|`unified\_exec`|`true` except Windows|Stable|Use the unified PTY-backed exec tool|
|`undo`|false|Stable|Enable undo via per-turn git ghost snapshots|
|`web\_search`|true|Deprecated|Legacy toggle; prefer the top-level `web\_search` setting|
|`web\_search\_cached`|false|Deprecated|Legacy toggle that maps to `web\_search = "cached"` when unset|
|`web\_search\_request`|false|Deprecated|Legacy toggle that maps to `web\_search = "live"` when unset|
The Maturity column uses feature maturity labels such as Experimental, Beta,
and Stable. See [Feature Maturity](/codex/feature-maturity) for how to
interpret these labels.
Omit feature keys to keep their defaults.
For the current lifecycle hooks MVP, see [Hooks](/codex/hooks).
### Enabling features
* In `config.toml`, add `feature\_name = true` under `[features]`.
* From the CLI, run `codex --enable feature\_name`.
* To enable more than one feature, run `codex --enable feature\_a --enable feature\_b`.
* To disable a feature, set the key to `false` in `config.toml`.