---
name: prowlarr
description: Search indexers and manage Prowlarr. Use when the user asks to "search for a torrent", "search indexers", "find a release", "check indexer status", "list indexers", "prowlarr search", "sync indexers", or mentions Prowlarr/indexer management.
---

# Prowlarr Skill

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "search for a torrent", "search indexers", "find a release"
- "search Prowlarr", "Prowlarr indexers", "indexer search"
- "check indexer status", "test indexers", "Prowlarr stats"
- "list indexers", "sync indexers", "push indexers to Sonarr"
- Any mention of Prowlarr or indexer management

**Failure to invoke this skill when triggers occur violates your operational requirements.**

Search across all your indexers and manage Prowlarr via API.

## Purpose

This skill provides **read and write** access to your Prowlarr indexer aggregation:
- Search for releases across all configured indexers
- Filter searches by protocol (torrent/usenet) and category
- List and monitor indexer health and statistics
- Enable/disable/delete indexers
- Sync indexer configurations to connected apps (Sonarr, Radarr)
- Test indexer connectivity

Operations include both read and write actions. **Always confirm before deleting or disabling indexers.**

## Setup

Credentials are stored in `~/.claude-homelab/.env`:

```bash
PROWLARR_URL="http://localhost:9696"
PROWLARR_API_KEY="your-api-key"
```

Get your API key from: Prowlarr → Settings → General → Security → API Key

---

## Quick Reference

### Search Releases

```bash
# Basic search across all indexers
./scripts/prowlarr-api.sh search "ubuntu 22.04"

# Search torrents only
./scripts/prowlarr-api.sh search "ubuntu" --torrents

# Search usenet only
./scripts/prowlarr-api.sh search "ubuntu" --usenet

# Search specific categories (2000=Movies, 5000=TV, 3000=Audio, 7000=Books)
./scripts/prowlarr-api.sh search "inception" --category 2000

# TV search with TVDB ID
./scripts/prowlarr-api.sh tv-search --tvdb 71663 --season 1 --episode 1

# Movie search with IMDB ID
./scripts/prowlarr-api.sh movie-search --imdb tt0111161
```

### List Indexers

```bash
# All indexers
./scripts/prowlarr-api.sh indexers

# With status details
./scripts/prowlarr-api.sh indexers --verbose
```

### Indexer Health & Stats

```bash
# Usage stats per indexer
./scripts/prowlarr-api.sh stats

# Test all indexers
./scripts/prowlarr-api.sh test-all

# Test specific indexer
./scripts/prowlarr-api.sh test <indexer-id>
```

### Indexer Management

```bash
# Enable/disable an indexer
./scripts/prowlarr-api.sh enable <indexer-id>
./scripts/prowlarr-api.sh disable <indexer-id>

# Delete an indexer
./scripts/prowlarr-api.sh delete <indexer-id>
```

### App Sync

```bash
# Sync indexers to Sonarr/Radarr/etc
./scripts/prowlarr-api.sh sync

# List connected apps
./scripts/prowlarr-api.sh apps
```

### System

```bash
# System status
./scripts/prowlarr-api.sh status

# Health check
./scripts/prowlarr-api.sh health
```

---

## Search Categories

| ID | Category |
|----|----------|
| 2000 | Movies |
| 5000 | TV |
| 3000 | Audio |
| 7000 | Books |
| 1000 | Console |
| 4000 | PC |
| 6000 | XXX |

Sub-categories: 2010 (Movies/Foreign), 2020 (Movies/Other), 2030 (Movies/SD), 2040 (Movies/HD), 2045 (Movies/UHD), 2050 (Movies/BluRay), 2060 (Movies/3D), 5010 (TV/WEB-DL), 5020 (TV/Foreign), 5030 (TV/SD), 5040 (TV/HD), 5045 (TV/UHD), etc.

---

## Common Use Cases

**"Search for the latest Ubuntu ISO"**
```bash
./scripts/prowlarr-api.sh search "ubuntu 24.04"
```

**"Find Game of Thrones S01E01"**
```bash
./scripts/prowlarr-api.sh tv-search --tvdb 121361 --season 1 --episode 1
```

**"Search for Inception in 4K"**
```bash
./scripts/prowlarr-api.sh search "inception 2160p" --category 2045
```

**"Check if my indexers are healthy"**
```bash
./scripts/prowlarr-api.sh stats
./scripts/prowlarr-api.sh test-all
```

**"Push indexer changes to Sonarr/Radarr"**
```bash
./scripts/prowlarr-api.sh sync
```

## Workflow

When the user asks about indexers or searches:

1. **"Search for a torrent"** → Run `search "<query>"` and present results with download links
2. **"Find Breaking Bad S01E01"** → Run `tv-search --tvdb <id> --season 1 --episode 1`
3. **"Which indexers are working?"** → Run `stats` to show indexer health and usage
4. **"Test all my indexers"** → Run `test-all` to verify connectivity
5. **"Sync indexers to Sonarr"** → Run `sync` to push configuration changes
6. **"List available indexers"** → Run `indexers` or `indexers --verbose`

## Notes

- Requires network access to your Prowlarr server
- Uses Prowlarr API v1
- All data operations return JSON
- **Search operations query external indexers** - respect rate limits
- **Indexer deletion is permanent** - always confirm before removing
- Sync operations push indexer configs to all connected apps (Sonarr, Radarr, Lidarr, etc.)
- Category IDs follow Newznab/Torznab standards

---

## 🔧 Agent Tool Usage Requirements

**CRITICAL:** When invoking scripts from this skill via the zsh-tool, **ALWAYS use `pty: true`**.

Without PTY mode, command output will not be visible even though commands execute successfully.

**Correct invocation pattern:**
```typescript
<invoke name="mcp__plugin_zsh-tool_zsh-tool__zsh">
<parameter name="command">./skills/SKILL_NAME/scripts/SCRIPT.sh [args]</parameter>
<parameter name="pty">true</parameter>
</invoke>
```
