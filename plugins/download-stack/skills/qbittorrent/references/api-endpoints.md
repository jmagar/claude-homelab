# qBittorrent Web API Reference

**API Version:** 5.0+
**Base URL:** `http://localhost:8080/api/v2`
**Authentication:** Cookie-based (login required)
**Last Updated:** 2026-02-01

## Authentication

qBittorrent uses cookie-based authentication. You must first login to obtain a session cookie (SID).

### Login Flow

1. POST to `/auth/login` with credentials
2. Receive `SID` cookie
3. Include cookie in subsequent requests

**Login Request:**
```bash
# Login and save cookie
curl -X POST "http://localhost:8080/api/v2/auth/login" \
  -d "username=admin&password=adminpass" \
  -c /tmp/qb-cookie.txt

# Use cookie in subsequent requests
curl "http://localhost:8080/api/v2/torrents/info" \
  -b /tmp/qb-cookie.txt
```

## Quick Start

**Prerequisites:** Add credentials to `~/.claude-homelab/.env`:
```bash
QBITTORRENT_URL="http://localhost:8080"
QBITTORRENT_USERNAME="admin"
QBITTORRENT_PASSWORD="yourpassword"
```

**Manual API Access:**
```bash
# Load credentials from .env
source ~/.claude-homelab/.env

# Login
curl -X POST "$QBITTORRENT_URL/api/v2/auth/login" \
  -d "username=$QBITTORRENT_USERNAME&password=$QBITTORRENT_PASSWORD" \
  -c /tmp/qb-cookie.txt

# Get torrent list
curl "$QBITTORRENT_URL/api/v2/torrents/info" \
  -b /tmp/qb-cookie.txt
```

**Using the skill script (recommended):**
```bash
# Script handles authentication automatically
./skills/qbittorrent/scripts/qbit-api.sh list
```

## Endpoints by Category

### Authentication

#### POST /auth/login

Login to qBittorrent.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| username (form) | string | Yes | Username |
| password (form) | string | Yes | Password |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/auth/login" \
  -d "username=admin&password=adminpass" \
  -c /tmp/qb-cookie.txt
```

**Response:**
- Success: `Ok.` (with SID cookie set)
- Failure: `Fails.`

**Response Codes:**
- `200`: Success (check response body)
- `403`: Login failed

---

#### POST /auth/logout

Logout from qBittorrent.

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/auth/logout" \
  -b /tmp/qb-cookie.txt
```

**Response Codes:**
- `200`: Logged out

---

### Application

#### GET /app/version

Get qBittorrent version.

**Example Request:**
```bash
curl "$QB_URL/api/v2/app/version" \
  -b /tmp/qb-cookie.txt
```

**Example Response:**
```
v5.0.1
```

**Response Codes:**
- `200`: Success
- `403`: Not logged in

---

#### GET /app/webapiVersion

Get Web API version.

**Example Request:**
```bash
curl "$QB_URL/api/v2/app/webapiVersion" \
  -b /tmp/qb-cookie.txt
```

**Example Response:**
```
2.11.1
```

**Response Codes:**
- `200`: Success

---

#### GET /app/preferences

Get application preferences.

**Example Request:**
```bash
curl "$QB_URL/api/v2/app/preferences" \
  -b /tmp/qb-cookie.txt | jq
```

**Example Response:**
```json
{
  "dl_limit": 0,
  "up_limit": 0,
  "max_connec": 500,
  "max_uploads": 20,
  "save_path": "/downloads",
  "autorun_enabled": false,
  "alt_dl_limit": 10240
}
```

**Response Codes:**
- `200`: Success

---

#### POST /app/setPreferences

Set application preferences.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| json (body) | string | Yes | JSON string of preferences to set |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/app/setPreferences" \
  -b /tmp/qb-cookie.txt \
  -d 'json={"dl_limit": 5120000}'
