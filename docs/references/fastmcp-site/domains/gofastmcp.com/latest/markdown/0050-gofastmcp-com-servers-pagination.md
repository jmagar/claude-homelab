Pagination - FastMCP
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
* [
Background Tasks
NEW
](/servers/tasks)
* [
Composition
](/servers/composition)
* [
Dependencies
NEW
](/servers/dependency-injection)
* [
Elicitation
](/servers/elicitation)
* [
Icons
](/servers/icons)
* [
Lifespan
NEW
](/servers/lifespan)
* [
Logging
](/servers/logging)
* [
Middleware
](/servers/middleware)
* [
Pagination
NEW
](/servers/pagination)
* [
Progress
](/servers/progress)
* [
Sampling
](/servers/sampling)
* [
Storage Backends
NEW
](/servers/storage-backends)
* [
Telemetry
NEW
](/servers/telemetry)
* [
Testing
](/servers/testing)
* [
Versioning
NEW
](/servers/versioning)
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
New in version `3.0.0`
When a server exposes many tools, resources, or prompts, returning them all in a single response can be impractical. MCP supports pagination for list operations, allowing servers to return results in manageable chunks that clients can fetch incrementally.
##
[​
](#server-configuration)
Server Configuration
By default, FastMCP servers return all components in a single response for backward compatibility. To enable pagination, set the `list\_page\_size` parameter when creating your server. This value determines the maximum number of items returned per page across all list operations.
```
`from fastmcp import FastMCP
# Enable pagination with 50 items per page
server = FastMCP("ComponentRegistry", list\_page\_size=50)
# Register tools (in practice, these might come from a database or config)
@server.tool
def search(query: str) -\> str:
return f"Results for: {query}"
@server.tool
def analyze(data: str) -\> dict:
return {"status": "analyzed", "data": data}
# ... many more tools, resources, prompts
`
```
When `list\_page\_size` is configured, the `tools/list`, `resources/list`, `resources/templates/list`, and `prompts/list` endpoints all paginate their responses. Each response includes a `nextCursor` field when more results exist, which clients use to fetch subsequent pages.
###
[​
](#cursor-format)
Cursor Format
Cursors are opaque base64-encoded strings per the MCP specification. Clients should treat them as black boxes, passing them unchanged between requests. The cursor encodes the offset into the result set, but this is an implementation detail that may change.
##
[​
](#client-behavior)
Client Behavior
The FastMCP Client handles pagination transparently. Convenience methods like `list\_tools()`, `list\_resources()`, `list\_resource\_templates()`, and `list\_prompts()` automatically fetch all pages and return the complete list. Existing code continues to work without modification.
```
`from fastmcp import Client
async with Client(server) as client:
# Returns all 200 tools, fetching pages automatically
tools = await client.list\_tools()
print(f"Total tools: {len(tools)}") # 200
`
```
###
[​
](#manual-pagination)
Manual Pagination
For scenarios where you want to process results incrementally (memory-constrained environments, progress reporting, or early termination), use the `\_mcp` variants with explicit cursor handling.
```
`from fastmcp import Client
async with Client(server) as client:
# Fetch first page
result = await client.list\_tools\_mcp()
print(f"Page 1: {len(result.tools)} tools")
# Continue fetching while more pages exist
while result.nextCursor:
result = await client.list\_tools\_mcp(cursor=result.nextCursor)
print(f"Next page: {len(result.tools)} tools")
`
```
The `\_mcp` methods return the raw MCP protocol objects, which include both the items and the `nextCursor` for the next page. When `nextCursor` is `None`, you’ve reached the end of the result set.
All four list operations support manual pagination:
|Operation|Convenience Method|Manual Method|
|Tools|`list\_tools()`|`list\_tools\_mcp(cursor=...)`|
|Resources|`list\_resources()`|`list\_resources\_mcp(cursor=...)`|
|Resource Templates|`list\_resource\_templates()`|`list\_resource\_templates\_mcp(cursor=...)`|
|Prompts|`list\_prompts()`|`list\_prompts\_mcp(cursor=...)`|
##
[​
](#when-to-use-pagination)
When to Use Pagination
Pagination becomes valuable when your server exposes a large number of components. Consider enabling it when:
* Your server dynamically generates many components (e.g., from a database or file system)
* Memory usage is a concern for clients
* You want to reduce initial response latency
For servers with a fixed, modest number of components (fewer than 100), pagination adds complexity without meaningful benefit. The default behavior of returning everything in one response is simpler and efficient for typical use cases.