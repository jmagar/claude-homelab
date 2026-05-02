# qBittorrent Quick Reference

Common operations for quick copy-paste usage.

## Setup

Add credentials to `~/.claude-homelab/.env`:

```bash
QBITTORRENT_URL="http://localhost:8080"
QBITTORRENT_USERNAME="admin"
QBITTORRENT_PASSWORD="yourpassword"
```

For manual curl commands, source the .env file:
```bash
source ~/.claude-homelab/.env
```

## Authentication

### Login and Save Cookie

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/auth/login" \
  -d "username=$QBITTORRENT_USERNAME&password=$QBITTORRENT_PASSWORD" \
  -c /tmp/qb-cookie.txt
```

### Logout

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/auth/logout" \
  -b /tmp/qb-cookie.txt
```

## Application Information

### Get API Version

```bash
curl -s "$QBITTORRENT_URL/api/v2/app/webapiVersion" \
  -b /tmp/qb-cookie.txt
```

### Get Application Version

```bash
curl -s "$QBITTORRENT_URL/api/v2/app/version" \
  -b /tmp/qb-cookie.txt
```

### Get Preferences

```bash
curl -s "$QBITTORRENT_URL/api/v2/app/preferences" \
  -b /tmp/qb-cookie.txt | jq
```

## Torrent Management

### Get All Torrents

```bash
curl -s "$QBITTORRENT_URL/api/v2/torrents/info" \
  -b /tmp/qb-cookie.txt | jq '.[] | {name, state, progress, dlspeed, upspeed}'
```

### Get Torrents by Filter

```bash
# Active torrents only
curl -s "$QBITTORRENT_URL/api/v2/torrents/info?filter=active" \
  -b /tmp/qb-cookie.txt | jq

# Completed torrents
curl -s "$QBITTORRENT_URL/api/v2/torrents/info?filter=completed" \
  -b /tmp/qb-cookie.txt | jq

# Downloading torrents
curl -s "$QBITTORRENT_URL/api/v2/torrents/info?filter=downloading" \
  -b /tmp/qb-cookie.txt | jq
```

### Get Torrent Properties

```bash
# Replace HASH with actual torrent hash
curl -s "$QBITTORRENT_URL/api/v2/torrents/properties?hash=TORRENT_HASH" \
  -b /tmp/qb-cookie.txt | jq
```

### Add Torrent from URL

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/add" \
  -b /tmp/qb-cookie.txt \
  -F "urls=magnet:?xt=urn:btih:..." \
  -F "savepath=/downloads"
```

### Add Torrent from File

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/add" \
  -b /tmp/qb-cookie.txt \
  -F "torrents=@/path/to/file.torrent" \
  -F "savepath=/downloads"
```

### Pause Torrent

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/pause" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH"
```

### Resume Torrent

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/resume" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH"
```

### Delete Torrent (Keep Files)

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/delete" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH&deleteFiles=false"
```

### Delete Torrent (Delete Files)

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/delete" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH&deleteFiles=true"
```

### Recheck Torrent

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/recheck" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH"
```

### Set Torrent Category

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/setCategory" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH&category=movies"
```

## Category Management

### Get All Categories

```bash
curl -s "$QBITTORRENT_URL/api/v2/torrents/categories" \
  -b /tmp/qb-cookie.txt | jq
```

### Create Category

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/createCategory" \
  -b /tmp/qb-cookie.txt \
  -d "category=movies&savePath=/downloads/movies"
```

### Remove Category

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/removeCategories" \
  -b /tmp/qb-cookie.txt \
  -d "categories=movies"
```

## Tags

### Get All Tags

```bash
curl -s "$QBITTORRENT_URL/api/v2/torrents/tags" \
  -b /tmp/qb-cookie.txt
```

### Create Tag

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/createTags" \
  -b /tmp/qb-cookie.txt \
  -d "tags=public"
```

### Add Tags to Torrent

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/addTags" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH&tags=public,verified"
```

### Remove Tags from Torrent

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/removeTags" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=TORRENT_HASH&tags=public"
```

## Transfer Information

### Get Global Transfer Info

```bash
curl -s "$QBITTORRENT_URL/api/v2/transfer/info" \
  -b /tmp/qb-cookie.txt | jq
```

### Get Speed Limits

```bash
# Download limit
curl -s "$QBITTORRENT_URL/api/v2/transfer/downloadLimit" \
  -b /tmp/qb-cookie.txt

# Upload limit
curl -s "$QBITTORRENT_URL/api/v2/transfer/uploadLimit" \
  -b /tmp/qb-cookie.txt
```

### Set Speed Limits

```bash
# Set download limit (bytes/second, 0 = unlimited)
curl -X POST "$QBITTORRENT_URL/api/v2/transfer/setDownloadLimit" \
  -b /tmp/qb-cookie.txt \
  -d "limit=1048576"  # 1 MB/s

# Set upload limit
curl -X POST "$QBITTORRENT_URL/api/v2/transfer/setUploadLimit" \
  -b /tmp/qb-cookie.txt \
  -d "limit=524288"  # 512 KB/s
```

## Log

### Get Main Log

```bash
curl -s "$QBITTORRENT_URL/api/v2/log/main?last_known_id=-1" \
  -b /tmp/qb-cookie.txt | jq
```

### Get Peer Log

```bash
curl -s "$QBITTORRENT_URL/api/v2/log/peers?last_known_id=-1" \
  -b /tmp/qb-cookie.txt | jq
