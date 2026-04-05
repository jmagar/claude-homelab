# Marketplace Publishing -- homelab-core

The claude-homelab marketplace catalog at `.claude-plugin/marketplace.json` contains 27 plugins.

## Marketplace location

| Marketplace | Manifest |
| --- | --- |
| Claude Code | `.claude-plugin/marketplace.json` |
| Codex | Same manifest (shared) |

## Plugin catalog (27 entries)

### Core (1)

| Plugin | Source | Version | Description |
| --- | --- | --- | --- |
| homelab-core | `./` (this repo) | 1.1.2 | Core agents, commands, skills, and setup/health workflows |

### External MCP plugins (10)

| Plugin | Repo | Version | Category | Description |
| --- | --- | --- | --- | --- |
| overseerr-mcp | jmagar/overseerr-mcp | 1.0.0 | media | Overseerr media requests and discovery |
| unraid-mcp | jmagar/unraid-mcp | 1.2.0 | infrastructure | Unraid server management via GraphQL |
| unifi-mcp | jmagar/unifi-mcp | 1.0.0 | infrastructure | UniFi network management |
| gotify-mcp | jmagar/gotify-mcp | 1.0.0 | utilities | Gotify push notifications |
| swag-mcp | jmagar/swag-mcp | 1.0.0 | infrastructure | SWAG nginx reverse proxy management |
| synapse-mcp | jmagar/synapse-mcp | 2.2.1 | infrastructure | Docker management and SSH operations |
| arcane-mcp | jmagar/arcane-mcp | 1.1.3 | infrastructure | Docker environments via Arcane API |
| syslog-mcp | jmagar/syslog-mcp | 1.0.0 | infrastructure | Syslog receiver and search |
| plugin-lab | jmagar/plugin-lab | 1.0.0 | dev-tools | Plugin scaffolding and development |
| axon | jmagar/axon | 0.34.1 | research | Web crawl, ingest, embed, RAG pipeline |

### Bundled skill plugins (16)

| Plugin | Source | Category | Description |
| --- | --- | --- | --- |
| plex | `./skills/plex` | media | Plex Media Server management |
| radarr | `./skills/radarr` | media | Radarr movie management |
| sonarr | `./skills/sonarr` | media | Sonarr TV series management |
| prowlarr | `./skills/prowlarr` | media | Prowlarr indexer management |
| tautulli | `./skills/tautulli` | media | Tautulli Plex monitoring |
| sabnzbd | `./skills/sabnzbd` | downloads | SABnzbd Usenet downloads |
| qbittorrent | `./skills/qbittorrent` | downloads | qBittorrent torrent downloads |
| tailscale | `./skills/tailscale` | infrastructure | Tailscale VPN management |
| zfs | `./skills/zfs` | infrastructure | ZFS storage management |
| linkding | `./skills/linkding` | utilities | Linkding bookmark management |
| memos | `./skills/memos` | utilities | Memos note-taking |
| bytestash | `./skills/bytestash` | utilities | ByteStash code snippets |
| paperless-ngx | `./skills/paperless-ngx` | utilities | Paperless-ngx documents |
| radicale | `./skills/radicale` | utilities | Radicale CalDAV/CardDAV |
| notebooklm | `./skills/notebooklm` | research | Google NotebookLM |
| gh-address-comments | `./skills/gh-address-comments` | dev-tools | GitHub PR comment resolution |

## Entry format

### External plugin (own repo)

```json
{
  "name": "overseerr-mcp",
  "source": {
    "source": "github",
    "repo": "jmagar/overseerr-mcp"
  },
  "description": "Overseerr media requests via MCP tools...",
  "version": "1.0.0",
  "category": "media",
  "tags": ["overseerr", "media", "mcp"]
}
```

### Bundled plugin (skill in this repo)

```json
{
  "name": "plex",
  "source": "./skills/plex",
  "description": "Plex Media Server management...",
  "version": "1.0.0",
  "category": "media",
  "tags": ["plex", "media", "streaming", "homelab"]
}
```

## Categories

| Category | Description | Count |
| --- | --- | --- |
| core | Setup, health, orchestration | 1 |
| media | Media management and requests | 6 |
| infrastructure | Server, network, storage, proxy | 7 |
| utilities | Notifications, bookmarks, notes, docs, snippets | 6 |
| downloads | Usenet and torrent management | 2 |
| dev-tools | Development and scaffolding | 2 |
| research | AI research and RAG pipelines | 3 |

## Graduation criteria

A bundled skill graduates to its own external repo when it gains plugin surfaces beyond SKILL.md:

| Surface | Stays bundled? |
| --- | --- |
| SKILL.md + references only | Yes |
| + MCP server | No -- own repo |
| + Agents | No -- own repo |
| + Commands | No -- own repo |
| + Hooks | No -- own repo |

## Installation

```bash
# Add the marketplace
/plugin marketplace add jmagar/claude-homelab

# Install the core plugin
/plugin install homelab-core @jmagar-claude-homelab

# Install an external MCP plugin
/plugin install overseerr-mcp @jmagar-claude-homelab
```

## Cross-references

- [PLUGINS.md](PLUGINS.md) -- Plugin manifest structure
- [CONFIG.md](CONFIG.md) -- Configuration prompted at install
- [CHECKLIST.md](../CHECKLIST.md) -- Pre-release quality checks
