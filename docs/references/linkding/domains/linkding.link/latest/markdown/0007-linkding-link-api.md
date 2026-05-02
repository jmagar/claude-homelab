API | linkding
[Skip to content](#_top)
# API
The application provides a REST API that can be used by 3rd party applications to manage bookmarks.
## Authentication
[Section titled “Authentication”](#authentication)
All requests against the API must be authorized using an authorization token. The application automatically generates an
API token for each user, which can be accessed through the *Settings* page.
The token needs to be passed as `Authorization` header in the HTTP request:
```
`
Authorization: Token \<Token\>
`
```
## Resources
[Section titled “Resources”](#resources)
The following resources are available:
### Bookmarks
[Section titled “Bookmarks”](#bookmarks)
**List**
```
`
GET /api/bookmarks/
`
```
List bookmarks.
Parameters:
* `q` - Filters results using a search phrase using the same logic as through the UI
* `limit` - Limits the max. number of results. Default is `100`.
* `offset` - Index from which to start returning results
* `modified\_since` - Filter results to only include bookmarks modified after the specified date (format: ISO 8601, e.g. “2025-01-01T00:00:00Z”)
* `added\_since` - Filter results to only include bookmarks added after the specified date (format: ISO 8601, e.g. “2025-05-29T00:00:00Z”)
* `bundle` - Filter results by bundle id to only include bookmarks matched by a given bundle
Example response:
```
`
{
"count": 123,
"next": "http://127.0.0.1:8000/api/bookmarks/?limit=100&offset=100",
"previous": null,
"results": [
{
"id": 1,
"url": "https://example.com",
"title": "Example title",
"description": "Example description",
"notes": "Example notes",
"web\_archive\_snapshot\_url": "https://web.archive.org/web/20200926094623/https://example.com",
"favicon\_url": "http://127.0.0.1:8000/static/https\_example\_com.png",
"preview\_image\_url": "http://127.0.0.1:8000/static/0ac5c53db923727765216a3a58e70522.jpg",
"is\_archived": false,
"unread": false,
"shared": false,
"tag\_names": [
"tag1",
"tag2"
],
"date\_added": "2020-09-26T09:46:23.006313Z",
"date\_modified": "2020-09-26T16:01:14.275335Z"
},
...
]
}
`
```
**List Archived**
```
`
GET /api/bookmarks/archived/
`
```
List archived bookmarks.
Parameters and response are the same as for the regular list endpoint.
**Retrieve**
```
`
GET /api/bookmarks/\<id\>/
`
```
Retrieves a single bookmark by ID.
**Check**
```
`
GET /api/bookmarks/check/?url=https%3A%2F%2Fexample.com
`
```
Allows to check if a URL is already bookmarked. If the URL is already bookmarked, the `bookmark` property in the
response holds the bookmark data, otherwise it is `null`.
Also returns a `metadata` property that contains metadata scraped from the website. Finally, the `auto\_tags` property
contains the tag names that would be automatically added when creating a bookmark for that URL.
Example response:
```
`
{
"bookmark": {
"id": 1,
"url": "https://example.com",
"title": "Example title",
"description": "Example description",
...
},
"metadata": {
"title": "Scraped website title",
"description": "Scraped website description",
...
},
"auto\_tags": [
"tag1",
"tag2"
]
}
`
```
**Create**
```
`
POST /api/bookmarks/
`
```
Creates a new bookmark. Tags are simply assigned using their names. Including
`is\_archived: true` saves a bookmark directly to the archive.
If the provided URL is already bookmarked, this silently updates the existing bookmark instead of creating a new one. If
you are implementing a user interface, consider notifying users about this behavior. You can use the `/check` endpoint
to check if a URL is already bookmarked and at the same time get the existing bookmark data. This behavior may change in
the future to return an error instead.
If the title and description are not provided or empty, the application automatically tries to scrape them from the
bookmarked website. This behavior can be disabled by adding the `disable\_scraping` query parameter to the API request.
Example payload:
```
`
{
"url": "https://example.com",
"title": "Example title",
"description": "Example description",
"notes": "Example notes",
"is\_archived": false,
"unread": false,
"shared": false,
"tag\_names": [
"tag1",
"tag2"
]
}
`
```
**Update**
```
`
PUT /api/bookmarks/\<id\>/
PATCH /api/bookmarks/\<id\>/
`
```
Updates a bookmark.
When using `POST`, at least all required fields must be provided (currently only `url`).
When using `PATCH`, only the fields that should be updated need to be provided.
Regardless which method is used, any field that is not provided is not modified.
Tags are simply assigned using their names.
If the provided URL is already bookmarked this returns an error.
Example payload:
```
`
{
"url": "https://example.com",
"title": "Example title",
"description": "Example description",
"tag\_names": [
"tag1",
"tag2"
]
}
`
```
**Archive**
```
`
POST /api/bookmarks/\<id\>/archive/
`
```
Archives a bookmark.
**Unarchive**
```
`
POST /api/bookmarks/\<id\>/unarchive/
`
```
Unarchives a bookmark.
**Delete**
```
`
DELETE /api/bookmarks/\<id\>/
`
```
Deletes a bookmark by ID.
### Bookmark Assets
[Section titled “Bookmark Assets”](#bookmark-assets)
**List**
```
`
GET /api/bookmarks/\<bookmark\_id\>/assets/
`
```
List assets for a specific bookmark.
Example response:
```
`
{
"count": 2,
"next": null,
"previous": null,
"results": [
{
"id": 1,
"bookmark": 1,
"asset\_type": "snapshot",
"date\_created": "2023-10-01T12:00:00Z",
"content\_type": "text/html",
"display\_name": "HTML snapshot from 10/01/2023",
"status": "complete"
},
{
"id": 2,
"bookmark": 1,
"asset\_type": "upload",
"date\_created": "2023-10-01T12:05:00Z",
"content\_type": "image/png",
"display\_name": "example.png",
"status": "complete"
}
]
}
`
```
**Retrieve**
```
`
GET /api/bookmarks/\<bookmark\_id\>/assets/\<id\>/
`
```
Retrieves a single asset by ID for a specific bookmark.
**Download**
```
`
GET /api/bookmarks/\<bookmark\_id\>/assets/\<id\>/download/
`
```
Downloads the asset file.
**Upload**
```
`
POST /api/bookmarks/\<bookmark\_id\>/assets/upload/
`
```
Uploads a new asset for a specific bookmark. The request must be a `multipart/form-data` request with a single part
named `file` containing the file to upload.
Example response:
```
`
{
"id": 3,
"bookmark": 1,
"asset\_type": "upload",
"date\_created": "2023-10-01T12:10:00Z",
"content\_type": "application/pdf",
"display\_name": "example.pdf",
"status": "complete"
}
`
```
**Delete**
```
`
DELETE /api/bookmarks/\<bookmark\_id\>/assets/\<id\>/
`
```
Deletes an asset by ID for a specific bookmark.
### Tags
[Section titled “Tags”](#tags)
**List**
```
`
GET /api/tags/
`
```
List tags.
Parameters:
* `limit` - Limits the max. number of results. Default is `100`.
* `offset` - Index from which to start returning results
Example response:
```
`
{
"count": 123,
"next": "http://127.0.0.1:8000/api/tags/?limit=100&offset=100",
"previous": null,
"results": [
{
"id": 1,
"name": "example",
"date\_added": "2020-09-26T09:46:23.006313Z"
},
...
]
}
`
```
**Retrieve**
```
`
GET /api/tags/\<id\>/
`
```
Retrieves a single tag by ID.
**Create**
```
`
POST /api/tags/
`
```
Creates a new tag.
Example payload:
```
`
{
"name": "example"
}
`
```
### Bundles
[Section titled “Bundles”](#bundles)
**List**
```
`
GET /api/bundles/
`
```
List bundles.
Parameters:
* `limit` - Limits the max. number of results. Default is `100`.
* `offset` - Index from which to start returning results
Example response:
```
`
{
"count": 3,
"next": null,
"previous": null,
"results": [
{
"id": 1,
"name": "Work Resources",
"search": "productivity tools",
"any\_tags": "work productivity",
"all\_tags": "",
"excluded\_tags": "personal",
"order": 0,
"date\_created": "2020-09-26T09:46:23.006313Z",
"date\_modified": "2020-09-26T16:01:14.275335Z"
},
{
"id": 2,
"name": "Tech Articles",
"search": "",
"any\_tags": "programming development",
"all\_tags": "",
"excluded\_tags": "outdated",
"order": 1,
"date\_created": "2020-09-27T10:15:30.123456Z",
"date\_modified": "2020-09-27T10:15:30.123456Z"
},
...
]
}
`
```
**Retrieve**
```
`
GET /api/bundles/\<id\>/
`
```
Retrieves a single bundle by ID.
**Create**
```
`
POST /api/bundles/
`
```
Creates a new bundle. If no `order` is specified, the bundle will be automatically assigned the next available order position.
Example payload:
```
`
{
"name": "My Bundle",
"search": "search terms",
"any\_tags": "tag1 tag2",
"all\_tags": "required-tag",
"excluded\_tags": "excluded-tag",
"order": 5
}
`
```
**Update**
```
`
PUT /api/bundles/\<id\>/
PATCH /api/bundles/\<id\>/
`
```
Updates a bundle.
When using `PUT`, all fields except read-only ones should be provided.
When using `PATCH`, only the fields that should be updated need to be provided.
Example payload:
```
`
{
"name": "Updated Bundle Name",
"search": "updated search terms",
"any\_tags": "new-tag1 new-tag2",
"order": 10
}
`
```
**Delete**
```
`
DELETE /api/bundles/\<id\>/
`
```
Deletes a bundle by ID.
### User
[Section titled “User”](#user)
**Profile**
```
`
GET /api/user/profile/
`
```
User preferences.
Example response:
```
`
{
"theme": "auto",
"bookmark\_date\_display": "relative",
"bookmark\_link\_target": "\_blank",
"web\_archive\_integration": "enabled",
"tag\_search": "lax",
"enable\_sharing": true,
"enable\_public\_sharing": true,
"enable\_favicons": false,
"display\_url": false,
"permanent\_notes": false,
"search\_preferences": {
"sort": "title\_asc",
"shared": "off",
"unread": "off"
}
}
`
```