Server Composition - FastMCP
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
* [
Composition
](/v2/servers/composition)
* [
Context
](/v2/servers/context)
* [
Elicitation
NEW
](/v2/servers/elicitation)
* [
Icons
NEW
](/v2/servers/icons)
* [
Logging
](/v2/servers/logging)
* [
Middleware
NEW
](/v2/servers/middleware)
* [
Progress
](/v2/servers/progress)
* [
Proxy Servers
](/v2/servers/proxy)
* [
Sampling
NEW
](/v2/servers/sampling)
* [
Storage Backends
NEW
](/v2/servers/storage-backends)
* [
Background Tasks
NEW
](/v2/servers/tasks)
*
Authentication
*
Deployment
##### Clients
*
Essentials
*
Core Operations
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
New in version `2.2.0`
As your MCP applications grow, you might want to organize your tools, resources, and prompts into logical modules or reuse existing server components. FastMCP supports composition through two methods:
* **`import\_server`**: For a one-time copy of components with prefixing (static composition).
* **`mount`**: For creating a live link where the main server delegates requests to the subserver (dynamic composition).
##
[​
](#why-compose-servers)
Why Compose Servers?
* **Modularity**: Break down large applications into smaller, focused servers (e.g., a `WeatherServer`, a `DatabaseServer`, a `CalendarServer`).
* **Reusability**: Create common utility servers (e.g., a `TextProcessingServer`) and mount them wherever needed.
* **Teamwork**: Different teams can work on separate FastMCP servers that are later combined.
* **Organization**: Keep related functionality grouped together logically.
###
[​
](#importing-vs-mounting)
Importing vs Mounting
The choice of importing or mounting depends on your use case and requirements.
|Feature|Importing|Mounting|
|**Method**|`FastMCP.import\_server(server, prefix=None)`|`FastMCP.mount(server, prefix=None)`|
|**Composition Type**|One-time copy (static)|Live link (dynamic)|
|**Updates**|Changes to subserver NOT reflected|Changes to subserver immediately reflected|
|**Performance**|Fast - no runtime delegation|Slower - affected by slowest mounted server|
|**Prefix**|Optional - omit for original names|Optional - omit for original names|
|**Best For**|Bundling finalized components, performance-critical setups|Modular runtime composition|
###
[​
](#proxy-servers)
Proxy Servers
FastMCP supports [MCP proxying](/v2/servers/proxy), which allows you to mirror a local or remote server in a local FastMCP instance. Proxies are fully compatible with both importing and mounting.
New in version `2.4.0`
You can also create proxies from configuration dictionaries that follow the MCPConfig schema, which is useful for quickly connecting to one or more remote servers. See the [Proxy Servers documentation](/v2/servers/proxy#configuration-based-proxies) for details on configuration-based proxying. Note that MCPConfig follows an emerging standard and its format may evolve over time.
Prefixing rules for tools, prompts, resources, and templates are identical across importing, mounting, and proxies. When prefixes are used, resource URIs are prefixed using path format (since 2.4.0): `resource://prefix/path/to/resource`.
##
[​
](#importing-static-composition)
Importing (Static Composition)
The `import\_server()` method copies all components (tools, resources, templates, prompts) from one `FastMCP` instance (the *subserver*) into another (the *main server*). An optional `prefix` can be provided to avoid naming conflicts. If no prefix is provided, components are imported without modification. When multiple servers are imported with the same prefix (or no prefix), the most recently imported server’s components take precedence.
```
`from fastmcp import FastMCP
import asyncio
# Define subservers
weather\_mcp = FastMCP(name="WeatherService")
@weather\_mcp.tool
def get\_forecast(city: str) -\> dict:
"""Get weather forecast."""
return {"city": city, "forecast": "Sunny"}
@weather\_mcp.resource("data://cities/supported")
def list\_supported\_cities() -\> list[str]:
"""List cities with weather support."""
return ["London", "Paris", "Tokyo"]
# Define main server
main\_mcp = FastMCP(name="MainApp")
# Import subserver
async def setup():
await main\_mcp.import\_server(weather\_mcp, prefix="weather")
# Result: main\_mcp now contains prefixed components:
# - Tool: "weather\_get\_forecast"
# - Resource: "data://weather/cities/supported"
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(setup())
main\_mcp.run()
`
```
###
[​
](#how-importing-works)
How Importing Works
When you call `await main\_mcp.import\_server(subserver, prefix={whatever})`:
1. **Tools**: All tools from `subserver` are added to `main\_mcp` with names prefixed using `{prefix}\_`.
* `subserver.tool(name="my\_tool")` becomes `main\_mcp.tool(name="{prefix}\_my\_tool")`.
* **Resources**: All resources are added with both URIs and names prefixed.
* URI: `subserver.resource(uri="data://info")` becomes `main\_mcp.resource(uri="data://{prefix}/info")`.
* Name: `resource.name` becomes `"{prefix}\_{resource.name}"`.
* **Resource Templates**: Templates are prefixed similarly to resources.
* URI: `subserver.resource(uri="data://{id}")` becomes `main\_mcp.resource(uri="data://{prefix}/{id}")`.
* Name: `template.name` becomes `"{prefix}\_{template.name}"`.
* **Prompts**: All prompts are added with names prefixed using `{prefix}\_`.
* `subserver.prompt(name="my\_prompt")` becomes `main\_mcp.prompt(name="{prefix}\_my\_prompt")`.
Note that `import\_server` performs a **one-time copy** of components. Changes made to the `subserver` *after* importing **will not** be reflected in `main\_mcp`. The `subserver`’s `lifespan` context is also **not** executed by the main server.
The `prefix` parameter is optional. If omitted, components are imported without modification.
####
[​
](#importing-without-prefixes)
Importing Without Prefixes
New in version `2.9.0`
You can also import servers without specifying a prefix, which copies components using their original names:
```
`
from fastmcp import FastMCP
import asyncio
# Define subservers
weather\_mcp = FastMCP(name="WeatherService")
@weather\_mcp.tool
def get\_forecast(city: str) -\> dict:
"""Get weather forecast."""
return {"city": city, "forecast": "Sunny"}
@weather\_mcp.resource("data://cities/supported")
def list\_supported\_cities() -\> list[str]:
"""List cities with weather support."""
return ["London", "Paris", "Tokyo"]
# Define main server
main\_mcp = FastMCP(name="MainApp")
# Import subserver
async def setup():
# Import without prefix - components keep original names
await main\_mcp.import\_server(weather\_mcp)
# Result: main\_mcp now contains:
# - Tool: "get\_forecast" (original name preserved)
# - Resource: "data://cities/supported" (original URI preserved)
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(setup())
main\_mcp.run()
`
```
####
[​
](#conflict-resolution)
Conflict Resolution
New in version `2.9.0`
When importing multiple servers with the same prefix, or no prefix, components from the **most recently imported** server take precedence.
##
[​
](#mounting-live-linking)
Mounting (Live Linking)
The `mount()` method creates a **live link** between the `main\_mcp` server and the `subserver`. Instead of copying components, requests for components matching the optional `prefix` are **delegated** to the `subserver` at runtime. If no prefix is provided, the subserver’s components are accessible without prefixing. When multiple servers are mounted with the same prefix (or no prefix), the most recently mounted server takes precedence for conflicting component names.
```
`import asyncio
from fastmcp import FastMCP, Client
# Define subserver
dynamic\_mcp = FastMCP(name="DynamicService")
@dynamic\_mcp.tool
def initial\_tool():
"""Initial tool demonstration."""
return "Initial Tool Exists"
# Mount subserver (synchronous operation)
main\_mcp = FastMCP(name="MainAppLive")
main\_mcp.mount(dynamic\_mcp, prefix="dynamic")
# Add a tool AFTER mounting - it will be accessible through main\_mcp
@dynamic\_mcp.tool
def added\_later():
"""Tool added after mounting."""
return "Tool Added Dynamically!"
# Testing access to mounted tools
async def test\_dynamic\_mount():
tools = await main\_mcp.get\_tools()
print("Available tools:", list(tools.keys()))
# Shows: ['dynamic\_initial\_tool', 'dynamic\_added\_later']
async with Client(main\_mcp) as client:
result = await client.call\_tool("dynamic\_added\_later")
print("Result:", result.data)
# Shows: "Tool Added Dynamically!"
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(test\_dynamic\_mount())
`
```
###
[​
](#how-mounting-works)
How Mounting Works
When mounting is configured:
1. **Live Link**: The parent server establishes a connection to the mounted server.
2. **Dynamic Updates**: Changes to the mounted server are immediately reflected when accessed through the parent.
3. **Prefixed Access**: The parent server uses prefixes to route requests to the mounted server.
4. **Delegation**: Requests for components matching the prefix are delegated to the mounted server at runtime.
The same prefixing rules apply as with `import\_server` for naming tools, resources, templates, and prompts. This includes prefixing both the URIs/keys and the names of resources and templates for better identification in multi-server configurations.
The `prefix` parameter is optional. If omitted, components are mounted without modification.
When mounting servers, custom HTTP routes defined with `@server.custom\_route()` are also forwarded to the parent server, making them accessible through the parent’s HTTP application.
####
[​
](#performance-considerations)
Performance Considerations
Due to the “live link”, operations like `list\_tools()` on the parent server will be impacted by the speed of the slowest mounted server. In particular, HTTP-based mounted servers can introduce significant latency (300-400ms vs 1-2ms for local tools), and this slowdown affects the whole server, not just interactions with the HTTP-proxied tools. If performance is important, importing tools via [`import\_server()`](#importing-static-composition) may be a more appropriate solution as it copies components once at startup rather than delegating requests at runtime.
####
[​
](#mounting-without-prefixes)
Mounting Without Prefixes
New in version `2.9.0`
You can also mount servers without specifying a prefix, which makes components accessible without prefixing. This works identically to [importing without prefixes](#importing-without-prefixes), including [conflict resolution](#conflict-resolution).
###
[​
](#direct-vs-proxy-mounting)
Direct vs. Proxy Mounting
New in version `2.2.7`
FastMCP supports two mounting modes:
1. **Direct Mounting** (default): The parent server directly accesses the mounted server’s objects in memory.
* No client lifecycle events occur on the mounted server
* The mounted server’s lifespan context is not executed
* Communication is handled through direct method calls
* **Proxy Mounting**: The parent server treats the mounted server as a separate entity and communicates with it through a client interface.
* Full client lifecycle events occur on the mounted server
* The mounted server’s lifespan is executed when a client connects
* Communication happens via an in-memory Client transport
```
`# Direct mounting (default when no custom lifespan)
main\_mcp.mount(api\_server, prefix="api")
# Proxy mounting (preserves full client lifecycle)
main\_mcp.mount(api\_server, prefix="api", as\_proxy=True)
# Mounting without a prefix (components accessible without prefixing)
main\_mcp.mount(api\_server)
`
```
FastMCP automatically uses proxy mounting when the mounted server has a custom lifespan, but you can override this behavior with the `as\_proxy` parameter.
####
[​
](#interaction-with-proxy-servers)
Interaction with Proxy Servers
When using `FastMCP.as\_proxy()` to create a proxy server, mounting that server will always use proxy mounting:
```
`# Create a proxy for a remote server
remote\_proxy = FastMCP.as\_proxy(Client("http://example.com/mcp"))
# Mount the proxy (always uses proxy mounting)
main\_server.mount(remote\_proxy, prefix="remote")
`
```
##
[​
](#tag-filtering-with-composition)
Tag Filtering with Composition
New in version `2.9.0`
When using `include\_tags` or `exclude\_tags` on a parent server, these filters apply **recursively** to all components, including those from mounted or imported servers. This allows you to control which components are exposed at the parent level, regardless of how your application is composed.
```
`import asyncio
from fastmcp import FastMCP, Client
# Create a subserver with tools tagged for different environments
api\_server = FastMCP(name="APIServer")
@api\_server.tool(tags={"production"})
def prod\_endpoint() -\> str:
"""Production-ready endpoint."""
return "Production data"
@api\_server.tool(tags={"development"})
def dev\_endpoint() -\> str:
"""Development-only endpoint."""
return "Debug data"
# Mount the subserver with production tag filtering at parent level
prod\_app = FastMCP(name="ProductionApp", include\_tags={"production"})
prod\_app.mount(api\_server, prefix="api")
# Test the filtering
async def test\_filtering():
async with Client(prod\_app) as client:
tools = await client.list\_tools()
print("Available tools:", [t.name for t in tools])
# Shows: ['api\_prod\_endpoint']
# The 'api\_dev\_endpoint' is filtered out
# Calling the filtered tool raises an error
try:
await client.call\_tool("api\_dev\_endpoint")
except Exception as e:
print(f"Filtered tool not accessible: {e}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(test\_filtering())
`
```
###
[​
](#how-recursive-filtering-works)
How Recursive Filtering Works
Tag filters apply in the following order:
1. **Child Server Filters**: Each mounted/imported server first applies its own `include\_tags`/`exclude\_tags` to its components.
2. **Parent Server Filters**: The parent server then applies its own `include\_tags`/`exclude\_tags` to all components, including those from child servers.
This ensures that parent server tag policies act as a global policy for everything the parent server exposes, no matter how your application is composed.
This filtering applies to both **listing** (e.g., `list\_tools()`) and **execution** (e.g., `call\_tool()`). Filtered components are neither visible nor executable through the parent server.