Key Changes - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
This document lists changes made to the Model Context Protocol (MCP) specification since
the previous revision, [2024-11-05](/specification/2024-11-05).
##
[​
](#major-changes)
Major changes
1. Added a comprehensive **[authorization framework](/specification/2025-03-26/basic/authorization)**
based on OAuth 2.1 (PR
[#133](https://github.com/modelcontextprotocol/specification/pull/133))
2. Replaced the previous HTTP+SSE transport with a more flexible **[Streamable HTTP
transport](/specification/2025-03-26/basic/transports#streamable-http)** (PR
[#206](https://github.com/modelcontextprotocol/specification/pull/206))
3. Added support for JSON-RPC **[batching](https://www.jsonrpc.org/specification#batch)**
(PR [#228](https://github.com/modelcontextprotocol/specification/pull/228))
4. Added comprehensive **tool annotations** for better describing tool behavior, like
whether it is read-only or destructive (PR
[#185](https://github.com/modelcontextprotocol/specification/pull/185))
##
[​
](#other-schema-changes)
Other schema changes
* Added `message` field to `ProgressNotification` to provide descriptive status updates
* Added support for audio data, joining the existing text and image content types
* Added `completions` capability to explicitly indicate support for argument
autocompletion suggestions
See
[the updated schema](http://github.com/modelcontextprotocol/specification/tree/main/schema/2025-03-26/schema.ts)
for more details.
##
[​
](#full-changelog)
Full changelog
For a complete list of all changes that have been made since the last protocol revision,
[see GitHub](https://github.com/modelcontextprotocol/specification/compare/2024-11-05...2025-03-26).