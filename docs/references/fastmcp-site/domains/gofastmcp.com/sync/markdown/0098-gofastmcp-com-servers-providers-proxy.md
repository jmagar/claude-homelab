MCP Proxy Provider - FastMCP
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
* [
Overview
NEW
](/servers/providers/overview)
* [
Local
NEW
](/servers/providers/local)
* [
Filesystem
NEW
](/servers/providers/filesystem)
* [
MCP Proxy
](/servers/providers/proxy)
* [
Skills
NEW
](/servers/providers/skills)
* [
Custom
NEW
](/servers/providers/custom)
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
The Proxy Provider sources components from another MCP server through a client connection. This lets you expose any MCP server’s tools, resources, and prompts through your own server, whether the source is local or accessed over the network.
##
[​
](#why-use-proxy-provider)
Why Use Proxy Provider
The Proxy Provider enables:
* **Bridge transports**: Make an HTTP server available via stdio, or vice versa
* **Aggregate servers**: Combine multiple source servers into one unified server
* **Add security**: Act as a controlled gateway with authentication and authorization
* **Simplify access**: Provide a stable endpoint even if backend servers change
##
[​
](#quick-start)
Quick Start
Create a proxy using `create\_proxy()`:
```
`from fastmcp.server import create\_proxy
# create\_proxy() accepts URLs, file paths, and transports directly
proxy = create\_proxy("http://example.com/mcp", name="MyProxy")
if \_\_name\_\_ == "\_\_main\_\_":
proxy.run()
`
```
This gives you:
* Safe concurrent request handling
* Automatic forwarding of MCP features (sampling, elicitation, etc.)
* Session isolation to prevent context mixing
To mount a proxy inside another FastMCP server, see [Mounting External Servers](/servers/composition#mounting-external-servers).
##
[​
](#transport-bridging)
Transport Bridging
A common use case is bridging transports between servers:
```
`from fastmcp.server import create\_proxy
# Bridge HTTP server to local stdio
http\_proxy = create\_proxy("http://example.com/mcp/sse", name="HTTP-to-stdio")
# Run locally via stdio for Claude Desktop
if \_\_name\_\_ == "\_\_main\_\_":
http\_proxy.run() # Defaults to stdio
`
```
Or expose a local server via HTTP:
```
`from fastmcp.server import create\_proxy
# Bridge local server to HTTP
local\_proxy = create\_proxy("local\_server.py", name="stdio-to-HTTP")
if \_\_name\_\_ == "\_\_main\_\_":
local\_proxy.run(transport="http", host="0.0.0.0", port=8080)
`
```
##
[​
](#session-isolation)
Session Isolation
`create\_proxy()` provides session isolation - each request gets its own isolated backend session:
```
`from fastmcp.server import create\_proxy
# Each request creates a fresh backend session (recommended)
proxy = create\_proxy("backend\_server.py")
# Multiple clients can use this proxy simultaneously:
# - Client A calls a tool → gets isolated session
# - Client B calls a tool → gets different session
# - No context mixing
`
```
###
[​
](#shared-sessions)
Shared Sessions
If you pass an already-connected client, the proxy reuses that session:
```
`from fastmcp import Client
from fastmcp.server import create\_proxy
async with Client("backend\_server.py") as connected\_client:
# This proxy reuses the connected session
proxy = create\_proxy(connected\_client)
# ⚠️ Warning: All requests share the same session
`
```
Shared sessions may cause context mixing in concurrent scenarios. Use only in single-threaded situations or with explicit synchronization.
##
[​
](#mcp-feature-forwarding)
MCP Feature Forwarding
Proxies automatically forward MCP protocol features:
|Feature|Description|
|Roots|Filesystem root access requests|
|Sampling|LLM completion requests|
|Elicitation|User input requests|
|Logging|Log messages from backend|
|Progress|Progress notifications|
```
`from fastmcp.server import create\_proxy
# All features forwarded automatically
proxy = create\_proxy("advanced\_backend.py")
# When the backend:
# - Requests LLM sampling → forwarded to your client
# - Logs messages → appear in your client
# - Reports progress → shown in your client
`
```
###
[​
](#disabling-features)
Disabling Features
Selectively disable forwarding:
```
`from fastmcp.server.providers.proxy import ProxyClient
backend = ProxyClient(
"backend\_server.py",
sampling\_handler=None, # Disable LLM sampling
log\_handler=None # Disable log forwarding
)
`
```
##
[​
](#configuration-based-proxies)
Configuration-Based Proxies
Create proxies from configuration dictionaries:
```
`from fastmcp.server import create\_proxy
config = {
"mcpServers": {
"default": {
"url": "https://example.com/mcp",
"transport": "http"
}
}
}
proxy = create\_proxy(config, name="Config-Based Proxy")
`
```
###
[​
](#multi-server-proxies)
Multi-Server Proxies
Combine multiple servers with automatic namespacing:
```
`from fastmcp.server import create\_proxy
config = {
"mcpServers": {
"weather": {
"url": "https://weather-api.example.com/mcp",
"transport": "http"
},
"calendar": {
"url": "https://calendar-api.example.com/mcp",
"transport": "http"
}
}
}
# Creates unified proxy with prefixed components:
# - weather\_get\_forecast
# - calendar\_add\_event
composite = create\_proxy(config, name="Composite")
`
```
##
[​
](#component-prefixing)
Component Prefixing
Proxied components follow standard prefixing rules:
|Component Type|Pattern|
|Tools|`{prefix}\_{tool\_name}`|
|Prompts|`{prefix}\_{prompt\_name}`|
|Resources|`protocol://{prefix}/path`|
|Templates|`protocol://{prefix}/...`|
##
[​
](#mirrored-components)
Mirrored Components
Components from a proxy server are “mirrored” - they reflect the remote server’s state and cannot be modified directly.
To modify a proxied component (like disabling it), create a local copy:
```
`from fastmcp import FastMCP
from fastmcp.server import create\_proxy
proxy = create\_proxy("backend\_server.py")
# Get mirrored tool
mirrored\_tool = await proxy.get\_tool("useful\_tool")
# Create modifiable local copy
local\_tool = mirrored\_tool.copy()
# Add to your own server
my\_server = FastMCP("MyServer")
my\_server.add\_tool(local\_tool)
# Now you can control enabled state
my\_server.disable(keys={local\_tool.key})
`
```
##
[​
](#performance-considerations)
Performance Considerations
Proxying introduces network latency:
|Operation|Local|Proxied (HTTP)|
|`list\_tools()`|1-2ms|300-400ms|
|`call\_tool()`|1-2ms|200-500ms|
When mounting proxy servers, this latency affects all operations on the parent server.
###
[​
](#component-list-caching)
Component List Caching
`ProxyProvider` caches the backend’s component lists (tools, resources, templates, prompts) so that individual lookups — like resolving a tool by name during `call\_tool` — don’t require a separate backend connection. The cache stores raw component metadata and is shared across all proxy sessions; per-session visibility, auth, and transforms are still applied after cache lookup by the server layer. The cache refreshes whenever an explicit `list\_\*` call is made, and entries expire after a configurable TTL (default 300 seconds).
For backends whose component lists change dynamically, disable caching by setting `cache\_ttl=0`.
```
`from fastmcp.server.providers.proxy import ProxyProvider, ProxyClient
# Default 300s TTL
provider = ProxyProvider(lambda: ProxyClient("http://backend/mcp"))
# Custom TTL
provider = ProxyProvider(lambda: ProxyClient("http://backend/mcp"), cache\_ttl=60)
# Disable caching
provider = ProxyProvider(lambda: ProxyClient("http://backend/mcp"), cache\_ttl=0)
`
```
###
[​
](#session-reuse-for-stateless-backends)
Session Reuse for Stateless Backends
By default, each tool call opens a fresh MCP session to the backend. This is the safe default because it prevents state from leaking between requests. However, for stateless HTTP backends where there’s no session state to protect, this overhead is unnecessary.
You can reuse a single backend session by providing a client factory that returns the same client instance:
```
`from fastmcp.server.providers.proxy import FastMCPProxy, ProxyClient
base\_client = ProxyClient("http://backend:8000/mcp")
shared\_client = base\_client.new()
proxy = FastMCPProxy(
client\_factory=lambda: shared\_client,
name="ReusedSessionProxy",
)
`
```
This eliminates the MCP initialization handshake on every call, which can dramatically reduce latency under load. The `Client` uses reference counting for its session lifecycle, so concurrent callers sharing the same instance is safe.
Only reuse sessions when you know the backend is stateless (e.g. stateless HTTP). For stateful backends (stdio processes, servers that track session state), use the default fresh-session behavior to avoid context mixing.
##
[​
](#advanced-usage)
Advanced Usage
###
[​
](#fastmcpproxy-class)
FastMCPProxy Class
For explicit session control, use `FastMCPProxy` directly:
```
`from fastmcp.server.providers.proxy import FastMCPProxy, ProxyClient
# Custom session factory
def create\_client():
return ProxyClient("backend\_server.py")
proxy = FastMCPProxy(client\_factory=create\_client)
`
```
This gives you full control over session creation and reuse strategies.
###
[​
](#adding-proxied-components-to-existing-server)
Adding Proxied Components to Existing Server
Mount a proxy to add components from another server:
```
`from fastmcp import FastMCP
from fastmcp.server import create\_proxy
server = FastMCP("My Server")
# Add local tools
@server.tool
def local\_tool() -\> str:
return "Local result"
# Mount proxied tools from another server
external = create\_proxy("http://external-server/mcp")
server.mount(external)
# Now server has both local and proxied tools
`
```