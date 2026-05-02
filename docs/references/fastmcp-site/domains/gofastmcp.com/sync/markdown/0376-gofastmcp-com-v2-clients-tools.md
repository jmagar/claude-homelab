Tool Operations - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/v2/getting-started/welcome)
* [
Installation
](/v2/getting-started/installation)
* [
Quickstart
](/v2/getting-started/quickstart)
* [
Updates
NEW
](/v2/updates)
##### Servers
* [
Overview
](/v2/servers/server)
*
Core Components
*
Advanced Features
*
Authentication
*
Deployment
##### Clients
*
Essentials
*
Core Operations
* [
Tools
](/v2/clients/tools)
* [
Resources
](/v2/clients/resources)
* [
Prompts
](/v2/clients/prompts)
*
Advanced Features
*
Authentication
##### Integrations
*
Authentication
*
Authorization
*
AI Assistants
*
AI SDKs
*
API Integration
##### Patterns
* [
Tool Transformation
](/v2/patterns/tool-transformation)
* [
Decorating Methods
](/v2/patterns/decorating-methods)
* [
CLI
](/v2/patterns/cli)
* [
Contrib Modules
](/v2/patterns/contrib)
* [
Testing
](/v2/patterns/testing)
##### Development
* [
Contributing
](/v2/development/contributing)
* [
Tests
](/v2/development/tests)
* [
Releases
](/v2/development/releases)
* [
Upgrade Guide
NEW
](/v2/development/upgrade-guide)
* [
Changelog
](/v2/changelog)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
New in version `2.0.0`
Tools are executable functions exposed by MCP servers. The FastMCP client provides methods to discover available tools and execute them with arguments.
##
[​
](#discovering-tools)
Discovering Tools
Use `list\_tools()` to retrieve all tools available on the server:
```
`async with client:
tools = await client.list\_tools()
# tools -\> list[mcp.types.Tool]
for tool in tools:
print(f"Tool: {tool.name}")
print(f"Description: {tool.description}")
if tool.inputSchema:
print(f"Parameters: {tool.inputSchema}")
# Access tags and other metadata
if hasattr(tool, 'meta') and tool.meta:
fastmcp\_meta = tool.meta.get('\_fastmcp', {})
print(f"Tags: {fastmcp\_meta.get('tags', [])}")
`
```
###
[​
](#filtering-by-tags)
Filtering by Tags
New in version `2.11.0`
You can use the `meta` field to filter tools based on their tags:
```
`async with client:
tools = await client.list\_tools()
# Filter tools by tag
analysis\_tools = [
tool for tool in tools
if hasattr(tool, 'meta') and tool.meta and
tool.meta.get('\_fastmcp', {}) and
'analysis' in tool.meta.get('\_fastmcp', {}).get('tags', [])
]
print(f"Found {len(analysis\_tools)} analysis tools")
`
```
The `meta` field is part of the standard MCP specification. FastMCP servers include tags and other metadata within a `\_fastmcp` namespace (e.g., `meta.\_fastmcp.tags`) to avoid conflicts with user-defined metadata. This behavior can be controlled with the server’s `include\_fastmcp\_meta` setting - when disabled, the `\_fastmcp` namespace won’t be included. Other MCP server implementations may not provide this metadata structure.
##
[​
](#executing-tools)
Executing Tools
###
[​
](#basic-execution)
Basic Execution
Execute a tool using `call\_tool()` with the tool name and arguments:
```
`async with client:
# Simple tool call
result = await client.call\_tool("add", {"a": 5, "b": 3})
# result -\> CallToolResult with structured and unstructured data
# Access structured data (automatically deserialized)
print(result.data) # 8 (int) or {"result": 8} for primitive types
# Access traditional content blocks
print(result.content[0].text) # "8" (TextContent)
`
```
###
[​
](#advanced-execution-options)
Advanced Execution Options
The `call\_tool()` method supports additional parameters for timeout control and progress monitoring:
```
`async with client:
# With timeout (aborts if execution takes longer than 2 seconds)
result = await client.call\_tool(
"long\_running\_task",
{"param": "value"},
timeout=2.0
)
# With progress handler (to track execution progress)
result = await client.call\_tool(
"long\_running\_task",
{"param": "value"},
progress\_handler=my\_progress\_handler
)
`
```
**Parameters:**
* `name`: The tool name (string)
* `arguments`: Dictionary of arguments to pass to the tool (optional)
* `timeout`: Maximum execution time in seconds (optional, overrides client-level timeout)
* `progress\_handler`: Progress callback function (optional, overrides client-level handler)
* `meta`: Dictionary of metadata to send with the request (optional, see below)
##
[​
](#sending-metadata)
Sending Metadata
New in version `2.13.1`
The `meta` parameter sends ancillary information alongside tool calls. This can be used for various purposes like observability, debugging, client identification, or any context the server may need beyond the tool’s primary arguments.
```
`async with client:
result = await client.call\_tool(
name="send\_email",
arguments={
"to": "user@example.com",
"subject": "Hello",
"body": "Welcome!"
},
meta={
"trace\_id": "abc-123",
"request\_source": "mobile\_app"
}
)
`
```
The structure and usage of `meta` is determined by your application. See [Client Metadata](/v2/servers/context#client-metadata) in the server documentation to learn how to access this data in your tool implementations.
##
[​
](#handling-results)
Handling Results
New in version `2.10.0`
Tool execution returns a `CallToolResult` object with both structured and traditional content. FastMCP’s standout feature is the `.data` property, which doesn’t just provide raw JSON but actually hydrates complete Python objects including complex types like datetimes, UUIDs, and custom classes.
###
[​
](#calltoolresult-properties)
CallToolResult Properties
## CallToolResult Properties
[​
](#param-data)
.data
Any
**FastMCP exclusive**: Fully hydrated Python objects with complex type support (datetimes, UUIDs, custom classes). Goes beyond JSON to provide complete object reconstruction from output schemas.
[​
](#param-content)
.content
list[mcp.types.ContentBlock]
Standard MCP content blocks (`TextContent`, `ImageContent`, `AudioContent`, etc.) available from all MCP servers.
[​
](#param-structured-content)
.structured\_content
dict[str, Any] | None
Standard MCP structured JSON data as sent by the server, available from all MCP servers that support structured outputs.
[​
](#param-is-error)
.is\_error
bool
Boolean indicating if the tool execution failed.
###
[​
](#structured-data-access)
Structured Data Access
FastMCP’s `.data` property provides fully hydrated Python objects, not just JSON dictionaries. This includes complex type reconstruction:
```
`from datetime import datetime
from uuid import UUID
async with client:
result = await client.call\_tool("get\_weather", {"city": "London"})
# FastMCP reconstructs complete Python objects from the server's output schema
weather = result.data # Server-defined WeatherReport object
print(f"Temperature: {weather.temperature}°C at {weather.timestamp}")
print(f"Station: {weather.station\_id}")
print(f"Humidity: {weather.humidity}%")
# The timestamp is a real datetime object, not a string!
assert isinstance(weather.timestamp, datetime)
assert isinstance(weather.station\_id, UUID)
# Compare with raw structured JSON (standard MCP)
print(f"Raw JSON: {result.structured\_content}")
# {"temperature": 20, "timestamp": "2024-01-15T14:30:00Z", "station\_id": "123e4567-..."}
# Traditional content blocks (standard MCP)
print(f"Text content: {result.content[0].text}")
`
```
###
[​
](#fallback-behavior)
Fallback Behavior
For tools without output schemas or when deserialization fails, `.data` will be `None`:
```
`async with client:
result = await client.call\_tool("legacy\_tool", {"param": "value"})
if result.data is not None:
# Structured output available and successfully deserialized
print(f"Structured: {result.data}")
else:
# No structured output or deserialization failed - use content blocks
for content in result.content:
if hasattr(content, 'text'):
print(f"Text result: {content.text}")
elif hasattr(content, 'data'):
print(f"Binary data: {len(content.data)} bytes")
`
```
###
[​
](#primitive-type-unwrapping)
Primitive Type Unwrapping
FastMCP servers automatically wrap non-object results (like `int`, `str`, `bool`) in a `{"result": value}` structure to create valid structured outputs. FastMCP clients understand this convention and automatically unwrap the value in `.data` for convenience, so you get the original primitive value instead of a wrapper object.
```
`async with client:
result = await client.call\_tool("calculate\_sum", {"a": 5, "b": 3})
# FastMCP client automatically unwraps for convenience
print(result.data) # 8 (int) - the original value
# Raw structured content shows the server-side wrapping
print(result.structured\_content) # {"result": 8}
# Other MCP clients would need to manually access ["result"]
# value = result.structured\_content["result"] # Not needed with FastMCP!
`
```
##
[​
](#error-handling)
Error Handling
###
[​
](#exception-based-error-handling)
Exception-Based Error Handling
By default, `call\_tool()` raises a `ToolError` if the tool execution fails:
```
`from fastmcp.exceptions import ToolError
async with client:
try:
result = await client.call\_tool("potentially\_failing\_tool", {"param": "value"})
print("Tool succeeded:", result.data)
except ToolError as e:
print(f"Tool failed: {e}")
`
```
###
[​
](#manual-error-checking)
Manual Error Checking
You can disable automatic error raising and manually check the result:
```
`async with client:
result = await client.call\_tool(
"potentially\_failing\_tool",
{"param": "value"},
raise\_on\_error=False
)
if result.is\_error:
print(f"Tool failed: {result.content[0].text}")
else:
print(f"Tool succeeded: {result.data}")
`
```
###
[​
](#raw-mcp-protocol-access)
Raw MCP Protocol Access
For complete control, use `call\_tool\_mcp()` which returns the raw MCP protocol object:
```
`async with client:
result = await client.call\_tool\_mcp("potentially\_failing\_tool", {"param": "value"})
# result -\> mcp.types.CallToolResult
if result.isError:
print(f"Tool failed: {result.content}")
else:
print(f"Tool succeeded: {result.content}")
# Note: No automatic deserialization with call\_tool\_mcp()
`
```
##
[​
](#argument-handling)
Argument Handling
Arguments are passed as a dictionary to the tool:
```
`async with client:
# Simple arguments
result = await client.call\_tool("greet", {"name": "World"})
# Complex arguments
result = await client.call\_tool("process\_data", {
"config": {"format": "json", "validate": True},
"items": [1, 2, 3, 4, 5],
"metadata": {"source": "api", "version": "1.0"}
})
`
```
For multi-server clients, tool names are automatically prefixed with the server name (e.g., `weather\_get\_forecast` for a tool named `get\_forecast` on the `weather` server).