# Plex Media Server API Reference

**API Version:** N/A (versioned by server release)
**Base URL:** `http://localhost:32400` (or your Plex server address)
**Authentication:** X-Plex-Token header
**Last Updated:** 2026-02-01

## Authentication

Plex uses token-based authentication. You can obtain your token from:
- Plex Web App → Settings → Account → scroll to bottom → Show Advanced → "Get Token"
- Or by logging in via the API and extracting from response

```bash
-H "X-Plex-Token: <your_plex_token>"
```

### Get Token via API

```bash
# Login to get authentication token
curl -X POST "https://plex.tv/users/sign_in.json" \
  -H "X-Plex-Client-Identifier: unique-client-id" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "user[login]=your-email@example.com&user[password]=yourpassword"
```

## Quick Start

```bash
# Set environment variables
export PLEX_URL="http://localhost:32400"
export PLEX_TOKEN="your-plex-token"

# Test connection - get server identity
curl -s "$PLEX_URL/identity" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

## Required Headers

All requests should include:
```bash
-H "X-Plex-Token: $PLEX_TOKEN"
-H "X-Plex-Client-Identifier: unique-client-id"
-H "Accept: application/json"
```

## Endpoints by Category

### Server Information

#### GET /

Get server capabilities and details.

**Example Request:**
```bash
curl -s "$PLEX_URL/?X-Plex-Token=$PLEX_TOKEN" \
  -H "Accept: application/json" | jq
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized

---

#### GET /identity

Get server identity information.

**Example Request:**
```bash
curl -s "$PLEX_URL/identity" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Example Response:**
```json
{
  "MediaContainer": {
    "size": 0,
    "claimed": true,
    "machineIdentifier": "abc123",
    "version": "1.40.0.8157"
  }
}
```

**Response Codes:**
- `200`: Success

---

### Libraries

#### GET /library/sections

Get all library sections.

**Example Request:**
```bash
curl -s "$PLEX_URL/library/sections" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Example Response:**
```json
{
  "MediaContainer": {
    "size": 3,
    "Directory": [
      {
        "key": "1",
        "type": "movie",
        "title": "Movies",
        "agent": "tv.plex.agents.movie",
        "scanner": "Plex Movie",
        "language": "en-US",
        "Location": [{"path": "/data/movies"}]
      },
      {
        "key": "2",
        "type": "show",
        "title": "TV Shows",
        "agent": "tv.plex.agents.series",
        "scanner": "Plex TV Series"
      }
    ]
  }
}
```

**Response Codes:**
- `200`: Success

---

#### GET /library/sections/{id}/all

Get all items in a library section.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Library section ID |
| X-Plex-Container-Start (query) | integer | No | Pagination start |
| X-Plex-Container-Size (query) | integer | No | Page size |

**Example Request:**
```bash
# Get all movies from library 1
curl -s "$PLEX_URL/library/sections/1/all" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success
- `404`: Library not found

---

#### GET /library/sections/{id}/refresh

Refresh library section (scan for new media).

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Library section ID |

**Example Request:**
```bash
curl -X GET "$PLEX_URL/library/sections/1/refresh" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

**Response Codes:**
- `200`: Refresh initiated

---

#### GET /library/recentlyAdded

Get recently added media across all libraries.

**Example Request:**
```bash
curl -s "$PLEX_URL/library/recentlyAdded" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success

---

### Media

#### GET /library/metadata/{ratingKey}

Get metadata for specific media item.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| ratingKey (path) | integer | Yes | Media item rating key |

**Example Request:**
```bash
curl -s "$PLEX_URL/library/metadata/12345" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success
- `404`: Media not found

---

#### GET /library/metadata/{ratingKey}/children

Get children of media item (e.g., seasons of a show).

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| ratingKey (path) | integer | Yes | Parent item rating key |

**Example Request:**
```bash
# Get seasons for a TV show
curl -s "$PLEX_URL/library/metadata/12345/children" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success

---

#### PUT /library/metadata/{ratingKey}

Update metadata for media item.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| ratingKey (path) | integer | Yes | Media item rating key |
| title.value (query) | string | No | New title |
| summary.value (query) | string | No | New summary |

**Example Request:**
```bash
curl -X PUT "$PLEX_URL/library/metadata/12345?title.value=New%20Title" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

**Response Codes:**
- `200`: Updated
- `404`: Media not found

---

#### DELETE /library/metadata/{ratingKey}

Delete media item from library.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| ratingKey (path) | integer | Yes | Media item rating key |

