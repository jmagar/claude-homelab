Middleware - FastMCP
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
Middleware adds behavior that applies across multiple operations—authentication, logging, rate limiting, or request transformation—without modifying individual tools or resources.
MCP middleware is a FastMCP-specific concept and is not part of the official MCP protocol specification.
##
[​
](#overview)
Overview
MCP middleware forms a pipeline around your server’s operations. When a request arrives, it flows through each middleware in order—each can inspect, modify, or reject the request before passing it along. After the operation completes, the response flows back through the same middleware in reverse order.
```
`Request → Middleware A → Middleware B → Handler → Middleware B → Middleware A → Response
`
```
This bidirectional flow means middleware can:
* **Pre-process**: Validate authentication, log incoming requests, check rate limits
* **Post-process**: Transform responses, record timing metrics, handle errors consistently
The key decision point is `call\_next(context)`. Calling it continues the chain; not calling it stops processing entirely.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware import Middleware, MiddlewareContext
class LoggingMiddleware(Middleware):
async def on\_message(self, context: MiddlewareContext, call\_next):
print(f"→ {context.method}")
result = await call\_next(context)
print(f"← {context.method}")
return result
mcp = FastMCP("MyServer")
mcp.add\_middleware(LoggingMiddleware())
`
```
###
[​
](#execution-order)
Execution Order
Middleware executes in the order added to the server. The first middleware runs first on the way in and last on the way out:
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.error\_handling import ErrorHandlingMiddleware
from fastmcp.server.middleware.rate\_limiting import RateLimitingMiddleware
from fastmcp.server.middleware.logging import LoggingMiddleware
mcp = FastMCP("MyServer")
mcp.add\_middleware(ErrorHandlingMiddleware()) # 1st in, last out
mcp.add\_middleware(RateLimitingMiddleware()) # 2nd in, 2nd out
mcp.add\_middleware(LoggingMiddleware()) # 3rd in, first out
`
```
This ordering matters. Place error handling early so it catches exceptions from all subsequent middleware. Place logging late so it records the actual execution after other middleware has processed the request.
###
[​
](#server-composition)
Server Composition
When using [mounted servers](/servers/composition), middleware behavior follows a clear hierarchy:
* **Parent middleware** runs for all requests, including those routed to mounted servers
* **Mounted server middleware** only runs for requests handled by that specific server
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.logging import LoggingMiddleware
parent = FastMCP("Parent")
parent.add\_middleware(AuthMiddleware()) # Runs for ALL requests
child = FastMCP("Child")
child.add\_middleware(LoggingMiddleware()) # Only runs for child's tools
parent.mount(child, namespace="child")
`
```
Requests to `child\_tool` flow through the parent’s `AuthMiddleware` first, then through the child’s `LoggingMiddleware`.
##
[​
](#hooks)
Hooks
Rather than processing every message identically, FastMCP provides specialized hooks at different levels of specificity. Multiple hooks fire for a single request, going from general to specific:
|Level|Hooks|Purpose|
|Message|`on\_message`|All MCP traffic (requests and notifications)|
|Type|`on\_request`, `on\_notification`|Requests expecting responses vs fire-and-forget|
|Operation|`on\_call\_tool`, `on\_read\_resource`, `on\_get\_prompt`, etc.|Specific MCP operations|
When a client calls a tool, the middleware chain processes `on\_message` first, then `on\_request`, then `on\_call\_tool`. This hierarchy lets you target exactly the right scope—use `on\_message` for logging everything, `on\_request` for authentication, and `on\_call\_tool` for tool-specific behavior.
###
[​
](#hook-signature)
Hook Signature
Every hook follows the same pattern:
```
`async def hook\_name(self, context: MiddlewareContext, call\_next) -\> result\_type:
# Pre-processing
result = await call\_next(context)
# Post-processing
return result
`
```
**Parameters:**
* `context` — `MiddlewareContext` containing request information
* `call\_next` — Async function to continue the middleware chain
**Returns:** The appropriate result type for the hook (varies by operation).
###
[​
](#middlewarecontext)
MiddlewareContext
The `context` parameter provides access to request details:
|Attribute|Type|Description|
|`method`|`str`|MCP method name (e.g., `"tools/call"`)|
|`source`|`str`|Origin: `"client"` or `"server"`|
|`type`|`str`|Message type: `"request"` or `"notification"`|
|`message`|`object`|The MCP message data|
|`timestamp`|`datetime`|When the request was received|
|`fastmcp\_context`|`Context`|FastMCP context object (if available)|
###
[​
](#message-hooks)
Message Hooks
####
[​
](#on_message)
on\_message
Called for every MCP message—both requests and notifications.
```
`async def on\_message(self, context: MiddlewareContext, call\_next):
result = await call\_next(context)
return result
`
```
Use for: Logging, metrics, or any cross-cutting concern that applies to all traffic.
####
[​
](#on_request)
on\_request
Called for MCP requests that expect a response.
```
`async def on\_request(self, context: MiddlewareContext, call\_next):
result = await call\_next(context)
return result
`
```
Use for: Authentication, authorization, request validation.
####
[​
](#on_notification)
on\_notification
Called for fire-and-forget MCP notifications.
```
`async def on\_notification(self, context: MiddlewareContext, call\_next):
await call\_next(context)
# Notifications don't return values
`
```
Use for: Event logging, async side effects.
###
[​
](#operation-hooks)
Operation Hooks
####
[​
](#on_call_tool)
on\_call\_tool
Called when a tool is executed. The `context.message` contains `name` (tool name) and `arguments` (dict).
```
`async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
tool\_name = context.message.name
args = context.message.arguments
result = await call\_next(context)
return result
`
```
**Returns:** Tool execution result or raises `ToolError`.
####
[​
](#on_read_resource)
on\_read\_resource
Called when a resource is read. The `context.message` contains `uri` (resource URI).
```
`async def on\_read\_resource(self, context: MiddlewareContext, call\_next):
uri = context.message.uri
result = await call\_next(context)
return result
`
```
**Returns:** Resource content.
####
[​
](#on_get_prompt)
on\_get\_prompt
Called when a prompt is retrieved. The `context.message` contains `name` (prompt name) and `arguments` (dict).
```
`async def on\_get\_prompt(self, context: MiddlewareContext, call\_next):
prompt\_name = context.message.name
result = await call\_next(context)
return result
`
```
**Returns:** Prompt messages.
####
[​
](#on_list_tools)
on\_list\_tools
Called when listing available tools. Returns a list of FastMCP `Tool` objects before MCP conversion.
```
`async def on\_list\_tools(self, context: MiddlewareContext, call\_next):
tools = await call\_next(context)
# Filter or modify the tool list
return tools
`
```
**Returns:** `list[Tool]` — Can be filtered before returning to client.
####
[​
](#on_list_resources)
on\_list\_resources
Called when listing available resources. Returns FastMCP `Resource` objects.
```
`async def on\_list\_resources(self, context: MiddlewareContext, call\_next):
resources = await call\_next(context)
return resources
`
```
**Returns:** `list[Resource]`
####
[​
](#on_list_resource_templates)
on\_list\_resource\_templates
Called when listing resource templates.
```
`async def on\_list\_resource\_templates(self, context: MiddlewareContext, call\_next):
templates = await call\_next(context)
return templates
`
```
**Returns:** `list[ResourceTemplate]`
####
[​
](#on_list_prompts)
on\_list\_prompts
Called when listing available prompts.
```
`async def on\_list\_prompts(self, context: MiddlewareContext, call\_next):
prompts = await call\_next(context)
return prompts
`
```
**Returns:** `list[Prompt]`
####
[​
](#on_initialize)
on\_initialize
Called when a client connects and initializes the session. This hook cannot modify the initialization response.
```
`from mcp import McpError
from mcp.types import ErrorData
async def on\_initialize(self, context: MiddlewareContext, call\_next):
client\_info = context.message.params.get("clientInfo", {})
client\_name = client\_info.get("name", "unknown")
# Reject before call\_next to send error to client
if client\_name == "blocked-client":
raise McpError(ErrorData(code=-32000, message="Client not supported"))
await call\_next(context)
print(f"Client {client\_name} initialized")
`
```
**Returns:** `None` — The initialization response is handled internally by the MCP protocol.
Raising `McpError` after `call\_next()` will only log the error, not send it to the client. The response has already been sent. Always reject **before** `call\_next()`.
###
[​
](#raw-handler)
Raw Handler
For complete control over all messages, override `\_\_call\_\_` instead of individual hooks:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class RawMiddleware(Middleware):
async def \_\_call\_\_(self, context: MiddlewareContext, call\_next):
print(f"Processing: {context.method}")
result = await call\_next(context)
print(f"Completed: {context.method}")
return result
`
```
This bypasses the hook dispatch system entirely. Use when you need uniform handling regardless of message type.
###
[​
](#session-availability)
Session Availability
The MCP session may not be available during certain phases like initialization. Check before accessing session-specific attributes:
```
`async def on\_request(self, context: MiddlewareContext, call\_next):
ctx = context.fastmcp\_context
if ctx.request\_context:
# MCP session available
session\_id = ctx.session\_id
request\_id = ctx.request\_id
else:
# Session not yet established (e.g., during initialization)
# Use HTTP helpers if needed
from fastmcp.server.dependencies import get\_http\_headers
headers = get\_http\_headers()
return await call\_next(context)
`
```
For HTTP-specific data (headers, client IP) when using HTTP transports, see [HTTP Requests](/servers/context#http-requests).
##
[​
](#built-in-middleware)
Built-in Middleware
FastMCP includes production-ready middleware for common server concerns.
###
[​
](#logging)
Logging
```
`from fastmcp.server.middleware.logging import LoggingMiddleware, StructuredLoggingMiddleware
`
```
`LoggingMiddleware` provides human-readable request and response logging. `StructuredLoggingMiddleware` outputs JSON-formatted logs for aggregation tools like Datadog or Splunk.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.logging import LoggingMiddleware
mcp = FastMCP("MyServer")
mcp.add\_middleware(LoggingMiddleware(
include\_payloads=True,
max\_payload\_length=1000
))
`
```
|Parameter|Type|Default|Description|
|`include\_payloads`|`bool`|`False`|Log request/response content|
|`max\_payload\_length`|`int`|`500`|Truncate payloads beyond this length|
|`logger`|`Logger`|module logger|Custom logger instance|
###
[​
](#timing)
Timing
```
`from fastmcp.server.middleware.timing import TimingMiddleware, DetailedTimingMiddleware
`
```
`TimingMiddleware` logs execution duration for all requests. `DetailedTimingMiddleware` provides per-operation timing with separate tracking for tools, resources, and prompts.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.timing import TimingMiddleware
mcp = FastMCP("MyServer")
mcp.add\_middleware(TimingMiddleware())
`
```
###
[​
](#caching)
Caching
```
`from fastmcp.server.middleware.caching import ResponseCachingMiddleware
`
```
Caches tool calls, resource reads, and list operations with TTL-based expiration.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.caching import ResponseCachingMiddleware
mcp = FastMCP("MyServer")
mcp.add\_middleware(ResponseCachingMiddleware())
`
```
Each operation type can be configured independently using settings classes:
```
`from fastmcp.server.middleware.caching import (
ResponseCachingMiddleware,
CallToolSettings,
ListToolsSettings,
ReadResourceSettings
)
mcp.add\_middleware(ResponseCachingMiddleware(
list\_tools\_settings=ListToolsSettings(ttl=30),
call\_tool\_settings=CallToolSettings(included\_tools=["expensive\_tool"]),
read\_resource\_settings=ReadResourceSettings(enabled=False)
))
`
```
|Settings Class|Configures|
|`ListToolsSettings`|`on\_list\_tools` caching|
|`CallToolSettings`|`on\_call\_tool` caching|
|`ListResourcesSettings`|`on\_list\_resources` caching|
|`ReadResourceSettings`|`on\_read\_resource` caching|
|`ListPromptsSettings`|`on\_list\_prompts` caching|
|`GetPromptSettings`|`on\_get\_prompt` caching|
Each settings class accepts:
* `enabled` — Enable/disable caching for this operation
* `ttl` — Time-to-live in seconds
* `included\_\*` / `excluded\_\*` — Whitelist or blacklist specific items
For persistence or distributed deployments, configure a different storage backend:
```
`from pathlib import Path
from fastmcp.server.middleware.caching import ResponseCachingMiddleware
from key\_value.aio.stores.filetree import (
FileTreeStore,
FileTreeV1KeySanitizationStrategy,
FileTreeV1CollectionSanitizationStrategy,
)
cache\_dir = Path("cache")
mcp.add\_middleware(ResponseCachingMiddleware(
cache\_storage=FileTreeStore(
data\_directory=cache\_dir,
key\_sanitization\_strategy=FileTreeV1KeySanitizationStrategy(cache\_dir),
collection\_sanitization\_strategy=FileTreeV1CollectionSanitizationStrategy(cache\_dir),
)
))
`
```
See [Storage Backends](/servers/storage-backends) for complete options.
Cache keys are based on the operation name and arguments only — they do not include user or session identity. If your tools return user-specific data derived from auth context (e.g., headers or session state) rather than from the request arguments, you should either disable caching for those tools or ensure user identity is part of the tool arguments.
###
[​
](#rate-limiting)
Rate Limiting
```
`from fastmcp.server.middleware.rate\_limiting import (
RateLimitingMiddleware,
SlidingWindowRateLimitingMiddleware
)
`
```
`RateLimitingMiddleware` uses a token bucket algorithm allowing controlled bursts. `SlidingWindowRateLimitingMiddleware` provides precise time-window rate limiting without burst allowance.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.rate\_limiting import RateLimitingMiddleware
mcp = FastMCP("MyServer")
mcp.add\_middleware(RateLimitingMiddleware(
max\_requests\_per\_second=10.0,
burst\_capacity=20
))
`
```
|Parameter|Type|Default|Description|
|`max\_requests\_per\_second`|`float`|`10.0`|Sustained request rate|
|`burst\_capacity`|`int`|`20`|Maximum burst size|
|`client\_id\_func`|`Callable`|`None`|Custom client identification|
For sliding window rate limiting:
```
`from fastmcp.server.middleware.rate\_limiting import SlidingWindowRateLimitingMiddleware
mcp.add\_middleware(SlidingWindowRateLimitingMiddleware(
max\_requests=100,
window\_minutes=1
))
`
```
###
[​
](#error-handling)
Error Handling
```
`from fastmcp.server.middleware.error\_handling import ErrorHandlingMiddleware, RetryMiddleware
`
```
`ErrorHandlingMiddleware` provides centralized error logging and transformation. `RetryMiddleware` automatically retries with exponential backoff for transient failures.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.error\_handling import ErrorHandlingMiddleware
mcp = FastMCP("MyServer")
mcp.add\_middleware(ErrorHandlingMiddleware(
include\_traceback=True,
transform\_errors=True,
error\_callback=my\_error\_callback
))
`
```
|Parameter|Type|Default|Description|
|`include\_traceback`|`bool`|`False`|Include stack traces in logs|
|`transform\_errors`|`bool`|`False`|Convert exceptions to MCP errors|
|`error\_callback`|`Callable`|`None`|Custom callback on errors|
For automatic retries:
```
`from fastmcp.server.middleware.error\_handling import RetryMiddleware
mcp.add\_middleware(RetryMiddleware(
max\_retries=3,
retry\_exceptions=(ConnectionError, TimeoutError)
))
`
```
###
[​
](#ping)
Ping
```
`from fastmcp.server.middleware import PingMiddleware
`
```
Keeps long-lived connections alive by sending periodic pings.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware import PingMiddleware
mcp = FastMCP("MyServer")
mcp.add\_middleware(PingMiddleware(interval\_ms=5000))
`
```
|Parameter|Type|Default|Description|
|`interval\_ms`|`int`|`30000`|Ping interval in milliseconds|
The ping task starts on the first message and stops automatically when the session ends. Most useful for stateful HTTP connections; has no effect on stateless connections.
###
[​
](#response-limiting)
Response Limiting
```
`from fastmcp.server.middleware.response\_limiting import ResponseLimitingMiddleware
`
```
Large tool responses can overwhelm LLM context windows or cause memory issues. You can add response-limiting middleware to enforce size constraints on tool outputs.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.response\_limiting import ResponseLimitingMiddleware
mcp = FastMCP("MyServer")
# Limit all tool responses to 500KB
mcp.add\_middleware(ResponseLimitingMiddleware(max\_size=500\_000))
@mcp.tool
def search(query: str) -\> str:
# This could return a very large result
return "x" \* 1\_000\_000 # 1MB response
# When called, the response will be truncated to \~500KB with:
# "...\\n\\n[Response truncated due to size limit]"
`
```
When a response exceeds the limit, the middleware extracts all text content, joins it together, truncates to fit within the limit, and returns a single `TextContent` block. For non-text responses, the serialized JSON is used as the text source.
If a tool defines an `output\_schema`, truncated responses will no longer conform to that schema — the client will receive a plain `TextContent` block instead of the expected structured output. Keep this in mind when setting size limits for tools with structured responses.
```
`# Limit only specific tools
mcp.add\_middleware(ResponseLimitingMiddleware(
max\_size=100\_000,
tools=["search", "fetch\_data"],
))
`
```
|Parameter|Type|Default|Description|
|`max\_size`|`int`|`1\_000\_000`|Maximum response size in bytes (1MB default)|
|`truncation\_suffix`|`str`|`"\\n\\n[Response truncated due to size limit]"`|Suffix appended to truncated responses|
|`tools`|`list[str] | None`|`None`|Limit only these tools (None = all tools)|
###
[​
](#combining-middleware)
Combining Middleware
Order matters. Place middleware that should run first (on the way in) earliest:
```
`from fastmcp import FastMCP
from fastmcp.server.middleware.error\_handling import ErrorHandlingMiddleware
from fastmcp.server.middleware.rate\_limiting import RateLimitingMiddleware
from fastmcp.server.middleware.timing import TimingMiddleware
from fastmcp.server.middleware.logging import LoggingMiddleware
mcp = FastMCP("Production Server")
mcp.add\_middleware(ErrorHandlingMiddleware()) # Catch all errors
mcp.add\_middleware(RateLimitingMiddleware(max\_requests\_per\_second=50))
mcp.add\_middleware(TimingMiddleware())
mcp.add\_middleware(LoggingMiddleware())
@mcp.tool
def my\_tool(data: str) -\> str:
return f"Processed: {data}"
`
```
##
[​
](#custom-middleware)
Custom Middleware
When the built-in middleware doesn’t fit your needs—custom authentication schemes, domain-specific logging, or request transformation—subclass `Middleware` and override the hooks you need.
```
`from fastmcp import FastMCP
from fastmcp.server.middleware import Middleware, MiddlewareContext
class CustomMiddleware(Middleware):
async def on\_request(self, context: MiddlewareContext, call\_next):
# Pre-processing
print(f"→ {context.method}")
result = await call\_next(context)
# Post-processing
print(f"← {context.method}")
return result
mcp = FastMCP("MyServer")
mcp.add\_middleware(CustomMiddleware())
`
```
Override only the hooks relevant to your use case. Unoverridden hooks pass through automatically.
###
[​
](#denying-requests)
Denying Requests
Raise the appropriate error type to stop processing and return an error to the client.
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
from fastmcp.exceptions import ToolError
class AuthMiddleware(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
tool\_name = context.message.name
if tool\_name in ["delete\_all", "admin\_config"]:
raise ToolError("Access denied: requires admin privileges")
return await call\_next(context)
`
```
|Operation|Error Type|
|Tool calls|`ToolError`|
|Resource reads|`ResourceError`|
|Prompt retrieval|`PromptError`|
|General requests|`McpError`|
Do not return error values or skip `call\_next()` to indicate errors—raise exceptions for proper error propagation.
###
[​
](#modifying-requests)
Modifying Requests
Change the message before passing it down the chain.
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class InputSanitizer(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
if context.message.name == "search":
# Normalize search query
query = context.message.arguments.get("query", "")
context.message.arguments["query"] = query.strip().lower()
return await call\_next(context)
`
```
###
[​
](#modifying-responses)
Modifying Responses
Transform results after the handler executes.
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class ResponseEnricher(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
result = await call\_next(context)
if context.message.name == "get\_data" and result.structured\_content:
result.structured\_content["processed\_by"] = "enricher"
return result
`
```
For more complex tool transformations, consider [Transforms](/servers/transforms/transforms) instead.
###
[​
](#filtering-lists)
Filtering Lists
List operations return FastMCP objects that you can filter before they reach the client. When filtering list results, also block execution in the corresponding operation hook to maintain consistency:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
from fastmcp.exceptions import ToolError
class PrivateToolFilter(Middleware):
async def on\_list\_tools(self, context: MiddlewareContext, call\_next):
tools = await call\_next(context)
return [tool for tool in tools if "private" not in tool.tags]
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
if context.fastmcp\_context:
tool = await context.fastmcp\_context.fastmcp.get\_tool(context.message.name)
if "private" in tool.tags:
raise ToolError("Tool not found")
return await call\_next(context)
`
```
###
[​
](#accessing-component-metadata)
Accessing Component Metadata
During execution hooks, component metadata (like tags) isn’t directly available. Look up the component through the server:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
from fastmcp.exceptions import ToolError
class TagBasedAuth(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
if context.fastmcp\_context:
try:
tool = await context.fastmcp\_context.fastmcp.get\_tool(context.message.name)
if "requires-auth" in tool.tags:
# Check authentication here
pass
except Exception:
pass # Let execution handle missing tools
return await call\_next(context)
`
```
The same pattern works for resources and prompts:
```
`resource = await context.fastmcp\_context.fastmcp.get\_resource(context.message.uri)
prompt = await context.fastmcp\_context.fastmcp.get\_prompt(context.message.name)
`
```
###
[​
](#storing-state)
Storing State
Middleware can store state that tools access later through the FastMCP context.
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class UserMiddleware(Middleware):
async def on\_request(self, context: MiddlewareContext, call\_next):
# Extract user from headers (HTTP transport)
from fastmcp.server.dependencies import get\_http\_headers
headers = get\_http\_headers() or {}
user\_id = headers.get("x-user-id", "anonymous")
# Store for tools to access
if context.fastmcp\_context:
context.fastmcp\_context.set\_state("user\_id", user\_id)
return await call\_next(context)
`
```
Tools retrieve the state:
```
`from fastmcp import FastMCP, Context
mcp = FastMCP("MyServer")
@mcp.tool
def get\_user\_data(ctx: Context) -\> str:
user\_id = ctx.get\_state("user\_id")
return f"Data for user: {user\_id}"
`
```
See [Context State Management](/servers/context#state-management) for details.
###
[​
](#constructor-parameters)
Constructor Parameters
Initialize middleware with configuration:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class ConfigurableMiddleware(Middleware):
def \_\_init\_\_(self, api\_key: str, rate\_limit: int = 100):
self.api\_key = api\_key
self.rate\_limit = rate\_limit
self.request\_counts = {}
async def on\_request(self, context: MiddlewareContext, call\_next):
# Use self.api\_key, self.rate\_limit, etc.
return await call\_next(context)
mcp.add\_middleware(ConfigurableMiddleware(
api\_key="secret",
rate\_limit=50
))
`
```
###
[​
](#error-handling-in-custom-middleware)
Error Handling in Custom Middleware
Wrap `call\_next()` to handle errors from downstream middleware and handlers.
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class ErrorLogger(Middleware):
async def on\_request(self, context: MiddlewareContext, call\_next):
try:
return await call\_next(context)
except Exception as e:
print(f"Error in {context.method}: {type(e).\_\_name\_\_}: {e}")
raise # Re-raise to let error propagate
`
```
Catching and not re-raising suppresses the error entirely. Usually you want to log and re-raise.
###
[​
](#complete-example)
Complete Example
Authentication middleware checking API keys for specific tools:
```
`from fastmcp import FastMCP
from fastmcp.server.middleware import Middleware, MiddlewareContext
from fastmcp.server.dependencies import get\_http\_headers
from fastmcp.exceptions import ToolError
class ApiKeyAuth(Middleware):
def \_\_init\_\_(self, valid\_keys: set[str], protected\_tools: set[str]):
self.valid\_keys = valid\_keys
self.protected\_tools = protected\_tools
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
tool\_name = context.message.name
if tool\_name not in self.protected\_tools:
return await call\_next(context)
headers = get\_http\_headers() or {}
api\_key = headers.get("x-api-key")
if api\_key not in self.valid\_keys:
raise ToolError(f"Invalid API key for protected tool: {tool\_name}")
return await call\_next(context)
mcp = FastMCP("Secure Server")
mcp.add\_middleware(ApiKeyAuth(
valid\_keys={"key-1", "key-2"},
protected\_tools={"delete\_user", "admin\_panel"}
))
@mcp.tool
def delete\_user(user\_id: str) -\> str:
return f"Deleted user {user\_id}"
@mcp.tool
def get\_user(user\_id: str) -\> str:
return f"User {user\_id}" # Not protected
`
```