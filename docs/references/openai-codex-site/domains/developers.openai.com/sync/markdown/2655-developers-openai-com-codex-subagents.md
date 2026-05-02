Subagents – Codex | OpenAI Developers
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
Codex can run subagent workflows by spawning specialized agents in parallel and then collecting their results in one response. This can be particularly helpful for complex tasks that are highly parallel, such as codebase exploration or implementing a multi-step feature plan.
With subagent workflows, you can also define your own custom agents with different model configurations and instructions depending on the task.
For the concepts and tradeoffs behind subagent workflows, including context pollution, context rot, and model-selection guidance, see [Subagent concepts](/codex/concepts/subagents).
## Availability
Current Codex releases enable subagent workflows by default.
Subagent activity is currently surfaced in the Codex app and CLI. Visibility
in the IDE Extension is coming soon.
Codex only spawns subagents when you explicitly ask it to. Because each
subagent does its own model and tool work, subagent workflows consume more
tokens than comparable single-agent runs.
## Typical workflow
Codex handles orchestration across agents, including spawning new subagents,
routing follow-up instructions, waiting for results, and closing agent
threads.
When many agents are running, Codex waits until all requested results are
available, then returns a consolidated response.
Codex only spawns a new agent when you explicitly ask it to do so.
To see it in action, try the following prompt on your project:
```
`I would like to review the following points on the current PR (this branch vs main). Spawn one agent per point, wait for all of them, and summarize the result for each point.
1. Security issue
2. Code quality
3. Bugs
4. Race
5. Test flakiness
6. Maintainability of the code`
```
## Managing subagents
* Use `/agent` in the CLI to switch between active agent threads and inspect the ongoing thread.
* Ask Codex directly to steer a running subagent, stop it, or close completed agent threads.
## Approvals and sandbox controls
Subagents inherit your current sandbox policy.
In interactive CLI sessions, approval requests can surface from inactive agent
threads even while you are looking at the main thread. The approval overlay
shows the source thread label, and you can press `o` to open that thread before
you approve, reject, or answer the request.
In non-interactive flows, or whenever a run can’t surface a fresh approval, an
action that needs new approval fails and Codex surfaces the error back to the
parent workflow.
Codex also reapplies the parent turn’s live runtime overrides when it spawns a
child. That includes sandbox and approval choices you set interactively during
the session, such as `/approvals` changes or `--yolo`, even if the selected
custom agent file sets different defaults.
You can also override the sandbox configuration for individual [custom agents](#custom-agents), such as explicitly marking one to work in read-only mode.
## Custom agents
Codex ships with built-in agents:
* `default`: general-purpose fallback agent.
* `worker`: execution-focused agent for implementation and fixes.
* `explorer`: read-heavy codebase exploration agent.
To define your own custom agents, add standalone TOML files under
`\~/.codex/agents/` for personal agents or `.codex/agents/` for project-scoped
agents.
Each file defines one custom agent. Codex loads these files as configuration
layers for spawned sessions, so custom agents can override the same settings as
a normal Codex session config. That can feel heavier than a dedicated agent
manifest, and the format may evolve as authoring and sharing mature.
Every standalone custom agent file must define:
* `name`
* `description`
* `developer\_instructions`
Optional fields such as `nickname\_candidates`, `model`,
`model\_reasoning\_effort`, `sandbox\_mode`, `mcp\_servers`, and `skills.config`
inherit from the parent session when you omit them.
### Global settings
Global subagent settings still live under `[agents]` in your [configuration](/codex/config-basic#configuration-precedence).
|Field|Type|Required|Purpose|
|`agents.max\_threads`|number|No|Concurrent open agent thread cap.|
|`agents.max\_depth`|number|No|Spawned agent nesting depth (root session starts at 0).|
|`agents.job\_max\_runtime\_seconds`|number|No|Default timeout per worker for `spawn\_agents\_on\_csv` jobs.|
**Notes:**
* `agents.max\_threads` defaults to `6` when you leave it unset.
* `agents.max\_depth` defaults to `1`, which allows a direct child agent to spawn but prevents deeper nesting. Keep the default unless you specifically need recursive delegation. Raising this value can turn broad delegation instructions into repeated fan-out, which increases token usage, latency, and local resource consumption. `agents.max\_threads` still caps concurrent open threads, but it doesn’t remove the cost and predictability risks of deeper recursion.
* `agents.job\_max\_runtime\_seconds` is optional. When you leave it unset, `spawn\_agents\_on\_csv` falls back to its per-call default timeout of 1800 seconds per worker.
* If a custom agent name matches a built-in agent such as `explorer`, your custom agent takes precedence.
### Custom agent file schema
|Field|Type|Required|Purpose|
|`name`|string|Yes|Agent name Codex uses when spawning or referring to this agent.|
|`description`|string|Yes|Human-facing guidance for when Codex should use this agent.|
|`developer\_instructions`|string|Yes|Core instructions that define the agent’s behavior.|
|`nickname\_candidates`|string[]|No|Optional pool of display nicknames for spawned agents.|
You can also include other supported `config.toml` keys in a custom agent file, such as `model`, `model\_reasoning\_effort`, `sandbox\_mode`, `mcp\_servers`, and `skills.config`.
Codex identifies the custom agent by its `name` field. Matching the filename to
the agent name is the simplest convention, but the `name` field is the source
of truth.
### Display nicknames
Use `nickname\_candidates` when you want Codex to assign more readable display
names to spawned agents. This is especially helpful when you run many
instances of the same custom agent and want the UI to show distinct labels
instead of repeating the same agent name.
Nicknames are presentation-only. Codex still identifies and spawns the agent by
its `name`.
Nickname candidates must be a non-empty list of unique names. Each nickname can
use ASCII letters, digits, spaces, hyphens, and underscores.
Example:
```
`name = "reviewer"
description = "PR reviewer focused on correctness, security, and missing tests."
developer\_instructions = """
Review code like an owner.
Prioritize correctness, security, behavior regressions, and missing test coverage.
"""
nickname\_candidates = ["Atlas", "Delta", "Echo"]`
```
In practice, the Codex app and CLI can show the nicknames where agent activity
appears, while the underlying agent type stays
`reviewer`.
### Example custom agents
The best custom agents are narrow and opinionated. Give each one clear job, a
tool surface that matches that job, and instructions that keep it from
drifting into adjacent work.
#### Example 1: PR review
This pattern splits review across three focused custom agents:
* `pr\_explorer` maps the codebase and gathers evidence.
* `reviewer` looks for correctness, security, and test risks.
* `docs\_researcher` checks framework or API documentation through a dedicated MCP server.
Project config (`.codex/config.toml`):
```
`[agents]
max\_threads = 6
max\_depth = 1`
```
`.codex/agents/pr-explorer.toml`:
```
`name = "pr\_explorer"
description = "Read-only codebase explorer for gathering evidence before changes are proposed."
model = "gpt-5.3-codex-spark"
model\_reasoning\_effort = "medium"
sandbox\_mode = "read-only"
developer\_instructions = """
Stay in exploration mode.
Trace the real execution path, cite files and symbols, and avoid proposing fixes unless the parent agent asks for them.
Prefer fast search and targeted file reads over broad scans.
"""`
```
`.codex/agents/reviewer.toml`:
```
`name = "reviewer"
description = "PR reviewer focused on correctness, security, and missing tests."
model = "gpt-5.4"
model\_reasoning\_effort = "high"
sandbox\_mode = "read-only"
developer\_instructions = """
Review code like an owner.
Prioritize correctness, security, behavior regressions, and missing test coverage.
Lead with concrete findings, include reproduction steps when possible, and avoid style-only comments unless they hide a real bug.
"""`
```
`.codex/agents/docs-researcher.toml`:
```
`name = "docs\_researcher"
description = "Documentation specialist that uses the docs MCP server to verify APIs and framework behavior."
model = "gpt-5.4-mini"
model\_reasoning\_effort = "medium"
sandbox\_mode = "read-only"
developer\_instructions = """
Use the docs MCP server to confirm APIs, options, and version-specific behavior.
Return concise answers with links or exact references when available.
Do not make code changes.
"""
[mcp\_servers.openaiDeveloperDocs]
url = "https://developers.openai.com/mcp"`
```
This setup works well for prompts like:
```
`Review this branch against main. Have pr\_explorer map the affected code paths, reviewer find real risks, and docs\_researcher verify the framework APIs that the patch relies on.`
```
## Process CSV batches with subagents (experimental)
This workflow is experimental and may change as subagent support evolves.
Use `spawn\_agents\_on\_csv` when you have many similar tasks that map to one row per work item. Codex reads the CSV, spawns one worker subagent per row, waits for the full batch to finish, and exports the combined results to CSV.
This works well for repeated audits such as:
* reviewing one file, package, or service per row
* checking a list of incidents, PRs, or migration targets
* generating structured summaries for many similar inputs
The tool accepts:
* `csv\_path` for the source CSV
* `instruction` for the worker prompt template, using `{column\_name}` placeholders
* `id\_column` when you want stable item ids from a specific column
* `output\_schema` when each worker should return a JSON object with a fixed shape
* `output\_csv\_path`, `max\_concurrency`, and `max\_runtime\_seconds` for job control
Each worker must call `report\_agent\_job\_result` exactly once. If a worker exits without reporting a result, Codex marks that row with an error in the exported CSV.
Example prompt:
```
`Create /tmp/components.csv with columns path,owner and one row per frontend component.
Then call spawn\_agents\_on\_csv with:
- csv\_path: /tmp/components.csv
- id\_column: path
- instruction: "Review {path} owned by {owner}. Return JSON with keys path, risk, summary, and follow\_up via report\_agent\_job\_result."
- output\_csv\_path: /tmp/components-review.csv
- output\_schema: an object with required string fields path, risk, summary, and follow\_up`
```
When you run this through `codex exec`, Codex shows a single-line progress update on `stderr` while the batch is running. The exported CSV includes the original row data plus metadata such as `job\_id`, `item\_id`, `status`, `last\_error`, and `result\_json`.
Related runtime settings:
* `agents.max\_threads` caps how many agent threads can stay open concurrently.
* `agents.job\_max\_runtime\_seconds` sets the default per-worker timeout for CSV fan-out jobs. A per-call `max\_runtime\_seconds` override takes precedence.
* `sqlite\_home` controls where Codex stores the SQLite-backed state used for agent jobs and their exported results.
#### Example 2: Frontend integration debugging
This pattern is useful for UI regressions, flaky browser flows, or integration bugs that cross application code and the running product.
Project config (`.codex/config.toml`):
```
`[agents]
max\_threads = 6
max\_depth = 1`
```
`.codex/agents/code-mapper.toml`:
```
`name = "code\_mapper"
description = "Read-only codebase explorer for locating the relevant frontend and backend code paths."
model = "gpt-5.4-mini"
model\_reasoning\_effort = "medium"
sandbox\_mode = "read-only"
developer\_instructions = """
Map the code that owns the failing UI flow.
Identify entry points, state transitions, and likely files before the worker starts editing.
"""`
```
`.codex/agents/browser-debugger.toml`:
```
`name = "browser\_debugger"
description = "UI debugger that uses browser tooling to reproduce issues and capture evidence."
model = "gpt-5.4"
model\_reasoning\_effort = "high"
sandbox\_mode = "workspace-write"
developer\_instructions = """
Reproduce the issue in the browser, capture exact steps, and report what the UI actually does.
Use browser tooling for screenshots, console output, and network evidence.
Do not edit application code.
"""
[mcp\_servers.chrome\_devtools]
url = "http://localhost:3000/mcp"
startup\_timeout\_sec = 20`
```
`.codex/agents/ui-fixer.toml`:
```
`name = "ui\_fixer"
description = "Implementation-focused agent for small, targeted fixes after the issue is understood."
model = "gpt-5.3-codex-spark"
model\_reasoning\_effort = "medium"
developer\_instructions = """
Own the fix once the issue is reproduced.
Make the smallest defensible change, keep unrelated files untouched, and validate only the behavior you changed.
"""
[[skills.config]]
path = "/Users/me/.agents/skills/docs-editor/SKILL.md"
enabled = false`
```
This setup works well for prompts like:
```
`Investigate why the settings modal fails to save. Have browser\_debugger reproduce it, code\_mapper trace the responsible code path, and ui\_fixer implement the smallest fix once the failure mode is clear.`
```