**Example Request:**
```bash
curl -X DELETE "$PLEX_URL/library/metadata/12345" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

**Response Codes:**
- `200`: Deleted

---

### Playback

#### GET /status/sessions

Get currently playing sessions.

**Example Request:**
```bash
curl -s "$PLEX_URL/status/sessions" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Example Response:**
```json
{
  "MediaContainer": {
    "size": 1,
    "Metadata": [
      {
        "ratingKey": "12345",
        "key": "/library/metadata/12345",
        "type": "movie",
        "title": "Inception",
        "Player": {
          "address": "192.168.1.100",
          "device": "Chrome",
          "state": "playing",
          "title": "Living Room"
        },
        "Session": {
          "id": "abc123",
          "bandwidth": 4000,
          "location": "lan"
        },
        "User": {
          "title": "JohnDoe"
        }
      }
    ]
  }
}
```

**Response Codes:**
- `200`: Success

---

#### POST /player/playback/stop

Stop playback on a client.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| sessionId (query) | string | Yes | Session ID from /status/sessions |

**Example Request:**
```bash
curl -X POST "$PLEX_URL/player/playback/stop?sessionId=abc123" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

**Response Codes:**
- `200`: Playback stopped

---

### Search

#### GET /search

Search across all libraries.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| query (query) | string | Yes | Search query |
| limit (query) | integer | No | Max results per type |

**Example Request:**
```bash
curl -s "$PLEX_URL/search?query=inception" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success

---

#### GET /hubs/search

Search with categorized results.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| query (query) | string | Yes | Search query |

**Example Request:**
```bash
curl -s "$PLEX_URL/hubs/search?query=avengers" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success

---

### Playlists

#### GET /playlists

Get all playlists.

**Example Request:**
```bash
curl -s "$PLEX_URL/playlists" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success

---

#### POST /playlists

Create new playlist.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| type (query) | string | Yes | Playlist type (video, audio, photo) |
| title (query) | string | Yes | Playlist title |
| uri (query) | string | Yes | Comma-separated rating keys |

**Example Request:**
```bash
curl -X POST "$PLEX_URL/playlists?type=video&title=Favorites&uri=server://12345/com.plexapp.plugins.library/library/metadata/123,456,789" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

**Response Codes:**
- `200`: Playlist created

---

### Users

#### GET /accounts

Get all user accounts with access to this server.

**Example Request:**
```bash
curl -s "$PLEX_URL/accounts" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized (admin only)

---

### Preferences

#### GET /:/prefs

Get server preferences.

**Example Request:**
```bash
curl -s "$PLEX_URL/:/prefs" \
  -H "X-Plex-Token: $PLEX_TOKEN" | jq
```

**Response Codes:**
- `200`: Success

---

#### PUT /:/prefs

Update server preferences.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| {key} (query) | string | Yes | Preference key=value pairs |

**Example Request:**
```bash
# Disable DLNA
curl -X PUT "$PLEX_URL/:/prefs?DlnaEnabled=0" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

**Response Codes:**
- `200`: Updated

---

### Webhooks

#### POST /:/webhooks

Configure webhook URL.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| url (query) | string | Yes | Webhook URL |

**Example Request:**
```bash
curl -X POST "$PLEX_URL/:/webhooks?url=https://example.com/webhook" \
  -H "X-Plex-Token: $PLEX_TOKEN"
```

**Response Codes:**
- `200`: Webhook configured

---

## Response Format

Plex API returns XML by default. To get JSON responses:
- Add `Accept: application/json` header
- All examples above include this header

## Common Query Parameters

- `X-Plex-Container-Start`: Pagination offset (default: 0)
- `X-Plex-Container-Size`: Page size (default: varies by endpoint)
- `includeGuids`: Include external IDs (TMDB, IMDB, etc.)
- `includeFields`: Comma-separated list of fields to include

## Rate Limiting

Plex.tv API (not local server) has rate limits:
- ~100 requests per minute
- Returns HTTP 429 when exceeded

Local server has no rate limits.

## Version History

| API Version | Doc Version | Date | Changes |
|-------------|-------------|------|---------|
| N/A (Server-versioned) | 1.0.0 | 2026-02-01 | Initial documentation |

## Additional Resources

- [Official API Documentation](https://www.plex.tv/api-documentation/)
- [Unofficial API Documentation](https://github.com/Arcanemagus/plex-api/wiki)
- [Python Plex API](https://github.com/pkkid/python-plexapi)
- [Plex Forum API Category](https://forums.plex.tv/c/api/19)
