In-app browser – Codex app | OpenAI Developers
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
The in-app browser gives you and Codex a shared view of rendered web pages
inside a thread. Use it when you’re building or debugging a web app and want to
preview pages and attach visual comments.
Use it for local development servers, file-backed previews, and public pages
that don’t require sign-in. For anything that depends on login state or browser
extensions, use your regular browser.
Open the in-app browser from the toolbar, by clicking a URL, by navigating
manually in the browser, or by pressing Cmd+Shift+B
(Ctrl+Shift+B on Windows).
The in-app browser does not support authentication flows, signed-in pages,
your regular browser profile, cookies, extensions, or existing tabs. Use it
for pages Codex can open without logging in.
Treat page content as untrusted context. Don’t paste secrets into browser flows.
## Browser use
Browser use lets Codex operate the in-app browser directly. Use it for local
development servers and file-backed previews when Codex needs to click, type,
inspect rendered state, take screenshots, or verify a fix in the page.
To use it, install and enable the Browser plugin. Then ask Codex to use the
browser in your task, or reference it directly with `@Browser`. The app keeps
browser use inside the in-app browser and lets you manage allowed and blocked
websites from settings.
Example:
```
`Use the browser to open http://localhost:3000/settings, reproduce the layout
bug, and fix only the overflowing controls.`
```
Codex asks before using a website unless you’ve allowed it. Removing a site from
the allowed list means Codex asks again before using it; removing a site from the
blocked list means Codex can ask again instead of treating it as blocked.
## Preview a page
1. Start your app’s development server in the [integrated terminal](/codex/app/features#integrated-terminal) or with a [local environment action](/codex/app/local-environments#actions).
2. Open an unauthenticated local route, file-backed page, or public page by
clicking a URL or navigating manually in the browser.
3. Review the rendered state alongside the code diff.
4. Leave browser comments on the elements or areas that need changes.
5. Ask Codex to address the comments and keep the scope narrow.
Example feedback:
```
`I left comments on the pricing page in the in-app browser. Address the mobile
layout issues and keep the card structure unchanged.`
```
## Comment on the page
When a bug is visible only in the rendered page, use browser comments to give
Codex precise feedback on the page.
* Turn on comment mode, select an element or area, and submit a comment.
* In comment mode, hold Shift and click to select an area.
* Hold Cmd while clicking to send a comment immediately.
After you leave comments, send a message in the thread asking Codex to address
them. Comments are most useful when Codex needs to make a precise visual change.
Good feedback is specific:
```
`This button overflows on mobile. Keep the label on one line if it fits,
otherwise wrap it without changing the card height.`
```
```
`This tooltip covers the data point under the cursor. Reposition the tooltip so
it stays inside the chart bounds.`
```
## Keep browser tasks scoped
The in-app browser is for review and iteration. Keep each browser task small
enough to review in one pass.
* Name the page, route, or local URL.
* Name the visual state you care about, such as loading, empty, error, or
success.
* Leave comments on the exact elements or areas that need changes.
* Review the updated route after Codex changes the code.
* Ask Codex to start or check the dev server before it uses the browser.
For repository changes, use the [review pane](/codex/app/review) to inspect the
changes and leave comments.