# Claude Homelab

Current release: 1.4.0.

Homelab plugin hub for Claude Code, Codex, and Gemini. This repository is the source of truth for the `homelab-core` plugin, bundled skill-only integrations, agents, commands, and shared credential bootstrapping.

## Overview

`claude-homelab` serves three roles at once:

- The `homelab-core` plugin published through the Claude marketplace
- The canonical mono-repo for 16 bundled skill-only service integrations
- The source for Codex and Gemini extension manifests that mirror the same workflow surface

The repo root is the plugin root. Do not edit generated copies in `~/.claude/` or `~/.claude/plugins/cache/` directly.

## Installation

### Claude marketplace

```bash
/plugin marketplace add jmagar/claude-homelab
/plugin install homelab-core @jmagar-claude-homelab
```

After install, Claude Code downloads the plugin into `~/.claude/plugins/cache/`. No symlinks are created on this path.

### Bash / symlink install

```bash
curl -sSL https://raw.githubusercontent.com/jmagar/claude-homelab/main/scripts/install.sh | bash
```

Or, if you already have the repo cloned:

```bash
./scripts/install.sh
```

The installer:

1. Checks prerequisites (`git`, `jq`, `curl`)
2. Clones the repo to `~/claude-homelab` (or pulls if it exists)
3. Runs `setup-creds.sh` — creates `~/.claude-homelab/.env` from `.env.example` with `chmod 600`
4. Runs `setup-symlinks.sh` — symlinks skills, agents, and commands into `~/.claude/`
5. Runs `verify.sh` — confirms every symlink and required file is in place
6. Prints next steps

## Credential Model

All credentials for every service live in a single file:

```
~/.claude-homelab/.env
```

This file is created from `.env.example` at install time and is never committed. Set it up interactively after install:

```bash
# Interactive wizard (preferred)
# Open Claude Code and run:
/homelab-core:setup

# Or configure manually
$EDITOR ~/.claude-homelab/.env
```

Security requirements:

- `~/.claude-homelab/.env` must have `chmod 600` (owner read/write only)
- Never commit `.env` — it is gitignored
- Never log credentials, even in debug mode
- Use `.env.example` as the template (tracked in git, placeholder values only)

All service scripts load credentials via `scripts/load-env.sh`:

```bash
source "${CLAUDE_PLUGIN_ROOT:-$HOME/claude-homelab}/scripts/load-env.sh"
load_env_file || exit 1
validate_env_vars "SERVICE_URL" "SERVICE_API_KEY"
```

### Environment Variable Reference

Variables are grouped by service. Copy `.env.example` to `~/.claude-homelab/.env` and replace placeholder values.

#### Media

| Variable | Required | Description |
|---|---|---|
| `PLEX_URL` | yes | Plex server base URL |
| `PLEX_TOKEN` | yes | Plex authentication token |
| `OVERSEERR_URL` | yes | Overseerr base URL (skill) |
| `OVERSEERR_API_KEY` | yes | Overseerr API key (skill) |
| `RADARR_URL` | yes | Radarr base URL |
| `RADARR_API_KEY` | yes | Radarr API key |
| `RADARR_DEFAULT_QUALITY_PROFILE` | no | Default quality profile ID (default: `1`) |
| `SONARR_URL` | yes | Sonarr base URL |
| `SONARR_API_KEY` | yes | Sonarr API key |
| `SONARR_DEFAULT_QUALITY_PROFILE` | no | Default quality profile ID (default: `1`) |
| `PROWLARR_URL` | yes | Prowlarr base URL |
| `PROWLARR_API_KEY` | yes | Prowlarr API key |
| `TAUTULLI_URL` | yes | Tautulli base URL |
| `TAUTULLI_API_KEY` | yes | Tautulli API key |

#### Downloads

| Variable | Required | Description |
|---|---|---|
| `SABNZBD_URL` | yes | SABnzbd base URL |
| `SABNZBD_API_KEY` | yes | SABnzbd API key |
| `QBITTORRENT_URL` | yes | qBittorrent WebUI URL |
| `QBITTORRENT_USERNAME` | yes | qBittorrent username |
| `QBITTORRENT_PASSWORD` | yes | qBittorrent password |

#### Infrastructure

