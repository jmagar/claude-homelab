# Linkding API Reference

**API Version:** v1
**Base URL:** `http://localhost:9090/api`
**Authentication:** Token authentication
**Last Updated:** 2026-02-01

## Authentication

Linkding uses token-based authentication. Generate a token from the Settings page in the web UI.

```bash
-H "Authorization: Token <your_api_token>"
```

## Quick Start

Add credentials to `~/.claude-homelab/.env`:
```bash
LINKDING_URL="http://localhost:9090"
LINKDING_API_KEY="your-api-token"
```

Then test connection:
```bash
# Load credentials
source ~/.claude-homelab/.env

# Test connection - list bookmarks
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

## Endpoints by Category

### Bookmarks

#### GET /bookmarks/

List all bookmarks.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| q (query) | string | No | Search query |
| limit (query) | integer | No | Number of results (default: 100) |
| offset (query) | integer | No | Pagination offset |
| archived (query) | boolean | No | Filter by archived status |

**Example Request:**
```bash
curl -s "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

**Example Response:**
```json
{
  "count": 42,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "url": "https://example.com",
      "title": "Example Website",
      "description": "An example bookmark",
      "website_title": "Example Domain",
      "website_description": "Example domain for illustrative examples",
      "tag_names": ["example", "demo"],
      "date_added": "2026-01-15T10:30:00Z",
      "date_modified": "2026-01-15T10:30:00Z",
      "archived": false,
      "unread": false,
      "shared": false
    }
  ]
}
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized (invalid token)

---

#### GET /bookmarks/{id}/

Get a specific bookmark by ID.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Bookmark ID |

**Example Request:**
```bash
curl -s "$LINKDING_URL/api/bookmarks/1/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized
- `404`: Bookmark not found

---

#### POST /bookmarks/

Create a new bookmark.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| url (body) | string | Yes | Bookmark URL |
| title (body) | string | No | Custom title (auto-fetched if empty) |
| description (body) | string | No | Description/notes |
| tag_names (body) | array | No | List of tag names |
| archived (body) | boolean | No | Archive status (default: false) |
| unread (body) | boolean | No | Unread status (default: false) |
| shared (body) | boolean | No | Share publicly (default: false) |

**Example Request:**
```bash
curl -X POST "$LINKDING_URL/api/bookmarks/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "url": "https://github.com/sissbruecker/linkding",
    "title": "Linkding - Self-hosted bookmark manager",
    "description": "Minimal bookmark manager for speed and simplicity",
    "tag_names": ["selfhosted", "bookmarks", "python"]
  }'
```

**Response Codes:**
- `201`: Bookmark created
- `400`: Bad request (invalid URL or missing required fields)
- `401`: Unauthorized

---

#### PATCH /bookmarks/{id}/

Update an existing bookmark.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Bookmark ID |
| url (body) | string | No | New URL |
| title (body) | string | No | New title |
| description (body) | string | No | New description |
| tag_names (body) | array | No | New tags (replaces all) |
| archived (body) | boolean | No | Archive status |
| unread (body) | boolean | No | Unread status |
| shared (body) | boolean | No | Share status |

**Example Request:**
```bash
curl -X PATCH "$LINKDING_URL/api/bookmarks/1/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "description": "Updated description",
    "tag_names": ["updated", "bookmarks"]
  }'
```

**Response Codes:**
- `200`: Bookmark updated
- `400`: Bad request
- `401`: Unauthorized
- `404`: Bookmark not found

---

#### DELETE /bookmarks/{id}/

Delete a bookmark.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (path) | integer | Yes | Bookmark ID to delete |

