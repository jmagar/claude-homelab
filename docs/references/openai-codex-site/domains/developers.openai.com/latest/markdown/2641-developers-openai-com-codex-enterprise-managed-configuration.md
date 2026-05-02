Managed configuration – Codex | OpenAI Developers
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
Enterprise admins can control local Codex behavior in two ways:
* **Requirements**: admin-enforced constraints that users can’t override.
* **Managed defaults**: starting values applied when Codex launches. Users can still change settings during a session; Codex reapplies managed defaults the next time it starts.
## Admin-enforced requirements (requirements.toml)
Requirements constrain security-sensitive settings (approval policy, approvals reviewer, automatic review policy, sandbox mode, web search mode, managed hooks, and optionally which MCP servers users can enable). When resolving configuration (for example from `config.toml`, profiles, or CLI config overrides), if a value conflicts with an enforced rule, Codex falls back to a compatible value and notifies the user. If you configure an `mcp\_servers` allowlist, Codex enables an MCP server only when both its name and identity match an approved entry; otherwise, Codex disables it.
Requirements can also constrain [feature flags](/codex/config-basic/#feature-flags) via the `[features]` table in `requirements.toml`. Note that features aren’t always security-sensitive, but enterprises can pin values if desired. Omitted keys remain unconstrained.
For the exact key list, see the [`requirements.toml` section in Configuration Reference](/codex/config-reference#requirementstoml).
### Locations and precedence
Codex applies requirements layers in this order (earlier wins per field):
1. Cloud-managed requirements (ChatGPT Business or Enterprise)
2. macOS managed preferences (MDM) via `com.openai.codex:requirements\_toml\_base64`
3. System `requirements.toml` (`/etc/codex/requirements.toml` on Unix systems, including Linux/macOS, or `%ProgramData%\\OpenAI\\Codex\\requirements.toml` on Windows)
Across layers, Codex merges requirements per field: if an earlier layer sets a field (including an empty list), later layers don’t override that field, but lower layers can still fill fields that remain unset.
For backwards compatibility, Codex also interprets legacy `managed\_config.toml` fields `approval\_policy` and `sandbox\_mode` as requirements (allowing only that single value).
### Cloud-managed requirements
When you sign in with ChatGPT on a Business or Enterprise plan, Codex can also fetch admin-enforced requirements from the Codex service. This is another source of `requirements.toml`-compatible requirements. This applies across Codex surfaces, including the CLI, App, and IDE Extension.
#### Configure cloud-managed requirements
Go to the [Codex managed-config page](https://chatgpt.com/codex/settings/managed-configs).
Create a new managed requirements file using the same format and keys as `requirements.toml`.
```
`enforce\_residency = "us"
allowed\_approval\_policies = ["on-request"]
allowed\_sandbox\_modes = ["read-only", "workspace-write"]
[rules]
prefix\_rules = [
{ pattern = [{ any\_of = ["bash", "sh", "zsh"] }], decision = "prompt", justification = "Require explicit approval for shell entrypoints" },
]`
```
Save the configuration. Once saved, the updated managed requirements apply immediately for matching users.
For more examples, see [Example requirements.toml](#example-requirementstoml).
#### Assign requirements to groups
Admins can configure different managed requirements for different user groups, and also set a default fallback requirements policy.
If a user matches more than one group-specific rule, the first matching rule applies. Codex doesn’t fill unset fields from later matching group rules.
For example, if the first matching group rule sets only `allowed\_sandbox\_modes = ["read-only"]` and a later matching group rule sets `allowed\_approval\_policies = ["on-request"]`, Codex applies only the first matching group rule and doesn’t fill `allowed\_approval\_policies` from the later rule.
#### How Codex applies cloud-managed requirements locally
When a user starts Codex and signs in with ChatGPT on a Business or Enterprise plan, Codex applies managed requirements on a best-effort basis. Codex first checks for a valid, unexpired local managed requirements cache entry and uses it if available. If the cache is missing, expired, corrupted, or doesn’t match the current auth identity, Codex attempts to fetch managed requirements from the service (with retries) and writes a new signed cache entry on success. If no valid cached entry is available and the fetch fails or times out, Codex continues without the managed requirements layer.
After cache resolution, Codex enforces managed requirements as part of the normal requirements layering described above.
### Example requirements.toml
This example blocks `--ask-for-approval never` and `--sandbox danger-full-access` (including `--yolo`):
```
`allowed\_approval\_policies = ["untrusted", "on-request"]
allowed\_sandbox\_modes = ["read-only", "workspace-write"]`
```
### Override sandbox requirements by host
Use `[[remote\_sandbox\_config]]` when one managed policy should apply different
sandbox requirements on different hosts. For example, you can keep a stricter
default for laptops while allowing workspace writes on matching devboxes or CI
runners. Host-specific entries currently override `allowed\_sandbox\_modes` only:
```
`allowed\_sandbox\_modes = ["read-only"]
[[remote\_sandbox\_config]]
hostname\_patterns = ["\*.devbox.example.com", "runner-??.ci.example.com"]
allowed\_sandbox\_modes = ["read-only", "workspace-write"]`
```
Codex compares each `hostname\_patterns` entry against the best-effort resolved
host name. It prefers the fully qualified domain name when available and falls
back to the local host name. Matching is case-insensitive; `\*` matches any
sequence of characters, and `?` matches one character.
The first matching `[[remote\_sandbox\_config]]` entry wins within the same
requirements source. If no entry matches, Codex keeps the top-level
`allowed\_sandbox\_modes`. Hostname matching is for policy selection only; don’t
treat it as authenticated device proof.
You can also constrain web search mode:
```
`allowed\_web\_search\_modes = ["cached"] # "disabled" remains implicitly allowed`
```
`allowed\_web\_search\_modes = []` allows only `"disabled"`.
For example, `allowed\_web\_search\_modes = ["cached"]` prevents live web search even in `danger-full-access` sessions.
### Pin feature flags
You can also pin [feature flags](/codex/config-basic/#feature-flags) for users
receiving a managed `requirements.toml`:
```
`[features]
personality = true
unified\_exec = false
# Disable specific Codex feature surfaces when needed.
browser\_use = false
in\_app\_browser = false
computer\_use = false`
```
Use the canonical feature keys from `config.toml`’s `[features]` table. Codex normalizes the resulting feature set to meet these pins and rejects conflicting writes to `config.toml` or profile-scoped feature settings.
* `in\_app\_browser = false` disables the in-app browser pane.
* `browser\_use = false` disables Browser Use and Browser Agent availability.
* `computer\_use = false` disables Computer Use availability and related
install or enablement flows.
If omitted, these features are allowed by policy, subject to normal client,
platform, and rollout availability.
### Configure automatic review policy
Use `allowed\_approvals\_reviewers` to require or allow automatic review. Set it
to `["auto\_review"]` to require automatic review, or include `"user"` when users
can choose manual approval.
Set `guardian\_policy\_config` to replace the tenant-specific section of the
automatic review policy. Codex still uses the built-in reviewer template and
output contract. Managed `guardian\_policy\_config` takes precedence over local
`[auto\_review].policy`.
```
`allowed\_approval\_policies = ["on-request"]
allowed\_approvals\_reviewers = ["auto\_review"]
guardian\_policy\_config = """
## Environment Profile
- Trusted internal destinations include github.com/my-org, artifacts.example.com,
and internal CI systems.
## Tenant Risk Taxonomy and Allow/Deny Rules
- Treat uploads to unapproved third-party file-sharing services as high risk.
- Deny actions that expose credentials or private source code to untrusted
destinations.
"""`
```
### Enforce deny-read requirements
Admins can deny reads for exact paths or glob patterns with
`[permissions.filesystem]`. Users can’t weaken these requirements with local
configuration.
```
`[permissions.filesystem]
deny\_read = [
"/Users/alice/.ssh",
"./private/\*\*/\*.txt",
]`
```
When deny-read requirements are present, Codex constrains local sandbox mode to
`read-only` or `workspace-write` so Codex can enforce them. On native
Windows, managed `deny\_read` applies to direct file tools; shell subprocess
reads don’t use this sandbox rule.
### Enforce managed hooks from requirements
Admins can also define managed lifecycle hooks directly in `requirements.toml`.
Use `[hooks]` for the hook configuration itself, and point `managed\_dir` at the
directory where your MDM or endpoint-management tooling installs the referenced
scripts.
```
`[features]
codex\_hooks = true
[hooks]
managed\_dir = "/enterprise/hooks"
windows\_managed\_dir = 'C:\\enterprise\\hooks'
[[hooks.PreToolUse]]
matcher = "^Bash$"
[[hooks.PreToolUse.hooks]]
type = "command"
command = "python3 /enterprise/hooks/pre\_tool\_use\_policy.py"
timeout = 30
statusMessage = "Checking managed Bash command"`
```
Notes:
* Codex enforces the hook configuration from `requirements.toml`, but it does
not distribute the scripts in `managed\_dir`.
* Deliver those scripts separately with your MDM or device-management solution.
* Managed hook commands should reference absolute script paths under the
configured managed directory.
### Enforce command rules from requirements
Admins can also enforce restrictive command rules from `requirements.toml`
using a `[rules]` table. These rules merge with regular `.rules` files, and the
most restrictive decision still wins.
Unlike `.rules`, requirements rules must specify `decision`, and that decision
must be `"prompt"` or `"forbidden"` (not `"allow"`).
```
`[rules]
prefix\_rules = [
{ pattern = [{ token = "rm" }], decision = "forbidden", justification = "Use git clean -fd instead." },
{ pattern = [{ token = "git" }, { any\_of = ["push", "commit"] }], decision = "prompt", justification = "Require review before mutating history." },
]`
```
To restrict which MCP servers Codex can enable, add an `mcp\_servers` approved list. For stdio servers, match on `command`; for streamable HTTP servers, match on `url`:
```
`[mcp\_servers.docs]
identity = { command = "codex-mcp" }
[mcp\_servers.remote]
identity = { url = "https://example.com/mcp" }`
```
If `mcp\_servers` is present but empty, Codex disables all MCP servers.
## Managed defaults (`managed\_config.toml`)
Managed defaults merge on top of a user’s local `config.toml` and take precedence over any CLI `--config` overrides, setting the starting values when Codex launches. Users can still change those settings during a session; Codex reapplies managed defaults the next time it starts.
Make sure your managed defaults meet your requirements; Codex rejects disallowed values.
### Precedence and layering
Codex assembles the effective configuration in this order (top overrides bottom):
* Managed preferences (macOS MDM; highest precedence)
* `managed\_config.toml` (system/managed file)
* `config.toml` (user’s base configuration)
CLI `--config key=value` overrides apply to the base, but managed layers override them. This means each run starts from the managed defaults even if you provide local flags.
Cloud-managed requirements affect the requirements layer (not managed defaults). See the Admin-enforced requirements section above for precedence.
### Locations
* Linux/macOS (Unix): `/etc/codex/managed\_config.toml`
* Windows/non-Unix: `\~/.codex/managed\_config.toml`
If the file is missing, Codex skips the managed layer.
### macOS managed preferences (MDM)
On macOS, admins can push a device profile that provides base64-encoded TOML payloads at:
* Preference domain: `com.openai.codex`
* Keys:
* `config\_toml\_base64` (managed defaults)
* `requirements\_toml\_base64` (requirements)
Codex parses these “managed preferences” payloads as TOML. For managed defaults (`config\_toml\_base64`), managed preferences have the highest precedence. For requirements (`requirements\_toml\_base64`), precedence follows the cloud-managed requirements order described above. The same requirements-side `[features]` table works in `requirements\_toml\_base64`; use canonical feature keys there as well.
### MDM setup workflow
Codex honors standard macOS MDM payloads, so you can distribute settings with tooling like `Jamf Pro`, `Fleet`, or `Kandji`. A lightweight deployment looks like:
1. Build the managed payload TOML and encode it with `base64` (no wrapping).
2. Drop the string into your MDM profile under the `com.openai.codex` domain at `config\_toml\_base64` (managed defaults) or `requirements\_toml\_base64` (requirements).
3. Push the profile, then ask users to restart Codex and confirm the startup config summary reflects the managed values.
4. When revoking or changing policy, update the managed payload; the CLI reads the refreshed preference the next time it launches.
Avoid embedding secrets or high-churn dynamic values in the payload. Treat the managed TOML like any other MDM setting under change control.
### Example managed\_config.toml
```
`# Set conservative defaults
approval\_policy = "on-request"
sandbox\_mode = "workspace-write"
[sandbox\_workspace\_write]
network\_access = false # keep network disabled unless explicitly allowed
[otel]
environment = "prod"
exporter = "otlp-http" # point at your collector
log\_user\_prompt = false # keep prompts redacted
# exporter details live under exporter tables; see Monitoring and telemetry above`
```
### Recommended guardrails
* Prefer `workspace-write` with approvals for most users; reserve full access for controlled containers.
* Keep `network\_access = false` unless your security review allows a collector or domains required by your workflows.
* Use managed configuration to pin OTel settings (exporter, environment), but keep `log\_user\_prompt = false` unless your policy explicitly allows storing prompt contents.
* Periodically audit diffs between local `config.toml` and managed policy to catch drift; managed layers should win over local flags and files.