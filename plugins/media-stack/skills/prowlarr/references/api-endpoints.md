# Prowlarr API Reference

**API Version:** v1
**Base URL:** `http://localhost:9696/api/v1`
**Authentication:** X-Api-Key header
**Last Updated:** 2026-02-01

## Authentication

Prowlarr uses API key authentication. Find your API key in Settings → General → Security.

```bash
-H "X-Api-Key: <your_api_key>"
```

## Quick Start

Add to `~/.claude-homelab/.env`:

```bash
PROWLARR_URL="http://localhost:9696"
PROWLARR_API_KEY="your-api-key"
```

Then test the connection:

```bash
# Source .env (or restart your shell)
source ~/.claude-homelab/.env

# Test connection - get system status
curl -s "$PROWLARR_URL/api/v1/system/status" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

## Endpoints by Category

### System

#### GET /system/status

Get system status and version information.

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/system/status" \
  -H "X-Api-Key: $PROWLARR_API_KEY"
```

**Example Response:**
```json
{
  "version": "1.11.4.4173",
  "buildTime": "2024-01-15T10:30:00Z",
  "isDebug": false,
  "isProduction": true,
  "isAdmin": true,
  "isUserInteractive": false,
  "startupPath": "/app/prowlarr/bin",
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

### Indexers

#### GET /indexer

Get all configured indexers.

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/indexer" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

**Example Response:**
```json
[
  {
    "id": 1,
    "name": "The Pirate Bay",
    "fields": [],
    "implementationName": "ThePirateBay",
    "implementation": "ThePirateBay",
    "configContract": "ThePirateBaySettings",
    "infoLink": "https://wiki.servarr.com/prowlarr/supported#thepiratebay",
    "protocol": "torrent",
    "priority": 25,
    "enable": true,
    "redirect": false,
    "supportsRss": true,
    "supportsSearch": true,
    "tags": [],
    "added": "2024-01-01T00:00:00Z",
    "capabilities": {
      "categories": [],
      "supportsRawSearch": true
    }
  }
]
```

**Response Codes:**
- `200`: Success

---

#### GET /indexer/{id}

Get specific indexer by ID.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Indexer ID |

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/indexer/1" \
  -H "X-Api-Key: $PROWLARR_API_KEY"
```

**Response Codes:**
- `200`: Success
- `404`: Indexer not found

---

#### PUT /indexer/{id}

Update indexer configuration.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Indexer ID |

**Example Request:**
```bash
curl -X PUT "$PROWLARR_URL/api/v1/indexer/1" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "id": 1,
    "enable": false,
    "priority": 50
  }'
```

**Response Codes:**
- `202`: Updated
- `404`: Not found

---

#### DELETE /indexer/{id}

Delete indexer.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Indexer ID |

**Example Request:**
```bash
curl -X DELETE "$PROWLARR_URL/api/v1/indexer/1" \
  -H "X-Api-Key: $PROWLARR_API_KEY"
```

**Response Codes:**
- `200`: Deleted
- `404`: Not found

---

#### POST /indexer/test

Test indexer configuration.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (body) | integer | Yes | Indexer ID to test |

**Example Request:**
```bash
curl -X POST "$PROWLARR_URL/api/v1/indexer/test" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"id": 1}'
```

**Response Codes:**
- `200`: Test successful
- `400`: Test failed (check response for errors)

---

### Search

#### GET /search

Search across all enabled indexers.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| query (query) | string | No | Search query |
| type (query) | string | No | search, tvsearch, movie |
| categories (query) | string | No | Comma-separated category IDs |
| indexerIds (query) | string | No | Comma-separated indexer IDs |
| limit (query) | integer | No | Max results per indexer |
| offset (query) | integer | No | Result offset |

**Example Request:**
```bash
# Search all indexers
curl -s "$PROWLARR_URL/api/v1/search?query=ubuntu&type=search" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq

# Search specific indexers
curl -s "$PROWLARR_URL/api/v1/search?query=inception&indexerIds=1,2,3" \
  -H "X-Api-Key: $PROWLARR_API_KEY"
```

**Example Response:**
```json
[
  {
    "guid": "https://example.com/torrent/123",
    "indexerId": 1,
    "indexer": "The Pirate Bay",
    "title": "Ubuntu 22.04 Desktop ISO",
    "publishDate": "2024-01-01T00:00:00Z",
    "size": 3500000000,
    "grabs": 1500,
    "files": 1,
    "seeders": 250,
    "leechers": 15,
    "categories": [8000, 8010],
    "downloadUrl": "magnet:?xt=urn:btih:...",
    "infoUrl": "https://example.com/torrent/123",
    "indexerFlags": [],
    "protocol": "torrent"
  }
]
```

**Response Codes:**
- `200`: Success (returns array, empty if no results)

---

### Applications

#### GET /applications

Get all connected applications (Sonarr, Radarr, etc.).

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/applications" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

**Example Response:**
```json
[
  {
    "id": 1,
    "name": "Sonarr",
    "fields": [],
    "implementationName": "Sonarr",
    "implementation": "Sonarr",
    "configContract": "SonarrSettings",
    "infoLink": "https://wiki.servarr.com/prowlarr/supported#sonarr",
    "tags": [],
    "syncLevel": "addAndRemove"
  }
]
```

**Response Codes:**
- `200`: Success

---

