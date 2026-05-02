# Plex Media Server Quick Reference

Common operations for quick copy-paste usage.

## Setup

### Environment Variables (for raw curl)

```bash
export PLEX_URL="http://localhost:32400"
export PLEX_TOKEN="your-plex-token"
```

### Using Helper Script (Recommended)

Add to `~/.claude-homelab/.env`:
```bash
PLEX_URL="http://192.168.1.100:32400"
PLEX_TOKEN="your-plex-token"
```

The helper script `skills/plex/scripts/plex-api.sh` simplifies API access and handles authentication automatically.

## Getting Your Plex Token

### From Plex Web App

1. Open Plex Web App
2. Settings → Account → scroll to bottom
3. Show Advanced → "Get Token"

### Via API (if you have credentials)

```bash
curl -X POST "https://plex.tv/users/sign_in.json" \
  -H "X-Plex-Client-Identifier: unique-client-id" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "user[login]=your-email@example.com&user[password]=yourpassword" | \
  jq -r '.user.authToken'
```

## Server Information

### Get Server Identity

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh identity | jq

# Or raw curl
curl -s "$PLEX_URL/identity" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

### Get Server Info

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh info | jq

# Or raw curl
curl -s "$PLEX_URL/" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Get Server Preferences

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh prefs | jq

# Or raw curl
curl -s "$PLEX_URL/:/prefs" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

### Get Server Status

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh sessions | jq

# Or raw curl
curl -s "$PLEX_URL/status/sessions" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

## Library Management

### Get All Libraries

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh libraries | jq '.MediaContainer.Directory[] | {key, title, type}'

# Or raw curl
curl -s "$PLEX_URL/library/sections" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Directory[] | {key, title, type}'
```

### Get Library Contents

```bash
# Using helper script (replace 1 with your library key)
./skills/plex/scripts/plex-api.sh library 1 | jq '.MediaContainer.Metadata[] | {title, year, type}'
./skills/plex/scripts/plex-api.sh library 1 --limit 50 --offset 100

# Or raw curl
curl -s "$PLEX_URL/library/sections/LIBRARY_KEY/all" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Metadata[] | {title, year, type}'
```

### Get Recently Added

```bash
# Using helper script (default: 20 items)
./skills/plex/scripts/plex-api.sh recent | jq
./skills/plex/scripts/plex-api.sh recent --limit 10

# Or raw curl
curl -s "$PLEX_URL/library/recentlyAdded" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Refresh Library

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh refresh 1

# Or raw curl
curl -s "$PLEX_URL/library/sections/LIBRARY_KEY/refresh" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

### Scan for New Files (Force)

```bash
# Use raw curl (force refresh not in helper script)
curl -s "$PLEX_URL/library/sections/LIBRARY_KEY/refresh?force=1" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

## Media Metadata

### Get Movie/Show Details

```bash
# Using helper script (replace 12345 with rating key)
./skills/plex/scripts/plex-api.sh metadata 12345 | jq

# Or raw curl
curl -s "$PLEX_URL/library/metadata/RATING_KEY" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Get Season/Episode Details (Children)

```bash
# Using helper script (get seasons of a show)
./skills/plex/scripts/plex-api.sh children 12345 | jq

# Or raw curl
curl -s "$PLEX_URL/library/metadata/RATING_KEY/children" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Search All Libraries

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh search "Inception" | jq
./skills/plex/scripts/plex-api.sh search "Marvel" --limit 5

# Or raw curl
curl -s "$PLEX_URL/search?query=inception" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

## Playback & Sessions

### Get Active Sessions (Now Playing)

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh sessions | jq '.MediaContainer.Metadata[] | {title, user: .User.title, player: .Player.title}'

# Or raw curl
curl -s "$PLEX_URL/status/sessions" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Metadata[] | {title, user: .User.title, player: .Player.title}'
```

### Get Continue Watching (On Deck)

```bash
# Using helper script (default: 10 items)
./skills/plex/scripts/plex-api.sh ondeck | jq
./skills/plex/scripts/plex-api.sh ondeck --limit 5

# Or raw curl
curl -s "$PLEX_URL/library/onDeck" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### List Connected Clients

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh clients | jq

# Or raw curl
curl -s "$PLEX_URL/clients" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Get Session History

```bash
curl -s "$PLEX_URL/status/sessions/history/all" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Stop Playback Session

```bash
# Get session ID from active sessions first
curl -X DELETE "$PLEX_URL/status/sessions/terminate?sessionId=SESSION_ID&reason=message" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

## Playlists

### Get All Playlists

```bash
# Using helper script
./skills/plex/scripts/plex-api.sh playlists | jq '.MediaContainer.Metadata[] | {title, playlistType, leafCount}'

# Or raw curl
curl -s "$PLEX_URL/playlists" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Metadata[] | {title, playlistType, leafCount}'
```

### Get Playlist Contents

```bash
curl -s "$PLEX_URL/playlists/PLAYLIST_ID/items" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Create Playlist

```bash
curl -X POST "$PLEX_URL/playlists?type=video&title=My%20Playlist&smart=0&uri=server://MACHINE_ID/com.plexapp.plugins.library/library/metadata/RATING_KEY" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

## Users & Sharing

### Get Users (Plex Home)

```bash
# Using helper script (admin only)
./skills/plex/scripts/plex-api.sh accounts | jq