| Variable | Required | Description |
|---|---|---|
| `UNRAID_SERVER1_NAME` | yes | Display name for first Unraid server |
| `UNRAID_SERVER1_URL` | yes | Unraid GraphQL endpoint (skill) |
| `UNRAID_SERVER1_API_KEY` | yes | Unraid API key (skill) |
| `UNRAID_SERVER2_NAME` | no | Display name for second Unraid server |
| `UNRAID_SERVER2_URL` | no | Second Unraid GraphQL endpoint |
| `UNRAID_SERVER2_API_KEY` | no | Second Unraid API key |
| `UNIFI_URL` | yes | UniFi controller URL (skill) |
| `UNIFI_USERNAME` | yes | UniFi username |
| `UNIFI_PASSWORD` | yes | UniFi password |
| `UNIFI_SITE` | no | UniFi site name (default: `default`) |
| `TAILSCALE_API_KEY` | yes | Tailscale API key |
| `TAILSCALE_TAILNET` | yes | Tailscale tailnet name or `-` |
| `ZFS_HOST` | yes | Host where ZFS commands run |
| `SWAG_HOST` | yes | SWAG reverse proxy host |
| `SWAG_CONTAINER_NAME` | no | SWAG container name (default: `swag`) |
| `SWAG_APPDATA_PATH` | no | SWAG appdata path |
| `SWAG_COMPOSE_PATH` | no | SWAG compose file path |

#### Utilities and Document Management

| Variable | Required | Description |
|---|---|---|
| `LINKDING_URL` | yes | Linkding bookmark manager URL |
| `LINKDING_API_KEY` | yes | Linkding API token |
| `MEMOS_URL` | yes | Memos server URL |
| `MEMOS_API_TOKEN` | yes | Memos API token |
| `BYTESTASH_URL` | yes | ByteStash snippet manager URL |
| `BYTESTASH_API_KEY` | yes | ByteStash API key |
| `PAPERLESS_URL` | yes | Paperless-ngx base URL |
| `PAPERLESS_API_TOKEN` | yes | Paperless-ngx API token |
| `RADICALE_URL` | yes | Radicale CalDAV/CardDAV URL |
| `RADICALE_USERNAME` | yes | Radicale username |
| `RADICALE_PASSWORD` | yes | Radicale password |
| `GOTIFY_URL` | yes | Gotify push notification URL (skill) |
| `GOTIFY_TOKEN` | yes | Gotify app token (skill) |

#### Research and Dev Tools

| Variable | Required | Description |
|---|---|---|
| `NOTEBOOKLM_COOKIE` | yes | NotebookLM session cookie |
| `NOTEBOOKLM_AUTH_JSON` | no | Full auth JSON blob (alternative to cookie) |
| `NOTEBOOKLM_LOG_LEVEL` | no | Log verbosity (default: `INFO`) |
| `GITHUB_TOKEN` | yes | GitHub personal access token (gh-address-comments) |
| `GLANCES_URL` | no | Glances web interface URL |
| `GLANCES_USERNAME` | no | Glances username (if auth enabled) |
| `GLANCES_PASSWORD` | no | Glances password (if auth enabled) |

#### MCP Server Variables

Each external MCP plugin has its own block of server-config vars. See `.env.example` for the full list. Key patterns:

| Pattern | Description |
|---|---|
| `*_MCP_TOKEN` | Bearer token for MCP server auth |
| `*_MCP_HOST` | Bind host (default: `0.0.0.0`) |
| `*_MCP_PORT` | Listen port |
| `*_MCP_TRANSPORT` | Transport protocol (`streamable-http` or `http`) |
| `*_MCP_NO_AUTH` | Disable auth (set `true` for local-only installs) |
| `*_MCP_ALLOW_DESTRUCTIVE` | Allow destructive operations (default: `false`) |
| `ALLOW_DESTRUCTIVE` | Shared fallback for MCP repos that read this directly |
| `ALLOW_YOLO` | Shared fallback — skip confirmation prompts |
| `DOCKER_NETWORK` | Shared Docker network name |
| `LOG_LEVEL` | Shared log verbosity |

## Commands

### Root Commands

