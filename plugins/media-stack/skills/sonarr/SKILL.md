---
name: sonarr
description: This skill should be used when managing TV shows in Sonarr. Use when the user asks to "add a TV show", "search Sonarr", "find a series", "add to Sonarr", "remove a show", "check if show exists", "Sonarr library", "TVDB lookup", or mentions TV show management or Sonarr operations.
---

# Sonarr TV Show Management Skill

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "add a TV show", "search Sonarr", "find a series", "add to Sonarr"
- "remove a show", "delete show", "check if show exists"
- "Sonarr library", "TV show management", "add show"
- Any mention of Sonarr or managing TV shows

**Failure to invoke this skill when triggers occur violates your operational requirements.**

Search and add TV shows to your Sonarr library with support for monitor options, quality profiles, and search-on-add.

## Purpose

This skill enables management of your Sonarr TV show library:
- Search for TV shows by name
- Add shows to your library with configurable options
- Check if shows already exist
- Remove shows (with optional file deletion)
- View quality profiles and root folders

Operations include both read and write actions. **Always confirm before removing shows with file deletion.**

## Setup

Add credentials to `.env` file: `~/.claude-homelab/.env`

```bash
SONARR_URL="http://localhost:8989"
SONARR_API_KEY="<your_api_key>"
SONARR_DEFAULT_QUALITY_PROFILE="1"  # Optional: defaults to 1 if not set
```

**Configuration variables:**
- `SONARR_URL`: Your Sonarr server URL (no trailing slash)
- `SONARR_API_KEY`: API key from Sonarr (Settings → General → API Key)
- `SONARR_DEFAULT_QUALITY_PROFILE`: Quality profile ID (optional, defaults to 1)

## Commands

All commands return JSON output.

### Search for Shows

```bash
bash scripts/sonarr.sh search "Breaking Bad"
bash scripts/sonarr.sh search "The Office"
```

**Output:** Numbered list with TVDB IDs, titles, years, and overview.

### Check if Show Exists

```bash
bash scripts/sonarr.sh exists <tvdbId>
```

**Output:** Boolean indicating if show is in library.

### Add a Show

```bash
bash scripts/sonarr.sh add <tvdbId>              # Searches immediately (default)
bash scripts/sonarr.sh add <tvdbId> --no-search  # Add without searching
```

### Remove a Show

```bash
bash scripts/sonarr.sh remove <tvdbId>                # Keep files
bash scripts/sonarr.sh remove <tvdbId> --delete-files # Delete files too
```

**Important:** Always ask the user if they want to delete files when removing!

### Get Configuration

```bash
bash scripts/sonarr.sh config
```

**Output:** Available root folders and quality profiles with their IDs.

## Workflow

When the user asks about TV shows:

1. **"Add Breaking Bad to Sonarr"** → Run `search "Breaking Bad"`, present results with TVDB links, then `add <tvdbId>`
2. **"Is The Office in my library?"** → Run `exists <tvdbId>`
3. **"Remove Game of Thrones"** → Ask about file deletion, then run `remove <tvdbId>` with appropriate flag
4. **"What quality profiles do I have?"** → Run `config`

### Presenting Search Results

Always include TVDB links when presenting search results:
- Format: `[Title (Year)](https://thetvdb.com/series/SLUG)`
- Show numbered list for user selection
- Include year and brief overview

### Adding Shows

1. Search for the show
2. Present results with TVDB links
3. User picks a number
4. Add show (searches for episodes by default)

## Parameters

### add command
- `<tvdbId>`: TVDB ID of the show (required)
- `--no-search`: Don't search for episodes after adding

### remove command
- `<tvdbId>`: TVDB ID of the show (required)
- `--delete-files`: Also delete media files (default: keep files)

## Notes

- Requires network access to your Sonarr server
- Uses Sonarr API v3
- All data operations return JSON
- Quality profile IDs vary by installation — use `config` to discover yours
- The `SONARR_DEFAULT_QUALITY_PROFILE` from `.env` is used when adding shows (defaults to 1)

## Reference

- [Sonarr API Documentation](https://sonarr.tv/docs/api/)
- [TVDB](https://thetvdb.com/) — TV show database

For detailed local reference, see:
- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference with parameters
- **[Quick Reference](./references/quick-reference.md)** - Common operations with copy-paste examples
- **[Troubleshooting](./references/troubleshooting.md)** - Authentication, connection, and error solutions

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
