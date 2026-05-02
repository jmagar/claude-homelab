Agent approvals & security – Codex | OpenAI Developers
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
Codex helps protect your code and data and reduces the risk of misuse.
This page covers how to operate Codex safely, including sandboxing, approvals,
and network access. If you are looking for Codex Security, the product for
scanning connected GitHub repositories, see [Codex Security](/codex/security).
By default, the agent runs with network access turned off. Locally, Codex uses an OS-enforced sandbox that limits what it can touch (typically to the current workspace), plus an approval policy that controls when it must stop and ask you before acting.
For a high-level explanation of how sandboxing works across the Codex app, IDE
extension, and CLI, see [sandboxing](/codex/concepts/sandboxing).
For a broader enterprise security overview, see the [Codex security white paper](https://trust.openai.com/?itemUid=382f924d-54f3-43a8-a9df-c39e6c959958&#38;source=click).
## Sandbox and approvals
Codex security controls come from two layers that work together:
* **Sandbox mode**: What Codex can do technically (for example, where it can write and whether it can reach the network) when it executes model-generated commands.
* **Approval policy**: When Codex must ask you before it executes an action (for example, leaving the sandbox, using the network, or running commands outside a trusted set).
Codex uses different sandbox modes depending on where you run it:
* **Codex cloud**: Runs in isolated OpenAI-managed containers, preventing access to your host system or unrelated data. Uses a two-phase runtime model: setup runs before the agent phase and can access the network to install specified dependencies, then the agent phase runs offline by default unless you enable internet access for that environment. Secrets configured for cloud environments are available only during setup and are removed before the agent phase starts.
* **Codex CLI / IDE extension**: OS-level mechanisms enforce sandbox policies. Defaults include no network access and write permissions limited to the active workspace. You can configure the sandbox, approval policy, and network settings based on your risk tolerance.
In the `Auto` preset (for example, `--sandbox workspace-write --ask-for-approval on-request`), Codex can read files, make edits, and run commands in the working directory automatically.
Codex asks for approval to edit files outside the workspace or to run commands that require network access. If you want to chat or plan without making changes, switch to `read-only` mode with the `/permissions` command.
Codex can also elicit approval for app (connector) tool calls that advertise side effects, even when the action isn’t a shell command or file change. Destructive app/MCP tool calls always require approval when the tool advertises a destructive annotation, even if it also advertises other hints (for example, read-only hints).
## Network access [
Elevated Risk
](https://help.openai.com/articles/20001061)
For Codex cloud, see [agent internet access](/codex/cloud/internet-access) to enable full internet access or a domain allow list.
For the Codex app, CLI, or IDE Extension, the default `workspace-write` sandbox mode keeps network access turned off unless you enable it in your configuration:
```
`[sandbox\_workspace\_write]
network\_access = true`
```
You can also control the [web search tool](https://platform.openai.com/docs/guides/tools-web-search) without granting full network access to spawned commands. Codex defaults to using a web search cache to access results. The cache is an OpenAI-maintained index of web results, so cached mode returns pre-indexed results instead of fetching live pages. This reduces exposure to prompt injection from arbitrary live content, but you should still treat web results as untrusted. If you are using `--yolo` or another [full access sandbox setting](#common-sandbox-and-approval-combinations), web search defaults to live results. Use `--search` or set `web\_search = "live"` to allow live browsing, or set it to `"disabled"` to turn the tool off:
```
`web\_search = "cached" # default
# web\_search = "disabled"
# web\_search = "live" # same as --search`
```
Use caution when enabling network access or web search in Codex. Prompt injection can cause the agent to fetch and follow untrusted instructions.
## Defaults and recommendations
* On launch, Codex detects whether the folder is version-controlled and recommends:
* Version-controlled folders: `Auto` (workspace write + on-request approvals)
* Non-version-controlled folders: `read-only`
* Depending on your setup, Codex may also start in `read-only` until you explicitly trust the working directory (for example, via an onboarding prompt or `/permissions`).
* The workspace includes the current directory and temporary directories like `/tmp`. Use the `/status` command to see which directories are in the workspace.
* To accept the defaults, run `codex`.
* You can set these explicitly:
* `codex --sandbox workspace-write --ask-for-approval on-request`
* `codex --sandbox read-only --ask-for-approval on-request`
### Protected paths in writable roots
In the default `workspace-write` sandbox policy, writable roots still include protected paths:
* `\<writable\_root\>/.git` is protected as read-only whether it appears as a directory or file.
* If `\<writable\_root\>/.git` is a pointer file (`gitdir: ...`), the resolved Git directory path is also protected as read-only.
* `\<writable\_root\>/.agents` is protected as read-only when it exists as a directory.
* `\<writable\_root\>/.codex` is protected as read-only when it exists as a directory.
* Protection is recursive, so everything under those paths is read-only.
### Deny reads with filesystem profiles
Named permission profiles can also deny reads for exact paths or glob patterns.
This is useful when a workspace should stay writable but specific sensitive
files, such as local environment files, must stay unreadable:
```
`default\_permissions = "workspace"
[permissions.workspace.filesystem]
":project\_roots" = { "." = "write", "\*\*/\*.env" = "none" }
glob\_scan\_max\_depth = 3`
```
Use `"none"` for paths or globs that Codex shouldn’t read. The sandbox policy
evaluates globs for local macOS and Linux command execution. On platforms that
pre-expand glob matches before the sandbox starts, set `glob\_scan\_max\_depth` for
unbounded `\*\*` patterns, or list explicit depths such as `\*.env`, `\*/\*.env`, and
`\*/\*/\*.env`.
### Run without approval prompts
You can disable approval prompts with `--ask-for-approval never` or `-a never` (shorthand).
This option works with all `--sandbox` modes, so you still control Codex’s level of autonomy. Codex makes a best effort within the constraints you set.
If you need Codex to read files, make edits, and run commands with network access without approval prompts, use `--sandbox danger-full-access` (or the `--dangerously-bypass-approvals-and-sandbox` flag). Use caution before doing so.
For a middle ground, `approval\_policy = { granular = { ... } }` lets you keep specific approval prompt categories interactive while automatically rejecting others. The granular policy covers sandbox approvals, execpolicy-rule prompts, MCP prompts, `request\_permissions` prompts, and skill-script approvals.
### Automatic approval reviews
By default, approval requests route to you:
```
`approvals\_reviewer = "user"`
```
Automatic approval reviews apply when approvals are interactive, such as
`approval\_policy = "on-request"` or a granular approval policy. Set
`approvals\_reviewer = "auto\_review"` to route eligible approval requests
through a reviewer agent before Codex runs the request:
```
`approval\_policy = "on-request"
approvals\_reviewer = "auto\_review"`
```
The reviewer evaluates only actions that already need approval, such as sandbox
escalations, network requests, `request\_permissions` prompts, or side-effecting
app and MCP tool calls. Actions that stay inside the sandbox continue without an
extra review step.
The reviewer policy checks for data exfiltration, credential probing, persistent
security weakening, and destructive actions. Low-risk and medium-risk actions
can proceed when policy allows them. The policy denies critical-risk actions.
High-risk actions require enough user authorization and no matching deny rule.
Timeouts, parse failures, and review errors fail closed.
The [default reviewer policy](https://github.com/openai/codex/blob/main/codex-rs/core/src/guardian/policy.md)
is in the open-source Codex repository. Enterprises can replace its
tenant-specific section with `guardian\_policy\_config` in managed requirements.
Local `[auto\_review].policy` text is also supported, but managed requirements
take precedence. For setup details, see
[Managed configuration](/codex/enterprise/managed-configuration#configure-automatic-review-policy).
In the Codex app, these reviews appear as automatic review items with a status such
as Reviewing, Approved, Denied, Stopped, or Timed out. They can also include a
risk level for the reviewed request.
Automatic review uses extra model calls, so it can add to Codex usage. Admins
can constrain it with `allowed\_approvals\_reviewers`.
### Common sandbox and approval combinations
|Intent|Flags|Effect|
|Auto (preset)|*no flags needed* or `--sandbox workspace-write --ask-for-approval on-request`|Codex can read files, make edits, and run commands in the workspace. Codex requires approval to edit outside the workspace or to access network.|
|Safe read-only browsing|`--sandbox read-only --ask-for-approval on-request`|Codex can read files and answer questions. Codex requires approval to make edits, run commands, or access network.|
|Read-only non-interactive (CI)|`--sandbox read-only --ask-for-approval never`|Codex can only read files; never asks for approval.|
|Automatically edit but ask for approval to run untrusted commands|`--sandbox workspace-write --ask-for-approval untrusted`|Codex can read and edit files but asks for approval before running untrusted commands.|
|Dangerous full access|`--dangerously-bypass-approvals-and-sandbox` (alias: `--yolo`)|[
Elevated Risk
](https://help.openai.com/articles/20001061) No sandbox; no approvals *(not recommended)*|
For non-interactive runs, use `codex exec --sandbox workspace-write`; Codex keeps older `codex exec --full-auto` invocations as a deprecated compatibility path and prints a warning.
With `--ask-for-approval untrusted`, Codex runs only known-safe read operations automatically. Commands that can mutate state or trigger external execution paths (for example, destructive Git operations or Git output/config-override flags) require approval.
#### Configuration in `config.toml`
For the broader configuration workflow, see [Config basics](/codex/config-basic), [Advanced Config](/codex/config-advanced#approval-policies-and-sandbox-modes), and the [Configuration Reference](/codex/config-reference).
```
`# Always ask for approval mode
approval\_policy = "untrusted"
sandbox\_mode = "read-only"
allow\_login\_shell = false # optional hardening: disallow login shells for shell-based tools
# Optional: Allow network in workspace-write mode
[sandbox\_workspace\_write]
network\_access = true
# Optional: granular approval policy
# approval\_policy = { granular = {
# sandbox\_approval = true,
# rules = true,
# mcp\_elicitations = true,
# request\_permissions = false,
# skill\_approval = false
# } }`
```
You can also save presets as profiles, then select them with `codex --profile \<name\>`:
```
`[profiles.full\_auto]
approval\_policy = "on-request"
sandbox\_mode = "workspace-write"
[profiles.readonly\_quiet]
approval\_policy = "never"
sandbox\_mode = "read-only"`
```
### Test the sandbox locally
To see what happens when a command runs under the Codex sandbox, use these Codex CLI commands:
```
`# macOS
codex sandbox macos [--permissions-profile \<name\>] [--log-denials] [COMMAND]...
# Linux
codex sandbox linux [--permissions-profile \<name\>] [COMMAND]...
# Windows
codex sandbox windows [--permissions-profile \<name\>] [COMMAND]...`
```
The `sandbox` command is also available as `codex debug`, and the platform helpers have aliases (for example `codex sandbox seatbelt` and `codex sandbox landlock`).
## OS-level sandbox
Codex enforces the sandbox differently depending on your OS:
* **macOS** uses Seatbelt policies and runs commands using `sandbox-exec` with a profile (`-p`) that corresponds to the `--sandbox` mode you selected. When restricted read access enables platform defaults, Codex appends a curated macOS platform policy (instead of broadly allowing `/System`) to preserve common tool compatibility.
* **Linux** uses `bwrap` plus `seccomp` by default.
* **Windows** uses the Linux sandbox implementation when running in [Windows Subsystem for Linux 2 (WSL2)](/codex/windows#windows-subsystem-for-linux). WSL1 was supported through Codex `0.114`; starting in `0.115`, the Linux sandbox moved to `bwrap`, so WSL1 is no longer supported. When running natively on Windows, Codex uses a [Windows sandbox](/codex/windows#windows-sandbox) implementation.
If you use the Codex IDE extension on Windows, it supports WSL2 directly. Set the following in your VS Code settings to keep the agent inside WSL2 whenever it’s available:
```
`{
"chatgpt.runCodexInWindowsSubsystemForLinux": true
}`
```
This ensures the IDE extension inherits Linux sandbox semantics for commands, approvals, and filesystem access even when the host OS is Windows. Learn more in the [Windows setup guide](/codex/windows).
When running natively on Windows, configure the native sandbox mode in `config.toml`:
```
`[windows]
sandbox = "unelevated" # or "elevated"
# sandbox\_private\_desktop = true # default; set false only for compatibility`
```
See the [Windows setup guide](/codex/windows#windows-sandbox) for details.
When you run Linux in a containerized environment such as Docker, the sandbox may not work if the host or container configuration blocks the namespace, setuid `bwrap`, or `seccomp` operations that Codex needs.
In that case, configure your Docker container to provide the isolation you need, then run `codex` with `--sandbox danger-full-access` (or the `--dangerously-bypass-approvals-and-sandbox` flag) inside the container.
### Run Codex in Dev Containers
If your host cannot run the Linux sandbox directly, or if your organization already standardizes on containerized development, run Codex with Dev Containers and let Docker provide the outer isolation boundary. This works with Visual Studio Code Dev Containers and compatible tools.
Use the [Codex secure devcontainer example](https://github.com/openai/codex/tree/main/.devcontainer) as a reference implementation. The example installs Codex, common development tools, `bubblewrap`, and firewall-based outbound controls.
Devcontainers provide substantial protection, but they do not prevent every
attack. If you run Codex with `--sandbox danger-full-access` or
`--dangerously-bypass-approvals-and-sandbox` inside the container, a malicious
project can exfiltrate anything available inside the devcontainer, including
Codex credentials. Use this pattern only with trusted repositories, and
monitor Codex activity as you would in any other elevated environment.
The reference implementation includes:
* an Ubuntu 24.04 base image with Codex and common development tools installed;
* an allowlist-driven firewall profile for outbound access;
* VS Code settings and extension recommendations for reopening the workspace in a container;
* persistent mounts for command history and Codex configuration;
* `bubblewrap`, so Codex can still use its Linux sandbox when the container grants the needed capabilities.
To try it:
1. Install Visual Studio Code and the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers).
2. Copy the Codex example `.devcontainer` setup into your repository, or start from the Codex repository directly.
3. In VS Code, run **Dev Containers: Open Folder in Container…** and select `.devcontainer/devcontainer.secure.json`.
4. After the container starts, open a terminal and run `codex`.
You can also start the container from the CLI:
```
`devcontainer up --workspace-folder . --config .devcontainer/devcontainer.secure.json`
```
The example has three main pieces:
* `.devcontainer/devcontainer.secure.json` controls container settings, capabilities, mounts, environment variables, and VS Code extensions.
* `.devcontainer/Dockerfile.secure` defines the Ubuntu-based image and installed tools.
* `.devcontainer/init-firewall.sh` applies the outbound network policy.
The reference firewall is intentionally a starting point. If you depend on domain allowlisting for isolation, implement DNS rebinding and DNS refresh protections that fit your environment, such as TTL-aware refreshes or a DNS-aware firewall.
Inside the container, choose one of these modes:
* Keep Codex’s Linux sandbox enabled if the Dev Container profile grants the capabilities needed for `bwrap` to create the inner sandbox.
* If the container is your intended security boundary, run Codex with `--sandbox danger-full-access` inside the container so Codex does not try to create a second sandbox layer.
## Version control
Codex works best with a version control workflow:
* Work on a feature branch and keep `git status` clean before delegating. This keeps Codex patches easier to isolate and revert.
* Prefer patch-based workflows (for example, `git diff`/`git apply`) over editing tracked files directly. Commit frequently so you can roll back in small increments.
* Treat Codex suggestions like any other PR: run targeted verification, review diffs, and document decisions in commit messages for auditing.
## Monitoring and telemetry
Codex supports opt-in monitoring via OpenTelemetry (OTel) to help teams audit usage, investigate issues, and meet compliance requirements without weakening local security defaults. Telemetry is off by default; enable it explicitly in your configuration.
### Overview
* Codex turns off OTel export by default to keep local runs self-contained.
* When enabled, Codex emits structured log events covering conversations, API requests, SSE/WebSocket stream activity, user prompts (redacted by default), tool approval decisions, and tool results.
* Codex tags exported events with `service.name` (originator), CLI version, and an environment label to separate dev/staging/prod traffic.
### Enable OTel (opt-in)
Add an `[otel]` block to your Codex configuration (typically `\~/.codex/config.toml`), choosing an exporter and whether to log prompt text.
```
`[otel]
environment = "staging" # dev | staging | prod
exporter = "none" # none | otlp-http | otlp-grpc
log\_user\_prompt = false # redact prompt text unless policy allows`
```
* `exporter = "none"` leaves instrumentation active but doesn’t send data anywhere.
* To send events to your own collector, pick one of:
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
Codex batches events and flushes them on shutdown. Codex exports only telemetry produced by its OTel module.
### Event categories
Representative event types include:
* `codex.conversation\_starts` (model, reasoning settings, sandbox/approval policy)
* `codex.api\_request` (attempt, status/success, duration, and error details)
* `codex.sse\_event` (stream event kind, success/failure, duration, plus token counts on `response.completed`)
* `codex.websocket\_request` and `codex.websocket\_event` (request duration plus per-message kind/success/error)
* `codex.user\_prompt` (length; content redacted unless explicitly enabled)
* `codex.tool\_decision` (approved/denied, source: configuration vs. user)
* `codex.tool\_result` (duration, success, output snippet)
Associated OTel metrics (counter plus duration histogram pairs) include `codex.api\_request`, `codex.sse\_event`, `codex.websocket.request`, `codex.websocket.event`, and `codex.tool.call` (with corresponding `.duration\_ms` instruments).
For the full event catalog and configuration reference, see the [Codex configuration documentation on GitHub](https://github.com/openai/codex/blob/main/docs/config.md#otel).
### Security and privacy guidance
* Keep `log\_user\_prompt = false` unless policy explicitly permits storing prompt contents. Prompts can include source code and sensitive data.
* Route telemetry only to collectors you control; apply retention limits and access controls aligned with your compliance requirements.
* Treat tool arguments and outputs as sensitive. Favor redaction at the collector or SIEM when possible.
* Review local data retention settings (for example, `history.persistence` / `history.max\_bytes`) if you don’t want Codex to save session transcripts under `CODEX\_HOME`. See [Advanced Config](/codex/config-advanced#history-persistence) and [Configuration Reference](/codex/config-reference).
* If you run the CLI with network access turned off, OTel export can’t reach your collector. To export, allow network access in `workspace-write` mode for the OTel endpoint, or export from Codex cloud with the collector domain on your approved list.
* Review events periodically for approval/sandbox changes and unexpected tool executions.
OTel is optional and designed to complement, not replace, the sandbox and approval protections described above.
## Managed configuration
Enterprise admins can configure Codex security settings for their workspace in [Managed configuration](/codex/enterprise/managed-configuration). See that page for setup and policy details.