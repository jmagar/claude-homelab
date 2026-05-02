Completion - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The Model Context Protocol (MCP) provides a standardized way for servers to offer
autocompletion suggestions for the arguments of prompts and resource templates. When
users are filling in argument values for a specific prompt (identified by name) or
resource template (identified by URI), servers can provide contextual suggestions.
##
[​
](#user-interaction-model)
User Interaction Model
Completion in MCP is designed to support interactive user experiences similar to IDE code
completion.
For example, applications may show completion suggestions in a dropdown or popup menu as
users type, with the ability to filter and select from available options.
However, implementations are free to expose completion through any interface pattern that
suits their needs—the protocol itself does not mandate any specific user
interaction model.
##
[​
](#capabilities)
Capabilities
Servers that support completions **MUST** declare the `completions` capability:
```
`{
"capabilities": {
"completions": {}
}
}
`
```
##
[​
](#protocol-messages)
Protocol Messages
###
[​
](#requesting-completions)
Requesting Completions
To get completion suggestions, clients send a `completion/complete` request specifying
what is being completed through a reference type:
**Request:**
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "completion/complete",
"params": {
"ref": {
"type": "ref/prompt",
"name": "code\_review"
},
"argument": {
"name": "language",
"value": "py"
}
}
}
`
```
**Response:**
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"completion": {
"values": ["python", "pytorch", "pyside"],
"total": 10,
"hasMore": true
}
}
}
`
```
For prompts or URI templates with multiple arguments, clients should include previous completions in the `context.arguments` object to provide context for subsequent requests.
**Request:**
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "completion/complete",
"params": {
"ref": {
"type": "ref/prompt",
"name": "code\_review"
},
"argument": {
"name": "framework",
"value": "fla"
},
"context": {
"arguments": {
"language": "python"
}
}
}
}
`
```
**Response:**
```
`{
"jsonrpc": "2.0",
"id": 1,
"result": {
"completion": {
"values": ["flask"],
"total": 1,
"hasMore": false
}
}
}
`
```
###
[​
](#reference-types)
Reference Types
The protocol supports two types of completion references:
|Type|Description|Example|
|`ref/prompt`|References a prompt by name|`{"type": "ref/prompt", "name": "code\_review"}`|
|`ref/resource`|References a resource URI|`{"type": "ref/resource", "uri": "file:///{path}"}`|
###
[​
](#completion-results)
Completion Results
Servers return an array of completion values ranked by relevance, with:
* Maximum 100 items per response
* Optional total number of available matches
* Boolean indicating if additional results exist
##
[​
](#message-flow)
Message Flow
##
[​
](#data-types)
Data Types
###
[​
](#completerequest)
CompleteRequest
* `ref`: A `PromptReference` or `ResourceReference`
* `argument`: Object containing:
* `name`: Argument name
* `value`: Current value
* `context`: Object containing:
* `arguments`: A mapping of already-resolved argument names to their values.
###
[​
](#completeresult)
CompleteResult
* `completion`: Object containing:
* `values`: Array of suggestions (max 100)
* `total`: Optional total matches
* `hasMore`: Additional results flag
##
[​
](#error-handling)
Error Handling
Servers **SHOULD** return standard JSON-RPC errors for common failure cases:
* Method not found: `-32601` (Capability not supported)
* Invalid prompt name: `-32602` (Invalid params)
* Missing required arguments: `-32602` (Invalid params)
* Internal errors: `-32603` (Internal error)
##
[​
](#implementation-considerations)
Implementation Considerations
1. Servers **SHOULD**:
* Return suggestions sorted by relevance
* Implement fuzzy matching where appropriate
* Rate limit completion requests
* Validate all inputs
* Clients **SHOULD**:
* Debounce rapid completion requests
* Cache completion results where appropriate
* Handle missing or partial results gracefully
##
[​
](#security)
Security
Implementations **MUST**:
* Validate all completion inputs
* Implement appropriate rate limiting
* Control access to sensitive suggestions
* Prevent completion-based information disclosure