---
name: openacp
description: Use when working with OpenACP, including setup for Telegram, Discord, or Slack, ACP-compatible agent installation, OpenACP CLI/daemon management, chat commands, session adoption, local REST API diagnostics, configuration, plugins, tunnels, and troubleshooting.
---

# OpenACP

Use this skill for OpenACP chat bridge and daemon workflows.

## What OpenACP Is

OpenACP runs ACP-compatible agents from chat platforms. It connects a Telegram,
Discord, or Slack bot to a local OpenACP instance, creates per-chat agent
sessions, streams tool activity and responses, and handles permission prompts
from chat.

## Prerequisites

- Node.js 20 or later.
- `@openacp/cli` installed with `npm install -g @openacp/cli`.
- A bot token for Telegram, Discord, or Slack.
- At least one ACP-compatible agent CLI, such as `claude` or `gemini`.

## Setup Flow

1. Check `node --version` and `openacp --version`.
2. Run `openacp` for the first-time wizard.
3. Choose Telegram, Discord, or Slack.
4. Enter and validate the platform bot token.
5. Let OpenACP detect installed ACP-compatible agents.
6. Choose foreground mode for testing or daemon mode for persistent use.
7. Start with `openacp start` or inspect daemon state with `openacp status`.

## CLI Operations

Common commands:

```bash
openacp start
openacp status
openacp attach
openacp onboard
openacp config
openacp agents
openacp agents install claude
openacp agents install gemini --force
openacp agents info claude --json
openacp agents run gemini
openacp adopt claude <session-id> --cwd /path/to/project --json
```

Prefer `--json` when a command supports it and the result will be consumed by
automation. JSON responses use a success/error envelope.

## Chat Commands

Use these from the connected chat platform:

- `/new [agent] [workspace]` creates a new session.
- `/newchat` starts a fresh chat with the same agent and workspace.
- `/cancel` stops the current response.
- `/status` shows session or system status.
- `/sessions` lists sessions.
- `/agents` browses installed and available agents.
- `/install <name>` installs an agent.
- `/menu` opens the action menu.
- `/doctor` runs diagnostics.
- `/switch` changes agent mid-conversation.
- `/handoff` continues the chat session in a terminal.
- `/outputmode low|medium|high` controls activity detail.

Telegram also supports session resume, tunnels, usage, archive, and summary
commands. Discord uses thread-oriented variants for the same core session flow.

## Configuration

The default config file is:

```text
~/openacp-workspace/.openacp/config.json
```

Override it with `OPENACP_CONFIG_PATH` when operating another instance.
Instance data lives under `<workspace>/.openacp/`, including sessions, usage,
logs, files, plugins, and history. Shared agent registry data lives under
`~/.openacp/`.

Core config covers `defaultAgent`, `security`, `logging`, `runMode`,
`autoStart`, `sessionStore`, and API host/port. Plugin-specific settings such
as channel credentials, tunnel config, speech providers, and usage settings live
under:

```text
<instance-root>/plugins/data/<plugin-name>/settings.json
```

## Local API

The daemon exposes a local REST API at `http://127.0.0.1:21420` by default.
Health and version endpoints are unauthenticated:

```bash
curl http://127.0.0.1:21420/api/health
curl http://127.0.0.1:21420/api/version
```

Admin endpoints require `Authorization: Bearer <token>`, where the full-access
secret token is stored in `<instance-root>/api-secret`. Treat that file like an
SSH private key. Swagger UI is available at `/docs` when the daemon is running.

## Guardrails

- Do not put bot tokens, API secrets, or JWTs in plugin manifests or committed
  docs.
- Do not bind the API host to `0.0.0.0` without network access controls.
- Use `/doctor`, `openacp status`, `openacp attach`, logs, and
  `/api/health` before changing configuration.
- This plugin does not define an MCP server. OpenACP is documented as an ACP
  chat bridge and local daemon.
