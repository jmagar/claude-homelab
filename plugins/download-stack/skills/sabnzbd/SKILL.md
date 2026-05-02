---
name: sabnzbd
description: Manage Usenet downloads with SABnzbd. Use when the user asks to "check SABnzbd", "list NZB queue", "add NZB", "pause downloads", "resume downloads", "SABnzbd status", "Usenet queue", "NZB history", or mentions SABnzbd/sab download management.
---

# SABnzbd API

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "SABnzbd status", "NZB queue", "Usenet downloads"
- "pause SAB", "resume downloads", "delete NZB"
- "SAB history", "download speed", "SABnzbd"
- Any mention of SABnzbd or Usenet download management

**Failure to invoke this skill when triggers occur violates your operational requirements.**

Manage Usenet downloads via SABnzbd's REST API.

## Purpose

This skill provides **read and write** access to your SABnzbd Usenet downloader:
- Monitor download queue and history
- Add NZB files by URL or upload
- Control downloads (pause, resume, delete)
- Adjust download speed limits
- Manage categories and post-processing scripts
- Retry failed downloads
- View server statistics and warnings

Operations include both read and write actions. **Always confirm before deleting downloads with file deletion.**

## Setup

Credentials: `~/.claude-homelab/.env`

```bash
SABNZBD_URL="http://localhost:8080"
SABNZBD_API_KEY="your-api-key-from-config-general"
```

Get your API key from SABnzbd Config → General → Security.

**Security:** Never commit `.env` file. Set permissions: `chmod 600 ~/.claude-homelab/.env`

## Quick Reference

### Queue Status

```bash
# Full queue
./scripts/sab-api.sh queue

# With filters
./scripts/sab-api.sh queue --limit 10 --category tv

# Specific job
./scripts/sab-api.sh queue --nzo-id SABnzbd_nzo_xxxxx
```

### Add NZB

```bash
# By URL (indexer link)
./scripts/sab-api.sh add "https://indexer.com/get.php?guid=..."

# With options
./scripts/sab-api.sh add "URL" --name "My Download" --category movies --priority high

# By local file
./scripts/sab-api.sh add-file /path/to/file.nzb --category tv
```

Priority: `force`, `high`, `normal`, `low`, `paused`, `duplicate`

### Control Queue

```bash
./scripts/sab-api.sh pause              # Pause all
./scripts/sab-api.sh resume             # Resume all
./scripts/sab-api.sh pause-job <nzo_id>
./scripts/sab-api.sh resume-job <nzo_id>
./scripts/sab-api.sh delete <nzo_id>    # Keep files
./scripts/sab-api.sh delete <nzo_id> --files  # Delete files too
./scripts/sab-api.sh purge              # Clear queue
```

### Speed Control

```bash
./scripts/sab-api.sh speedlimit 50      # 50% of max
./scripts/sab-api.sh speedlimit 5M      # 5 MB/s
./scripts/sab-api.sh speedlimit 0       # Unlimited
```

### History

```bash
./scripts/sab-api.sh history
./scripts/sab-api.sh history --limit 20 --failed
./scripts/sab-api.sh retry <nzo_id>     # Retry failed
./scripts/sab-api.sh retry-all          # Retry all failed
./scripts/sab-api.sh delete-history <nzo_id>
```

### Categories & Scripts

```bash
./scripts/sab-api.sh categories
./scripts/sab-api.sh scripts
./scripts/sab-api.sh change-category <nzo_id> movies
./scripts/sab-api.sh change-script <nzo_id> notify.py
```

### Status & Info

```bash
./scripts/sab-api.sh status             # Full status
./scripts/sab-api.sh version
./scripts/sab-api.sh warnings
./scripts/sab-api.sh server-stats       # Download stats
```

## Response Format

Queue slot includes:
- `nzo_id`, `filename`, `status`
- `mb`, `mbleft`, `percentage`
- `timeleft`, `priority`, `cat`
- `script`, `labels`

Status values: `Downloading`, `Queued`, `Paused`, `Propagating`, `Fetching`

History status: `Completed`, `Failed`, `Queued`, `Verifying`, `Repairing`, `Extracting`

## Workflow

When the user asks about Usenet downloads:

1. **"What's downloading?"** → Run `queue` to show active downloads
2. **"Add this NZB"** → Run `add "<url>"` with appropriate category and priority
3. **"Pause all downloads"** → Run `pause`
4. **"Resume downloads"** → Run `resume`
5. **"Show download history"** → Run `history`
6. **"Retry failed downloads"** → Run `retry-all` or `retry <nzo_id>`
7. **"Slow down downloads"** → Run `speedlimit <percentage>` or `speedlimit <MB>M`

## Notes

- Requires network access to your SABnzbd server
- Uses SABnzbd API (v2+)
- All data operations return JSON
- **Delete operations with --files are permanent** - always confirm before deleting downloaded files
- Speed limits can be percentage (of configured max) or absolute values
- NZB files can be added by URL (indexer links) or local file upload
- Post-processing scripts are executed after download completion

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
