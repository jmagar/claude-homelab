# Technology Choices -- homelab-core

Technology stack reference for the orchestration hub.

## Core stack

| Component | Technology | Purpose |
| --- | --- | --- |
| Language | Bash/Shell | Skills scripts, Justfile recipes, setup |
| Task runner | just | 30+ recipes for validation, deployment, operations |
| Plugin system | Claude Code plugin SDK | Skills, agents, commands discovery |
| Credential store | `.env` file | Flat-file credential management |
| Package format | Markdown + Shell | SKILL.md definitions + bash scripts |

## Why no MCP server

homelab-core is intentionally not an MCP server. It serves as the coordination layer:

- **Skills** provide domain knowledge as Markdown that Claude reads
- **Scripts** execute curl commands against service APIs
- **External MCP plugins** handle complex tool interfaces with proper request/response schemas
- **Justfile recipes** provide operational workflows

This separation keeps homelab-core lightweight while external plugins handle protocol-level concerns.

## Skill scripts

Skills use bash scripts with curl for API interaction:

| Tool | Purpose |
| --- | --- |
| `curl` | HTTP requests to service APIs |
| `jq` | JSON parsing and transformation |
| `bash` | Script execution with strict mode |

### Credential library

`scripts/load-env.sh` provides three functions:
- `load_env_file` -- sources `.env` into shell
- `validate_env_vars` -- checks required variables
- `load_service_credentials` -- combined load + validate

## Justfile

The 73 KB Justfile is the operational backbone. It uses:

| Feature | Purpose |
| --- | --- |
| Bash recipes | Complex multi-step operations |
| Associative arrays | Plugin-to-env-var mapping |
| `jq` queries | Parse marketplace.json |
| `docker compose` | MCP plugin container management |
| `curl` | Service connectivity checks |
| `openssl` | TLS certificate inspection |

## Claude Code integration

| Surface | Format | Discovery |
| --- | --- | --- |
| Skills | `SKILL.md` in `skills/<name>/` | Plugin install or `~/.claude/skills/` symlinks |
| Agents | `.md` in `agents/` | Plugin install or `~/.claude/agents/` symlinks |
| Commands | `.md` in `commands/` | Plugin install or `~/.claude/commands/` symlinks |

### Multi-platform manifests

| Platform | Manifest | Context file |
| --- | --- | --- |
| Claude Code | `.claude-plugin/plugin.json` | `CLAUDE.md` |
| Codex | `.codex-plugin/plugin.json` | `AGENTS.md` (-> CLAUDE.md) |
| Gemini | `gemini-extension.json` | `GEMINI.md` (-> CLAUDE.md) |

`AGENTS.md` and `GEMINI.md` are symlinks to `CLAUDE.md`, maintained by `just link-claude-md`.

## External MCP plugins

External plugins in the ecosystem use varied stacks:

| Language | Plugins | Framework |
| --- | --- | --- |
| Python | overseerr-mcp, gotify-mcp, syslog-mcp | FastMCP |
| TypeScript | unraid-mcp, swag-mcp, arcane-mcp | MCP SDK + Express |
| Rust | axon | axum + tokio |

homelab-core orchestrates all of them through the marketplace catalog and Justfile recipes.

## CI/CD

| Component | Tool |
| --- | --- |
| Workflow engine | GitHub Actions |
| Doc mirror refresh | `update-doc-mirrors.yaml` (weekly cron) |
| Secret management | `push-github-secrets.sh` via `gh secret set` |

## Linting

| Target | Tool |
| --- | --- |
| Shell scripts | shellcheck |
| Python scripts | ruff (lint + format) + ty (type check) |
| SKILL.md files | `npx skills-ref validate` |
| Plugin structure | `lint-plugin.sh` per external repo |

## Cross-references

- [ARCH.md](ARCH.md) -- Architecture patterns
- [PRE-REQS.md](PRE-REQS.md) -- Prerequisites
- [RECIPES.md](../repo/RECIPES.md) -- Justfile recipes
