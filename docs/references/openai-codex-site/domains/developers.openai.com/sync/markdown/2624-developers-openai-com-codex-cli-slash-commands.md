Slash commands in Codex CLI | OpenAI Developers
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
Slash commands give you fast, keyboard-first control over Codex. Type `/` in
the composer to open the slash popup, choose a command, and Codex will perform
actions such as switching models, adjusting permissions, or summarizing long
conversations without leaving the terminal.
This guide shows you how to:
* Find the right built-in slash command for a task
* Steer an active session with commands like `/model`, `/fast`,
`/personality`, `/permissions`, `/agent`, and `/status`
## Built-in slash commands
Codex ships with the following commands. Open the slash popup and start typing
the command name to filter the list.
When a task is already running, you can type a slash command and press `Tab` to
queue it for the next turn. Codex parses queued slash commands when they run, so
command menus and errors appear after the current turn finishes. Slash
completion still works before you queue the command.
|Command|Purpose|When to use it|
|[`/permissions`](#update-permissions-with-permissions)|Set what Codex can do without asking first.|Relax or tighten approval requirements mid-session, such as switching between Auto and Read Only.|
|[`/sandbox-add-read-dir`](#grant-sandbox-read-access-with-sandbox-add-read-dir)|Grant sandbox read access to an extra directory (Windows only).|Unblock commands that need to read an absolute directory path outside the current readable roots.|
|[`/agent`](#switch-agent-threads-with-agent)|Switch the active agent thread.|Inspect or continue work in a spawned subagent thread.|
|[`/apps`](#browse-apps-with-apps)|Browse apps (connectors) and insert them into your prompt.|Attach an app as `$app-slug` before asking Codex to use it.|
|[`/plugins`](#browse-plugins-with-plugins)|Browse installed and discoverable plugins.|Inspect plugin tools, install suggested plugins, or manage plugin availability.|
|[`/clear`](#clear-the-terminal-and-start-a-new-chat-with-clear)|Clear the terminal and start a fresh chat.|Reset the visible UI and conversation together when you want a fresh start.|
|[`/compact`](#keep-transcripts-lean-with-compact)|Summarize the visible conversation to free tokens.|Use after long runs so Codex retains key points without blowing the context window.|
|[`/copy`](#copy-the-latest-response-with-copy)|Copy the latest completed Codex output.|Grab the latest finished response or plan text without manually selecting it. You can also press `Ctrl+O`.|
|[`/diff`](#review-changes-with-diff)|Show the Git diff, including files Git isn’t tracking yet.|Review Codex’s edits before you commit or run tests.|
|[`/exit`](#exit-the-cli-with-quit-or-exit)|Exit the CLI (same as `/quit`).|Alternative spelling; both commands exit the session.|
|[`/experimental`](#toggle-experimental-features-with-experimental)|Toggle experimental features.|Enable optional features such as subagents from the CLI.|
|[`/feedback`](#send-feedback-with-feedback)|Send logs to the Codex maintainers.|Report issues or share diagnostics with support.|
|[`/init`](#generate-agentsmd-with-init)|Generate an `AGENTS.md` scaffold in the current directory.|Capture persistent instructions for the repository or subdirectory you’re working in.|
|[`/logout`](#sign-out-with-logout)|Sign out of Codex.|Clear local credentials when using a shared machine.|
|[`/mcp`](#list-mcp-tools-with-mcp)|List configured Model Context Protocol (MCP) tools.|Check which external tools Codex can call during the session; add `verbose` for server details.|
|[`/mention`](#highlight-files-with-mention)|Attach a file to the conversation.|Point Codex at specific files or folders you want it to inspect next.|
|[`/model`](#set-the-active-model-with-model)|Choose the active model (and reasoning effort, when available).|Switch between general-purpose models (`gpt-4.1-mini`) and deeper reasoning models before running a task.|
|[`/fast`](#toggle-fast-mode-with-fast)|Toggle Fast mode for supported models.|Turn Fast mode on or off, or check whether the current thread is using it.|
|[`/plan`](#switch-to-plan-mode-with-plan)|Switch to plan mode and optionally send a prompt.|Ask Codex to propose an execution plan before implementation work starts.|
|[`/personality`](#set-a-communication-style-with-personality)|Choose a communication style for responses.|Make Codex more concise, more explanatory, or more collaborative without changing your instructions.|
|[`/ps`](#check-background-terminals-with-ps)|Show experimental background terminals and their recent output.|Check long-running commands without leaving the main transcript.|
|[`/stop`](#stop-background-terminals-with-stop)|Stop all background terminals.|Cancel background terminal work started by the current session.|
|[`/fork`](#fork-the-current-conversation-with-fork)|Fork the current conversation into a new thread.|Branch the active session to explore a new approach without losing the current transcript.|
|[`/side`](#start-a-side-conversation-with-side)|Start an ephemeral side conversation.|Ask a focused follow-up without disrupting the main thread’s transcript.|
|[`/resume`](#resume-a-saved-conversation-with-resume)|Resume a saved conversation from your session list.|Continue work from a previous CLI session without starting over.|
|[`/new`](#start-a-new-conversation-with-new)|Start a new conversation inside the same CLI session.|Reset the chat context without leaving the CLI when you want a fresh prompt in the same repo.|
|[`/quit`](#exit-the-cli-with-quit-or-exit)|Exit the CLI.|Leave the session immediately.|
|[`/review`](#ask-for-a-working-tree-review-with-review)|Ask Codex to review your working tree.|Run after Codex completes work or when you want a second set of eyes on local changes.|
|[`/status`](#inspect-the-session-with-status)|Display session configuration and token usage.|Confirm the active model, approval policy, writable roots, and remaining context capacity.|
|[`/debug-config`](#inspect-config-layers-with-debug-config)|Print config layer and requirements diagnostics.|Debug precedence and policy requirements, including experimental network constraints.|
|[`/statusline`](#configure-footer-items-with-statusline)|Configure TUI status-line fields interactively.|Pick and reorder footer items (model/context/limits/git/tokens/session) and persist in config.toml.|
|[`/title`](#configure-terminal-title-items-with-title)|Configure terminal window or tab title fields interactively.|Pick and reorder title items such as project, status, thread, branch, model, and task progress.|
|[`/keymap`](#remap-tui-shortcuts-with-keymap)|Remap TUI keyboard shortcuts.|Inspect and persist custom shortcut bindings in `config.toml`.|
`/quit` and `/exit` both exit the CLI. Use them only after you have saved or
committed any important work.
The `/approvals` command still works as an alias, but it no longer appears in the slash popup list.
## Control your session with slash commands
The following workflows keep your session on track without restarting Codex.
### Set the active model with `/model`
1. Start Codex and open the composer.
2. Type `/model` and press Enter.
3. Choose a model such as `gpt-4.1-mini` or `gpt-4.1` from the popup.
Expected: Codex confirms the new model in the transcript. Run `/status` to verify the change.
### Toggle Fast mode with `/fast`
1. Type `/fast on`, `/fast off`, or `/fast status`.
2. If you want the setting to persist, confirm the update when Codex offers to save it.
Expected: Codex reports whether Fast mode is on or off for the current thread. In the TUI footer, you can also show a Fast mode status-line item with `/statusline`.
### Set a communication style with `/personality`
Use `/personality` to change how Codex communicates without rewriting your prompt.
1. In an active conversation, type `/personality` and press Enter.
2. Choose a style from the popup.
Expected: Codex confirms the new style in the transcript and uses it for later
responses in the thread.
Codex supports `friendly`, `pragmatic`, and `none` personalities. Use `none`
to disable personality instructions.
If the active model doesn’t support personality-specific instructions, Codex hides this command.
### Switch to plan mode with `/plan`
1. Type `/plan` and press Enter to switch the active conversation into plan
mode.
2. Optional: provide inline prompt text (for example, `/plan Propose a migration plan for this service`).
3. You can paste content or attach images while using inline `/plan` arguments.
Expected: Codex enters plan mode and uses your optional inline prompt as the first planning request.
While a task is already running, `/plan` is temporarily unavailable.
### Toggle experimental features with `/experimental`
1. Type `/experimental` and press Enter.
2. Toggle the features you want (for example, Apps or Smart Approvals), then restart Codex if the prompt asks you to.
Expected: Codex saves your feature choices to config and applies them on restart.
### Clear the terminal and start a new chat with `/clear`
1. Type `/clear` and press Enter.
Expected: Codex clears the terminal, resets the visible transcript, and starts
a fresh chat in the same CLI session.
Unlike Ctrl+L, `/clear` starts a new conversation.
Ctrl+L only clears the terminal view and keeps the current
chat. Codex disables both actions while a task is in progress.
### Update permissions with `/permissions`
1. Type `/permissions` and press Enter.
2. Select the approval preset that matches your comfort level, for example
`Auto` for hands-off runs or `Read Only` to review edits.
Expected: Codex announces the updated policy. Future actions respect the
updated approval mode until you change it again.
### Copy the latest response with `/copy`
1. Type `/copy` and press Enter.
Expected: Codex copies the latest completed Codex output to your clipboard.
If a turn is still running, `/copy` uses the latest completed output instead of
the in-progress response. The command is unavailable before the first completed
Codex output and immediately after a rollback.
You can also press Ctrl+O from the main TUI to copy the
latest completed response without opening the slash command menu.
### Grant sandbox read access with `/sandbox-add-read-dir`
This command is available only when running the CLI natively on Windows.
1. Type `/sandbox-add-read-dir C:\\absolute\\directory\\path` and press Enter.
2. Confirm the path is an existing absolute directory.
Expected: Codex refreshes the Windows sandbox policy and grants read access to
that directory for later commands that run in the sandbox.
### Inspect the session with `/status`
1. In any conversation, type `/status`.
2. Review the output for the active model, approval policy, writable roots, and current token usage.
Expected: You see a summary like what `codex status` prints in the shell,
confirming Codex is operating where you expect.
### Inspect config layers with `/debug-config`
1. Type `/debug-config`.
2. Review the output for config layer order (lowest precedence first), on/off
state, and policy sources.
Expected: Codex prints layer diagnostics plus policy details such as
`allowed\_approval\_policies`, `allowed\_sandbox\_modes`, `mcp\_servers`, `rules`,
`enforce\_residency`, and `experimental\_network` when configured.
Use this output to debug why an effective setting differs from `config.toml`.
### Configure footer items with `/statusline`
1. Type `/statusline`.
2. Use the picker to toggle and reorder items, then confirm.
Expected: The footer status line updates immediately and persists to
`tui.status\_line` in `config.toml`.
Available status-line items include model, model+reasoning, context stats, rate
limits, git branch, token counters, session id, current directory/project root,
and Codex version.
### Configure terminal title items with `/title`
1. Type `/title`.
2. Use the picker to toggle and reorder items, then confirm.
Expected: The terminal window or tab title updates immediately and persists to
`tui.terminal\_title` in `config.toml`.
Available title items include app name, project, spinner, status, thread, git
branch, model, and task progress.
### Remap TUI shortcuts with `/keymap`
Use `/keymap` to inspect, update, and persist keyboard shortcut bindings for the TUI.
1. Type `/keymap`.
2. Pick the shortcut context and action you want to change.
3. Enter the new binding or remove the existing one.
Expected: Codex updates the active keymap and writes the custom binding to `tui.keymap` in `config.toml`.
Key bindings use names such as `ctrl-a`, `shift-enter`, and `page-down`. Context-specific bindings override `tui.keymap.global`; an empty binding list unbinds the action.
### Check background terminals with `/ps`
1. Type `/ps`.
2. Review the list of background terminals and their status.
Expected: Codex shows each background terminal’s command plus up to three
recent, non-empty output lines so you can gauge progress at a glance.
Background terminals appear when `unified\_exec` is in use; otherwise, the list may be empty.
### Stop background terminals with `/stop`
1. Type `/stop`.
2. Confirm if Codex asks before stopping the listed terminals.
Expected: Codex stops all background terminals for the current session. `/clean`
is still available as an alias for `/stop`.
### Keep transcripts lean with `/compact`
1. After a long exchange, type `/compact`.
2. Confirm when Codex offers to summarize the conversation so far.
Expected: Codex replaces earlier turns with a concise summary, freeing context
while keeping critical details.
### Review changes with `/diff`
1. Type `/diff` to inspect the Git diff.
2. Scroll through the output inside the CLI to review edits and added files.
Expected: Codex shows changes you’ve staged, changes you haven’t staged yet,
and files Git hasn’t started tracking, so you can decide what to keep.
### Highlight files with `/mention`
1. Type `/mention` followed by a path, for example `/mention src/lib/api.ts`.
2. Select the matching result from the popup.
Expected: Codex adds the file to the conversation, ensuring follow-up turns reference it directly.
### Start a new conversation with `/new`
1. Type `/new` and press Enter.
Expected: Codex starts a fresh conversation in the same CLI session, so you
can switch tasks without leaving your terminal.
Unlike `/clear`, `/new` doesn’t clear the current terminal view first.
### Resume a saved conversation with `/resume`
1. Type `/resume` and press Enter.
2. Choose the session you want from the saved-session picker.
Expected: Codex reloads the selected conversation’s transcript so you can pick
up where you left off, keeping the original history intact.
### Fork the current conversation with `/fork`
1. Type `/fork` and press Enter.
Expected: Codex clones the current conversation into a new thread with a fresh
ID, leaving the original transcript untouched so you can explore an alternative
approach in parallel.
If you need to fork a saved session instead of the current one, run
`codex fork` in your terminal to open the session picker.
### Start a side conversation with `/side`
Use `/side` to start an ephemeral fork from the current conversation without switching away from the main task.
1. Type `/side` to open a side conversation.
2. Optionally add inline text, for example `/side Check whether this plan has an obvious risk`.
3. Return to the parent thread after the focused detour finishes.
Expected: Codex opens a side conversation whose transcript is separate from the parent thread. While you are in side mode, the TUI continues to show parent-thread status so you can see whether the main task is still running.
`/side` is unavailable inside another side conversation and during review mode.
### Generate `AGENTS.md` with `/init`
1. Run `/init` in the directory where you want Codex to look for persistent instructions.
2. Review the generated `AGENTS.md`, then edit it to match your repository conventions.
Expected: Codex creates an `AGENTS.md` scaffold you can refine and commit for
future sessions.
### Ask for a working tree review with `/review`
1. Type `/review`.
2. Follow up with `/diff` if you want to inspect the exact file changes.
Expected: Codex summarizes issues it finds in your working tree, focusing on
behavior changes and missing tests. It uses the current session model unless
you set `review\_model` in `config.toml`.
### List MCP tools with `/mcp`
1. Type `/mcp`.
2. Review the list to confirm which MCP servers and tools are available.
Expected: You see the configured Model Context Protocol (MCP) tools Codex can call in this session.
Use `/mcp verbose` to include detailed server diagnostics. If you pass anything other than `verbose`, Codex shows the command usage.
### Browse apps with `/apps`
1. Type `/apps`.
2. Pick an app from the list.
Expected: Codex inserts the app mention into the composer as `$app-slug`, so
you can immediately ask Codex to use it.
### Browse plugins with `/plugins`
1. Type `/plugins`.
2. Choose a marketplace tab, then pick a plugin to inspect its capabilities or available actions.
Expected: Codex opens the plugin browser so you can review installed plugins,
discoverable plugins that your configuration allows, and installed plugin state.
Press Space on an installed plugin to toggle its enabled state.
### Switch agent threads with `/agent`
1. Type `/agent` and press Enter.
2. Select the thread you want from the picker.
Expected: Codex switches the active thread so you can inspect or continue that
agent’s work.
### Send feedback with `/feedback`
1. Type `/feedback` and press Enter.
2. Follow the prompts to include logs or diagnostics.
Expected: Codex collects the requested diagnostics and submits them to the
maintainers.
### Sign out with `/logout`
1. Type `/logout` and press Enter.
Expected: Codex clears local credentials for the current user session.
### Exit the CLI with `/quit` or `/exit`
1. Type `/quit` (or `/exit`) and press Enter.
Expected: Codex exits immediately. Save or commit any important work first.