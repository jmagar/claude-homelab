Overview – Agentic Commerce | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Apps SDK Commerce
* [ Home ](/commerce)
### Guides
* [ Get started ](/commerce/guides/get-started)
* [ Best practices ](/commerce/guides/best-practices)
### File Upload
* [ Overview ](/commerce/specs/file-upload/overview)
* [ Products ](/commerce/specs/file-upload/products)
### API
* [ Overview ](/commerce/specs/api/overview)
* [ Feeds ](/commerce/specs/api/feeds)
* [ Products ](/commerce/specs/api/products)
* [ Promotions ](/commerce/specs/api/promotions)
[API Dashboard](https://platform.openai.com/login)
Copy Page
The API lets you manage product feed data through three API surfaces:
* [Feeds](/commerce/specs/api/feeds) creates product feeds and retrieves feed
metadata.
* [Products](/commerce/specs/api/products) retrieves products for a feed and
upserts partial product changes.
* [Promotions](/commerce/specs/api/promotions) retrieves promotions for a feed
and upserts partial promotion changes.
Use these APIs together when you want to create a feed, retrieve current data,
and upsert product and promotion changes through API-based delivery instead of
file upload.
## REST endpoints
All API endpoints use the same request headers and response
headers. The `Feeds`, `Products`, and `Promotions` subtabs define the endpoint-
specific request and response bodies.
### Request headers
|Field|Description|Example Value|
|`Authorization`|API key used to make requests|`Bearer api\_key\_123`|
|`Accept-Language`|The preferred locale for content like messages and errors|`en-US`|
|`User-Agent`|Information about the client making this request|`ChatGPT/2.0 (Mac OS X 15.0.1; arm64; build 0)`|
|`Idempotency-Key`|Key used to ensure requests are idempotent|`idempotency\_key\_123`|
|`Request-Id`|Unique key for each request for tracing purposes|`request\_id\_123`|
|`Content-Type`|Type of request content|`application/json`|
|`Timestamp`|Formatted as an RFC 3339 string|`2025-09-25T10:30:00Z`|
|`API-Version`|API version|`2025-09-12`|
### Response headers
|Field|Description|Example Value|
|`Idempotency-Key`|Idempotency key passed in the request|`idempotency\_key\_123`|
|`Request-Id`|Request ID passed in the request|`request\_id\_123`|