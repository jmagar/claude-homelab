Memories – Codex | OpenAI Developers
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
Memories are off by default and aren’t available in the European Economic
Area, the United Kingdom, or Switzerland at launch. Enable them in Codex
settings, or set `memories = true` in the `[features]` table in
`\~/.codex/config.toml`.
Memories let Codex carry useful context from earlier threads into future work.
After you enable memories, Codex can remember stable preferences, recurring
workflows, tech stacks, project conventions, and known pitfalls so you don’t
need to repeat the same context in every thread.
Keep required team guidance in `AGENTS.md` or checked-in documentation. Treat
memories as a helpful local recall layer, not as the only source for rules that
must always apply.
[Chronicle](/codex/memories/chronicle) helps Codex recover recent working
context from your screen to build up memory.
## Enable memories
In the Codex app, enable Memories in settings.
For config-based setup, add the feature flag to `config.toml`:
```
`[features]
memories = true`
```
See [Config basics](/codex/config-basic) for where Codex stores user-level
configuration and how Codex loads `\~/.codex/config.toml`.
## How memories work
After you enable memories, Codex can turn useful context from eligible prior
threads into local memory files. Codex skips active or short-lived sessions,
redacts secrets from generated memory fields, and updates memories in the
background instead of immediately at the end of every thread.
Memories may not update right away when a thread ends. Codex waits until a
thread has been idle long enough to avoid summarizing work that’s still in
progress.
Memory generation can also skip a background pass when your Codex rate-limit
remaining percentage is below the configured threshold, so Codex doesn’t spend
quota when you’re near a limit.
## Memory storage
Codex stores memories under your Codex home directory. By default, that’s
`\~/.codex`. See [Config and state locations](/codex/config-advanced#config-and-state-locations)
for how Codex uses `CODEX\_HOME`.
The main memory files live under `\~/.codex/memories/` and include summaries,
durable entries, recent inputs, and supporting evidence from prior threads.
Treat these files as generated state. You can inspect them when troubleshooting
or before sharing your Codex home directory, but don’t rely on editing them by
hand as your primary control surface.
## Control memories per thread
In the Codex app and Codex TUI, use `/memories` to control memory behavior for
the current thread. Thread-level choices let you decide whether the current
thread can use existing memories and whether Codex can use the thread to
generate future memories.
Thread-level choices don’t change your global memory settings.
## Configuration
Enable memories in the Codex app settings, or set `memories = true` in the
`[features]` section of `config.toml`.
For config file locations and the full list of memory-related settings, see the
[configuration reference](/codex/config-reference).
Common memory-specific settings include:
* `memories.generate\_memories`: controls whether newly created threads can be
stored as memory-generation inputs.
* `memories.use\_memories`: controls whether Codex injects existing memories into
future sessions.
* `memories.disable\_on\_external\_context`: when `true`, keeps threads that used
external context such as MCP tool calls, web search, or tool search out of
memory generation. The older `memories.no\_memories\_if\_mcp\_or\_web\_search` key
is still accepted as an alias.
* `memories.min\_rate\_limit\_remaining\_percent`: controls the minimum remaining
Codex rate-limit percentage required before memory generation starts.
* `memories.extract\_model`: overrides the model used for per-thread memory
extraction.
* `memories.consolidation\_model`: overrides the model used for global memory
consolidation.
## Review memories
Don’t store secrets in memories. Codex redacts secrets from generated memory
fields, but you should still review memory files before sharing your Codex home
directory or generated memory artifacts.