| Command | Argument | Description |
|---|---|---|
| `/check` | `[instructions]` | Read the latest screenshot from `~/Pictures/Screenshots` and describe it. Pass optional instructions (e.g., "extract the text", "what error is shown"). |
| `/deploy` | `[plugin-name]` | Build and start MCP plugin containers via `docker compose up --build -d`. Deploys all external plugins by default. Pass a plugin name to deploy only that one. Reads compose files from `~/.claude/plugins/cache/claude-homelab/<name>/<version>/`. Skips `tests/` subdirs. Reports a status table with notes on failures. |
| `/quick-push` | — | Standardized commit-and-push workflow. Checks branch (creates feature branch if on main), bumps version in all manifests, updates `CHANGELOG.md`, stages all changes, commits with co-authorship signature, pushes, then invokes `save-to-md` and writes Neo4j commit graph entries. |
| `/save-to-md` | `[output-path]` | Document the full session as a Markdown file. Defaults to `docs/sessions/YYYY-MM-DD-description.md`. Embeds the file in Qdrant via Axon. Creates Neo4j entities and relations for files, services, features, and bugs touched in the session. |
| `/validate-plan` | `<plan-file-or-text>` | Audit a technical implementation plan against homelab standards. Checks for exposed secrets, correct credential loading pattern (`scripts/load-env.sh`), required docs (`README.md`, `SKILL.md`, references), `confirm=True` gate on destructive actions, and standard directory structure. Outputs a compliance table and required changes list. |

### `/homelab:*` Commands

| Command | Description |
|---|---|
| `/homelab:system-resources` | Snapshot CPU, RAM, temperatures, and load average. Identifies high-CPU processes, memory pressure, temperature anomalies, and provides optimization recommendations. Uses `uptime`, `free`, `top`, and `sensors`. |
| `/homelab:docker-health` | Audit all Docker containers. Flags unexpected exits, restart loops, unhealthy containers, and resource over-use (CPU > 80%, memory > 90%). Provides per-container recommendations. |
| `/homelab:disk-space` | Analyze disk usage across all mount points. Identifies filesystems above 80% or 95% usage, space hogs, log rotation issues, Docker volume orphans, and suggests cleanup targets. |
| `/homelab:zfs-health` | Full ZFS health check. Reports pool state (ONLINE/DEGRADED/FAULTED), device errors, checksum errors, resilvering, scrub status, ARC hit ratio, snapshot accumulation, and per-dataset usage. Outputs a health score and prioritized action list. |

### `/notebooklm:*` Commands

| Command | Argument | Description |
|---|---|---|
| `/notebooklm:create` | `"Title" [url1] [url2] ...` | Create a new NotebookLM notebook. Optionally add URLs, PDFs, Google Docs, YouTube links, audio, video, or image files as sources. Reports the new notebook ID. |
| `/notebooklm:ask` | `"question"` | Chat with NotebookLM about the current notebook. Options: `--json` for source citations, `-n <id>` to target a specific notebook. |
| `/notebooklm:source` | `add <url\|file> \| list \| wait <id> \| fulltext <id> \| add-research "query"` | Manage notebook sources. Add a URL or file, list current sources, wait for a source to finish processing, retrieve full text, or trigger web research. Supports `-n <id>` for targeting. |
| `/notebooklm:generate` | `<type> ["instructions"]` | Generate an artifact. Types: `audio`, `video`, `quiz`, `report`, `mind-map`, `flashcards`, `slide-deck`, `infographic`, `data-table`. Each type has format, length, style, and difficulty options. |
| `/notebooklm:download` | `<type> [output-path]` | Download a generated artifact to a local file. Supports `--all` and `--format json\|md\|html`. Artifact must be fully generated first. |
| `/notebooklm:list` | `[notebooks\|sources\|artifacts]` | List notebooks (default), sources in the current notebook, or generated artifacts. Presents results in a table with IDs, names, and status. |
| `/notebooklm:research` | `"query" [--mode fast\|deep]` | Run web research and import results as notebook sources. Fast mode: 30 seconds to 2 minutes. Deep mode: 15 to 30+ minutes, use `--no-wait` and follow up with `notebooklm research wait --import-all`. |

#### `/notebooklm:generate` Type Reference

| Type | Key Options | Approximate Time |
|---|---|---|
| `audio` (podcast) | `--format deep-dive\|brief\|critique\|debate`, `--length short\|default\|long` | 10–20 min |
| `video` | `--format explainer\|brief`, `--style auto\|classic\|whiteboard\|kawaii\|...` | 15–45 min |
| `slide-deck` | `--format detailed\|presenter`, `--length default\|short` | 5–15 min |
| `infographic` | `--orientation landscape\|portrait\|square`, `--detail concise\|standard\|detailed` | 5–15 min |
| `report` | `--format briefing-doc\|study-guide\|blog-post\|custom` | 5–15 min |
| `mind-map` | — | Instant |
| `data-table` | description required | 5–15 min |
| `quiz` | `--difficulty easy\|medium\|hard`, `--quantity fewer\|standard\|more` | 5–15 min |
| `flashcards` | `--difficulty easy\|medium\|hard`, `--quantity fewer\|standard\|more` | 5–15 min |

