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
Servers that declare the `tools` capability **MUST** respond to `tools/list` requests
with the set of tools currently available to the requesting client. This set **MAY** be
empty and **MAY** change over the lifetime of the connection (see
[List Changed Notification](#list-changed-notification)).
Servers **SHOULD** return tools in a deterministic order (i.e., the same ordering across
requests when the underlying set of tools has not changed). Deterministic ordering enables
clients to reliably cache the tool list and improves LLM prompt cache hit rates when tools
are included in model context.
##
[​
](#protocol-messages)
Protocol Messages
###
[​
](#listing-tools)
Listing Tools
To discover available tools, clients send a `tools/list` request. This operation supports
[pagination](/specification/draft/server/utilities/pagination).
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
"title": "Weather Information Provider",
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
},
"icons": [
{
"src": "https://example.com/weather-icon.png",
"mimeType": "image/png",
"sizes": ["48x48"]
}
],
"execution": {
"taskSupport": "optional"
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
* `title`: Optional human-readable name of the tool for display purposes.
* `description`: Human-readable description of functionality
* `icons`: Optional array of icons for display in user interfaces
* `inputSchema`: JSON Schema defining expected parameters
* Follows the [JSON Schema usage guidelines](/specification/draft/basic#json-schema-usage)
* Defaults to 2020-12 if no `$schema` field is present
* **MUST** be a valid JSON Schema object (not `null`)
* For tools with no parameters, use one of these valid approaches:
* `{ "type": "object", "additionalProperties": false }` - **Recommended**: explicitly accepts only empty objects
* `{ "type": "object" }` - accepts any object (including with properties)
* Properties **MAY** include an [`x-mcp-header`](#x-mcp-header) annotation to expose
parameter values as HTTP headers
* `outputSchema`: Optional JSON Schema defining expected output structure
* Follows the [JSON Schema usage guidelines](/specification/draft/basic#json-schema-usage)
* Defaults to 2020-12 if no `$schema` field is present
* `annotations`: Optional properties describing tool behavior
* `execution`: Optional object describing execution-related properties
* `taskSupport`: Indicates whether this tool supports [task-augmented execution](/specification/draft/basic/utilities/tasks#tool-level-negotiation). Values: `"forbidden"` (default), `"optional"`, or `"required"`
For trust & safety and security, clients **MUST** consider tool annotations to
be untrusted unless they come from trusted servers.
####
[​
](#tool-names)
Tool Names
* Tool names **SHOULD** be between 1 and 128 characters in length (inclusive).
* Tool names **SHOULD** be considered case-sensitive.
* The following **SHOULD** be the only allowed characters: uppercase and lowercase ASCII letters (A-Z, a-z), digits
(0-9), underscore (\_), hyphen (-), and dot (.)
* Tool names **SHOULD NOT** contain spaces, commas, or other special characters.
* Tool names **SHOULD** be unique within a server.
* Example valid tool names:
* `getUser`
* `DATA\_EXPORT\_v2`
* `admin.tools.list`
Tool name uniqueness is scoped to a single server. Clients or proxies that
aggregate tools from multiple servers **MAY** encounter naming collisions (for
example, two servers each exposing a `search` tool) and **SHOULD** implement a
disambiguation strategy such as prefixing tool names with a server identifier.The server `name` returned during
[initialization](/specification/draft/basic/lifecycle#initialization) is not
guaranteed to be unique across servers and **SHOULD NOT** be relied upon for
disambiguation.
####
[​
](#x-mcp-header)
x-mcp-header
The `x-mcp-header` extension property allows servers to designate specific tool
parameters to be mirrored into HTTP headers when using the
[Streamable HTTP transport](/specification/draft/basic/transports#custom-headers-from-tool-parameters).
This enables network intermediaries (load balancers, proxies, WAFs) to route and process
requests based on parameter values without parsing the request body.
The `x-mcp-header` property is placed directly within the JSON Schema of the property to
be mirrored. Its value specifies the name portion of the resulting `Mcp-Param-{name}`
HTTP header.
**Constraints on `x-mcp-header` values:**
* **MUST NOT** be empty
* **MUST** contain only ASCII characters, excluding space and `:`
* **MUST** be case-insensitively unique among all `x-mcp-header` values in the
`inputSchema`
* **MUST** only be applied to parameters with primitive types (number, string, boolean)
Clients **MUST** reject tool definitions where any `x-mcp-header` value violates these
constraints. Rejection means the client **MUST** exclude the invalid tool from the result
of `tools/list`. Clients **SHOULD** log a warning when rejecting a tool definition,
including the tool name and the reason for rejection. This ensures that a single
malformed tool definition does not prevent other valid tools from being used.
**Example tool definition with `x-mcp-header`:**
```
`{
"name": "execute\_sql",
"description": "Execute SQL on Google Cloud Spanner",
"inputSchema": {
"type": "object",
"properties": {
"region": {
"type": "string",
"description": "The region to execute the query in",
"x-mcp-header": "Region"
},
"query": {
"type": "string",
"description": "The SQL query to execute"
}
},
"required": ["region", "query"]
}
}
`
```
In this example, when the tool is called with `"region": "us-west1"`, the client adds
the header `Mcp-Param-Region: us-west1` to the HTTP request.
Server developers **SHOULD NOT** mark sensitive parameters (passwords, API keys, tokens,
PII) with `x-mcp-header`, as header values are visible to network intermediaries.
###
[​
](#tool-result)
Tool Result
Tool results may contain [**structured**](#structured-content) or **unstructured** content.
**Unstructured** content is returned in the `content` field of a result, and can contain multiple content items of different types:
All content types (text, image, audio, resource links, and embedded resources)
support optional
[annotations](/specification/draft/server/resources#annotations) that provide
metadata about audience, priority, and modification times. This is the same
annotation format used by resources and prompts.
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
"mimeType": "image/png",
"annotations": {
"audience": ["user"],
"priority": 0.9
}
}
`
```
####
[​
](#audio-content)
Audio Content
```
`{
"type": "audio",
"data": "base64-encoded-audio-data",
"mimeType": "audio/wav"
}
`
```
####
[​
](#resource-links)
Resource Links
A tool **MAY** return links to [Resources](/specification/draft/server/resources), to provide additional context
or data. In this case, the tool will return a URI that can be subscribed to or fetched by the client:
```
`{
"type": "resource\_link",
"uri": "file:///project/src/main.rs",
"name": "main.rs",
"description": "Primary application entry point",
"mimeType": "text/x-rust"
}
`
```
Resource links support the same [Resource annotations](/specification/draft/server/resources#annotations) as regular resources to help clients understand how to use them.
Resource links returned by tools are not guaranteed to appear in the results
of a `resources/list` request.
####
[​
](#embedded-resources)
Embedded Resources
[Resources](/specification/draft/server/resources) **MAY** be embedded to provide additional context
or data using a suitable [URI scheme](/specification/draft/server/resources#common-uri-schemes). Servers that use embedded resources **SHOULD** implement the `resources` capability:
```
`{
"type": "resource",
"resource": {
"uri": "file:///project/src/main.rs",
"mimeType": "text/x-rust",
"text": "fn main() {\\n println!(\\"Hello world!\\");\\n}",
"annotations": {
"audience": ["user", "assistant"],
"priority": 0.7,
"lastModified": "2025-05-03T14:30:00Z"
}
}
}
`
```
Embedded resources support the same [Resource annotations](/specification/draft/server/resources#annotations) as regular resources to help clients understand how to use them.
####
[​
](#structured-content)
Structured Content
**Structured** content is returned as a JSON object in the `structuredContent` field of a result.
For backwards compatibility, a tool that returns structured content SHOULD also return the serialized JSON in a TextContent block.
####
[​
](#output-schema)
Output Schema
Tools may also provide an output schema for validation of structured results.
If an output schema is provided:
* Servers **MUST** provide structured results that conform to this schema.
* Clients **SHOULD** validate structured results against this schema.
Example tool with output schema:
```
`{
"name": "get\_weather\_data",
"title": "Weather Data Retriever",
"description": "Get current weather data for a location",
"inputSchema": {
"type": "object",
"properties": {
"location": {
"type": "string",
"description": "City name or zip code"
}
},
"required": ["location"]
},
"outputSchema": {
"type": "object",
"properties": {
"temperature": {
"type": "number",
"description": "Temperature in celsius"
},
"conditions": {
"type": "string",
"description": "Weather conditions description"
},
"humidity": {
"type": "number",
"description": "Humidity percentage"
}
},
"required": ["temperature", "conditions", "humidity"]
}
}
`
```
Example valid response for this tool:
```
`{
"jsonrpc": "2.0",
"id": 5,
"result": {
"content": [
{
"type": "text",
"text": "{\\"temperature\\": 22.5, \\"conditions\\": \\"Partly cloudy\\", \\"humidity\\": 65}"
}
],
"structuredContent": {
"temperature": 22.5,
"conditions": "Partly cloudy",
"humidity": 65
}
}
}
`
```
Providing an output schema helps clients and LLMs understand and properly handle structured tool outputs by:
* Enabling strict schema validation of responses
* Providing type information for better integration with programming languages
* Guiding clients and LLMs to properly parse and utilize the returned data
* Supporting better documentation and developer experience
###
[​
](#schema-examples)
Schema Examples
####
[​
](#tool-with-default-2020-12-schema)
Tool with default 2020-12 schema:
```
`{
"name": "calculate\_sum",
"description": "Add two numbers",
"inputSchema": {
"type": "object",
"properties": {
"a": { "type": "number" },
"b": { "type": "number" }
},
"required": ["a", "b"]
}
}
`
```
####
[​
](#tool-with-explicit-draft-07-schema)
Tool with explicit draft-07 schema:
```
`{
"name": "calculate\_sum",
"description": "Add two numbers",
"inputSchema": {
"$schema": "http://json-schema.org/draft-07/schema#",
"type": "object",
"properties": {
"a": { "type": "number" },
"b": { "type": "number" }
},
"required": ["a", "b"]
}
}
`
```
####
[​
](#tool-with-no-parameters)
Tool with no parameters:
```
`{
"name": "get\_current\_time",
"description": "Returns the current server time",
"inputSchema": {
"type": "object",
"additionalProperties": false
}
}
`
```
##
[​
](#error-handling)
Error Handling
Tools use two error reporting mechanisms:
1. **Protocol Errors** indicate issues with the request structure itself that models are less likely to be able to fix:
* Unknown tool
* Malformed requests (requests that fail to satisfy [CallToolRequest schema](/specification/draft/schema#calltoolrequest))
* Server errors
They are returned as standard JSON-RPC errors:
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
* **Tool Execution Errors** contain actionable feedback that language models can use to self-correct and retry with adjusted parameters:
* API failures
* Input validation errors (e.g., date in wrong format, value out of range)
* Business logic errors
They are reported in tool results with `isError: true`:
```
`{
"jsonrpc": "2.0",
"id": 4,
"result": {
"content": [
{
"type": "text",
"text": "Invalid departure date: must be in the future. Current date is 08/08/2025."
}
],
"isError": true
}
}
`
```
Clients **MAY** provide protocol errors to language models, though these are less likely to result in successful recovery.
Clients **SHOULD** provide tool execution errors to language models to enable self-correction.
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