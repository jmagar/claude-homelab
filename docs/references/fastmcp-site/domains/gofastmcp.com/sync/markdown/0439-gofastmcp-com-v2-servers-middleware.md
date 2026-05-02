MCP Middleware - FastMCP
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
New in version `2.9.0`
MCP middleware is a powerful concept that allows you to add cross-cutting functionality to your FastMCP server. Unlike traditional web middleware, MCP middleware is designed specifically for the Model Context Protocol, providing hooks for different types of MCP operations like tool calls, resource reads, and prompt requests.
MCP middleware is a FastMCP-specific concept and is not part of the official MCP protocol specification. This middleware system is designed to work with FastMCP servers and may not be compatible with other MCP implementations.
MCP middleware is a brand new concept and may be subject to breaking changes in future versions.
##
[​
](#what-is-mcp-middleware)
What is MCP Middleware?
MCP middleware lets you intercept and modify MCP requests and responses as they flow through your server. Think of it as a pipeline where each piece of middleware can inspect what’s happening, make changes, and then pass control to the next middleware in the chain.
Common use cases for MCP middleware include:
* **Authentication and Authorization**: Verify client permissions before executing operations
* **Logging and Monitoring**: Track usage patterns and performance metrics
* **Rate Limiting**: Control request frequency per client or operation type
* **Request/Response Transformation**: Modify data before it reaches tools or after it leaves
* **Caching**: Store frequently requested data to improve performance
* **Error Handling**: Provide consistent error responses across your server
##
[​
](#how-middleware-works)
How Middleware Works
FastMCP middleware operates on a pipeline model. When a request comes in, it flows through your middleware in the order they were added to the server. Each middleware can:
1. **Inspect the incoming request** and its context
2. **Modify the request** before passing it to the next middleware or handler
3. **Execute the next middleware/handler** in the chain by calling `call\_next()`
4. **Inspect and modify the response** before returning it
5. **Handle errors** that occur during processing
The key insight is that middleware forms a chain where each piece decides whether to continue processing or stop the chain entirely.
If you’re familiar with ASGI middleware, the basic structure of FastMCP middleware will feel familiar. At its core, middleware is a callable class that receives a context object containing information about the current JSON-RPC message and a handler function to continue the middleware chain.
It’s important to understand that MCP operates on the [JSON-RPC specification](https://spec.modelcontextprotocol.io/specification/basic/transports/). While FastMCP presents requests and responses in a familiar way, these are fundamentally JSON-RPC messages, not HTTP request/response pairs like you might be used to in web applications. FastMCP middleware works with all [transport types](/v2/clients/transports), including local stdio transport and HTTP transports, though not all middleware implementations are compatible across all transports (e.g., middleware that inspects HTTP headers won’t work with stdio transport).
The most fundamental way to implement middleware is by overriding the `\_\_call\_\_` method on the `Middleware` base class:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class RawMiddleware(Middleware):
async def \_\_call\_\_(self, context: MiddlewareContext, call\_next):
# This method receives ALL messages regardless of type
print(f"Raw middleware processing: {context.method}")
result = await call\_next(context)
print(f"Raw middleware completed: {context.method}")
return result
`
```
This gives you complete control over every message that flows through your server, but requires you to handle all message types manually.
##
[​
](#middleware-hooks)
Middleware Hooks
To make it easier for users to target specific types of messages, FastMCP middleware provides a variety of specialized hooks. Instead of implementing the raw `\_\_call\_\_` method, you can override specific hook methods that are called only for certain types of operations, allowing you to target exactly the level of specificity you need for your middleware logic.
###
[​
](#hook-hierarchy-and-execution-order)
Hook Hierarchy and Execution Order
FastMCP provides multiple hooks that are called with varying levels of specificity. Understanding this hierarchy is crucial for effective middleware design.
When a request comes in, **multiple hooks may be called for the same request**, going from general to specific:
1. **`on\_message`** - Called for ALL MCP messages (both requests and notifications)
2. **`on\_request` or `on\_notification`** - Called based on the message type
3. **Operation-specific hooks** - Called for specific MCP operations like `on\_call\_tool`
For example, when a client calls a tool, your middleware will receive **multiple hook calls**:
1. `on\_message` and `on\_request` for any initial tool discovery operations (list\_tools)
2. `on\_message` (because it’s any MCP message) for the tool call itself
3. `on\_request` (because tool calls expect responses) for the tool call itself
4. `on\_call\_tool` (because it’s specifically a tool execution) for the tool call itself
Note that the MCP SDK may perform additional operations like listing tools for caching purposes, which will trigger additional middleware calls beyond just the direct tool execution.
This hierarchy allows you to target your middleware logic with the right level of specificity. Use `on\_message` for broad concerns like logging, `on\_request` for authentication, and `on\_call\_tool` for tool-specific logic like performance monitoring.
###
[​
](#available-hooks)
Available Hooks
New in version `2.9.0`
* `on\_message`: Called for all MCP messages (requests and notifications)
* `on\_request`: Called specifically for MCP requests (that expect responses)
* `on\_notification`: Called specifically for MCP notifications (fire-and-forget)
* `on\_call\_tool`: Called when tools are being executed
* `on\_read\_resource`: Called when resources are being read
* `on\_get\_prompt`: Called when prompts are being retrieved
* `on\_list\_tools`: Called when listing available tools
* `on\_list\_resources`: Called when listing available resources
* `on\_list\_resource\_templates`: Called when listing resource templates
* `on\_list\_prompts`: Called when listing available prompts
New in version `2.13.0`
* `on\_initialize`: Called when a client connects and initializes the session (returns `None`)
The `on\_initialize` hook receives the client’s initialization request but **returns `None`** rather than a result. The initialization response is handled internally by the MCP protocol and cannot be modified by middleware. This hook is useful for client detection, logging connections, or initializing session state, but not for modifying the initialization handshake itself.
**Example:**
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
from mcp import McpError
from mcp.types import ErrorData
class InitializationMiddleware(Middleware):
async def on\_initialize(self, context: MiddlewareContext, call\_next):
# Check client capabilities before initialization
client\_info = context.message.params.get("clientInfo", {})
client\_name = client\_info.get("name", "unknown")
# Reject unsupported clients BEFORE call\_next
if client\_name == "unsupported-client":
raise McpError(ErrorData(code=-32000, message="This client is not supported"))
# Log successful initialization
await call\_next(context)
print(f"Client {client\_name} initialized successfully")
`
```
If you raise `McpError` in `on\_initialize` **after** calling `call\_next()`, the error will only be logged and will not be sent to the client. The initialization response has already been sent at that point. Always raise `McpError` **before** `call\_next()` if you want to reject the initialization.
###
[​
](#mcp-session-availability-in-middleware)
MCP Session Availability in Middleware
New in version `2.13.1`
The MCP session and request context are not available during certain phases like initialization. When middleware runs during these phases, `context.fastmcp\_context.request\_context` returns `None` rather than the full MCP request context.
This typically occurs when:
* The `on\_request` hook fires during client initialization
* The MCP handshake hasn’t completed yet
To handle this in middleware, check if the MCP request context is available before accessing MCP-specific attributes. Note that the MCP request context is distinct from the HTTP request - for HTTP transports, you can use HTTP helpers to access request data even when the MCP session is not available:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class SessionAwareMiddleware(Middleware):
async def on\_request(self, context: MiddlewareContext, call\_next):
ctx = context.fastmcp\_context
if ctx.request\_context:
# MCP session available - can access session-specific attributes
session\_id = ctx.session\_id
request\_id = ctx.request\_id
else:
# MCP session not available yet - use HTTP helpers for request data (if using HTTP transport)
from fastmcp.server.dependencies import get\_http\_headers
headers = get\_http\_headers()
# Access HTTP data for auth, logging, etc.
return await call\_next(context)
`
```
For HTTP request data (headers, client IP, etc.) when using HTTP transports, use `get\_http\_request()` or `get\_http\_headers()` from `fastmcp.server.dependencies`, which work regardless of MCP session availability. See [HTTP Requests](/v2/servers/context#http-requests) for details.
##
[​
](#component-access-in-middleware)
Component Access in Middleware
Understanding how to access component information (tools, resources, prompts) in middleware is crucial for building powerful middleware functionality. The access patterns differ significantly between listing operations and execution operations.
###
[​
](#listing-operations-vs-execution-operations)
Listing Operations vs Execution Operations
FastMCP middleware handles two types of operations differently:
**Listing Operations** (`on\_list\_tools`, `on\_list\_resources`, `on\_list\_prompts`, etc.):
* Middleware receives **FastMCP component objects** with full metadata
* These objects include FastMCP-specific properties like `tags` that can be accessed directly from the component
* The result contains complete component information before it’s converted to MCP format
* Tags are included in the component’s `meta` field in the listing response returned to MCP clients
**Execution Operations** (`on\_call\_tool`, `on\_read\_resource`, `on\_get\_prompt`):
* Middleware runs **before** the component is executed
* The middleware result is either the execution result or an error if the component wasn’t found
* Component metadata isn’t directly available in the hook parameters
###
[​
](#accessing-component-metadata-during-execution)
Accessing Component Metadata During Execution
If you need to check component properties (like tags) during execution operations, use the FastMCP server instance available through the context:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
from fastmcp.exceptions import ToolError
class TagBasedMiddleware(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
# Access the tool object to check its metadata
if context.fastmcp\_context:
try:
tool = await context.fastmcp\_context.fastmcp.get\_tool(context.message.name)
# Check if this tool has a "private" tag
if "private" in tool.tags:
raise ToolError("Access denied: private tool")
# Check if tool is enabled
if not tool.enabled:
raise ToolError("Tool is currently disabled")
except Exception:
# Tool not found or other error - let execution continue
# and handle the error naturally
pass
return await call\_next(context)
`
```
The same pattern works for resources and prompts:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
from fastmcp.exceptions import ResourceError, PromptError
class ComponentAccessMiddleware(Middleware):
async def on\_read\_resource(self, context: MiddlewareContext, call\_next):
if context.fastmcp\_context:
try:
resource = await context.fastmcp\_context.fastmcp.get\_resource(context.message.uri)
if "restricted" in resource.tags:
raise ResourceError("Access denied: restricted resource")
except Exception:
pass
return await call\_next(context)
async def on\_get\_prompt(self, context: MiddlewareContext, call\_next):
if context.fastmcp\_context:
try:
prompt = await context.fastmcp\_context.fastmcp.get\_prompt(context.message.name)
if not prompt.enabled:
raise PromptError("Prompt is currently disabled")
except Exception:
pass
return await call\_next(context)
`
```
###
[​
](#working-with-listing-results)
Working with Listing Results
For listing operations, the middleware `call\_next` function returns a list of FastMCP components prior to being converted to MCP format. You can filter or modify this list and return it to the client. For example:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class ListingFilterMiddleware(Middleware):
async def on\_list\_tools(self, context: MiddlewareContext, call\_next):
result = await call\_next(context)
# Filter out tools with "private" tag
filtered\_tools = [
tool for tool in result
if "private" not in tool.tags
]
# Return modified list
return filtered\_tools
`
```
This filtering happens before the components are converted to MCP format and returned to the client. Tags are accessible both during filtering and are included in the component’s `meta` field in the final listing response.
When filtering components in listing operations, ensure you also prevent execution of filtered components in the corresponding execution hooks (`on\_call\_tool`, `on\_read\_resource`, `on\_get\_prompt`) to maintain consistency.
###
[​
](#tool-call-denial)
Tool Call Denial
You can deny access to specific tools by raising a `ToolError` in your middleware. This is the correct way to block tool execution, as it integrates properly with the FastMCP error handling system.
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
from fastmcp.exceptions import ToolError
class AuthMiddleware(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
tool\_name = context.message.name
# Deny access to restricted tools
if tool\_name.lower() in ["delete", "admin\_config"]:
raise ToolError("Access denied: tool requires admin privileges")
# Allow other tools to proceed
return await call\_next(context)
`
```
When denying tool calls, always raise `ToolError` rather than returning `ToolResult` objects or other values. `ToolError` ensures proper error propagation through the middleware chain and converts to the correct MCP error response format.
###
[​
](#tool-call-modification)
Tool Call Modification
For execution operations like tool calls, you can modify arguments before execution or transform results afterward:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class ToolCallMiddleware(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
# Modify arguments before execution
if context.message.name == "calculate":
# Ensure positive inputs
if context.message.arguments.get("value", 0) \< 0:
context.message.arguments["value"] = abs(context.message.arguments["value"])
result = await call\_next(context)
# Transform result after execution
if context.message.name == "get\_data":
# Add metadata to result
if result.structured\_content:
result.structured\_content["processed\_at"] = "2024-01-01T00:00:00Z"
return result
`
```
For more complex tool rewriting scenarios, consider using [Tool Transformation](/v2/patterns/tool-transformation) patterns which provide a more structured approach to creating modified tool variants.
###
[​
](#anatomy-of-a-hook)
Anatomy of a Hook
Every middleware hook follows the same pattern. Let’s examine the `on\_message` hook to understand the structure:
```
`async def on\_message(self, context: MiddlewareContext, call\_next):
# 1. Pre-processing: Inspect and optionally modify the request
print(f"Processing {context.method}")
# 2. Chain continuation: Call the next middleware/handler
result = await call\_next(context)
# 3. Post-processing: Inspect and optionally modify the response
print(f"Completed {context.method}")
# 4. Return the result (potentially modified)
return result
`
```
###
[​
](#hook-parameters)
Hook Parameters
Every hook receives two parameters:
1. **`context: MiddlewareContext`** - Contains information about the current request:
* `context.method` - The MCP method name (e.g., “tools/call”)
* `context.source` - Where the request came from (“client” or “server”)
* `context.type` - Message type (“request” or “notification”)
* `context.message` - The MCP message data
* `context.timestamp` - When the request was received
* `context.fastmcp\_context` - FastMCP Context object (if available)
* **`call\_next`** - A function that continues the middleware chain. You **must** call this to proceed, unless you want to stop processing entirely.
###
[​
](#control-flow)
Control Flow
You have complete control over the request flow:
* **Continue processing**: Call `await call\_next(context)` to proceed
* **Modify the request**: Change the context before calling `call\_next`
* **Modify the response**: Change the result after calling `call\_next`
* **Stop the chain**: Don’t call `call\_next` (rarely needed)
* **Handle errors**: Wrap `call\_next` in try/catch blocks
####
[​
](#state-management)
State Management
New in version `2.11.0`
In addition to modifying the request and response, you can also store state data that your tools can (optionally) access later. To do so, use the FastMCP Context to either `set\_state` or `get\_state` as appropriate. For more information, see the [Context State Management](/v2/servers/context#state-management) docs.
##
[​
](#creating-middleware)
Creating Middleware
FastMCP middleware is implemented by subclassing the `Middleware` base class and overriding the hooks you need. You only need to implement the hooks that are relevant to your use case.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware import Middleware, MiddlewareContext
class LoggingMiddleware(Middleware):
"""Middleware that logs all MCP operations."""
async def on\_message(self, context: MiddlewareContext, call\_next):
"""Called for all MCP messages."""
print(f"Processing {context.method} from {context.source}")
result = await call\_next(context)
print(f"Completed {context.method}")
return result
# Add middleware to your server
mcp = FastMCP("MyServer")
mcp.add\_middleware(LoggingMiddleware())
`
```
This creates a basic logging middleware that will print information about every request that flows through your server.
##
[​
](#adding-middleware-to-your-server)
Adding Middleware to Your Server
###
[​
](#single-middleware)
Single Middleware
Adding middleware to your server is straightforward:
```
`mcp = FastMCP("MyServer")
mcp.add\_middleware(LoggingMiddleware())
`
```
###
[​
](#multiple-middleware)
Multiple Middleware
Middleware executes in the order it’s added to the server. The first middleware added runs first on the way in, and last on the way out:
```
`mcp = FastMCP("MyServer")
mcp.add\_middleware(AuthenticationMiddleware("secret-token"))
mcp.add\_middleware(PerformanceMiddleware())
mcp.add\_middleware(LoggingMiddleware())
`
```
This creates the following execution flow:
1. AuthenticationMiddleware (pre-processing)
2. PerformanceMiddleware (pre-processing)
3. LoggingMiddleware (pre-processing)
4. Actual tool/resource handler
5. LoggingMiddleware (post-processing)
6. PerformanceMiddleware (post-processing)
7. AuthenticationMiddleware (post-processing)
##
[​
](#server-composition-and-middleware)
Server Composition and Middleware
When using [Server Composition](/v2/servers/composition) with `mount` or `import\_server`, middleware behavior follows these rules:
1. **Parent server middleware** runs for all requests, including those routed to mounted servers
2. **Mounted server middleware** only runs for requests handled by that specific server
3. **Middleware order** is preserved within each server
This allows you to create layered middleware architectures where parent servers handle cross-cutting concerns like authentication, while child servers focus on domain-specific middleware.
```
`# Parent server with middleware
parent = FastMCP("Parent")
parent.add\_middleware(AuthenticationMiddleware("token"))
# Child server with its own middleware
child = FastMCP("Child")
child.add\_middleware(LoggingMiddleware())
@child.tool
def child\_tool() -\> str:
return "from child"
# Mount the child server
parent.mount(child, prefix="child")
`
```
When a client calls “child\_tool”, the request will flow through the parent’s authentication middleware first, then route to the child server where it will go through the child’s logging middleware.
##
[​
](#built-in-middleware-examples)
Built-in Middleware Examples
FastMCP includes several middleware implementations that demonstrate best practices and provide immediately useful functionality. Let’s explore how each type works by building simplified versions, then see how to use the full implementations.
###
[​
](#timing-middleware)
Timing Middleware
Performance monitoring is essential for understanding your server’s behavior and identifying bottlenecks. FastMCP includes timing middleware at `fastmcp.server.middleware.timing`.
Here’s an example of how it works:
```
`import time
from fastmcp.server.middleware import Middleware, MiddlewareContext
class SimpleTimingMiddleware(Middleware):
async def on\_request(self, context: MiddlewareContext, call\_next):
start\_time = time.perf\_counter()
try:
result = await call\_next(context)
duration\_ms = (time.perf\_counter() - start\_time) \* 1000
print(f"Request {context.method} completed in {duration\_ms:.2f}ms")
return result
except Exception as e:
duration\_ms = (time.perf\_counter() - start\_time) \* 1000
print(f"Request {context.method} failed after {duration\_ms:.2f}ms: {e}")
raise
`
```
To use the full version with proper logging and configuration:
```
`from fastmcp.server.middleware.timing import (
TimingMiddleware,
DetailedTimingMiddleware
)
# Basic timing for all requests
mcp.add\_middleware(TimingMiddleware())
# Detailed per-operation timing (tools, resources, prompts)
mcp.add\_middleware(DetailedTimingMiddleware())
`
```
The built-in versions include custom logger support, proper formatting, and **DetailedTimingMiddleware** provides operation-specific hooks like `on\_call\_tool` and `on\_read\_resource` for granular timing.
###
[​
](#tool-injection-middleware)
Tool Injection Middleware
Tool injection middleware is a middleware that injects tools into the server during the request lifecycle:
```
`from fastmcp.server.middleware.tool\_injection import ToolInjectionMiddleware
def my\_tool\_fn(a: int, b: int) -\> int:
return a + b
my\_tool = Tool.from\_function(fn=my\_tool\_fn, name="my\_tool")
mcp.add\_middleware(ToolInjectionMiddleware(tools=[my\_tool]))
`
```
###
[​
](#prompt-tool-middleware)
Prompt Tool Middleware
Prompt tool middleware is a compatibility middleware for clients that are unable to list or get prompts. It provides two tools: `list\_prompts` and `get\_prompt` which allow clients to list and get prompts respectively using only tool calls.
```
`from fastmcp.server.middleware.tool\_injection import PromptToolMiddleware
mcp.add\_middleware(PromptToolMiddleware())
`
```
###
[​
](#resource-tool-middleware)
Resource Tool Middleware
Resource tool middleware is a compatibility middleware for clients that are unable to list or read resources. It provides two tools: `list\_resources` and `read\_resource` which allow clients to list and read resources respectively using only tool calls.
```
`from fastmcp.server.middleware.tool\_injection import ResourceToolMiddleware
mcp.add\_middleware(ResourceToolMiddleware())
`
```
###
[​
](#caching-middleware)
Caching Middleware
Caching middleware is essential for improving performance and reducing server load. FastMCP provides caching middleware at `fastmcp.server.middleware.caching`.
Here’s how to use the full version:
```
`from fastmcp.server.middleware.caching import ResponseCachingMiddleware
mcp.add\_middleware(ResponseCachingMiddleware())
`
```
Out of the box, it caches call/list tool, resources, and prompts to an in-memory cache with TTL-based expiration. Cache entries expire based on their TTL; there is no event-based cache invalidation. List calls are stored under global keys—when sharing a storage backend across multiple servers, consider namespacing collections to prevent conflicts. See [Storage Backends](/v2/servers/storage-backends) for advanced configuration options.
Each method can be configured individually, for example, caching list tools for 30 seconds, limiting caching to specific tools, and disabling caching for resource reads:
```
`from fastmcp.server.middleware.caching import ResponseCachingMiddleware, CallToolSettings, ListToolsSettings, ReadResourceSettings
mcp.add\_middleware(ResponseCachingMiddleware(
list\_tools\_settings=ListToolsSettings(
ttl=30,
),
call\_tool\_settings=CallToolSettings(
included\_tools=["tool1"],
),
read\_resource\_settings=ReadResourceSettings(
enabled=False
)
))
`
```
####
[​
](#storage-backends)
Storage Backends
By default, caching uses in-memory storage, which is fast but doesn’t persist across restarts. For production or persistent caching across server restarts, configure a different storage backend. See [Storage Backends](/v2/servers/storage-backends) for complete options including disk, Redis, DynamoDB, and custom implementations.
Disk-based caching example:
```
`from fastmcp.server.middleware.caching import ResponseCachingMiddleware
from key\_value.aio.stores.disk import DiskStore
mcp.add\_middleware(ResponseCachingMiddleware(
cache\_storage=DiskStore(directory="cache"),
))
`
```
Redis for distributed deployments:
```
`from fastmcp.server.middleware.caching import ResponseCachingMiddleware
from key\_value.aio.stores.redis import RedisStore
mcp.add\_middleware(ResponseCachingMiddleware(
cache\_storage=RedisStore(host="redis.example.com", port=6379),
))
`
```
####
[​
](#cache-statistics)
Cache Statistics
The caching middleware collects operation statistics (hits, misses, etc.) through the underlying storage layer. Access statistics from the middleware instance:
```
`from fastmcp.server.middleware.caching import ResponseCachingMiddleware
middleware = ResponseCachingMiddleware()
mcp.add\_middleware(middleware)
# Later, retrieve statistics
stats = middleware.statistics()
print(f"Total cache operations: {stats}")
`
```
###
[​
](#logging-middleware)
Logging Middleware
Request and response logging is crucial for debugging, monitoring, and understanding usage patterns in your MCP server. FastMCP provides comprehensive logging middleware at `fastmcp.server.middleware.logging`.
Here’s an example of how it works:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class SimpleLoggingMiddleware(Middleware):
async def on\_message(self, context: MiddlewareContext, call\_next):
print(f"Processing {context.method} from {context.source}")
try:
result = await call\_next(context)
print(f"Completed {context.method}")
return result
except Exception as e:
print(f"Failed {context.method}: {e}")
raise
`
```
To use the full versions with advanced features:
```
`from fastmcp.server.middleware.logging import (
LoggingMiddleware,
StructuredLoggingMiddleware
)
# Human-readable logging with payload support
mcp.add\_middleware(LoggingMiddleware(
include\_payloads=True,
max\_payload\_length=1000
))
# JSON-structured logging for log aggregation tools
mcp.add\_middleware(StructuredLoggingMiddleware(include\_payloads=True))
`
```
The built-in versions include payload logging, structured JSON output, custom logger support, payload size limits, and operation-specific hooks for granular control.
###
[​
](#rate-limiting-middleware)
Rate Limiting Middleware
Rate limiting is essential for protecting your server from abuse, ensuring fair resource usage, and maintaining performance under load. FastMCP includes sophisticated rate limiting middleware at `fastmcp.server.middleware.rate\_limiting`.
Here’s an example of how it works:
```
`import time
from collections import defaultdict
from fastmcp.server.middleware import Middleware, MiddlewareContext
from mcp import McpError
from mcp.types import ErrorData
class SimpleRateLimitMiddleware(Middleware):
def \_\_init\_\_(self, requests\_per\_minute: int = 60):
self.requests\_per\_minute = requests\_per\_minute
self.client\_requests = defaultdict(list)
async def on\_request(self, context: MiddlewareContext, call\_next):
current\_time = time.time()
client\_id = "default" # In practice, extract from headers or context
# Clean old requests and check limit
cutoff\_time = current\_time - 60
self.client\_requests[client\_id] = [
req\_time for req\_time in self.client\_requests[client\_id]
if req\_time \> cutoff\_time
]
if len(self.client\_requests[client\_id]) \>= self.requests\_per\_minute:
raise McpError(ErrorData(code=-32000, message="Rate limit exceeded"))
self.client\_requests[client\_id].append(current\_time)
return await call\_next(context)
`
```
To use the full versions with advanced algorithms:
```
`from fastmcp.server.middleware.rate\_limiting import (
RateLimitingMiddleware,
SlidingWindowRateLimitingMiddleware
)
# Token bucket rate limiting (allows controlled bursts)
mcp.add\_middleware(RateLimitingMiddleware(
max\_requests\_per\_second=10.0,
burst\_capacity=20
))
# Sliding window rate limiting (precise time-based control)
mcp.add\_middleware(SlidingWindowRateLimitingMiddleware(
max\_requests=100,
window\_minutes=1
))
`
```
The built-in versions include token bucket algorithms, per-client identification, global rate limiting, and async-safe implementations with configurable client identification functions.
###
[​
](#error-handling-middleware)
Error Handling Middleware
Consistent error handling and recovery is critical for robust MCP servers. FastMCP provides comprehensive error handling middleware at `fastmcp.server.middleware.error\_handling`.
Here’s an example of how it works:
```
`import logging
from fastmcp.server.middleware import Middleware, MiddlewareContext
class SimpleErrorHandlingMiddleware(Middleware):
def \_\_init\_\_(self):
self.logger = logging.getLogger("errors")
self.error\_counts = {}
async def on\_message(self, context: MiddlewareContext, call\_next):
try:
return await call\_next(context)
except Exception as error:
# Log the error and track statistics
error\_key = f"{type(error).\_\_name\_\_}:{context.method}"
self.error\_counts[error\_key] = self.error\_counts.get(error\_key, 0) + 1
self.logger.error(f"Error in {context.method}: {type(error).\_\_name\_\_}: {error}")
raise
`
```
To use the full versions with advanced features:
```
`from fastmcp.server.middleware.error\_handling import (
ErrorHandlingMiddleware,
RetryMiddleware
)
# Comprehensive error logging and transformation
mcp.add\_middleware(ErrorHandlingMiddleware(
include\_traceback=True,
transform\_errors=True,
error\_callback=my\_error\_callback
))
# Automatic retry with exponential backoff
mcp.add\_middleware(RetryMiddleware(
max\_retries=3,
retry\_exceptions=(ConnectionError, TimeoutError)
))
`
```
The built-in versions include error transformation, custom callbacks, configurable retry logic, and proper MCP error formatting.
###
[​
](#combining-middleware)
Combining Middleware
These middleware work together seamlessly:
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.timing import TimingMiddleware
from fastmcp.server.middleware.logging import LoggingMiddleware
from fastmcp.server.middleware.rate\_limiting import RateLimitingMiddleware
from fastmcp.server.middleware.error\_handling import ErrorHandlingMiddleware
mcp = FastMCP("Production Server")
# Add middleware in logical order
mcp.add\_middleware(ErrorHandlingMiddleware()) # Handle errors first
mcp.add\_middleware(RateLimitingMiddleware(max\_requests\_per\_second=50))
mcp.add\_middleware(TimingMiddleware()) # Time actual execution
mcp.add\_middleware(LoggingMiddleware()) # Log everything
@mcp.tool
def my\_tool(data: str) -\> str:
return f"Processed: {data}"
`
```
This configuration provides comprehensive monitoring, protection, and observability for your MCP server.
###
[​
](#custom-middleware-example)
Custom Middleware Example
You can also create custom middleware by extending the base class:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class CustomHeaderMiddleware(Middleware):
async def on\_request(self, context: MiddlewareContext, call\_next):
# Add custom logic here
print(f"Processing {context.method}")
result = await call\_next(context)
print(f"Completed {context.method}")
return result
mcp.add\_middleware(CustomHeaderMiddleware())
`
```