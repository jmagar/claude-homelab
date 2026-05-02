Features – Codex app | OpenAI Developers
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
The Codex app is a focused desktop experience for working on Codex threads in parallel,
with built-in worktree support, automations, and Git functionality.
Most Codex app features are available on both macOS and Windows.
The sections below note platform-specific exceptions.
## Multitask across projects
Use one Codex app window to run tasks across projects. Add a project for each
codebase and switch between them as needed.
If you’ve used the [Codex CLI](/codex/cli), a project is like starting a
session in a specific directory.
If you work in a single repository with two or more apps or packages, split
distinct projects into separate app projects so the [sandbox](/codex/agent-approvals-security)
only includes the files for that project.
## Skills support
The Codex app supports the same [agent skills](/codex/skills) as the CLI and
IDE Extension. You can also view and explore new skills that your team has
created across your different projects by clicking Skills in the sidebar.
## Automations
You can also combine skills with [automations](/codex/app/automations) to perform routine tasks
such as evaluating errors in your telemetry and submitting fixes or creating reports on recent
codebase changes. For ongoing work that should stay in one thread, use a
[thread automation](/codex/app/automations#thread-automations).
## Modes
Each thread runs in a selected mode. When starting a thread, you can choose:
* **Local**: work directly in your current project directory.
* **Worktree**: isolate changes in a Git worktree. [Learn more](/codex/app/worktrees).
* **Cloud**: run remotely in a configured cloud environment.
Both **Local** and **Worktree** threads will run on your computer.
For the full glossary and concepts, explore the [concepts section](/codex/prompting).
## Built-in Git tools
The Codex app provides common Git features directly within the app.
The diff pane shows a Git diff of your changes in your local project or worktree checkout. You
can also add inline comments for Codex to address and stage or revert specific chunks or entire files.
You can also commit, push, and create pull requests for local and worktree tasks directly from
within the Codex app.
For more advanced Git tasks, use the [integrated terminal](#integrated-terminal).
## Worktree support
When you create a new thread, choose **Local** or **Worktree**. **Local** works
directly within your project. **Worktree** creates a new [Git worktree](https://git-scm.com/docs/git-worktree) so changes stay isolated from your regular project.
Use **Worktree** when you want to try a new idea without touching your current
work, or when you want Codex to run independent tasks side by side in the same
project.
Automations run in dedicated background worktrees for Git repositories, and directly in the project directory for non-version-controlled projects.
[Learn more about using worktrees in the Codex app.](/codex/app/worktrees)
## Integrated terminal
Each thread includes a built-in terminal scoped to the current project or
worktree. Toggle it using the terminal icon in the top right of the app or by
pressing Cmd+J.
Use the terminal to validate changes, run scripts, and perform Git operations
without leaving the app. Codex can also read the current terminal output, so
it can check the status of a running development server or refer back to a
failed build while it works with you.
Common tasks include:
* `git status`
* `git pull --rebase`
* `pnpm test` or `npm test`
* `pnpm run lint` or similar project commands
If you run a task regularly, you can define an **action** inside your [local environment](/codex/app/local-environments) to add a shortcut button to the top of your Codex app window.
Note that Cmd+K opens the command palette in the Codex
app. It doesn’t clear the terminal. To clear the terminal use Ctrl+L.
## Native Windows sandbox
On Windows, Codex can run natively in PowerShell with a native Windows sandbox
instead of requiring WSL or a virtual machine. This lets you stay in
Windows-native workflows while keeping bounded permissions in place.
[Learn more about Windows setup and sandboxing](/codex/app/windows).
## Voice dictation
Use your voice to prompt Codex. Hold Ctrl+M while the composer is visible and start talking. Your voice will be transcribed. Edit the transcribed prompt or hit send to have Codex start work.
## Floating pop-out window
Pop out an active conversation thread into a separate window and move it to where
you are actively working. This is ideal for front-end work, where you can keep
the thread near your browser, editor, or design preview while iterating quickly.
You can also toggle the pop-out window to stay on top when you want it to remain
visible across your workflow.
## In-app browser
Use the [in-app browser](/codex/app/browser) to preview, review, and comment on
local development servers, file-backed previews, and public pages that don’t
require sign-in while you iterate on a web app.
The in-app browser doesn’t support authentication flows, signed-in pages, your
regular browser profile, cookies, extensions, or existing tabs.
Use browser comments to mark specific elements or areas on a page, then ask
Codex to address that feedback.
When you want Codex to operate the page directly, use
[browser use](/codex/app/browser#browser-use) for local development servers and
file-backed pages. You can manage the Browser plugin, allowed websites, and
blocked websites from settings.
## Computer use
[Computer use](/codex/app/computer-use) helps Codex operate a macOS app by
seeing, clicking, and typing. This is useful for testing desktop apps, checking
browser or simulator flows, working with data sources that aren’t available as
plugins, changing app settings, and reproducing GUI-only bugs.
Because computer use can affect app and system state outside your project
workspace, keep tasks narrow and review permission prompts before continuing.
The feature isn’t available in the European Economic Area, the United Kingdom, or
Switzerland at launch.
## Work with non-code artifacts
When a task produces non-code artifacts, the sidebar can preview PDF files,
spreadsheets, documents, and presentations. Give Codex the source data, expected
file type, structure, and review criteria you care about.
For spreadsheets and presentations, describe the sheets, columns, charts, slide
sections, and checks that matter. Ask Codex to explain where it saved the output
and how it checked the result.
Use the task sidebar to follow what Codex is doing while a thread runs. It can
surface the agent’s plan, sources, generated artifacts, and task summary so you
can steer the work, inspect generated files, and decide what needs another pass.
## Sync with the IDE extension
If you have the [Codex IDE Extension](/codex/ide) installed in your editor,
your Codex app and IDE Extension automatically sync when both are in the same
project.
When they sync, you see an **IDE context** option in the Codex app composer. With “Auto context”
enabled, the Codex app tracks the files you’re viewing, so you can reference them indirectly (for
example, “What’s this file about?”). You can also see threads running in the Codex app inside the
IDE Extension, and vice versa.
If you’re unsure whether the app includes context, toggle it off and ask the
same question again to compare results.
## Thread automations
Automations can also attach to a single thread. These thread automations are
recurring wake-up calls that preserve the thread’s context so Codex can check
on long-running work, poll a source for new information, or continue a follow-up
loop. Use them for heartbeat-style automations that should keep returning to the
same conversation on a schedule.
Use a thread automation when the next run depends on the current conversation.
Use a standalone or project [automation](/codex/app/automations) when you want
Codex to start a fresh recurring task for one or more projects.
## Approvals and sandboxing
Your approval and sandbox settings constrain Codex actions.
* Approvals determine when Codex pauses for permission before running a command.
* The sandbox controls which directories and network access Codex can use.
When you see prompts like “approve once” or “approve for this session,” you are
granting different scopes of permission for tool execution. If you are unsure,
approve the narrowest option and continue iterating.
By default, Codex scopes work to the current project. In most cases, that’s the
right constraint.
If your task requires work across more than one repository or directory, prefer
opening separate projects or using worktrees rather than asking Codex to roam
outside the project root.
If [automatic review](/codex/agent-approvals-security#automatic-approval-reviews)
is available in your workspace, you can choose it from the permissions selector.
It keeps the same sandbox boundary but routes eligible approval requests through
the configured review policy instead of waiting for you.
For a high-level overview, see [sandboxing](/codex/concepts/sandboxing). For
configuration details, see the
[agent approvals & security documentation](/codex/agent-approvals-security).
## MCP support
The Codex app, CLI, and IDE Extension share [Model Context Protocol (MCP)](/codex/mcp) settings.
If you’ve already configured MCP servers in one, they’re automatically adopted by the others. To
configure new servers, open the MCP section in the app’s settings and either enable a recommended
server or add a new server to your configuration.
## Web search
Codex ships with a first-party web search tool. For local tasks in the Codex app, Codex
enables web search by default and serves results from a web search cache. If you configure your
sandbox for [full access](/codex/agent-approvals-security), web search defaults to live results. See
[Config basics](/codex/config-basic) to disable web search or switch to live results that fetch the
most recent data.
## Image generation
Ask Codex to generate or edit images directly in a thread. This is useful for UI assets, banners, backgrounds, illustrations, sprite sheets, and placeholders you want to create alongside code. Add a reference image when you want Codex to transform or extend an existing asset.
You can ask in natural language or explicitly invoke the image generation skill by including `$imagegen` in your prompt.
Built-in image generation uses `gpt-image-2`, counts toward your general Codex usage limits, and uses included limits 3-5x faster on average than similar turns without image generation, depending on image quality and size. For details, see [Pricing](/codex/pricing#image-generation-usage-limits). For prompting tips and model details, see the [image generation guide](/api/docs/guides/image-generation).
For larger batches of image generation, set `OPENAI\_API\_KEY` in your environment variables and ask Codex to generate images through the API so API pricing applies instead.
## Image input
You can drag and drop images into the prompt composer to include them as context. Hold down `Shift`
while dropping an image to add the image to the context.
You can also ask Codex to view images on your system. By giving Codex tools to take screenshots of
the app you are working on, Codex can verify the work it’s doing.
## Chats
Chats are threads you can start when the task doesn’t need a specific project
folder or Git repository. Use them for research, triage, planning,
plugin-heavy workflows, and other conversations where Codex should use connected
tools instead of editing a codebase.
Chats use a Codex-managed `threads` directory under your Codex home as their
working location. By default, that location is `\~/.codex/threads`.
## Memories
[Memories](/codex/memories), where available, let Codex carry useful context
from past tasks into future threads. They’re most useful for stable preferences,
project conventions, recurring work patterns, and known pitfalls that would
otherwise need to repeat.
## Notifications
By default, the Codex app sends notifications when a task completes or needs approval while the app
is in the background.
In the Codex app settings, you can choose to never send notifications or always send them, even
when the app is in focus.
## Keep your computer awake
Since your tasks might take a while to complete, you can have the Codex app prevent your computer
from going to sleep by enabling the “Prevent sleep while running” toggle in the app’s settings.
## See also
* [Settings](/codex/app/settings)
* [Automations](/codex/app/automations)
* [In-app browser](/codex/app/browser)
* [Computer use](/codex/app/computer-use)
* [Review pane](/codex/app/review)
* [Local environments](/codex/app/local-environments)
* [Worktrees](/codex/app/worktrees)