```

## RSS

### Get All RSS Rules

```bash
curl -s "$QBITTORRENT_URL/api/v2/rss/rules" \
  -b /tmp/qb-cookie.txt | jq
```

### Add RSS Feed

```bash
curl -X POST "$QBITTORRENT_URL/api/v2/rss/addFeed" \
  -b /tmp/qb-cookie.txt \
  -d "url=https://example.com/rss.xml&path=MyFeed"
```

## Workflows

### Workflow: Login and Get Torrent List

```bash
# Login
curl -X POST "$QBITTORRENT_URL/api/v2/auth/login" \
  -d "username=$QBITTORRENT_USERNAME&password=$QBITTORRENT_PASSWORD" \
  -c /tmp/qb-cookie.txt

# Get active torrents
curl -s "$QBITTORRENT_URL/api/v2/torrents/info?filter=active" \
  -b /tmp/qb-cookie.txt | jq '.[] | {name, state, progress}'
```

### Workflow: Add Torrent and Monitor Progress

1. **Add torrent:**
   ```bash
   curl -X POST "$QBITTORRENT_URL/api/v2/torrents/add" \
     -b /tmp/qb-cookie.txt \
     -F "urls=magnet:?xt=urn:btih:..." \
     -F "category=movies"
   ```

2. **Get torrent hash (from list):**
   ```bash
   hash=$(curl -s "$QBITTORRENT_URL/api/v2/torrents/info?filter=downloading" \
     -b /tmp/qb-cookie.txt | jq -r '.[0].hash')
   ```

3. **Monitor progress:**
   ```bash
   while true; do
     curl -s "$QBITTORRENT_URL/api/v2/torrents/properties?hash=$hash" \
       -b /tmp/qb-cookie.txt | jq '{progress: .progress, eta: .eta, dlspeed: .dl_speed}'
     sleep 5
   done
   ```

### Workflow: Pause All Active Torrents

```bash
# Get all active torrent hashes
hashes=$(curl -s "$QBITTORRENT_URL/api/v2/torrents/info?filter=active" \
  -b /tmp/qb-cookie.txt | jq -r '.[].hash' | tr '\n' '|')

# Pause all (remove trailing |)
curl -X POST "$QBITTORRENT_URL/api/v2/torrents/pause" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=${hashes%|}"
```

### Workflow: Delete Completed Torrents

```bash
# Get completed torrent hashes
curl -s "$QBITTORRENT_URL/api/v2/torrents/info?filter=completed" \
  -b /tmp/qb-cookie.txt | jq -r '.[].hash' | \
  while read hash; do
    echo "Deleting torrent $hash"
    curl -X POST "$QBITTORRENT_URL/api/v2/torrents/delete" \
      -b /tmp/qb-cookie.txt \
      -d "hashes=$hash&deleteFiles=false"
    sleep 0.5
  done
```

### Workflow: Set Speed Limits During Business Hours

```bash
hour=$(date +%H)

if [ $hour -ge 9 ] && [ $hour -lt 17 ]; then
  # Business hours: limit to 1 MB/s down, 512 KB/s up
  curl -X POST "$QBITTORRENT_URL/api/v2/transfer/setDownloadLimit" \
    -b /tmp/qb-cookie.txt \
    -d "limit=1048576"

  curl -X POST "$QBITTORRENT_URL/api/v2/transfer/setUploadLimit" \
    -b /tmp/qb-cookie.txt \
    -d "limit=524288"
else
  # Off hours: unlimited
  curl -X POST "$QBITTORRENT_URL/api/v2/transfer/setDownloadLimit" \
    -b /tmp/qb-cookie.txt \
    -d "limit=0"

  curl -X POST "$QBITTORRENT_URL/api/v2/transfer/setUploadLimit" \
    -b /tmp/qb-cookie.txt \
    -d "limit=0"
fi
```

### Workflow: Organize Torrents by Category

```bash
# Create categories
for category in movies tv music; do
  curl -X POST "$QBITTORRENT_URL/api/v2/torrents/createCategory" \
    -b /tmp/qb-cookie.txt \
    -d "category=$category&savePath=/downloads/$category"
done

# Categorize torrents by name pattern
curl -s "$QBITTORRENT_URL/api/v2/torrents/info" \
  -b /tmp/qb-cookie.txt | jq -r '.[] | "\(.hash)|\(.name)"' | \
  while IFS='|' read hash name; do
    if echo "$name" | grep -qi "s[0-9][0-9]e[0-9][0-9]"; then
      category="tv"
    elif echo "$name" | grep -qi "album"; then
      category="music"
    else
      category="movies"
    fi

    curl -X POST "$QBITTORRENT_URL/api/v2/torrents/setCategory" \
      -b /tmp/qb-cookie.txt \
      -d "hashes=$hash&category=$category"
  done
```

### Workflow: Clean Stalled Torrents

```bash
# Delete torrents stalled for more than 7 days
curl -s "$QBITTORRENT_URL/api/v2/torrents/info" \
  -b /tmp/qb-cookie.txt | \
  jq -r '.[] | select(.state == "stalledDL" or .state == "stalledUP") | "\(.hash)|\(.name)"' | \
  while IFS='|' read hash name; do
    echo "Deleting stalled torrent: $name"
    curl -X POST "$QBITTORRENT_URL/api/v2/torrents/delete" \
      -b /tmp/qb-cookie.txt \
      -d "hashes=$hash&deleteFiles=false"
  done
```
