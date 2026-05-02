# Plex Skill

Control and monitor your Plex Media Server.

## What It Does

- **Browse** — View libraries and sections
- **Search** — Find movies, TV shows, music across all libraries
- **Status** — Check active playback sessions and server info
- **Recently Added** — View latest content added to libraries
- **On Deck** — See continue watching content
- **Clients** — List available Plex clients/players

All operations are read-only and use the Plex Media Server API.

## Setup

### 1. Get Your Plex Token

**Option A: Via plex.tv**
1. Go to https://plex.tv/claim
2. Sign in to your Plex account
3. Copy the claim token (starts with `claim-`)

**Option B: From Plex app XML**
1. Open any media item in your Plex app
2. View page source or inspect network traffic
3. Look for `X-Plex-Token` in the XML or headers
4. Copy the token value

### 2. Set Environment Variables

Create your Plex configuration:

```bash
export PLEX_URL="http://192.168.1.100:32400"
export PLEX_TOKEN="<your_plex_token>"
```

Or add to your shell profile (`~/.bashrc`, `~/.zshrc`):

```bash
echo 'export PLEX_URL="http://192.168.1.100:32400"' >> ~/.bashrc
echo 'export PLEX_TOKEN="<your_plex_token>"' >> ~/.bashrc
source ~/.bashrc
```

**Configuration options:**
- `PLEX_URL`: Your Plex server URL (format: `http://IP:PORT`, default port: 32400)
- `PLEX_TOKEN`: Your Plex authentication token

### 3. Test It

```bash
curl -s "$PLEX_URL/?X-Plex-Token=$PLEX_TOKEN" -H "Accept: application/json"
```

## Usage Examples

All examples use `curl` with your environment variables.

### Get Server Info

```bash
curl -s "$PLEX_URL/?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Browse Libraries

List all library sections (Movies, TV Shows, Music, etc.):

```bash
curl -s "$PLEX_URL/library/sections?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### List Library Contents

```bash
# Replace 1 with your library section key from browse above
curl -s "$PLEX_URL/library/sections/1/all?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Search

Search across all libraries:

```bash
curl -s "$PLEX_URL/search?query=Inception&X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Get Recently Added

View the latest content added to your libraries:

```bash
curl -s "$PLEX_URL/library/recentlyAdded?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Get On Deck (Continue Watching)

```bash
curl -s "$PLEX_URL/library/onDeck?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Get Active Sessions

See what's currently playing:

```bash
curl -s "$PLEX_URL/status/sessions?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### List Available Clients

See all connected Plex clients/players:

```bash
curl -s "$PLEX_URL/clients?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

## Workflow

When a user asks about Plex:

1. **"What's on Plex?"** → Get recently added
2. **"Find a movie"** → Search for the title
3. **"What's playing?"** → Get active sessions
4. **"Show my libraries"** → Browse libraries
5. **"Continue watching"** → Get on deck items

## Library Section Types

Common library types (section keys vary by setup):
- **Movies** (usually section 1)
- **TV Shows** (usually section 2)
- **Music** (usually section 3)
- **Photos** (usually section 4)

Run the browse command to see your specific section keys.

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference
- **[Quick Reference](./references/quick-reference.md)** - Common operations with copy-paste ready examples
- **[Troubleshooting](./references/troubleshooting.md)** - Authentication, connection, and common error solutions

## API Response Format

### JSON Output

Add `-H "Accept: application/json"` for JSON responses (default is XML):

```bash
curl -s "$PLEX_URL/endpoint?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json"
```

### Media Keys

Media items are referenced by keys like `/library/metadata/12345`. Use these keys for specific item operations.

## Troubleshooting

**"Unauthorized" or 401 error**
→ Your Plex token is invalid or expired — generate a new one

**"Connection refused"**
→ Check your server URL and ensure Plex Media Server is running

**"Empty response"**
→ Library section key may be wrong — run browse command to see available sections

**Token not working**
→ Ensure there are no quotes or extra spaces in your token

## Notes

- Plex Media Server runs on port 32400 by default
- Library section keys (1, 2, 3...) vary by server setup
- All operations are read-only and safe for monitoring
- For playback control, you need to target a specific client
- JSON responses are cleaner than default XML
- Requires `curl` and optionally `jq` for JSON parsing

## Security

- Never expose your Plex token in logs or commits
- Use environment variables for credentials
- Keep your token secure — it grants full access to your server
- Consider using a restricted account token if available

## License

MIT
