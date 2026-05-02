# Prowlarr Skill

Search across all your indexers and manage Prowlarr.

## What It Does

- **Search releases** across all indexers (torrents + usenet)
- **Filter by type** (torrents-only, usenet-only) or category (Movies, TV, etc.)
- **TV/Movie search** by TVDB, IMDB, or TMDB ID
- **Manage indexers** — enable, disable, test, view stats
- **Sync to apps** — push indexer changes to Sonarr/Radarr

## Setup

### 1. Get Your API Key

1. Open Prowlarr web UI
2. Go to **Settings → General → Security**
3. Copy your **API Key**

### 2. Add Credentials to .env

Add the following to `~/.claude-homelab/.env`:

```bash
PROWLARR_URL="http://localhost:9696"
PROWLARR_API_KEY="<your_api_key>"
```

Replace:
- `http://localhost:9696` with your Prowlarr URL
- `<your_api_key>` with your actual API key

### 3. Test It

```bash
./skills/prowlarr/scripts/prowlarr-api.sh status
```

## Usage Examples

### Search for releases

```bash
# Basic search
prowlarr-api.sh search "ubuntu 24.04"

# Torrents only
prowlarr-api.sh search "inception" --torrents

# Usenet only  
prowlarr-api.sh search "inception" --usenet

# Movies category (2000)
prowlarr-api.sh search "inception" --category 2000
```

### TV/Movie search by ID

```bash
# Search by TVDB ID
prowlarr-api.sh tv-search --tvdb 71663 --season 1 --episode 1

# Search by IMDB ID
prowlarr-api.sh movie-search --imdb tt0111161
```

### Indexer management

```bash
# List all indexers
prowlarr-api.sh indexers

# Check indexer stats
prowlarr-api.sh stats

# Test all indexers
prowlarr-api.sh test-all

# Sync to Sonarr/Radarr
prowlarr-api.sh sync
```

## Categories

| ID | Category |
|----|----------|
| 2000 | Movies |
| 5000 | TV |
| 3000 | Audio |
| 7000 | Books |
| 1000 | Console |
| 4000 | PC |

## Environment Variables

The skill loads credentials from `~/.claude-homelab/.env`. You can also override them temporarily:

```bash
PROWLARR_URL="https://prowlarr.example.com" \
PROWLARR_API_KEY="your-api-key" \
./skills/prowlarr/scripts/prowlarr-api.sh status
```

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference
- **[Quick Reference](./references/quick-reference.md)** - Common operations with copy-paste ready examples
- **[Troubleshooting](./references/troubleshooting.md)** - Authentication, connection, and common error solutions

## Troubleshooting

**"Missing URL or API key"**
→ Check your `.env` file exists at `~/.claude-homelab/.env` and contains `PROWLARR_URL` and `PROWLARR_API_KEY`

**Connection refused**
→ Verify your Prowlarr URL is correct and accessible

**401 Unauthorized**
→ Your API key is invalid — regenerate it in Prowlarr settings

## License

MIT
