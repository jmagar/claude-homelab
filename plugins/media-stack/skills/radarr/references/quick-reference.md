# Radarr Quick Reference

Common operations for quick copy-paste usage.

## Setup

```bash
export RADARR_URL="http://localhost:7878"
export RADARR_API_KEY="your-api-key"
```

## System Information

### Get System Status

```bash
curl -s "$RADARR_URL/api/v3/system/status" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq
```

### Get Disk Space

```bash
curl -s "$RADARR_URL/api/v3/diskspace" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq
```

## Movie Management

### Get All Movies

```bash
curl -s "$RADARR_URL/api/v3/movie" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {id, title, year, hasFile, monitored}'
```

### Get Movie by ID

```bash
curl -s "$RADARR_URL/api/v3/movie/1" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq
```

### Search for Movie

```bash
curl -s "$RADARR_URL/api/v3/movie/lookup?term=inception" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {title, tmdbId, year}'
```

### Add Movie

```bash
curl -X POST "$RADARR_URL/api/v3/movie" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Inception",
    "qualityProfileId": 1,
    "titleSlug": "inception-2010",
    "tmdbId": 27205,
    "path": "/movies/Inception (2010)",
    "monitored": true,
    "addOptions": {
      "searchForMovie": true
    }
  }'
```

### Update Movie (Toggle Monitoring)

```bash
curl -X PUT "$RADARR_URL/api/v3/movie/1" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "monitored": false
  }'
```

### Delete Movie

```bash
curl -X DELETE "$RADARR_URL/api/v3/movie/1?deleteFiles=false&addImportExclusion=false" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

## Queue & Downloads

### Get Queue (Active Downloads)

```bash
curl -s "$RADARR_URL/api/v3/queue" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.records[] | {title, status, sizeleft, timeleft}'
```

### Delete Queue Item

```bash
curl -X DELETE "$RADARR_URL/api/v3/queue/1?removeFromClient=true&blocklist=false" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

## Search & Download

### Search for Movie

```bash
curl -X POST "$RADARR_URL/api/v3/command" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "MoviesSearch",
    "movieIds": [1]
  }'
```

### Manual Search (Get Release List)

```bash
curl -s "$RADARR_URL/api/v3/release?movieId=1" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {title, size, quality, indexer}'
```

### Download Release

```bash
curl -X POST "$RADARR_URL/api/v3/release" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "guid": "release-guid-from-manual-search",
    "indexerId": 1
  }'
```

## Calendar

### Get Upcoming Movies (In Cinemas)

```bash
START=$(date -u +%Y-%m-%d)
END=$(date -u -d '+30 days' +%Y-%m-%d)
curl -s "$RADARR_URL/api/v3/calendar?start=$START&end=$END" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {title, inCinemas, physicalRelease}'
```

## History

### Get Recent History

```bash
curl -s "$RADARR_URL/api/v3/history?page=1&pageSize=20" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.records[] | {date, eventType, movie: .movie.title}'
```

## Quality Profiles

### Get All Quality Profiles

```bash
curl -s "$RADARR_URL/api/v3/qualityprofile" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {id, name}'
```

## Root Folders

### Get Root Folders

```bash
curl -s "$RADARR_URL/api/v3/rootfolder" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {id, path, freeSpace}'
```

## Import Lists

### Get All Import Lists

```bash
curl -s "$RADARR_URL/api/v3/importlist" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {id, name, enabled}'
```

### Trigger Import List Sync

```bash
curl -X POST "$RADARR_URL/api/v3/command" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "ImportListSync"
  }'
```

## Collections

### Get All Collections

```bash
curl -s "$RADARR_URL/api/v3/collection" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq '.[] | {id, title, monitored}'
```

### Update Collection

```bash
curl -X PUT "$RADARR_URL/api/v3/collection/1" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "monitored": true,
    "searchOnAdd": true
  }'
```

## Workflows

### Workflow: Add Movie and Search