All types support `-s/--source`, `--language`, `--json`, and `--retry N`.

## Skills

18 skill directories live under `skills/`. Each is an independent unit with a `SKILL.md` (Claude-facing) and typically a `README.md`, `scripts/`, and `references/` directory.

### Core Skills (2)

| Skill | Invocation | Purpose |
|---|---|---|
| `homelab-setup` | `/homelab-core:setup` | Interactive credential setup wizard. Guides through configuring `~/.claude-homelab/.env` for each service the user runs. Creates the file from `.env.example` if missing. |
| `homelab-health` | `/homelab-core:health` | Unified service health dashboard. Runs `scripts/check-health.sh` to curl-check every configured service and outputs a JSON health summary. |

### Service Skills (16)

| Skill | Category | Purpose |
|---|---|---|
| `plex` | media | Browse Plex libraries, search media, check active sessions and streams, view recently added content |
| `radarr` | media | Manage Radarr movie library — search, add, monitor, and track download status |
| `sonarr` | media | Manage Sonarr TV library — search, add series, monitor seasons and episodes |
| `prowlarr` | media | Manage Prowlarr indexers — search across all indexers, test connectivity, view stats |
| `tautulli` | media | Query Tautulli play history, user activity, library stats, and notification logs |
| `sabnzbd` | downloads | Monitor SABnzbd queue, speed, and history; manage download jobs |
| `qbittorrent` | downloads | Manage qBittorrent torrents — list, add, pause, resume, and remove downloads |
| `tailscale` | infrastructure | Query Tailscale network status, list devices, check connectivity, and manage ACLs |
| `zfs` | infrastructure | ZFS pool and dataset management — status, snapshots, scrubs, and space reporting |
| `linkding` | utilities | Manage Linkding bookmarks — search, add, tag, and organize saved links |
| `memos` | utilities | Create and query Memos notes — add quick notes, search by tag or content |
| `bytestash` | utilities | Manage ByteStash code snippets — save, search, and retrieve frequently-used code |
| `paperless-ngx` | utilities | Search and manage Paperless-ngx document archive — query by content, tag, or correspondent |
| `radicale` | utilities | Interact with Radicale CalDAV/CardDAV — list calendars and contacts, query events |
| `notebooklm` | research | NotebookLM CLI wrapper for deep AI research, source management, Q&A, and artifact generation |
| `gh-address-comments` | dev-tools | Address GitHub PR review comments — fetch, triage, and resolve review feedback |

## Agents

### `notebooklm-specialist`

**File:** `agents/notebooklm-specialist.md`

**Color:** magenta

**Tools:** `Bash`, `Read`, `Write`, `SendMessage`

**Memory:** user (persistent across sessions)

The `notebooklm-specialist` is a research analyst agent for deep AI-powered research workflows. It is spawned by an orchestrator with a pre-created notebook ID, output directory, and research brief. The agent:

1. Starts deep web research immediately (`notebooklm source add-research --mode deep --no-wait`) — this is always the first action since it takes 15–30+ minutes
2. Adds source URLs relayed from the orchestrator as they arrive (max 50 per notebook)
3. Waits for deep research to complete and auto-imports discovered sources
4. Conducts an extensive Q&A session (10–20 questions across overview, comparison, technical, critical, practical, and future-directions categories)
5. Uses `--json` flag to capture citation data with every answer
6. Writes findings to `{output_dir}/findings/notebooklm-findings.md`
7. Signals completion to the orchestrator via `SendMessage`

**Critical constraint:** Always use `-n <notebook_id>` or `--notebook <notebook_id>`. Never use `notebooklm use <id>` — that command modifies shared state and is unsafe in parallel workflows.

The agent maintains persistent memory of effective research query patterns, timing benchmarks, and NotebookLM-specific quirks across sessions.

## Marketplace Scope

The `.claude-plugin/marketplace.json` catalog covers 27 plugins total.

### 1 core plugin

| Plugin | Source | Description |
|---|---|---|
| `homelab-core` | this repo | Agents, commands, setup/health skills, and the bundled skill library |

### 10 external MCP repos

