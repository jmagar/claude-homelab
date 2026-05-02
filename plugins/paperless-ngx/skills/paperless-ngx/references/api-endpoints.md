# Paperless-ngx API Endpoints

Complete API reference for Paperless-ngx REST API.

## Authentication

All API requests require authentication using one of these methods:

### Token Authentication (Recommended)

```bash
Authorization: Token <your-api-token>
```

**Get your token:**
1. Log into Paperless-ngx web UI
2. Go to Settings → My Profile
3. Click "Create Token"
4. Copy and save the token

### Basic Authentication

```bash
Authorization: Basic <base64-encoded-credentials>
```

Where credentials is `username:password` encoded in base64.

### Session Authentication

When logged into the web interface, API requests automatically use session authentication.

## Base URL

All API endpoints are relative to `/api/`:

```
https://paperless.example.com/api/
```

## Documents

### Upload Document

**Endpoint:** `POST /api/documents/post_document/`

**Content-Type:** `multipart/form-data`

**Form Fields:**
- `document` (file, required) - The document file
- `title` (string, optional) - Document title
- `created` (date, optional) - Document date (YYYY-MM-DD)
- `correspondent` (int, optional) - Correspondent ID
- `document_type` (int, optional) - Document type ID
- `tags` (string, optional) - Comma-separated tag names or IDs
- `archive_serial_number` (int, optional) - Archive serial number

**Response:**
```json
{
  "task_id": "uuid-string"
}
```

**Example:**
```bash
curl -X POST \
  -H "Authorization: Token <token>" \
  -F "document=@receipt.pdf" \
  -F "title=Electric Bill" \
  -F "tags=bill,utilities" \
  https://paperless.example.com/api/documents/post_document/
```

### List Documents

**Endpoint:** `GET /api/documents/`

**Query Parameters:**
- `page` (int) - Page number (default: 1)
- `page_size` (int) - Results per page (default: 50)
- `ordering` (string) - Sort field (prefix with `-` for descending)
  - Options: `created`, `modified`, `added`, `title`, `correspondent__name`
- `query` (string) - Full-text search query
- `tags__id__in` (string) - Comma-separated tag IDs
- `correspondent__name__icontains` (string) - Filter by correspondent name
- `document_type__name__icontains` (string) - Filter by document type
- `created__date__gt` (date) - Created after date (YYYY-MM-DD)
- `created__date__lt` (date) - Created before date (YYYY-MM-DD)

**Response:**
```json
{
  "count": 100,
  "next": "https://paperless.example.com/api/documents/?page=2",
  "previous": null,
  "results": [
    {
      "id": 123,
      "title": "Electric Bill - January 2024",
      "content": "OCR extracted text...",
      "created": "2024-01-15",
      "modified": "2024-01-15T10:30:00Z",
      "added": "2024-01-15T10:25:00Z",
      "correspondent": 5,
      "document_type": 2,
      "tags": [1, 3, 8],
      "archive_serial_number": null,
      "original_file_name": "scan_20240115.pdf"
    }
  ]
}
```

### Get Document

**Endpoint:** `GET /api/documents/<id>/`

**Response:**
```json
{
  "id": 123,
  "title": "Document Title",
  "content": "Full OCR extracted text content...",
  "created": "2024-01-15",
  "modified": "2024-01-15T10:30:00Z",
  "added": "2024-01-15T10:25:00Z",
  "correspondent": 5,
  "document_type": 2,
  "tags": [1, 3, 8],
  "archive_serial_number": 2024001,
  "original_file_name": "receipt.pdf",
  "archived_file_name": "2024-01-15_Electric_Bill.pdf"
}
```

### Update Document

**Endpoint:** `PUT /api/documents/<id>/` or `PATCH /api/documents/<id>/`

**Request Body:**
```json
{
  "title": "Updated Title",
  "correspondent": 5,
  "document_type": 2,
  "tags": [1, 3, 8],
  "created": "2024-01-15",
  "archive_serial_number": 2024001
}
```

**Response:** Returns updated document object

### Delete Document

