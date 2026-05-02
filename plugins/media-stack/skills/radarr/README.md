# Radarr Skill

Search and add movies to your Radarr library.

## What It Does

- **Search** — Find movies by name via TMDB
- **Add** — Add movies to your Radarr library with automatic searching
- **Collections** — Add entire movie collections at once
- **Check** — Verify if a movie already exists in your library
- **Remove** — Remove movies from your library (with optional file deletion)
- **Configure** — View root folders and quality profiles

All operations use the Radarr API v3 and support collection detection and search-on-add.

## Setup

### 1. Get Your Radarr API Key

1. Open your Radarr web UI
2. Go to **Settings → General**
3. Scroll to **Security** section
4. Copy your **API Key**

### 2. Configure Environment Variables

Add credentials to `~/.claude-homelab/.env`:

```bash
RADARR_URL="http://localhost:7878"
RADARR_API_KEY="<your_api_key>"
RADARR_DEFAULT_QUALITY_PROFILE="1"  # Optional (defaults to 1)
```

**Configuration options:**
- `RADARR_URL`: Radarr server URL (default: http://localhost:7878)
- `RADARR_API_KEY`: Your Radarr API key
- `RADARR_DEFAULT_QUALITY_PROFILE`: Quality profile ID to use for new movies (optional, run `config` command to see available profiles)

### 3. Test It

```bash
bash scripts/radarr.sh search "Inception"
```

## Usage Examples

### Search for movies

```bash
bash scripts/radarr.sh search "Inception"
bash scripts/radarr.sh search "The Matrix"
```

Returns a numbered list with TMDB IDs, collection info, and links.

### Check if movie exists

Before adding, check if a movie is already in your library:

```bash
bash scripts/radarr.sh exists 27205  # Inception TMDB ID
```

### Add a movie

Add a movie with automatic searching (default):

```bash
bash scripts/radarr.sh add 27205  # Searches immediately
```

Add without searching (manual search later):

```bash
bash scripts/radarr.sh add 27205 --no-search
```

### Add full collection

If a movie is part of a collection (e.g., Marvel Cinematic Universe, Star Wars), you can add the entire collection:

```bash
bash scripts/radarr.sh add-collection 86311  # Marvel Cinematic Universe
```

Without searching:

```bash
bash scripts/radarr.sh add-collection 86311 --no-search
```

### Remove a movie

Remove but keep downloaded files:

```bash
bash scripts/radarr.sh remove 27205
```

Remove and delete all files:

```bash
bash scripts/radarr.sh remove 27205 --delete-files
```

**Always ask user if they want to delete files when removing!**

### View configuration

Get available root folders and quality profiles:

```bash
bash scripts/radarr.sh config
```

Use this to determine your `defaultQualityProfile` ID.

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference
- **[Quick Reference](./references/quick-reference.md)** - Common operations with copy-paste ready examples
- **[Troubleshooting](./references/troubleshooting.md)** - Authentication, connection, and common error solutions

## Workflow

When a user asks to add a movie:

1. **Search**: `bash scripts/radarr.sh search "Movie Name"`
2. **Present results**: Always include TMDB links in format `[Title (Year)](https://themoviedb.org/movie/ID)`
3. **User picks**: User selects a number from the search results
4. **Check collection**: If the movie is part of a collection, ask the user if they want to add the full collection
5. **Check exists**: Run `exists <tmdbId>` to verify it's not already added
6. **Add**: Run `add <tmdbId>` or `add-collection <collectionId>` to add and start searching


## Troubleshooting

**"Radarr not configured"**
→ Check your credentials exist in `~/.claude-homelab/.env` with variables `RADARR_URL` and `RADARR_API_KEY`

**"Connection refused"**
→ Verify your Radarr server URL is correct and Radarr is running

**401 Unauthorized**
→ Your API key is invalid — check Settings → General → Security

**"Quality profile not found"**
→ Run `bash scripts/radarr.sh config` to see available profile IDs

**Collection not found**
→ Not all movies are part of collections — check the search results for collection info

## Notes

- Uses Radarr API v3
- Default quality profile can be overridden per-add if needed
- Search results include TMDB IDs for reliable identification
- Collection detection helps organize franchises and series
- Supports minimum availability settings (announced, in cinemas, released)
- Requires `curl` and `jq` installed

## License

MIT
