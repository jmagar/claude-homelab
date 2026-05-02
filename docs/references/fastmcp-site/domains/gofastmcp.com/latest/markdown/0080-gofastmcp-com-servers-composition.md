Composing Servers - FastMCP
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
New in version `2.2.0`
As your application grows, you’ll want to split it into focused servers — one for weather, one for calendar, one for admin — and combine them into a single server that clients connect to. That’s what `mount()` does.
When you mount a server, all its tools, resources, and prompts become available through the parent. The connection is live: add a tool to the child after mounting, and it’s immediately visible through the parent.
```
`from fastmcp import FastMCP
weather = FastMCP("Weather")
@weather.tool
def get\_forecast(city: str) -\> str:
"""Get weather forecast for a city."""
return f"Sunny in {city}"
@weather.resource("data://cities")
def list\_cities() -\> list[str]:
"""List supported cities."""
return ["London", "Paris", "Tokyo"]
main = FastMCP("MainApp")
main.mount(weather)
# main now serves get\_forecast and data://cities
`
```
##
[​
](#mounting-external-servers)
Mounting External Servers
Mount remote HTTP servers or subprocess-based MCP servers using `create\_proxy()`:
```
`from fastmcp import FastMCP
from fastmcp.server import create\_proxy
mcp = FastMCP("Orchestrator")
# Mount a remote HTTP server (URLs work directly)
mcp.mount(create\_proxy("http://api.example.com/mcp"), namespace="api")
# Mount local Python scripts (file paths work directly)
mcp.mount(create\_proxy("./my\_server.py"), namespace="local")
`
```
###
[​
](#mounting-npm/uvx-packages)
Mounting npm/uvx Packages
For npm packages or Python tools, use the config dict format:
```
`from fastmcp import FastMCP
from fastmcp.server import create\_proxy
mcp = FastMCP("Orchestrator")
# Mount npm package via config
github\_config = {
"mcpServers": {
"default": {
"command": "npx",
"args": ["-y", "@modelcontextprotocol/server-github"]
}
}
}
mcp.mount(create\_proxy(github\_config), namespace="github")
# Mount Python tool via config
sqlite\_config = {
"mcpServers": {
"default": {
"command": "uvx",
"args": ["mcp-server-sqlite", "--db", "data.db"]
}
}
}
mcp.mount(create\_proxy(sqlite\_config), namespace="db")
`
```
Or use explicit transport classes:
```
`from fastmcp import FastMCP
from fastmcp.server import create\_proxy
from fastmcp.client.transports import NpxStdioTransport, UvxStdioTransport
mcp = FastMCP("Orchestrator")
mcp.mount(
create\_proxy(NpxStdioTransport(package="@modelcontextprotocol/server-github")),
namespace="github"
)
mcp.mount(
create\_proxy(UvxStdioTransport(tool\_name="mcp-server-sqlite", tool\_args=["--db", "data.db"])),
namespace="db"
)
`
```
For advanced configuration, see [Proxying](/servers/providers/proxy).
##
[​
](#namespacing)
Namespacing
New in version `3.0.0`
When mounting multiple servers, use namespaces to avoid naming conflicts:
```
`weather = FastMCP("Weather")
calendar = FastMCP("Calendar")
@weather.tool
def get\_data() -\> str:
return "Weather data"
@calendar.tool
def get\_data() -\> str:
return "Calendar data"
main = FastMCP("Main")
main.mount(weather, namespace="weather")
main.mount(calendar, namespace="calendar")
# Tools are now:
# - weather\_get\_data
# - calendar\_get\_data
`
```
###
[​
](#how-namespacing-works)
How Namespacing Works
|Component Type|Without Namespace|With `namespace="api"`|
|Tool|`my\_tool`|`api\_my\_tool`|
|Prompt|`my\_prompt`|`api\_my\_prompt`|
|Resource|`data://info`|`data://api/info`|
|Template|`data://{id}`|`data://api/{id}`|
Namespacing uses [transforms](/servers/transforms/transforms) under the hood.
##
[​
](#dynamic-composition)
Dynamic Composition
Because `mount()` creates a live link, you can add components to a child server after mounting and they’ll be immediately available through the parent:
```
`main = FastMCP("Main")
main.mount(dynamic\_server, namespace="dynamic")
# Add a tool AFTER mounting - it's accessible through main
@dynamic\_server.tool
def added\_later() -\> str:
return "Added after mounting!"
`
```
##
[​
](#tag-filtering)
Tag Filtering
New in version `3.0.0`
Parent server tag filters apply recursively to mounted servers:
```
`api\_server = FastMCP("API")
@api\_server.tool(tags={"production"})
def prod\_endpoint() -\> str:
return "Production data"
@api\_server.tool(tags={"development"})
def dev\_endpoint() -\> str:
return "Debug data"
# Mount with production filter
prod\_app = FastMCP("Production")
prod\_app.mount(api\_server, namespace="api")
prod\_app.enable(tags={"production"}, only=True)
# Only prod\_endpoint (namespaced as api\_prod\_endpoint) is visible
`
```
##
[​
](#performance-considerations)
Performance Considerations
Operations like `list\_tools()` on the parent are affected by the performance of all mounted servers. This is particularly noticeable with:
* HTTP-based mounted servers (300-400ms vs 1-2ms for local tools)
* Mounted servers with slow initialization
* Deep mounting hierarchies
If low latency is critical, consider implementing caching strategies or limiting mounting depth.
##
[​
](#custom-routes)
Custom Routes
New in version `2.4.0`
Custom HTTP routes defined with `@server.custom\_route()` are also forwarded when mounting:
```
`subserver = FastMCP("Sub")
@subserver.custom\_route("/health", methods=["GET"])
async def health\_check():
return {"status": "ok"}
main = FastMCP("Main")
main.mount(subserver, namespace="sub")
# /health is now accessible through main's HTTP app
`
```
##
[​
](#conflict-resolution)
Conflict Resolution
New in version `3.0.0`
When mounting multiple servers with the same namespace (or no namespace), the **most recently mounted** server takes precedence for conflicting component names:
```
`server\_a = FastMCP("A")
server\_b = FastMCP("B")
@server\_a.tool
def shared\_tool() -\> str:
return "From A"
@server\_b.tool
def shared\_tool() -\> str:
return "From B"
main = FastMCP("Main")
main.mount(server\_a)
main.mount(server\_b)
# shared\_tool returns "From B" (most recently mounted)
`
```