# Radarr API Reference

**API Version:** v3
**Base URL:** `http://localhost:7878/api/v3`
**Authentication:** X-Api-Key header
**Last Updated:** 2026-02-01

## Authentication

Radarr uses API key authentication. Find your API key in Settings → General → Security.

```bash
-H "X-Api-Key: <your_api_key>"
```

## Quick Start

```bash
# Set environment variables
export RADARR_URL="http://localhost:7878"
export RADARR_API_KEY="your-api-key"

# Test connection - get system status
curl -s "$RADARR_URL/api/v3/system/status" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq
```

## Endpoints by Category

### System

#### GET /system/status

Get system status and version information.

**Example Request:**
```bash
curl -s "$RADARR_URL/api/v3/system/status" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

**Example Response:**
```json
{
  "version": "5.2.6.8376",
  "buildTime": "2024-01-15T10:30:00Z",
  "isDebug": false,
  "isProduction": true,
  "isAdmin": true,
  "isUserInteractive": false,
  "startupPath": "/app/radarr/bin",
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

### Movies

#### GET /movie

Get all movies in library.

**Example Request:**
```bash
curl -s "$RADARR_URL/api/v3/movie" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq
```

**Example Response:**
```json
[
  {
    "id": 1,
    "title": "Inception",
    "originalTitle": "Inception",
    "sortTitle": "inception",
    "sizeOnDisk": 15000000000,
    "status": "released",
    "overview": "A thief who steals corporate secrets...",
    "inCinemas": "2010-07-16T00:00:00Z",
    "physicalRelease": "2010-12-07T00:00:00Z",
    "digitalRelease": "2010-11-30T00:00:00Z",
    "images": [],
    "website": "http://www.inceptionmovie.com/",
    "year": 2010,
    "hasFile": true,
    "youTubeTrailerId": "8hP9D6kZseM",
    "studio": "Warner Bros.",
    "path": "/movies/Inception (2010)",
    "qualityProfileId": 1,
    "monitored": true,
    "minimumAvailability": "released",
    "isAvailable": true,
    "folderName": "Inception (2010)",
    "runtime": 148,
    "cleanTitle": "inception",
    "imdbId": "tt1375666",
    "tmdbId": 27205,
    "titleSlug": "inception-2010",
    "certification": "PG-13",
    "genres": ["Action", "Science Fiction", "Thriller"],
    "tags": [],
    "added": "2024-01-01T00:00:00Z",
    "ratings": {
      "imdb": {
        "votes": 2300000,
        "value": 8.8
      },
      "tmdb": {
        "votes": 35000,
        "value": 8.4
      }
    }
  }
]
```

**Response Codes:**
- `200`: Success

---

#### GET /movie/{id}

Get specific movie by ID.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Movie ID |

**Example Request:**
```bash
curl -s "$RADARR_URL/api/v3/movie/1" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

**Response Codes:**
- `200`: Success
- `404`: Movie not found

---

#### POST /movie

Add new movie to library.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tmdbId (body) | integer | Yes | TMDB ID |
| title (body) | string | Yes | Movie title |
| qualityProfileId (body) | integer | Yes | Quality profile ID |
| path (body) | string | Yes | Root folder path |
| monitored (body) | boolean | No | Monitor movie (default: true) |
| minimumAvailability (body) | string | No | announced, inCinemas, released (default) |
| addOptions (body) | object | No | Import options |

**Example Request:**
```bash
curl -X POST "$RADARR_URL/api/v3/movie" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "tmdbId": 27205,
    "title": "Inception",
    "year": 2010,
    "qualityProfileId": 1,
    "path": "/movies/Inception (2010)",
    "monitored": true,
    "minimumAvailability": "released",
    "addOptions": {
      "searchForMovie": true
    }
  }'
```

**Response Codes:**
- `201`: Movie added
- `400`: Bad request
- `409`: Movie already exists

---

#### PUT /movie/{id}

Update movie information.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Movie ID |

**Example Request:**
```bash
curl -X PUT "$RADARR_URL/api/v3/movie/1" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "monitored": false,
    "qualityProfileId": 2,
    "minimumAvailability": "inCinemas"
  }'
```

**Response Codes:**
- `202`: Updated
- `404`: Not found

---

#### DELETE /movie/{id}

Delete movie from library.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Movie ID |
| deleteFiles (query) | boolean | No | Delete files (default: false) |
| addImportExclusion (query) | boolean | No | Add to import exclusions (default: false) |

**Example Request:**
```bash
# Delete movie but keep files
curl -X DELETE "$RADARR_URL/api/v3/movie/1" \
  -H "X-Api-Key: $RADARR_API_KEY"

