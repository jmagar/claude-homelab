Code review in GitHub – Codex | OpenAI Developers
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
Use Codex code review to get another high-signal review pass on GitHub pull
requests. Codex reviews the pull request diff, follows your repository guidance,
and posts a standard GitHub code review focused on serious issues.
## Before you start
Make sure you have:
* [Codex cloud](/codex/cloud) set up for the repository you want to review.
* Access to [Codex code review settings](https://chatgpt.com/codex/settings/code-review).
* An `AGENTS.md` file if you want Codex to follow repository-specific review guidance.
## Set up Codex code review
1. Set up [Codex cloud](/codex/cloud).
2. Go to [Codex settings](https://chatgpt.com/codex/settings/code-review).
3. Turn on **Code review** for your repository.
## Request a Codex review
1. In a pull request comment, mention `@codex review`.
2. Wait for Codex to react (👀) and post a review.
Codex posts a review on the pull request, just like a teammate would. In
GitHub, Codex flags only P0 and P1 issues so review comments stay focused on
high-priority risks.
## Enable automatic reviews
If you want Codex to review every pull request automatically, turn on
**Automatic reviews** in [Codex settings](https://chatgpt.com/codex/settings/code-review).
Codex will post a review whenever someone opens a new PR for review, without
needing an `@codex review` comment.
## Customize what Codex reviews
Codex searches your repository for `AGENTS.md` files and follows any **Review guidelines** you include.
To set guidelines for a repository, add or update a top-level `AGENTS.md` with a section like this:
```
`## Review guidelines
- Don't log PII.
- Verify that authentication middleware wraps every route.`
```
Codex applies guidance from the closest `AGENTS.md` to each changed file. You can place more specific instructions deeper in the tree when particular packages need extra scrutiny.
For a one-off focus, add it to your pull request comment:
`@codex review for security regressions`
If you want Codex to flag typos in documentation, add guidance in `AGENTS.md`
(for example, “Treat typos in docs as P1.”).
## Act on review findings
After Codex posts a review, you can ask it to fix issues in the same pull
request by leaving another comment:
```
`@codex fix the P1 issue`
```
Codex starts a cloud task with the pull request as context and can push a fix
back to the branch when it has permission to do so.
## Give Codex other tasks
If you mention `@codex` in a comment with anything other than `review`, Codex starts a [cloud task](/codex/cloud) using your pull request as context.
```
`@codex fix the CI failures`
```
## Troubleshoot code review
If Codex doesn’t react or post a review:
* Confirm you turned on **Code review** for the repository in [Codex settings](https://chatgpt.com/codex/settings/code-review).
* Confirm the pull request belongs to a repository with [Codex cloud](/codex/cloud) set up.
* Use the exact trigger `@codex review` in a pull request comment.
* For automatic reviews, check that you turned on **Automatic reviews** and that
the pull request event matches your review trigger settings.