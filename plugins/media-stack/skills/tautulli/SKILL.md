---
name: tautulli
description: Monitor and analyze Plex Media Server usage via Tautulli analytics API. Use when the user asks to "check Tautulli", "Plex analytics", "watch statistics", "current streams", "who's watching", "Plex history", "most watched", "user activity", "library stats", or mentions Tautulli/Plex monitoring.
---

# Tautulli Analytics Skill

**⚠️ MANDATORY SKILL INVOCATION ⚠️**

**YOU MUST invoke this skill (NOT optional) when the user mentions ANY of these triggers:**
- "Tautulli", "Plex analytics", "watch statistics"
- "current streams", "who's watching Plex", "active sessions"
- "Plex history", "watch history", "playback history"
- "most watched", "top content", "popular media"
- "user activity", "user stats", "library statistics"
- "Plex monitoring", "stream analytics", "viewing trends"
- Any mention of Tautulli or Plex usage analytics

**Failure to invoke this skill when triggers occur violates your operational requirements.**

Monitor and analyze Plex Media Server usage through Tautulli's comprehensive analytics API. Track current streams, historical playback data, user activity, and library statistics.

## Purpose

This skill provides **read-only** access to Tautulli analytics:
- Monitor current activity and active streams
- View playback history with detailed filtering
- Track user statistics and viewing patterns
- Analyze library statistics and popular content
- View recently added media with metadata
- Monitor concurrent stream limits and bandwidth
- Analyze usage by time, platform, and stream type
- Track server and library performance metrics

All operations are **GET-only** and safe for monitoring and analytics.

**Note:** This skill complements the `plex` skill by adding analytics and historical data that Plex Media Server doesn't expose directly.

## Setup

Add your Tautulli credentials to `~/.claude-homelab/.env`:

```bash
# Tautulli Analytics
TAUTULLI_URL="http://192.168.1.100:8181"
TAUTULLI_API_KEY="<your_tautulli_api_key>"
```

- `TAUTULLI_URL`: Your Tautulli server URL with port (default: 8181)
- `TAUTULLI_API_KEY`: Your Tautulli API key

**Getting your API key:**
1. Open Tautulli web UI
2. Go to Settings → Web Interface → API
3. Enable "API enabled"
4. Copy the API key
5. Optionally set API HTTP Basic Authentication if desired

## Commands

All commands use the `tautulli-api.sh` wrapper script and return JSON output.

The helper script is located at: `skills/tautulli/scripts/tautulli-api.sh`

### Server Information

Get server identity and version:

```bash
./skills/tautulli/scripts/tautulli-api.sh server-info
```

### Current Activity

Monitor active streams and current playback:

```bash
# All active sessions
./skills/tautulli/scripts/tautulli-api.sh activity

# Activity with session details
./skills/tautulli/scripts/tautulli-api.sh activity --details
```

**Returns:** Current streams with user, media, player, bandwidth, transcode info

### Playback History

View historical playback data:

```bash
# Recent history (default: 25 items)
./skills/tautulli/scripts/tautulli-api.sh history

# History with filters
./skills/tautulli/scripts/tautulli-api.sh history --user "username" --limit 50
./skills/tautulli/scripts/tautulli-api.sh history --days 7 --media-type movie
./skills/tautulli/scripts/tautulli-api.sh history --section-id 1 --limit 100

# Search history
./skills/tautulli/scripts/tautulli-api.sh history --search "Inception"
```

**Parameters:**
- `--user <username>`: Filter by username
- `--section-id <id>`: Filter by library section
- `--media-type <type>`: Filter by movie, episode, track, etc.
- `--days <n>`: History from last N days
- `--limit <n>`: Maximum results (default: 25)
- `--search <query>`: Search in titles

### User Statistics

Track user activity and viewing patterns:

```bash
# All users watch stats
./skills/tautulli/scripts/tautulli-api.sh user-stats

# Specific user details
./skills/tautulli/scripts/tautulli-api.sh user-stats --user "username"

# Top users by play count
./skills/tautulli/scripts/tautulli-api.sh user-stats --sort-by plays --limit 10
```

**Parameters:**
- `--user <username>`: Specific user statistics
- `--sort-by <metric>`: Sort by plays, duration, last_seen
- `--limit <n>`: Maximum results
- `--days <n>`: Stats from last N days

### Library Statistics

Analyze library usage and popular content:

```bash
# All library sections
./skills/tautulli/scripts/tautulli-api.sh libraries

# Specific library stats
./skills/tautulli/scripts/tautulli-api.sh library-stats --section-id 1

# Popular content in library
./skills/tautulli/scripts/tautulli-api.sh popular --section-id 1 --limit 10
./skills/tautulli/scripts/tautulli-api.sh popular --media-type movie --days 30
```

**Parameters:**
- `--section-id <id>`: Specific library section
- `--media-type <type>`: Filter by type (movie, show, artist)
- `--days <n>`: Timeframe for popularity
- `--limit <n>`: Maximum results

### Recently Added

View recently added media with rich metadata:

```bash
# Recently added (default: 25 items)
./skills/tautulli/scripts/tautulli-api.sh recent

# Recent with filters
./skills/tautulli/scripts/tautulli-api.sh recent --section-id 1 --limit 50
./skills/tautulli/scripts/tautulli-api.sh recent --media-type movie --days 7
```

