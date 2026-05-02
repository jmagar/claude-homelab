Agent Issues | OpenACP Docs
GitBook Assistant
##### Good morning
I'm here to help you with the docs.
What is this page about?What should I read next?Can you give an example?
⌘Ctrli
AI Based on your context
Send
[](/)
* [README](/)
*
Getting Started
* [Overview](/getting-started/getting-started)
* [What is OpenACP?](/getting-started/what-is-openacp)
* [Quick Start](/getting-started/quick-start)
* [For Contributors](/getting-started/for-contributors)
*
Platform Setup
* [Choose Your Platform](/platform-setup/platform-setup)
* [Telegram](/platform-setup/telegram)
* [Discord](/platform-setup/discord)
* [Slack](/platform-setup/slack)
*
Using OpenACP
* [Overview](/using-openacp/using-openacp)
* [Chat Commands](/using-openacp/chat-commands)
* [Sessions](/using-openacp/sessions)
* [Agents](/using-openacp/agents)
* [Permissions](/using-openacp/permissions)
* [Voice & Speech](/using-openacp/voice-and-speech)
* [Files & Media](/using-openacp/files-and-media)
*
Self-Hosting
* [Overview](/self-hosting/self-hosting)
* [Installation](/self-hosting/installation)
* [Configuration](/self-hosting/configuration)
* [Daemon Mode](/self-hosting/daemon-mode)
* [Security](/self-hosting/security)
* [Logging](/self-hosting/logging)
* [Updating](/self-hosting/updating)
*
Features
* [Overview](/features/features)
* [Tunnel & Port Forwarding](/features/tunnel)
* [Context Resume](/features/context-resume)
* [Output Modes](/features/output-modes)
* [Usage & Budget](/features/usage-and-budget)
* [Session Persistence](/features/session-persistence)
* [Session Handoff](/features/session-handoff)
* [Agent Switch](/features/agent-switch)
* [Workspaces](/features/multi-instance)
* [App Connectivity](/features/app-connectivity)
* [Doctor Diagnostics](/features/doctor)
* [Assistant Mode](/features/assistant-mode)
*
Architecture
* [Overview](/architecture/architecture)
* [Core Design](/architecture/core-design)
* [Plugin System](/architecture/plugin-system)
* [Command System](/architecture/command-system)
* [Built-in Plugins](/architecture/built-in-plugins)
* [Writing Plugins](/architecture/writing-plugins)
*
Extending
* [Overview](/extending/extending)
* [Getting Started: Your First Plugin](/extending/getting-started-plugin)
* [Plugin System](/extending/plugin-system)
* [Plugin SDK Reference](/extending/plugin-sdk-reference)
* [Dev Mode](/extending/dev-mode)
* [Building Adapters](/extending/building-adapters)
* [Adapter Reference](/extending/adapter-reference)
* [Contributing](/extending/contributing)
*
API Reference
* [Overview](/api-reference/api-reference)
* [CLI Commands](/api-reference/cli-commands)
* [REST API](/api-reference/rest-api)
* [Configuration Schema](/api-reference/configuration-schema)
* [Environment Variables](/api-reference/environment-variables)
*
Troubleshooting
* [Common Issues](/troubleshooting/troubleshooting)
* [Telegram Issues](/troubleshooting/telegram-issues)
* [Discord Issues](/troubleshooting/discord-issues)
* [Slack Issues](/troubleshooting/slack-issues)
* [Agent Issues](/troubleshooting/agent-issues)
* [FAQ](/troubleshooting/faq)
[Powered by GitBook](https://www.gitbook.com/?utm_source=content&amp;utm_medium=trademark&amp;utm_campaign=xDIegDd7TZzhXcvU0Y6N&amp;utm_content=site_RPD3m)[](https://www.gitbook.com/?utm_source=content&amp;utm_medium=trademark&amp;utm_campaign=xDIegDd7TZzhXcvU0Y6N&amp;utm_content=site_RPD3m)
On this page
Run `openacp doctor` first — it checks whether each configured agent command exists in your PATH.
###
[](#agent-not-found-or-default-agent-missing)
"Agent not found" or default agent missing
**Symptoms:** OpenACP logs show `Default agent "..." not found in agents config` and no sessions start.
**Cause:** The `defaultAgent` field in `\<instance-root\>/config.json` references an agent name that is not defined under the `agents` map, or was mistyped.
**Solution:**
1.
Open `\<instance-root\>/config.json` (e.g. `\~/openacp-workspace/.openacp/config.json`) and verify that `defaultAgent` matches a key under `agents` exactly (case-sensitive).
2.
Run `openacp doctor` — it reports `Default agent "X" not found in agents config` with the offending name.
3.
Run `openacp agents list` to see all available agents and their registry IDs.
###
[](#agent-crashes-on-startup-missing-dependency)
Agent crashes on startup — missing dependency
**Symptoms:** A session starts and immediately reports `Agent crashed (exit code 1)` with stderr output mentioning a command not found.
**Cause:** Some agents depend on an external CLI being installed first. For example, `claude-acp` requires `@anthropic-ai/claude-code` and `codex-acp` requires `@openai/codex`.
**Solution:**
Install the required dependency. Common cases:
Agent
Required CLI
Install command
`claude-acp`
Claude CLI
`npm install -g @anthropic-ai/claude-code`
`codex-acp`
Codex CLI
`npm install -g @openai/codex`
`crow-cli`, `fast-agent`
uvx (Python)
`pip install uv`
After installing, run `openacp doctor` to confirm the command is found. Then restart OpenACP.
###
[](#agent-times-out-and-session-stalls)
Agent times out and session stalls
**Symptoms:** The session shows activity (typing indicator) but never produces a response, eventually timing out.
**Cause:** The agent subprocess is alive but not producing ACP output — typically because it is waiting for an API key, authentication, or interactive input that can't be provided via stdin.
**Solution:**
1.
Run the agent directly in your terminal first: `openacp agents run \<agent-name\>`. Complete any one-time setup (login, API key entry) interactively.
2.
For agents requiring login:
*
Claude: `claude login`
*
Codex: `codex` → select "Sign in with ChatGPT"
*
Gemini: `openacp agents run gemini` → sign in with Google
*
After completing setup, restart OpenACP — subsequent spawns will reuse the stored credentials.
###
[](#command-not-found-for-the-agent)
"Command not found" for the agent
**Symptoms:** `openacp doctor` reports `\<command\> not found in PATH` and sessions fail immediately.
**Cause:** The agent's executable is not on your system's `PATH`. This can happen after a global npm install if the npm bin directory is not in `PATH`, or if the agent was installed locally but not globally.
**Solution:**
1.
Confirm the command exists: `which claude` (or the relevant command).
2.
If not found, install globally: `npm install -g \<package\>`.
3.
If installed but not found, add the npm global bin directory to your PATH:
4.
Open a new terminal and verify: `which claude`. Restart OpenACP.
###
[](#permission-denied-when-spawning-agent)
Permission denied when spawning agent
**Symptoms:** Logs show `Failed to spawn agent "...": EACCES` or `permission denied`.
**Cause:** The agent executable exists but is not marked as executable, or it lives in a directory your user cannot read.
**Solution:**
1.
Locate the binary: `which \<command\>`.
2.
Fix permissions: `chmod +x $(which \<command\>)`.
3.
If the file is owned by another user (e.g., installed with `sudo`), reinstall without sudo: `npm install -g \<package\>` as your regular user.
###
[](#agent-works-in-the-terminal-but-not-via-openacp)
Agent works in the terminal but not via OpenACP
**Symptoms:** Running the agent command directly in your terminal works fine, but OpenACP sessions fail or produce empty responses.
**Cause:** OpenACP spawns the agent as a subprocess with a clean environment (`process.env` plus any `env` overrides in config). Environment variables set only in interactive shell sessions (e.g., in `.zshrc` but not `.zprofile`) may not be inherited.
**Solution:**
1.
Add required environment variables (API keys, etc.) explicitly to the agent's `env` block in `\<instance-root\>/config.json` (e.g. `\~/openacp-workspace/.openacp/config.json`):
2.
Alternatively, ensure the variable is exported in a file loaded for non-interactive shells (e.g., `\~/.zprofile` or `\~/.bashrc`).
###
[](#session-stuck-in-initializing)
Session stuck in "initializing"
**Symptoms:** A session is created but the agent never responds. Logs show the spawn completed but no ACP events appear.
**Cause:** The agent started but failed the ACP handshake (`initialize` → `newSession`) — either it does not speak ACP, or it exited before the handshake completed.
**Solution:**
1.
Enable debug logging: set `OPENACP\_DEBUG=true` and restart. Look for `ACP raw` log lines — if none appear after `Spawning agent`, the subprocess is not producing stdout.
2.
Confirm the agent is an ACP-compatible binary. Only agents that implement the Agent Client Protocol work with OpenACP.
3.
Check stderr output in the logs (`Agent crashed` events include the last 50 lines of stderr).
###
[](#high-resource-usage-cpu-memory)
High resource usage (CPU/memory)
**Symptoms:** OpenACP or an agent subprocess consumes excessive CPU or memory over time.
**Cause:** Long-running agent sessions accumulate context. Each new prompt appends to the agent's conversation history, which grows unboundedly until the session is destroyed.
**Solution:**
*
Start a new session periodically for long workstreams. In Telegram, use `/new`; in Discord and Slack, use the `/openacp-new` command.
*
Sessions that are idle for a long time can be destroyed — OpenACP cleans up the subprocess with `SIGTERM` (then `SIGKILL` after 10 seconds) on session destruction.
*
If a specific agent subprocess is the culprit, identify it with `ps aux | grep \<agent-command\>` and destroy the session from the messaging interface.
[PreviousSlack Issues](/troubleshooting/slack-issues)[NextFAQ](/troubleshooting/faq)
Last updated 20 days ago
Was this helpful?