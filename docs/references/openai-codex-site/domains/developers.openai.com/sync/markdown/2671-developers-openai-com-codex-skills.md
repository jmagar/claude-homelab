Agent Skills – Codex | OpenAI Developers
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
Use agent skills to extend Codex with task-specific capabilities. A skill packages instructions, resources, and optional scripts so Codex can follow a workflow reliably. Skills build on the [open agent skills standard](https://agentskills.io).
Skills are the authoring format for reusable workflows. Plugins are the installable distribution unit for reusable skills and apps in Codex. Use skills to design the workflow itself, then package it as a [plugin](/codex/plugins/build) when you want other developers to install it.
Skills are available in the Codex CLI, IDE extension, and Codex app.
Skills use **progressive disclosure** to manage context efficiently: Codex starts with each skill’s name, description, and file path. Codex loads the full `SKILL.md` instructions only when it decides to use a skill.
Codex includes an initial list of available skills in context so it can choose the right skill for a task. To avoid crowding out the rest of the prompt, this list is capped at roughly 2% of the model’s context window, or 8,000 characters when the context window is unknown. If many skills are installed, Codex shortens skill descriptions first. For very large skill sets, some skills may be omitted from the initial list, and Codex will show a warning.
This budget applies only to the initial skills list. When Codex selects a skill, it still reads the full SKILL.md instructions for that skill.
A skill is a directory with a `SKILL.md` file plus optional scripts and references. The `SKILL.md` file must include `name` and `description`.
* my-skill/
*
SKILL.md Required: instructions + metadata
*
scripts/ Optional: executable code
*
references/ Optional: documentation
*
assets/ Optional: templates, resources
* agents/
*
openai.yaml Optional: appearance and dependencies
## How Codex uses skills
Codex can activate skills in two ways:
1. **Explicit invocation:** Include the skill directly in your prompt. In CLI/IDE, run `/skills` or type `$` to mention a skill.
2. **Implicit invocation:** Codex can choose a skill when your task matches the skill `description`.
Because implicit matching depends on `description`, write concise descriptions with clear scope and boundaries. Front-load the key use case and trigger words so Codex can still match the skill if descriptions are shortened.
## Create a skill
Use the built-in creator first:
```
`$skill-creator`
```
The creator asks what the skill does, when it should trigger, and whether it should stay instruction-only or include scripts. Instruction-only is the default.
You can also create a skill manually by creating a folder with a `SKILL.md` file:
```
`---
name: skill-name
description: Explain exactly when this skill should and should not trigger.
---
Skill instructions for Codex to follow.`
```
Codex detects skill changes automatically. If an update doesn’t appear, restart Codex.
## Where to save skills
Codex reads skills from repository, user, admin, and system locations. For repositories, Codex scans `.agents/skills` in every directory from your current working directory up to the repository root. If two skills share the same `name`, Codex doesn’t merge them; both can appear in skill selectors.
|Skill Scope|Location|Suggested use|
|`REPO`|`$CWD/.agents/skills`
Current working directory: where you launch Codex.|If you’re in a repository or code environment, teams can check in skills relevant to a working folder. For example, skills only relevant to a microservice or a module.|
|`REPO`|`$CWD/../.agents/skills`
A folder above CWD when you launch Codex inside a Git repository.|If you’re in a repository with nested folders, organizations can check in skills relevant to a shared area in a parent folder.|
|`REPO`|`$REPO\_ROOT/.agents/skills`
The topmost root folder when you launch Codex inside a Git repository.|If you’re in a repository with nested folders, organizations can check in skills relevant to everyone using the repository. These serve as root skills available to any subfolder in the repository.|
|`USER`|`$HOME/.agents/skills`
Any skills checked into the user’s personal folder.|Use to curate skills relevant to a user that apply to any repository the user may work in.|
|`ADMIN`|`/etc/codex/skills`
Any skills checked into the machine or container in a shared, system location.|Use for SDK scripts, automation, and for checking in default admin skills available to each user on the machine.|
|`SYSTEM`|Bundled with Codex by OpenAI.|Useful skills relevant to a broad audience such as the skill-creator and plan skills. Available to everyone when they start Codex.|
Codex supports symlinked skill folders and follows the symlink target when scanning these locations.
These locations are for authoring and local discovery. When you want to
distribute reusable skills beyond a single repo, or optionally bundle them with
app integrations, use [plugins](/codex/plugins/build).
## Distribute skills with plugins
Direct skill folders are best for local authoring and repo-scoped workflows. If
you want to distribute a reusable skill, bundle two or more skills together, or
ship a skill alongside an app integration, package them as a
[plugin](/codex/plugins/build).
Plugins can include one or more skills. They can also optionally bundle app
mappings, MCP server configuration, and presentation assets in a single
package.
## Install curated skills for local use
To add curated skills beyond the built-ins for your own local Codex setup, use `$skill-installer`. For example, to install the `$linear` skill:
```
`$skill-installer linear`
```
You can also prompt the installer to download skills from other repositories.
Codex detects newly installed skills automatically; if one doesn’t appear,
restart Codex.
Use this for local setup and experimentation. For reusable distribution of your
own skills, prefer plugins.
## Enable or disable skills
Use `[[skills.config]]` entries in `\~/.codex/config.toml` to disable a skill without deleting it:
```
`[[skills.config]]
path = "/path/to/skill/SKILL.md"
enabled = false`
```
Restart Codex after changing `\~/.codex/config.toml`.
## Optional metadata
Add `agents/openai.yaml` to configure UI metadata in the [Codex app](/codex/app), to set invocation policy, and to declare tool dependencies for a more seamless experience with using the skill.
```
`interface:
display\_name: "Optional user-facing name"
short\_description: "Optional user-facing description"
icon\_small: "./assets/small-logo.svg"
icon\_large: "./assets/large-logo.png"
brand\_color: "#3B82F6"
default\_prompt: "Optional surrounding prompt to use the skill with"
policy:
allow\_implicit\_invocation: false
dependencies:
tools:
- type: "mcp"
value: "openaiDeveloperDocs"
description: "OpenAI Docs MCP server"
transport: "streamable\_http"
url: "https://developers.openai.com/mcp"`
```
`allow\_implicit\_invocation` (default: `true`): When `false`, Codex won’t implicitly invoke the skill based on user prompt; explicit `$skill` invocation still works.
## Best practices
* Keep each skill focused on one job.
* Prefer instructions over scripts unless you need deterministic behavior or external tooling.
* Write imperative steps with explicit inputs and outputs.
* Test prompts against the skill description to confirm the right trigger behavior.
For more examples, see [github.com/openai/skills](https://github.com/openai/skills) and [the agent skills specification](https://agentskills.io/specification).