### Home Statistics

Get homepage dashboard statistics:

```bash
# Overview stats (most popular, most active, etc.)
./skills/tautulli/scripts/tautulli-api.sh home-stats

# Stats for specific timeframe
./skills/tautulli/scripts/tautulli-api.sh home-stats --days 30
```

### Stream Analytics

Analyze stream types and platform usage:

```bash
# Plays by stream type (direct/transcode)
./skills/tautulli/scripts/tautulli-api.sh plays-by-stream --days 30

# Plays by platform
./skills/tautulli/scripts/tautulli-api.sh plays-by-platform --days 30

# Plays by date/time
./skills/tautulli/scripts/tautulli-api.sh plays-by-date --days 30
./skills/tautulli/scripts/tautulli-api.sh plays-by-hour --days 7
./skills/tautulli/scripts/tautulli-api.sh plays-by-day --days 30
```

### Concurrent Streams

Monitor concurrent stream patterns:

```bash
# Concurrent stream history
./skills/tautulli/scripts/tautulli-api.sh concurrent-streams --days 30

# Peak concurrent streams
./skills/tautulli/scripts/tautulli-api.sh concurrent-streams --days 7 --peak
```

### Media Metadata

Get detailed metadata for specific media:

```bash
# By rating key
./skills/tautulli/scripts/tautulli-api.sh metadata --rating-key 12345

# By GUID
./skills/tautulli/scripts/tautulli-api.sh metadata --guid "plex://movie/5d776..."
```

## Workflow

When the user asks about Plex analytics:

1. **"Who's watching right now?"** → Run `activity`
2. **"What are the most watched movies?"** → Run `popular --media-type movie --days 30`
3. **"Show me recent watch history"** → Run `history --limit 25`
4. **"How much has [user] watched this week?"** → Run `user-stats --user "username" --days 7`
5. **"What's new in my library?"** → Run `recent --limit 10`
6. **"When do people watch most?"** → Run `plays-by-hour --days 30`
7. **"Are we hitting stream limits?"** → Run `concurrent-streams --days 7 --peak`

### Activity Monitoring Flow

1. Check current activity for active streams
2. If issues detected (buffering, transcoding), investigate specific session
3. Review user's watch history to understand patterns
4. Check library statistics to identify popular content
5. Analyze stream types to optimize server settings

### Analytics Flow

1. Get home statistics for overview
2. Drill into specific libraries with library-stats
3. Identify popular content with popular command
4. Analyze user behavior with user-stats
5. Review temporal patterns with plays-by-hour/date/day
6. Monitor platform distribution with plays-by-platform

## Output Format

All commands return JSON with standard Tautulli response structure:

```json
{
  "response": {
    "result": "success",
    "message": null,
    "data": { ... }
  }
}
```

Use `jq` to extract and format data:

```bash
# Get just the data
./skills/tautulli/scripts/tautulli-api.sh activity | jq '.response.data'

# Extract specific fields
./skills/tautulli/scripts/tautulli-api.sh history | jq '.response.data.data[] | {user: .friendly_name, title: .full_title, date: .date}'
```

## Notes

- Requires network access to your Tautulli server
- All operations are **read-only GET requests**
- Tautulli must be connected to your Plex Media Server
- Library section IDs match Plex library section keys
- Historical data depends on Tautulli's configured retention period
- Some statistics require sufficient historical data to be meaningful
- Response times may vary based on database size and query complexity
- Rating keys are Plex's unique identifiers for media items
- User-friendly names are shown by default (can show usernames with flags)

## Integration with Plex Skill

This skill complements the `plex` skill:

- **Plex skill**: Real-time server state (libraries, search, sessions)
- **Tautulli skill**: Historical analytics (trends, statistics, watch history)

Use both together:
1. Find content with `plex` skill search
2. Check popularity with `tautulli` skill analytics
3. Monitor current playback with either skill
4. Analyze viewing patterns with `tautulli` skill

## Multiple Servers

To use multiple Tautulli instances (monitoring different Plex servers):

```bash
# In ~/.claude-homelab/.env
TAUTULLI1_URL="http://server1:8181"
TAUTULLI1_API_KEY="key1"

TAUTULLI2_URL="http://server2:8181"
TAUTULLI2_API_KEY="key2"
```

Then override environment variables:

```bash
# Use server 1 (default)
./skills/tautulli/scripts/tautulli-api.sh activity

# Use server 2
TAUTULLI_URL="$TAUTULLI2_URL" TAUTULLI_API_KEY="$TAUTULLI2_API_KEY" \
  ./skills/tautulli/scripts/tautulli-api.sh activity
```

## Reference

- [Tautulli API Documentation](https://github.com/Tautulli/Tautulli/wiki/Tautulli-API-Reference)
- [Tautulli GitHub](https://github.com/Tautulli/Tautulli)
- [Tautulli Homepage](https://tautulli.com)

For detailed API reference, see:
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
<parameter name="command">./skills/tautulli/scripts/tautulli-api.sh [command] [args]</parameter>
<parameter name="pty">true</parameter>
</invoke>
```