```

**Response Codes:**
- `200`: Preferences updated

---

### Torrents

#### GET /torrents/info

Get torrent list.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| filter (query) | string | No | Filter (all, downloading, completed, paused, etc.) |
| category (query) | string | No | Filter by category |
| tag (query) | string | No | Filter by tag |
| sort (query) | string | No | Sort by field (name, size, progress, etc.) |
| reverse (query) | boolean | No | Reverse sort order |
| limit (query) | integer | No | Limit number of results |
| offset (query) | integer | No | Pagination offset |
| hashes (query) | string | No | Filter by hash(es) (pipe-separated) |

**Example Request:**
```bash
# Get all torrents
curl "$QB_URL/api/v2/torrents/info" \
  -b /tmp/qb-cookie.txt | jq

# Get only downloading torrents
curl "$QB_URL/api/v2/torrents/info?filter=downloading" \
  -b /tmp/qb-cookie.txt
```

**Example Response:**
```json
[
  {
    "added_on": 1706472000,
    "amount_left": 134217728,
    "auto_tmm": false,
    "category": "movies",
    "completed": 536870912,
    "dlspeed": 1048576,
    "downloaded": 536870912,
    "eta": 128,
    "hash": "abc123def456",
    "name": "ubuntu-22.04.iso",
    "num_seeds": 15,
    "progress": 0.8,
    "ratio": 0.5,
    "save_path": "/downloads/complete",
    "size": 671088640,
    "state": "downloading",
    "upspeed": 524288
  }
]
```

**Response Codes:**
- `200`: Success

---

#### GET /torrents/properties

Get torrent properties.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| hash (query) | string | Yes | Torrent hash |

**Example Request:**
```bash
curl "$QB_URL/api/v2/torrents/properties?hash=abc123def456" \
  -b /tmp/qb-cookie.txt
```

**Response Codes:**
- `200`: Success
- `404`: Torrent not found

---

#### POST /torrents/add

Add torrent from URL or file.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| urls (form) | string | No | URLs (one per line) |
| torrents (multipart) | file | No | Torrent file(s) |
| savepath (form) | string | No | Download folder |
| category (form) | string | No | Category |
| tags (form) | string | No | Tags (comma-separated) |
| paused (form) | boolean | No | Add in paused state |
| skip_checking (form) | boolean | No | Skip hash check |
| root_folder (form) | boolean | No | Create root folder |

**Example Request (URL):**
```bash
curl -X POST "$QB_URL/api/v2/torrents/add" \
  -b /tmp/qb-cookie.txt \
  -F "urls=magnet:?xt=urn:btih:abc123..." \
  -F "category=movies" \
  -F "paused=false"
```

**Example Request (File):**
```bash
curl -X POST "$QB_URL/api/v2/torrents/add" \
  -b /tmp/qb-cookie.txt \
  -F "torrents=@/path/to/file.torrent" \
  -F "savepath=/downloads/movies"
```

**Response:**
- Success: `Ok.`
- Failure: `Fails.`

**Response Codes:**
- `200`: Success (check response body)
- `415`: Unsupported media type

---

#### POST /torrents/pause

Pause torrents.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| hashes (form) | string | Yes | Torrent hashes (pipe-separated) or "all" |

**Example Request:**
```bash
# Pause specific torrent
curl -X POST "$QB_URL/api/v2/torrents/pause" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=abc123def456"

# Pause all torrents
curl -X POST "$QB_URL/api/v2/torrents/pause" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=all"
```

**Response Codes:**
- `200`: Success

---

#### POST /torrents/resume

Resume torrents.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| hashes (form) | string | Yes | Torrent hashes or "all" |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/torrents/resume" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=abc123def456"
```

**Response Codes:**
- `200`: Success

---

#### POST /torrents/delete

Delete torrents.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| hashes (form) | string | Yes | Torrent hashes or "all" |
| deleteFiles (form) | boolean | No | Also delete files (default: false) |

**Example Request:**
```bash
# Delete torrent but keep files
curl -X POST "$QB_URL/api/v2/torrents/delete" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=abc123def456&deleteFiles=false"

# Delete torrent and files
curl -X POST "$QB_URL/api/v2/torrents/delete" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=abc123def456&deleteFiles=true"
```

**Response Codes:**
- `200`: Success

