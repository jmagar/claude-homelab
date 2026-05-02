# Overseerr Skill

Request movies and TV shows via your Overseerr instance.

## What It Does

- **Search** — Find movies and TV shows via TMDB
- **Request** — Submit media requests for automatic downloading
- **Status** — Monitor request status (pending, processing, available)
- **4K Support** — Request 4K versions of media
- **Season Selection** — Choose specific seasons for TV shows
- **Monitor** — Poll for request status changes

All operations use the Overseerr API (stable version, not the beta Seerr rewrite).

## Setup

### 1. Get Your Overseerr API Key

1. Open your Overseerr web UI
2. Go to **Settings → General**
3. Scroll to **API Key** section
4. Copy your API key (or generate a new one)

### 2. Add Credentials to .env File

Add your Overseerr configuration to `~/.claude-homelab/.env`:

```bash
OVERSEERR_URL="http://localhost:5055"
OVERSEERR_API_KEY="your-api-key-here"
```

**Important:**
- The `.env` file must be located at `~/.claude-homelab/.env`
- This file is gitignored (never committed)
- Set file permissions: `chmod 600 ~/.claude-homelab/.env`

**Configuration options:**
- `OVERSEERR_URL`: Your Overseerr server URL (no trailing slash)
- `OVERSEERR_API_KEY`: Your Overseerr API key (Settings → General → API Key)

### 3. Test It

```bash
cd skills/overseerr
node scripts/search.mjs "inception"
```

## Usage Examples

All scripts are Node.js ESM modules in the `scripts/` directory.

### Search for Media

Search for movies or TV shows:

```bash
# Search movies (default)
node scripts/search.mjs "the matrix"

# Search TV shows
node scripts/search.mjs "bluey" --type tv

# Limit results
node scripts/search.mjs "star wars" --limit 5
```

### Request Movies

Request a movie with automatic detection:

```bash
node scripts/request.mjs "Dune" --type movie
```

Request a 4K version:

```bash
node scripts/request.mjs "Oppenheimer" --type movie --is4k
```

### Request TV Shows

Request all seasons (default):

```bash
node scripts/request.mjs "Bluey" --type tv --seasons all
```

Request specific seasons:

```bash
node scripts/request.mjs "Severance" --type tv --seasons 1,2
```

Request with 4K:

```bash
node scripts/request.mjs "Breaking Bad" --type tv --seasons all --is4k
```

### Check Request Status

View all requests with filtering:

```bash
# View pending requests
node scripts/requests.mjs --filter pending

# View processing requests
node scripts/requests.mjs --filter processing

# View available requests
node scripts/requests.mjs --filter available

# Limit results
node scripts/requests.mjs --filter pending --limit 10
```

Get enriched request details (includes Radarr/Sonarr status):

```bash
node scripts/requests-enriched.mjs --filter pending
```

Get specific request by ID:

```bash
node scripts/request-by-id.mjs 123
```

### Monitor Requests

Poll for request status changes:

```bash
# Check every 30 seconds
node scripts/monitor.mjs --interval 30 --filter pending

# Check every minute with custom filter
node scripts/monitor.mjs --interval 60 --filter processing
```

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference
- **[Quick Reference](./references/quick-reference.md)** - Common operations with copy-paste ready examples
- **[Troubleshooting](./references/troubleshooting.md)** - Authentication, connection, and common error solutions

## Workflow

When a user asks to request media:

1. **Search**: `node scripts/search.mjs "Movie/Show Name"`
2. **Present results**: Show titles with TMDB IDs
3. **User picks**: User selects which item to request
4. **Ask about 4K**: If user wants 4K version
5. **TV: Ask about seasons**: If TV show, ask which seasons to request
6. **Request**: Run request script with appropriate flags
7. **Confirm**: Show request ID and status

## Request Filters

Available filter options for `requests.mjs`:
- `pending` — Requests waiting for approval
- `processing` — Requests being downloaded/processed
- `available` — Completed and available requests
- `approved` — Approved but not yet processing
- `declined` — Declined requests
- `all` — All requests (default)

## Environment Variables Reference

| Variable | Description | Required |
|----------|-------------|----------|
| `OVERSEERR_URL` | Overseerr server URL | Yes |
| `OVERSEERR_API_KEY` | API key for authentication | Yes |

## Troubleshooting

**"Missing environment variables"**
→ Ensure both `OVERSEERR_URL` and `OVERSEERR_API_KEY` are set

**401 Unauthorized**
→ Your API key is invalid — check Settings → General → API Key

**"Connection refused"**
→ Verify your Overseerr server URL is correct and Overseerr is running

**"Media already requested"**
→ The item is already in the system — check request status

**4K not available**
→ Not all media has 4K versions available, or your Radarr/Sonarr may not be configured for 4K

## Notes

- Uses `X-Api-Key` authentication header
- Requires Node.js v16+ with ESM support
- This skill targets **Overseerr** (stable), not the "Seerr" beta rewrite
- Supports webhook notifications (configure in Overseerr)
- Polling with `monitor.mjs` is a simple baseline for status updates
- Season selection for TV shows uses comma-separated numbers or "all"
- Request status flows: pending → approved → processing → available

## Dependencies

- Node.js 16+ with ESM support
- `node-fetch` or built-in fetch (Node 18+)

## Security

- Never expose your API key in logs or commits
- Use environment variables for credentials
- Keep your API key secure — it grants request/admin access
- Consider using a restricted user token if available

## License

MIT