# Delete movie and files
curl -X DELETE "$RADARR_URL/api/v3/movie/1?deleteFiles=true" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

**Response Codes:**
- `200`: Deleted
- `404`: Not found

---

### Queue

#### GET /queue

Get current download queue.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| page (query) | integer | No | Page number |
| pageSize (query) | integer | No | Items per page |
| includeUnknownMovieItems (query) | boolean | No | Include items without movie match |

**Example Request:**
```bash
curl -s "$RADARR_URL/api/v3/queue" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq
```

**Example Response:**
```json
{
  "page": 1,
  "pageSize": 10,
  "sortKey": "timeleft",
  "sortDirection": "ascending",
  "totalRecords": 3,
  "records": [
    {
      "id": 1,
      "movieId": 1,
      "movie": {
        "title": "Inception"
      },
      "quality": {
        "quality": {
          "name": "Bluray-1080p"
        }
      },
      "size": 15000000000,
      "title": "Inception.2010.1080p.BluRay.x264",
      "sizeleft": 7500000000,
      "timeleft": "00:25:30",
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
| removeFromClient (query) | boolean | No | Remove from download client |
| blocklist (query) | boolean | No | Add to blocklist |

**Example Request:**
```bash
curl -X DELETE "$RADARR_URL/api/v3/queue/1?removeFromClient=true&blocklist=false" \
  -H "X-Api-Key: $RADARR_API_KEY"
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
- `RefreshMovie`: Refresh movie information
- `RescanMovie`: Rescan movie folder
- `MoviesSearch`: Search for all missing movies
- `RssSync`: Sync RSS feeds
- `DownloadedMoviesScan`: Scan download folder

**Example Request (Search for movie):**
```bash
curl -X POST "$RADARR_URL/api/v3/command" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "MoviesSearch",
    "movieIds": [1, 2, 3]
  }'
```

**Example Request (Refresh movie):**
```bash
curl -X POST "$RADARR_URL/api/v3/command" \
  -H "X-Api-Key: $RADARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "RefreshMovie",
    "movieId": 1
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
curl -s "$RADARR_URL/api/v3/qualityprofile" \
  -H "X-Api-Key: $RADARR_API_KEY"
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
curl -s "$RADARR_URL/api/v3/rootfolder" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

**Example Response:**
```json
[
  {
    "id": 1,
    "path": "/movies",
    "accessible": true,
    "freeSpace": 500000000000,
    "totalSpace": 1000000000000,
    "unmappedFolders": []
  }
]
```

**Response Codes:**
- `200`: Success

---

### Calendar

#### GET /calendar

Get upcoming movie releases.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| start (query) | string | No | Start date (ISO 8601) |
| end (query) | string | No | End date (ISO 8601) |
| unmonitored (query) | boolean | No | Include unmonitored (default: false) |

**Example Request:**
```bash
curl -s "$RADARR_URL/api/v3/calendar?start=2026-02-01&end=2026-02-28" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq
```

**Response Codes:**
- `200`: Success

---

### Search

#### GET /movie/lookup

Search for movies.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| term (query) | string | Yes | Search term or tmdb:ID or imdb:ID |

**Example Request:**
```bash
# Search by name
curl -s "$RADARR_URL/api/v3/movie/lookup?term=inception" \
  -H "X-Api-Key: $RADARR_API_KEY" | jq

# Search by TMDB ID
curl -s "$RADARR_URL/api/v3/movie/lookup?term=tmdb:27205" \
  -H "X-Api-Key: $RADARR_API_KEY"

# Search by IMDB ID
curl -s "$RADARR_URL/api/v3/movie/lookup?term=imdb:tt1375666" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

**Response Codes:**
- `200`: Success (returns array, empty if no matches)

---

### History

#### GET /history/movie

Get history for a specific movie.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| movieId (query) | integer | Yes | Movie ID |

**Example Request:**
```bash
curl -s "$RADARR_URL/api/v3/history/movie?movieId=1" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

**Response Codes:**
- `200`: Success

---

### Import Lists

#### GET /importlist

Get all import lists.

**Example Request:**
```bash
curl -s "$RADARR_URL/api/v3/importlist" \
  -H "X-Api-Key: $RADARR_API_KEY"
```

**Response Codes:**
- `200`: Success

---

## Minimum Availability Options

- `announced` - When first announced
- `inCinemas` - When in cinemas
- `released` - When physically/digitally released (recommended)
- `preDB` - When available on preDB

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

- [Official API Documentation](https://radarr.video/docs/api/)
- [GitHub Repository](https://github.com/Radarr/Radarr)
- [Wiki](https://wiki.servarr.com/radarr)
