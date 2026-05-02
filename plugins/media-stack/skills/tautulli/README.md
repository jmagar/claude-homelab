# Tautulli Analytics Skill

Monitor and analyze your Plex Media Server usage with Tautulli's comprehensive analytics API.

## What It Does

- **Current Activity** — Monitor active streams and real-time playback
- **Playback History** — View detailed watch history with filters
- **User Statistics** — Track user viewing patterns and activity
- **Library Analytics** — Analyze library usage and popular content
- **Recently Added** — View new media with rich metadata
- **Stream Analytics** — Analyze stream types, platforms, and bandwidth
- **Temporal Patterns** — Understand viewing trends by time/date
- **Concurrent Streams** — Monitor simultaneous playback limits

All operations are read-only and use the Tautulli API for comprehensive Plex analytics.

## What Is Tautulli?

Tautulli is a monitoring and tracking application for Plex Media Server. It provides:
- Real-time activity monitoring
- Historical playback statistics
- User and library analytics
- Notification systems
- Rich metadata and artwork
- Custom graphs and charts

This skill gives you command-line access to Tautulli's analytics API.

## Setup

### 1. Install Tautulli

If you don't have Tautulli installed:

**Docker:**
```bash
docker run -d \
  --name tautulli \
  -p 8181:8181 \
  -v /path/to/config:/config \
  -e TZ=America/New_York \
  ghcr.io/tautulli/tautulli
```

**Manual Install:**
Follow instructions at https://github.com/Tautulli/Tautulli#installation

### 2. Configure Tautulli

