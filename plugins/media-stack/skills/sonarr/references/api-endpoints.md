# Sonarr API Reference

**API Version:** v3
**Base URL:** `http://localhost:8989/api/v3`
**Authentication:** X-Api-Key header
**Last Updated:** 2026-02-01

## Authentication

Sonarr uses API key authentication. Find your API key in Settings → General → Security.

```bash
-H "X-Api-Key: <your_api_key>"
```

## Quick Start

Add credentials to `~/.claude-homelab/.env`:

```bash
SONARR_URL="http://localhost:8989"
SONARR_API_KEY="<your_api_key>"
```

Then use in scripts:

```bash
# Load credentials from .env
source ~/.claude-homelab/.env

# Test connection - get system status
curl -s "$SONARR_URL/api/v3/system/status" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

## Endpoints by Category

### System

#### GET /system/status

Get system status and version information.

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/system/status" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Example Response:**
```json
{
  "version": "4.0.0.746",
  "buildTime": "2024-01-15T10:30:00Z",
  "isDebug": false,
  "isProduction": true,
  "isAdmin": true,
  "isUserInteractive": false,
  "startupPath": "/app/sonarr/bin",
  "appData": "/config",
  "osName": "ubuntu",
  "osVersion": "22.04",
  "isMonoRuntime": false,
  "isMono": false,
  "isLinux": true,
  "runtimeVersion": "6.0.25"
}
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized

---

### Series

#### GET /series

Get all series in library.

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/series" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

**Example Response:**
```json
[
  {
    "id": 1,
    "title": "Breaking Bad",
    "sortTitle": "breaking bad",
    "status": "ended",
    "ended": true,
    "overview": "A high school chemistry teacher...",
    "network": "AMC",
    "airTime": "21:00",
    "images": [],
    "seasons": [],
    "year": 2008,
    "path": "/tv/Breaking Bad",
    "qualityProfileId": 1,
    "seasonFolder": true,
    "monitored": true,
    "useSceneNumbering": false,
    "runtime": 45,
    "tvdbId": 81189,
    "tvRageId": 18164,
    "tvMazeId": 169,
    "firstAired": "2008-01-20T00:00:00Z",
    "seriesType": "standard",
    "cleanTitle": "breakingbad",
    "imdbId": "tt0903747",
    "titleSlug": "breaking-bad",
    "certification": "TV-MA",
    "genres": ["Crime", "Drama", "Thriller"],
    "tags": [],
    "added": "2024-01-01T00:00:00Z",
    "ratings": {
      "votes": 1500000,
      "value": 9.5
    }
  }
]
```

**Response Codes:**
- `200`: Success

---

#### GET /series/{id}

Get specific series by ID.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Series ID |

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/series/1" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Response Codes:**
- `200`: Success
- `404`: Series not found

---

#### POST /series

Add new series to library.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tvdbId (body) | integer | Yes | TVDB ID |
| title (body) | string | Yes | Series title |
| qualityProfileId (body) | integer | Yes | Quality profile ID |
| path (body) | string | Yes | Root folder path |
| seasonFolder (body) | boolean | No | Use season folders (default: true) |
| monitored (body) | boolean | No | Monitor series (default: true) |
| addOptions (body) | object | No | Import options |

**Example Request:**
```bash
curl -X POST "$SONARR_URL/api/v3/series" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "tvdbId": 81189,
    "title": "Breaking Bad",
    "qualityProfileId": 1,
    "languageProfileId": 1,
    "path": "/tv/Breaking Bad",
    "seasonFolder": true,
    "monitored": true,
    "addOptions": {
      "searchForMissingEpisodes": true
    }
  }'
```

**Response Codes:**
- `201`: Series added
- `400`: Bad request (invalid data)
- `409`: Series already exists

---

#### PUT /series/{id}

Update series information.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Series ID |

**Example Request:**
```bash
curl -X PUT "$SONARR_URL/api/v3/series/1" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "monitored": false,
    "qualityProfileId": 2
  }'
```

**Response Codes:**
- `202`: Updated
- `404`: Not found

---

#### DELETE /series/{id}

Delete series from library.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Series ID |
| deleteFiles (query) | boolean | No | Delete files (default: false) |

