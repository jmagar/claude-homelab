Configuration Reference – Codex | OpenAI Developers
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
Use this page as a searchable reference for Codex configuration files. For conceptual guidance and examples, start with [Config basics](/codex/config-basic) and [Advanced Config](/codex/config-advanced).
## `config.toml`
User-level configuration lives in `\~/.codex/config.toml`. You can also add project-scoped overrides in `.codex/config.toml` files. Codex loads project-scoped config files only when you trust the project.
For sandbox and approval keys (`approval\_policy`, `sandbox\_mode`, and `sandbox\_workspace\_write.\*`), pair this reference with [Sandbox and approvals](/codex/agent-approvals-security#sandbox-and-approvals), [Protected paths in writable roots](/codex/agent-approvals-security#protected-paths-in-writable-roots), and [Network access](/codex/agent-approvals-security#network-access).
|Key|Type / Values|Details|
|`agents.\<name\>.config\_file`|`string (path)`|
Path to a TOML config layer for that role; relative paths resolve from the config file that declares the role.
|
|`agents.\<name\>.description`|`string`|
Role guidance shown to Codex when choosing and spawning that agent type.
|
|`agents.\<name\>.nickname\_candidates`|`array\<string\>`|
Optional pool of display nicknames for spawned agents in that role.
|
|`agents.job\_max\_runtime\_seconds`|`number`|
Default per-worker timeout for `spawn\_agents\_on\_csv` jobs. When unset, the tool falls back to 1800 seconds per worker.
|
|`agents.max\_depth`|`number`|
Maximum nesting depth allowed for spawned agent threads (root sessions start at depth 0; default: 1).
|
|`agents.max\_threads`|`number`|
Maximum number of agent threads that can be open concurrently. Defaults to `6` when unset.
|
|`allow\_login\_shell`|`boolean`|
Allow shell-based tools to use login-shell semantics. Defaults to `true`; when `false`, `login = true` requests are rejected and omitted `login` defaults to non-login shells.
|
|`analytics.enabled`|`boolean`|
Enable or disable analytics for this machine/profile. When unset, the client default applies.
|
|`approval\_policy`|`untrusted | on-request | never | { granular = { sandbox\_approval = bool, rules = bool, mcp\_elicitations = bool, request\_permissions = bool, skill\_approval = bool } }`|
Controls when Codex pauses for approval before executing commands. You can also use `approval\_policy = { granular = { ... } }` to allow or auto-reject specific prompt categories while keeping other prompts interactive. `on-failure` is deprecated; use `on-request` for interactive runs or `never` for non-interactive runs.
|
|`approval\_policy.granular.mcp\_elicitations`|`boolean`|
When `true`, MCP elicitation prompts are allowed to surface instead of being auto-rejected.
|
|`approval\_policy.granular.request\_permissions`|`boolean`|
When `true`, prompts from the `request\_permissions` tool are allowed to surface.
|
|`approval\_policy.granular.rules`|`boolean`|
When `true`, approvals triggered by execpolicy `prompt` rules are allowed to surface.
|
|`approval\_policy.granular.sandbox\_approval`|`boolean`|
When `true`, sandbox escalation approval prompts are allowed to surface.
|
|`approval\_policy.granular.skill\_approval`|`boolean`|
When `true`, skill-script approval prompts are allowed to surface.
|
|`approvals\_reviewer`|`user | auto\_review`|
Who reviews eligible approval prompts under `on-request` or granular approval policies. Defaults to `user`; `auto\_review` uses the reviewer subagent. This setting doesn't change sandboxing or review actions already allowed inside the sandbox.
|
|`apps.\_default.destructive\_enabled`|`boolean`|
Default allow/deny for app tools with `destructive\_hint = true`.
|
|`apps.\_default.enabled`|`boolean`|
Default app enabled state for all apps unless overridden per app.
|
|`apps.\_default.open\_world\_enabled`|`boolean`|
Default allow/deny for app tools with `open\_world\_hint = true`.
|
|`apps.\<id\>.default\_tools\_approval\_mode`|`auto | prompt | approve`|
Default approval behavior for tools in this app unless a per-tool override exists.
|
|`apps.\<id\>.default\_tools\_enabled`|`boolean`|
Default enabled state for tools in this app unless a per-tool override exists.
|
|`apps.\<id\>.destructive\_enabled`|`boolean`|
Allow or block tools in this app that advertise `destructive\_hint = true`.
|
|`apps.\<id\>.enabled`|`boolean`|
Enable or disable a specific app/connector by id (default: true).
|
|`apps.\<id\>.open\_world\_enabled`|`boolean`|
Allow or block tools in this app that advertise `open\_world\_hint = true`.
|
|`apps.\<id\>.tools.\<tool\>.approval\_mode`|`auto | prompt | approve`|
Per-tool approval behavior override for a single app tool.
|
|`apps.\<id\>.tools.\<tool\>.enabled`|`boolean`|
Per-tool enabled override for an app tool (for example `repos/list`).
|
|`auto\_review.policy`|`string`|
Local Markdown policy instructions for automatic review. Managed `guardian\_policy\_config` takes precedence. Blank values are ignored.
|
|`background\_terminal\_max\_timeout`|`number`|
Maximum poll window in milliseconds for empty `write\_stdin` polls (background terminal polling). Default: `300000` (5 minutes). Replaces the older `background\_terminal\_timeout` key.
|
|`chatgpt\_base\_url`|`string`|
Override the base URL used during the ChatGPT login flow.
|
|`check\_for\_update\_on\_startup`|`boolean`|
Check for Codex updates on startup (set to false only when updates are centrally managed).
|
|`cli\_auth\_credentials\_store`|`file | keyring | auto`|
Control where the CLI stores cached credentials (file-based auth.json vs OS keychain).
|
|`commit\_attribution`|`string`|
Override the commit co-author trailer text. Set an empty string to disable automatic attribution.
|
|`compact\_prompt`|`string`|
Inline override for the history compaction prompt.
|
|`default\_permissions`|`string`|
Name of the default permissions profile to apply to sandboxed tool calls. Built-ins are `:read-only`, `:workspace`, and `:danger-no-sandbox`; custom profile names require matching `[permissions.\<name\>]` tables.
|
|`developer\_instructions`|`string`|
Additional developer instructions injected into the session (optional).
|
|`disable\_paste\_burst`|`boolean`|
Disable burst-paste detection in the TUI.
|
|`experimental\_compact\_prompt\_file`|`string (path)`|
Load the compaction prompt override from a file (experimental).
|
|`experimental\_use\_unified\_exec\_tool`|`boolean`|
Legacy name for enabling unified exec; prefer `[features].unified\_exec` or `codex --enable unified\_exec`.
|
|`features.apps`|`boolean`|
Enable ChatGPT Apps/connectors support (experimental).
|
|`features.codex\_hooks`|`boolean`|
Enable lifecycle hooks loaded from `hooks.json` or inline `[hooks]` config.
|
|`features.enable\_request\_compression`|`boolean`|
Compress streaming request bodies with zstd when supported (stable; on by default).
|
|`features.fast\_mode`|`boolean`|
Enable Fast mode selection and the `service\_tier = "fast"` path (stable; on by default).
|
|`features.memories`|`boolean`|
Enable [Memories](/codex/memories) (off by default).
|
|`features.multi\_agent`|`boolean`|
Enable multi-agent collaboration tools (`spawn\_agent`, `send\_input`, `resume\_agent`, `wait\_agent`, and `close\_agent`) (stable; on by default).
|
|`features.personality`|`boolean`|
Enable personality selection controls (stable; on by default).
|
|`features.prevent\_idle\_sleep`|`boolean`|
Prevent the machine from sleeping while a turn is actively running (experimental; off by default).
|
|`features.shell\_snapshot`|`boolean`|
Snapshot shell environment to speed up repeated commands (stable; on by default).
|
|`features.shell\_tool`|`boolean`|
Enable the default `shell` tool for running commands (stable; on by default).
|
|`features.skill\_mcp\_dependency\_install`|`boolean`|
Allow prompting and installing missing MCP dependencies for skills (stable; on by default).
|
|`features.undo`|`boolean`|
Enable undo support (stable; off by default).
|
|`features.unified\_exec`|`boolean`|
Use the unified PTY-backed exec tool (stable; enabled by default except on Windows).
|
|`features.web\_search`|`boolean`|
Deprecated legacy toggle; prefer the top-level `web\_search` setting.
|
|`features.web\_search\_cached`|`boolean`|
Deprecated legacy toggle. When `web\_search` is unset, true maps to `web\_search = "cached"`.
|
|`features.web\_search\_request`|`boolean`|
Deprecated legacy toggle. When `web\_search` is unset, true maps to `web\_search = "live"`.
|
|`feedback.enabled`|`boolean`|
Enable feedback submission via `/feedback` across Codex surfaces (default: true).
|
|`file\_opener`|`vscode | vscode-insiders | windsurf | cursor | none`|
URI scheme used to open citations from Codex output (default: `vscode`).
|
|`forced\_chatgpt\_workspace\_id`|`string (uuid)`|
Limit ChatGPT logins to a specific workspace identifier.
|
|`forced\_login\_method`|`chatgpt | api`|
Restrict Codex to a specific authentication method.
|
|`hide\_agent\_reasoning`|`boolean`|
Suppress reasoning events in both the TUI and `codex exec` output.
|
|`history.max\_bytes`|`number`|
If set, caps the history file size in bytes by dropping oldest entries.
|
|`history.persistence`|`save-all | none`|
Control whether Codex saves session transcripts to history.jsonl.
|
|`hooks`|`table`|
Lifecycle hooks configured inline in `config.toml`. Uses the same event schema as `hooks.json`; see the Hooks guide for examples and supported events.
|
|`instructions`|`string`|
Reserved for future use; prefer `model\_instructions\_file` or `AGENTS.md`.
|
|`log\_dir`|`string (path)`|
Directory where Codex writes log files (for example `codex-tui.log`); defaults to `$CODEX\_HOME/log`.
|
|`mcp\_oauth\_callback\_port`|`integer`|
Optional fixed port for the local HTTP callback server used during MCP OAuth login. When unset, Codex binds to an ephemeral port chosen by the OS.
|
|`mcp\_oauth\_callback\_url`|`string`|
Optional redirect URI override for MCP OAuth login (for example, a devbox ingress URL). `mcp\_oauth\_callback\_port` still controls the callback listener port.
|
|`mcp\_oauth\_credentials\_store`|`auto | file | keyring`|
Preferred store for MCP OAuth credentials.
|
|`mcp\_servers.\<id\>.args`|`array\<string\>`|
Arguments passed to the MCP stdio server command.
|
|`mcp\_servers.\<id\>.bearer\_token\_env\_var`|`string`|
Environment variable sourcing the bearer token for an MCP HTTP server.
|
|`mcp\_servers.\<id\>.command`|`string`|
Launcher command for an MCP stdio server.
|
|`mcp\_servers.\<id\>.cwd`|`string`|
Working directory for the MCP stdio server process.
|
|`mcp\_servers.\<id\>.disabled\_tools`|`array\<string\>`|
Deny list applied after `enabled\_tools` for the MCP server.
|
|`mcp\_servers.\<id\>.enabled`|`boolean`|
Disable an MCP server without removing its configuration.
|
|`mcp\_servers.\<id\>.enabled\_tools`|`array\<string\>`|
Allow list of tool names exposed by the MCP server.
|
|`mcp\_servers.\<id\>.env`|`map\<string,string\>`|
Environment variables forwarded to the MCP stdio server.
|
|`mcp\_servers.\<id\>.env\_http\_headers`|`map\<string,string\>`|
HTTP headers populated from environment variables for an MCP HTTP server.
|
|`mcp\_servers.\<id\>.env\_vars`|`array\<string | { name = string, source = "local" | "remote" }\>`|
Additional environment variables to whitelist for an MCP stdio server. String entries default to `source = "local"`; use `source = "remote"` only with executor-backed remote stdio.
|
|`mcp\_servers.\<id\>.experimental\_environment`|`local | remote`|
Experimental placement for an MCP server. `remote` starts stdio servers through a remote executor environment; streamable HTTP remote placement is not implemented.
|
|`mcp\_servers.\<id\>.http\_headers`|`map\<string,string\>`|
Static HTTP headers included with each MCP HTTP request.
|
|`mcp\_servers.\<id\>.oauth\_resource`|`string`|
Optional RFC 8707 OAuth resource parameter to include during MCP login.
|
|`mcp\_servers.\<id\>.required`|`boolean`|
When true, fail startup/resume if this enabled MCP server cannot initialize.
|
|`mcp\_servers.\<id\>.scopes`|`array\<string\>`|
OAuth scopes to request when authenticating to that MCP server.
|
|`mcp\_servers.\<id\>.startup\_timeout\_ms`|`number`|
Alias for `startup\_timeout\_sec` in milliseconds.
|
|`mcp\_servers.\<id\>.startup\_timeout\_sec`|`number`|
Override the default 10s startup timeout for an MCP server.
|
|`mcp\_servers.\<id\>.tool\_timeout\_sec`|`number`|
Override the default 60s per-tool timeout for an MCP server.
|
|`mcp\_servers.\<id\>.url`|`string`|
Endpoint for an MCP streamable HTTP server.
|
|`memories.consolidation\_model`|`string`|
Optional model override for global memory consolidation.
|
|`memories.disable\_on\_external\_context`|`boolean`|
When `true`, threads that use external context such as MCP tool calls, web search, or tool search are kept out of memory generation. Defaults to `false`. Legacy alias: `memories.no\_memories\_if\_mcp\_or\_web\_search`.
|
|`memories.extract\_model`|`string`|
Optional model override for per-thread memory extraction.
|
|`memories.generate\_memories`|`boolean`|
When `false`, newly created threads are not stored as memory-generation inputs. Defaults to `true`.
|
|`memories.max\_raw\_memories\_for\_consolidation`|`number`|
Maximum recent raw memories retained for global consolidation. Defaults to `256` and is capped at `4096`.
|
|`memories.max\_rollout\_age\_days`|`number`|
Maximum age of threads considered for memory generation. Defaults to `30` and is clamped to `0`-`90`.
|
|`memories.max\_rollouts\_per\_startup`|`number`|
Maximum rollout candidates processed per startup pass. Defaults to `16` and is capped at `128`.
|
|`memories.max\_unused\_days`|`number`|
Maximum days since a memory was last used before it becomes ineligible for consolidation. Defaults to `30` and is clamped to `0`-`365`.
|
|`memories.min\_rate\_limit\_remaining\_percent`|`number`|
Minimum remaining percentage required in Codex rate-limit windows before memory generation starts. Defaults to `25` and is clamped to `0`-`100`.
|
|`memories.min\_rollout\_idle\_hours`|`number`|
Minimum idle time before a thread is considered for memory generation. Defaults to `6` and is clamped to `1`-`48`.
|
|`memories.use\_memories`|`boolean`|
When `false`, Codex skips injecting existing memories into future sessions. Defaults to `true`.
|
|`model`|`string`|
Model to use (e.g., `gpt-5.5`).
|
|`model\_auto\_compact\_token\_limit`|`number`|
Token threshold that triggers automatic history compaction (unset uses model defaults).
|
|`model\_catalog\_json`|`string (path)`|
Optional path to a JSON model catalog loaded on startup. Profile-level `profiles.\<name\>.model\_catalog\_json` can override this per profile.
|
|`model\_context\_window`|`number`|
Context window tokens available to the active model.
|
|`model\_instructions\_file`|`string (path)`|
Replacement for built-in instructions instead of `AGENTS.md`.
|
|`model\_provider`|`string`|
Provider id from `model\_providers` (default: `openai`).
|
|`model\_providers.\<id\>`|`table`|
Custom provider definition. Built-in provider IDs (`openai`, `ollama`, and `lmstudio`) are reserved and cannot be overridden.
|
|`model\_providers.\<id\>.auth`|`table`|
Command-backed bearer token configuration for a custom provider. Do not combine with `env\_key`, `experimental\_bearer\_token`, or `requires\_openai\_auth`.
|
|`model\_providers.\<id\>.auth.args`|`array\<string\>`|
Arguments passed to the token command.
|
|`model\_providers.\<id\>.auth.command`|`string`|
Command to run when Codex needs a bearer token. The command must print the token to stdout.
|
|`model\_providers.\<id\>.auth.cwd`|`string (path)`|
Working directory for the token command.
|
|`model\_providers.\<id\>.auth.refresh\_interval\_ms`|`number`|
How often Codex proactively refreshes the token in milliseconds (default: 300000). Set to `0` to refresh only after an authentication retry.
|
|`model\_providers.\<id\>.auth.timeout\_ms`|`number`|
Maximum token command runtime in milliseconds (default: 5000).
|
|`model\_providers.\<id\>.base\_url`|`string`|
API base URL for the model provider.
|
|`model\_providers.\<id\>.env\_http\_headers`|`map\<string,string\>`|
HTTP headers populated from environment variables when present.
|
|`model\_providers.\<id\>.env\_key`|`string`|
Environment variable supplying the provider API key.
|
|`model\_providers.\<id\>.env\_key\_instructions`|`string`|
Optional setup guidance for the provider API key.
|
|`model\_providers.\<id\>.experimental\_bearer\_token`|`string`|
Direct bearer token for the provider (discouraged; use `env\_key`).
|
|`model\_providers.\<id\>.http\_headers`|`map\<string,string\>`|
Static HTTP headers added to provider requests.
|
|`model\_providers.\<id\>.name`|`string`|
Display name for a custom model provider.
|
|`model\_providers.\<id\>.query\_params`|`map\<string,string\>`|
Extra query parameters appended to provider requests.
|
|`model\_providers.\<id\>.request\_max\_retries`|`number`|
Retry count for HTTP requests to the provider (default: 4).
|
|`model\_providers.\<id\>.requires\_openai\_auth`|`boolean`|
The provider uses OpenAI authentication (defaults to false).
|
|`model\_providers.\<id\>.stream\_idle\_timeout\_ms`|`number`|
Idle timeout for SSE streams in milliseconds (default: 300000).
|
|`model\_providers.\<id\>.stream\_max\_retries`|`number`|
Retry count for SSE streaming interruptions (default: 5).
|
|`model\_providers.\<id\>.supports\_websockets`|`boolean`|
Whether that provider supports the Responses API WebSocket transport.
|
|`model\_providers.\<id\>.wire\_api`|`responses`|
Protocol used by the provider. `responses` is the only supported value, and it is the default when omitted.
|
|`model\_providers.amazon-bedrock.aws.profile`|`string`|
AWS profile name used by the built-in `amazon-bedrock` provider.
|
|`model\_providers.amazon-bedrock.aws.region`|`string`|
AWS region used by the built-in `amazon-bedrock` provider.
|
|`model\_reasoning\_effort`|`minimal | low | medium | high | xhigh`|
Adjust reasoning effort for supported models (Responses API only; `xhigh` is model-dependent).
|
|`model\_reasoning\_summary`|`auto | concise | detailed | none`|
Select reasoning summary detail or disable summaries entirely.
|
|`model\_supports\_reasoning\_summaries`|`boolean`|
Force Codex to send or not send reasoning metadata.
|
|`model\_verbosity`|`low | medium | high`|
Optional GPT-5 Responses API verbosity override; when unset, the selected model/preset default is used.
|
|`notice.hide\_full\_access\_warning`|`boolean`|
Track acknowledgement of the full access warning prompt.
|
|`notice.hide\_gpt-5.1-codex-max\_migration\_prompt`|`boolean`|
Track acknowledgement of the gpt-5.1-codex-max migration prompt.
|
|`notice.hide\_gpt5\_1\_migration\_prompt`|`boolean`|
Track acknowledgement of the GPT-5.1 migration prompt.
|
|`notice.hide\_rate\_limit\_model\_nudge`|`boolean`|
Track opt-out of the rate limit model switch reminder.
|
|`notice.hide\_world\_writable\_warning`|`boolean`|
Track acknowledgement of the Windows world-writable directories warning.
|
|`notice.model\_migrations`|`map\<string,string\>`|
Track acknowledged model migrations as old-\>new mappings.
|
|`notify`|`array\<string\>`|
Command invoked for notifications; receives a JSON payload from Codex.
|
|`openai\_base\_url`|`string`|
Base URL override for the built-in `openai` model provider.
|
|`oss\_provider`|`lmstudio | ollama`|
Default local provider used when running with `--oss` (defaults to prompting if unset).
|
|`otel.environment`|`string`|
Environment tag applied to emitted OpenTelemetry events (default: `dev`).
|
|`otel.exporter`|`none | otlp-http | otlp-grpc`|
Select the OpenTelemetry exporter and provide any endpoint metadata.
|
|`otel.exporter.\<id\>.endpoint`|`string`|
Exporter endpoint for OTEL logs.
|
|`otel.exporter.\<id\>.headers`|`map\<string,string\>`|
Static headers included with OTEL exporter requests.
|
|`otel.exporter.\<id\>.protocol`|`binary | json`|
Protocol used by the OTLP/HTTP exporter.
|
|`otel.exporter.\<id\>.tls.ca-certificate`|`string`|
CA certificate path for OTEL exporter TLS.
|
|`otel.exporter.\<id\>.tls.client-certificate`|`string`|
Client certificate path for OTEL exporter TLS.
|
|`otel.exporter.\<id\>.tls.client-private-key`|`string`|
Client private key path for OTEL exporter TLS.
|
|`otel.log\_user\_prompt`|`boolean`|
Opt in to exporting raw user prompts with OpenTelemetry logs.
|
|`otel.metrics\_exporter`|`none | statsig | otlp-http | otlp-grpc`|
Select the OpenTelemetry metrics exporter (defaults to `statsig`).
|
|`otel.trace\_exporter`|`none | otlp-http | otlp-grpc`|
Select the OpenTelemetry trace exporter and provide any endpoint metadata.
|
|`otel.trace\_exporter.\<id\>.endpoint`|`string`|
Trace exporter endpoint for OTEL logs.
|
|`otel.trace\_exporter.\<id\>.headers`|`map\<string,string\>`|
Static headers included with OTEL trace exporter requests.
|
|`otel.trace\_exporter.\<id\>.protocol`|`binary | json`|
Protocol used by the OTLP/HTTP trace exporter.
|
|`otel.trace\_exporter.\<id\>.tls.ca-certificate`|`string`|
CA certificate path for OTEL trace exporter TLS.
|
|`otel.trace\_exporter.\<id\>.tls.client-certificate`|`string`|
Client certificate path for OTEL trace exporter TLS.
|
|`otel.trace\_exporter.\<id\>.tls.client-private-key`|`string`|
Client private key path for OTEL trace exporter TLS.
|
|`permissions.\<name\>.filesystem`|`table`|
Named filesystem permission profile. Each key is an absolute path or special token such as `:minimal` or `:project\_roots`.
|
|`permissions.\<name\>.filesystem.":project\_roots".\<subpath-or-glob\>`|`"read" | "write" | "none"`|
Scoped filesystem access relative to the detected project roots. Use `"."` for the root itself; glob subpaths such as `"\*\*/\*.env"` can deny reads with `"none"`.
|
|`permissions.\<name\>.filesystem.\<path-or-glob\>`|`"read" | "write" | "none" | table`|
Grant direct access for a path, glob pattern, or special token, or scope nested entries under that root. Use `"none"` to deny reads for matching paths.
|
|`permissions.\<name\>.filesystem.glob\_scan\_max\_depth`|`number`|
Maximum depth for expanding deny-read glob patterns on platforms that snapshot matches before sandbox startup. Must be at least `1` when set.
|
|`permissions.\<name\>.network.allow\_local\_binding`|`boolean`|
Permit local bind/listen operations through the managed proxy.
|
|`permissions.\<name\>.network.allow\_upstream\_proxy`|`boolean`|
Allow the managed proxy to chain to another upstream proxy.
|
|`permissions.\<name\>.network.dangerously\_allow\_all\_unix\_sockets`|`boolean`|
Allow the proxy to use arbitrary Unix sockets instead of the default restricted set.
|
|`permissions.\<name\>.network.dangerously\_allow\_non\_loopback\_proxy`|`boolean`|
Permit non-loopback bind addresses for the managed proxy listener.
|
|`permissions.\<name\>.network.domains`|`map\<string, allow | deny\>`|
Domain rules for the managed proxy. Use domain names or wildcard patterns as keys, with `allow` or `deny` values.
|
|`permissions.\<name\>.network.enable\_socks5`|`boolean`|
Expose a SOCKS5 listener when this permissions profile enables the managed network proxy.
|
|`permissions.\<name\>.network.enable\_socks5\_udp`|`boolean`|
Allow UDP over the SOCKS5 listener when enabled.
|
|`permissions.\<name\>.network.enabled`|`boolean`|
Enable network access for this named permissions profile.
|
|`permissions.\<name\>.network.mode`|`limited | full`|
Network proxy mode used for subprocess traffic.
|
|`permissions.\<name\>.network.proxy\_url`|`string`|
HTTP proxy endpoint used when this permissions profile enables the managed network proxy.
|
|`permissions.\<name\>.network.socks\_url`|`string`|
SOCKS5 proxy endpoint used by this permissions profile.
|
|`permissions.\<name\>.network.unix\_sockets`|`map\<string, allow | none\>`|
Unix socket rules for the managed proxy. Use socket paths as keys, with `allow` or `none` values.
|
|`personality`|`none | friendly | pragmatic`|
Default communication style for models that advertise `supportsPersonality`; can be overridden per thread/turn or via `/personality`.
|
|`plan\_mode\_reasoning\_effort`|`none | minimal | low | medium | high | xhigh`|
Plan-mode-specific reasoning override. When unset, Plan mode uses its built-in preset default.
|
|`profile`|`string`|
Default profile applied at startup (equivalent to `--profile`).
|
|`profiles.\<name\>.\*`|`various`|
Profile-scoped overrides for any of the supported configuration keys.
|
|`profiles.\<name\>.analytics.enabled`|`boolean`|
Profile-scoped analytics enablement override.
|
|`profiles.\<name\>.experimental\_use\_unified\_exec\_tool`|`boolean`|
Legacy name for enabling unified exec; prefer `[features].unified\_exec`.
|
|`profiles.\<name\>.model\_catalog\_json`|`string (path)`|
Profile-scoped model catalog JSON path override (applied on startup only; overrides the top-level `model\_catalog\_json` for that profile).
|
|`profiles.\<name\>.model\_instructions\_file`|`string (path)`|
Profile-scoped replacement for the built-in instruction file.
|
|`profiles.\<name\>.oss\_provider`|`lmstudio | ollama`|
Profile-scoped OSS provider for `--oss` sessions.
|
|`profiles.\<name\>.personality`|`none | friendly | pragmatic`|
Profile-scoped communication style override for supported models.
|
|`profiles.\<name\>.plan\_mode\_reasoning\_effort`|`none | minimal | low | medium | high | xhigh`|
Profile-scoped Plan-mode reasoning override.
|
|`profiles.\<name\>.service\_tier`|`flex | fast`|
Profile-scoped service tier preference for new turns.
|
|`profiles.\<name\>.tools\_view\_image`|`boolean`|
Enable or disable the `view\_image` tool in that profile.
|
|`profiles.\<name\>.web\_search`|`disabled | cached | live`|
Profile-scoped web search mode override (default: `"cached"`).
|
|`profiles.\<name\>.windows.sandbox`|`unelevated | elevated`|
Profile-scoped Windows sandbox mode override.
|
|`project\_doc\_fallback\_filenames`|`array\<string\>`|
Additional filenames to try when `AGENTS.md` is missing.
|
|`project\_doc\_max\_bytes`|`number`|
Maximum bytes read from `AGENTS.md` when building project instructions.
|
|`project\_root\_markers`|`array\<string\>`|
List of project root marker filenames; used when searching parent directories for the project root.
|
|`projects.\<path\>.trust\_level`|`string`|
Mark a project or worktree as trusted or untrusted (`"trusted"` | `"untrusted"`). Untrusted projects skip project-scoped `.codex/` layers, including project-local config, hooks, and rules.
|
|`review\_model`|`string`|
Optional model override used by `/review` (defaults to the current session model).
|
|`sandbox\_mode`|`read-only | workspace-write | danger-full-access`|
Sandbox policy for filesystem and network access during command execution.
|
|`sandbox\_workspace\_write.exclude\_slash\_tmp`|`boolean`|
Exclude `/tmp` from writable roots in workspace-write mode.
|
|`sandbox\_workspace\_write.exclude\_tmpdir\_env\_var`|`boolean`|
Exclude `$TMPDIR` from writable roots in workspace-write mode.
|
|`sandbox\_workspace\_write.network\_access`|`boolean`|
Allow outbound network access inside the workspace-write sandbox.
|
|`sandbox\_workspace\_write.writable\_roots`|`array\<string\>`|
Additional writable roots when `sandbox\_mode = "workspace-write"`.
|
|`service\_tier`|`flex | fast`|
Preferred service tier for new turns.
|
|`shell\_environment\_policy.exclude`|`array\<string\>`|
Glob patterns for removing environment variables after the defaults.
|
|`shell\_environment\_policy.experimental\_use\_profile`|`boolean`|
Use the user shell profile when spawning subprocesses.
|
|`shell\_environment\_policy.ignore\_default\_excludes`|`boolean`|
Keep variables containing KEY/SECRET/TOKEN before other filters run.
|
|`shell\_environment\_policy.include\_only`|`array\<string\>`|
Whitelist of patterns; when set only matching variables are kept.
|
|`shell\_environment\_policy.inherit`|`all | core | none`|
Baseline environment inheritance when spawning subprocesses.
|
|`shell\_environment\_policy.set`|`map\<string,string\>`|
Explicit environment overrides injected into every subprocess.
|
|`show\_raw\_agent\_reasoning`|`boolean`|
Surface raw reasoning content when the active model emits it.
|
|`skills.config`|`array\<object\>`|
Per-skill enablement overrides stored in config.toml.
|
|`skills.config.\<index\>.enabled`|`boolean`|
Enable or disable the referenced skill.
|
|`skills.config.\<index\>.path`|`string (path)`|
Path to a skill folder containing `SKILL.md`.
|
|`sqlite\_home`|`string (path)`|
Directory where Codex stores the SQLite-backed state DB used by agent jobs and other resumable runtime state.
|
|`suppress\_unstable\_features\_warning`|`boolean`|
Suppress the warning that appears when under-development feature flags are enabled.
|
|`tool\_output\_token\_limit`|`number`|
Token budget for storing individual tool/function outputs in history.
|
|`tool\_suggest.disabled\_tools`|`array\<table\>`|
Disable suggestions for specific discoverable connectors or plugins. Each entry uses `type = "connector"` or `"plugin"` and an `id`.
|
|`tool\_suggest.discoverables`|`array\<table\>`|
Allow tool suggestions for additional discoverable connectors or plugins. Each entry uses `type = "connector"` or `"plugin"` and an `id`.
|
|`tools.view\_image`|`boolean`|
Enable the local-image attachment tool `view\_image`.
|
|`tools.web\_search`|`boolean | { context\_size = "low|medium|high", allowed\_domains = [string], location = { country, region, city, timezone } }`|
Optional web search tool configuration. The legacy boolean form is still accepted, but the object form lets you set search context size, allowed domains, and approximate user location.
|
|`tui`|`table`|
TUI-specific options such as enabling inline desktop notifications.
|
|`tui.alternate\_screen`|`auto | always | never`|
Control alternate screen usage for the TUI (default: auto; auto skips it in Zellij to preserve scrollback).
|
|`tui.animations`|`boolean`|
Enable terminal animations (welcome screen, shimmer, spinner) (default: true).
|
|`tui.keymap.\<context\>.\<action\>`|`string | array\<string\>`|
Keyboard shortcut binding for a TUI action. Supported contexts include `global`, `chat`, `composer`, `editor`, `pager`, `list`, and `approval`; context-specific bindings override `tui.keymap.global`.
|
|`tui.keymap.\<context\>.\<action\> = []`|`empty array`|
Unbind the action in that keymap context. Key names use normalized strings such as `ctrl-a`, `shift-enter`, or `page-down`.
|
|`tui.model\_availability\_nux.\<model\>`|`integer`|
Internal startup-tooltip state keyed by model slug.
|
|`tui.notification\_condition`|`unfocused | always`|
Control whether TUI notifications fire only when the terminal is unfocused or regardless of focus. Defaults to `unfocused`.
|
|`tui.notification\_method`|`auto | osc9 | bel`|
Notification method for terminal notifications (default: auto).
|
|`tui.notifications`|`boolean | array\<string\>`|
Enable TUI notifications; optionally restrict to specific event types.
|
|`tui.show\_tooltips`|`boolean`|
Show onboarding tooltips in the TUI welcome screen (default: true).
|
|`tui.status\_line`|`array\<string\> | null`|
Ordered list of TUI footer status-line item identifiers. `null` disables the status line.
|
|`tui.terminal\_title`|`array\<string\> | null`|
Ordered list of terminal window/tab title item identifiers. Defaults to `["spinner", "project"]`; `null` disables title updates.
|
|`tui.theme`|`string`|
Syntax-highlighting theme override (kebab-case theme name).
|
|`web\_search`|`disabled | cached | live`|
Web search mode (default: `"cached"`; cached uses an OpenAI-maintained index and does not fetch live pages; if you use `--yolo` or another full access sandbox setting, it defaults to `"live"`). Use `"live"` to fetch the most recent data from the web, or `"disabled"` to remove the tool.
|
|`windows\_wsl\_setup\_acknowledged`|`boolean`|
Track Windows onboarding acknowledgement (Windows only).
|
|`windows.sandbox`|`unelevated | elevated`|
Windows-only native sandbox mode when running Codex natively on Windows.
|
|`windows.sandbox\_private\_desktop`|`boolean`|
Run the final sandboxed child process on a private desktop by default on native Windows. Set `false` only for compatibility with the older `Winsta0\\\\Default` behavior.
|
Key
`agents.\<name\>.config\_file`
Type / Values
`string (path)`
Details
Path to a TOML config layer for that role; relative paths resolve from the config file that declares the role.
Key
`agents.\<name\>.description`
Type / Values
`string`
Details
Role guidance shown to Codex when choosing and spawning that agent type.
Key
`agents.\<name\>.nickname\_candidates`
Type / Values
`array\<string\>`
Details
Optional pool of display nicknames for spawned agents in that role.
Key
`agents.job\_max\_runtime\_seconds`
Type / Values
`number`
Details
Default per-worker timeout for `spawn\_agents\_on\_csv` jobs. When unset, the tool falls back to 1800 seconds per worker.
Key
`agents.max\_depth`
Type / Values
`number`
Details
Maximum nesting depth allowed for spawned agent threads (root sessions start at depth 0; default: 1).
Key
`agents.max\_threads`
Type / Values
`number`
Details
Maximum number of agent threads that can be open concurrently. Defaults to `6` when unset.
Key
`allow\_login\_shell`
Type / Values
`boolean`
Details
Allow shell-based tools to use login-shell semantics. Defaults to `true`; when `false`, `login = true` requests are rejected and omitted `login` defaults to non-login shells.
Key
`analytics.enabled`
Type / Values
`boolean`
Details
Enable or disable analytics for this machine/profile. When unset, the client default applies.
Key
`approval\_policy`
Type / Values
`untrusted | on-request | never | { granular = { sandbox\_approval = bool, rules = bool, mcp\_elicitations = bool, request\_permissions = bool, skill\_approval = bool } }`
Details
Controls when Codex pauses for approval before executing commands. You can also use `approval\_policy = { granular = { ... } }` to allow or auto-reject specific prompt categories while keeping other prompts interactive. `on-failure` is deprecated; use `on-request` for interactive runs or `never` for non-interactive runs.
Key
`approval\_policy.granular.mcp\_elicitations`
Type / Values
`boolean`
Details
When `true`, MCP elicitation prompts are allowed to surface instead of being auto-rejected.
Key
`approval\_policy.granular.request\_permissions`
Type / Values
`boolean`
Details
When `true`, prompts from the `request\_permissions` tool are allowed to surface.
Key
`approval\_policy.granular.rules`
Type / Values
`boolean`
Details
When `true`, approvals triggered by execpolicy `prompt` rules are allowed to surface.
Key
`approval\_policy.granular.sandbox\_approval`
Type / Values
`boolean`
Details
When `true`, sandbox escalation approval prompts are allowed to surface.
Key
`approval\_policy.granular.skill\_approval`
Type / Values
`boolean`
Details
When `true`, skill-script approval prompts are allowed to surface.
Key
`approvals\_reviewer`
Type / Values
`user | auto\_review`
Details
Who reviews eligible approval prompts under `on-request` or granular approval policies. Defaults to `user`; `auto\_review` uses the reviewer subagent. This setting doesn't change sandboxing or review actions already allowed inside the sandbox.
Key
`apps.\_default.destructive\_enabled`
Type / Values
`boolean`
Details
Default allow/deny for app tools with `destructive\_hint = true`.
Key
`apps.\_default.enabled`
Type / Values
`boolean`
Details
Default app enabled state for all apps unless overridden per app.
Key
`apps.\_default.open\_world\_enabled`
Type / Values
`boolean`
Details
Default allow/deny for app tools with `open\_world\_hint = true`.
Key
`apps.\<id\>.default\_tools\_approval\_mode`
Type / Values
`auto | prompt | approve`
Details
Default approval behavior for tools in this app unless a per-tool override exists.
Key
`apps.\<id\>.default\_tools\_enabled`
Type / Values
`boolean`
Details
Default enabled state for tools in this app unless a per-tool override exists.
Key
`apps.\<id\>.destructive\_enabled`
Type / Values
`boolean`
Details
Allow or block tools in this app that advertise `destructive\_hint = true`.
Key
`apps.\<id\>.enabled`
Type / Values
`boolean`
Details
Enable or disable a specific app/connector by id (default: true).
Key
`apps.\<id\>.open\_world\_enabled`
Type / Values
`boolean`
Details
Allow or block tools in this app that advertise `open\_world\_hint = true`.
Key
`apps.\<id\>.tools.\<tool\>.approval\_mode`
Type / Values
`auto | prompt | approve`
Details
Per-tool approval behavior override for a single app tool.
Key
`apps.\<id\>.tools.\<tool\>.enabled`
Type / Values
`boolean`
Details
Per-tool enabled override for an app tool (for example `repos/list`).
Key
`auto\_review.policy`
Type / Values
`string`
Details
Local Markdown policy instructions for automatic review. Managed `guardian\_policy\_config` takes precedence. Blank values are ignored.
Key
`background\_terminal\_max\_timeout`
Type / Values
`number`
Details
Maximum poll window in milliseconds for empty `write\_stdin` polls (background terminal polling). Default: `300000` (5 minutes). Replaces the older `background\_terminal\_timeout` key.
Key
`chatgpt\_base\_url`
Type / Values
`string`
Details
Override the base URL used during the ChatGPT login flow.
Key
`check\_for\_update\_on\_startup`
Type / Values
`boolean`
Details
Check for Codex updates on startup (set to false only when updates are centrally managed).
Key
`cli\_auth\_credentials\_store`
Type / Values
`file | keyring | auto`
Details
Control where the CLI stores cached credentials (file-based auth.json vs OS keychain).
Key
`commit\_attribution`
Type / Values
`string`
Details
Override the commit co-author trailer text. Set an empty string to disable automatic attribution.
Key
`compact\_prompt`
Type / Values
`string`
Details
Inline override for the history compaction prompt.
Key
`default\_permissions`
Type / Values
`string`
Details
Name of the default permissions profile to apply to sandboxed tool calls. Built-ins are `:read-only`, `:workspace`, and `:danger-no-sandbox`; custom profile names require matching `[permissions.\<name\>]` tables.
Key
`developer\_instructions`
Type / Values
`string`
Details
Additional developer instructions injected into the session (optional).
Key
`disable\_paste\_burst`
Type / Values
`boolean`
Details
Disable burst-paste detection in the TUI.
Key
`experimental\_compact\_prompt\_file`
Type / Values
`string (path)`
Details
Load the compaction prompt override from a file (experimental).
Key
`experimental\_use\_unified\_exec\_tool`
Type / Values
`boolean`
Details
Legacy name for enabling unified exec; prefer `[features].unified\_exec` or `codex --enable unified\_exec`.
Key
`features.apps`
Type / Values
`boolean`
Details
Enable ChatGPT Apps/connectors support (experimental).
Key
`features.codex\_hooks`
Type / Values
`boolean`
Details
Enable lifecycle hooks loaded from `hooks.json` or inline `[hooks]` config.
Key
`features.enable\_request\_compression`
Type / Values
`boolean`
Details
Compress streaming request bodies with zstd when supported (stable; on by default).
Key
`features.fast\_mode`
Type / Values
`boolean`
Details
Enable Fast mode selection and the `service\_tier = "fast"` path (stable; on by default).
Key
`features.memories`
Type / Values
`boolean`
Details
Enable [Memories](/codex/memories) (off by default).
Key
`features.multi\_agent`
Type / Values
`boolean`
Details
Enable multi-agent collaboration tools (`spawn\_agent`, `send\_input`, `resume\_agent`, `wait\_agent`, and `close\_agent`) (stable; on by default).
Key
`features.personality`
Type / Values
`boolean`
Details
Enable personality selection controls (stable; on by default).
Key
`features.prevent\_idle\_sleep`
Type / Values
`boolean`
Details
Prevent the machine from sleeping while a turn is actively running (experimental; off by default).
Key
`features.shell\_snapshot`
Type / Values
`boolean`
Details
Snapshot shell environment to speed up repeated commands (stable; on by default).
Key
`features.shell\_tool`
Type / Values
`boolean`
Details
Enable the default `shell` tool for running commands (stable; on by default).
Key
`features.skill\_mcp\_dependency\_install`
Type / Values
`boolean`
Details
Allow prompting and installing missing MCP dependencies for skills (stable; on by default).
Key
`features.undo`
Type / Values
`boolean`
Details
Enable undo support (stable; off by default).
Key
`features.unified\_exec`
Type / Values
`boolean`
Details
Use the unified PTY-backed exec tool (stable; enabled by default except on Windows).
Key
`features.web\_search`
Type / Values
`boolean`
Details
Deprecated legacy toggle; prefer the top-level `web\_search` setting.
Key
`features.web\_search\_cached`
Type / Values
`boolean`
Details
Deprecated legacy toggle. When `web\_search` is unset, true maps to `web\_search = "cached"`.
Key
`features.web\_search\_request`
Type / Values
`boolean`
Details
Deprecated legacy toggle. When `web\_search` is unset, true maps to `web\_search = "live"`.
Key
`feedback.enabled`
Type / Values
`boolean`
Details
Enable feedback submission via `/feedback` across Codex surfaces (default: true).
Key
`file\_opener`
Type / Values
`vscode | vscode-insiders | windsurf | cursor | none`
Details
URI scheme used to open citations from Codex output (default: `vscode`).
Key
`forced\_chatgpt\_workspace\_id`
Type / Values
`string (uuid)`
Details
Limit ChatGPT logins to a specific workspace identifier.
Key
`forced\_login\_method`
Type / Values
`chatgpt | api`
Details
Restrict Codex to a specific authentication method.
Key
`hide\_agent\_reasoning`
Type / Values
`boolean`
Details
Suppress reasoning events in both the TUI and `codex exec` output.
Key
`history.max\_bytes`
Type / Values
`number`
Details
If set, caps the history file size in bytes by dropping oldest entries.
Key
`history.persistence`
Type / Values
`save-all | none`
Details
Control whether Codex saves session transcripts to history.jsonl.
Key
`hooks`
Type / Values
`table`
Details
Lifecycle hooks configured inline in `config.toml`. Uses the same event schema as `hooks.json`; see the Hooks guide for examples and supported events.
Key
`instructions`
Type / Values
`string`
Details
Reserved for future use; prefer `model\_instructions\_file` or `AGENTS.md`.
Key
`log\_dir`
Type / Values
`string (path)`
Details
Directory where Codex writes log files (for example `codex-tui.log`); defaults to `$CODEX\_HOME/log`.
Key
`mcp\_oauth\_callback\_port`
Type / Values
`integer`
Details
Optional fixed port for the local HTTP callback server used during MCP OAuth login. When unset, Codex binds to an ephemeral port chosen by the OS.
Key
`mcp\_oauth\_callback\_url`
Type / Values
`string`
Details
Optional redirect URI override for MCP OAuth login (for example, a devbox ingress URL). `mcp\_oauth\_callback\_port` still controls the callback listener port.
Key
`mcp\_oauth\_credentials\_store`
Type / Values
`auto | file | keyring`
Details
Preferred store for MCP OAuth credentials.
Key
`mcp\_servers.\<id\>.args`
Type / Values
`array\<string\>`
Details
Arguments passed to the MCP stdio server command.
Key
`mcp\_servers.\<id\>.bearer\_token\_env\_var`
Type / Values
`string`
Details
Environment variable sourcing the bearer token for an MCP HTTP server.
Key
`mcp\_servers.\<id\>.command`
Type / Values
`string`
Details
Launcher command for an MCP stdio server.
Key
`mcp\_servers.\<id\>.cwd`
Type / Values
`string`
Details
Working directory for the MCP stdio server process.
Key
`mcp\_servers.\<id\>.disabled\_tools`
Type / Values
`array\<string\>`
Details
Deny list applied after `enabled\_tools` for the MCP server.
Key
`mcp\_servers.\<id\>.enabled`
Type / Values
`boolean`
Details
Disable an MCP server without removing its configuration.
Key
`mcp\_servers.\<id\>.enabled\_tools`
Type / Values
`array\<string\>`
Details
Allow list of tool names exposed by the MCP server.
Key
`mcp\_servers.\<id\>.env`
Type / Values
`map\<string,string\>`
Details
Environment variables forwarded to the MCP stdio server.
Key
`mcp\_servers.\<id\>.env\_http\_headers`
Type / Values
`map\<string,string\>`
Details
HTTP headers populated from environment variables for an MCP HTTP server.
Key
`mcp\_servers.\<id\>.env\_vars`
Type / Values
`array\<string | { name = string, source = "local" | "remote" }\>`
Details
Additional environment variables to whitelist for an MCP stdio server. String entries default to `source = "local"`; use `source = "remote"` only with executor-backed remote stdio.
Key
`mcp\_servers.\<id\>.experimental\_environment`
Type / Values
`local | remote`
Details
Experimental placement for an MCP server. `remote` starts stdio servers through a remote executor environment; streamable HTTP remote placement is not implemented.
Key
`mcp\_servers.\<id\>.http\_headers`
Type / Values
`map\<string,string\>`
Details
Static HTTP headers included with each MCP HTTP request.
Key
`mcp\_servers.\<id\>.oauth\_resource`
Type / Values
`string`
Details
Optional RFC 8707 OAuth resource parameter to include during MCP login.
Key
`mcp\_servers.\<id\>.required`
Type / Values
`boolean`
Details
When true, fail startup/resume if this enabled MCP server cannot initialize.
Key
`mcp\_servers.\<id\>.scopes`
Type / Values
`array\<string\>`
Details
OAuth scopes to request when authenticating to that MCP server.
Key
`mcp\_servers.\<id\>.startup\_timeout\_ms`
Type / Values
`number`
Details
Alias for `startup\_timeout\_sec` in milliseconds.
Key
`mcp\_servers.\<id\>.startup\_timeout\_sec`
Type / Values
`number`
Details
Override the default 10s startup timeout for an MCP server.
Key
`mcp\_servers.\<id\>.tool\_timeout\_sec`
Type / Values
`number`
Details
Override the default 60s per-tool timeout for an MCP server.
Key
`mcp\_servers.\<id\>.url`
Type / Values
`string`
Details
Endpoint for an MCP streamable HTTP server.
Key
`memories.consolidation\_model`
Type / Values
`string`
Details
Optional model override for global memory consolidation.
Key
`memories.disable\_on\_external\_context`
Type / Values
`boolean`
Details
When `true`, threads that use external context such as MCP tool calls, web search, or tool search are kept out of memory generation. Defaults to `false`. Legacy alias: `memories.no\_memories\_if\_mcp\_or\_web\_search`.
Key
`memories.extract\_model`
Type / Values
`string`
Details
Optional model override for per-thread memory extraction.
Key
`memories.generate\_memories`
Type / Values
`boolean`
Details
When `false`, newly created threads are not stored as memory-generation inputs. Defaults to `true`.
Key
`memories.max\_raw\_memories\_for\_consolidation`
Type / Values
`number`
Details
Maximum recent raw memories retained for global consolidation. Defaults to `256` and is capped at `4096`.
Key
`memories.max\_rollout\_age\_days`
Type / Values
`number`
Details
Maximum age of threads considered for memory generation. Defaults to `30` and is clamped to `0`-`90`.
Key
`memories.max\_rollouts\_per\_startup`
Type / Values
`number`
Details
Maximum rollout candidates processed per startup pass. Defaults to `16` and is capped at `128`.
Key
`memories.max\_unused\_days`
Type / Values
`number`
Details
Maximum days since a memory was last used before it becomes ineligible for consolidation. Defaults to `30` and is clamped to `0`-`365`.
Key
`memories.min\_rate\_limit\_remaining\_percent`
Type / Values
`number`
Details
Minimum remaining percentage required in Codex rate-limit windows before memory generation starts. Defaults to `25` and is clamped to `0`-`100`.
Key
`memories.min\_rollout\_idle\_hours`
Type / Values
`number`
Details
Minimum idle time before a thread is considered for memory generation. Defaults to `6` and is clamped to `1`-`48`.
Key
`memories.use\_memories`
Type / Values
`boolean`
Details
When `false`, Codex skips injecting existing memories into future sessions. Defaults to `true`.
Key
`model`
Type / Values
`string`
Details
Model to use (e.g., `gpt-5.5`).
Key
`model\_auto\_compact\_token\_limit`
Type / Values
`number`
Details
Token threshold that triggers automatic history compaction (unset uses model defaults).
Key
`model\_catalog\_json`
Type / Values
`string (path)`
Details
Optional path to a JSON model catalog loaded on startup. Profile-level `profiles.\<name\>.model\_catalog\_json` can override this per profile.
Key
`model\_context\_window`
Type / Values
`number`
Details
Context window tokens available to the active model.
Key
`model\_instructions\_file`
Type / Values
`string (path)`
Details
Replacement for built-in instructions instead of `AGENTS.md`.
Key
`model\_provider`
Type / Values
`string`
Details
Provider id from `model\_providers` (default: `openai`).
Key
`model\_providers.\<id\>`
Type / Values
`table`
Details
Custom provider definition. Built-in provider IDs (`openai`, `ollama`, and `lmstudio`) are reserved and cannot be overridden.
Key
`model\_providers.\<id\>.auth`
Type / Values
`table`
Details
Command-backed bearer token configuration for a custom provider. Do not combine with `env\_key`, `experimental\_bearer\_token`, or `requires\_openai\_auth`.
Key
`model\_providers.\<id\>.auth.args`
Type / Values
`array\<string\>`
Details
Arguments passed to the token command.
Key
`model\_providers.\<id\>.auth.command`
Type / Values
`string`
Details
Command to run when Codex needs a bearer token. The command must print the token to stdout.
Key
`model\_providers.\<id\>.auth.cwd`
Type / Values
`string (path)`
Details
Working directory for the token command.
Key
`model\_providers.\<id\>.auth.refresh\_interval\_ms`
Type / Values
`number`
Details
How often Codex proactively refreshes the token in milliseconds (default: 300000). Set to `0` to refresh only after an authentication retry.
Key
`model\_providers.\<id\>.auth.timeout\_ms`
Type / Values
`number`
Details
Maximum token command runtime in milliseconds (default: 5000).
Key
`model\_providers.\<id\>.base\_url`
Type / Values
`string`
Details
API base URL for the model provider.
Key
`model\_providers.\<id\>.env\_http\_headers`
Type / Values
`map\<string,string\>`
Details
HTTP headers populated from environment variables when present.
Key
`model\_providers.\<id\>.env\_key`
Type / Values
`string`
Details
Environment variable supplying the provider API key.
Key
`model\_providers.\<id\>.env\_key\_instructions`
Type / Values
`string`
Details
Optional setup guidance for the provider API key.
Key
`model\_providers.\<id\>.experimental\_bearer\_token`
Type / Values
`string`
Details
Direct bearer token for the provider (discouraged; use `env\_key`).
Key
`model\_providers.\<id\>.http\_headers`
Type / Values
`map\<string,string\>`
Details
Static HTTP headers added to provider requests.
Key
`model\_providers.\<id\>.name`
Type / Values
`string`
Details
Display name for a custom model provider.
Key
`model\_providers.\<id\>.query\_params`
Type / Values
`map\<string,string\>`
Details
Extra query parameters appended to provider requests.
Key
`model\_providers.\<id\>.request\_max\_retries`
Type / Values
`number`
Details
Retry count for HTTP requests to the provider (default: 4).
Key
`model\_providers.\<id\>.requires\_openai\_auth`
Type / Values
`boolean`
Details
The provider uses OpenAI authentication (defaults to false).
Key
`model\_providers.\<id\>.stream\_idle\_timeout\_ms`
Type / Values
`number`
Details
Idle timeout for SSE streams in milliseconds (default: 300000).
Key
`model\_providers.\<id\>.stream\_max\_retries`
Type / Values
`number`
Details
Retry count for SSE streaming interruptions (default: 5).
Key
`model\_providers.\<id\>.supports\_websockets`
Type / Values
`boolean`
Details
Whether that provider supports the Responses API WebSocket transport.
Key
`model\_providers.\<id\>.wire\_api`
Type / Values
`responses`
Details
Protocol used by the provider. `responses` is the only supported value, and it is the default when omitted.
Key
`model\_providers.amazon-bedrock.aws.profile`
Type / Values
`string`
Details
AWS profile name used by the built-in `amazon-bedrock` provider.
Key
`model\_providers.amazon-bedrock.aws.region`
Type / Values
`string`
Details
AWS region used by the built-in `amazon-bedrock` provider.
Key
`model\_reasoning\_effort`
Type / Values
`minimal | low | medium | high | xhigh`
Details
Adjust reasoning effort for supported models (Responses API only; `xhigh` is model-dependent).
Key
`model\_reasoning\_summary`
Type / Values
`auto | concise | detailed | none`
Details
Select reasoning summary detail or disable summaries entirely.
Key
`model\_supports\_reasoning\_summaries`
Type / Values
`boolean`
Details
Force Codex to send or not send reasoning metadata.
Key
`model\_verbosity`
Type / Values
`low | medium | high`
Details
Optional GPT-5 Responses API verbosity override; when unset, the selected model/preset default is used.
Key
`notice.hide\_full\_access\_warning`
Type / Values
`boolean`
Details
Track acknowledgement of the full access warning prompt.
Key
`notice.hide\_gpt-5.1-codex-max\_migration\_prompt`
Type / Values
`boolean`
Details
Track acknowledgement of the gpt-5.1-codex-max migration prompt.
Key
`notice.hide\_gpt5\_1\_migration\_prompt`
Type / Values
`boolean`
Details
Track acknowledgement of the GPT-5.1 migration prompt.
Key
`notice.hide\_rate\_limit\_model\_nudge`
Type / Values
`boolean`
Details
Track opt-out of the rate limit model switch reminder.
Key
`notice.hide\_world\_writable\_warning`
Type / Values
`boolean`
Details
Track acknowledgement of the Windows world-writable directories warning.
Key
`notice.model\_migrations`
Type / Values
`map\<string,string\>`
Details
Track acknowledged model migrations as old-\>new mappings.
Key
`notify`
Type / Values
`array\<string\>`
Details
Command invoked for notifications; receives a JSON payload from Codex.
Key
`openai\_base\_url`
Type / Values
`string`
Details
Base URL override for the built-in `openai` model provider.
Key
`oss\_provider`
Type / Values
`lmstudio | ollama`
Details
Default local provider used when running with `--oss` (defaults to prompting if unset).
Key
`otel.environment`
Type / Values
`string`
Details
Environment tag applied to emitted OpenTelemetry events (default: `dev`).
Key
`otel.exporter`
Type / Values
`none | otlp-http | otlp-grpc`
Details
Select the OpenTelemetry exporter and provide any endpoint metadata.
Key
`otel.exporter.\<id\>.endpoint`
Type / Values
`string`
Details
Exporter endpoint for OTEL logs.
Key
`otel.exporter.\<id\>.headers`
Type / Values
`map\<string,string\>`
Details
Static headers included with OTEL exporter requests.
Key
`otel.exporter.\<id\>.protocol`
Type / Values
`binary | json`
Details
Protocol used by the OTLP/HTTP exporter.
Key
`otel.exporter.\<id\>.tls.ca-certificate`
Type / Values
`string`
Details
CA certificate path for OTEL exporter TLS.
Key
`otel.exporter.\<id\>.tls.client-certificate`
Type / Values
`string`
Details
Client certificate path for OTEL exporter TLS.
Key
`otel.exporter.\<id\>.tls.client-private-key`
Type / Values
`string`
Details
Client private key path for OTEL exporter TLS.
Key
`otel.log\_user\_prompt`
Type / Values
`boolean`
Details
Opt in to exporting raw user prompts with OpenTelemetry logs.
Key
`otel.metrics\_exporter`
Type / Values
`none | statsig | otlp-http | otlp-grpc`
Details
Select the OpenTelemetry metrics exporter (defaults to `statsig`).
Key
`otel.trace\_exporter`
Type / Values
`none | otlp-http | otlp-grpc`
Details
Select the OpenTelemetry trace exporter and provide any endpoint metadata.
Key
`otel.trace\_exporter.\<id\>.endpoint`
Type / Values
`string`
Details
Trace exporter endpoint for OTEL logs.
Key
`otel.trace\_exporter.\<id\>.headers`
Type / Values
`map\<string,string\>`
Details
Static headers included with OTEL trace exporter requests.
Key
`otel.trace\_exporter.\<id\>.protocol`
Type / Values
`binary | json`
Details
Protocol used by the OTLP/HTTP trace exporter.
Key
`otel.trace\_exporter.\<id\>.tls.ca-certificate`
Type / Values
`string`
Details
CA certificate path for OTEL trace exporter TLS.
Key
`otel.trace\_exporter.\<id\>.tls.client-certificate`
Type / Values
`string`
Details
Client certificate path for OTEL trace exporter TLS.
Key
`otel.trace\_exporter.\<id\>.tls.client-private-key`
Type / Values
`string`
Details
Client private key path for OTEL trace exporter TLS.
Key
`permissions.\<name\>.filesystem`
Type / Values
`table`
Details
Named filesystem permission profile. Each key is an absolute path or special token such as `:minimal` or `:project\_roots`.
Key
`permissions.\<name\>.filesystem.":project\_roots".\<subpath-or-glob\>`
Type / Values
`"read" | "write" | "none"`
Details
Scoped filesystem access relative to the detected project roots. Use `"."` for the root itself; glob subpaths such as `"\*\*/\*.env"` can deny reads with `"none"`.
Key
`permissions.\<name\>.filesystem.\<path-or-glob\>`
Type / Values
`"read" | "write" | "none" | table`
Details
Grant direct access for a path, glob pattern, or special token, or scope nested entries under that root. Use `"none"` to deny reads for matching paths.
Key
`permissions.\<name\>.filesystem.glob\_scan\_max\_depth`
Type / Values
`number`
Details
Maximum depth for expanding deny-read glob patterns on platforms that snapshot matches before sandbox startup. Must be at least `1` when set.
Key
`permissions.\<name\>.network.allow\_local\_binding`
Type / Values
`boolean`
Details
Permit local bind/listen operations through the managed proxy.
Key
`permissions.\<name\>.network.allow\_upstream\_proxy`
Type / Values
`boolean`
Details
Allow the managed proxy to chain to another upstream proxy.
Key
`permissions.\<name\>.network.dangerously\_allow\_all\_unix\_sockets`
Type / Values
`boolean`
Details
Allow the proxy to use arbitrary Unix sockets instead of the default restricted set.
Key
`permissions.\<name\>.network.dangerously\_allow\_non\_loopback\_proxy`
Type / Values
`boolean`
Details
Permit non-loopback bind addresses for the managed proxy listener.
Key
`permissions.\<name\>.network.domains`
Type / Values
`map\<string, allow | deny\>`
Details
Domain rules for the managed proxy. Use domain names or wildcard patterns as keys, with `allow` or `deny` values.
Key
`permissions.\<name\>.network.enable\_socks5`
Type / Values
`boolean`
Details
Expose a SOCKS5 listener when this permissions profile enables the managed network proxy.
Key
`permissions.\<name\>.network.enable\_socks5\_udp`
Type / Values
`boolean`
Details
Allow UDP over the SOCKS5 listener when enabled.
Key
`permissions.\<name\>.network.enabled`
Type / Values
`boolean`
Details
Enable network access for this named permissions profile.
Key
`permissions.\<name\>.network.mode`
Type / Values
`limited | full`
Details
Network proxy mode used for subprocess traffic.
Key
`permissions.\<name\>.network.proxy\_url`
Type / Values
`string`
Details
HTTP proxy endpoint used when this permissions profile enables the managed network proxy.
Key
`permissions.\<name\>.network.socks\_url`
Type / Values
`string`
Details
SOCKS5 proxy endpoint used by this permissions profile.
Key
`permissions.\<name\>.network.unix\_sockets`
Type / Values
`map\<string, allow | none\>`
Details
Unix socket rules for the managed proxy. Use socket paths as keys, with `allow` or `none` values.
Key
`personality`
Type / Values
`none | friendly | pragmatic`
Details
Default communication style for models that advertise `supportsPersonality`; can be overridden per thread/turn or via `/personality`.
Key
`plan\_mode\_reasoning\_effort`
Type / Values
`none | minimal | low | medium | high | xhigh`
Details
Plan-mode-specific reasoning override. When unset, Plan mode uses its built-in preset default.
Key
`profile`
Type / Values
`string`
Details
Default profile applied at startup (equivalent to `--profile`).
Key
`profiles.\<name\>.\*`
Type / Values
`various`
Details
Profile-scoped overrides for any of the supported configuration keys.
Key
`profiles.\<name\>.analytics.enabled`
Type / Values
`boolean`
Details
Profile-scoped analytics enablement override.
Key
`profiles.\<name\>.experimental\_use\_unified\_exec\_tool`
Type / Values
`boolean`
Details
Legacy name for enabling unified exec; prefer `[features].unified\_exec`.
Key
`profiles.\<name\>.model\_catalog\_json`
Type / Values
`string (path)`
Details
Profile-scoped model catalog JSON path override (applied on startup only; overrides the top-level `model\_catalog\_json` for that profile).
Key
`profiles.\<name\>.model\_instructions\_file`
Type / Values
`string (path)`
Details
Profile-scoped replacement for the built-in instruction file.
Key
`profiles.\<name\>.oss\_provider`
Type / Values
`lmstudio | ollama`
Details
Profile-scoped OSS provider for `--oss` sessions.
Key
`profiles.\<name\>.personality`
Type / Values
`none | friendly | pragmatic`
Details
Profile-scoped communication style override for supported models.
Key
`profiles.\<name\>.plan\_mode\_reasoning\_effort`
Type / Values
`none | minimal | low | medium | high | xhigh`
Details
Profile-scoped Plan-mode reasoning override.
Key
`profiles.\<name\>.service\_tier`
Type / Values
`flex | fast`
Details
Profile-scoped service tier preference for new turns.
Key
`profiles.\<name\>.tools\_view\_image`
Type / Values
`boolean`
Details
Enable or disable the `view\_image` tool in that profile.
Key
`profiles.\<name\>.web\_search`
Type / Values
`disabled | cached | live`
Details
Profile-scoped web search mode override (default: `"cached"`).
Key
`profiles.\<name\>.windows.sandbox`
Type / Values
`unelevated | elevated`
Details
Profile-scoped Windows sandbox mode override.
Key
`project\_doc\_fallback\_filenames`
Type / Values
`array\<string\>`
Details
Additional filenames to try when `AGENTS.md` is missing.
Key
`project\_doc\_max\_bytes`
Type / Values
`number`
Details
Maximum bytes read from `AGENTS.md` when building project instructions.
Key
`project\_root\_markers`
Type / Values
`array\<string\>`
Details
List of project root marker filenames; used when searching parent directories for the project root.
Key
`projects.\<path\>.trust\_level`
Type / Values
`string`
Details
Mark a project or worktree as trusted or untrusted (`"trusted"` | `"untrusted"`). Untrusted projects skip project-scoped `.codex/` layers, including project-local config, hooks, and rules.
Key
`review\_model`
Type / Values
`string`
Details
Optional model override used by `/review` (defaults to the current session model).
Key
`sandbox\_mode`
Type / Values
`read-only | workspace-write | danger-full-access`
Details
Sandbox policy for filesystem and network access during command execution.
Key
`sandbox\_workspace\_write.exclude\_slash\_tmp`
Type / Values
`boolean`
Details
Exclude `/tmp` from writable roots in workspace-write mode.
Key
`sandbox\_workspace\_write.exclude\_tmpdir\_env\_var`
Type / Values
`boolean`
Details
Exclude `$TMPDIR` from writable roots in workspace-write mode.
Key
`sandbox\_workspace\_write.network\_access`
Type / Values
`boolean`
Details
Allow outbound network access inside the workspace-write sandbox.
Key
`sandbox\_workspace\_write.writable\_roots`
Type / Values
`array\<string\>`
Details
Additional writable roots when `sandbox\_mode = "workspace-write"`.
Key
`service\_tier`
Type / Values
`flex | fast`
Details
Preferred service tier for new turns.
Key
`shell\_environment\_policy.exclude`
Type / Values
`array\<string\>`
Details
Glob patterns for removing environment variables after the defaults.
Key
`shell\_environment\_policy.experimental\_use\_profile`
Type / Values
`boolean`
Details
Use the user shell profile when spawning subprocesses.
Key
`shell\_environment\_policy.ignore\_default\_excludes`
Type / Values
`boolean`
Details
Keep variables containing KEY/SECRET/TOKEN before other filters run.
Key
`shell\_environment\_policy.include\_only`
Type / Values
`array\<string\>`
Details
Whitelist of patterns; when set only matching variables are kept.
Key
`shell\_environment\_policy.inherit`
Type / Values
`all | core | none`
Details
Baseline environment inheritance when spawning subprocesses.
Key
`shell\_environment\_policy.set`
Type / Values
`map\<string,string\>`
Details
Explicit environment overrides injected into every subprocess.
Key
`show\_raw\_agent\_reasoning`
Type / Values
`boolean`
Details
Surface raw reasoning content when the active model emits it.
Key
`skills.config`
Type / Values
`array\<object\>`
Details
Per-skill enablement overrides stored in config.toml.
Key
`skills.config.\<index\>.enabled`
Type / Values
`boolean`
Details
Enable or disable the referenced skill.
Key
`skills.config.\<index\>.path`
Type / Values
`string (path)`
Details
Path to a skill folder containing `SKILL.md`.
Key
`sqlite\_home`
Type / Values
`string (path)`
Details
Directory where Codex stores the SQLite-backed state DB used by agent jobs and other resumable runtime state.
Key
`suppress\_unstable\_features\_warning`
Type / Values
`boolean`
Details
Suppress the warning that appears when under-development feature flags are enabled.
Key
`tool\_output\_token\_limit`
Type / Values
`number`
Details
Token budget for storing individual tool/function outputs in history.
Key
`tool\_suggest.disabled\_tools`
Type / Values
`array\<table\>`
Details
Disable suggestions for specific discoverable connectors or plugins. Each entry uses `type = "connector"` or `"plugin"` and an `id`.
Key
`tool\_suggest.discoverables`
Type / Values
`array\<table\>`
Details
Allow tool suggestions for additional discoverable connectors or plugins. Each entry uses `type = "connector"` or `"plugin"` and an `id`.
Key
`tools.view\_image`
Type / Values
`boolean`
Details
Enable the local-image attachment tool `view\_image`.
Key
`tools.web\_search`
Type / Values
`boolean | { context\_size = "low|medium|high", allowed\_domains = [string], location = { country, region, city, timezone } }`
Details
Optional web search tool configuration. The legacy boolean form is still accepted, but the object form lets you set search context size, allowed domains, and approximate user location.
Key
`tui`
Type / Values
`table`
Details
TUI-specific options such as enabling inline desktop notifications.
Key
`tui.alternate\_screen`
Type / Values
`auto | always | never`
Details
Control alternate screen usage for the TUI (default: auto; auto skips it in Zellij to preserve scrollback).
Key
`tui.animations`
Type / Values
`boolean`
Details
Enable terminal animations (welcome screen, shimmer, spinner) (default: true).
Key
`tui.keymap.\<context\>.\<action\>`
Type / Values
`string | array\<string\>`
Details
Keyboard shortcut binding for a TUI action. Supported contexts include `global`, `chat`, `composer`, `editor`, `pager`, `list`, and `approval`; context-specific bindings override `tui.keymap.global`.
Key
`tui.keymap.\<context\>.\<action\> = []`
Type / Values
`empty array`
Details
Unbind the action in that keymap context. Key names use normalized strings such as `ctrl-a`, `shift-enter`, or `page-down`.
Key
`tui.model\_availability\_nux.\<model\>`
Type / Values
`integer`
Details
Internal startup-tooltip state keyed by model slug.
Key
`tui.notification\_condition`
Type / Values
`unfocused | always`
Details
Control whether TUI notifications fire only when the terminal is unfocused or regardless of focus. Defaults to `unfocused`.
Key
`tui.notification\_method`
Type / Values
`auto | osc9 | bel`
Details
Notification method for terminal notifications (default: auto).
Key
`tui.notifications`
Type / Values
`boolean | array\<string\>`
Details
Enable TUI notifications; optionally restrict to specific event types.
Key
`tui.show\_tooltips`
Type / Values
`boolean`
Details
Show onboarding tooltips in the TUI welcome screen (default: true).
Key
`tui.status\_line`
Type / Values
`array\<string\> | null`
Details
Ordered list of TUI footer status-line item identifiers. `null` disables the status line.
Key
`tui.terminal\_title`
Type / Values
`array\<string\> | null`
Details
Ordered list of terminal window/tab title item identifiers. Defaults to `["spinner", "project"]`; `null` disables title updates.
Key
`tui.theme`
Type / Values
`string`
Details
Syntax-highlighting theme override (kebab-case theme name).
Key
`web\_search`
Type / Values
`disabled | cached | live`
Details
Web search mode (default: `"cached"`; cached uses an OpenAI-maintained index and does not fetch live pages; if you use `--yolo` or another full access sandbox setting, it defaults to `"live"`). Use `"live"` to fetch the most recent data from the web, or `"disabled"` to remove the tool.
Key
`windows\_wsl\_setup\_acknowledged`
Type / Values
`boolean`
Details
Track Windows onboarding acknowledgement (Windows only).
Key
`windows.sandbox`
Type / Values
`unelevated | elevated`
Details
Windows-only native sandbox mode when running Codex natively on Windows.
Key
`windows.sandbox\_private\_desktop`
Type / Values
`boolean`
Details
Run the final sandboxed child process on a private desktop by default on native Windows. Set `false` only for compatibility with the older `Winsta0\\\\Default` behavior.
Expand to view all
You can find the latest JSON schema for `config.toml` [here](/codex/config-schema.json).
To get autocompletion and diagnostics when editing `config.toml` in VS Code or Cursor, you can install the [Even Better TOML](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml) extension and add this line to the top of your `config.toml`:
```
`#:schema https://developers.openai.com/codex/config-schema.json`
```
Note: Rename `experimental\_instructions\_file` to `model\_instructions\_file`. Codex deprecates the old key; update existing configs to the new name.
## `requirements.toml`
`requirements.toml` is an admin-enforced configuration file that constrains security-sensitive settings users can’t override. For details, locations, and examples, see [Admin-enforced requirements](/codex/enterprise/managed-configuration#admin-enforced-requirements-requirementstoml).
For ChatGPT Business and Enterprise users, Codex can also apply cloud-fetched
requirements. See the security page for precedence details.
Use `[features]` in `requirements.toml` to pin feature flags by the same
canonical keys that `config.toml` uses. Omitted keys remain unconstrained.
|Key|Type / Values|Details|
|`allowed\_approval\_policies`|`array\<string\>`|
Allowed values for `approval\_policy` (for example `untrusted`, `on-request`, `never`, and `granular`).
|
|`allowed\_approvals\_reviewers`|`array\<string\>`|
Allowed values for `approvals\_reviewer`, such as `user` and `auto\_review`.
|
|`allowed\_sandbox\_modes`|`array\<string\>`|
Allowed values for `sandbox\_mode`.
|
|`allowed\_web\_search\_modes`|`array\<string\>`|
Allowed values for `web\_search` (`disabled`, `cached`, `live`). `disabled` is always allowed; an empty list effectively allows only `disabled`.
|
|`features`|`table`|
Pinned feature values keyed by the canonical names from `config.toml`'s `[features]` table.
|
|`features.\<name\>`|`boolean`|
Require a specific canonical feature key to stay enabled or disabled.
|
|`features.browser\_use`|`boolean`|
Set to `false` in `requirements.toml` to disable Browser Use and Browser Agent availability.
|
|`features.computer\_use`|`boolean`|
Set to `false` in `requirements.toml` to disable Computer Use availability and related install or enablement flows.
|
|`features.in\_app\_browser`|`boolean`|
Set to `false` in `requirements.toml` to disable the in-app browser pane.
|
|`guardian\_policy\_config`|`string`|
Managed Markdown policy instructions for automatic review. This takes precedence over local `[auto\_review].policy`. Blank values are ignored.
|
|`hooks`|`table`|
Admin-enforced managed lifecycle hooks. Requires a managed hook directory and uses the same event schema as inline `[hooks]` in `config.toml`.
|
|`hooks.\<Event\>`|`array\<table\>`|
Matcher groups for a hook event such as `PreToolUse`, `PostToolUse`, `PermissionRequest`, `SessionStart`, `UserPromptSubmit`, or `Stop`.
|
|`hooks.\<Event\>[].hooks`|`array\<table\>`|
Hook handlers for a matcher group. Command hooks are currently supported; prompt and agent hook handlers are parsed but skipped.
|
|`hooks.managed\_dir`|`string (absolute path)`|
Directory containing managed hook scripts on macOS and Linux. Codex validates that it is absolute and exists before loading managed hooks.
|
|`hooks.windows\_managed\_dir`|`string (absolute path)`|
Directory containing managed hook scripts on Windows. Codex validates that it is absolute and exists before loading managed hooks.
|
|`mcp\_servers`|`table`|
Allowlist of MCP servers that may be enabled. Both the server name (`\<id\>`) and its identity must match for the MCP server to be enabled. Any configured MCP server not in the allowlist (or with a mismatched identity) is disabled.
|
|`mcp\_servers.\<id\>.identity`|`table`|
Identity rule for a single MCP server. Set either `command` (stdio) or `url` (streamable HTTP).
|
|`mcp\_servers.\<id\>.identity.command`|`string`|
Allow an MCP stdio server when its `mcp\_servers.\<id\>.command` matches this command.
|
|`mcp\_servers.\<id\>.identity.url`|`string`|
Allow an MCP streamable HTTP server when its `mcp\_servers.\<id\>.url` matches this URL.
|
|`permissions.filesystem.deny\_read`|`array\<string\>`|
Admin-enforced filesystem read denials. Entries can be paths or glob patterns, and users cannot weaken them with local config.
|
|`remote\_sandbox\_config`|`array\<table\>`|
Host-specific sandbox requirements. The first entry whose `hostname\_patterns` match the resolved host name overrides top-level `allowed\_sandbox\_modes` for that requirements source. Host-specific entries currently override sandbox modes only.
|
|`remote\_sandbox\_config[].allowed\_sandbox\_modes`|`array\<string\>`|
Allowed sandbox modes to apply when this host-specific entry matches.
|
|`remote\_sandbox\_config[].hostname\_patterns`|`array\<string\>`|
Case-insensitive host name patterns. Supports `\*` for any sequence of characters and `?` for one character.
|
|`rules`|`table`|
Admin-enforced command rules merged with `.rules` files. Requirements rules must be restrictive.
|
|`rules.prefix\_rules`|`array\<table\>`|
List of enforced prefix rules. Each rule must include `pattern` and `decision`.
|
|`rules.prefix\_rules[].decision`|`prompt | forbidden`|
Required. Requirements rules can only prompt or forbid (not allow).
|
|`rules.prefix\_rules[].justification`|`string`|
Optional non-empty rationale surfaced in approval prompts or rejection messages.
|
|`rules.prefix\_rules[].pattern`|`array\<table\>`|
Command prefix expressed as pattern tokens. Each token sets either `token` or `any\_of`.
|
|`rules.prefix\_rules[].pattern[].any\_of`|`array\<string\>`|
A list of allowed alternative tokens at this position.
|
|`rules.prefix\_rules[].pattern[].token`|`string`|
A single literal token at this position.
|
Key
`allowed\_approval\_policies`
Type / Values
`array\<string\>`
Details
Allowed values for `approval\_policy` (for example `untrusted`, `on-request`, `never`, and `granular`).
Key
`allowed\_approvals\_reviewers`
Type / Values
`array\<string\>`
Details
Allowed values for `approvals\_reviewer`, such as `user` and `auto\_review`.
Key
`allowed\_sandbox\_modes`
Type / Values
`array\<string\>`
Details
Allowed values for `sandbox\_mode`.
Key
`allowed\_web\_search\_modes`
Type / Values
`array\<string\>`
Details
Allowed values for `web\_search` (`disabled`, `cached`, `live`). `disabled` is always allowed; an empty list effectively allows only `disabled`.
Key
`features`
Type / Values
`table`
Details
Pinned feature values keyed by the canonical names from `config.toml`'s `[features]` table.
Key
`features.\<name\>`
Type / Values
`boolean`
Details
Require a specific canonical feature key to stay enabled or disabled.
Key
`features.browser\_use`
Type / Values
`boolean`
Details
Set to `false` in `requirements.toml` to disable Browser Use and Browser Agent availability.
Key
`features.computer\_use`
Type / Values
`boolean`
Details
Set to `false` in `requirements.toml` to disable Computer Use availability and related install or enablement flows.
Key
`features.in\_app\_browser`
Type / Values
`boolean`
Details
Set to `false` in `requirements.toml` to disable the in-app browser pane.
Key
`guardian\_policy\_config`
Type / Values
`string`
Details
Managed Markdown policy instructions for automatic review. This takes precedence over local `[auto\_review].policy`. Blank values are ignored.
Key
`hooks`
Type / Values
`table`
Details
Admin-enforced managed lifecycle hooks. Requires a managed hook directory and uses the same event schema as inline `[hooks]` in `config.toml`.
Key
`hooks.\<Event\>`
Type / Values
`array\<table\>`
Details
Matcher groups for a hook event such as `PreToolUse`, `PostToolUse`, `PermissionRequest`, `SessionStart`, `UserPromptSubmit`, or `Stop`.
Key
`hooks.\<Event\>[].hooks`
Type / Values
`array\<table\>`
Details
Hook handlers for a matcher group. Command hooks are currently supported; prompt and agent hook handlers are parsed but skipped.
Key
`hooks.managed\_dir`
Type / Values
`string (absolute path)`
Details
Directory containing managed hook scripts on macOS and Linux. Codex validates that it is absolute and exists before loading managed hooks.
Key
`hooks.windows\_managed\_dir`
Type / Values
`string (absolute path)`
Details
Directory containing managed hook scripts on Windows. Codex validates that it is absolute and exists before loading managed hooks.
Key
`mcp\_servers`
Type / Values
`table`
Details
Allowlist of MCP servers that may be enabled. Both the server name (`\<id\>`) and its identity must match for the MCP server to be enabled. Any configured MCP server not in the allowlist (or with a mismatched identity) is disabled.
Key
`mcp\_servers.\<id\>.identity`
Type / Values
`table`
Details
Identity rule for a single MCP server. Set either `command` (stdio) or `url` (streamable HTTP).
Key
`mcp\_servers.\<id\>.identity.command`
Type / Values
`string`
Details
Allow an MCP stdio server when its `mcp\_servers.\<id\>.command` matches this command.
Key
`mcp\_servers.\<id\>.identity.url`
Type / Values
`string`
Details
Allow an MCP streamable HTTP server when its `mcp\_servers.\<id\>.url` matches this URL.
Key
`permissions.filesystem.deny\_read`
Type / Values
`array\<string\>`
Details
Admin-enforced filesystem read denials. Entries can be paths or glob patterns, and users cannot weaken them with local config.
Key
`remote\_sandbox\_config`
Type / Values
`array\<table\>`
Details
Host-specific sandbox requirements. The first entry whose `hostname\_patterns` match the resolved host name overrides top-level `allowed\_sandbox\_modes` for that requirements source. Host-specific entries currently override sandbox modes only.
Key
`remote\_sandbox\_config[].allowed\_sandbox\_modes`
Type / Values
`array\<string\>`
Details
Allowed sandbox modes to apply when this host-specific entry matches.
Key
`remote\_sandbox\_config[].hostname\_patterns`
Type / Values
`array\<string\>`
Details
Case-insensitive host name patterns. Supports `\*` for any sequence of characters and `?` for one character.
Key
`rules`
Type / Values
`table`
Details
Admin-enforced command rules merged with `.rules` files. Requirements rules must be restrictive.
Key
`rules.prefix\_rules`
Type / Values
`array\<table\>`
Details
List of enforced prefix rules. Each rule must include `pattern` and `decision`.
Key
`rules.prefix\_rules[].decision`
Type / Values
`prompt | forbidden`
Details
Required. Requirements rules can only prompt or forbid (not allow).
Key
`rules.prefix\_rules[].justification`
Type / Values
`string`
Details
Optional non-empty rationale surfaced in approval prompts or rejection messages.
Key
`rules.prefix\_rules[].pattern`
Type / Values
`array\<table\>`
Details
Command prefix expressed as pattern tokens. Each token sets either `token` or `any\_of`.
Key
`rules.prefix\_rules[].pattern[].any\_of`
Type / Values
`array\<string\>`
Details
A list of allowed alternative tokens at this position.
Key
`rules.prefix\_rules[].pattern[].token`
Type / Values
`string`
Details
A single literal token at this position.
Expand to view all