Restaurant reservation conversion spec – Apps SDK | OpenAI Developers
Primary navigation
Search docs
### Suggested
responses createreasoning\_effortrealtimeprompt caching
Apps SDK Commerce
* [ Home ](/apps-sdk)
* [ Quickstart ](/apps-sdk/quickstart)
### Core Concepts
* [ MCP Apps in ChatGPT ](/apps-sdk/mcp-apps-in-chatgpt)
* [ MCP Server ](/apps-sdk/concepts/mcp-server)
* [ UX principles ](/apps-sdk/concepts/ux-principles)
* [ UI guidelines ](/apps-sdk/concepts/ui-guidelines)
### Plan
* [ Research use cases ](/apps-sdk/plan/use-case)
* [ Define tools ](/apps-sdk/plan/tools)
* [ Design components ](/apps-sdk/plan/components)
### Build
* [ Set up your server ](/apps-sdk/build/mcp-server)
* [ Build your ChatGPT UI ](/apps-sdk/build/chatgpt-ui)
* [ Authenticate users ](/apps-sdk/build/auth)
* [ Manage state ](/apps-sdk/build/state-management)
* [ Monetize your app ](/apps-sdk/build/monetization)
* [ Examples ](/apps-sdk/build/examples)
### Deploy
* [ Deploy your app ](/apps-sdk/deploy)
* [ Connect from ChatGPT ](/apps-sdk/deploy/connect-chatgpt)
* [ Test your integration ](/apps-sdk/deploy/testing)
* [ Submit your app ](/apps-sdk/deploy/submission)
### Conversion apps
* [ Restaurant reservation spec ](/apps-sdk/guides/restaurant-reservation-conversion-spec)
* [ Product checkout spec ](/apps-sdk/guides/product-checkout-conversion-spec)
### Guides
* [ Optimize Metadata ](/apps-sdk/guides/optimize-metadata)
* [ Security & Privacy ](/apps-sdk/guides/security-privacy)
* [ Troubleshooting ](/apps-sdk/deploy/troubleshooting)
### Resources
* [ Changelog ](/apps-sdk/changelog)
* [ App submission guidelines ](/apps-sdk/app-submission-guidelines)
* [ Reference ](/apps-sdk/reference)
[API Dashboard](https://platform.openai.com/login)
Copy Page
Restaurant reservation conversion apps in ChatGPT are currently in beta and
being tested with approved partners. To apply for access, fill out this form
[
here
](https://chatgpt.com/merchants)
## Purpose
Our goal is to let ChatGPT directly invoke partner apps for high-intent use
cases such as restaurant reservations.
Once partners provide us with a feed for search, we can hook up their apps for
bottom-of-funnel conversion actions. To do this, partner apps need to follow a
standardized contract for widget name, tool name, and tool input.
If you want to build an app that follows this spec, apply for access through the
[ChatGPT merchants form](https://chatgpt.com/merchants/).
## User experience
When users search for restaurants around them, the restaurant entity card and
sidebar include a **Reserve** button that can open the restaurant’s reservation
provider app.
Reserve button in restaurant UI:
Reservation modal opened from that button:
## Required contract (today)
For the current reservation integration, only the following are required:
* Widget name: `ui://widget/restaurant-reservation.html`
* Tool name: `restaurant\_reservation`
`restaurant\_reservation` must set:
```
`\_meta.ui.resourceUri = "ui://widget/restaurant-reservation.html";`
```
Any tool called directly from a widget must set:
```
`\_meta["openai/widgetAccessible"] = true;`
```
## `restaurant\_reservation` input
Minimum payload (always sent):
```
`{
"restaurant\_id": "string"
}`
```
We might also send the payload below. You can use it for optimistic rendering
in the modal (for example, to avoid skeleton/loading states while data
hydrates):
```
`{
"restaurant\_name": "string",
"restaurant\_image": "string",
"restaurant\_address": {
"address": "string",
"city": "string",
"state": "string",
"zipcode": "string",
"country": "string"
}
}`
```
## Feed requirement (search integration)
To enable Reserve-button routing, we ingest a business feed from partners.
### Purpose and scope
This feed contract defines:
* Minimum business data required for matching and ranking.
* A paginated listing API.
* Change detection so we can avoid unnecessary full fetches.
### Business record (minimum required fields)
A `Business` object must include:
* `id` (`string`): stable and unique within the provider.
* `name` (`string`)
* `address` (`object` or formatted `string`)
* `location` (`object` with latitude/longitude)
* `phone\_number` (`string`, E.164 preferred)
* `website\_url` (`string`, URL)
* `platform\_url` (`string`, URL to your canonical listing)
Recommended minimal shape:
```
`{
"id": "biz\_123",
"name": "Acme Coffee",
"address": {
"line1": "123 Market St",
"line2": "Suite 5",
"locality": "San Francisco",
"region": "CA",
"postal\_code": "94105",
"country": "US",
"formatted": "123 Market St, Suite 5, San Francisco, CA 94105, US"
},
"location": {
"latitude": 37.793,
"longitude": -122.396
},
"phone\_number": "+14155551234",
"website\_url": "https://acmecoffee.example",
"platform\_url": "https://provider.example/biz/biz\_123"
}`
```
If structured address components are unavailable, `address` may be a single
formatted string, but it must be consistent and human-readable.
### Paginated listing endpoint
Endpoint example:
* `GET /v1/businesses`
Query parameters:
* Pagination: use one style
* `page` + `page\_size`
* `offset` + `limit`
* or `next\_page\_token` (opaque token; preferred when supported)
* `changes\_token` (`string`, optional): indicates whether data changed since
the last sync checkpoint.
Response must include:
* `checksum` (`boolean`): whether anything changed since the provided
`changes\_token` (or `true` if none was provided).
* `businesses` (`Business[]`): current page payload.
* Pagination metadata for your selected style:
* `page`, `page\_size`, `total\_pages` (optional), or
* `offset`, `limit`, `total` (optional), or
* `next\_page\_token` (`string | null`)
### Example request and response
Request:
```
`GET /v1/businesses?page=1&page\_size=2&changes\_token=sync\_2026\_03\_10`
```
Response:
```
`{
"checksum": true,
"page": 1,
"page\_size": 2,
"total\_pages": 120,
"businesses": [
{
"id": "biz\_123",
"name": "Acme Coffee",
"address": {
"line1": "123 Market St",
"locality": "San Francisco",
"region": "CA",
"postal\_code": "94105",
"country": "US",
"formatted": "123 Market St, San Francisco, CA 94105, US"
},
"location": {
"latitude": 37.793,
"longitude": -122.396
},
"phone\_number": "+14155551234",
"website\_url": "https://acmecoffee.example",
"platform\_url": "https://provider.example/biz/biz\_123"
},
{
"id": "biz\_124",
"name": "Golden Diner",
"address": "200 Howard St, San Francisco, CA 94105, US",
"location": {
"latitude": 37.789,
"longitude": -122.391
},
"phone\_number": "+14155559876",
"website\_url": "https://goldendiner.example",
"platform\_url": "https://provider.example/biz/biz\_124"
}
]
}`
```
### How we use this feed for search
We treat the business feed as a search index. At query time, we retrieve
candidates with fuzzy matching (name + location/address), then rank and remove
duplicates using name/address similarity, with location/phone/URL as additional
signals.
## Good-to-have expansion (not required today)
For full end-to-end in-chat completion, we recommend adding:
* `refresh\_availability`
* `make\_reservation`
* `reservation\_confirmation`