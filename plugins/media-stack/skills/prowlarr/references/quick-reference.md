# Prowlarr Quick Reference

Common operations for quick copy-paste usage.

## Setup

Add to `~/.claude-homelab/.env`:

```bash
PROWLARR_URL="http://localhost:9696"
PROWLARR_API_KEY="your-api-key"
```

The examples below use these environment variables.

## System Information

### Get System Status

```bash
curl -s "$PROWLARR_URL/api/v1/system/status" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

## Indexer Management

### Get All Indexers

```bash
curl -s "$PROWLARR_URL/api/v1/indexer" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.[] | {id, name, enable, protocol}'
```

### Get Indexer by ID

```bash
curl -s "$PROWLARR_URL/api/v1/indexer/1" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

### Get Indexer Schema (Available Indexers)

```bash
curl -s "$PROWLARR_URL/api/v1/indexer/schema" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.[] | {implementationName, protocol}'
```

### Add Indexer

```bash
curl -X POST "$PROWLARR_URL/api/v1/indexer" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "1337x",
    "implementationName": "1337x",
    "implementation": "1337x",
    "configContract": "1337xSettings",
    "protocol": "torrent",
    "priority": 25,
    "enable": true,
    "fields": []
  }'
```

### Update Indexer

```bash
curl -X PUT "$PROWLARR_URL/api/v1/indexer/1" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "enable": false
  }'
```

### Test Indexer

```bash
curl -X POST "$PROWLARR_URL/api/v1/indexer/test" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1
  }'
```

### Delete Indexer

```bash
curl -X DELETE "$PROWLARR_URL/api/v1/indexer/1" \
  -H "X-Api-Key: $PROWLARR_API_KEY"
```

## Search

### Search All Indexers

```bash
curl -s "$PROWLARR_URL/api/v1/search?query=ubuntu&type=search" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.[] | {title, indexer, seeders, size}'
```

### Search Specific Indexer

```bash
curl -s "$PROWLARR_URL/api/v1/search?query=ubuntu&indexerIds=1" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

### Movie Search (TMDB)

```bash
curl -s "$PROWLARR_URL/api/v1/search?query=inception&type=movie&tmdbId=27205" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

### TV Search (TVDB)

```bash
curl -s "$PROWLARR_URL/api/v1/search?query=breaking%20bad&type=tvsearch&tvdbId=81189" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

## Applications (Sonarr/Radarr Sync)

### Get All Applications

```bash
curl -s "$PROWLARR_URL/api/v1/applications" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.[] | {id, name, implementation, syncLevel}'
```

### Add Application (Sonarr)

```bash
curl -X POST "$PROWLARR_URL/api/v1/applications" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Sonarr",
    "implementation": "Sonarr",
    "configContract": "SonarrSettings",
    "syncLevel": "fullSync",
    "fields": [
      {"name": "baseUrl", "value": "http://sonarr:8989"},
      {"name": "apiKey", "value": "SONARR_API_KEY"},
      {"name": "syncCategories", "value": [5000, 5030, 5040]}
    ]
  }'
```

### Add Application (Radarr)

```bash
curl -X POST "$PROWLARR_URL/api/v1/applications" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Radarr",
    "implementation": "Radarr",
    "configContract": "RadarrSettings",
    "syncLevel": "fullSync",
    "fields": [
      {"name": "baseUrl", "value": "http://radarr:7878"},
      {"name": "apiKey", "value": "RADARR_API_KEY"},
      {"name": "syncCategories", "value": [2000, 2040, 2050]}
    ]
  }'
```

### Test Application

```bash
curl -X POST "$PROWLARR_URL/api/v1/applications/test" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1
  }'
```

### Sync Applications

```bash
curl -X POST "$PROWLARR_URL/api/v1/command" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "ApplicationSync"
  }'
```

## Download Clients

### Get All Download Clients

```bash
curl -s "$PROWLARR_URL/api/v1/downloadclient" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.[] | {id, name, implementation, protocol}'
```

### Add Download Client (qBittorrent)

```bash
curl -X POST "$PROWLARR_URL/api/v1/downloadclient" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "qBittorrent",
    "implementation": "QBittorrent",
    "configContract": "QBittorrentSettings",
    "protocol": "torrent",
    "fields": [
      {"name": "host", "value": "qbittorrent"},
      {"name": "port", "value": 8080},
      {"name": "username", "value": "admin"},
      {"name": "password", "value": "adminpass"}
    ]
  }'
```

## Statistics

### Get Indexer Stats

```bash
curl -s "$PROWLARR_URL/api/v1/indexerstats" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.indexers[] | {indexerName, averageResponseTime, numberOfQueries, numberOfGrabs}'
```

## History

### Get Recent History

```bash
curl -s "$PROWLARR_URL/api/v1/history?page=1&pageSize=20" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.records[] | {date, eventType, indexer: .indexer.name}'
```

### Get History by Indexer

```bash
curl -s "$PROWLARR_URL/api/v1/history?indexerId=1" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

