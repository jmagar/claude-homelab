Agentic Checkout Spec – Agentic Commerce | OpenAI Developers
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
Building with the Agentic Commerce Protocol is open to all. Instant Checkout
in ChatGPT is currently available to approved partners. To apply to
participate in Instant Checkout, fill out this form [here](https://chatgpt.com/merchants).
## Overview
Enable merchants to run end-to-end checkout flows inside ChatGPT while keeping orders, payments, and compliance on their existing commerce stack.
**How it works**
1. Create session (REST). ChatGPT calls your `POST /checkout\_sessions` to start a session with cart contents and buyer context; your response must include a rich, authoritative cart state.
2. Update session (REST). As the user changes items, shipping, or discounts, ChatGPT calls `POST /checkout\_sessions/{checkout\_session\_id}`; each response returns the full cart state for display and validation.
3. Order events (webhooks). Your system publishes order lifecycle events (e.g., `order.created`, `order.updated`) to the provided webhook so ChatGPT stays in sync with fulfillment-grade truth.
4. Complete checkout (REST). ChatGPT finalizes via `POST /checkout\_sessions/{checkout\_session\_id}/complete`; you confirm order creation and return the final cart and order identifiers.
5. Optionally, cancel checkouts using POST `/checkout\_sessions/{checkout\_session\_id}/cancel` and get checkout information with `GET /checkout\_sessions/{checkout\_session\_id}`.
6. Payments on your rails. You process payment with your existing PSP; if using Delegated Payments, accept the token and apply your normal authorization/capture flow.
**Key points**
* **Required endpoints.** Implement create, update, and complete checkout session REST endpoints; all responses must return a rich cart state (items, pricing, taxes/fees, shipping, discounts, totals, status).
* **Authoritative webhooks.** Emit order events to the provided webhook to keep state consistent across retries and edge cases.
* **Keep payments where they are.** Use your current PSP and settlement processes; integrate Delegated Payments only if applicable.
* **Security and robustness.** Authenticate every request, verify signatures, enforce idempotency, validate inputs, and support safe retries.
* **Certify integration.** Pass conformance checks (schema, error codes, rate limits, webhook delivery) to ensure reliable in-ChatGPT checkout.
## Checkout session
For users to place an order through ChatGPT, you must create, update and complete a Checkout session. This Checkout session holds information about items to be purchased, fulfillment information, and payment information.
As the user progresses through the checkout flow the Checkout session will be updated and move between various states.
The response to update calls, should return all checkout options, messages, and errors to be displayed to the user. Once the customer clicks “Buy”, the checkout session is completed with a selected payment method.
## REST endpoints
Merchants must implement the following five endpoints to place orders on behalf of ChatGPT users.
In the future, the Agentic Checkout Spec will support MCP servers.
### Common features of all endpoints
All endpoints must use HTTPS and return JSON.
#### Request headers
All endpoints will be called with the following headers set:
|Field|Description|Example Value|
|Authorization|API Key used to make requests|`Bearer api\_key\_123`|
|Accept-Language|The preferred locale for content like messages and errors|`en-US`|
|User-Agent|Information about the client making this request|`ChatGPT/2.0 (Mac OS X 15.0.1; arm64; build 0)`|
|Idempotency-Key|Key used to ensure requests are idempotent|`idempotency\_key\_123`|
|Request-Id|Unique key for each request for tracing purposes|`request\_id\_123`|
|Content-Type|Type of request content|`application/json`|
|Signature|Base64 encoded signature of the request body|`eyJtZX...`|
|Timestamp|Formatted as an RFC 3339 string.|2025-09-25T10:30:00Z|
|API-Version|API version|2025-09-12|
#### Response headers
|Field|Description|Example Value|
|Idempotency-Key|Idempotency key passed in the request|`idempotency\_key\_123`|
|Request-Id|Request ID passed in the request|`request\_id\_123`|
### POST /checkout\_sessions
Call direction: OpenAI -\> Merchant
This is the initial call to create a checkout session. The call will contain information about the items the customer wishes to purchase and should return line item information, along with any messages or errors to be displayed to the customer. It should always return a checkout session id. All responses should be returned with a 201 status.
#### Request
|Field|Type|Required|Description|Validation|
|buyer|Buyer|No|Optional information about the buyer.|None|
|items|List[Item]|Yes|The initial list of items to initiate the checkout session.|Should be a non empty list|
|fulfillment\_address|Address|No|Optional fulfillment address if present.|None|
#### Response
|Field|Type|Required|Description|Validation|
|id|String|Yes|Unique id that identifies the checkout session. This id will be used to update the checkout session in subsequent calls.|None|
|buyer|Buyer|No|Buyer information, if provided|None|
|payment\_provider|PaymentProvider|Yes|Payment provider that will be used to complete this transaction.|None|
|status|String enum|Yes|Current status of the checkout session. Possible values are: `not\_ready\_for\_payment``ready\_for\_payment``completed``canceled`|None|
|currency|String|Yes|Currency code as per the ISO 4217 standard|Should follow the ISO 4217 standard in lower case|
|line\_items|List[LineItem]|Yes|List of items and computed costs.|None|
|fulfillment\_address|Address|No|Address to ship items to.|None|
|fulfillment\_options|List[FulfillmentOption]|Yes|All available fulfillment options and associated costs.|None|
|fulfillment\_option\_id|String|No|Id of the selected fulfillment option.|None|
|totals|List[Total]|Yes|List of totals.|None|
|messages|List[Message]|Yes|List of informational and error messages to be displayed to the customer.|None|
|links|List[Link]|Yes|List of links (e.g. ToS/privacy policy/etc.) to be displayed to the customer.|None|
#### Examples
1. Creating a checkout session with a single item and quantity. No fulfillment address is provided, so the checkout cannot be completed.
```
`POST Request to /checkout\_sessions
{
"items": [
{
"id": "item\_123",
"quantity": 1
}
]
}`
```
```
`Response
{
"id": "checkout\_session\_123",
"payment\_provider": {
"provider": "stripe",
"supported\_payment\_methods": ["card"]
},
"status": "in\_progress",
"currency": "usd",
"line\_items": [
{
"id": "line\_item\_123",
"item": {
"id": "item\_123",
"quantity": 1
},
"base\_amount": 300,
"discount": 0,
"subtotal": 300,
"tax": 30,
"total": 330
}
],
"totals": [
{
"type": "items\_base\_amount",
"display\_text": "Item(s) total",
"amount": 300
},
{
"type": "subtotal",
"display\_text": "Subtotal",
"amount": 300
},
{
"type": "tax",
"display\_text": "Tax",
"amount": "0.30"
},
{
"type": "total",
"display\_text": "Total",
"amount": 330
}
],
"fulfillment\_options": [],
"messages": [
{
"type": "error",
"code": "out\_of\_stock",
"path": "$.line\_items[0]",
"content\_type": "plain",
"content": "This item is not available for sale.",
}
],
"links": [
{
"type": "terms\_of\_use",
"url": "https://www.testshop.com/legal/terms-of-use"
}
]
}`
```
1. Creating a checkout session with a single item and quantity, and a provided fulfillment address. Since a fulfillment address is provided, taxes are returned as well. Fulfillment options are also available, and the cheapest one is selected by default. Any messages to show to the customer based on their fulfillment address (e.g. CA 65 warning) are also returned.
```
`POST Request to /checkout\_sessions
{
"items": [
{
"id": "item\_456",
"quantity": 1
}
],
"fulfillment\_address": {
"name": "test",
"line\_one": "1234 Chat Road",
"line\_two": "Apt 101",
"city": "San Francisco",
"state": "CA",
"country": "US",
"postal\_code": "94131"
}
}
`
```
```
`Response
{
"id": "checkout\_session\_123",
"payment\_provider": {
"provider": "stripe",
"supported\_payment\_methods": ["card"]
},
"status": "ready\_for\_payment",
"currency": "usd",
"line\_items": [
{
"id": "line\_item\_456",
"item": {
"id": "item\_456",
"quantity": 1
},
"base\_amount": 300,
"discount": 0,
"subtotal": 0,
"tax": 30,
"total": 330
}
],
"fulfillment\_address": {
"name": "test",
"line\_one": "1234 Chat Road",
"line\_two": "Apt 101",
"city": "San Francisco",
"state": "CA",
"country": "US",
"postal\_code": "94131"
},
"fulfillment\_option\_id": "fulfillment\_option\_123",
"totals": [
{
"type": "items\_base\_amount",
"display\_text": "Item(s) total",
"amount": 300
},
{
"type": "subtotal",
"display\_text": "Subtotal",
"amount": 300
},
{
"type": "tax",
"display\_text": "Tax",
"amount": 30
},
{
"type": "fulfillment",
"display\_text": "Fulfillment",
"amount": 100
},
{
"type": "total",
"display\_text": "Total",
"amount": 430
}
],
"fulfillment\_options": [
{
"type": "shipping",
"id": "fulfillment\_option\_123",
"title": "Standard",
"subtitle": "Arrives in 4-5 days",
"carrier": "USPS",
"earliest\_delivery\_time": "2025-10-12T07:20:50.52Z",
"latest\_delivery\_time": "2025-10-13T07:20:50.52Z",
"subtotal": 100,
"tax": 0,
"total": 100
},
{
"type": "shipping",
"id": "fulfillment\_option\_456",
"title": "Express",
"subtitle": "Arrives in 1-2 days",
"carrier": "USPS",
"earliest\_delivery\_time": "2025-10-09T07:20:50.52Z",
"latest\_delivery\_time": "2025-10-10T07:20:50.52Z",
"subtotal": 500,
"tax": 0,
"total": 500
}
],
"messages": [],
"links": [
{
"type": "terms\_of\_use",
"url": "https://www.testshop.com/legal/terms-of-use"
}
]
}`
```
### POST `/checkout\_sessions/{checkout\_session\_id}`
Call direction: OpenAI -\> Merchant
This endpoint will be called on checkout session updates, such as a change in fulfillment address or fulfillment option. The endpoint should return updated costs, new options (e.g. new fulfillment options based on update in fulfillment address), and any new errors.
#### Request
|Field|Type|Required|Description|Validation|
|buyer|Buyer|No|Optional information about the buyer.|None|
|items|List[Item]|No|Optional list of updated items to be purchased.|None|
|fulfillment\_address|Address|No|Newly added or updated fulfillment address specified by the customer.|None|
|fulfillment\_option\_id|String|No|Id of the fulfillment option specified by the customer.|None|
#### Response
|Field|Type|Required|Description|Validation|
|id|String|Yes|Unique id that identifies the checkout session. This id will be used to update the checkout session in subsequent calls.|None|
|buyer|Buyer|No|Buyer information, if provided|None|
|status|String enum|Yes|Current status of the checkout session. Possible values are: `not\_ready\_for\_payment``ready\_for\_payment``completed``canceled`|None|
|currency|String|Yes|Currency code as per the ISO 4217 standard|Should follow the ISO 4217 standard in lower case|
|line\_items|List[LineItem]|Yes|List of items and computed costs.|None|
|fulfillment\_address|Address|No|Address to ship items to.|None|
|fulfillment\_options|List[FulfillmentOption]|Yes|All available fulfillment options and associated costs.|None|
|fulfillment\_option\_id|String|No|Id of the selected fulfillment option.|None|
|totals|List[Total]|Yes|List of totals.|None|
|messages|List[Message]|Yes|List of informational and error messages to be displayed to the customer.|None|
|links|List[Link]|Yes|List of links (e.g. ToS/privacy policy/etc.) to be displayed to the customer.|None|
#### Example
Updating the fulfillment option updates the checkout session totals.
```
`POST Request to /checkout\_sessions/checkout\_session\_123
{
"fulfillment\_option\_id": "fulfillment\_option\_456"
}`
```
```
`Response
{
"id": "checkout\_session\_123",
"status": "ready\_for\_payment",
"currency": "usd",
"line\_items": [
{
"id": "line\_item\_456",
"item": {
"id": "item\_456",
"quantity": 1
},
"base\_amount": 300,
"discount": 0,
"subtotal": 0,
"tax": 30,
"total": 330
}
],
"fulfillment\_address": {
"name": "test",
"line\_one": "1234 Chat Road",
"line\_two": "Apt 101",
"city": "San Francisco",
"state": "CA",
"country": "US",
"postal\_code": "94131"
},
"fulfillment\_option\_id": "fulfillment\_option\_456",
"totals": [
{
"type": "items\_base\_amount",
"display\_text": "Item(s) total",
"amount": 300
},
{
"type": "subtotal",
"display\_text": "Subtotal",
"amount": 300
},
{
"type": "tax",
"display\_text": "Tax",
"amount": 30
},
{
"type": "fulfillment",
"display\_text": "Fulfillment",
"amount": 500
},
{
"type": "total",
"display\_text": "Total",
"amount": 830
}
],
"fulfillment\_options": [
{
"type": "shipping",
"id": "fulfillment\_option\_123",
"title": "Standard",
"subtitle": "Arrives in 4-5 days",
"carrier": "USPS",
"earliest\_delivery\_time": "2025-10-12T07:20:50.52Z",
"latest\_delivery\_time": "2025-10-13T07:20:50.52Z",
"subtotal": 100,
"tax": 0,
"total": 100
},
{
"type": "shipping",
"id": "fulfillment\_option\_456",
"title": "Express",
"subtitle": "Arrives in 1-2 days",
"carrier": "USPS",
"earliest\_delivery\_time": "2025-10-09T07:20:50.52Z",
"latest\_delivery\_time": "2025-10-10T07:20:50.52Z",
"subtotal": 500,
"tax": 0,
"total": 500
}
],
"messages": [],
"links": [
{
"type": "terms\_of\_use",
"url": "https://www.testshop.com/legal/terms-of-use"
}
]
}`
```
### POST `/checkout\_sessions/{checkout\_session\_id}/complete`
Call direction: OpenAI -\> Merchant
The endpoint will be called with the payment method to complete the purchase. It is expected that the checkout session will be completed and an order will be created after this call. Any errors that prevent this from happening should be returned in the response.
#### Request
|Field|Type|Required|Description|Validation|
|buyer|Buyer|No|Optional information about the buyer.|None|
|payment\_data|PaymentData|Yes|Payment data used to complete the checkout session.|None|
#### Response
|Field|Type|Required|Description|Validation|
|id|String|Yes|Unique id that identifies the checkout session. This id will be used to update the checkout session in subsequent calls.|None|
|buyer|Buyer|Yes|Buyer information|None|
|status|String enum|Yes|Current status of the checkout session. Possible values are: `not\_ready\_for\_payment``ready\_for\_payment``completed``canceled`|None|
|currency|String|Yes|Currency code as per the ISO 4217 standard|Should follow the ISO 4217 standard in lower case|
|line\_items|List[LineItem]|Yes|List of items and computed costs.|None|
|fulfillment\_address|Address|No|Address to ship items to.|None|
|fulfillment\_options|List[FulfillmentOption]|Yes|All available fulfillment options and associated costs.|None|
|fulfillment\_option\_id|String|No|Id of the selected fulfillment option.|None|
|totals|List[Total]|Yes|List of totals.|None|
|order|Order|No|Order that is created after the checkout session completes.|None|
|messages|List[Message]|Yes|List of informational and error messages to be displayed to the customer.|None|
|links|List[Link]|Yes|List of links (e.g. ToS/privacy policy/etc.) to be displayed to the customer.|None|
#### Example
Completing the checkout session with an encrypted payload representing the payment method.
```
`POST Request to /checkout\_sessions/checkout\_session\_123/complete
{
"buyer": {
"name": "John Smith",
"email": "johnsmith@mail.com",
"phone\_number": "+15552003434"
},
"payment\_data": {
"token": "spt\_123",
"provider": "stripe",
"billing\_address": {
"name": "test",
"line\_one": "1234 Chat Road",
"line\_two": "Apt 101",
"city": "San Francisco",
"state": "CA",
"country": "US",
"postal\_code": "94131",
"phone\_number": "+15552428478"
}
}
}
`
```
```
`Response
{
"id": "checkout\_session\_123",
"buyer": {
"name": "John Smith",
"email": "johnsmith@mail.com",
"phone\_number": "+15552003434"
},
"status": "completed",
"currency": "usd",
"line\_items": [
{
"id": "line\_item\_456",
"item": {
"id": "item\_456",
"quantity": 1
},
"base\_amount": 300,
"discount": 0,
"subtotal": 300,
"tax": 30,
"total": 330
}
],
"fulfillment\_address": {
"name": "test",
"line\_one": "1234 Chat Road",
"line\_two": "Apt 101",
"city": "San Francisco",
"state": "CA",
"country": "US",
"postal\_code": "94131"
},
"fulfillment\_option\_id": "fulfillment\_option\_123",
"totals": [
{
"type": "items\_base\_amount",
"display\_text": "Item(s) total",
"amount": 300
},
{
"type": "subtotal",
"display\_text": "Subtotal",
"amount": 300
},
{
"type": "tax",
"display\_text": "Tax",
"amount": 30
},
{
"type": "fulfillment",
"display\_text": "Fulfillment",
"Amount": 100
},
{
"type": "total",
"display\_text": "Total",
"amount": 430
}
],
"fulfillment\_options": [
{
"type": "shipping",
"id": "fulfillment\_option\_123",
"title": "Standard",
"subtitle": "Arrives in 4-5 days",
"carrier": "USPS",
"earliest\_delivery\_time": "2025-10-12T07:20:50.52Z",
"latest\_delivery\_time": "2025-10-13T07:20:50.52Z",
"subtotal": 100,
"tax": 0,
"total": 100
},
{
"type": "shipping",
"id": "fulfillment\_option\_456",
"title": "Express",
"subtitle": "Arrives in 1-2 days",
"carrier": "USPS",
"earliest\_delivery\_time": "2025-10-09T07:20:50.52Z",
"latest\_delivery\_time": "2025-10-10T07:20:50.52Z",
"subtotal": 500,
"tax": 0,
"total": 500
}
],
"messages": [],
"links": [
{
"type": "terms\_of\_use",
"url": "https://www.testshop.com/legal/terms-of-use"
}
]
}`
```
### POST `/checkout\_sessions/{checkout\_session\_id}/cancel`
This endpoint will be used to cancel a checkout session, if it can be canceled. If the checkout session cannot be canceled (e.g. if the checkout session is already canceled or completed), then the server should send back a response with status 405. Any checkout session with a status that is not equal to completed or canceled should be cancelable.
#### Request
None
#### Response
|Field|Type|Required|Description|Validation|
|id|String|Yes|Unique id that identifies the checkout session. This id will be used to update the checkout session in subsequent calls.|None|
|buyer|Buyer|No|Buyer information, if provided|None|
|status|String enum|Yes|Current status of the checkout session. Possible values are: `not\_ready\_for\_payment``ready\_for\_payment``completed``canceled`|None|
|currency|String|Yes|Currency code as per the ISO 4217 standard|Should follow the ISO 4217 standard in lower case|
|line\_items|List[LineItem]|Yes|List of items and computed costs.|None|
|fulfillment\_address|Address|No|Address to ship items to.|None|
|fulfillment\_options|List[FulfillmentOption]|Yes|All available fulfillment options and associated costs.|None|
|fulfillment\_option\_id|String|No|Id of the selected fulfillment option.|None|
|totals|List[Total]|Yes|List of totals.|None|
|messages|List[Message]|Yes|List of informational and error messages to be displayed to the customer.|None|
|links|List[Link]|Yes|List of links (e.g. ToS/privacy policy/etc.) to be displayed to the customer.|None|
### GET `/checkout\_sessions/{checkout\_session\_id}`
This endpoint is used to return update to date information about the checkout session. If the checkout session is not found, then the server should return a response with status 404.
#### Request
None
#### Response
|Field|Type|Required|Description|Validation|
|id|String|Yes|Unique id that identifies the checkout session. This id will be used to update the checkout session in subsequent calls.|None|
|buyer|Buyer|No|Buyer information, if provided|None|
|status|String enum|Yes|Current status of the checkout session. Possible values are: `not\_ready\_for\_payment``ready\_for\_payment``completed``canceled`|None|
|currency|String|Yes|Currency code as per the ISO 4217 standard|Should follow the ISO 4217 standard in lower case|
|line\_items|List[LineItem]|Yes|List of items and computed costs.|None|
|fulfillment\_address|Address|No|Address to ship items to.|None|
|fulfillment\_options|List[FulfillmentOption]|Yes|All available fulfillment options and associated costs.|None|
|fulfillment\_option\_id|String|No|Id of the selected fulfillment option.|None|
|totals|List[Total]|Yes|List of totals.|None|
|messages|List[Message]|Yes|List of informational and error messages to be displayed to the customer.|None|
|links|List[Link]|Yes|List of links (e.g. ToS/privacy policy/etc.) to be displayed to the customer.|None|
### Response Errors
If the server is unable to return a 201 response, then it should return an error of the following shape with a 4xx/5xx status.
#### Error
|Field|Type|Required|Description|
|type|String enum|Yes|Error type. Possible values are: `invalid\_request`|
|code|String enum|Yes|Error code. Possible values are: `request\_not\_idempotent`|
|message|String|Yes|Human‑readable description of the error.|
|param|String|No|JSONPath referring to the offending request body field, if applicable.|
## Object definitions
### Item
|Field|Type|Required|Description|Example Value|Validation|
|id|string|Yes|Id of a piece of merchandise that can be purchased|`“itm\_123”`|`None`|
|quantity|int|Yes|Quantity of the item for fulfillment|`1`|Should be a positive integer greater than 0.|
### Address
|Field|Type|Required|Description|Validation|
|name|String|Yes|Name of the person to whom the items are shipped|Max. length is 256|
|line\_one|String|Yes|First line of address|Max. length is 60|
|line\_two|String|No|Optional second line of address|Max. length is 60|
|city|String|Yes|Address city/district/suburb/town/village.|Max. length is 60|
|state|String|Yes|Address state/county/province/region.|Should follow the ISO 3166-1 standard|
|country|String|Yes|Address country|Should follow the ISO 3166-1 standard|
|postal\_code|String|Yes|Address postal code or zip code|Max. length is 20|
|phone\_number|String|No|Optional phone number|Follows the E.164 standard|
### PaymentProvider
|Field|Type|Required|Description|Validation|
|provider|String enum|Yes|String value representing payment processor. Possible values are: `stripe``adyen``braintree`|None|
|supported\_payment\_methods|List[String enum]|Yes|List of payment methods that the merchant is willing to accept. Possible values are: `card`|None|
### Message (type = info)
|Field|Type|Required|Description|Validation|
|type|String|Yes|String value representing the type of message. For an informational message, the type should be `info.`|None|
|param|String|Yes|RFC 9535 JSONPath to the component of the checkout session that the message is referring to. For instance, if the message is referring to the second line item, the path would be `$.line\_items[1]`.|None|
|content\_type|String enum|Yes|Type of the message content for rendering purposes. Possible values are: `plain``markdown`|None|
|content|String|Yes|Raw message content.|None|
### Message (type = error)
|Field|Type|Required|Description|Validation|
|type|String|Yes|String value representing the type of message. For an error message, the type should be `error.`|None|
|code|String enum|Yes|Error code. Possible values are: `missing``invalid``out\_of\_stock``payment\_declined``requires\_sign\_in``requires\_3ds`|None|
|param|String|No|RFC 9535 JSONPath to the component of the checkout session that the message is referring to. For instance, if the message is referring to the second line item, the path would be `$.line\_items[1]`.|None|
|content\_type|String enum|Yes|Type of the message content for rendering purposes. Possible values are: `plain``markdown`|None|
|content|String|Yes|Raw message content.|None|
### Link
|Field|Type|Required|Description|Validation|
|type|Enum(String)|Yes|Type of the link. Possible values are: `terms\_of\_use``privacy\_policy``seller\_shop\_policies`|None|
|url|String|Yes|Link content specified as a URL.|None|
### Buyer
|Field|Type|Required|Description|Validation|
|name|String|Yes|Name of the buyer.|Max. length is 256|
|email|String|Yes|Email address of the buyer to be used for communication.|Max. length is 256|
|phone\_number|String|No|Optional phone number of the buyer.|Follows the E.164 standard|
### Line Item
|Field|Type|Required|Description|Validation|
|id|String|Yes|Id of the line item. This is different from the id of the item - two line items representing the same item will have different line item ids.|None|
|item|Item|Yes|Item that is represented by the line item.|None|
|base\_amount|int|Yes|Integer representing item base amount before adjustments.|Should be \>= 0|
|discount|int|Yes|Integer representing any discount applied to the item.|Should be \>= 0|
|subtotal|int|Yes|Integer representing amount after all adjustments.|Should sum up to `base\_amount - discount` Should be \>= 0|
|tax|int|Yes|Integer representing tax amount.|Should be \>= 0|
|total|int|Yes|Integer representing total amount.|Should sum up to `base\_amount - discount + tax` Should be \>= 0|
### Total
|Field|Type|Required|Description|Validation|
|type|String enum|Yes|String value representing the type of total. Possible values are: `items\_base\_amount``items\_discount``subtotal``discount``fulfillment``tax``fee``total`|None|
|display\_text|String|Yes|The text displayed to the customer for this total.|None|
|amount|int|Yes|Integer representing total amount in minor units.|If type == `subtotal`, should sum to `items\_base\_amount - items\_discount` If type == `total`, should sum to `items\_base\_amount - items\_discount - discount + fulfillment + tax + fee` Should be \>= 0|
### FulfillmentOption (type = shipping)
|Field|Type|Required|Description|Validation|
|type|String|Yes|String value representing the type of fulfillment option. For a shipping option, the value should be `shipping.`|None|
|id|String|Yes|Unique ID that represents the shipping option. Unique across all fulfillment options.|Unique across all fulfillment options.|
|title|String|Yes|Title of the shipping option to display to the customer.|None|
|subtitle|String|Yes|Text content describing the estimated timeline for shipping to display to the customer.|None|
|carrier|String|Yes|Name of the shipping carrier.|None|
|earliest\_delivery\_time|String|Yes|Estimated earliest delivery time, formatted as an RFC 3339 string.|Formatted as an RFC 3339 string.|
|latest\_delivery\_time|String|Yes|Estimated latest delivery time, formatted as an RFC 3339 string.|Formatted as an RFC 3339 string.|
|subtotal|int|Yes|Integer subtotal cost of the shipping option, formatted as a string.|Should be \>= 0|
|tax|int|Yes|Integer representing tax amount.|Should be \>= 0|
|total|int|Yes|Integer total cost of the shipping option, formatted as a string.|Should sum to `subtotal + tax`|
### FulfillmentOption (type = digital)
|Field|Type|Required|Description|Validation|
|type|String|Yes|String value representing the type of fulfillment option. For a digital option, the value should be `digital.`|None|
|id|String|Yes|Unique ID that represents the digital option. Unique across all fulfillment options.|Unique across all fulfillment options.|
|title|String|Yes|Title of the digital option to display to the customer.|None|
|subtitle|String|No|Text content describing how the item will be digitally delivered to the customer.|None|
|subtotal|int|Yes|Integer subtotal cost of the digital option, formatted as a string.|Should be \>= 0|
|tax|int|Yes|Integer representing tax amount.|Should be \>= 0|
|total|int|Yes|Integer total cost of the digital option, formatted as a string.|Should sum to `subtotal + tax`|
### PaymentData
|Field|Type|Required|Description|Validation|
|token|String|Yes|Token that represents the payment method.|None|
|provider|String enum|Yes|String value representing the payment processor. Possible values are: `stripe``adyen``braintree`|None|
|billing\_address|Address|No|Optional billing address associated with the payment method|None|
### Order
|Field|Type|Required|Description|Validation|
|id|String|Yes|Unique id that identifies the order that is created after completing the checkout session.|None|
|checkout\_session\_id|String|Yes|Id that identifies the checkout session that created this order|None|
|permalink\_url|String|Yes|URL that points to the order. Customers should be able to visit this URL and provide at most their email address to view order details.|None|
## Webhooks
The merchant sends OpenAI webhook events on order creation and update events. These events ensure that the buyer’s view stays in sync. The webhook events will be sent with a HMAC signature sent as a request header (i.e. `Merchant\_Name-Signature`) that is created using the webhook payload and signed using a key provided by OpenAI.
### Webhook Event
|Field|Type|Required|Description|Validation|
|type|String enum|Yes|String representing the type of event. Possible values are: `order\_created``order\_updated`|None|
|data|EventData|Yes|Webhook event data. See EventData for more information.|None|
### EventData (type = order)
|Field|Type|Required|Description|Validation|
|type|String|Yes|String value representing the type of event data. For order data, the value should be `order`|None|
|checkout\_session\_id|String|Yes|ID that identifies the checkout session that created this order.|None|
|permalink\_url|String|Yes|URL that points to the order. Customers should be able to visit this URL and provide at most their email address to view order details.|None|
|status|String enum|Yes|String representing the latest status of the order. Possible values are: `created``manual\_review``confirmed``canceled``shipped``fulfilled`|None|
|refunds|List[Refund]|Yes|List of refunds that have been issued for the order.|None|
### Refund
|Field|Type|Required|Description|Validation|
|type|String enum|Yes|String representing the type of refund. Possible values are: `store\_credit``original\_payment`|None|
|amount|integer|Yes|Integer representing total amount of money refunded.|Should be \>= 0|