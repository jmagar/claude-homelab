Commands – Codex app | OpenAI Developers
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
Use these commands and keyboard shortcuts to navigate the Codex app.
## Keyboard shortcuts
||Action|macOS shortcut|
|**General**|||
||Command menu|Cmd + Shift + P or Cmd + K|
||Settings|Cmd + ,|
||Open folder|Cmd + O|
||Navigate back|Cmd + [|
||Navigate forward|Cmd + ]|
||Increase font size|Cmd + + or Cmd + =|
||Decrease font size|Cmd + - or Cmd + \_|
||Toggle sidebar|Cmd + B|
||Toggle diff panel|Cmd + Option + B|
||Toggle terminal|Cmd + J|
||Clear the terminal|Ctrl + L|
|**Thread**|||
||New thread|Cmd + N or Cmd + Shift + O|
||Find in thread|Cmd + F|
||Previous thread|Cmd + Shift + [|
||Next thread|Cmd + Shift + ]|
||Dictation|Ctrl + M|
## Slash commands
Slash commands let you control Codex without leaving the thread composer. Available commands vary based on your environment and access.
### Use a slash command
1. In the thread composer, type `/`.
2. Select a command from the list, or keep typing to filter (for example, `/status`).
You can also explicitly invoke skills by typing `$` in the thread composer. See [Skills](/codex/skills).
Enabled skills also appear in the slash command list.
### Available slash commands
|Slash command|Description|
|`/feedback`|Open the feedback dialog to submit feedback and optionally include logs.|
|`/mcp`|Open MCP status to view connected servers.|
|`/plan-mode`|Toggle plan mode for multi-step planning.|
|`/review`|Start code review mode to review uncommitted changes or compare against a base branch.|
|`/status`|Show the thread ID, context usage, and rate limits.|
## Deeplinks
The Codex app registers the `codex://` URL scheme so links can open specific parts of the app directly.
|Deeplink|Opens|Supported query parameters|
|`codex://settings`|Settings.|None.|
|`codex://skills`|Skills.|None.|
|`codex://automations`|Inbox in automation create mode.|None.|
|`codex://threads/\<thread-id\>`|A local thread. `\<thread-id\>` must be a UUID.|None.|
|`codex://new`|A new thread.|Optional: `prompt`, `originUrl`, `path`.|
For new-thread deeplinks:
* `prompt` sets the initial composer text.
* `path` must be an absolute path to a local directory and, when valid, makes that directory the active workspace for the new thread.
* `originUrl` tries to match one of your current workspace roots by Git remote URL. If both `path` and `originUrl` are present, Codex resolves `path` first.
## See also
* [Features](/codex/app/features)
* [Settings](/codex/app/settings)