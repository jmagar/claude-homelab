CLI – Codex | OpenAI Developers
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
Codex CLI is OpenAI’s coding agent that you can run locally from your terminal. It can read, change, and run code on your machine in the selected directory.
It’s [open source](https://github.com/openai/codex) and built in Rust for speed and efficiency.
ChatGPT Plus, Pro, Business, Edu, and Enterprise plans include Codex. Learn more about [what’s included](/codex/pricing).
## CLI setup
Choose your package manager
npmHomebrew
1.
1### Install
Install the Codex CLI with npm.
npm install command
npm i -g @openai/codexCopy
2.
2### Run
Run Codex in a terminal. It can inspect your repository, edit files, and run commands.
Run Codex command
codexCopy
The first time you run Codex, you'll be prompted to sign in. Authenticate with your ChatGPT account or an API key.
See the [pricing page](/codex/pricing) if you're not sure which plans include Codex access.
3.
3### Upgrade
New versions of the Codex CLI are released regularly. See the [changelog](/codex/changelog) for release notes. To upgrade with npm, run:
npm upgrade command
npm i -g @openai/codex@latestCopy
The Codex CLI is available on macOS, Windows, and Linux. On Windows, run Codex
natively in PowerShell with the Windows sandbox, or use WSL2 when you need a
Linux-native environment. For setup details, see the
[Windows setup guide](/codex/windows).
If you’re new to Codex, read the [best practices guide](/codex/learn/best-practices).
## Work with the Codex CLI
[### Run Codex interactively
Run `codex` to start an interactive terminal UI (TUI) session.
](/codex/cli/features#running-in-interactive-mode)[### Control model and reasoning
Use `/model` to switch between GPT-5.4, GPT-5.3-Codex, and other available models, or adjust reasoning levels.
](/codex/cli/features#models-reasoning)[### Image inputs
Attach screenshots or design specs so Codex reads them alongside your prompt.
](/codex/cli/features#image-inputs)[### Image generation
Generate or edit images directly in the CLI, and attach references when you want Codex to iterate on an existing asset.
](/codex/cli/features#image-generation)[### Run local code review
Get your code reviewed by a separate Codex agent before you commit or push your changes.
](/codex/cli/features#running-local-code-review)[### Use subagents
Use subagents to parallelize complex tasks.
](/codex/subagents)[### Web search
Use Codex to search the web and get up-to-date information for your task.
](/codex/cli/features#web-search)[### Codex Cloud tasks
Launch a Codex Cloud task, choose environments, and apply the resulting diffs without leaving your terminal.
](/codex/cli/features#working-with-codex-cloud)[### Scripting Codex
Automate repeatable workflows by scripting Codex with the `exec` command.
](/codex/noninteractive)[### Model Context Protocol
Give Codex access to additional third-party tools and context with Model Context Protocol (MCP).
](/codex/mcp)[### Approval modes
Choose the approval mode that matches your comfort level before Codex edits or runs commands.
](/codex/cli/features#approval-modes)