Hooks – Codex | OpenAI Developers
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
Hooks are an extensibility framework for Codex. They allow
you to inject your own scripts into the agentic loop, enabling features such as:
* Send the conversation to a custom logging/analytics engine
* Scan your team’s prompts to block accidentally pasting API keys
* Summarize conversations to create persistent memories automatically
* Run a custom validation check when a conversation turn stops, enforcing standards
* Customize prompting when in a certain directory
Hooks are behind a feature flag in `config.toml`:
```
`[features]
codex\_hooks = true`
```
Runtime behavior to keep in mind:
* Matching hooks from multiple files all run.
* Multiple matching command hooks for the same event are launched concurrently,
so one hook cannot prevent another matching hook from starting.
* `PreToolUse`, `PermissionRequest`, `PostToolUse`, `UserPromptSubmit`, and
`Stop` run at turn scope.
## Where Codex looks for hooks
Codex discovers hooks next to active config layers in either of these forms:
* `hooks.json`
* inline `[hooks]` tables inside `config.toml`
Installed plugins can also bundle lifecycle config through their plugin
manifest or a default `hooks/hooks.json` file. See [Build
plugins](/codex/plugins/build#bundled-mcp-servers-and-lifecycle-config) for the
plugin packaging rules.
In practice, the four most useful locations are:
* `\~/.codex/hooks.json`
* `\~/.codex/config.toml`
* `\<repo\>/.codex/hooks.json`
* `\<repo\>/.codex/config.toml`
If more than one hook source exists, Codex loads all matching hooks.
Higher-precedence config layers do not replace lower-precedence hooks.
If a single layer contains both `hooks.json` and inline `[hooks]`, Codex
merges them and warns at startup. Prefer one representation per layer.
Project-local hooks load only when the project `.codex/` layer is trusted. In
untrusted projects, Codex still loads user and system hooks from their own
active config layers.
## Config shape
Hooks are organized in three levels:
* A hook event such as `PreToolUse`, `PostToolUse`, or `Stop`
* A matcher group that decides when that event matches
* One or more hook handlers that run when the matcher group matches
```
`{
"hooks": {
"SessionStart": [
{
"matcher": "startup|resume",
"hooks": [
{
"type": "command",
"command": "python3 \~/.codex/hooks/session\_start.py",
"statusMessage": "Loading session notes"
}
]
}
],
"PreToolUse": [
{
"matcher": "Bash",
"hooks": [
{
"type": "command",
"command": "/usr/bin/python3 \\"$(git rev-parse --show-toplevel)/.codex/hooks/pre\_tool\_use\_policy.py\\"",
"statusMessage": "Checking Bash command"
}
]
}
],
"PermissionRequest": [
{
"matcher": "Bash",
"hooks": [
{
"type": "command",
"command": "/usr/bin/python3 \\"$(git rev-parse --show-toplevel)/.codex/hooks/permission\_request.py\\"",
"statusMessage": "Checking approval request"
}
]
}
],
"PostToolUse": [
{
"matcher": "Bash",
"hooks": [
{
"type": "command",
"command": "/usr/bin/python3 \\"$(git rev-parse --show-toplevel)/.codex/hooks/post\_tool\_use\_review.py\\"",
"statusMessage": "Reviewing Bash output"
}
]
}
],
"UserPromptSubmit": [
{
"hooks": [
{
"type": "command",
"command": "/usr/bin/python3 \\"$(git rev-parse --show-toplevel)/.codex/hooks/user\_prompt\_submit\_data\_flywheel.py\\""
}
]
}
],
"Stop": [
{
"hooks": [
{
"type": "command",
"command": "/usr/bin/python3 \\"$(git rev-parse --show-toplevel)/.codex/hooks/stop\_continue.py\\"",
"timeout": 30
}
]
}
]
}
}`
```
Notes:
* `timeout` is in seconds.
* If `timeout` is omitted, Codex uses `600` seconds.
* `statusMessage` is optional.
* Commands run with the session `cwd` as their working directory.
* For repo-local hooks, prefer resolving from the git root instead of using a
relative path such as `.codex/hooks/...`. Codex may be started from a
subdirectory, and a git-root-based path keeps the hook location stable.
Equivalent inline TOML in `config.toml`:
```
`[features]
codex\_hooks = true
[[hooks.PreToolUse]]
matcher = "^Bash$"
[[hooks.PreToolUse.hooks]]
type = "command"
command = '/usr/bin/python3 "$(git rev-parse --show-toplevel)/.codex/hooks/pre\_tool\_use\_policy.py"'
timeout = 30
statusMessage = "Checking Bash command"
[[hooks.PostToolUse]]
matcher = "^Bash$"
[[hooks.PostToolUse.hooks]]
type = "command"
command = '/usr/bin/python3 "$(git rev-parse --show-toplevel)/.codex/hooks/post\_tool\_use\_review.py"'
timeout = 30
statusMessage = "Reviewing Bash output"`
```
## Managed hooks from `requirements.toml`
Enterprise-managed requirements can also define hooks inline under `[hooks]`.
This is useful when admins want to enforce the hook configuration while
delivering the actual scripts through MDM or another device-management system.
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
Notes for managed hooks:
* `managed\_dir` is used on macOS and Linux.
* `windows\_managed\_dir` is used on Windows.
* Codex does not distribute the scripts in `managed\_dir`; your enterprise
tooling must install and update them separately.
* Managed hook commands should use absolute script paths under the configured
managed directory.
## Matcher patterns
The `matcher` field is a regex string that filters when hooks fire. Use `"\*"`,
`""`, or omit `matcher` entirely to match every occurrence of a supported
event.
Only some current Codex events honor `matcher`:
|Event|What `matcher` filters|Notes|
|`PermissionRequest`|tool name|Support includes `Bash`, `apply\_patch`\*, and MCP tool names|
|`PostToolUse`|tool name|Support includes `Bash`, `apply\_patch`\*, and MCP tool names|
|`PreToolUse`|tool name|Support includes `Bash`, `apply\_patch`\*, and MCP tool names|
|`SessionStart`|start source|Current runtime values are `startup`, `resume`, and `clear`|
|`UserPromptSubmit`|not supported|Any configured `matcher` is ignored for this event|
|`Stop`|not supported|Any configured `matcher` is ignored for this event|
\*For `apply\_patch`, matchers can also use `Edit` or `Write`.
Examples:
* `Bash`
* `^apply\_patch$`
* `Edit|Write`
* `mcp\_\_filesystem\_\_read\_file`
* `mcp\_\_filesystem\_\_.\*`
* `startup|resume|clear`
## Common input fields
Every command hook receives one JSON object on `stdin`.
These are the shared fields you will usually use:
|Field|Type|Meaning|
|`session\_id`|`string`|Current session or thread id.|
|`transcript\_path`|`string | null`|Path to the session transcript file, if any|
|`cwd`|`string`|Working directory for the session|
|`hook\_event\_name`|`string`|Current hook event name|
|`model`|`string`|Active model slug|
Turn-scoped hooks list `turn\_id` in their event-specific tables.
If you need the full wire format, see [Schemas](#schemas).
## Common output fields
`SessionStart`, `UserPromptSubmit`, and `Stop` support these shared JSON
fields:
```
`{
"continue": true,
"stopReason": "optional",
"systemMessage": "optional",
"suppressOutput": false
}`
```
|Field|Effect|
|`continue`|If `false`, marks that hook run as stopped|
|`stopReason`|Recorded as the reason for stopping|
|`systemMessage`|Surfaced as a warning in the UI or event stream|
|`suppressOutput`|Parsed today but not yet implemented|
Exit `0` with no output is treated as success and Codex continues.
`PreToolUse` and `PermissionRequest` support `systemMessage`, but `continue`,
`stopReason`, and `suppressOutput` aren’t currently supported for those events.
`PostToolUse` supports `systemMessage`, `continue: false`, and `stopReason`.
`suppressOutput` is parsed but not currently supported for that event.
## Hooks
### SessionStart
`matcher` is applied to `source` for this event.
Fields in addition to [Common input fields](#common-input-fields):
|Field|Type|Meaning|
|`source`|`string`|How the session started: `startup` or `resume`|
Plain text on `stdout` is added as extra developer context.
JSON on `stdout` supports [Common output fields](#common-output-fields) and this
hook-specific shape:
```
`{
"hookSpecificOutput": {
"hookEventName": "SessionStart",
"additionalContext": "Load the workspace conventions before editing."
}
}`
```
That `additionalContext` text is added as extra developer context.
### PreToolUse
`PreToolUse` can intercept Bash, file edits performed through `apply\_patch`,
and MCP tool calls. It is still a guardrail rather than a complete enforcement
boundary because Codex can often perform equivalent work through another
supported tool path.
This doesn’t intercept all shell calls yet, only the simple ones. The newer
`unified\_exec` mechanism allows richer streaming stdin/stdout handling of
shell, but interception is incomplete. Similarly, this doesn’t intercept
`WebSearch` or other non-shell, non-MCP tool calls.
`matcher` is applied to `tool\_name` and matcher aliases. For file edits through
`apply\_patch`, matchers can use `apply\_patch`, `Edit`, or `Write`; hook input
still reports `tool\_name: "apply\_patch"`.
Fields in addition to [Common input fields](#common-input-fields):
|Field|Type|Meaning|
|`turn\_id`|`string`|Codex-specific extension. Active Codex turn id|
|`tool\_name`|`string`|Canonical hook tool name, such as `Bash`, `apply\_patch`, or an MCP name like `mcp\_\_fs\_\_read`|
|`tool\_use\_id`|`string`|Tool-call id for this invocation|
|`tool\_input`|`JSON value`|Tool-specific input. `Bash` and `apply\_patch` use `tool\_input.command` while MCP tools send all the args.|
Plain text on `stdout` is ignored.
JSON on `stdout` can use `systemMessage` and can block a Bash command with this
hook-specific shape:
```
`{
"hookSpecificOutput": {
"hookEventName": "PreToolUse",
"permissionDecision": "deny",
"permissionDecisionReason": "Destructive command blocked by hook."
}
}`
```
Codex also accepts this older block shape:
```
`{
"decision": "block",
"reason": "Destructive command blocked by hook."
}`
```
You can also use exit code `2` and write the blocking reason to `stderr`.
`permissionDecision: "allow"` and `"ask"`, legacy `decision: "approve"`,
`updatedInput`, `additionalContext`, `continue: false`, `stopReason`, and
`suppressOutput` are parsed but not supported yet, so they fail open.
### PermissionRequest
`PermissionRequest` runs when Codex is about to ask for approval, such as a
shell escalation or managed-network approval. It can allow the request, deny
the request, or decline to decide and let the normal approval prompt continue.
It doesn’t run for commands that don’t need approval.
`matcher` is applied to `tool\_name` and matcher aliases. Current canonical
values include `Bash`, `apply\_patch`, and MCP tool names such as
`mcp\_\_server\_\_tool`; `apply\_patch` also matches `Edit` and `Write`.
Fields in addition to [Common input fields](#common-input-fields):
|Field|Type|Meaning|
|`turn\_id`|`string`|Codex-specific extension. Active Codex turn id|
|`tool\_name`|`string`|Canonical hook tool name, such as `Bash`, `apply\_patch`, or an MCP name like `mcp\_\_fs\_\_read`|
|`tool\_input`|`JSON value`|Tool-specific input. `Bash` and `apply\_patch` use `tool\_input.command` while MCP tools send all the args.|
|`tool\_input.description`|`string | null`|Human-readable approval reason, when Codex has one|
Plain text on `stdout` is ignored.
To approve the request, return:
```
`{
"hookSpecificOutput": {
"hookEventName": "PermissionRequest",
"decision": {
"behavior": "allow"
}
}
}`
```
To deny the request, return:
```
`{
"hookSpecificOutput": {
"hookEventName": "PermissionRequest",
"decision": {
"behavior": "deny",
"message": "Blocked by repository policy."
}
}
}`
```
If multiple matching hooks return decisions, any `deny` wins. Otherwise, an
`allow` lets the request proceed without surfacing the approval prompt. If no
matching hook decides, Codex uses the normal approval flow.
Don’t return `updatedInput`, `updatedPermissions`, or `interrupt` for
`PermissionRequest`; those fields are reserved for future behavior and fail
closed today.
### PostToolUse
`PostToolUse` runs after supported tools produce output, including Bash,
`apply\_patch`, and MCP tool calls. For Bash, it also runs after commands that
exit with a non-zero status. It can’t undo side effects from the tool that
already ran.
This doesn’t intercept all shell calls yet, only the simple ones. The newer
`unified\_exec` mechanism allows richer streaming stdin/stdout handling of
shell, but interception is incomplete. Similarly, this doesn’t intercept
`WebSearch` or other non-shell, non-MCP tool calls.
`matcher` is applied to `tool\_name` and matcher aliases. For file edits through
`apply\_patch`, matchers can use `apply\_patch`, `Edit`, or `Write`; hook input
still reports `tool\_name: "apply\_patch"`.
Fields in addition to [Common input fields](#common-input-fields):
|Field|Type|Meaning|
|`turn\_id`|`string`|Codex-specific extension. Active Codex turn id|
|`tool\_name`|`string`|Canonical hook tool name, such as `Bash`, `apply\_patch`, or an MCP name like `mcp\_\_fs\_\_read`|
|`tool\_use\_id`|`string`|Tool-call id for this invocation|
|`tool\_input`|`JSON value`|Tool-specific input. `Bash` and `apply\_patch` use `tool\_input.command` while MCP tools send all the args.|
|`tool\_response`|`JSON value`|Tool-specific output. For MCP tools, this is the MCP call result.|
Plain text on `stdout` is ignored.
JSON on `stdout` can use `systemMessage` and this hook-specific shape:
```
`{
"decision": "block",
"reason": "The Bash output needs review before continuing.",
"hookSpecificOutput": {
"hookEventName": "PostToolUse",
"additionalContext": "The command updated generated files."
}
}`
```
That `additionalContext` text is added as extra developer context.
For this event, `decision: "block"` doesn’t undo the completed Bash command.
Instead, Codex records the feedback, replaces the tool result with that
feedback, and continues the model from the hook-provided message.
You can also use exit code `2` and write the feedback reason to `stderr`.
To stop normal processing of the original tool result after the command has
already run, return `continue: false`. Codex will replace the tool result with
your feedback or stop text and continue from there.
`updatedMCPToolOutput` and `suppressOutput` are parsed but not supported yet,
so they fail open.
### UserPromptSubmit
`matcher` isn’t currently used for this event.
Fields in addition to [Common input fields](#common-input-fields):
|Field|Type|Meaning|
|`turn\_id`|`string`|Codex-specific extension. Active Codex turn id|
|`prompt`|`string`|User prompt that’s about to be sent|
Plain text on `stdout` is added as extra developer context.
JSON on `stdout` supports [Common output fields](#common-output-fields) and
this hook-specific shape:
```
`{
"hookSpecificOutput": {
"hookEventName": "UserPromptSubmit",
"additionalContext": "Ask for a clearer reproduction before editing files."
}
}`
```
That `additionalContext` text is added as extra developer context.
To block the prompt, return:
```
`{
"decision": "block",
"reason": "Ask for confirmation before doing that."
}`
```
You can also use exit code `2` and write the blocking reason to `stderr`.
### Stop
`matcher` isn’t currently used for this event.
Fields in addition to [Common input fields](#common-input-fields):
|Field|Type|Meaning|
|`turn\_id`|`string`|Codex-specific extension. Active Codex turn id|
|`stop\_hook\_active`|`boolean`|Whether this turn was already continued by `Stop`|
|`last\_assistant\_message`|`string | null`|Latest assistant message text, if available|
`Stop` expects JSON on `stdout` when it exits `0`. Plain text output is invalid
for this event.
JSON on `stdout` supports [Common output fields](#common-output-fields). To keep
Codex going, return:
```
`{
"decision": "block",
"reason": "Run one more pass over the failing tests."
}`
```
You can also use exit code `2` and write the continuation reason to `stderr`.
For this event, `decision: "block"` doesn’t reject the turn. Instead, it tells
Codex to continue and automatically creates a new continuation prompt that acts
as a new user prompt, using your `reason` as that prompt text.
If any matching `Stop` hook returns `continue: false`, that takes precedence
over continuation decisions from other matching `Stop` hooks.
## Schemas
If you need the exact current wire format, see the generated schemas in the
[Codex GitHub repository](https://github.com/openai/codex/tree/main/codex-rs/hooks/schema/generated).