**Example Request:**
```bash
curl -X DELETE "$LINKDING_URL/api/bookmarks/1/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

**Response Codes:**
- `204`: Bookmark deleted (no content)
- `401`: Unauthorized
- `404`: Bookmark not found

---

#### POST /bookmarks/archive/

Archive a bookmark.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (body) | integer | Yes | Bookmark ID to archive |

**Example Request:**
```bash
curl -X POST "$LINKDING_URL/api/bookmarks/archive/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"id": 1}'
```

**Response Codes:**
- `204`: Bookmark archived
- `400`: Bad request
- `401`: Unauthorized
- `404`: Bookmark not found

---

#### POST /bookmarks/unarchive/

Unarchive a bookmark.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| id (body) | integer | Yes | Bookmark ID to unarchive |

**Example Request:**
```bash
curl -X POST "$LINKDING_URL/api/bookmarks/unarchive/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"id": 1}'
```

**Response Codes:**
- `204`: Bookmark unarchived
- `401`: Unauthorized
- `404`: Bookmark not found

---

#### POST /bookmarks/check/

Check if a URL is already bookmarked.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| url (body) | string | Yes | URL to check |

**Example Request:**
```bash
curl -X POST "$LINKDING_URL/api/bookmarks/check/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"url": "https://example.com"}'
```

**Example Response:**
```json
{
  "bookmark": {
    "id": 1,
    "url": "https://example.com",
    "title": "Example"
  }
}
```

Or if not found:
```json
{
  "bookmark": null
}
```

**Response Codes:**
- `200`: Success (check response body for bookmark)
- `401`: Unauthorized

---

### Tags

#### GET /tags/

List all tags.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| limit (query) | integer | No | Number of results |
| offset (query) | integer | No | Pagination offset |

**Example Request:**
```bash
curl -s "$LINKDING_URL/api/tags/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

**Example Response:**
```json
{
  "count": 5,
  "next": null,
  "previous": null,
  "results": [
    {
      "id": 1,
      "name": "python",
      "date_added": "2026-01-15T10:00:00Z"
    },
    {
      "id": 2,
      "name": "selfhosted",
      "date_added": "2026-01-15T11:00:00Z"
    }
  ]
}
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized

---

#### POST /tags/

Create a new tag.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| name (body) | string | Yes | Tag name |

**Example Request:**
```bash
curl -X POST "$LINKDING_URL/api/tags/" \
  -H "Authorization: Token $LINKDING_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"name": "new-tag"}'
```

**Response Codes:**
- `201`: Tag created
- `400`: Bad request (tag already exists)
- `401`: Unauthorized

---

### User Profile

#### GET /user/profile/

Get current user profile information.

**Example Request:**
```bash
curl -s "$LINKDING_URL/api/user/profile/" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

**Example Response:**
```json
{
  "theme": "auto",
  "bookmark_date_display": "relative",
  "web_archive_integration": "off",
  "tag_search": "lax",
  "enable_sharing": true,
  "enable_public_sharing": false
}
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized

---

## Pagination

List endpoints support pagination:
- **limit**: Number of results per page (default: 100, max: 100)
- **offset**: Number of results to skip

**Example:**
```bash
# Get results 101-200
curl -s "$LINKDING_URL/api/bookmarks/?limit=100&offset=100" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

Response includes pagination info:
- `count`: Total number of results
- `next`: URL for next page (null if last page)
- `previous`: URL for previous page (null if first page)

---

## Search and Filtering

The `/bookmarks/` endpoint supports search and filtering:

**Search by query:**
```bash
curl -s "$LINKDING_URL/api/bookmarks/?q=python" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

**Filter by archived status:**
```bash
# Only archived bookmarks
curl -s "$LINKDING_URL/api/bookmarks/?archived=true" \
  -H "Authorization: Token $LINKDING_API_KEY"

# Only non-archived bookmarks
curl -s "$LINKDING_URL/api/bookmarks/?archived=false" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

**Combine filters:**
```bash
curl -s "$LINKDING_URL/api/bookmarks/?q=github&archived=false&limit=50" \
  -H "Authorization: Token $LINKDING_API_KEY"
```

---

## Version History

| API Version | Doc Version | Date | Changes |
|-------------|-------------|------|---------|
| v1 | 1.0.0 | 2026-02-01 | Initial documentation |

## Additional Resources

- [Official Documentation](https://github.com/sissbruecker/linkding/blob/master/docs/API.md)
- [GitHub Repository](https://github.com/sissbruecker/linkding)
- [Docker Installation](https://github.com/sissbruecker/linkding#installation)