1. Open Tautulli web UI (default: http://localhost:8181)
2. Connect to your Plex Media Server
3. Let it collect some historical data (at least a few hours)

### 3. Get Your API Key

1. In Tautulli, go to **Settings → Web Interface**
2. Scroll to **API** section
3. Enable **"API enabled"** checkbox
4. Copy your **API Key**

### 4. Add to Environment Variables

Add your Tautulli credentials to `~/.claude-homelab/.env`:

```bash
# Tautulli Analytics
TAUTULLI_URL="http://192.168.1.100:8181"
TAUTULLI_API_KEY="<your_api_key>"
```

**Configuration options:**
- `TAUTULLI_URL`: Your Tautulli server URL with port (default port: 8181)
- `TAUTULLI_API_KEY`: Your Tautulli API key from Settings

### 5. Test It

```bash
cd ~/claude-homelab/skills/tautulli
./scripts/tautulli-api.sh server-info
```

You should see JSON output with your Tautulli server version.

## Usage Examples

All examples use the `tautulli-api.sh` helper script.

### Monitor Current Activity

See who's watching right now:

```bash
./scripts/tautulli-api.sh activity
```

**Output includes:**
- Active stream count
- User information
- Media details (title, year, rating)
- Player information (device, location)
- Stream quality and bandwidth
- Transcode status

### View Watch History

Recent playback history:

```bash
# Last 25 plays (default)
./scripts/tautulli-api.sh history

# Last 50 plays
./scripts/tautulli-api.sh history --limit 50

# Last week's history
./scripts/tautulli-api.sh history --days 7

# Specific user's history
./scripts/tautulli-api.sh history --user "john"

# Movies only
./scripts/tautulli-api.sh history --media-type movie

# Search for specific title
./scripts/tautulli-api.sh history --search "Inception"
```

### User Statistics

Track user viewing patterns:

```bash
# All users
./scripts/tautulli-api.sh user-stats

# Specific user
./scripts/tautulli-api.sh user-stats --user "john"

# Top 10 most active users
./scripts/tautulli-api.sh user-stats --sort-by plays --limit 10

# Last 30 days activity
./scripts/tautulli-api.sh user-stats --days 30
```

### Library Statistics

Analyze your libraries:

```bash
# List all libraries
./scripts/tautulli-api.sh libraries

# Specific library stats (replace 1 with your library ID)
./scripts/tautulli-api.sh library-stats --section-id 1

# Most popular movies
./scripts/tautulli-api.sh popular --media-type movie --limit 10

# Most watched in last 30 days
./scripts/tautulli-api.sh popular --section-id 1 --days 30
```

### Recently Added Media

See what's new:

```bash
# Last 25 additions (default)
./scripts/tautulli-api.sh recent

# Last 50 additions
./scripts/tautulli-api.sh recent --limit 50

# Recent movies only
./scripts/tautulli-api.sh recent --media-type movie

# Last week's additions
./scripts/tautulli-api.sh recent --days 7
```

### Stream Analytics

Understand how content is being streamed:

```bash
# Stream types (direct play vs transcode)
./scripts/tautulli-api.sh plays-by-stream --days 30

# Platform distribution (Roku, Apple TV, etc.)
./scripts/tautulli-api.sh plays-by-platform --days 30

# Plays by date
./scripts/tautulli-api.sh plays-by-date --days 30

# Plays by hour of day
./scripts/tautulli-api.sh plays-by-hour --days 7

# Plays by day of week
./scripts/tautulli-api.sh plays-by-day --days 30
```

### Concurrent Streams

Monitor simultaneous playback:

```bash
# Concurrent stream history
./scripts/tautulli-api.sh concurrent-streams --days 30

# Peak concurrent streams
./scripts/tautulli-api.sh concurrent-streams --days 7 --peak
```

### Dashboard Statistics

Get overview stats like the Tautulli homepage:

```bash
# Overall statistics
./scripts/tautulli-api.sh home-stats

# Last 30 days
./scripts/tautulli-api.sh home-stats --days 30
```

### Media Metadata

Get detailed information about specific media:

```bash
# By Plex rating key
./scripts/tautulli-api.sh metadata --rating-key 12345

# By Plex GUID
./scripts/tautulli-api.sh metadata --guid "plex://movie/5d776..."
```

## Workflow

### Monitoring Active Streams

When someone asks "Who's watching?" or "What's playing?":

1. Run `activity` to see current sessions
2. Check for buffering or transcoding issues
3. If problems found, investigate user's history with `history --user "username"`
4. Check library stats to see if content is popular

### Analyzing Content Popularity

When planning library updates or identifying favorites:

1. Run `home-stats` for overview
2. Use `popular` to find most-watched content
3. Filter by media type and timeframe
4. Cross-reference with `library-stats` for section-specific data

### Understanding User Behavior

When analyzing usage patterns:

1. Get user list with `user-stats`
2. Drill into specific users with `user-stats --user "name"`
3. Check viewing times with `plays-by-hour` and `plays-by-day`
4. Review watch history with `history --user "name"`

### Optimizing Server Performance

When investigating performance:

1. Check `plays-by-stream` for transcode ratios
2. Identify platform issues with `plays-by-platform`
3. Monitor concurrent load with `concurrent-streams`
4. Review active sessions with `activity`

## Data Interpretation

### Stream Types

- **Direct Play**: No transcoding, optimal performance
- **Direct Stream**: Container conversion only
- **Transcode**: Full video/audio conversion (CPU intensive)

### Library Section IDs

Library section IDs in Tautulli match Plex library keys:
- Usually 1 = Movies
- Usually 2 = TV Shows
- Run `libraries` command to see your specific IDs

### Time Ranges

Most commands support `--days N` parameter:
- `--days 1`: Last 24 hours
- `--days 7`: Last week
- `--days 30`: Last month
- `--days 365`: Last year

### User Identification

- **Friendly Name**: Display name (e.g., "John Smith")
- **Username**: Plex username (e.g., "jsmith")
- Use friendly names for user-facing output
- Use usernames for automation and filtering

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete Tautulli API reference
- **[Quick Reference](./references/quick-reference.md)** - Common operations with copy-paste examples
- **[Troubleshooting](./references/troubleshooting.md)** - Authentication, connection, and error solutions

## Integration with Plex Skill

This skill complements the existing `plex` skill:

| Feature | Plex Skill | Tautulli Skill |
|---------|-----------|----------------|
| **Current Sessions** | ✅ Real-time | ✅ Real-time + bandwidth |
| **Search Media** | ✅ All libraries | ❌ (use Plex) |
| **Library Browse** | ✅ Full browse | ✅ Stats only |
| **Watch History** | ❌ | ✅ Detailed history |
| **User Statistics** | ❌ | ✅ Complete analytics |
| **Popular Content** | ❌ | ✅ Trending analysis |
| **Stream Analytics** | ❌ | ✅ Transcode stats |
| **Temporal Trends** | ❌ | ✅ Time-based patterns |

**Use both together:**
1. Find content with `plex` skill
2. Check popularity with `tautulli` skill
3. Monitor streams with either skill
4. Analyze patterns with `tautulli` skill

## Troubleshooting

### "Connection refused" or timeout

**Causes:**
- Tautulli not running
- Wrong URL or port
- Firewall blocking connection

**Solutions:**
```bash
# Check if Tautulli is running
curl -I http://localhost:8181

# Verify URL in .env
echo $TAUTULLI_URL

# Test with full URL
curl "http://localhost:8181/api/v2?apikey=<your_api_key>&cmd=get_server_info"
```

### "Invalid API key" or authentication error

**Causes:**
- API key is wrong
- API not enabled
- Key has special characters not properly escaped

**Solutions:**
1. Verify API enabled in Settings → Web Interface → API
2. Copy API key carefully (no spaces)
3. Regenerate API key if needed
4. Check `.env` file has no quotes around key

### Empty or missing data

**Causes:**
- Insufficient historical data
- Library not scanned yet
- No recent playback activity

**Solutions:**
1. Wait for Tautulli to collect data (runs every few minutes)
2. Ensure Plex is connected in Tautulli settings
3. Check Tautulli logs for errors
4. Increase `--limit` parameter if pagination is hiding data

### "No section_id" error

**Cause:** Library section ID not specified when required

**Solution:**
```bash
# List available libraries first
./scripts/tautulli-api.sh libraries

# Then use the correct section_id
./scripts/tautulli-api.sh library-stats --section-id 1
```

## Notes

- Tautulli runs on port 8181 by default
- Historical data depends on retention settings (default: unlimited)
- Statistics become more meaningful with more data over time
- Large queries may take time depending on database size
- Library section IDs match Plex's section keys
- User-friendly names are shown by default in most outputs
- Rating keys are Plex's unique media identifiers
- All operations are read-only and safe for monitoring

## Performance Considerations

- **Large Databases**: Queries may be slow on servers with years of data
- **Complex Filters**: Multiple filters increase query time
- **Time Ranges**: Shorter time ranges (--days 7) are faster than longer ones
- **Limits**: Use `--limit` to reduce result size and improve speed

**Optimization tips:**
- Use specific filters to narrow results
- Query recent data (--days) instead of all-time
- Use reasonable limits (--limit 50 instead of 1000)
- Cache results for frequent queries

## Security

- Never expose your API key in logs or commits
- Use environment variables for credentials
- Keep your API key secure — it grants read access to all analytics
- Consider using Tautulli's HTTP Basic Auth for additional security
- Regularly rotate API keys if shared

## License

MIT
