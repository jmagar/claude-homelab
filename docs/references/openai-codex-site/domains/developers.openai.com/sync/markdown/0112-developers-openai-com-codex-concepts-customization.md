Customization – Codex | OpenAI Developers
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
Customization is how you make Codex work the way your team works.
In Codex, customization comes from a few layers that work together:
* **Project guidance (`AGENTS.md`)** for persistent instructions
* **[Memories](/codex/memories)** for useful context learned from prior work
* **Skills** for reusable workflows and domain expertise
* **[MCP](/codex/mcp)** for access to external tools and shared systems
* **[Subagents](/codex/concepts/subagents)** for delegating work to specialized subagents
These are complementary, not competing. `AGENTS.md` shapes behavior, memories
carry local context forward, skills package repeatable processes, and
[MCP](/codex/mcp) connects Codex to systems outside the local workspace.
## AGENTS Guidance
`AGENTS.md` gives Codex durable project guidance that travels with your repository and applies before the agent starts work. Keep it small.
Use it for the rules you want Codex to follow every time in a repo, such as:
* Build and test commands
* Review expectations
* repo-specific conventions
* Directory-specific instructions
When the agent makes incorrect assumptions about your codebase, correct them in `AGENTS.md` and ask the agent to update `AGENTS.md` so the fix persists. Treat it as a feedback loop.
**Updating `AGENTS.md`:** Start with only the instructions that matter. Codify recurring review feedback, put guidance in the closest directory where it applies, and tell the agent to update `AGENTS.md` when you correct something so future sessions inherit the fix.
### When to update `AGENTS.md`
* **Repeated mistakes**: If the agent makes the same mistake repeatedly, add a rule.
* **Too much reading**: If it finds the right files but reads too many documents, add routing guidance (which directories/files to prioritize).
* **Recurring PR feedback**: If you leave the same feedback more than once, codify it.
* **In GitHub**: In a pull request comment, tag `@codex` with a request (for example, `@codex add this to AGENTS.md`) to delegate the update to a cloud task.
* **Automate drift checks**: Use [automations](/codex/app/automations) to run recurring checks (for example, daily) that look for guidance gaps and suggest what to add to `AGENTS.md`.
Pair `AGENTS.md` with infrastructure that enforces those rules: pre-commit hooks, linters, and type checkers catch issues before you see them, so the system gets smarter about preventing recurring mistakes.
Codex can load guidance from multiple locations: a global file in your Codex home directory (for you as a developer) and repo-specific files that teams can check in. Files closer to the working directory take precedence.
Use the global file to shape how Codex communicates with you (for example, review style, verbosity, and defaults), and keep repo files focused on team and codebase rules.
* \~/.codex/
*
AGENTS.md Global (for you as a developer)
* repo-root/
*
AGENTS.md repo-specific (for your team)
[Custom instructions with AGENTS.md](/codex/guides/agents-md)
## Skills
Skills give Codex reusable capabilities for repeatable workflows.
Skills are often the best fit for reusable workflows because they support richer instructions, scripts, and references while staying reusable across tasks.
Skills are loaded and visible to the agent (at least their metadata), so Codex can discover and choose them implicitly. This keeps rich workflows available without bloating context up front.
Use skill folders to author and iterate on workflows locally. If a plugin
already exists for the workflow, install it first to reuse a proven setup. When
you want to distribute your own workflow across teams or bundle it with app
integrations, package it as a [plugin](/codex/plugins/build). Skills remain the
authoring format; plugins are the installable distribution unit.
A skill is typically a `SKILL.md` file plus optional scripts, references, and assets.
* my-skill/
*
SKILL.md Required: instructions + metadata
*
scripts/ Optional: executable code
*
references/ Optional: documentation
*
assets/ Optional: templates, resources
The skill directory can include a `scripts/` folder with CLI scripts that Codex invokes as part of the workflow (for example, seed data or run validations). When the workflow needs external systems (issue trackers, design tools, docs servers), pair the skill with [MCP](/codex/mcp).
Example `SKILL.md`:
```
`---
name: commit
description: Stage and commit changes in semantic groups. Use when the user wants to commit, organize commits, or clean up a branch before pushing.
---
1. Do not run `git add .`. Stage files in logical groups by purpose.
2. Group into separate commits: feat → test → docs → refactor → chore.
3. Write concise commit messages that match the change scope.
4. Keep each commit focused and reviewable.`
```
Use skills for:
* Repeatable workflows (release steps, review routines, docs updates)
* Team-specific expertise
* Procedures that need examples, references, or helper scripts
Skills can be global (in your user directory, for you as a developer) or repo-specific (checked into `.agents/skills`, for your team). Put repo skills in `.agents/skills` when the workflow applies to that project; use your user directory for skills you want across all repos.
|Layer|Global|Repo|
|AGENTS|`\~/.codex/AGENTS.md`|`AGENTS.md` in repo root or nested directories|
|Skills|`$HOME/.agents/skills`|`.agents/skills` in repo|
Codex uses progressive disclosure for skills:
* It starts with metadata (`name`, `description`) for discovery
* It loads `SKILL.md` only when a skill is chosen
* It reads references or runs scripts only when needed
Skills can be invoked explicitly, and Codex can also choose them implicitly when the task matches the skill description. Clear skill descriptions improve triggering reliability.
[Agent Skills](/codex/skills)
## MCP
MCP (Model Context Protocol) is the standard way to connect Codex to external tools and context providers.
It’s especially useful for remotely hosted systems such as Figma, Linear, GitHub, or internal knowledge services your team depends on.
Use MCP when Codex needs capabilities that live outside the local repo, such as issue trackers, design tools, browsers, or shared documentation systems.
One way to think about it:
* **Host**: Codex
* **Client**: the MCP connection inside Codex
* **Server**: the external tool or context provider
MCP servers can expose:
* **Tools** (actions)
* **Resources** (readable data)
* **Prompts** (reusable prompt templates)
This separation helps you reason about trust and capability boundaries. Some servers mainly provide context, while others expose powerful actions.
In practice, MCP is often most useful when paired with skills:
* A skill defines the workflow and names the MCP tools to use
[Model Context Protocol](/codex/mcp)
## Subagents
You can create different agents with different roles and prompt them to use tools differently. For example, one agent might run specific testing commands and configurations, while another has MCP servers that fetch production logs for debugging. Each subagent stays focused and uses the right tools for its job.
[Subagent concepts](/codex/concepts/subagents)
## Skills + MCP together
Skills plus MCP is where it all comes together: skills define repeatable workflows, and MCP connects them to external tools and systems.
If a skill depends on MCP, declare that dependency in `agents/openai.yaml` so Codex can install and wire it automatically (see [Agent Skills](/codex/skills)).
## Next step
Build in this order:
1. [Custom instructions with AGENTS.md](/codex/guides/agents-md) so Codex follows your repo conventions. Add pre-commit hooks and linters to enforce those rules.
2. Install a [plugin](/codex/plugins) when a reusable workflow already exists. Otherwise, create a [skill](/codex/skills) and package it as a plugin when you want to share it.
3. [MCP](/codex/mcp) when workflows need external systems (Linear, GitHub, docs servers, design tools).
4. [Subagents](/codex/subagents) when you’re ready to delegate noisy or specialized tasks to subagents.