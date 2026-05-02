# Overseerr Quick Reference

Common operations for quick copy-paste usage.

## Setup

Add to `~/.claude-homelab/.env`:

```bash
OVERSEERR_URL="http://localhost:5055"
OVERSEERR_API_KEY="your-api-key"
```

Scripts automatically load credentials from `.env` file.

## User Authentication

### Get Current User

```bash
curl -s "$OVERSEERR_URL/api/v1/auth/me" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq
```

## Media Requests

### Search for Movie

```bash
curl -s "$OVERSEERR_URL/api/v1/search?query=inception&page=1" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[] | {title, mediaType, tmdbId}'
```

### Request Movie

```bash
curl -X POST "$OVERSEERR_URL/api/v1/request" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "mediaType": "movie",
    "mediaId": 27205,
    "is4k": false
  }'
```

### Request TV Show (Entire Series)

```bash
curl -X POST "$OVERSEERR_URL/api/v1/request" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "mediaType": "tv",
    "mediaId": 1396,
    "seasons": "all",
    "is4k": false
  }'
```

### Request Specific TV Season

```bash
curl -X POST "$OVERSEERR_URL/api/v1/request" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "mediaType": "tv",
    "mediaId": 1396,
    "seasons": [1, 2],
    "is4k": false
  }'
```

### Get All Requests

```bash
curl -s "$OVERSEERR_URL/api/v1/request?take=20&skip=0" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[] | {id, status, media: .media.tmdbId, type: .type}'
```

### Get Request Status

```bash
curl -s "$OVERSEERR_URL/api/v1/request/123" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.status'
```

### Approve Request

```bash
curl -X POST "$OVERSEERR_URL/api/v1/request/123/approve" \
  -H "X-Api-Key: $OVERSEERR_API_KEY"
```

### Decline Request

```bash
curl -X POST "$OVERSEERR_URL/api/v1/request/123/decline" \
  -H "X-Api-Key: $OVERSEERR_API_KEY"
```

### Delete Request

```bash
curl -X DELETE "$OVERSEERR_URL/api/v1/request/123" \
  -H "X-Api-Key: $OVERSEERR_API_KEY"
```

## Media Information

### Get Movie Details

```bash
curl -s "$OVERSEERR_URL/api/v1/movie/27205" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '{title, status, overview, releaseDate}'
```

### Get TV Show Details

```bash
curl -s "$OVERSEERR_URL/api/v1/tv/1396" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '{name, status, overview, firstAirDate}'
```

### Get Season Details

```bash
curl -s "$OVERSEERR_URL/api/v1/tv/1396/season/1" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq
```

## Discover Content

### Get Popular Movies

```bash
curl -s "$OVERSEERR_URL/api/v1/discover/movies?page=1&sortBy=popularity.desc" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[] | {title, releaseDate}'
```

### Get Popular TV Shows

```bash
curl -s "$OVERSEERR_URL/api/v1/discover/tv?page=1&sortBy=popularity.desc" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[] | {name, firstAirDate}'
```

### Get Upcoming Movies

```bash
curl -s "$OVERSEERR_URL/api/v1/discover/movies/upcoming?page=1" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[] | {title, releaseDate}'
```

### Get Trending Content

```bash
curl -s "$OVERSEERR_URL/api/v1/discover/trending?page=1" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[] | {title, mediaType}'
```

## User Management

### Get All Users

```bash
curl -s "$OVERSEERR_URL/api/v1/user?take=100&skip=0" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[] | {id, email, displayName, requestCount}'
```

### Get User by ID

```bash
curl -s "$OVERSEERR_URL/api/v1/user/1" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq
```

### Update User Permissions

```bash
curl -X PUT "$OVERSEERR_URL/api/v1/user/1" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "permissions": 2
  }'
```

### Delete User

```bash
curl -X DELETE "$OVERSEERR_URL/api/v1/user/1" \
  -H "X-Api-Key: $OVERSEERR_API_KEY"
```

## Settings

### Get Public Settings

```bash
curl -s "$OVERSEERR_URL/api/v1/settings/public" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq
```

### Get Main Settings

```bash
curl -s "$OVERSEERR_URL/api/v1/settings/main" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq
```

## Status & Health

### Get Server Status

```bash
curl -s "$OVERSEERR_URL/api/v1/status" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq
```

### Get Appdata Status

```bash
curl -s "$OVERSEERR_URL/api/v1/status/appdata" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | jq
```

## Workflows

### Workflow: Search, Request, and Monitor Movie

1. **Search for movie:**
   ```bash
   curl -s "$OVERSEERR_URL/api/v1/search?query=inception" \
     -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.results[0] | {title, tmdbId, mediaType}'
   ```

2. **Request the movie:**
   ```bash
   curl -X POST "$OVERSEERR_URL/api/v1/request" \
     -H "X-Api-Key: $OVERSEERR_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "mediaType": "movie",
       "mediaId": 27205,
       "is4k": false
     }' | jq '.id'
   ```

3. **Check request status:**
   ```bash
   curl -s "$OVERSEERR_URL/api/v1/request/123" \
     -H "X-Api-Key: $OVERSEERR_API_KEY" | jq '.status'
   ```

### Workflow: Batch Request TV Show Seasons

```bash
# Request Breaking Bad seasons 1-5
for season in {1..5}; do
  curl -X POST "$OVERSEERR_URL/api/v1/request" \
    -H "X-Api-Key: $OVERSEERR_API_KEY" \
    -H "Content-Type: application/json" \
    -d "{
      \"mediaType\": \"tv\",
      \"mediaId\": 1396,
      \"seasons\": [$season],
      \"is4k\": false
    }"
  sleep 1
done
```

### Workflow: Auto-Approve All Pending Requests

```bash
# Get all pending requests
curl -s "$OVERSEERR_URL/api/v1/request?filter=pending" \
  -H "X-Api-Key: $OVERSEERR_API_KEY" | \
  jq -r '.results[].id' | \
  while read id; do
    echo "Approving request $id"
    curl -X POST "$OVERSEERR_URL/api/v1/request/$id/approve" \
      -H "X-Api-Key: $OVERSEERR_API_KEY"
  done
```
