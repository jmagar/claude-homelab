# Memos API Endpoints Reference

Complete API reference for Memos v1 API.

## Base URL

```
https://memos.example.com/api/v1
```

## Authentication

All requests require Bearer token authentication:

```bash
Authorization: Bearer <your_access_token>
```

## Memo Service

### Create Memo

**Endpoint:** `POST /memos`

**Request Body:**
```json
{
  "content": "Memo content with #tags",
  "visibility": "PRIVATE"
}
```

**Parameters:**
- `content` (string, required) - Memo content (supports Markdown)
- `visibility` (string, optional) - `PRIVATE`, `PROTECTED`, or `PUBLIC` (default: `PRIVATE`)

**Tags:**
Tags are parsed from content using hashtag format (`#tagname`). They are NOT passed as a separate field.

**Response:**
```json
{
  "name": "memos/abc123",
  "state": "NORMAL",
  "creator": "users/1",
  "createTime": "2026-02-07T00:00:00Z",
  "updateTime": "2026-02-07T00:00:00Z",
  "displayTime": "2026-02-07T00:00:00Z",
  "content": "Memo content with #tags",
  "visibility": "PRIVATE",
  "tags": ["tags"],
  "pinned": false,
  "resources": [],
  "relations": [],
  "reactions": []
}
```

**Example:**
```bash
curl -X POST "https://memos.example.com/api/v1/memos" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"content": "My memo #work #important", "visibility": "PRIVATE"}'
```

### List Memos

**Endpoint:** `GET /memos`

**Query Parameters:**
- `pageSize` (int, optional) - Number of results (default: 50, max: 1000)
- `pageToken` (string, optional) - Pagination token from previous response
- `filter` (string, optional) - Google AIP-160 filter expression

**Filter Syntax:**
```
content.contains("keyword")
tag == "tagname"
visibility == "PRIVATE"
create_time >= "2024-01-01T00:00:00Z"
creator == "users/1"
```

Combine with `&&` (AND) and `||` (OR):
```
tag == "work" && visibility == "PRIVATE"
```

**Response:**
```json
{
  "memos": [...],
  "nextPageToken": "token_for_next_page"
}
```

**Example:**
```bash
# List all memos
curl "https://memos.example.com/api/v1/memos?pageSize=50" \
  -H "Authorization: Bearer $TOKEN"

# Filter by tag
curl "https://memos.example.com/api/v1/memos?filter=tag%20%3D%3D%20%22work%22" \
  -H "Authorization: Bearer $TOKEN"
```

### Get Memo

**Endpoint:** `GET /memos/{id}`

**Path Parameters:**
- `id` (string, required) - Memo ID (without "memos/" prefix)

**Response:** Same as Create Memo response

**Example:**
```bash
curl "https://memos.example.com/api/v1/memos/abc123" \
  -H "Authorization: Bearer $TOKEN"
```

### Update Memo

**Endpoint:** `PATCH /memos/{id}?updateMask={fields}`

**Path Parameters:**
- `id` (string, required) - Memo ID
- `updateMask` (query, required) - Comma-separated list of fields to update

**Request Body:**
```json
{
  "content": "Updated content",
  "visibility": "PUBLIC"
}
```

**Updatable Fields:**
- `content` - Memo content
- `visibility` - Visibility setting
- `pinned` - Pin status
- `rowStatus` - Archive status (`NORMAL` or `ARCHIVED`)

**Response:** Updated memo object

**Example:**
```bash
curl -X PATCH "https://memos.example.com/api/v1/memos/abc123?updateMask=content" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"content": "Updated content"}'
```

### Delete Memo

**Endpoint:** `DELETE /memos/{id}`

**Path Parameters:**
- `id` (string, required) - Memo ID

**Response:** Empty object `{}`

**Example:**
```bash
curl -X DELETE "https://memos.example.com/api/v1/memos/abc123" \
  -H "Authorization: Bearer $TOKEN"
```

## Resource Service (Attachments)

### Upload Resource

**Endpoint:** `POST /resources`

**Request:** Multipart form data