# Or raw curl
curl -s "$PLEX_URL/accounts" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Get Shared Servers

```bash
curl -s "https://plex.tv/api/v2/shared_servers" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

## Webhooks

### Get Webhook Settings

```bash
curl -s "$PLEX_URL/:/prefs" \
  -H "X-Plex-Token: $PLEX_TOKEN" | grep webhook
```

## Maintenance

### Empty Trash for Library

```bash
curl -X PUT "$PLEX_URL/library/sections/LIBRARY_KEY/emptyTrash" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

### Clean Bundles

```bash
curl -X PUT "$PLEX_URL/library/clean/bundles" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

### Optimize Database

```bash
curl -X PUT "$PLEX_URL/library/optimize" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

## Transcoding

### Get Transcode Sessions

```bash
curl -s "$PLEX_URL/transcode/sessions" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

### Kill Transcode Session

```bash
curl -X DELETE "$PLEX_URL/transcode/sessions/TRANSCODE_SESSION_KEY" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

## Workflows

### Workflow: Get Library Statistics

```bash
# Get all libraries
libraries=$(curl -s "$PLEX_URL/library/sections" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq -r '.MediaContainer.Directory[] | "\(.key)|\(.title)|\(.type)"')

# Count items in each library
echo "$libraries" | while IFS='|' read key title type; do
  count=$(curl -s "$PLEX_URL/library/sections/$key/all" \
    -H "X-Plex-Token: $PLEX_TOKEN" \
    -H "Accept: application/json" | jq '.MediaContainer.size')

  echo "$title ($type): $count items"
done
```

### Workflow: Find Unwatched Movies

```bash
curl -s "$PLEX_URL/library/sections/LIBRARY_KEY/unwatched" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Metadata[] | {title, year, addedAt}'
```

### Workflow: Get Top Played Content

```bash
curl -s "$PLEX_URL/library/sections/LIBRARY_KEY/all?sort=viewCount:desc&limit=10" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Metadata[] | {title, viewCount}'
```

### Workflow: Refresh All Libraries

```bash
curl -s "$PLEX_URL/library/sections" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq -r '.MediaContainer.Directory[].key' | \
  while read library_key; do
    echo "Refreshing library $library_key"
    curl -s "$PLEX_URL/library/sections/$library_key/refresh" \
      -H "X-Plex-Token: $PLEX_TOKEN"
    sleep 2
  done
```

### Workflow: Monitor Active Streams

```bash
while true; do
  clear
  echo "Active Plex Streams ($(date))"
  echo "================================"

  curl -s "$PLEX_URL/status/sessions" \
    -H "X-Plex-Token: $PLEX_TOKEN" \
    -H "Accept: application/json" | \
    jq -r '.MediaContainer.Metadata[]? | "User: \(.User.title)\nTitle: \(.title)\nPlayer: \(.Player.title)\nState: \(.Player.state)\n"'

  sleep 10
done
```

### Workflow: Get Recently Added Across All Libraries

```bash
curl -s "$PLEX_URL/library/recentlyAdded" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Metadata[] | {title, type, addedAt}'
```

### Workflow: Mark Item as Watched

```bash
curl -X POST "$PLEX_URL/:/scrobble?identifier=com.plexapp.plugins.library&key=RATING_KEY" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

### Workflow: Mark Item as Unwatched

```bash
curl -X POST "$PLEX_URL/:/unscrobble?identifier=com.plexapp.plugins.library&key=RATING_KEY" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

### Workflow: Get On Deck (Continue Watching)

```bash
curl -s "$PLEX_URL/library/onDeck" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | jq '.MediaContainer.Metadata[] | {title, viewOffset}'
```

### Workflow: Backup Database

```bash
# Stop Plex first (if possible)
# Then copy database
cp "$PLEX_DATA_DIR/Plug-in Support/Databases/com.plexapp.plugins.library.db" \
   "$PLEX_DATA_DIR/Plug-in Support/Databases/com.plexapp.plugins.library.db.backup-$(date +%Y%m%d)"

# Or use Plex's built-in backup
curl -X POST "$PLEX_URL/butler/StartBackup" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

### Workflow: Clean Up Old Media

```bash
# Find items not watched in over 1 year
cutoff_date=$(date -d '1 year ago' +%s)

curl -s "$PLEX_URL/library/sections/LIBRARY_KEY/all" \
  -H "X-Plex-Token: $PLEX_TOKEN" \
  -H "Accept: application/json" | \
  jq --arg cutoff "$cutoff_date" -r '.MediaContainer.Metadata[] | select(.lastViewedAt != null and (.lastViewedAt | tonumber) < ($cutoff | tonumber)) | {title, lastViewedAt, ratingKey}'
```

## Common Filters & Sorting

### Filter by Unwatched

```
?unwatched=1
```

### Filter by Genre

```
?genre=1234  # Get genre IDs from library first
```

### Sort by Date Added (Newest First)

```
?sort=addedAt:desc
```

### Sort by Rating

```
?sort=rating:desc
```

### Limit Results

```
?limit=10
```
