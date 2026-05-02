Pagination - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The Model Context Protocol (MCP) supports paginating list operations that may return
large result sets. Pagination allows servers to yield results in smaller chunks rather
than all at once.
Pagination is especially important when connecting to external services over the
internet, but also useful for local integrations to avoid performance issues with large
data sets.
##
[​
](#pagination-model)
Pagination Model
Pagination in MCP uses an opaque cursor-based approach, instead of numbered pages.
* The **cursor** is an opaque string token, representing a position in the result set
* **Page size** is determined by the server, and clients **MUST NOT** assume a fixed page
size
##
[​
](#response-format)
Response Format
Pagination starts when the server sends a **response** that includes:
* The current page of results
* An optional `nextCursor` field if more results exist
```
`{
"jsonrpc": "2.0",
"id": "123",
"result": {
"resources": [...],
"nextCursor": "eyJwYWdlIjogM30="
}
}
`
```
##
[​
](#request-format)
Request Format
After receiving a cursor, the client can *continue* paginating by issuing a request
including that cursor:
```
`{
"jsonrpc": "2.0",
"id": "124",
"method": "resources/list",
"params": {
"cursor": "eyJwYWdlIjogMn0="
}
}
`
```
##
[​
](#pagination-flow)
Pagination Flow
##
[​
](#operations-supporting-pagination)
Operations Supporting Pagination
The following MCP operations support pagination:
* `resources/list` - List available resources
* `resources/templates/list` - List resource templates
* `prompts/list` - List available prompts
* `tools/list` - List available tools
##
[​
](#implementation-guidelines)
Implementation Guidelines
1. Servers **SHOULD**:
* Provide stable cursors
* Handle invalid cursors gracefully
* Clients **SHOULD**:
* Treat a missing `nextCursor` as the end of results
* Support both paginated and non-paginated flows
* Clients **MUST** treat cursors as opaque tokens:
* Don’t make assumptions about cursor format
* Don’t attempt to parse or modify cursors
* Don’t make any determination based on cursor value other than whether a
non-null value was provided (e.g. an empty string is a valid cursor and
thus **MUST NOT** be treated as the end of results)
* Don’t persist cursors across sessions
##
[​
](#error-handling)
Error Handling
Invalid cursors **SHOULD** result in an error with code -32602 (Invalid params).