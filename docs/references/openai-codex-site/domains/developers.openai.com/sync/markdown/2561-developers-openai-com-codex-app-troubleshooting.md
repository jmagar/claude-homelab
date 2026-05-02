Troubleshooting – Codex app | OpenAI Developers
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
## Frequently Asked Questions
### Files appear in the side panel that Codex didn’t edit
If your project is inside a Git repository, the review panel automatically
shows changes based on your project’s Git state, including changes that Codex
didn’t make.
In the review pane, you can switch between staged changes and changes not yet
staged, and compare your branch with main.
If you want to see only the changes of your last Codex turn, switch the diff
pane to the “Last turn changes” view.
[Learn more about how to use the review pane](/codex/app/review).
### Remove a project from the sidebar
To remove a project from the sidebar, hover over the name of your project, click
the three dots and choose “Remove.” To restore it, re-add the
project using the **Add new project** button next to **Threads** or using
Cmd+O.
### Find archived threads
Archived threads can be found in the [Settings](codex://settings). When you
unarchive a thread it will reappear in the original location of your sidebar.
### Only some threads appear in the sidebar
The sidebar allows filtering of threads depending on the state of a project. If
you’re missing threads, click the filter icon next to the **Threads** label and
switch to Chronological. If you still don’t see the thread, open
[Settings](codex://settings) and check the archived chats or archived threads
section.
### Code doesn’t run on a worktree
Worktrees are created in a different directory and only inherit the files that
are checked into Git. Depending on how you manage dependencies and tooling
for your project you might have to run some setup scripts on your worktree using a
[local environment](/codex/app/local-environments). Alternatively you can check out
the changes in your regular local project. Check out the
[worktrees documentation](/codex/app/worktrees) to learn more.
### App doesn’t pick up a teammate’s shared local environment
The local environment configuration must be inside the `.codex` folder at the
root of your project. If you are working in a monorepo with more than one
project, make sure you open the project in the directory that contains the
`.codex` folder.
### Codex asks to access Apple Music
Depending on your task, Codex may need to navigate the file system. Certain
directories on macOS, including Music, Downloads, or Desktop, require
additional approval from the user. If Codex needs to read your home directory,
macOS prompts you to approve access to those folders.
### Automations create many worktrees
Frequent automations can create many worktrees over time. Archive automation
runs you no longer need and avoid pinning runs unless you intend to keep their
worktrees.
### Recover a prompt after selecting the wrong target
If you started a thread with the wrong target (**Local**, **Worktree**, or **Cloud**) by accident, you can cancel the current run and recover your previous prompt by pressing the up arrow key in the composer.
### Feature is working in the Codex CLI but not in the Codex app
The Codex app and Codex CLI use the same underlying Codex agent and configuration but might rely on different versions of the agent at any time and some experimental features might land in the Codex CLI first.
To get the version of the Codex CLI on your system run:
```
`codex --version`
```
To get the version of Codex bundled with your Codex app run:
```
`/Applications/Codex.app/Contents/Resources/codex --version`
```
## Feedback and logs
Type / into the message composer to provide feedback for the team. If
you trigger feedback in an existing conversation, you can choose to share the
existing session along with your feedback. After submitting your feedback,
you’ll receive a session ID that you can share with the team.
To report an issue:
1. Find [existing issues](https://github.com/openai/codex/issues) on the Codex GitHub repo.
2. [Open a new GitHub issue](<https://github.com/openai/codex/issues/new?template=2-bug-report.yml&#38;steps=Uploaded thread: 019c0d37-d2b6-74c0-918f-0e64af9b6e14>)
More logs are available in the following locations:
* App logs (macOS): `\~/Library/Logs/com.openai.codex/YYYY/MM/DD`
* Session transcripts: `$CODEX\_HOME/sessions` (default: `\~/.codex/sessions`)
* Archived sessions: `$CODEX\_HOME/archived\_sessions` (default: `\~/.codex/archived\_sessions`)
If you share logs, review them first to confirm they don’t contain sensitive
information.
## Stuck states and recovery patterns
If a thread appears stuck:
1. Check whether Codex is waiting for an approval.
2. Open the terminal and run a basic command like `git status`.
3. Start a new thread with a smaller, more focused prompt.
If you cancel worktree creation by mistake and lose your prompt, press the up
arrow key in the composer to recover it.
## Terminal issues
**Terminal appears stuck**
1. Close the terminal panel.
2. Reopen it with Cmd+J.
3. Re-run a basic command like `pwd` or `git status`.
If commands behave differently than expected, validate the current directory and
branch in the terminal first.
If it continues to be stuck, wait until your active Codex threads are completed and restart the app.
**Fonts aren’t rendering correctly**
Codex uses the same font for the review pane, integrated terminal and any other code displayed inside the app. You can configure the font inside the [Settings](codex://settings) pane as **Code font**.