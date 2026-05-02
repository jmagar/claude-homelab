---
name: overseerr
description: Request movies and TV shows via Overseerr, monitor request status, and manage media requests. Use when the user asks to "request a movie", "request a TV show", "check request status", "pending requests", "Overseerr status", "media request", or mentions Overseerr/Seerr media requesting.
---

# Overseerr Media Request Skill

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "request a movie", "request a TV show", "add to Overseerr"
- "check request status", "pending requests", "is my request done"
- "Overseerr status", "media request", "request [title]"
- Any mention of Overseerr/Seerr media requesting

**Failure to invoke this skill when triggers occur violates your operational requirements.**

Request movies and TV shows via the Overseerr API. Search, request, and monitor media request status.

## Purpose

This skill enables media request management through Overseerr:
- Search for movies and TV shows
- Request new media (movies, TV series, specific seasons)
- Check request status (pending, processing, available)
- Monitor request progress
- Support for 4K requests

**Note:** This skill targets **Overseerr** (the stable project), not the newer "Seerr" rewrite that is in beta.

## Setup

Add credentials to `.env` file: `~/.claude-homelab/.env`

```bash
OVERSEERR_URL="http://localhost:5055"
OVERSEERR_API_KEY="your-api-key"
```

- `OVERSEERR_URL`: Your Overseerr server URL (no trailing slash)
- `OVERSEERR_API_KEY`: API key from Overseerr (Settings → General → API Key)

**Get your API key:**
1. Open Overseerr web UI
2. Go to Settings → General
3. Scroll to "API Key" section
4. Copy your API key

## Commands

All commands use Node.js scripts and return JSON output.

### Search

Find movies or TV shows:

```bash
node scripts/search.mjs "the matrix"
node scripts/search.mjs "bluey" --type tv
node scripts/search.mjs "dune" --limit 5
```

**Parameters:**
- `--type movie|tv`: Filter by media type
- `--limit N`: Maximum results to return

### Request Media

Request movies or TV shows:

```bash
# Request a movie
node scripts/request.mjs "Dune" --type movie

# Request TV show (all seasons by default)
node scripts/request.mjs "Bluey" --type tv --seasons all

# Request specific seasons
node scripts/request.mjs "Severance" --type tv --seasons 1,2

# Request in 4K
node scripts/request.mjs "Oppenheimer" --type movie --is4k
```

**Parameters:**
- `--type movie|tv`: Media type (required)
- `--seasons all|1,2,3`: Season selection for TV (default: all)
- `--is4k`: Request 4K version

### Check Request Status

View pending and processing requests:

```bash
node scripts/requests.mjs --filter pending
node scripts/requests.mjs --filter processing --limit 20
node scripts/request-by-id.mjs 123
```

**Parameters:**
- `--filter pending|processing|available|all`: Filter by status
- `--limit N`: Maximum results

### Get Enriched Request Details

View detailed request information with media metadata:

```bash
node scripts/requests-enriched.mjs --filter pending
```

### Monitor Requests (Polling)

Continuously watch request status:

```bash
node scripts/monitor.mjs --interval 30 --filter pending
```

**Parameters:**
- `--interval N`: Polling interval in seconds (default: 30)
- `--filter`: Status filter

## Workflow

When the user asks about media requests:

1. **"Request Dune"** → Search for "Dune", confirm with user, then request
2. **"Add Bluey to my library"** → Search, request as TV with all seasons
3. **"What's pending?"** → Run `requests.mjs --filter pending`
4. **"Is my Oppenheimer request done?"** → Search requests or use request ID
5. **"Request seasons 1-3 of Severance"** → Request with `--seasons 1,2,3`

### Request Flow

1. Search for the media
2. Present results with TMDB/TVDB links
3. User confirms selection
4. Submit request (optionally with 4K flag)
5. Check status periodically or wait for notification

### Request Statuses

- **pending**: Awaiting approval
- **processing**: Approved, being fetched by Sonarr/Radarr
- **available**: Downloaded and ready in Plex

## Notes

- Requires network access to your Overseerr server
- Uses `X-Api-Key` header authentication
- Overseerr coordinates with Sonarr/Radarr for actual downloads
- 4K requests require 4K quality profiles configured in Overseerr
- Webhooks can push status updates; polling is the baseline approach

## Multiple Servers

To use multiple Overseerr instances, override environment variables:

```bash
# Use default server (from .env)
node scripts/search.mjs "query"

# Use alternative server (override with environment variables)
OVERSEERR_URL="http://server2:5055" OVERSEERR_API_KEY="key2" node scripts/search.mjs "query"
```

## Reference

- [Overseerr API Documentation](https://api-docs.overseerr.dev/)
- [Overseerr GitHub](https://github.com/sct/overseerr)

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