---

#### POST /torrents/recheck

Recheck torrents.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| hashes (form) | string | Yes | Torrent hashes or "all" |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/torrents/recheck" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=abc123def456"
```

**Response Codes:**
- `200`: Success

---

#### POST /torrents/setCategory

Set torrent category.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| hashes (form) | string | Yes | Torrent hashes |
| category (form) | string | Yes | Category name |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/torrents/setCategory" \
  -b /tmp/qb-cookie.txt \
  -d "hashes=abc123def456&category=movies"
```

**Response Codes:**
- `200`: Success

---

### Transfer

#### GET /transfer/info

Get global transfer info.

**Example Request:**
```bash
curl "$QB_URL/api/v2/transfer/info" \
  -b /tmp/qb-cookie.txt
```

**Example Response:**
```json
{
  "dl_info_speed": 1048576,
  "dl_info_data": 536870912,
  "up_info_speed": 524288,
  "up_info_data": 268435456,
  "dl_rate_limit": 0,
  "up_rate_limit": 0,
  "dht_nodes": 450,
  "connection_status": "connected"
}
```

**Response Codes:**
- `200`: Success

---

#### POST /transfer/setDownloadLimit

Set global download speed limit.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| limit (form) | integer | Yes | Speed limit in bytes/second (0 = unlimited) |

**Example Request:**
```bash
# Set 5 MB/s limit
curl -X POST "$QB_URL/api/v2/transfer/setDownloadLimit" \
  -b /tmp/qb-cookie.txt \
  -d "limit=5242880"
```

**Response Codes:**
- `200`: Success

---

#### POST /transfer/setUploadLimit

Set global upload speed limit.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| limit (form) | integer | Yes | Speed limit in bytes/second (0 = unlimited) |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/transfer/setUploadLimit" \
  -b /tmp/qb-cookie.txt \
  -d "limit=1048576"
```

**Response Codes:**
- `200`: Success

---

### Categories

#### GET /torrents/categories

Get all categories.

**Example Request:**
```bash
curl "$QB_URL/api/v2/torrents/categories" \
  -b /tmp/qb-cookie.txt
```

**Example Response:**
```json
{
  "movies": {
    "name": "movies",
    "savePath": "/downloads/movies"
  },
  "tv": {
    "name": "tv",
    "savePath": "/downloads/tv"
  }
}
```

**Response Codes:**
- `200`: Success

---

#### POST /torrents/createCategory

Create new category.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| category (form) | string | Yes | Category name |
| savePath (form) | string | No | Save path for category |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/torrents/createCategory" \
  -b /tmp/qb-cookie.txt \
  -d "category=anime&savePath=/downloads/anime"
```

**Response Codes:**
- `200`: Category created
- `400`: Category already exists

---

#### POST /torrents/removeCategories

Remove categories.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| categories (form) | string | Yes | Category names (newline-separated) |

**Example Request:**
```bash
curl -X POST "$QB_URL/api/v2/torrents/removeCategories" \
  -b /tmp/qb-cookie.txt \
  -d "categories=anime"
```

**Response Codes:**
- `200`: Categories removed

---

## Filter Values

Torrent filter options for `/torrents/info`:
- `all` - All torrents
- `downloading` - Currently downloading
- `seeding` - Currently seeding
- `completed` - Completed downloads
- `paused` - Paused torrents
- `active` - Active torrents (uploading or downloading)
- `inactive` - Inactive torrents
- `resumed` - Not paused
- `stalled` - Stalled (not downloading/uploading)

## Version History

| API Version | Doc Version | Date | Changes |
|-------------|-------------|------|---------|
| 2.11+ (qBit 5.0+) | 1.0.0 | 2026-02-01 | Initial documentation |

## Additional Resources

- [Official API Documentation](https://github.com/qbittorrent/qBittorrent/wiki/WebUI-API-(qBittorrent-5.0))
- [GitHub Repository](https://github.com/qbittorrent/qBittorrent)
- [Web UI Guide](https://github.com/qbittorrent/qBittorrent/wiki/Web-UI)