**Endpoint:** `DELETE /api/documents/<id>/`

**Response:** `204 No Content`

### Download Document

**Endpoint:** `GET /api/documents/<id>/download/`

**Response:** Document file (PDF or original format)

**Query Parameters:**
- `original` (bool) - Download original file (default: false, returns archived PDF)

### Search Documents

**Endpoint:** `GET /api/documents/?query=<search-term>`

Search supports full-text queries with special syntax:

**Search Operators:**
- `AND` - Both terms must be present
- `OR` - Either term must be present
- `NOT` - Term must not be present
- `"exact phrase"` - Exact phrase match
- `field:value` - Field-specific search

**Examples:**
- `invoice AND 2024` - Both terms present
- `tax OR receipt` - Either term present
- `"electric bill"` - Exact phrase
- `correspondent:acme` - Specific field

### Similar Documents

**Endpoint:** `GET /api/documents/?more_like_id=<document-id>`

Find documents similar to the specified document.

**Response:** Standard document list with similarity scores

## Tags

### List Tags

**Endpoint:** `GET /api/tags/`

**Query Parameters:**
- `ordering` (string) - Sort field (e.g., `name`, `-name`)

**Response:**
```json
{
  "count": 15,
  "results": [
    {
      "id": 1,
      "name": "urgent",
      "color": "#ff0000",
      "match": "",
      "matching_algorithm": 0,
      "is_inbox_tag": false,
      "document_count": 5
    }
  ]
}
```

### Create Tag

**Endpoint:** `POST /api/tags/`

**Request Body:**
```json
{
  "name": "project-alpha",
  "color": "#00ff00"
}
```

**Response:** Returns created tag object

### Get Tag

**Endpoint:** `GET /api/tags/<id>/`

### Update Tag

**Endpoint:** `PUT /api/tags/<id>/`

**Request Body:**
```json
{
  "name": "updated-name",
  "color": "#0000ff"
}
```

### Delete Tag

**Endpoint:** `DELETE /api/tags/<id>/`

Removes tag from all documents and deletes it.

## Correspondents

### List Correspondents

**Endpoint:** `GET /api/correspondents/`

**Query Parameters:**
- `ordering` (string) - Sort field (e.g., `name`, `-name`)

**Response:**
```json
{
  "count": 10,
  "results": [
    {
      "id": 1,
      "name": "Acme Corporation",
      "match": "",
      "matching_algorithm": 0,
      "is_insensitive": true,
      "document_count": 15
    }
  ]
}
```

### Create Correspondent

**Endpoint:** `POST /api/correspondents/`

**Request Body:**
```json
{
  "name": "New Correspondent"
}
```

### Get Correspondent

**Endpoint:** `GET /api/correspondents/<id>/`

### Update Correspondent

**Endpoint:** `PUT /api/correspondents/<id>/`

**Request Body:**
```json
{
  "name": "Updated Name"
}
```

### Delete Correspondent

**Endpoint:** `DELETE /api/correspondents/<id>/`

Removes correspondent from all documents and deletes it.

## Document Types

### List Document Types

**Endpoint:** `GET /api/document_types/`

**Response:**
```json
{
  "count": 5,
  "results": [
    {
      "id": 1,
      "name": "Invoice",
      "match": "",
      "matching_algorithm": 0,
      "is_insensitive": true,
      "document_count": 25
    }
  ]
}
```

### Create Document Type

**Endpoint:** `POST /api/document_types/`

**Request Body:**
```json
{
  "name": "Contract"
}
```

### Get Document Type

**Endpoint:** `GET /api/document_types/<id>/`

### Update Document Type

**Endpoint:** `PUT /api/document_types/<id>/`

### Delete Document Type

**Endpoint:** `DELETE /api/document_types/<id>/`

## Bulk Operations

### Bulk Edit Documents

**Endpoint:** `POST /api/documents/bulk_edit/`

**Request Body:**
```json
{
  "documents": [1, 2, 3, 4, 5],
  "method": "add_tag",
  "parameters": {
    "tag": 8
  }
}
```

