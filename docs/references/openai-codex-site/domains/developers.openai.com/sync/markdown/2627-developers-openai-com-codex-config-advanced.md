Advanced Configuration – Codex | OpenAI Developers
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
Use these options when you need more control over providers, policies, and integrations. For a quick start, see [Config basics](/codex/config-basic).
For background on project guidance, reusable capabilities, custom slash commands, subagent workflows, and integrations, see [Customization](/codex/concepts/customization). For configuration keys, see [Configuration Reference](/codex/config-reference).
## Profiles
Profiles let you save named sets of configuration values and switch between them from the CLI.
Profiles are experimental and may change or be removed in future releases.
Profiles are not currently supported in the Codex IDE extension.
Define profiles under `[profiles.\<name\>]` in `config.toml`, then run `codex --profile \<name\>`:
```
`model = "gpt-5.4"
approval\_policy = "on-request"
model\_catalog\_json = "/Users/me/.codex/model-catalogs/default.json"
[profiles.deep-review]
model = "gpt-5-pro"
model\_reasoning\_effort = "high"
approval\_policy = "never"
model\_catalog\_json = "/Users/me/.codex/model-catalogs/deep-review.json"
[profiles.lightweight]
model = "gpt-4.1"
approval\_policy = "untrusted"`
```
To make a profile the default, add `profile = "deep-review"` at the top level of `config.toml`. Codex loads that profile unless you override it on the command line.
Profiles can also override `model\_catalog\_json`. When both the top level and the selected profile set `model\_catalog\_json`, Codex prefers the profile value.
## One-off overrides from the CLI
In addition to editing `\~/.codex/config.toml`, you can override configuration for a single run from the CLI:
* Prefer dedicated flags when they exist (for example, `--model`).
* Use `-c` / `--config` when you need to override an arbitrary key.
Examples:
```
`# Dedicated flag
codex --model gpt-5.4
# Generic key/value override (value is TOML, not JSON)
codex --config model='"gpt-5.4"'
codex --config sandbox\_workspace\_write.network\_access=true
codex --config 'shell\_environment\_policy.include\_only=["PATH","HOME"]'`
```
Notes:
* Keys can use dot notation to set nested values (for example, `mcp\_servers.context7.enabled=false`).
* `--config` values are parsed as TOML. When in doubt, quote the value so your shell doesn’t split it on spaces.
* If the value can’t be parsed as TOML, Codex treats it as a string.
## Config and state locations
Codex stores its local state under `CODEX\_HOME` (defaults to `\~/.codex`).
Common files you may see there:
* `config.toml` (your local configuration)
* `auth.json` (if you use file-based credential storage) or your OS keychain/keyring
* `history.jsonl` (if history persistence is enabled)
* Other per-user state such as logs and caches
For authentication details (including credential storage modes), see [Authentication](/codex/auth). For the full list of configuration keys, see [Configuration Reference](/codex/config-reference).
For shared defaults, rules, and skills checked into repos or system paths, see [Team Config](/codex/enterprise/admin-setup#team-config).
If you just need to point the built-in OpenAI provider at an LLM proxy, router, or data-residency enabled project, set `openai\_base\_url` in `config.toml` instead of defining a new provider. This changes the base URL for the built-in `openai` provider without requiring a separate `model\_providers.\<id\>` entry.
```
`openai\_base\_url = "https://us.api.openai.com/v1"`
```
## Project config files (`.codex/config.toml`)
In addition to your user config, Codex reads project-scoped overrides from `.codex/config.toml` files inside your repo. Codex walks from the project root to your current working directory and loads every `.codex/config.toml` it finds. If multiple files define the same key, the closest file to your working directory wins.
For security, Codex loads project-scoped config files only when the project is trusted. If the project is untrusted, Codex ignores project `.codex/` layers, including `.codex/config.toml`, project-local hooks, and project-local rules. User and system layers remain separate and still load.
Relative paths inside a project config (for example, `model\_instructions\_file`) are resolved relative to the `.codex/` folder that contains the `config.toml`.
## Hooks (experimental)
Codex can also load lifecycle hooks from either `hooks.json` files or inline
`[hooks]` tables in `config.toml` files that sit next to active config layers.
In practice, the two most useful locations are:
* `\~/.codex/hooks.json`
* `\~/.codex/config.toml`
* `\<repo\>/.codex/hooks.json`
* `\<repo\>/.codex/config.toml`
Project-local hooks load only when the project `.codex/` layer is trusted.
User-level hooks remain independent of project trust.
Turn hooks on with:
```
`[features]
codex\_hooks = true`
```
Inline TOML hooks use the same event structure as `hooks.json`:
```
`[[hooks.PreToolUse]]
matcher = "^Bash$"
[[hooks.PreToolUse.hooks]]
type = "command"
command = '/usr/bin/python3 "$(git rev-parse --show-toplevel)/.codex/hooks/pre\_tool\_use\_policy.py"'
timeout = 30
statusMessage = "Checking Bash command"`
```
If a single layer contains both `hooks.json` and inline `[hooks]`, Codex loads
both and warns. Prefer one representation per layer.
For the current event list, input fields, output behavior, and limitations, see
[Hooks](/codex/hooks).
## Agent roles (`[agents]` in `config.toml`)
For subagent role configuration (`[agents]` in `config.toml`), see [Subagents](/codex/subagents).
## Project root detection
Codex discovers project configuration (for example, `.codex/` layers and `AGENTS.md`) by walking up from the working directory until it reaches a project root.
By default, Codex treats a directory containing `.git` as the project root. To customize this behavior, set `project\_root\_markers` in `config.toml`:
```
`# Treat a directory as the project root when it contains any of these markers.
project\_root\_markers = [".git", ".hg", ".sl"]`
```
Set `project\_root\_markers = []` to skip searching parent directories and treat the current working directory as the project root.
## Custom model providers
A model provider defines how Codex connects to a model (base URL, wire API, authentication, and optional HTTP headers). Custom providers can’t reuse the reserved built-in provider IDs: `openai`, `ollama`, and `lmstudio`.
Define additional providers and point `model\_provider` at them:
```
`model = "gpt-5.4"
model\_provider = "proxy"
[model\_providers.proxy]
name = "OpenAI using LLM proxy"
base\_url = "http://proxy.example.com"
env\_key = "OPENAI\_API\_KEY"
[model\_providers.local\_ollama]
name = "Ollama"
base\_url = "http://localhost:11434/v1"
[model\_providers.mistral]
name = "Mistral"
base\_url = "https://api.mistral.ai/v1"
env\_key = "MISTRAL\_API\_KEY"`
```
Add request headers when needed:
```
`[model\_providers.example]
http\_headers = { "X-Example-Header" = "example-value" }
env\_http\_headers = { "X-Example-Features" = "EXAMPLE\_FEATURES" }`
```
Use command-backed authentication when a provider needs Codex to fetch bearer tokens from an external credential helper:
```
`[model\_providers.proxy]
name = "OpenAI using LLM proxy"
base\_url = "https://proxy.example.com/v1"
wire\_api = "responses"
[model\_providers.proxy.auth]
command = "/usr/local/bin/fetch-codex-token"
args = ["--audience", "codex"]
timeout\_ms = 5000
refresh\_interval\_ms = 300000`
```
The auth command receives no `stdin` and must print the token to stdout. Codex trims surrounding whitespace, treats an empty token as an error, and refreshes proactively at `refresh\_interval\_ms`; set `refresh\_interval\_ms = 0` to refresh only after an authentication retry. Don’t combine `[model\_providers.\<id\>.auth]` with `env\_key`, `experimental\_bearer\_token`, or `requires\_openai\_auth`.
### Amazon Bedrock provider
Codex includes a built-in `amazon-bedrock` model provider. Set it directly as
`model\_provider`; unlike custom providers, this built-in provider supports only
the nested AWS profile and region overrides.
```
`model\_provider = "amazon-bedrock"
model = "\<bedrock-model-id\>"
[model\_providers.amazon-bedrock.aws]
profile = "default"
region = "eu-central-1"`
```
If you omit `profile`, Codex uses the standard AWS credential chain. Set
`region` to the supported Bedrock region that should handle requests.
## OSS mode (local providers)
Codex can run against a local “open source” provider (for example, Ollama or LM Studio) when you pass `--oss`. If you pass `--oss` without specifying a provider, Codex uses `oss\_provider` as the default.
```
`# Default local provider used with `--oss`
oss\_provider = "ollama" # or "lmstudio"`
```
## Azure provider and per-provider tuning
```
`[model\_providers.azure]
name = "Azure"
base\_url = "https://YOUR\_PROJECT\_NAME.openai.azure.com/openai"
env\_key = "AZURE\_OPENAI\_API\_KEY"
query\_params = { api-version = "2025-04-01-preview" }
wire\_api = "responses"
request\_max\_retries = 4
stream\_max\_retries = 10
stream\_idle\_timeout\_ms = 300000`
```
To change the base URL for the built-in OpenAI provider, use `openai\_base\_url`; don’t create `[model\_providers.openai]`, because you can’t override built-in provider IDs.
## ChatGPT customers using data residency
Projects created with [data residency](https://help.openai.com/en/articles/9903489-data-residency-and-inference-residency-for-chatgpt) enabled can create a model provider to update the base\_url with the [correct prefix](https://platform.openai.com/docs/guides/your-data#which-models-and-features-are-eligible-for-data-residency).
```
`model\_provider = "openaidr"
[model\_providers.openaidr]
name = "OpenAI Data Residency"
base\_url = "https://us.api.openai.com/v1" # Replace 'us' with domain prefix`
```
## Model reasoning, verbosity, and limits
```
`model\_reasoning\_summary = "none" # Disable summaries
model\_verbosity = "low" # Shorten responses
model\_supports\_reasoning\_summaries = true # Force reasoning
model\_context\_window = 128000 # Context window size`
```
`model\_verbosity` applies only to providers using the Responses API. Chat Completions providers will ignore the setting.
## Approval policies and sandbox modes
Pick approval strictness (affects when Codex pauses) and sandbox level (affects file/network access).
For operational details to keep in mind while editing `config.toml`, see [Common sandbox and approval combinations](/codex/agent-approvals-security#common-sandbox-and-approval-combinations), [Protected paths in writable roots](/codex/agent-approvals-security#protected-paths-in-writable-roots), and [Network access](/codex/agent-approvals-security#network-access).
You can also use a granular approval policy (`approval\_policy = { granular = { ... } }`) to allow or auto-reject individual prompt categories. This is useful when you want normal interactive approvals for some cases but want others, such as `request\_permissions` or skill-script prompts, to fail closed automatically.
Set `approvals\_reviewer = "auto\_review"` to route eligible interactive approval
requests through automatic review. This changes the reviewer, not the sandbox
boundary.
Use `[auto\_review].policy` for local reviewer policy instructions. Managed
`guardian\_policy\_config` takes precedence.
```
`approval\_policy = "untrusted" # Other options: on-request, never, or { granular = { ... } }
approvals\_reviewer = "user" # Or "auto\_review" for automatic review
sandbox\_mode = "workspace-write"
allow\_login\_shell = false # Optional hardening: disallow login shells for shell tools
# Example granular approval policy:
# approval\_policy = { granular = {
# sandbox\_approval = true,
# rules = true,
# mcp\_elicitations = true,
# request\_permissions = false,
# skill\_approval = false
# } }
[sandbox\_workspace\_write]
exclude\_tmpdir\_env\_var = false # Allow $TMPDIR
exclude\_slash\_tmp = false # Allow /tmp
writable\_roots = ["/Users/YOU/.pyenv/shims"]
network\_access = false # Opt in to outbound network
[auto\_review]
policy = """
Use your organization's automatic review policy.
"""`
```
### Named permission profiles
Set `default\_permissions` to reuse a sandbox profile by name. Codex includes
the built-in profiles `:read-only`, `:workspace`, and `:danger-no-sandbox`:
```
`default\_permissions = ":workspace"`
```
For custom profiles, point `default\_permissions` at a name you define under
`[permissions.\<name\>]`:
```
`default\_permissions = "workspace"
[permissions.workspace.filesystem]
":project\_roots" = { "." = "write", "\*\*/\*.env" = "none" }
glob\_scan\_max\_depth = 3
[permissions.workspace.network]
enabled = true
mode = "limited"
[permissions.workspace.network.domains]
"api.openai.com" = "allow"`
```
Use built-in names with a leading colon. Custom names don’t use a leading
colon and must have matching `permissions` tables.
Need the complete key list (including profile-scoped overrides and requirements constraints)? See [Configuration Reference](/codex/config-reference) and [Managed configuration](/codex/enterprise/managed-configuration).
In workspace-write mode, some environments keep `.git/` and `.codex/`
read-only even when the rest of the workspace is writable. This is why
commands like `git commit` may still require approval to run outside the
sandbox. If you want Codex to skip specific commands (for example, block `git commit` outside the sandbox), use
[rules](/codex/rules).
Disable sandboxing entirely (use only if your environment already isolates processes):
```
`sandbox\_mode = "danger-full-access"`
```
## Shell environment policy
`shell\_environment\_policy` controls which environment variables Codex passes to any subprocess it launches (for example, when running a tool-command the model proposes). Start from a clean start (`inherit = "none"`) or a trimmed set (`inherit = "core"`), then layer on excludes, includes, and overrides to avoid leaking secrets while still providing the paths, keys, or flags your tasks need.
```
`[shell\_environment\_policy]
inherit = "none"
set = { PATH = "/usr/bin", MY\_FLAG = "1" }
ignore\_default\_excludes = false
exclude = ["AWS\_\*", "AZURE\_\*"]
include\_only = ["PATH", "HOME"]`
```
Patterns are case-insensitive globs (`\*`, `?`, `[A-Z]`); `ignore\_default\_excludes = false` keeps the automatic KEY/SECRET/TOKEN filter before your includes/excludes run.
## MCP servers
See the dedicated [MCP documentation](/codex/mcp) for configuration details.
## Observability and telemetry
Enable OpenTelemetry (OTel) log export to track Codex runs (API requests, SSE/events, prompts, tool approvals/results). Disabled by default; opt in via `[otel]`:
```
`[otel]
environment = "staging" # defaults to "dev"
exporter = "none" # set to otlp-http or otlp-grpc to send events
log\_user\_prompt = false # redact user prompts unless explicitly enabled`
```
Choose an exporter:
```
`[otel]
exporter = { otlp-http = {
endpoint = "https://otel.example.com/v1/logs",
protocol = "binary",
headers = { "x-otlp-api-key" = "${OTLP\_TOKEN}" }
}}`
```
```
`[otel]
exporter = { otlp-grpc = {
endpoint = "https://otel.example.com:4317",
headers = { "x-otlp-meta" = "abc123" }
}}`
```
If `exporter = "none"` Codex records events but sends nothing. Exporters batch asynchronously and flush on shutdown. Event metadata includes service name, CLI version, env tag, conversation id, model, sandbox/approval settings, and per-event fields (see [Config Reference](/codex/config-reference)).
### What gets emitted
Codex emits structured log events for runs and tool usage. Representative event types include:
* `codex.conversation\_starts` (model, reasoning settings, sandbox/approval policy)
* `codex.api\_request` (attempt, status/success, duration, and error details)
* `codex.sse\_event` (stream event kind, success/failure, duration, plus token counts on `response.completed`)
* `codex.websocket\_request` and `codex.websocket\_event` (request duration plus per-message kind/success/error)
* `codex.user\_prompt` (length; content redacted unless explicitly enabled)
* `codex.tool\_decision` (approved/denied and whether the decision came from config vs user)
* `codex.tool\_result` (duration, success, output snippet)
### OTel metrics emitted
When the OTel metrics pipeline is enabled, Codex emits counters and duration histograms for API, stream, and tool activity.
Each metric below also includes default metadata tags: `auth\_mode`, `originator`, `session\_source`, `model`, and `app.version`.
|Metric|Type|Fields|Description|
|`codex.api\_request`|counter|`status`, `success`|API request count by HTTP status and success/failure.|
|`codex.api\_request.duration\_ms`|histogram|`status`, `success`|API request duration in milliseconds.|
|`codex.sse\_event`|counter|`kind`, `success`|SSE event count by event kind and success/failure.|
|`codex.sse\_event.duration\_ms`|histogram|`kind`, `success`|SSE event processing duration in milliseconds.|
|`codex.websocket.request`|counter|`success`|WebSocket request count by success/failure.|
|`codex.websocket.request.duration\_ms`|histogram|`success`|WebSocket request duration in milliseconds.|
|`codex.websocket.event`|counter|`kind`, `success`|WebSocket message/event count by type and success/failure.|
|`codex.websocket.event.duration\_ms`|histogram|`kind`, `success`|WebSocket message/event processing duration in milliseconds.|
|`codex.tool.call`|counter|`tool`, `success`|Tool invocation count by tool name and success/failure.|
|`codex.tool.call.duration\_ms`|histogram|`tool`, `success`|Tool execution duration in milliseconds by tool name and outcome.|
For more security and privacy guidance around telemetry, see [Security](/codex/agent-approvals-security#monitoring-and-telemetry).
### Metrics
By default, Codex periodically sends a small amount of anonymous usage and health data back to OpenAI. This helps detect when Codex isn’t working correctly and shows what features and configuration options are being used, so the Codex team can focus on what matters most. These metrics don’t contain any personally identifiable information (PII). Metrics collection is independent of OTel log/trace export.
If you want to disable metrics collection entirely across Codex surfaces on a machine, set the analytics flag in your config:
```
`[analytics]
enabled = false`
```
Each metric includes its own fields plus the default context fields below.
#### Default context fields (applies to every event/metric)
* `auth\_mode`: `swic` | `api` | `unknown`.
* `model`: name of the model used.
* `app.version`: Codex version.
#### Metrics catalog
Each metric includes the required fields plus the default context fields above. Metric names below omit the `codex.` prefix.
Most metric names are centralized in `codex-rs/otel/src/metrics/names.rs`; feature-specific metrics emitted outside that file are included here too.
If a metric includes the `tool` field, it reflects the internal tool used (for example, `apply\_patch` or `shell`) and doesn’t contain the actual shell command or patch `codex` is trying to apply.
#### Runtime and model transport
|Metric|Type|Fields|Description|
|`api\_request`|counter|`status`, `success`|API request count by HTTP status and success/failure.|
|`api\_request.duration\_ms`|histogram|`status`, `success`|API request duration in milliseconds.|
|`sse\_event`|counter|`kind`, `success`|SSE event count by event kind and success/failure.|
|`sse\_event.duration\_ms`|histogram|`kind`, `success`|SSE event processing duration in milliseconds.|
|`websocket.request`|counter|`success`|WebSocket request count by success/failure.|
|`websocket.request.duration\_ms`|histogram|`success`|WebSocket request duration in milliseconds.|
|`websocket.event`|counter|`kind`, `success`|WebSocket message/event count by type and success/failure.|
|`websocket.event.duration\_ms`|histogram|`kind`, `success`|WebSocket message/event processing duration in milliseconds.|
|`responses\_api\_overhead.duration\_ms`|histogram||Responses API overhead timing from websocket responses.|
|`responses\_api\_inference\_time.duration\_ms`|histogram||Responses API inference timing from websocket responses.|
|`responses\_api\_engine\_iapi\_ttft.duration\_ms`|histogram||Responses API engine IAPI time-to-first-token timing.|
|`responses\_api\_engine\_service\_ttft.duration\_ms`|histogram||Responses API engine service time-to-first-token timing.|
|`responses\_api\_engine\_iapi\_tbt.duration\_ms`|histogram||Responses API engine IAPI time-between-token timing.|
|`responses\_api\_engine\_service\_tbt.duration\_ms`|histogram||Responses API engine service time-between-token timing.|
|`transport.fallback\_to\_http`|counter|`from\_wire\_api`|WebSocket-to-HTTP fallback count.|
|`remote\_models.fetch\_update.duration\_ms`|histogram||Time to fetch remote model definitions.|
|`remote\_models.load\_cache.duration\_ms`|histogram||Time to load the remote model cache.|
|`startup\_prewarm.duration\_ms`|histogram|`status`|Startup prewarm duration by outcome.|
|`startup\_prewarm.age\_at\_first\_turn\_ms`|histogram|`status`|Startup prewarm age when the first real turn resolves it.|
|`cloud\_requirements.fetch.duration\_ms`|histogram||Workspace-managed cloud requirements fetch duration.|
|`cloud\_requirements.fetch\_attempt`|counter|See note|Workspace-managed cloud requirements fetch attempts.|
|`cloud\_requirements.fetch\_final`|counter|See note|Final workspace-managed cloud requirements fetch outcome.|
|`cloud\_requirements.load`|counter|`trigger`, `outcome`|Workspace-managed cloud requirements load outcome.|
The `cloud\_requirements.fetch\_attempt` metric includes `trigger`, `attempt`, `outcome`, and `status\_code` fields. The `cloud\_requirements.fetch\_final` metric includes `trigger`, `outcome`, `reason`, `attempt\_count`, and `status\_code` fields.
#### Turn and tool activity
|Metric|Type|Fields|Description|
|`turn.e2e\_duration\_ms`|histogram||End-to-end time for a full turn.|
|`turn.ttft.duration\_ms`|histogram||Time to first token for a turn.|
|`turn.ttfm.duration\_ms`|histogram||Time to first model output item for a turn.|
|`turn.network\_proxy`|counter|`active`, `tmp\_mem\_enabled`|Whether the managed network proxy was active for the turn.|
|`turn.memory`|counter|`read\_allowed`, `feature\_enabled`, `config\_use\_memories`, `has\_citations`|Per-turn memory read availability and memory citation usage.|
|`turn.tool.call`|histogram|`tmp\_mem\_enabled`|Number of tool calls in the turn.|
|`turn.token\_usage`|histogram|`token\_type`, `tmp\_mem\_enabled`|Per-turn token usage by token type (`total`, `input`, `cached\_input`, `output`, or `reasoning\_output`).|
|`tool.call`|counter|`tool`, `success`|Tool invocation count by tool name and success/failure.|
|`tool.call.duration\_ms`|histogram|`tool`, `success`|Tool execution duration in milliseconds by tool name and outcome.|
|`tool.unified\_exec`|counter|`tty`|Unified exec tool calls by TTY mode.|
|`approval.requested`|counter|`tool`, `approved`|Tool approval request result (`approved`, `approved\_with\_amendment`, `approved\_for\_session`, `denied`, `abort`).|
|`mcp.call`|counter|See note|MCP tool invocation result.|
|`mcp.call.duration\_ms`|histogram|See note|MCP tool invocation duration.|
|`mcp.tools.list.duration\_ms`|histogram|`cache`|MCP tool-list duration, including cache hit/miss state.|
|`mcp.tools.fetch\_uncached.duration\_ms`|histogram||Duration of uncached MCP tool fetches.|
|`mcp.tools.cache\_write.duration\_ms`|histogram||Duration of Codex Apps MCP tool-cache writes.|
|`hooks.run`|counter|`hook\_name`, `source`, `status`|Hook run count by hook name, source, and status.|
|`hooks.run.duration\_ms`|histogram|`hook\_name`, `source`, `status`|Hook run duration in milliseconds.|
The `mcp.call` and `mcp.call.duration\_ms` metrics include `status`; normal tool-call emissions also include `tool`, plus `connector\_id` and `connector\_name` when available. Blocked Codex Apps MCP calls may emit `mcp.call` with only `status`.
#### Threads, tasks, and features
|Metric|Type|Fields|Description|
|`feature.state`|counter|`feature`, `value`|Feature values that differ from defaults (emit one row per non-default).|
|`status\_line`|counter||Session started with a configured status line.|
|`model\_warning`|counter||Warning sent to the model.|
|`thread.started`|counter|`is\_git`|New thread created, tagged by whether the working directory is in a Git repo.|
|`conversation.turn.count`|counter||User/assistant turns per thread, recorded at the end of the thread.|
|`thread.fork`|counter|`source`|New thread created by forking an existing thread.|
|`thread.rename`|counter||Thread renamed.|
|`thread.side`|counter|`source`|Side conversation created.|
|`thread.skills.enabled\_total`|histogram||Number of skills enabled for a new thread.|
|`thread.skills.kept\_total`|histogram||Number of enabled skills kept after prompt rendering.|
|`thread.skills.truncated`|histogram||Whether skill rendering truncated the enabled skills list (`1` or `0`).|
|`task.compact`|counter|`type`|Number of compactions per type (`remote` or `local`), including manual and auto.|
|`task.review`|counter||Number of reviews triggered.|
|`task.undo`|counter||Number of undo actions triggered.|
|`task.user\_shell`|counter||Number of user shell actions (`!` in the TUI for example).|
|`shell\_snapshot`|counter|See note|Whether taking a shell snapshot succeeded.|
|`shell\_snapshot.duration\_ms`|histogram|`success`|Time to take a shell snapshot.|
|`skill.injected`|counter|`status`, `skill`|Skill injection outcomes by skill.|
|`plugins.startup\_sync`|counter|`transport`, `status`|Curated plugin startup sync attempts.|
|`plugins.startup\_sync.final`|counter|`transport`, `status`|Final curated plugin startup sync outcome.|
|`multi\_agent.spawn`|counter|`role`|Agent spawns by role.|
|`multi\_agent.resume`|counter||Agent resumes.|
|`multi\_agent.nickname\_pool\_reset`|counter||Agent nickname pool resets.|
The `shell\_snapshot` metric includes `success` and, on failures, `failure\_reason`.
#### Memory and local state
|Metric|Type|Fields|Description|
|`memory.phase1`|counter|`status`|Memory phase 1 job counts by status.|
|`memory.phase1.e2e\_ms`|histogram||End-to-end duration for memory phase 1.|
|`memory.phase1.output`|counter||Memory phase 1 outputs written.|
|`memory.phase1.token\_usage`|histogram|`token\_type`|Memory phase 1 token usage by token type.|
|`memory.phase2`|counter|`status`|Memory phase 2 job counts by status.|
|`memory.phase2.e2e\_ms`|histogram||End-to-end duration for memory phase 2.|
|`memory.phase2.input`|counter||Memory phase 2 input count.|
|`memory.phase2.token\_usage`|histogram|`token\_type`|Memory phase 2 token usage by token type.|
|`memories.usage`|counter|`kind`, `tool`, `success`|Memory usage by kind, tool, and success/failure.|
|`external\_agent\_config.detect`|counter|See note|External agent config detections by migration item type.|
|`external\_agent\_config.import`|counter|See note|External agent config imports by migration item type.|
|`db.backfill`|counter|`status`|Initial state DB backfill results (`upserted`, `failed`).|
|`db.backfill.duration\_ms`|histogram|`status`|Duration of the initial state DB backfill.|
|`db.error`|counter|`stage`|Errors during state DB operations.|
The `external\_agent\_config.detect` and `external\_agent\_config.import` metrics include `migration\_type`; skills migrations also include `skills\_count`.
#### Windows sandbox
|Metric|Type|Fields|Description|
|`windows\_sandbox.setup\_success`|counter|`originator`, `mode`|Windows sandbox setup successes.|
|`windows\_sandbox.setup\_failure`|counter|`originator`, `mode`|Windows sandbox setup failures.|
|`windows\_sandbox.setup\_duration\_ms`|histogram|`result`, `originator`, `mode`|Windows sandbox setup duration.|
|`windows\_sandbox.elevated\_setup\_success`|counter||Elevated Windows sandbox setup successes.|
|`windows\_sandbox.elevated\_setup\_failure`|counter|See note|Elevated Windows sandbox setup failures.|
|`windows\_sandbox.elevated\_setup\_canceled`|counter|See note|Canceled elevated Windows sandbox setup attempts.|
|`windows\_sandbox.elevated\_setup\_duration\_ms`|histogram|`result`|Elevated Windows sandbox setup duration.|
|`windows\_sandbox.elevated\_prompt\_shown`|counter||Elevated sandbox setup prompt shown.|
|`windows\_sandbox.elevated\_prompt\_accept`|counter||Elevated sandbox setup prompt accepted.|
|`windows\_sandbox.elevated\_prompt\_use\_legacy`|counter||User chose legacy sandbox from the elevated prompt.|
|`windows\_sandbox.elevated\_prompt\_quit`|counter||User quit from the elevated prompt.|
|`windows\_sandbox.fallback\_prompt\_shown`|counter||Fallback sandbox prompt shown.|
|`windows\_sandbox.fallback\_retry\_elevated`|counter||User retried elevated setup from the fallback prompt.|
|`windows\_sandbox.fallback\_use\_legacy`|counter||User chose legacy sandbox from the fallback prompt.|
|`windows\_sandbox.fallback\_prompt\_quit`|counter||User quit from the fallback prompt.|
|`windows\_sandbox.legacy\_setup\_preflight\_failed`|counter|See note|Legacy Windows sandbox setup preflight failure.|
|`windows\_sandbox.setup\_elevated\_sandbox\_command`|counter||Elevated sandbox setup command invoked.|
|`windows\_sandbox.createprocessasuserw\_failed`|counter|`error\_code`, `path\_kind`, `exe`, `level`|Windows `CreateProcessAsUserW` failures.|
The elevated setup failure metrics include `code` and `message` when Windows setup failure details are available, and may include `originator` when emitted from the shared setup path. The `windows\_sandbox.legacy\_setup\_preflight\_failed` metric includes `originator` when emitted from the shared setup path, but fallback-prompt preflight failures may not include any fields.
### Feedback controls
By default, Codex lets users send feedback from `/feedback`. To disable feedback collection across Codex surfaces on a machine, update your config:
```
`[feedback]
enabled = false`
```
When disabled, `/feedback` shows a disabled message and Codex rejects feedback submissions.
### Hide or surface reasoning events
If you want to reduce noisy “reasoning” output (for example in CI logs), you can suppress it:
```
`hide\_agent\_reasoning = true`
```
If you want to surface raw reasoning content when a model emits it:
```
`show\_raw\_agent\_reasoning = true`
```
Enable raw reasoning only if it’s acceptable for your workflow. Some models/providers (like `gpt-oss`) don’t emit raw reasoning; in that case, this setting has no visible effect.
## Notifications
Use `notify` to trigger an external program whenever Codex emits supported events (currently only `agent-turn-complete`). This is handy for desktop toasts, chat webhooks, CI updates, or any side-channel alerting that the built-in TUI notifications don’t cover.
```
`notify = ["python3", "/path/to/notify.py"]`
```
Example `notify.py` (truncated) that reacts to `agent-turn-complete`:
```
`#!/usr/bin/env python3
import json, subprocess, sys
def main() -\> int:
notification = json.loads(sys.argv[1])
if notification.get("type") != "agent-turn-complete":
return 0
title = f"Codex: {notification.get('last-assistant-message', 'Turn Complete!')}"
message = " ".join(notification.get("input-messages", []))
subprocess.check\_output([
"terminal-notifier",
"-title", title,
"-message", message,
"-group", "codex-" + notification.get("thread-id", ""),
"-activate", "com.googlecode.iterm2",
])
return 0
if \_\_name\_\_ == "\_\_main\_\_":
sys.exit(main())`
```
The script receives a single JSON argument. Common fields include:
* `type` (currently `agent-turn-complete`)
* `thread-id` (session identifier)
* `turn-id` (turn identifier)
* `cwd` (working directory)
* `input-messages` (user messages that led to the turn)
* `last-assistant-message` (last assistant message text)
Place the script somewhere on disk and point `notify` to it.
#### `notify` vs `tui.notifications`
* `notify` runs an external program (good for webhooks, desktop notifiers, CI hooks).
* `tui.notifications` is built in to the TUI and can optionally filter by event type (for example, `agent-turn-complete` and `approval-requested`).
* `tui.notification\_method` controls how the TUI emits terminal notifications (`auto`, `osc9`, or `bel`).
* `tui.notification\_condition` controls whether TUI notifications fire only when
the terminal is `unfocused` or `always`.
In `auto` mode, Codex prefers OSC 9 notifications (a terminal escape sequence some terminals interpret as a desktop notification) and falls back to BEL (`\\x07`) otherwise.
See [Configuration Reference](/codex/config-reference) for the exact keys.
## History persistence
By default, Codex saves local session transcripts under `CODEX\_HOME` (for example, `\~/.codex/history.jsonl`). To disable local history persistence:
```
`[history]
persistence = "none"`
```
To cap the history file size, set `history.max\_bytes`. When the file exceeds the cap, Codex drops the oldest entries and compacts the file while keeping the newest records.
```
`[history]
max\_bytes = 104857600 # 100 MiB`
```
## Clickable citations
If you use a terminal/editor integration that supports it, Codex can render file citations as clickable links. Configure `file\_opener` to pick the URI scheme Codex uses:
```
`file\_opener = "vscode" # or cursor, windsurf, vscode-insiders, none`
```
Example: a citation like `/home/user/project/main.py:42` can be rewritten into a clickable `vscode://file/...:42` link.
## Project instructions discovery
Codex reads `AGENTS.md` (and related files) and includes a limited amount of project guidance in the first turn of a session. Two knobs control how this works:
* `project\_doc\_max\_bytes`: how much to read from each `AGENTS.md` file
* `project\_doc\_fallback\_filenames`: additional filenames to try when `AGENTS.md` is missing at a directory level
For a detailed walkthrough, see [Custom instructions with AGENTS.md](/codex/guides/agents-md).
## TUI options
Running `codex` with no subcommand launches the interactive terminal UI (TUI). Codex exposes some TUI-specific configuration under `[tui]`, including:
* `tui.notifications`: enable/disable notifications (or restrict to specific types)
* `tui.notification\_method`: choose `auto`, `osc9`, or `bel` for terminal notifications
* `tui.notification\_condition`: choose `unfocused` or `always` for when
notifications fire
* `tui.animations`: enable/disable ASCII animations and shimmer effects
* `tui.alternate\_screen`: control alternate screen usage (set to `never` to keep terminal scrollback)
* `tui.show\_tooltips`: show or hide onboarding tooltips on the welcome screen
`tui.notification\_method` defaults to `auto`. In `auto` mode, Codex prefers OSC 9 notifications (a terminal escape sequence some terminals interpret as a desktop notification) when the terminal appears to support them, and falls back to BEL (`\\x07`) otherwise.
See [Configuration Reference](/codex/config-reference) for the full key list.