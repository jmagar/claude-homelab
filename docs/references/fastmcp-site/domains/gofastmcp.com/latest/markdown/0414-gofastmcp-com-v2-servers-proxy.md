Proxy Servers - FastMCP
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
New in version `2.0.0`
FastMCP provides a powerful proxying capability that allows one FastMCP server instance to act as a frontend for another MCP server (which could be remote, running on a different transport, or even another FastMCP instance). This is achieved using the `FastMCP.as\_proxy()` class method.
##
[​
](#what-is-proxying)
What is Proxying?
Proxying means setting up a FastMCP server that doesn’t implement its own tools or resources directly. Instead, when it receives a request (like `tools/call` or `resources/read`), it forwards that request to a *backend* MCP server, receives the response, and then relays that response back to the original client.
###
[​
](#key-benefits)
Key Benefits
New in version `2.10.3`
* **Session Isolation**: Each request gets its own isolated session, ensuring safe concurrent operations
* **Transport Bridging**: Expose servers running on one transport via a different transport
* **Advanced MCP Features**: Automatic forwarding of sampling, elicitation, logging, and progress
* **Security**: Acts as a controlled gateway to backend servers
* **Simplicity**: Single endpoint even if backend location or transport changes
###
[​
](#performance-considerations)
Performance Considerations
When using proxy servers, especially those connecting to HTTP-based backend servers, be aware that latency can be significant. Operations like `list\_tools()` may take hundreds of milliseconds compared to 1-2ms for local tools. When mounting proxy servers, this latency affects all operations on the parent server, not just interactions with the proxied tools.
If low latency is a requirement for your use-case, consider using [`import\_server()`](/v2/servers/composition#importing-static-composition) to copy tools at startup rather than proxying them at runtime.
##
[​
](#quick-start)
Quick Start
New in version `2.10.3`
The recommended way to create a proxy is using `ProxyClient`, which provides full MCP feature support with automatic session isolation:
```
`from fastmcp import FastMCP
from fastmcp.server.proxy import ProxyClient
# Create a proxy with full MCP feature support
proxy = FastMCP.as\_proxy(
ProxyClient("backend\_server.py"),
name="MyProxy"
)
# Run the proxy (e.g., via stdio for Claude Desktop)
if \_\_name\_\_ == "\_\_main\_\_":
proxy.run()
`
```
This single setup gives you:
* Safe concurrent request handling
* Automatic forwarding of advanced MCP features (sampling, elicitation, etc.)
* Session isolation to prevent context mixing
* Full compatibility with all MCP clients
You can also pass a FastMCP [client transport](/v2/clients/transports) (or parameter that can be inferred to a transport) to `as\_proxy()`. This will automatically create a `ProxyClient` instance for you.
Finally, you can pass a regular FastMCP `Client` instance to `as\_proxy()`. This will work for many use cases, but may break if advanced MCP features like sampling or elicitation are invoked by the server.
##
[​
](#session-isolation-&amp;-concurrency)
Session Isolation & Concurrency
New in version `2.10.3`
FastMCP proxies provide session isolation to ensure safe concurrent operations. The session strategy depends on how the proxy is configured:
###
[​
](#fresh-sessions)
Fresh Sessions
When you pass a disconnected client (which is the normal case), each request gets its own isolated backend session:
```
`from fastmcp.server.proxy import ProxyClient
# Each request creates a fresh backend session (recommended)
proxy = FastMCP.as\_proxy(ProxyClient("backend\_server.py"))
# Multiple clients can use this proxy simultaneously without interference:
# - Client A calls a tool -\> gets isolated backend session
# - Client B calls a tool -\> gets different isolated backend session
# - No context mixing between requests
`
```
###
[​
](#session-reuse-with-connected-clients)
Session Reuse with Connected Clients
When you pass an already-connected client, the proxy will reuse that session for all requests:
```
`from fastmcp import Client
# Create and connect a client
async with Client("backend\_server.py") as connected\_client:
# This proxy will reuse the connected session for all requests
proxy = FastMCP.as\_proxy(connected\_client)
# ⚠️ Warning: All requests share the same backend session
# This may cause context mixing in concurrent scenarios
`
```
**Important**: Using shared sessions with concurrent requests from multiple clients may lead to context mixing and race conditions. This approach should only be used in single-threaded scenarios or when you have explicit synchronization.
##
[​
](#transport-bridging)
Transport Bridging
A common use case is bridging transports - exposing a server running on one transport via a different transport. For example, making a remote SSE server available locally via stdio:
```
`from fastmcp import FastMCP
from fastmcp.server.proxy import ProxyClient
# Bridge remote SSE server to local stdio
remote\_proxy = FastMCP.as\_proxy(
ProxyClient("http://example.com/mcp/sse"),
name="Remote-to-Local Bridge"
)
# Run locally via stdio for Claude Desktop
if \_\_name\_\_ == "\_\_main\_\_":
remote\_proxy.run() # Defaults to stdio transport
`
```
Or expose a local server via HTTP for remote access:
```
`# Bridge local server to HTTP
local\_proxy = FastMCP.as\_proxy(
ProxyClient("local\_server.py"),
name="Local-to-HTTP Bridge"
)
# Run via HTTP for remote clients
if \_\_name\_\_ == "\_\_main\_\_":
local\_proxy.run(transport="http", host="0.0.0.0", port=8080)
`
```
##
[​
](#advanced-mcp-features)
Advanced MCP Features
New in version `2.10.3`
`ProxyClient` automatically forwards advanced MCP protocol features between the backend server and clients connected to the proxy, ensuring full MCP compatibility.
###
[​
](#supported-features)
Supported Features
* **Roots**: Forwards filesystem root access requests to the client
* **Sampling**: Forwards LLM completion requests from backend to client
* **Elicitation**: Forwards user input requests to the client
* **Logging**: Forwards log messages from backend through to client
* **Progress**: Forwards progress notifications during long operations
```
`from fastmcp.server.proxy import ProxyClient
# ProxyClient automatically handles all these features
backend = ProxyClient("advanced\_backend.py")
proxy = FastMCP.as\_proxy(backend)
# When the backend server:
# - Requests LLM sampling -\> forwarded to your client
# - Logs messages -\> appear in your client
# - Reports progress -\> shown in your client
# - Needs user input -\> prompts your client
`
```
###
[​
](#customizing-feature-support)
Customizing Feature Support
You can selectively disable forwarding by passing `None` for specific handlers:
```
`# Disable sampling but keep other features
backend = ProxyClient(
"backend\_server.py",
sampling\_handler=None, # Disable LLM sampling forwarding
log\_handler=None # Disable log forwarding
)
`
```
When you use a transport string directly with `FastMCP.as\_proxy()`, it automatically creates a `ProxyClient` internally to ensure full feature support.
##
[​
](#configuration-based-proxies)
Configuration-Based Proxies
New in version `2.4.0`
You can create a proxy directly from a configuration dictionary that follows the MCPConfig schema. This is useful for quickly setting up proxies to remote servers without manually configuring each connection detail.
```
`from fastmcp import FastMCP
# Create a proxy directly from a config dictionary
config = {
"mcpServers": {
"default": { # For single server configs, 'default' is commonly used
"url": "https://example.com/mcp",
"transport": "http"
}
}
}
# Create a proxy to the configured server (auto-creates ProxyClient)
proxy = FastMCP.as\_proxy(config, name="Config-Based Proxy")
# Run the proxy with stdio transport for local access
if \_\_name\_\_ == "\_\_main\_\_":
proxy.run()
`
```
The MCPConfig format follows an emerging standard for MCP server configuration and may evolve as the specification matures. While FastMCP aims to maintain compatibility with future versions, be aware that field names or structure might change.
###
[​
](#multi-server-configurations)
Multi-Server Configurations
You can create a proxy to multiple servers by specifying multiple entries in the config. They are automatically mounted with their config names as prefixes:
```
`# Multi-server configuration
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
# Create a unified proxy to multiple servers
composite\_proxy = FastMCP.as\_proxy(config, name="Composite Proxy")
# Tools, resources, prompts, and templates are accessible with prefixes:
# - Tools: weather\_get\_forecast, calendar\_add\_event
# - Prompts: weather\_daily\_summary, calendar\_quick\_add
# - Resources: weather://weather/icons/sunny, calendar://calendar/events/today
# - Templates: weather://weather/locations/{id}, calendar://calendar/events/{date}
`
```
##
[​
](#component-prefixing)
Component Prefixing
When proxying one or more servers, component names are prefixed the same way as with mounting and importing:
* Tools: `{prefix}\_{tool\_name}`
* Prompts: `{prefix}\_{prompt\_name}`
* Resources: `protocol://{prefix}/path/to/resource` (default path format)
* Resource templates: `protocol://{prefix}/...` and template names are also prefixed
These rules apply uniformly whether you:
* Mount a proxy on another server
* Create a multi-server proxy from an `MCPConfig`
* Use `FastMCP.as\_proxy()` directly
##
[​
](#mirrored-components)
Mirrored Components
New in version `2.10.5`
When you access tools, resources, or prompts from a proxy server, they are “mirrored” from the remote server. Mirrored components cannot be modified directly since they reflect the state of the remote server. For example, you can not simply “disable” a mirrored component.
However, you can create a copy of a mirrored component and store it as a new locally-defined component. Local components always take precedence over mirrored ones because the proxy server will check its own registry before it attempts to engage the remote server.
Therefore, to enable or disable a proxy tool, resource, or prompt, you should first create a local copy and add it to your own server. Here’s an example of how to do that for a tool:
```
`# Create your own server
my\_server = FastMCP("MyServer")
# Get a proxy server
proxy = FastMCP.as\_proxy("backend\_server.py")
# Get mirrored components from proxy
mirrored\_tool = await proxy.get\_tool("useful\_tool")
# Create a local copy that you can modify
local\_tool = mirrored\_tool.copy()
# Add the local copy to your server
my\_server.add\_tool(local\_tool)
# Now you can disable YOUR copy
local\_tool.disable()
`
```
##
[​
](#fastmcpproxy-class)
`FastMCPProxy` Class
Internally, `FastMCP.as\_proxy()` uses the `FastMCPProxy` class. You generally don’t need to interact with this class directly, but it’s available if needed for advanced scenarios.
###
[​
](#direct-usage)
Direct Usage
```
`from fastmcp.server.proxy import FastMCPProxy, ProxyClient
# Provide a client factory for explicit session control
def create\_client():
return ProxyClient("backend\_server.py")
proxy = FastMCPProxy(client\_factory=create\_client)
`
```
###
[​
](#parameters)
Parameters
* **`client\_factory`**: A callable that returns a `Client` instance when called. This gives you full control over session creation and reuse strategies.
###
[​
](#explicit-session-management)
Explicit Session Management
`FastMCPProxy` requires explicit session management - no automatic detection is performed. You must choose your session strategy:
```
`# Share session across all requests (be careful with concurrency)
shared\_client = ProxyClient("backend\_server.py")
def shared\_session\_factory():
return shared\_client
proxy = FastMCPProxy(client\_factory=shared\_session\_factory)
# Create fresh sessions per request (recommended)
def fresh\_session\_factory():
return ProxyClient("backend\_server.py")
proxy = FastMCPProxy(client\_factory=fresh\_session\_factory)
`
```
For automatic session strategy selection, use the convenience method `FastMCP.as\_proxy()` instead.
```
`# Custom factory with specific configuration
def custom\_client\_factory():
client = ProxyClient("backend\_server.py")
# Add any custom configuration here
return client
proxy = FastMCPProxy(client\_factory=custom\_client\_factory)
`
```