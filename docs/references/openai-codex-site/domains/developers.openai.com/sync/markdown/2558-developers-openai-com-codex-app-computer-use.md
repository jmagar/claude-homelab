Computer Use – Codex app | OpenAI Developers
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
In the Codex app, computer use is currently available on macOS, except in the
European Economic Area, the United Kingdom, and Switzerland at launch. Install
the Computer Use plugin, then grant Screen Recording and Accessibility
permissions when macOS prompts you.
With computer use, Codex can see and operate graphical user interfaces on macOS.
Use it for tasks where command-line tools or structured integrations aren’t
enough, such as checking a desktop app, using a browser, changing app settings,
working with a data source that isn’t available as a plugin, or reproducing a
bug that only happens in a graphical user interface.
Because computer use can affect app and system state outside your project
workspace, use it for scoped tasks and review permission prompts before
continuing.
## Set up computer use
In Codex settings, open **Computer Use** and click **Install** to install the
Computer Use plugin before you ask Codex to operate desktop apps. When macOS
prompts for access, grant Screen Recording and Accessibility permissions if you
want Codex to see and interact with the target app.
To use computer use, grant:
* **Screen Recording** permission so Codex can see the target app.
* **Accessibility** permission so Codex can click, type, and navigate.
## When to use computer use
Choose computer use when the task depends on a graphical user interface that’s
hard to verify through files or command output alone.
Good fits include:
* Testing a macOS app, an iOS simulator flow, or another desktop app that Codex
is building.
* Performing a task that requires your web browser.
* Reproducing a bug that only appears in a graphical interface.
* Changing app settings that require clicking through a UI.
* Inspecting information in an app or data source that isn’t available through a
plugin.
* Running a scoped task in the background while you keep working elsewhere.
* Executing a workflow that spans more than one app.
For web apps you are building locally, use the
[in-app browser](/codex/app/browser) first.
## Start a computer use task
Mention `@Computer Use` or `@AppName` in your prompt, or ask Codex to use
computer use. Describe the exact app, window, or flow Codex should operate.
```
`Open the app with computer use, reproduce the onboarding bug, and fix the
smallest code path that causes it. After each change, run the same UI flow
again.`
```
```
`Open @Chrome and verify the checkout page still works after the latest changes.`
```
If the target app exposes a dedicated plugin or MCP server, prefer that
structured integration for data access and repeatable operations. Choose
computer use when Codex needs to inspect or operate the app visually.
## Permissions and approvals
The macOS system permissions for computer use are separate from app approvals in
Codex. The macOS permissions let Codex see and operate apps. App approvals
determine which apps you allow Codex to use. File reads, file edits, and shell
commands still follow the sandbox and approval settings for the thread.
With computer use, Codex can see and take action only in the apps you allow.
During a task, Codex asks for your permission before it can use an app on your
computer. You can choose **Always allow** so Codex can use that app in the future
without asking again. You can remove apps from the **Always allow** list in the
**Computer Use** section of Codex settings.
Codex may also ask for permission before taking sensitive or disruptive actions.
If Codex can’t see or control an app, open **System Settings \> Privacy &
Security** and check **Screen Recording** and **Accessibility** for the Codex
app.
## Safety guidance
With computer use, Codex can view screen content, take screenshots, and interact
with windows, menus, keyboard input, and clipboard state in the target app.
Treat visible app content, browser pages, screenshots, and files opened in the
target app as context Codex may process while the task runs.
Keep tasks narrow and stay present for sensitive flows:
* Give Codex one clear target app or flow at a time.
* You can stop the task or take over your computer at any time.
* Keep sensitive apps closed unless they’re required for the task.
* Avoid tasks that require secrets unless you’re present and can approve each
step.
* Review app permission prompts before allowing Codex to use an app.
* Use **Always allow** only for apps you trust Codex to use automatically in
future tasks.
* Stay present for account, security, privacy, network, payment, or
credential-related settings.
* Cancel the task if Codex starts interacting with the wrong window.
If Codex uses your browser, it can interact with pages where you’re already
signed in. Review website actions as if you were taking them yourself: web pages
can contain malicious or misleading content, and sites may treat approved clicks,
form submissions, and signed-in actions as coming from your account. To keep
using your browser while Codex works, ask Codex to use a different browser.
The feature can’t automate terminal apps or Codex itself, since automating them
could bypass Codex security policies. It also can’t authenticate as an
administrator or approve security and privacy permission prompts on your
computer.
File edits and shell commands still follow Codex approval and sandbox settings
where applicable. Changes made through desktop apps may not appear in the review
pane until they’re saved to disk and tracked by the project. Your ChatGPT data
controls apply to content processed through Codex, including screenshots taken
by computer use.