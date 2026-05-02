Promotions – Agentic Commerce | OpenAI Developers
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
Use these endpoints to retrieve the current promotions for a feed or upsert
partial promotion changes matched by `id`.
## REST endpoints
* `GET /product\_feeds/{id}/promotions` returns the
promotions for the specified feed.
* `PATCH /product\_feeds/{id}/promotions` upserts promotions
into the specified feed. Promotions are matched by `id`, and
promotions not included in the request remain unchanged.
### **GET /product\_feeds/{id}/promotions**
Returns the promotions for the specified feed.
#### Path parameters
|Field|Type|Required|Description|
|`id`|`string`|Yes|Identifier for the feed.|
#### Request
This endpoint does not define a request body.
#### Response
`200 OK`
|Field|Type|Required|Description|
|`[]`|`Promotion[]`|Yes|Array of promotions for the specified feed.|
`404 Not Found`
Returned when the feed is not found.
### **PATCH /product\_feeds/{id}/promotions**
Upserts promotions into the specified feed. Promotions are matched by `id`. Promotions not included in the request remain unchanged.
#### Path parameters
|Field|Type|Required|Description|
|`id`|`string`|Yes|Identifier for the feed.|
#### Request
|Field|Type|Required|Description|
|`[]`|`Promotion[]`|Yes|Array of promotions for the feed.|
#### Response
`200 OK`
Returns the following acceptance object:
|Field|Type|Required|Description|
|`id`|`string`|Yes|Identifier for the feed.|
|`accepted`|`boolean`|Yes|Whether the promotion payload was accepted.|
`400 Bad Request`
Returned when the promotion payload is invalid.
`404 Not Found`
Returned when the feed is not found.
## Schema reference
### Promotion
|Field|Type|Required|Description|
|`id`|`string`|Yes|Promotion identifier.|
|`title`|`string`|Yes|Promotion title.|
|`description`|`Description`|No|Promotion description content.|
|`status`|`PromotionStatus`|No|Promotion status.|
|`active\_period`|`DateTimeRange`|Yes|Start and end time for the promotion.|
|`benefits`|`PromotionBenefit[]`|Yes|Benefits applied by the promotion.|
|`applies\_to`|`ProductTarget[]`|No|Products or variants targeted by the promotion.|
|`url`|`string (uri)`|No|Canonical promotion URL.|
### Description
At least one of the following fields must be present.
|Field|Type|Required|Description|
|`plain`|`string`|No|Plain-text description.|
|`html`|`string`|No|HTML description.|
|`markdown`|`string`|No|Markdown description.|
### Price
|Field|Type|Required|Description|
|`amount`|`integer`|Yes|Monetary amount expressed in ISO 4217 minor units.|
|`currency`|`string`|Yes|Currency identifier.|
### DateTimeRange
|Field|Type|Required|Description|
|`start\_time`|`string`|Yes|Start timestamp.|
|`end\_time`|`string`|Yes|End timestamp.|
### PromotionStatus
`PromotionStatus` is a string. Known values include `draft`, `scheduled`, `active`, `expired`, and `disabled`.
### PromotionBenefit
`PromotionBenefit` is a union of:
* `AmountOffBenefit`
* `PercentOffBenefit`
* `FreeShippingBenefit`
### AmountOffBenefit
|Field|Type|Required|Description|
|`type`|`const`|Yes|Must be `amount\_off`.|
|`amount\_off`|`Price`|Yes|Amount discounted.|
### PercentOffBenefit
|Field|Type|Required|Description|
|`type`|`const`|Yes|Must be `percent\_off`.|
|`percent\_off`|`number`|Yes|Percentage discounted.|
### FreeShippingBenefit
|Field|Type|Required|Description|
|`type`|`const`|Yes|Must be `free\_shipping`.|
### ProductTarget
|Field|Type|Required|Description|
|`product\_id`|`string`|Yes|Product targeted by the promotion.|
|`variant\_ids`|`string[]`|No|Variants targeted within the product.|