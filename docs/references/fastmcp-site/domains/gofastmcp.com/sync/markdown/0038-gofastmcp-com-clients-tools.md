Calling Tools - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/getting-started/welcome)
* [
Installation
](/getting-started/installation)
* [
Quickstart
](/getting-started/quickstart)
##### Servers
* [
Overview
](/servers/server)
*
Core Components
*
FeaturesUPDATED
*
Providers
*
Transforms
*
Auth
*
Deployment
##### Apps
* [
Overview
NEW
](/apps/overview)
* [
Quickstart
NEW
](/apps/quickstart)
* [
Examples
NEW
](/apps/examples)
*
Building AppsNEW
*
ProvidersNEW
*
AdvancedNEW
##### Clients
* [
Overview
](/clients/client)
* [
Transports
](/clients/transports)
*
Core Operations
* [
Tools
](/clients/tools)
* [
Resources
](/clients/resources)
* [
Prompts
](/clients/prompts)
*
HandlersUPDATED
*
AuthenticationUPDATED
##### Integrations
*
Auth
*
Web Frameworks
*
AI Assistants
*
AI SDKs
* [
MCP.json
](/integrations/mcp-json-configuration)
##### CLI
* [
Overview
](/cli/overview)
* [
Running
](/cli/running)
* [
Install MCPs
](/cli/install-mcp)
* [
Inspecting
](/cli/inspecting)
* [
Client
](/cli/client)
* [
Generate CLI
](/cli/generate-cli)
* [
Auth
](/cli/auth)
##### More
* [
Settings
](/more/settings)
*
Upgrading
*
Development
*
What's New
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
New in version `2.0.0`
Use this when you need to execute server-side functions and process their results.
Tools are executable functions exposed by MCP servers. The client’s `call\_tool()` method executes a tool by name with arguments and returns structured results.
##
[​
](#basic-execution)
Basic Execution
```
`async with client:
result = await client.call\_tool("add", {"a": 5, "b": 3})
# result -\> CallToolResult with structured and unstructured data
# Access structured data (automatically deserialized)
print(result.data) # 8
# Access traditional content blocks
print(result.content[0].text) # "8"
`
```
Arguments are passed as a dictionary. For multi-server clients, tool names are automatically prefixed with the server name (e.g., `weather\_get\_forecast` for a tool named `get\_forecast` on the `weather` server).
##
[​
](#execution-options)
Execution Options
The `call\_tool()` method supports timeout control and progress monitoring:
```
`async with client:
# With timeout (aborts if execution takes longer than 2 seconds)
result = await client.call\_tool(
"long\_running\_task",
{"param": "value"},
timeout=2.0
)
# With progress handler
result = await client.call\_tool(
"long\_running\_task",
{"param": "value"},
progress\_handler=my\_progress\_handler
)
`
```
##
[​
](#structured-results)
Structured Results
New in version `2.10.0`
Tool execution returns a `CallToolResult` object. The `.data` property provides fully hydrated Python objects including complex types like datetimes and UUIDs, reconstructed from the server’s output schema.
```
`from datetime import datetime
from uuid import UUID
async with client:
result = await client.call\_tool("get\_weather", {"city": "London"})
# FastMCP reconstructs complete Python objects
weather = result.data
print(f"Temperature: {weather.temperature}C at {weather.timestamp}")
# Complex types are properly deserialized
assert isinstance(weather.timestamp, datetime)
assert isinstance(weather.station\_id, UUID)
# Raw structured JSON is also available
print(f"Raw JSON: {result.structured\_content}")
`
```
## CallToolResult Properties
[​
](#param-data)
.data
Any
Fully hydrated Python objects with complex type support (datetimes, UUIDs, custom classes). FastMCP exclusive.
[​
](#param-content)
.content
list[mcp.types.ContentBlock]
Standard MCP content blocks (`TextContent`, `ImageContent`, `AudioContent`, etc.).
[​
](#param-structured-content)
.structured\_content
dict[str, Any] | None
Standard MCP structured JSON data as sent by the server.
[​
](#param-is-error)
.is\_error
bool
Boolean indicating if the tool execution failed.
For tools without output schemas or when deserialization fails, `.data` will be `None`. Fall back to content blocks in that case:
```
`async with client:
result = await client.call\_tool("legacy\_tool", {"param": "value"})
if result.data is not None:
print(f"Structured: {result.data}")
else:
for content in result.content:
if hasattr(content, 'text'):
print(f"Text result: {content.text}")
`
```
FastMCP servers automatically wrap primitive results (like `int`, `str`, `bool`) in a `{"result": value}` structure. FastMCP clients automatically unwrap this, so you get the original value in `.data`.
##
[​
](#error-handling)
Error Handling
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
To handle errors manually instead of catching exceptions, disable automatic error raising:
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
##
[​
](#sending-metadata)
Sending Metadata
New in version `2.13.1`
The `meta` parameter sends ancillary information alongside tool calls for observability, debugging, or client identification:
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
See [Client Metadata](/servers/context#client-metadata) to learn how servers access this data.
##
[​
](#raw-protocol-access)
Raw Protocol Access
For complete control, use `call\_tool\_mcp()` which returns the raw MCP protocol object:
```
`async with client:
result = await client.call\_tool\_mcp("my\_tool", {"param": "value"})
# result -\> mcp.types.CallToolResult
if result.isError:
print(f"Tool failed: {result.content}")
else:
print(f"Tool succeeded: {result.content}")
# Note: No automatic deserialization with call\_tool\_mcp()
`
```