#### POST /applications

Add new application.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| name (body) | string | Yes | Application name |
| implementation (body) | string | Yes | Sonarr, Radarr, Lidarr, Readarr |
| fields (body) | array | Yes | Configuration fields |

**Example Request:**
```bash
curl -X POST "$PROWLARR_URL/api/v1/applications" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Sonarr",
    "implementation": "Sonarr",
    "configContract": "SonarrSettings",
    "fields": [
      {
        "name": "baseUrl",
        "value": "http://localhost:8989"
      },
      {
        "name": "apiKey",
        "value": "your-sonarr-api-key"
      }
    ],
    "syncLevel": "addAndRemove"
  }'
```

**Response Codes:**
- `201`: Application added
- `400`: Bad request

---

#### POST /applications/test

Test application connection.

**Example Request:**
```bash
curl -X POST "$PROWLARR_URL/api/v1/applications/test" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "Sonarr",
    "implementation": "Sonarr",
    "fields": [
      {"name": "baseUrl", "value": "http://localhost:8989"},
      {"name": "apiKey", "value": "test-key"}
    ]
  }'
```

**Response Codes:**
- `200`: Test successful
- `400`: Test failed

---

### History

#### GET /history

Get indexer search history.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| page (query) | integer | No | Page number |
| pageSize (query) | integer | No | Items per page |
| sortKey (query) | string | No | Field to sort by |
| sortDirection (query) | string | No | ascending, descending |

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/history?page=1&pageSize=20" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

**Example Response:**
```json
{
  "page": 1,
  "pageSize": 20,
  "sortKey": "date",
  "sortDirection": "descending",
  "totalRecords": 150,
  "records": [
    {
      "id": 1,
      "indexerId": 1,
      "eventType": "indexerQuery",
      "date": "2026-02-01T10:00:00Z",
      "data": {
        "query": "ubuntu",
        "queryType": "search",
        "categories": [],
        "successful": true,
        "results": 50
      }
    }
  ]
}
```

**Response Codes:**
- `200`: Success

---

### Stats

#### GET /indexerstats

Get indexer statistics.

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/indexerstats" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

**Example Response:**
```json
{
  "indexers": [
    {
      "indexerId": 1,
      "indexerName": "The Pirate Bay",
      "averageResponseTime": 250,
      "numberOfQueries": 1500,
      "numberOfGrabs": 75,
      "numberOfRssQueries": 300,
      "numberOfAuthQueries": 0,
      "numberOfFailedQueries": 5,
      "numberOfFailedGrabs": 2,
      "numberOfFailedRssQueries": 1
    }
  ]
}
```

**Response Codes:**
- `200`: Success

---

### Download Clients

#### GET /downloadclient

Get all configured download clients.

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/downloadclient" \
  -H "X-Api-Key: $PROWLARR_API_KEY" | jq
```

**Response Codes:**
- `200`: Success

---

#### POST /downloadclient

Add new download client.

**Example Request:**
```bash
curl -X POST "$PROWLARR_URL/api/v1/downloadclient" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "name": "qBittorrent",
    "implementation": "QBittorrent",
    "configContract": "QBittorrentSettings",
    "fields": [
      {"name": "host", "value": "localhost"},
      {"name": "port", "value": "8080"},
      {"name": "username", "value": "admin"},
      {"name": "password", "value": "adminpass"}
    ],
    "enable": true,
    "protocol": "torrent",
    "priority": 1
  }'
```

**Response Codes:**
- `201`: Download client added
- `400`: Bad request

---

### Tags

#### GET /tag

Get all tags.

**Example Request:**
```bash
curl -s "$PROWLARR_URL/api/v1/tag" \
  -H "X-Api-Key: $PROWLARR_API_KEY"
```

**Example Response:**
```json
[
  {
    "id": 1,
    "label": "public"
  },
  {
    "id": 2,
    "label": "private"
  }
]
```

**Response Codes:**
- `200`: Success

---

#### POST /tag

Create new tag.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| label (body) | string | Yes | Tag name |

**Example Request:**
```bash
curl -X POST "$PROWLARR_URL/api/v1/tag" \
  -H "X-Api-Key: $PROWLARR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"label": "new-tag"}'
```

**Response Codes:**
- `201`: Tag created
- `400`: Tag already exists

---

## Search Types

- `search` - General text search
- `tvsearch` - TV show search
- `movie` - Movie search
- `music` - Music search
- `book` - Book search

## Sync Levels (Applications)

- `disabled` - Do not sync
- `addOnly` - Only add new indexers
- `addAndRemove` - Add and remove indexers (recommended)
- `fullSync` - Full bidirectional sync

## Pagination

List endpoints support pagination:
- `page`: Page number (1-indexed)
- `pageSize`: Items per page
- `sortKey`: Field to sort by
- `sortDirection`: `ascending` or `descending`

## Version History

| API Version | Doc Version | Date | Changes |
|-------------|-------------|------|---------|
| v1 | 1.0.0 | 2026-02-01 | Initial documentation |

## Additional Resources

- [Official Wiki](https://wiki.servarr.com/prowlarr)
- [GitHub Repository](https://github.com/Prowlarr/Prowlarr)
- [Supported Indexers](https://wiki.servarr.com/prowlarr/supported)
- [Supported Applications](https://wiki.servarr.com/prowlarr/supported-applications)