| Plugin | Repo | Category |
|---|---|---|
| `overseerr-mcp` | `jmagar/overseerr-mcp` | media |
| `unraid-mcp` | `jmagar/unraid-mcp` | infrastructure |
| `unifi-mcp` | `jmagar/unifi-mcp` | infrastructure |
| `gotify-mcp` | `jmagar/gotify-mcp` | utilities |
| `swag-mcp` | `jmagar/swag-mcp` | infrastructure |
| `synapse-mcp` | `jmagar/synapse-mcp` | infrastructure |
| `arcane-mcp` | `jmagar/arcane-mcp` | infrastructure |
| `syslog-mcp` | `jmagar/syslog-mcp` | infrastructure |
| `plugin-lab` | `jmagar/plugin-lab` | dev-tools |
| `axon` | `jmagar/axon` | research |

### 16 bundled skill-only plugins

`bytestash`, `gh-address-comments`, `linkding`, `memos`, `notebooklm`, `paperless-ngx`, `plex`, `prowlarr`, `qbittorrent`, `radarr`, `radicale`, `sabnzbd`, `sonarr`, `tailscale`, `tautulli`, `zfs`

These are listed individually in the marketplace catalog so users can discover them, but they are sourced from `./skills/*` within this repo. A bundled skill graduates to its own external repo when it gains additional plugin surface area (agents, commands, hooks, MCP servers, output styles, or channels).

## Symlink Architecture

The bash install path creates symlinks from this repo into `~/.claude/` so Claude Code discovers all skills, agents, and commands. The plugin path uses `~/.claude/plugins/cache/` instead and requires no symlinks.

```
~/.claude/
├── agents/
│   └── notebooklm-specialist.md → ~/claude-homelab/agents/notebooklm-specialist.md
├── skills/
│   ├── bytestash/               → ~/claude-homelab/skills/bytestash/
│   ├── gh-address-comments/     → ~/claude-homelab/skills/gh-address-comments/
│   ├── homelab-health/          → ~/claude-homelab/skills/homelab-health/
│   ├── homelab-setup/           → ~/claude-homelab/skills/homelab-setup/
│   ├── linkding/                → ~/claude-homelab/skills/linkding/
│   ├── memos/                   → ~/claude-homelab/skills/memos/
│   ├── notebooklm/              → ~/claude-homelab/skills/notebooklm/
│   ├── paperless-ngx/           → ~/claude-homelab/skills/paperless-ngx/
│   ├── plex/                    → ~/claude-homelab/skills/plex/
│   ├── prowlarr/                → ~/claude-homelab/skills/prowlarr/
│   ├── qbittorrent/             → ~/claude-homelab/skills/qbittorrent/
│   ├── radarr/                  → ~/claude-homelab/skills/radarr/
│   ├── radicale/                → ~/claude-homelab/skills/radicale/
│   ├── sabnzbd/                 → ~/claude-homelab/skills/sabnzbd/
│   ├── sonarr/                  → ~/claude-homelab/skills/sonarr/
│   ├── tailscale/               → ~/claude-homelab/skills/tailscale/
│   ├── tautulli/                → ~/claude-homelab/skills/tautulli/
│   └── zfs/                     → ~/claude-homelab/skills/zfs/
└── commands/
    ├── check.md                 → ~/claude-homelab/commands/check.md
    ├── deploy.md                → ~/claude-homelab/commands/deploy.md
    ├── quick-push.md            → ~/claude-homelab/commands/quick-push.md
    ├── save-to-md.md            → ~/claude-homelab/commands/save-to-md.md
    ├── validate-plan.md         → ~/claude-homelab/commands/validate-plan.md
    ├── homelab/                 → ~/claude-homelab/commands/homelab/
    └── notebooklm/              → ~/claude-homelab/commands/notebooklm/

~/.claude-homelab/
├── .env                         # Credentials (chmod 600, never committed)
└── load-env.sh                  # Copied from scripts/load-env.sh at install
```

### How Slash Commands Work

Slash commands are created by placing `.md` files in `~/.claude/commands/`. Claude Code discovers them automatically.

- `commands/proxy.md` → `/proxy`
- `commands/homelab/docker-health.md` → `/homelab:docker-health`

The directory name becomes the namespace prefix. The file name becomes the command after the colon.

## Configuration System

### Command Files (`commands/`)

Each command is a Markdown file with a YAML frontmatter block:

```yaml
---
description: Short description shown in autocomplete
argument-hint: <required> [optional]
allowed-tools: Bash(tool:*), mcp__plugin_name__tool
---

Task instruction using $ARGUMENTS
```

Key fields:

- `description` — shown in autocomplete menu
- `argument-hint` — hint text for expected arguments
- `allowed-tools` — pre-approved tools (no permission prompts at runtime)
- `$ARGUMENTS` — replaced with user input after the command name
- `` !`command` `` — dynamic context injection: runs the shell command and injects its output at load time