## Tags

### Get All Tags

```bash
curl -s "$PROWLARR_URL/api/v1/tag" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

### Create Tag

```bash
curl -X POST "$PROWLARR_URL/api/v1/tag" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "label": "public-trackers"
  }'
```

## Notifications

### Get All Notifications

```bash
curl -s "$PROWLARR_URL/api/v1/notification" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq '.[] | {id, name, implementation}'
```

## Workflows

### Workflow: Add Indexer and Sync to Apps

1. **Get available indexer schemas:**
   ```bash
   curl -s "$PROWLARR_URL/api/v1/indexer/schema" \
     -H "X-Api-Key: $PROWLARR_API_KEY" | \
     jq '.[] | select(.implementationName == "1337x")'
   ```

2. **Add indexer:**
   ```bash
   curl -X POST "$PROWLARR_URL/api/v1/indexer" \
     -H "X-Api-Key: $PROWLARR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "name": "1337x",
       "implementationName": "1337x",
       "implementation": "1337x",
       "configContract": "1337xSettings",
       "protocol": "torrent",
       "priority": 25,
       "enable": true,
       "fields": []
     }' | jq '.id'
   ```

3. **Sync to applications:**
   ```bash
   curl -X POST "$PROWLARR_URL/api/v1/command" \
     -H "X-Api-Key: $PROWLARR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"name": "ApplicationSync"}'
   ```

### Workflow: Test All Indexers

```bash
curl -s "$PROWLARR_URL/api/v1/indexer" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | \
  jq -r '.[].id' | \
  while read indexer_id; do
    echo "Testing indexer ID $indexer_id"
    curl -X POST "$PROWLARR_URL/api/v1/indexer/test" \
      -H "X-Api-Key: $PROWLARR_API_KEY" \
      -H "Content-Type: application/json" \
      -d "{\"id\": $indexer_id}" 2>&1 | \
      grep -q "200" && echo "  ✓ Passed" || echo "  ✗ Failed"
    sleep 1
  done
```

### Workflow: Disable All Failed Indexers

```bash
# Get indexer stats and disable those with errors
curl -s "$PROWLARR_URL/api/v1/indexerstats" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | \
  jq -r '.indexers[] | select(.numberOfFailures > 5) | .indexerId' | \
  while read indexer_id; do
    echo "Disabling indexer ID $indexer_id due to failures"

    # Get current indexer config
    indexer=$(curl -s "$PROWLARR_URL/api/v1/indexer/$indexer_id" \
      -H "X-Api-Key: $PROWLARR_API_KEY")

    # Update to disable
    echo "$indexer" | jq '.enable = false' | \
    curl -X PUT "$PROWLARR_URL/api/v1/indexer/$indexer_id" \
      -H "X-Api-Key: $PROWLARR_API_KEY" \
      -H "Content-Type: application/json" \
      -d @-
  done
```

### Workflow: Bulk Import Indexers from List

```bash
# Example: Import multiple public trackers
INDEXERS=("1337x" "EZTV" "ThePirateBay" "RARBG")

for indexer_name in "${INDEXERS[@]}"; do
  echo "Adding $indexer_name"

  curl -X POST "$PROWLARR_URL/api/v1/indexer" \
    -H "X-Api-Key: $PROWLARR_API_KEY" \
    -H "Content-Type: application/json" \
    -d "{
      \"name\": \"$indexer_name\",
      \"implementationName\": \"$indexer_name\",
      \"implementation\": \"$indexer_name\",
      \"configContract\": \"${indexer_name}Settings\",
      \"protocol\": \"torrent\",
      \"priority\": 25,
      \"enable\": true,
      \"fields\": []
    }"

  sleep 1
done

# Sync to applications
curl -X POST "$PROWLARR_URL/api/v1/command" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"name": "ApplicationSync"}'
```

### Workflow: Search Comparison Across Indexers

```bash
QUERY="ubuntu"

# Get all enabled indexers
indexers=$(curl -s "$PROWLARR_URL/api/v1/indexer" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | \
  jq -r '.[] | select(.enable == true) | .id')

# Search each indexer
for indexer_id in $indexers; do
  indexer_name=$(curl -s "$PROWLARR_URL/api/v1/indexer/$indexer_id" \
    -H "X-Api-Key: $PROWLARR_API_KEY" | jq -r '.name')

  echo "Searching $indexer_name (ID: $indexer_id)"

  results=$(curl -s "$PROWLARR_URL/api/v1/search?query=$QUERY&indexerIds=$indexer_id" \
    -H "X-Api-Key: $PROWLARR_API_KEY" | jq 'length')

  echo "  Found $results results"
  echo ""
done
```
