# SABnzbd API Reference

**API Version:** 4.5+
**Base URL:** `http://localhost:8080/api`
**Authentication:** API key (query parameter or header)
**Last Updated:** 2026-02-01

## Authentication

SABnzbd uses API key authentication. You can find your API key in Config → General → Security.

Two authentication methods:
- **Query Parameter:** `?apikey=<your_api_key>`
- **Header:** `X-API-Key: <your_api_key>` (recommended)

## Quick Start

```bash
# Set environment variables
export SABNZBD_URL="http://localhost:8080"
export SABNZBD_API_KEY="your-api-key"

# Test connection - get version
curl -s "$SABNZBD_URL/api?mode=version&apikey=$SABNZBD_API_KEY"

# Or with header (recommended)
curl -s "$SABNZBD_URL/api?mode=version" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

## API Format

All API requests follow this pattern:
```
/api?mode=COMMAND&apikey=KEY&param1=value1&param2=value2
```

Response format (default JSON):
- Add `&output=json` for JSON (recommended)
- Add `&output=xml` for XML

## Endpoints by Category

### Queue Management

#### mode=queue

Get current download queue status.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| start (query) | integer | No | Start position (pagination) |
| limit (query) | integer | No | Number of items to return |

**Example Request:**
```bash
curl -s "$SABNZBD_URL/api?mode=queue&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Example Response:**
```json
{
  "queue": {
    "status": "Downloading",
    "speed": "5.2 MB/s",
    "speedlimit": "0",
    "speedlimit_abs": "0",
    "paused": false,
    "noofslots_total": 3,
    "noofslots": 3,
    "timeleft": "0:15:32",
    "mb": "450.23",
    "mbleft": "78.45",
    "slots": [
      {
        "nzo_id": "SABnzbd_nzo_abc123",
        "filename": "Ubuntu.22.04.iso",
        "status": "Downloading",
        "mb": "150.50",
        "mbleft": "45.23",
        "percentage": "70",
        "cat": "software",
        "priority": "Normal"
      }
    ]
  }
}
```

**Response Codes:**
- `200`: Success

---

#### mode=addurl

Add NZB by URL.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| name (query) | string | Yes | URL to NZB file or newznab link |
| cat (query) | string | No | Category |
| priority (query) | integer | No | Priority (-100 to 100, Default: 0) |
| pp (query) | integer | No | Post-processing (0=None, 1=Repair, 2=Repair+Unpack, 3=+Delete) |

**Example Request:**
```bash
curl -X POST "$SABNZBD_URL/api?mode=addurl&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" \
  -d "name=http://example.com/file.nzb&cat=movies&priority=1"
```

**Response Codes:**
- `200`: NZB added
- `400`: Invalid URL or parameters

---

#### mode=addfile

Upload NZB file.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| nzbfile (multipart) | file | Yes | NZB file to upload |
| cat (query) | string | No | Category |
| priority (query) | integer | No | Priority |
| pp (query) | integer | No | Post-processing level |

**Example Request:**
```bash
curl -X POST "$SABNZBD_URL/api?mode=addfile&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY" \
  -F "nzbfile=@/path/to/file.nzb" \
  -F "cat=movies"
```

**Response Codes:**
- `200`: File uploaded
- `400`: Invalid file

---

#### mode=pause

Pause the queue.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| value (query) | integer | No | Pause duration in minutes (0 = indefinite) |

**Example Request:**
```bash
# Pause indefinitely
curl -X POST "$SABNZBD_URL/api?mode=pause" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Pause for 30 minutes
curl -X POST "$SABNZBD_URL/api?mode=pause&value=30" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Queue paused

---

#### mode=resume

Resume the queue.

**Example Request:**
```bash
curl -X POST "$SABNZBD_URL/api?mode=resume" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Queue resumed

---

#### mode=queue&name=delete

Delete item from queue.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| value (query) | string | Yes | NZO ID or "all" to clear queue |

**Example Request:**
```bash
# Delete specific item
curl -X POST "$SABNZBD_URL/api?mode=queue&name=delete&value=SABnzbd_nzo_abc123" \
  -H "X-API-Key: $SABNZBD_API_KEY"

# Delete all items
curl -X POST "$SABNZBD_URL/api?mode=queue&name=delete&value=all" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Item deleted

---

#### mode=queue&name=priority

Change item priority.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| value (query) | string | Yes | NZO ID |
| value2 (query) | integer | Yes | New priority (-100 to 100) |

**Example Request:**
```bash
curl -X POST "$SABNZBD_URL/api?mode=queue&name=priority&value=SABnzbd_nzo_abc123&value2=2" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Priority updated

---

### History

#### mode=history

