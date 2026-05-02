App – Codex | OpenAI Developers
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
The Codex app is a focused desktop experience for working on Codex threads in parallel, with built-in worktree support, automations, and Git functionality.
ChatGPT Plus, Pro, Business, Edu, and Enterprise plans include Codex. Learn more about [what’s included](/codex/pricing).
## Getting started
The Codex app is available on macOS and Windows.
Most Codex app features are available on both platforms. Platform-specific
exceptions are noted in the relevant docs.
1. Download and install the Codex app
Download the Codex app for macOS or Windows. Choose the Intel build if you’re using an Intel-based Mac.
[Download for macOS (Apple Silicon)](https://persistent.oaistatic.com/codex-app-prod/Codex.dmg)[Download for macOS (Intel)](https://persistent.oaistatic.com/codex-app-prod/Codex-latest-x64.dmg)
Need a different operating system?
[Download for Windows](https://get.microsoft.com/installer/download/9PLM9XGG6VKS?cid=website_cta_psi)
[Get notified for Linux](https://openai.com/form/codex-app/)
2. Open Codex and sign in
Once you downloaded and installed the Codex app, open it and sign in with your ChatGPT account or an OpenAI API key.
If you sign in with an OpenAI API key, some functionality such as [cloud threads](/codex/prompting#threads) might not be available.
3. Select a project
Choose a project folder that you want Codex to work in.
If you used the Codex app, CLI, or IDE Extension before you’ll see past projects that you worked on.
1. Send your first message
After choosing the project, make sure **Local** is selected to have Codex work on your machine and send your first message to Codex.
You can ask Codex anything about the project or your computer in general. Here are some examples:
Tell me about this projectBuild a classic Snake game in this repo.Find and fix bugs in my codebase with minimal, high-confidence changes.
If you need more inspiration, explore [Codex use cases](/codex/use-cases).
If you’re new to Codex, read the [best practices guide](/codex/learn/best-practices).
## Work with the Codex app
[### Multitask across projects
Run project threads side by side and switch between them quickly.
](/codex/app/features#multitask-across-projects)[### Worktrees
Keep parallel code changes isolated with built-in Git worktree support.
](/codex/app/worktrees)[### Computer use
Let Codex use macOS apps for GUI tasks, browser flows, and native app testing.
](/codex/app/computer-use)[### Review and ship changes
Inspect diffs, address PR feedback, stage files, commit, and push.
](/codex/app/review)[### Terminal and actions
Run commands in each thread and launch repeatable project actions.
](/codex/app/features#integrated-terminal)[### In-app browser
Open rendered pages, leave comments, or let Codex operate local browser flows.
](/codex/app/browser)[### Image generation
Generate or edit images in a thread while you work on the surrounding code and assets.
](/codex/app/features#image-generation)[### Automations
Schedule recurring tasks, or wake up the same thread for ongoing checks.
](/codex/app/automations)[### Skills
Reuse instructions and workflows across the app, CLI, and IDE Extension.
](/codex/app/features#skills-support)[### Sidebar and artifacts
Follow plans, sources, task summaries, and generated file previews.
](/codex/app/features#richer-outputs-and-artifacts)[### Plugins
Connect apps, skills, and MCP servers to extend what Codex can do.
](/codex/plugins)[### IDE Extension sync
Share Auto Context and active threads across app and IDE sessions.
](/codex/app/features#sync-with-the-ide-extension)
Need help? Visit the [troubleshooting guide](/codex/app/troubleshooting).