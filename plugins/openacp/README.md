# OpenACP Plugin

OpenACP bridges ACP-compatible coding agents into Telegram, Discord, and Slack. It runs as a local CLI/daemon, connects to a chat platform bot, starts agent sessions, and streams agent output back to chat threads.

Sources:

- OpenACP docs: https://docs.openacp.ai/
- Quick start: https://docs.openacp.ai/getting-started/quick-start
- CLI commands: https://docs.openacp.ai/api-reference/cli-commands
- Configuration: https://docs.openacp.ai/self-hosting/configuration
- REST API: https://docs.openacp.ai/api-reference/rest-api

## Install

OpenACP requires Node.js 20 or later and an ACP-compatible agent CLI such as `claude` or `gemini`.

```bash
npm install -g @openacp/cli
openacp --version
```

Run the setup wizard:

```bash
openacp
```

The wizard selects the chat platform, stores the bot token in OpenACP's instance configuration, detects installed agents, and chooses foreground or daemon mode.

## Runtime Paths

The default instance uses:

```text
~/openacp-workspace/.openacp/config.json
~/openacp-workspace/.openacp/sessions.json
~/openacp-workspace/.openacp/usage.json
~/openacp-workspace/.openacp/logs/
~/openacp-workspace/.openacp/files/
~/openacp-workspace/.openacp/plugins/
~/openacp-workspace/.openacp/history/
```

Shared agent binaries and instance registry data live under:

```text
~/.openacp/
```

Use `OPENACP_CONFIG_PATH` to point OpenACP at a non-default instance config.

## Common Commands

```bash
openacp start
openacp status
openacp attach
openacp onboard
openacp config
openacp agents
openacp agents install claude
openacp agents install gemini --force
openacp agents run gemini
openacp adopt claude <session-id> --cwd /path/to/project
```

Many OpenACP CLI commands support `--json` and return a `{ "success": true, "data": ... }` or `{ "success": false, "error": ... }` envelope.

## Chat Commands

Core chat commands include:

- `/new [agent] [workspace]` starts a session.
- `/cancel` stops the current response.
- `/status` shows session or system status.
- `/sessions` lists sessions.
- `/agents` browses installed and available agents.
- `/install <name>` installs an agent.
- `/menu` opens the action menu.
- `/doctor` runs diagnostics.
- `/switch` changes agent mid-conversation.
- `/handoff` continues a session in a terminal.

## API

When the daemon is running, OpenACP exposes a local REST API at `http://127.0.0.1:21420` by default. `GET /api/health` and `GET /api/version` are unauthenticated. Admin routes require a bearer token from the instance `api-secret` file or a scoped JWT.

Swagger UI is available at `/docs` while the server is running.

## MCP

This plugin intentionally ships an empty `.mcp.json`. OpenACP is an ACP chat bridge and daemon; the docs do not describe it as an MCP server to launch through Claude Code.