1. **Search for movie:**
   ```bash
   curl -s "$RADARR_URL/api/v3/movie/lookup?term=inception" \
     -H "X-Api-Key: $RADARR_API_KEY" | jq '.[0] | {title, tmdbId, year}'
   ```

2. **Add movie with search:**
   ```bash
   curl -X POST "$RADARR_URL/api/v3/movie" \
     -H "X-Api-Key: $RADARR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "title": "Inception",
       "qualityProfileId": 1,
       "titleSlug": "inception-2010",
       "tmdbId": 27205,
       "path": "/movies/Inception (2010)",
       "monitored": true,
       "addOptions": {
         "searchForMovie": true
       }
     }' | jq '.id'
   ```

3. **Check queue for download:**
   ```bash
   curl -s "$RADARR_URL/api/v3/queue" \
     -H "X-Api-Key: $RADARR_API_KEY" | jq '.records[] | {title, status}'
   ```

### Workflow: Refresh All Movies

```bash
curl -X POST "$RADARR_URL/api/v3/command" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"name": "RefreshMovie"}'
```

### Workflow: Batch Add Movies from List

```bash
# Example: Add all movies from a TMDB list
curl -s "https://api.themoviedb.org/3/list/<your_list_id>?api_key=<your_tmdb_key>" | \
  jq -r '.items[] | @json' | \
  while read movie; do
    tmdb_id=$(echo "$movie" | jq -r '.id')
    title=$(echo "$movie" | jq -r '.title')
    year=$(echo "$movie" | jq -r '.release_date' | cut -d'-' -f1)

    echo "Adding: $title ($year)"

    curl -X POST "$RADARR_URL/api/v3/movie" \
      -H "X-Api-Key: $RADARR_API_KEY" \
      -H "Content-Type: application/json" \
      -d "{
        \"title\": \"$title\",
        \"qualityProfileId\": 1,
        \"titleSlug\": \"$(echo $title | tr '[:upper:]' '[:lower:]' | tr ' ' '-')-$year\",
        \"tmdbId\": $tmdb_id,
        \"path\": \"/movies/$title ($year)\",
        \"monitored\": true,
        \"addOptions\": {
          \"searchForMovie\": false
        }
      }"
    sleep 1
  done
```

### Workflow: Monitor Entire Collection

```bash
# Get collection ID
collection_id=$(curl -s "$RADARR_URL/api/v3/collection" \
  -H "X-Api-Key: $RADARR_API_KEY" | \
  jq -r '.[] | select(.title == "The Matrix Collection") | .id')

# Monitor collection
curl -X PUT "$RADARR_URL/api/v3/collection/$collection_id" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d "{
    \"id\": $collection_id,
    \"monitored\": true,
    \"searchOnAdd\": true
  }"
```

### Workflow: Clean Up Failed Downloads

```bash
# Get failed items from queue
curl -s "$RADARR_URL/api/v3/queue" \
  -H "X-Api-Key: $RADARR_API_KEY" | \
  jq -r '.records[] | select(.status == "failed") | .id' | \
  while read queue_id; do
    echo "Removing failed item $queue_id"
    curl -X DELETE "$RADARR_URL/api/v3/queue/$queue_id?removeFromClient=true&blocklist=true" \
      -H "X-Api-Key: $RADARR_API_KEY"
  done
```

### Workflow: Upgrade Movies Below Quality Cutoff

```bash
# Get movies that can be upgraded
curl -s "$RADARR_URL/api/v3/wanted/cutoff?pageSize=100" \
  -H "X-Api-Key: $RADARR_API_KEY" | \
  jq -r '.records[].id' | \
  while read movie_id; do
    echo "Searching for upgrades for movie ID $movie_id"
    curl -X POST "$RADARR_URL/api/v3/command" \
      -H "X-Api-Key: $RADARR_API_KEY" \
      -H "Content-Type: application/json" \
      -d "{
        \"name\": \"MoviesSearch\",
        \"movieIds\": [$movie_id]
      }"
    sleep 2
  done
```