**Form Fields:**
- `file` (file, required) - File to upload
- `memoId` (string, optional) - Attach to specific memo

**Response:**
```json
{
  "name": "resources/abc123",
  "uid": "abc123",
  "filename": "document.pdf",
  "memo": "memos/xyz789",
  "createTime": "2026-02-07T00:00:00Z",
  "type": "application/pdf",
  "size": "12345"
}
```

**Example:**
```bash
curl -X POST "https://memos.example.com/api/v1/resources" \
  -H "Authorization: Bearer $TOKEN" \
  -F "file=@document.pdf"
```

### List Resources

**Endpoint:** `GET /resources`

**Query Parameters:**
- `filter` (string, optional) - Filter expression

**Example:**
```bash
curl "https://memos.example.com/api/v1/resources" \
  -H "Authorization: Bearer $TOKEN"
```

### Delete Resource

**Endpoint:** `DELETE /resources/{name}`

**Path Parameters:**
- `name` (string, required) - Resource name (with "resources/" prefix)

**Example:**
```bash
curl -X DELETE "https://memos.example.com/api/v1/resources/abc123" \
  -H "Authorization: Bearer $TOKEN"
```

## User Service

### Get User

**Endpoint:** `GET /users/{id}`

**Path Parameters:**
- `id` (string, required) - User ID (numeric)

**Response:**
```json
{
  "name": "users/1",
  "role": "HOST",
  "username": "user1",
  "email": "user@example.com",
  "nickname": "user1",
  "state": "NORMAL",
  "createTime": "2023-11-14T06:19:58Z",
  "updateTime": "2024-05-15T02:07:33Z"
}
```

**Example:**
```bash
curl "https://memos.example.com/api/v1/users/1" \
  -H "Authorization: Bearer $TOKEN"
```

### Update User

**Endpoint:** `PATCH /users/{id}?updateMask={fields}`

**Request Body:**
```json
{
  "nickname": "New Name",
  "email": "new@example.com"
}
```

**Example:**
```bash
curl -X PATCH "https://memos.example.com/api/v1/users/1?updateMask=nickname" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"nickname": "New Name"}'
```

### Create Access Token

**Endpoint:** `POST /users/{id}/access-tokens`

**Request Body:**
```json
{
  "description": "Token description"
}
```

**Response:**
```json
{
  "accessToken": "eyJhbGci...",
  "description": "Token description"
}
```

**Example:**
```bash
curl -X POST "https://memos.example.com/api/v1/users/1/access-tokens" \
  -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"description": "API Token"}'
```

### List Access Tokens

**Endpoint:** `GET /users/{id}/access-tokens`

**Example:**
```bash
curl "https://memos.example.com/api/v1/users/1/access-tokens" \
  -H "Authorization: Bearer $TOKEN"
```

### Delete Access Token

**Endpoint:** `DELETE /users/{id}/access-tokens/{token}`

**Example:**
```bash
curl -X DELETE "https://memos.example.com/api/v1/users/1/access-tokens/abc123" \
  -H "Authorization: Bearer $TOKEN"
```

## Error Responses

All error responses follow this format:

```json
{
  "code": 5,
  "message": "Error description",
  "details": []
}
```

**Common Error Codes:**
- `3` - Invalid Argument
- `5` - Not Found
- `7` - Permission Denied
- `12` - Method Not Allowed
- `16` - Unauthenticated

## Rate Limiting

No documented rate limits for self-hosted instances. However, implement reasonable backoff strategies for production use.

## Pagination

For endpoints that return lists:
1. Initial request returns `nextPageToken` if more results exist
2. Pass token in subsequent requests: `?pageToken={token}`
3. Continue until `nextPageToken` is empty

## Best Practices

1. **Authentication**: Store tokens securely, never in code
2. **Error Handling**: Check response codes and handle errors gracefully
3. **Pagination**: Always handle paginated responses for large datasets
4. **Rate Limiting**: Implement exponential backoff for failed requests
5. **Filters**: Use precise filters to reduce response size
6. **Tags**: Always include tags in content using #hashtag format
7. **IDs**: Use just the ID part (no "memos/" prefix) for update/delete operations
