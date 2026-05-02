Use Codex in Linear | OpenAI Developers
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
Use Codex in Linear to delegate work from issues. Assign an issue to Codex or mention `@Codex` in a comment, and Codex creates a cloud task and replies with progress and results.
Codex in Linear is available on paid plans (see [Pricing](/codex/pricing)).
If you’re on an Enterprise plan, ask your ChatGPT workspace admin to turn on Codex cloud tasks in [workspace settings](https://chatgpt.com/admin/settings) and enable **Codex for Linear** in [connector settings](https://chatgpt.com/admin/ca).
## Set up the Linear integration
1. Set up [Codex cloud tasks](/codex/cloud) by connecting GitHub in [Codex](https://chatgpt.com/codex) and creating an [environment](/codex/cloud/environments) for the repository you want Codex to work in.
2. Go to [Codex settings](https://chatgpt.com/codex/settings/connectors) and install **Codex for Linear** for your workspace.
3. Link your Linear account by mentioning `@Codex` in a comment thread on a Linear issue.
## Delegate work to Codex
You can delegate in two ways:
### Assign an issue to Codex
After you install the integration, you can assign issues to Codex the same way you assign them to teammates. Codex starts work and posts updates back to the issue.
### Mention `@Codex` in comments
You can also mention `@Codex` in comment threads to delegate work or ask questions. After Codex replies, follow up in the thread to continue the same session.
After Codex starts working on an issue, it [chooses an environment and repo](#how-codex-chooses-an-environment-and-repo) to work in.
To pin a specific repo, include it in your comment, for example: `@Codex fix this in openai/codex`.
To track progress:
* Open **Activity** on the issue to see progress updates.
* Open the task link to follow along in more detail.
When the task finishes, Codex posts a summary and a link to the completed task so you can create a pull request.
### How Codex chooses an environment and repo
* Linear suggests a repository based on the issue context. Codex selects the environment that best matches that suggestion. If the request is ambiguous, it falls back to the environment you used most recently.
* The task runs against the default branch of the first repository listed in that environment’s repo map. Update the repo map in Codex if you need a different default or more repositories.
* If no suitable environment or repository is available, Codex will reply in Linear with instructions on how to fix the issue before retrying.
## Automatically assign issues to Codex
You can assign issues to Codex automatically using triage rules:
1. In Linear, go to **Settings**.
2. Under **Your teams**, select your team.
3. In the workflow settings, open **Triage** and turn it on.
4. In **Triage rules**, create a rule and choose **Delegate** \> **Codex** (and any other properties you want to set).
Linear assigns new issues that enter triage to Codex automatically.
When you use triage rules, Codex runs tasks using the account of the issue creator.
## Data usage, privacy, and security
When you mention `@Codex` or assign an issue to it, Codex receives your issue content to understand your request and create a task.
Data handling follows OpenAI’s [Privacy Policy](https://openai.com/privacy), [Terms of Use](https://openai.com/terms/), and other applicable [policies](https://openai.com/policies).
For more on security, see the [Codex security documentation](/codex/agent-approvals-security).
Codex uses large language models that can make mistakes. Always review answers and diffs.
## Tips and troubleshooting
* **Missing connections**: If Codex can’t confirm your Linear connection, it replies in the issue with a link to connect your account.
* **Unexpected environment choice**: Reply in the thread with the environment you want (for example, `@Codex please run this in openai/codex`).
* **Wrong part of the code**: Add more context in the issue, or give explicit instructions in your `@Codex` comment.
* **More help**: See the [OpenAI Help Center](https://help.openai.com/).
## Connect Linear for local tasks (MCP)
If you’re using the Codex app, CLI, or IDE Extension and want Codex to access Linear issues locally, configure Codex to use the Linear Model Context Protocol (MCP) server.
To learn more, [check out the Linear MCP docs](https://linear.app/integrations/codex-mcp).
The setup steps for the MCP server are the same regardless of whether you use the IDE extension or the CLI since both share the same configuration.
### Use the CLI (recommended)
If you have the CLI installed, run:
```
`codex mcp add linear --url https://mcp.linear.app/mcp`
```
This prompts you to sign in with your Linear account and connect it to Codex.
### Configure manually
1. Open `\~/.codex/config.toml` in your editor.
2. Add the following:
```
`[mcp\_servers.linear]
url = "https://mcp.linear.app/mcp"`
```
1. Run `codex mcp login linear` to log in.