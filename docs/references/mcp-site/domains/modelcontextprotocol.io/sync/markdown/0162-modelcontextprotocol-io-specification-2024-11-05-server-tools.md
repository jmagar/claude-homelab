Tools - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The Model Context Protocol (MCP) allows servers to expose tools that can be invoked by
language models. Tools enable models to interact with external systems, such as querying
databases, calling APIs, or performing computations. Each tool is uniquely identified by
a name and includes metadata describing its schema.
##
[​
](#user-interaction-model)
User Interaction Model
Tools in MCP are designed to be **model-controlled**, meaning that the language model can
discover and invoke tools automatically based on its contextual understanding and the
user’s prompts.
However, implementations are free to expose tools through any interface pattern that
suits their needs—the protocol itself does not mandate any specific user
interaction model.
For trust & safety and security, there **SHOULD** always
be a human in the loop with the ability to deny tool invocations.Applications **SHOULD**:
* Provide UI that makes clear which tools are being exposed to the AI model
* Insert clear visual indicators when tools are invoked
* Present confirmation prompts to the user for operations, to ensure a human is in the
loop
##
[​
](#capabilities)
Capabilities
Servers that support tools **MUST** declare the `tools` capability:
```
`{
"capabilities": {
"tools": {
"listChanged": true
}
}
}
`
```
`listChanged` indicates whether the server will emit notifications when the list of
available tools changes.
##
[​
](#protocol-messages)
Protocol Messages
###
[​
](#listing-tools)
Listing Tools
To discover available tools, clients send a `tools/list` request. This operation supports
[pagination](/specification/2024-11-05/server/utilities/pagination).
**Request:**
```
`{
"jsonrpc": "2.0",
"id": 1,
"method": "tools/list",
"params": {
"cursor": "optional-cursor-value"
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
"tools": [
{
"name": "get\_weather",
"description": "Get current weather information for a location",
"inputSchema": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "City name or zip code"
}
},
"required": ["location"]
}
}
],
"nextCursor": "next-page-cursor"
}
}
`
```
###
[​
](#calling-tools)
Calling Tools
To invoke a tool, clients send a `tools/call` request:
**Request:**
```
`{
"jsonrpc": "2.0",
"id": 2,
"method": "tools/call",
"params": {
"name": "get\_weather",
"arguments": {
"location": "New York"
}
}
}
`
```
**Response:**
```
`{
"jsonrpc": "2.0",
"id": 2,
"result": {
"content": [
{
"type": "text",
"text": "Current weather in New York:\\nTemperature: 72°F\\nConditions: Partly cloudy"
}
],
"isError": false
}
}
`
```
###
[​
](#list-changed-notification)
List Changed Notification
When the list of available tools changes, servers that declared the `listChanged`
capability **SHOULD** send a notification:
```
`{
"jsonrpc": "2.0",
"method": "notifications/tools/list\_changed"
}
`
```
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
](#tool)
Tool
A tool definition includes:
* `name`: Unique identifier for the tool
* `description`: Human-readable description of functionality
* `inputSchema`: JSON Schema defining expected parameters
###
[​
](#tool-result)
Tool Result
Tool results can contain multiple content items of different types:
####
[​
](#text-content)
Text Content
```
`{
"type": "text",
"text": "Tool result text"
}
`
```
####
[​
](#image-content)
Image Content
```
`{
"type": "image",
"data": "base64-encoded-data",
"mimeType": "image/png"
}
`
```
####
[​
](#embedded-resources)
Embedded Resources
[Resources](/specification/2024-11-05/server/resources) **MAY** be
embedded, to provide additional context or data, behind a URI that can be subscribed to
or fetched again by the client later:
```
`{
"type": "resource",
"resource": {
"uri": "resource://example",
"mimeType": "text/plain",
"text": "Resource content"
}
}
`
```
##
[​
](#error-handling)
Error Handling
Tools use two error reporting mechanisms:
1. **Protocol Errors**: Standard JSON-RPC errors for issues like:
* Unknown tools
* Invalid arguments
* Server errors
* **Tool Execution Errors**: Reported in tool results with `isError: true`:
* API failures
* Invalid input data
* Business logic errors
Example protocol error:
```
`{
"jsonrpc": "2.0",
"id": 3,
"error": {
"code": -32602,
"message": "Unknown tool: invalid\_tool\_name"
}
}
`
```
Example tool execution error:
```
`{
"jsonrpc": "2.0",
"id": 4,
"result": {
"content": [
{
"type": "text",
"text": "Failed to fetch weather data: API rate limit exceeded"
}
],
"isError": true
}
}
`
```
##
[​
](#security-considerations)
Security Considerations
1. Servers **MUST**:
* Validate all tool inputs
* Implement proper access controls
* Rate limit tool invocations
* Sanitize tool outputs
* Clients **SHOULD**:
* Prompt for user confirmation on sensitive operations
* Show tool inputs to the user before calling the server, to avoid malicious or
accidental data exfiltration
* Validate tool results before passing to LLM
* Implement timeouts for tool calls
* Log tool usage for audit purposes