Features – Codex CLI | OpenAI Developers
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
Codex supports workflows beyond chat. Use this guide to learn what each one unlocks and when to use it.
## Running in interactive mode
Codex launches into a full-screen terminal UI that can read your repository, make edits, and run commands as you iterate together. Use it whenever you want a conversational workflow where you can review Codex’s actions in real time.
```
`codex`
```
You can also specify an initial prompt on the command line.
```
`codex "Explain this codebase to me"`
```
Once the session is open, you can:
* Send prompts, code snippets, or screenshots (see [image inputs](#image-inputs)) directly into the composer.
* Watch Codex explain its plan before making a change, and approve or reject steps inline.
* Read syntax-highlighted markdown code blocks and diffs in the TUI, then use `/theme` to preview and save a preferred theme.
* Use `/clear` to wipe the terminal and start a fresh chat, or press Ctrl+L to clear the screen without starting a new conversation.
* Use `/copy` or press Ctrl+O to copy the latest completed Codex output. If a turn is still running, Codex copies the most recent finished output instead of in-progress text.
* Press Tab while Codex is running to queue follow-up text, slash commands, or `!` shell commands for the next turn.
* Navigate draft history in the composer with Up/Down; Codex restores prior draft text and image placeholders.
* Press Ctrl+R to search prompt history from the composer, then press Enter to accept a match or Esc to cancel.
* Press Ctrl+C or use `/exit` to close the interactive session when you’re done.
## Resuming conversations
Codex stores your transcripts locally so you can pick up where you left off instead of repeating context. Use the `resume` subcommand when you want to reopen an earlier thread with the same repository state and instructions.
* `codex resume` launches a picker of recent interactive sessions. Highlight a run to see its summary and press Enter to reopen it.
* `codex resume --all` shows sessions beyond the current working directory, so you can reopen any local run.
* `codex resume --last` skips the picker and jumps straight to your most recent session from the current working directory (add `--all` to ignore the current working directory filter).
* `codex resume \<SESSION\_ID\>` targets a specific run. You can copy the ID from the picker, `/status`, or the files under `\~/.codex/sessions/`.
Non-interactive automation runs can resume too:
```
`codex exec resume --last "Fix the race conditions you found"
codex exec resume 7f9f9a2e-1b3c-4c7a-9b0e-.... "Implement the plan"`
```
Each resumed run keeps the original transcript, plan history, and approvals, so Codex can use prior context while you supply new instructions. Override the working directory with `--cd` or add extra roots with `--add-dir` if you need to steer the environment before resuming.
## Connect the TUI to a remote app server
Remote TUI mode lets you run the Codex app server on one machine and use the Codex terminal UI from another machine. This is useful when the code, credentials, or execution environment live on a remote host, but you want the local interactive TUI experience.
Start the app server on the machine that should own the workspace and run commands:
```
`codex app-server --listen ws://127.0.0.1:4500`
```
Then connect from the machine running the TUI:
```
`codex --remote ws://127.0.0.1:4500`
```
For access from another machine, bind the app server to a reachable interface, for example:
```
`codex app-server --listen ws://0.0.0.0:4500`
```
`--remote` accepts explicit `ws://host:port` and `wss://host:port` addresses only. For plain WebSocket connections, prefer local-host addresses or SSH port forwarding. If you expose the listener beyond the local host, configure authentication before real remote use and put authenticated non-local connections behind TLS.
Codex supports these WebSocket authentication modes for remote TUI connections:
* **No WebSocket auth**: Best for local-host listeners or SSH port-forwarded connections. Codex can start non-local listeners without auth, but logs a warning and the startup banner reminds you to configure auth before real remote use.
* **Capability token**: Store a shared token in a file on the app-server host, start the server with `--ws-auth capability-token --ws-token-file /abs/path/to/token`, then set the same token in an environment variable on the TUI host and pass `--remote-auth-token-env \<ENV\_VAR\>`.
* **Signed bearer token**: Store an HMAC shared secret in a file on the app-server host, start the server with `--ws-auth signed-bearer-token --ws-shared-secret-file /abs/path/to/secret`, and have the TUI send a signed JWT bearer token through `--remote-auth-token-env \<ENV\_VAR\>`. The shared secret must be at least 32 bytes. Signed tokens use HS256 and must include `exp`; Codex also validates `nbf`, `iss`, and `aud` when those claims or server options are present.
To create a capability token on the app-server host, generate a random token file with permissions that only your user can read:
```
`TOKEN\_FILE="$HOME/.codex/codex-app-server-token"
install -d -m 700 "$(dirname "$TOKEN\_FILE")"
openssl rand -base64 32 \> "$TOKEN\_FILE"
chmod 600 "$TOKEN\_FILE"`
```
Treat the token file like a password, and regenerate it if it leaks.
Then start the app server with that token file. For example, with a capability token behind a TLS proxy:
```
`# Remote host
TOKEN\_FILE="$HOME/.codex/codex-app-server-token"
codex app-server \\
--listen ws://0.0.0.0:4500 \\
--ws-auth capability-token \\
--ws-token-file "$TOKEN\_FILE"
# TUI host
export CODEX\_REMOTE\_AUTH\_TOKEN="$(ssh devbox 'cat \~/.codex/codex-app-server-token')"
codex --remote wss://codex-devbox.example.com:4500 \\
--remote-auth-token-env CODEX\_REMOTE\_AUTH\_TOKEN`
```
The TUI sends remote auth tokens as `Authorization: Bearer \<token\>` during the WebSocket handshake. Codex only sends those tokens over `wss://` URLs or `ws://` URLs whose host is `localhost`, `127.0.0.1`, or `::1`, so put non-local remote listeners behind TLS if clients need to authenticate over the network.
## Models and reasoning
For most tasks in Codex, `gpt-5.5` is the recommended model when it is
available. It is OpenAI’s newest frontier model for complex coding, computer
use, knowledge work, and research workflows, with stronger planning, tool use,
and follow-through on multi-step tasks. If `gpt-5.5` is not yet available,
continue using `gpt-5.4`. For extra fast tasks, ChatGPT Pro subscribers have
access to the GPT-5.3-Codex-Spark model in research preview.
Switch models mid-session with the `/model` command, or specify one when launching the CLI.
```
`codex --model gpt-5.5`
```
[Learn more about the models available in Codex](/codex/models).
## Feature flags
Codex includes a small set of feature flags. Use the `features` subcommand to inspect what’s available and to persist changes in your configuration.
```
`codex features list
codex features enable unified\_exec
codex features disable shell\_snapshot`
```
`codex features enable \<feature\>` and `codex features disable \<feature\>` write to `\~/.codex/config.toml`. If you launch Codex with `--profile`, Codex stores the change in that profile rather than the root configuration.
## Subagents
Use Codex subagent workflows to parallelize larger tasks. For setup, role configuration (`[agents]` in `config.toml`), and examples, see [Subagents](/codex/subagents).
Codex only spawns subagents when you explicitly ask it to. Because each
subagent does its own model and tool work, subagent workflows consume more
tokens than comparable single-agent runs.
## Image inputs
Attach screenshots or design specs so Codex can read image details alongside your prompt. You can paste images into the interactive composer or provide files on the command line.
```
`codex -i screenshot.png "Explain this error"`
```
```
`codex --image img1.png,img2.jpg "Summarize these diagrams"`
```
Codex accepts common formats such as PNG and JPEG. Use comma-separated filenames for two or more images, and combine them with text instructions to add context.
## Image generation
Ask Codex to generate or edit images directly in the CLI. This works well for assets such as icons, banners, illustrations, sprite sheets, and placeholder art. If you want Codex to transform or extend an existing asset, attach a reference image with your prompt.
You can ask in natural language or explicitly invoke the image generation skill by including `$imagegen` in your prompt.
Built-in image generation uses `gpt-image-2`, counts toward your general Codex usage limits, and uses included limits 3-5x faster on average than similar turns without image generation, depending on image quality and size. For details, see [Pricing](/codex/pricing#image-generation-usage-limits). For prompting tips and model details, see the [image generation guide](/api/docs/guides/image-generation).
For larger batches of image generation, set `OPENAI\_API\_KEY` in your environment variables and ask Codex to generate images through the API so API pricing applies instead.
## Syntax highlighting and themes
The TUI syntax-highlights fenced markdown code blocks and file diffs so code is easier to scan during reviews and debugging.
Use `/theme` to open the theme picker, preview themes live, and save your selection to `tui.theme` in `\~/.codex/config.toml`. You can also add custom `.tmTheme` files under `$CODEX\_HOME/themes` and select them in the picker.
## Running local code review
Type `/review` in the CLI to open Codex’s review presets. The CLI launches a dedicated reviewer that reads the diff you select and reports prioritized, actionable findings without touching your working tree. By default it uses the current session model; set `review\_model` in `config.toml` to override.
* **Review against a base branch** lets you pick a local branch; Codex finds the merge base against its upstream, diffs your work, and highlights the biggest risks before you open a pull request.
* **Review uncommitted changes** inspects everything that’s staged, not staged, or not tracked so you can address issues before committing.
* **Review a commit** lists recent commits and has Codex read the exact change set for the SHA you choose.
* **Custom review instructions** accepts your own wording (for example, “Focus on accessibility regressions”) and runs the same reviewer with that prompt.
Each run shows up as its own turn in the transcript, so you can rerun reviews as the code evolves and compare the feedback.
## Web search
Codex ships with a first-party web search tool. For local tasks in the Codex CLI, Codex enables web search by default and serves results from a web search cache. The cache is an OpenAI-maintained index of web results, so cached mode returns pre-indexed results instead of fetching live pages. This reduces exposure to prompt injection from arbitrary live content, but you should still treat web results as untrusted. If you are using `--yolo` or another [full access sandbox setting](/codex/agent-approvals-security), web search defaults to live results. To fetch the most recent data, pass `--search` for a single run or set `web\_search = "live"` in [Config basics](/codex/config-basic). You can also set `web\_search = "disabled"` to turn the tool off.
You’ll see `web\_search` items in the transcript or `codex exec --json` output whenever Codex looks something up.
## Running with an input prompt
When you just need a quick answer, run Codex with a single prompt and skip the interactive UI.
```
`codex "explain this codebase"`
```
Codex will read the working directory, craft a plan, and stream the response back to your terminal before exiting. Pair this with flags like `--path` to target a specific directory or `--model` to dial in the behavior up front.
## Shell completions
Speed up everyday usage by installing the generated completion scripts for your shell:
```
`codex completion bash
codex completion zsh
codex completion fish`
```
Run the completion script in your shell configuration file to set up completions for new sessions. For example, if you use `zsh`, you can add the following to the end of your `\~/.zshrc` file:
```
`# \~/.zshrc
eval "$(codex completion zsh)"`
```
Start a new session, type `codex`, and press Tab to see the completions. If you see a `command not found: compdef` error, add `autoload -Uz compinit && compinit` to your `\~/.zshrc` file before the `eval "$(codex completion zsh)"` line, then restart your shell.
## Approval modes
Approval modes define how much Codex can do without stopping for confirmation. Use `/permissions` inside an interactive session to switch modes as your comfort level changes.
* **Auto** (default) lets Codex read files, edit, and run commands within the working directory. It still asks before touching anything outside that scope or using the network.
* **Read-only** keeps Codex in a consultative mode. It can browse files but won’t make changes or run commands until you approve a plan.
* **Full Access** grants Codex the ability to work across your machine, including network access, without asking. Use it sparingly and only when you trust the repository and task.
Codex always surfaces a transcript of its actions, so you can review or roll back changes with your usual git workflow.
## Scripting Codex
Automate workflows or wire Codex into your existing scripts with the `exec` subcommand. This runs Codex non-interactively, piping the final plan and results back to `stdout`.
```
`codex exec "fix the CI failure"`
```
Combine `exec` with shell scripting to build custom workflows, such as automatically updating changelogs, sorting issues, or enforcing editorial checks before a PR ships.
## Working with Codex cloud
The `codex cloud` command lets you triage and launch [Codex cloud tasks](/codex/cloud) without leaving the terminal. Run it with no arguments to open an interactive picker, browse active or finished tasks, and apply the changes to your local project.
You can also start a task directly from the terminal:
```
`codex cloud exec --env ENV\_ID "Summarize open bugs"`
```
Add `--attempts` (1–4) to request best-of-N runs when you want Codex cloud to generate more than one solution. For example, `codex cloud exec --env ENV\_ID --attempts 3 "Summarize open bugs"`.
Environment IDs come from your Codex cloud configuration—use `codex cloud` and press Ctrl+O to choose an environment or the web dashboard to confirm the exact value. Authentication follows your existing CLI login, and the command exits non-zero if submission fails so you can wire it into scripts or CI.
## Slash commands
Slash commands give you quick access to specialized workflows like `/review`, `/fork`, `/side`, or your own reusable prompts. Codex ships with a curated set of built-ins, and you can create custom ones for team-specific tasks or personal shortcuts.
See the [slash commands guide](/codex/guides/slash-commands) to browse the catalog of built-ins, learn how to author custom commands, and understand where they live on disk.
## Prompt editor
When you’re drafting a longer prompt, it can be easier to switch to a full editor and then send the result back to the composer.
In the prompt input, press Ctrl+G to open the editor defined by the `VISUAL` environment variable (or `EDITOR` if `VISUAL` isn’t set).
## Model Context Protocol (MCP)
Connect Codex to more tools by configuring Model Context Protocol servers. Add STDIO or streaming HTTP servers in `\~/.codex/config.toml`, or manage them with the `codex mcp` CLI commands—Codex launches them automatically when a session starts and exposes their tools next to the built-ins. You can even run Codex itself as an MCP server when you need it inside another agent.
See [Model Context Protocol](/codex/mcp) for example configurations, supported auth flows, and a more detailed guide.
## Tips and shortcuts
* Type `@` in the composer to open a fuzzy file search over the workspace root; press Tab or Enter to drop the highlighted path into your message.
* Press Enter while Codex is running to inject new instructions into the current turn, or press Tab to queue follow-up input for the next turn. Queued input can be a normal prompt, a slash command such as `/review`, or a `!` shell command. Codex parses queued slash commands when they run.
* Prefix a line with `!` to run a local shell command (for example, `!ls`). Codex treats the output like a user-provided command result and still applies your approval and sandbox settings.
* Tap Esc twice while the composer is empty to edit your previous user message. Continue pressing Esc to walk further back in the transcript, then hit Enter to fork from that point.
* Launch Codex from any directory using `codex --cd \<path\>` to set the working root without running `cd` first. The active path appears in the TUI header.
* Expose more writable roots with `--add-dir` (for example, `codex --cd apps/frontend --add-dir ../backend --add-dir ../shared`) when you need to coordinate changes across more than one project.
* Make sure your environment is already set up before launching Codex so it doesn’t spend tokens probing what to activate. For example, source your Python virtual environment (or other language environments), start any required daemons, and export the environment variables you expect to use ahead of time.