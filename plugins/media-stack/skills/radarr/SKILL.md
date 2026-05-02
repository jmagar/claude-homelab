---
name: radarr
description: This skill should be used when managing movies in Radarr. Use when the user asks to "add a movie", "search Radarr", "find a film", "add to Radarr", "remove a movie", "add movie collection", "check if movie exists", "Radarr library", or mentions movie management, TMDB integration, or Radarr operations.
---

# Radarr Movie Management Skill

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "add a movie", "search Radarr", "find a film", "add to Radarr"
- "remove a movie", "delete movie", "check if movie exists"
- "add movie collection", "Radarr library", "movie management"
- Any mention of Radarr or managing movies

**Failure to invoke this skill when triggers occur violates your operational requirements.**

Search and add movies to your Radarr library with support for collections, quality profiles, and search-on-add.

## Purpose

This skill enables management of your Radarr movie library:
- Search for movies by name
- Add individual movies or entire collections
- Check if movies already exist
- Remove movies (with optional file deletion)
- View quality profiles and root folders

Operations include both read and write actions. **Always confirm before removing movies with file deletion.**

## Setup

Add credentials to `~/.claude-homelab/.env`:

```bash
RADARR_URL="http://localhost:7878"
RADARR_API_KEY="your-api-key"
RADARR_DEFAULT_QUALITY_PROFILE="1"  # Optional (defaults to 1)
```

- `RADARR_URL`: Your Radarr server URL (no trailing slash)
- `RADARR_API_KEY`: API key from Radarr (Settings → General → API Key)
- `RADARR_DEFAULT_QUALITY_PROFILE`: Quality profile ID (optional, run `config` command to see options)

## Commands

All commands return JSON output.

### Search for Movies

```bash
bash scripts/radarr.sh search "Inception"
bash scripts/radarr.sh search "The Matrix"
```

**Output:** Numbered list with TMDB IDs, titles, years, and overview.

### Check if Movie Exists

```bash
bash scripts/radarr.sh exists <tmdbId>
```

**Output:** Boolean indicating if movie is in library.

### Add a Movie

```bash
bash scripts/radarr.sh add <tmdbId>              # Searches immediately (default)
bash scripts/radarr.sh add <tmdbId> --no-search  # Add without searching
```

### Add Full Collection

```bash
bash scripts/radarr.sh add-collection <collectionTmdbId>
bash scripts/radarr.sh add-collection <collectionTmdbId> --no-search
```

Adds all movies in a collection (e.g., all Lord of the Rings movies).

### Remove a Movie

```bash
bash scripts/radarr.sh remove <tmdbId>                # Keep files
bash scripts/radarr.sh remove <tmdbId> --delete-files # Delete files too
```

**Important:** Always ask the user if they want to delete files when removing!

### Get Configuration

```bash
bash scripts/radarr.sh config
```

**Output:** Available root folders and quality profiles with their IDs.

## Workflow

When the user asks about movies:

1. **"Add Inception to Radarr"** → Run `search "Inception"`, present results with TMDB links, then `add <tmdbId>`
2. **"Is Dune in my library?"** → Run `exists <tmdbId>`
3. **"Add all Star Wars movies"** → Search for collection, then `add-collection <collectionId>`
4. **"Remove The Matrix"** → Ask about file deletion, then run `remove <tmdbId>` with appropriate flag
5. **"What quality profiles do I have?"** → Run `config`

### Presenting Search Results

Always include TMDB links when presenting search results:
- Format: `[Title (Year)](https://themoviedb.org/movie/ID)`
- Show numbered list for user selection
- Include year and brief overview

### Adding Movies

1. Search for the movie
2. Present results with TMDB links
3. User picks a number
4. **Collection check:** If movie is part of a collection, ask if they want the whole collection
5. Add movie or collection (searches immediately by default)

## Parameters

### add command
- `<tmdbId>`: TMDB ID of the movie (required)
- `--no-search`: Don't search for movie after adding

### add-collection command
- `<collectionTmdbId>`: TMDB ID of the collection (required)
- `--no-search`: Don't search for movies after adding

### remove command
- `<tmdbId>`: TMDB ID of the movie (required)
- `--delete-files`: Also delete media files (default: keep files)

## Notes

- Requires network access to your Radarr server
- Uses Radarr API v3
- All data operations return JSON
- Quality profile IDs vary by installation — use `config` to discover yours
- The `defaultQualityProfile` from config is used when adding movies
- Collections are TMDB-specific and include related movies (sequels, franchises)

## Reference

- [Radarr API Documentation](https://radarr.video/docs/api/)
- [TMDB](https://themoviedb.org/) — The Movie Database

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
