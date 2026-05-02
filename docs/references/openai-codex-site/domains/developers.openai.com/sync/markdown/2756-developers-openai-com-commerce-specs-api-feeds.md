Feeds – Agentic Commerce | OpenAI Developers
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
## Overview
Use these endpoints to create a product feed and retrieve feed metadata.
## REST endpoints
* `GET /product\_feeds/{id}` returns metadata for a feed.
* `POST /product\_feeds` creates a new product feed and returns its
metadata.
### **GET /product\_feeds/{id}**
Returns metadata for the specified product feed.
#### Path parameters
|Field|Type|Required|Description|
|`id`|`string`|Yes|Identifier for the product feed.|
#### Request
This endpoint does not define a request body.
#### Response
`200 OK`
|Field|Type|Required|Description|
|`id`|`string`|Yes|Identifier for the product feed.|
|`target\_country`|`string`|No|Two letter country code per ISO 3166.|
|`updated\_at`|`string`|No|Timestamp of the most recent update to the feed.|
`404 Not Found`
Returned when the product feed is not found.
### **POST /product\_feeds**
Creates a new product feed and returns its metadata.
#### Request
|Field|Type|Required|Description|
|`target\_country`|`string`|No|Two letter country code per ISO 3166.|
#### Response
`200 OK`
|Field|Type|Required|Description|
|`id`|`string`|Yes|Identifier for the product feed.|
|`target\_country`|`string`|No|Two letter country code per ISO 3166.|
|`updated\_at`|`string`|No|Timestamp of the most recent update to the feed.|
`400 Bad Request`
Returned when the product feed payload is invalid.