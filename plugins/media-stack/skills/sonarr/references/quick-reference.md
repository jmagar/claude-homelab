# Sonarr Quick Reference

Common operations for quick copy-paste usage.

## Setup

Add credentials to `~/.claude-homelab/.env`:

```bash
SONARR_URL="http://localhost:8989"
SONARR_API_KEY="<your_api_key>"
```

Load in scripts:

```bash
source ~/.claude-homelab/.env
```

## System Information

### Get System Status

```bash
curl -s "$SONARR_URL/api/v3/system/status" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

### Get Disk Space

```bash
curl -s "$SONARR_URL/api/v3/diskspace" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

## Series Management

### Get All Series

```bash
curl -s "$SONARR_URL/api/v3/series" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.[] | {id, title, status, monitored}'
```

### Get Series by ID

```bash
curl -s "$SONARR_URL/api/v3/series/1" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

### Search for Series

```bash
curl -s "$SONARR_URL/api/v3/series/lookup?term=breaking%20bad" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.[] | {title, tvdbId, year}'
```

### Add Series

```bash
curl -X POST "$SONARR_URL/api/v3/series" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Breaking Bad",
    "qualityProfileId": 1,
    "titleSlug": "breaking-bad",
    "tvdbId": 81189,
    "path": "/tv/Breaking Bad",
    "monitored": true,
    "seasonFolder": true,
    "addOptions": {
      "searchForMissingEpisodes": true
    }
  }'
```

### Update Series (Toggle Monitoring)

```bash
curl -X PUT "$SONARR_URL/api/v3/series/1" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "monitored": false
  }'
```

### Delete Series

```bash
curl -X DELETE "$SONARR_URL/api/v3/series/1?deleteFiles=false" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

## Episode Management

### Get All Episodes for Series

```bash
curl -s "$SONARR_URL/api/v3/episode?seriesId=1" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.[] | {id, seasonNumber, episodeNumber, title, hasFile}'
```

### Get Episode by ID

```bash
curl -s "$SONARR_URL/api/v3/episode/100" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

### Monitor/Unmonitor Episode

```bash
curl -X PUT "$SONARR_URL/api/v3/episode/100" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 100,
    "monitored": true
  }'
```

## Queue & Downloads

### Get Queue (Active Downloads)

```bash
curl -s "$SONARR_URL/api/v3/queue" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.records[] | {title, status, sizeleft, timeleft}'
```

### Delete Queue Item

```bash
curl -X DELETE "$SONARR_URL/api/v3/queue/1?removeFromClient=true&blocklist=false" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

## Search & Download

### Search for Series Episodes

```bash
curl -X POST "$SONARR_URL/api/v3/command" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "SeriesSearch",
    "seriesId": 1
  }'
```

### Search for Specific Episode

```bash
curl -X POST "$SONARR_URL/api/v3/command" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "EpisodeSearch",
    "episodeIds": [100]
  }'
```

### Manual Search (Get Release List)

```bash
curl -s "$SONARR_URL/api/v3/release?episodeId=100" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.[] | {title, size, quality, indexer}'
```

### Download Release

```bash
curl -X POST "$SONARR_URL/api/v3/release" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "guid": "release-guid-from-manual-search",
    "indexerId": 1
  }'
```

## Calendar

### Get Upcoming Episodes (Next 7 Days)

```bash
START=$(date -u +%Y-%m-%d)
END=$(date -u -d '+7 days' +%Y-%m-%d)
curl -s "$SONARR_URL/api/v3/calendar?start=$START&end=$END" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.[] | {series: .series.title, episode: .title, airDate}'
```

## History

### Get Recent History

```bash
curl -s "$SONARR_URL/api/v3/history?page=1&pageSize=20" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.records[] | {date, eventType, series: .series.title, episode: .episode.title}'
```

## Quality Profiles

### Get All Quality Profiles

```bash
curl -s "$SONARR_URL/api/v3/qualityprofile" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.[] | {id, name}'
```

## Root Folders

### Get Root Folders

```bash
curl -s "$SONARR_URL/api/v3/rootfolder" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq '.[] | {id, path, freeSpace}'
```

## Workflows

### Workflow: Add Series and Search

1. **Search for series:**
   ```bash
   curl -s "$SONARR_URL/api/v3/series/lookup?term=breaking%20bad" \
     -H "X-Api-Key: $SONARR_API_KEY" | jq '.[0] | {title, tvdbId, year}'
   ```

2. **Add series with search:**
   ```bash
   curl -X POST "$SONARR_URL/api/v3/series" \
     -H "X-Api-Key: $SONARR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "title": "Breaking Bad",
       "qualityProfileId": 1,
       "titleSlug": "breaking-bad",
       "tvdbId": 81189,
       "path": "/tv/Breaking Bad",
       "monitored": true,
       "seasonFolder": true,
       "addOptions": {
         "searchForMissingEpisodes": true
       }
     }' | jq '.id'
   ```

3. **Check queue for downloads:**
   ```bash
   curl -s "$SONARR_URL/api/v3/queue" \
     -H "X-Api-Key: $SONARR_API_KEY" | jq '.records[] | {title, status}'
   ```

### Workflow: Refresh All Series

```bash
curl -X POST "$SONARR_URL/api/v3/command" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"name": "RefreshSeries"}'
```

### Workflow: Batch Monitor Seasons

```bash
# Monitor all episodes in season 1 of series ID 1
curl -s "$SONARR_URL/api/v3/episode?seriesId=1" \
  -H "X-Api-Key: $SONARR_API_KEY" | \
  jq -r '.[] | select(.seasonNumber == 1) | .id' | \
  while read episode_id; do
    curl -X PUT "$SONARR_URL/api/v3/episode/$episode_id" \
      -H "X-Api-Key: $SONARR_API_KEY" \
      -H "Content-Type: application/json" \
      -d "{\"id\": $episode_id, \"monitored\": true}"
    sleep 0.5
  done
```

### Workflow: Clean Up Failed Downloads

```bash
# Get failed items from queue
curl -s "$SONARR_URL/api/v3/queue" \
  -H "X-Api-Key: $SONARR_API_KEY" | \
  jq -r '.records[] | select(.status == "failed") | .id' | \
  while read queue_id; do
    echo "Removing failed item $queue_id"
    curl -X DELETE "$SONARR_URL/api/v3/queue/$queue_id?removeFromClient=true&blocklist=true" \
      -H "X-Api-Key: $SONARR_API_KEY"
  done
```
