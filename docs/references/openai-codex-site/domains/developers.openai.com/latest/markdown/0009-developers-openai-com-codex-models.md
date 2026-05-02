Models – Codex | OpenAI Developers
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
## Recommended models
gpt-5.5
OpenAI's newest frontier model for complex coding, computer use, knowledge work, and research workflows in Codex.
codex -m gpt-5.5
Copy command
Capability
Speed
Codex CLI & SDK
Codex app & IDE extension
Codex Cloud
ChatGPT Credits
API Access
gpt-5.4
Flagship frontier model for professional work that brings the industry-leading coding capabilities of GPT-5.3-Codex together with stronger reasoning, tool use, and agentic workflows.
codex -m gpt-5.4
Copy command
Capability
Speed
Codex CLI & SDK
Codex app & IDE extension
Codex Cloud
ChatGPT Credits
API Access
gpt-5.4-mini
Fast, efficient mini model for responsive coding tasks and subagents.
codex -m gpt-5.4-mini
Copy command
Capability
Speed
Codex CLI & SDK
Codex app & IDE extension
Codex Cloud
ChatGPT Credits
API Access
gpt-5.3-codex
Industry-leading coding model for complex software engineering. Its coding capabilities now also power GPT-5.4.
codex -m gpt-5.3-codex
Copy command
Capability
Speed
Codex CLI & SDK
Codex app & IDE extension
Codex Cloud
ChatGPT Credits
API Access
gpt-5.3-codex-spark
Text-only research preview model optimized for near-instant, real-time coding iteration. Available to ChatGPT Pro users.
codex -m gpt-5.3-codex-spark
Copy command
Capability
Speed
Codex CLI & SDK
Codex app & IDE extension
Codex Cloud
ChatGPT Credits
API Access
For most tasks in Codex, start with `gpt-5.5` when it appears in your model
picker. It is strongest for complex coding, computer use, knowledge work, and
research workflows. GPT-5.5 is currently available in Codex when you sign in
with ChatGPT; it isn’t available with API-key authentication. During the
rollout, continue using `gpt-5.4` if `gpt-5.5` is not yet available. Use
`gpt-5.4-mini` when you want a faster, lower-cost option for lighter coding
tasks or subagents. The `gpt-5.3-codex-spark` model is available in research
preview for ChatGPT Pro subscribers and is optimized for near-instant,
real-time coding iteration.
## Alternative models
gpt-5.2
Previous general-purpose model for coding and agentic tasks, including hard debugging tasks that benefit from deeper deliberation.
codex -m gpt-5.2
Copy command
Show details
## Other models
When you sign in with ChatGPT, Codex works best with the models listed above.
You can also point Codex at any model and provider that supports either the [Chat Completions](https://platform.openai.com/docs/api-reference/chat) or [Responses APIs](https://platform.openai.com/docs/api-reference/responses) to fit your specific use case.
Support for the Chat Completions API is deprecated and will be removed in
future releases of Codex.
## Configuring models
### Configure your default local model
The Codex CLI and IDE extension use the same `config.toml` [configuration file](/codex/config-basic). To specify a model, add a `model` entry to your configuration file. If you don’t specify a model, the Codex app, CLI, or IDE Extension defaults to a recommended model.
```
`model = "gpt-5.5"`
```
If `gpt-5.5` isn’t available in your account yet, use `gpt-5.4`.
### Choosing a different local model temporarily
In the Codex CLI, you can use the `/model` command during an active thread to change the model. In the IDE extension, you can use the model selector below the input box to choose your model.
To start a new Codex CLI thread with a specific model or to specify the model for `codex exec` you can use the `--model`/`-m` flag:
```
`codex -m gpt-5.5`
```
### Choosing your model for cloud tasks
Currently, you can’t change the default model for Codex cloud tasks.