**Example Request:**
```bash
# Delete series but keep files
curl -X DELETE "$SONARR_URL/api/v3/series/1" \
  -H "X-Api-Key: $SONARR_API_KEY"

# Delete series and files
curl -X DELETE "$SONARR_URL/api/v3/series/1?deleteFiles=true" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Response Codes:**
- `200`: Deleted
- `404`: Not found

---

### Episodes

#### GET /episode

Get all episodes.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| seriesId (query) | integer | No | Filter by series ID |

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/episode?seriesId=1" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

**Response Codes:**
- `200`: Success

---

#### GET /episode/{id}

Get specific episode.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Episode ID |

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/episode/123" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Response Codes:**
- `200`: Success
- `404`: Episode not found

---

#### PUT /episode/{id}

Update episode (e.g., mark as monitored).

**Example Request:**
```bash
curl -X PUT "$SONARR_URL/api/v3/episode/123" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"id": 123, "monitored": true}'
```

**Response Codes:**
- `202`: Updated

---

### Queue

#### GET /queue

Get current download queue.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| page (query) | integer | No | Page number |
| pageSize (query) | integer | No | Items per page |

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/queue" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

**Example Response:**
```json
{
  "page": 1,
  "pageSize": 10,
  "sortKey": "timeleft",
  "sortDirection": "ascending",
  "totalRecords": 5,
  "records": [
    {
      "id": 1,
      "seriesId": 1,
      "episodeId": 123,
      "series": {
        "title": "Breaking Bad"
      },
      "episode": {
        "seasonNumber": 1,
        "episodeNumber": 1,
        "title": "Pilot"
      },
      "quality": {
        "quality": {
          "name": "Bluray-1080p"
        }
      },
      "size": 1500000000,
      "title": "Breaking.Bad.S01E01.1080p.BluRay.x264",
      "sizeleft": 750000000,
      "timeleft": "00:15:30",
      "estimatedCompletionTime": "2026-02-01T12:00:00Z",
      "status": "downloading",
      "trackedDownloadStatus": "ok",
      "downloadId": "abc123",
      "protocol": "torrent",
      "downloadClient": "qBittorrent"
    }
  ]
}
```

**Response Codes:**
- `200`: Success

---

#### DELETE /queue/{id}

Remove item from queue.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Queue item ID |
| removeFromClient (query) | boolean | No | Remove from download client (default: true) |
| blocklist (query) | boolean | No | Add to blocklist (default: true) |

**Example Request:**
```bash
curl -X DELETE "$SONARR_URL/api/v3/queue/1?removeFromClient=true&blocklist=false" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Response Codes:**
- `200`: Removed

---

### Command

#### POST /command

Execute command.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| name (body) | string | Yes | Command name |

**Common Commands:**
- `RefreshSeries`: Refresh series information
- `RescanSeries`: Rescan series folder
- `SeriesSearch`: Search for all missing episodes
- `SeasonSearch`: Search for season
- `EpisodeSearch`: Search for specific episode
- `RssSync`: Sync RSS feeds
- `DownloadedEpisodesScan`: Scan download folder

**Example Request (Search for episode):**
```bash
curl -X POST "$SONARR_URL/api/v3/command" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "EpisodeSearch",
    "episodeIds": [123, 124, 125]
  }'
```

**Example Request (Refresh series):**
```bash
curl -X POST "$SONARR_URL/api/v3/command" \
  -H "X-Api-Key: $SONARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "RefreshSeries",
    "seriesId": 1
  }'
```

**Response Codes:**
- `201`: Command queued

---

### Quality Profiles

#### GET /qualityprofile

Get all quality profiles.

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/qualityprofile" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Example Response:**
```json
[
  {
    "id": 1,
    "name": "HD-1080p",
    "upgradeAllowed": true,
    "cutoff": 7,
    "items": [
      {
        "quality": {
          "id": 7,
          "name": "Bluray-1080p"
        },
        "allowed": true
      }
    ]
  }
]
```

**Response Codes:**
- `200`: Success

---

### Root Folders

#### GET /rootfolder

Get all root folders.

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/rootfolder" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Example Response:**
```json
[
  {
    "id": 1,
    "path": "/tv",
    "accessible": true,
    "freeSpace": 500000000000,
    "totalSpace": 1000000000000
  }
]
```

**Response Codes:**
- `200`: Success

---

### Calendar

#### GET /calendar

Get upcoming episodes.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| start (query) | string | No | Start date (ISO 8601) |
| end (query) | string | No | End date (ISO 8601) |

**Example Request:**
```bash
curl -s "$SONARR_URL/api/v3/calendar?start=2026-02-01&end=2026-02-07" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq
```

**Response Codes:**
- `200`: Success

---

### Search

#### GET /series/lookup

Search for series.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| term (query) | string | Yes | Search term or tvdb:ID |

**Example Request:**
```bash
# Search by name
curl -s "$SONARR_URL/api/v3/series/lookup?term=breaking%20bad" \
  -H "X-Api-Key: $SONARR_API_KEY" | jq

# Search by TVDB ID
curl -s "$SONARR_URL/api/v3/series/lookup?term=tvdb:81189" \
  -H "X-Api-Key: $SONARR_API_KEY"
```

**Response Codes:**
- `200`: Success (returns array, empty if no matches)

---

## Pagination

List endpoints support pagination:
- `page`: Page number (1-indexed)
- `pageSize`: Items per page
- `sortKey`: Field to sort by
- `sortDirection`: `ascending` or `descending`

## Version History

| API Version | Doc Version | Date | Changes |
|-------------|-------------|------|---------|
| v3 | 1.0.0 | 2026-02-01 | Initial documentation |

## Additional Resources

- [Official API Documentation](https://sonarr.tv/docs/api/)
- [GitHub Repository](https://github.com/Sonarr/Sonarr)
- [Wiki](https://wiki.servarr.com/sonarr)
