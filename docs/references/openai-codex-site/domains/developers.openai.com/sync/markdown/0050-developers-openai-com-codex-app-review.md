Review – Codex app | OpenAI Developers
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
The review pane helps you understand what Codex changed, give targeted feedback, and decide what to keep.
It only works for projects that live inside a Git repository. If your project
isn’t a Git repository yet, the review pane will prompt you to create one.
## What changes it shows
The review pane reflects the state of your Git repository, not just what Codex
edited. That means it will show:
* Changes made by Codex
* Changes you made yourself
* Any other uncommitted changes in the repo
By default, the review pane focuses on **uncommitted changes**. You can also
switch the scope to:
* **All branch changes** (diff against your base branch)
* **Last turn changes** (just the most recent assistant turn)
When working locally, you can also toggle between **Unstaged** and **Staged**
changes.
## Navigating the review pane
* Clicking a file name typically opens that file in your chosen editor. You can choose the default editor in [settings](/codex/app/settings).
* Clicking the file name background expands or collapses the diff.
* Clicking a single line while holding Cmd pressed will open the line in your chosen editor.
* If you are happy with a change you can [stage the changes or revert changes](#staging-and-reverting-files) you don’t like.
## Inline comments for feedback
Inline comments let you attach feedback directly to specific lines in the diff.
This is often the fastest way to guide Codex to the right fix.
To leave an inline comment:
1. Open the review pane.
2. Hover the line you want to comment on.
3. Click the **+** button that appears.
4. Write your feedback and submit it.
5. After you finish leaving feedback, send a message back to the thread.
Because comments are line-specific, Codex can respond more precisely than with a
general instruction.
Codex treats inline comments as review guidance. After leaving comments, send a
follow-up message that makes your intent explicit, for example “Address the
inline comments and keep the scope minimal.”
## Code review results
If you use `/review` to run a code review, comments will show up directly
inline in the review pane.
## Pull request reviews
When Codex has GitHub access for your repository and the current project is on
the pull request branch, the Codex app can help you work through pull request
feedback without leaving the app. The sidebar shows pull request context and
feedback from reviewers, and the review pane shows comments alongside the diff
so you can ask Codex to address issues in the same thread.
Install the GitHub CLI (`gh`) and authenticate it with `gh auth login` so Codex
can load pull request context, review comments, and changed files. If `gh` is
missing or unauthenticated, pull request details may not appear in the sidebar
or review pane.
Use this flow when you want to keep the full fix loop in one place:
1. Open the review pane on the pull request branch.
2. Review the pull request context, comments, and changed files.
3. Ask Codex to fix the specific comments you want handled.
4. Inspect the resulting diff in the review pane.
5. Stage, commit, and push the changes to the PR branch when you are ready.
For GitHub-triggered reviews, see [Use Codex in GitHub](/codex/integrations/github).
## Staging and reverting files
The review pane includes Git actions so you can shape the diff before you
commit.
You can stage, unstage, or revert changes at these levels:
* **Entire diff**: use the action buttons in the review header (for example,
“Stage all” or “Revert all”)
* **Per file**: stage, unstage, or revert an individual file
* **Per hunk**: stage, unstage, or revert a single hunk
Use staging when you want to accept part of the work, and revert when you want
to discard it.
### Staged and unstaged states
Git can represent both staged and unstaged changes in the same file. When that
happens, it can look like the pane is showing “the same file twice” across
staged and unstaged views. That’s normal Git behavior.