Get download history.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| start (query) | integer | No | Start position |
| limit (query) | integer | No | Number of items (default: all) |
| category (query) | string | No | Filter by category |
| failed_only (query) | integer | No | 1 = only failed downloads |

**Example Request:**
```bash
curl -s "$SABNZBD_URL/api?mode=history&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Example Response:**
```json
{
  "history": {
    "total_size": "15.2 GB",
    "month_size": "5.4 GB",
    "week_size": "1.2 GB",
    "noofslots": 45,
    "slots": [
      {
        "nzo_id": "SABnzbd_nzo_xyz789",
        "name": "Ubuntu.22.04.iso",
        "status": "Completed",
        "category": "software",
        "bytes": "4500000000",
        "fail_message": "",
        "completed": 1706472000,
        "storage": "/downloads/complete/Ubuntu.22.04.iso"
      }
    ]
  }
}
```

**Response Codes:**
- `200`: Success

---

#### mode=history&name=delete

Delete item from history.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| value (query) | string | Yes | NZO ID or "all" to clear history |

**Example Request:**
```bash
curl -X POST "$SABNZBD_URL/api?mode=history&name=delete&value=SABnzbd_nzo_xyz789" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Item deleted

---

### Server Status

#### mode=server_stats

Get server statistics.

**Example Request:**
```bash
curl -s "$SABNZBD_URL/api?mode=server_stats&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Example Response:**
```json
{
  "total": "1250.5 GB",
  "month": "45.2 GB",
  "week": "8.5 GB",
  "day": "1.2 GB",
  "servers": {
    "news.example.com": {
      "total": "1250.5 GB",
      "month": "45.2 GB",
      "week": "8.5 GB",
      "day": "1.2 GB"
    }
  }
}
```

**Response Codes:**
- `200`: Success

---

#### mode=fullstatus

Get complete SABnzbd status (combines queue, history, warnings).

**Example Request:**
```bash
curl -s "$SABNZBD_URL/api?mode=fullstatus&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Success

---

#### mode=version

Get SABnzbd version.

**Example Request:**
```bash
curl -s "$SABNZBD_URL/api?mode=version" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response:**
```
4.5.0
```

**Response Codes:**
- `200`: Success

---

### Configuration

#### mode=get_config

Get current configuration.

**Example Request:**
```bash
curl -s "$SABNZBD_URL/api?mode=get_config&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Success

---

#### mode=set_config

Update configuration settings.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| section (query) | string | Yes | Config section (e.g., "misc", "servers") |
| keyword (query) | string | Yes | Setting name |
| value (query) | string | Yes | New value |

**Example Request:**
```bash
# Set download speed limit to 10 MB/s
curl -X POST "$SABNZBD_URL/api?mode=set_config&section=misc&keyword=speedlimit&value=10240" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Configuration updated

---

#### mode=speedlimit

Set download speed limit.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| value (query) | integer | Yes | Speed limit in KB/s (0 = unlimited) |

**Example Request:**
```bash
# Set 5 MB/s limit
curl -X POST "$SABNZBD_URL/api?mode=speedlimit&value=5120" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Speed limit set

---

### Categories

#### mode=get_cats

Get all categories.

**Example Request:**
```bash
curl -s "$SABNZBD_URL/api?mode=get_cats&output=json" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Example Response:**
```json
{
  "categories": [
    "movies",
    "tv",
    "software",
    "default"
  ]
}
```

**Response Codes:**
- `200`: Success

---

#### mode=set_cat

Assign category to queue item.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| value (query) | string | Yes | NZO ID |
| value2 (query) | string | Yes | Category name |

**Example Request:**
```bash
curl -X POST "$SABNZBD_URL/api?mode=set_cat&value=SABnzbd_nzo_abc123&value2=movies" \
  -H "X-API-Key: $SABNZBD_API_KEY"
```

**Response Codes:**
- `200`: Category assigned

---

## Priority Values

Priority levels for downloads:
- `2` - Force (highest)
- `1` - High
- `0` - Normal (default)
- `-1` - Low
- `-2` - Stop (paused)

## Post-Processing Options

Post-processing levels:
- `0` - None
- `1` - Repair
- `2` - Repair + Unpack
- `3` - Repair + Unpack + Delete source NZB

## Version History

| API Version | Doc Version | Date | Changes |
|-------------|-------------|------|---------|
| 4.5+ | 1.0.0 | 2026-02-01 | Initial documentation |

## Additional Resources

- [Official API Documentation](https://sabnzbd.org/wiki/configuration/4.5/api)
- [GitHub Repository](https://github.com/sabnzbd/sabnzbd)
- [Configuration Guide](https://sabnzbd.org/wiki/configuration/4.5)
