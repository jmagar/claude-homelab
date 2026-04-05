# Skill Definitions -- homelab-core

All 18 skills bundled with homelab-core. Each skill lives in `skills/<name>/` and contains a `SKILL.md`, optional `scripts/`, and optional `references/`.

## Skill directory structure

```
skills/
  <service>/
    SKILL.md                  # Skill definition (required)
    scripts/                  # Executable scripts (optional)
    references/               # Detailed documentation (optional)
      api-endpoints.md
      quick-reference.md
      troubleshooting.md
```

## SKILL.md frontmatter

```yaml
---
name: <service>
description: |
  Manages <service>. Activate when the user mentions <service>
  or asks about <domain>.
homepage: https://<service>.example.com
---
```

| Field | Required | Description |
| --- | --- | --- |
| `name` | yes | Skill identifier (matches directory name) |
| `description` | yes | Trigger phrases for auto-invocation |
| `homepage` | no | Upstream project URL |

Do not add fields the schema does not support (e.g., `version`).

## Progressive disclosure

| Level | Content | Size | When loaded |
| --- | --- | --- | --- |
| 1 -- Metadata | Frontmatter | ~100 words | Always (skill discovery) |
| 2 -- Body | SKILL.md body | ~2,000 words | On skill activation |
| 3 -- References | `references/*.md` | Unlimited | On explicit request |

## All skills

### Core (2)

#### homelab-setup

**Directory:** `skills/homelab-setup/`
**Purpose:** Interactive credential setup wizard for all homelab services.

Guides users through configuring `~/.claude-homelab/.env` with URLs and API keys for each service. Validates connectivity after configuration.

#### homelab-health

**Directory:** `skills/homelab-health/`
**Purpose:** Unified service health dashboard.

Runs curl checks against all configured services and reports status as JSON. Includes `scripts/check-health.sh`.

### Media (5)

#### plex

**Directory:** `skills/plex/`
**Purpose:** Plex Media Server management -- browse libraries, search media, manage playlists, monitor activity.
**Env vars:** `PLEX_URL`, `PLEX_TOKEN`

#### radarr

**Directory:** `skills/radarr/`
**Purpose:** Radarr movie collection management -- search, add, monitor, and manage movies.
**Env vars:** `RADARR_URL`, `RADARR_API_KEY`, `RADARR_DEFAULT_QUALITY_PROFILE`

#### sonarr

**Directory:** `skills/sonarr/`
**Purpose:** Sonarr TV series management -- search, add, monitor, and manage TV shows.
**Env vars:** `SONARR_URL`, `SONARR_API_KEY`, `SONARR_DEFAULT_QUALITY_PROFILE`

#### prowlarr

**Directory:** `skills/prowlarr/`
**Purpose:** Prowlarr indexer management -- add, configure, test, and search indexers.
**Env vars:** `PROWLARR_URL`, `PROWLARR_API_KEY`

#### tautulli

**Directory:** `skills/tautulli/`
**Purpose:** Tautulli Plex monitoring -- view activity, history, statistics, and user analytics.
**Env vars:** `TAUTULLI_URL`, `TAUTULLI_API_KEY`

### Downloads (2)

#### sabnzbd

**Directory:** `skills/sabnzbd/`
**Purpose:** SABnzbd Usenet download management -- add, monitor, and manage NZB downloads.
**Env vars:** `SABNZBD_URL`, `SABNZBD_API_KEY`

#### qbittorrent

**Directory:** `skills/qbittorrent/`
**Purpose:** qBittorrent torrent management -- add, monitor, pause, and manage torrents.
**Env vars:** `QBITTORRENT_URL`, `QBITTORRENT_USERNAME`, `QBITTORRENT_PASSWORD`

### Infrastructure (2)

#### tailscale

**Directory:** `skills/tailscale/`
**Purpose:** Tailscale VPN mesh network management -- monitor devices, manage routes, check status.
**Env vars:** `TAILSCALE_API_KEY`, `TAILSCALE_TAILNET`

#### zfs

**Directory:** `skills/zfs/`
**Purpose:** ZFS storage management -- monitor pools, datasets, snapshots, scrubs, and replication.
**Env vars:** `ZFS_HOST`

### Utilities (5)

#### linkding

**Directory:** `skills/linkding/`
**Purpose:** Linkding bookmark management -- save, search, tag, and organize bookmarks.
**Env vars:** `LINKDING_URL`, `LINKDING_API_KEY`

#### memos

**Directory:** `skills/memos/`
**Purpose:** Memos note-taking service -- create, search, tag, and manage quick notes.
**Env vars:** `MEMOS_URL`, `MEMOS_API_TOKEN`

#### bytestash

**Directory:** `skills/bytestash/`
**Purpose:** ByteStash code snippet management -- store, search, and organize code snippets.
**Env vars:** `BYTESTASH_URL`, `BYTESTASH_API_KEY`

#### paperless-ngx

**Directory:** `skills/paperless-ngx/`
**Purpose:** Paperless-ngx document management -- upload, search, tag, and organize documents.
**Env vars:** `PAPERLESS_URL`, `PAPERLESS_API_TOKEN`

#### radicale

**Directory:** `skills/radicale/`
**Purpose:** Radicale CalDAV/CardDAV server management -- manage calendars, contacts, address books.
**Env vars:** `RADICALE_URL`, `RADICALE_USERNAME`, `RADICALE_PASSWORD`

### Research (1)

#### notebooklm

**Directory:** `skills/notebooklm/`
**Purpose:** Google NotebookLM integration -- create notebooks, add sources, generate podcasts and research artifacts.
**Env vars:** `NOTEBOOKLM_COOKIE`, `NOTEBOOKLM_AUTH_JSON`, `NOTEBOOKLM_LOG_LEVEL`

### Developer tools (1)

#### gh-address-comments

**Directory:** `skills/gh-address-comments/`
**Purpose:** Address GitHub PR review comments -- fetch, implement, and verify resolution of PR feedback.
**Env vars:** `GITHUB_TOKEN`

## Credential loading pattern

All skill scripts use the shared library:

```bash
source "$HOME/.claude-homelab/load-env.sh"
load_env_file || exit 1
validate_env_vars "SERVICE_URL" "SERVICE_API_KEY"
```

## Validation

```bash
just validate-skills          # Validate all 18 skills
just validate-skill plex      # Validate a single skill
just validate-skill sonarr    # Validate another skill
```

## Adding a new skill

1. Create directory: `mkdir -p skills/<name>/{scripts,references}`
2. Create `SKILL.md` with frontmatter and body sections
3. Implement scripts using `load-env.sh`
4. Add reference docs
5. Add env vars to `.env.example`
6. Run: `just symlinks` (bash path) or reinstall plugin (marketplace path)
7. Validate: `just validate-skill <name>`

## Graduation criteria

A bundled skill graduates to its own external repo when it gains additional plugin surface area:

| Surface | Requires own repo? |
| --- | --- |
| SKILL.md + references only | No -- stays bundled |
| + MCP server | Yes |
| + Agents | Yes |
| + Commands | Yes |
| + Hooks | Yes |

## Cross-references

- [AGENTS.md](AGENTS.md) -- Agents that delegate to skills
- [COMMANDS.md](COMMANDS.md) -- Commands that reference skills
- [INVENTORY.md](../INVENTORY.md) -- Complete component list