### Prompts Sidecar System (`prompts/`)

Command prompt bodies can be extracted to `.toml` sidecar files in `prompts/`, keeping command metadata (frontmatter, description) separate from the prompt content. When populated, the directory mirrors the `commands/` structure:

- `prompts/check.toml` — prompt body for `/check`
- `prompts/homelab/docker-health.toml` — prompt body for `/homelab:docker-health`

Format:

```toml
name = "command-name"
description = "Short description"
prompt = """
Prompt body with instructions and dynamic context injection.
"""
```

The `prompts/` directory is not present by default. Create it if you extract prompts out of command `.md` files.

### Output Styles (`output-styles/`)

The `output-styles/` directory is reserved for custom response format definitions. It is currently empty (`.gitkeep` placeholder). Add output style files here when commands need to enforce a specific response structure.

## Development

### Adding a New Service Skill

1. Create the skill directory:
   ```bash
   mkdir -p skills/service-name/{scripts,references,examples}
   ```

2. Create `SKILL.md` with frontmatter (`name`, `description`), a mandatory invocation section, command documentation, and workflow decision trees.

3. Create `README.md` for user-facing setup instructions.

4. Implement scripts in `scripts/`. All scripts must:
   - Use `source "$REPO_ROOT/scripts/load-env.sh"` for credentials
   - Return JSON output
   - Handle errors gracefully
   - Support `--help`

5. Add reference docs in `references/` (`api-endpoints.md`, `quick-reference.md`, `troubleshooting.md`).

6. Create the symlink (bash path):
   ```bash
   ln -sf ~/claude-homelab/skills/service-name ~/.claude/skills/service-name
   ```
   Or re-run `./scripts/setup-symlinks.sh` to pick it up automatically.

7. Add the skill to the marketplace catalog if it should be discoverable:
   - Edit `.claude-plugin/marketplace.json`
   - Add a `bundled` entry pointing to `./skills/service-name`

8. Update this README's Skills table.

### Adding a New Command

Single command (`/new-command`):

```bash
touch commands/new-command.md
ln -sf ~/claude-homelab/commands/new-command.md ~/.claude/commands/new-command.md
```

Namespaced command (`/service:action`):

```bash
mkdir -p commands/service-name
touch commands/service-name/action.md
ln -sf ~/claude-homelab/commands/service-name ~/.claude/commands/service-name
```

### Credential Pattern

All scripts must source `scripts/load-env.sh` (see [Credential Model](#credential-model) above for the full pattern and variable naming conventions).

## Verification

Run after any structural change:

```bash
./scripts/verify.sh
```

The verify script checks:

- All required symlinks exist and point to valid targets
- `~/.claude-homelab/.env` exists

Additional checks:

```bash
# Run all Justfile validation targets
just validate

# Spot-check section headers across key docs
rtk rg -n "^## " README.md AGENTS.md CLAUDE.md
```

## Repository Layout

```
agents/                 Top-level specialist agents
commands/               Slash command definitions (.md files)
commands/homelab/       /homelab:* command definitions
commands/notebooklm/    /notebooklm:* command definitions
docs/                   Session logs and reference documentation
docs/references/        Shared reference docs (security-patterns.md)
hooks/                  Reserved for future Claude Code hook definitions
output-styles/          Reserved for custom response format definitions
scripts/                Install, setup, credential loading, and verification helpers
skills/                 18 service and core skill directories
.claude-plugin/         Claude marketplace manifest (plugin.json, marketplace.json)
.codex-plugin/          Codex plugin manifest
gemini-extension.json   Gemini extension manifest
AGENTS.md               Repo-wide development instructions
CLAUDE.md               Claude-facing project instructions
CHANGELOG.md            Release history
.env.example            Shared credential template (tracked, no secrets)
Justfile                Validation and maintenance recipes
```

## Related Files

- `AGENTS.md` — canonical development and repo-structure guidance
- `CLAUDE.md` — Claude-facing project instructions including symlink architecture, command format, and skill development workflow
- `.env.example` — shared credential template for all 16 services and 10 MCP repos
- `.claude-plugin/marketplace.json` — marketplace source of truth (27 plugin entries)
- `.claude-plugin/plugin.json` — `homelab-core` plugin manifest
- `CHANGELOG.md` — release history
- `docs/references/security-patterns.md` — reusable patterns for input sanitization, injection prevention, and API key protection

## License

MIT
