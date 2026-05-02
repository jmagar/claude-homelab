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
Codex can run subagent workflows by spawning specialized agents in parallel so
they can explore, tackle, or analyze work concurrently.
This page explains the core concepts and tradeoffs. For setup, agent configuration, and examples, see [Subagents](/codex/subagents).
## Why subagent workflows help
Even with large context windows, models have limits. If you flood the main conversation (where you’re defining requirements, constraints, and decisions) with noisy intermediate output such as exploration notes, test logs, stack traces, and command output, the session can become less reliable over time.
This is often described as:
* **Context pollution**: useful information gets buried under noisy intermediate output.
* **Context rot**: performance degrades as the conversation fills up with less relevant details.
For background, see the Chroma writeup on [context rot](https://research.trychroma.com/context-rot).
Subagent workflows help by moving noisy work off the main thread:
* Keep the **main agent** focused on requirements, decisions, and final outputs.
* Run specialized **subagents** in parallel for exploration, tests, or log analysis.
* Return **summaries** from subagents instead of raw intermediate output.
They can also save time when the work can run independently in parallel, and
they make larger-shaped tasks more tractable by breaking them into bounded
pieces. For example, Codex can split analysis of a multi-million-token
document into smaller problems and return distilled takeaways to the main
thread.
As a starting point, use parallel agents for read-heavy tasks such as
exploration, tests, triage, and summarization. Be more careful with parallel
write-heavy workflows, because agents editing code at once can create
conflicts and increase coordination overhead.
## Core terms
Codex uses a few related terms in subagent workflows:
* **Subagent workflow**: A workflow where Codex runs parallel agents and combines their results.
* **Subagent**: A delegated agent that Codex starts to handle a specific task.
* **Agent thread**: The CLI thread for an agent, which you can inspect and switch between with `/agent`.
## Triggering subagent workflows
Codex doesn’t spawn subagents automatically, and it should only use subagents when you
explicitly ask for subagents or parallel agent work.
In practice, manual triggering means using direct instructions such as
“spawn two agents,” “delegate this work in parallel,” or “use one agent per
point.” Subagent workflows consume more tokens than comparable single-agent runs
because each subagent does its own model and tool work.
A good subagent prompt should explain how to divide the work, whether Codex
should wait for all agents before continuing, and what summary or output to
return.
```
`Review this branch with parallel subagents. Spawn one subagent for security risks, one for test gaps, and one for maintainability. Wait for all three, then summarize the findings by category with file references.`
```
## Choosing models and reasoning
Different agents need different model and reasoning settings.
If you don’t pin a model or `model\_reasoning\_effort`, Codex can choose a setup
that balances intelligence, speed, and price for the task. It may favor
`gpt-5.4-mini` for fast scans or a higher-effort `gpt-5.5` configuration for
more demanding reasoning when that model is available. When you want finer
control, steer that choice in your prompt or set `model` and
`model\_reasoning\_effort` directly in the agent file.
For most tasks in Codex, start with `gpt-5.5` when it is available. Continue
using `gpt-5.4` during the rollout if `gpt-5.5` is not yet available. Use
`gpt-5.4-mini` when you want a faster, lower-cost option for lighter subagent
work. If you have ChatGPT Pro and want near-instant text-only iteration,
`gpt-5.3-codex-spark` remains available in research preview.
### Model choice
* **`gpt-5.5`**: Start here for demanding agents when it is available. It is strongest for ambiguous, multi-step work that needs planning, tool use, validation, and follow-through across a larger context.
* **`gpt-5.4`**: Use this when `gpt-5.5` is not yet available or when a workflow is pinned to GPT-5.4. It combines strong coding, reasoning, tool use, and broader workflows.
* **`gpt-5.4-mini`**: Use for agents that favor speed and efficiency over depth, such as exploration, read-heavy scans, large-file review, or processing supporting documents. It works well for parallel workers that return distilled results to the main agent.
* **`gpt-5.3-codex-spark`**: If you have ChatGPT Pro, use this research preview model for near-instant, text-only iteration when latency matters more than broader capability.
### Reasoning effort (`model\_reasoning\_effort`)
* **`high`**: Use when an agent needs to trace complex logic, check assumptions, or work through edge cases (for example, reviewer or security-focused agents).
* **`medium`**: A balanced default for most agents.
* **`low`**: Use when the task is straightforward and speed matters most.
Higher reasoning effort increases response time and token usage, but it can improve quality for complex work. For details, see [Models](/codex/models), [Config basics](/codex/config-basic), and [Configuration Reference](/codex/config-reference).