**Available Methods:**
- `add_tag` - Add tag to documents
  - Parameters: `{"tag": <tag-id>}`
- `remove_tag` - Remove tag from documents
  - Parameters: `{"tag": <tag-id>}`
- `modify_tags` - Replace all tags
  - Parameters: `{"add_tags": [1,2], "remove_tags": [3,4]}`
- `set_correspondent` - Set correspondent
  - Parameters: `{"correspondent": <correspondent-id>}`
- `set_document_type` - Set document type
  - Parameters: `{"document_type": <type-id>}`
- `set_storage_path` - Set storage path
  - Parameters: `{"storage_path": <path-id>}`
- `delete` - Delete documents
  - Parameters: `{}`
- `reprocess` - Reprocess documents (re-OCR)
  - Parameters: `{}`

**Response:**
```json
{
  "result": "OK"
}
```

## Autocomplete

### Search Autocomplete

**Endpoint:** `GET /api/search/autocomplete/`

**Query Parameters:**
- `term` (string, required) - Partial search term
- `limit` (int, optional) - Max suggestions (default: 10)

**Response:**
```json
[
  "invoice",
  "invoices 2024",
  "invoice template"
]
```

Returns suggestions ordered by Tf/Idf score.

## Status and Tasks

### Get Task Status

**Endpoint:** `GET /api/tasks/`

Lists background tasks (document processing, OCR, etc.)

**Response:**
```json
{
  "count": 2,
  "results": [
    {
      "id": "uuid-string",
      "task_id": "uuid-string",
      "task_name": "process_document",
      "status": "PENDING",
      "result": null,
      "date_created": "2024-01-15T10:25:00Z",
      "date_done": null
    }
  ]
}
```

**Task Status Values:**
- `PENDING` - Waiting to start
- `STARTED` - Currently processing
- `SUCCESS` - Completed successfully
- `FAILURE` - Failed with error
- `RETRY` - Will retry after failure

## Error Responses

### 400 Bad Request

```json
{
  "error": "Invalid request",
  "detail": "Field 'title' is required"
}
```

### 401 Unauthorized

```json
{
  "detail": "Authentication credentials were not provided."
}
```

### 403 Forbidden

```json
{
  "detail": "You do not have permission to perform this action."
}
```

### 404 Not Found

```json
{
  "detail": "Not found."
}
```

### 500 Internal Server Error

```json
{
  "error": "Internal server error",
  "detail": "An unexpected error occurred"
}
```

## Rate Limiting

Paperless-ngx (self-hosted) does not enforce rate limits by default. However, consider implementing rate limiting at the reverse proxy level for production deployments.

## API Versioning

The current API version is **version 5**. Specify version in Accept header:

```
Accept: application/json; version=5
```

Server responds with version headers:
- `X-Api-Version: 5` - Current API version
- `X-Version: 2.x.x` - Paperless-ngx software version

## Pagination

All list endpoints support pagination:

**Request:**
```
GET /api/documents/?page=2&page_size=25
```

**Response:**
```json
{
  "count": 100,
  "next": "https://paperless.example.com/api/documents/?page=3",
  "previous": "https://paperless.example.com/api/documents/?page=1",
  "results": [...]
}
```

**Fields:**
- `count` - Total number of results
- `next` - URL to next page (null if last page)
- `previous` - URL to previous page (null if first page)
- `results` - Array of result objects

## Filtering

Many endpoints support Django-style filtering:

**Field Lookups:**
- `field__exact` - Exact match (default)
- `field__iexact` - Case-insensitive exact match
- `field__contains` - Contains substring
- `field__icontains` - Case-insensitive contains
- `field__in` - In list of values (comma-separated)
- `field__gt` - Greater than
- `field__gte` - Greater than or equal
- `field__lt` - Less than
- `field__lte` - Less than or equal
- `field__startswith` - Starts with
- `field__istartswith` - Case-insensitive starts with
- `field__endswith` - Ends with
- `field__iendswith` - Case-insensitive ends with

**Example:**
```
GET /api/documents/?title__icontains=invoice&created__date__gt=2024-01-01
```
