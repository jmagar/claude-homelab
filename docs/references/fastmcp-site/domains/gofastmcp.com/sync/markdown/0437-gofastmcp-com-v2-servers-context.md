MCP Context - FastMCP
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
When defining FastMCP [tools](/v2/servers/tools), [resources](/v2/servers/resources), resource templates, or [prompts](/v2/servers/prompts), your functions might need to interact with the underlying MCP session or access advanced server capabilities. FastMCP provides the `Context` object for this purpose.
FastMCP uses [Docket](https://github.com/chrisguidry/docket)’s dependency injection system for managing runtime dependencies. This page covers Context and the built-in dependencies; see [Custom Dependencies](#custom-dependencies) for creating your own.
##
[​
](#what-is-context)
What Is Context?
The `Context` object provides a clean interface to access MCP features within your functions, including:
* **Logging**: Send debug, info, warning, and error messages back to the client
* **Progress Reporting**: Update the client on the progress of long-running operations
* **Resource Access**: List and read data from resources registered with the server
* **Prompt Access**: List and retrieve prompts registered with the server
* **LLM Sampling**: Request the client’s LLM to generate text based on provided messages
* **User Elicitation**: Request structured input from users during tool execution
* **State Management**: Store and share data between middleware and the handler within a single request
* **Request Information**: Access metadata about the current request
* **Server Access**: When needed, access the underlying FastMCP server instance
##
[​
](#accessing-the-context)
Accessing the Context
New in version `2.14`
The preferred way to access context is using the `CurrentContext()` dependency:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentContext
from fastmcp.server.context import Context
mcp = FastMCP(name="Context Demo")
@mcp.tool
async def process\_file(file\_uri: str, ctx: Context = CurrentContext()) -\> str:
"""Processes a file, using context for logging and resource access."""
await ctx.info(f"Processing {file\_uri}")
return "Processed file"
`
```
This works with tools, resources, and prompts:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentContext
from fastmcp.server.context import Context
mcp = FastMCP(name="Context Demo")
@mcp.resource("resource://user-data")
async def get\_user\_data(ctx: Context = CurrentContext()) -\> dict:
await ctx.debug("Fetching user data")
return {"user\_id": "example"}
@mcp.prompt
async def data\_analysis\_request(dataset: str, ctx: Context = CurrentContext()) -\> str:
return f"Please analyze the following dataset: {dataset}"
`
```
**Key Points:**
* Dependency parameters are automatically excluded from the MCP schema—clients never see them.
* Context methods are async, so your function usually needs to be async as well.
* **Each MCP request receives a new context object.** Context is scoped to a single request; state or data set in one request will not be available in subsequent requests.
* Context is only available during a request; attempting to use context methods outside a request will raise errors.
###
[​
](#legacy-type-hint-injection)
Legacy Type-Hint Injection
For backwards compatibility, you can still access context by simply adding a parameter with the `Context` type hint. FastMCP will automatically inject the context instance:
```
`from fastmcp import FastMCP, Context
mcp = FastMCP(name="Context Demo")
@mcp.tool
async def process\_file(file\_uri: str, ctx: Context) -\> str:
"""Processes a file, using context for logging and resource access."""
# Context is injected automatically based on the type hint
return "Processed file"
`
```
This approach still works for tools, resources, and prompts. The parameter name doesn’t matter—only the `Context` type hint is important. The type hint can also be a union (`Context | None`) or use `Annotated[]`.
###
[​
](#via-get_context-function)
Via `get\_context()` Function
New in version `2.2.11`
For code nested deeper within your function calls where passing context through parameters is inconvenient, use `get\_context()` to retrieve the active context from anywhere within a request’s execution flow:
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_context
mcp = FastMCP(name="Dependency Demo")
# Utility function that needs context but doesn't receive it as a parameter
async def process\_data(data: list[float]) -\> dict:
# Get the active context - only works when called within a request
ctx = get\_context()
await ctx.info(f"Processing {len(data)} data points")
@mcp.tool
async def analyze\_dataset(dataset\_name: str) -\> dict:
# Call utility function that uses context internally
data = load\_data(dataset\_name)
await process\_data(data)
`
```
**Important Notes:**
* The `get\_context()` function should only be used within the context of a server request. Calling it outside of a request will raise a `RuntimeError`.
* The `get\_context()` function is server-only and should not be used in client code.
##
[​
](#context-capabilities)
Context Capabilities
FastMCP provides several advanced capabilities through the context object. Each capability has dedicated documentation with comprehensive examples and best practices:
###
[​
](#logging)
Logging
Send debug, info, warning, and error messages back to the MCP client for visibility into function execution.
```
`await ctx.debug("Starting analysis")
await ctx.info(f"Processing {len(data)} items")
await ctx.warning("Deprecated parameter used")
await ctx.error("Processing failed")
`
```
See [Server Logging](/v2/servers/logging) for complete documentation and examples.
###
[​
](#client-elicitation)
Client Elicitation
New in version `2.10.0`
Request structured input from clients during tool execution, enabling interactive workflows and progressive disclosure. This is a new feature in the 6/18/2025 MCP spec.
```
`result = await ctx.elicit("Enter your name:", response\_type=str)
if result.action == "accept":
name = result.data
`
```
See [User Elicitation](/v2/servers/elicitation) for detailed examples and supported response types.
###
[​
](#llm-sampling)
LLM Sampling
New in version `2.0.0`
Request the client’s LLM to generate text based on provided messages, useful for leveraging AI capabilities within your tools.
```
`response = await ctx.sample("Analyze this data", temperature=0.7)
`
```
See [LLM Sampling](/v2/servers/sampling) for comprehensive usage and advanced techniques.
###
[​
](#progress-reporting)
Progress Reporting
Update clients on the progress of long-running operations, enabling progress indicators and better user experience.
```
`await ctx.report\_progress(progress=50, total=100) # 50% complete
`
```
See [Progress Reporting](/v2/servers/progress) for detailed patterns and examples.
###
[​
](#resource-access)
Resource Access
List and read data from resources registered with your FastMCP server, allowing access to files, configuration, or dynamic content.
```
`# List available resources
resources = await ctx.list\_resources()
# Read a specific resource
content\_list = await ctx.read\_resource("resource://config")
content = content\_list[0].content
`
```
**Method signatures:**
* **`ctx.list\_resources() -\> list[MCPResource]`**: New in version `2.13.0` Returns list of all available resources
* **`ctx.read\_resource(uri: str | AnyUrl) -\> list[ReadResourceContents]`**: Returns a list of resource content parts
###
[​
](#prompt-access)
Prompt Access
New in version `2.13.0`
List and retrieve prompts registered with your FastMCP server, allowing tools and middleware to discover and use available prompts programmatically.
```
`# List available prompts
prompts = await ctx.list\_prompts()
# Get a specific prompt with arguments
result = await ctx.get\_prompt("analyze\_data", {"dataset": "users"})
messages = result.messages
`
```
**Method signatures:**
* **`ctx.list\_prompts() -\> list[MCPPrompt]`**: Returns list of all available prompts
* **`ctx.get\_prompt(name: str, arguments: dict[str, Any] | None = None) -\> GetPromptResult`**: Get a specific prompt with optional arguments
###
[​
](#state-management)
State Management
New in version `2.11.0`
Store and share data between middleware and handlers within a single MCP request. Each MCP request (such as calling a tool, reading a resource, listing tools, or listing resources) receives its own context object with isolated state. Context state is particularly useful for passing information from [middleware](/v2/servers/middleware) to your handlers.
To store a value in the context state, use `ctx.set\_state(key, value)`. To retrieve a value, use `ctx.get\_state(key)`.
Context state is scoped to a single MCP request. Each operation (tool call, resource read, list operation, etc.) receives a new context object. State set during one request will not be available in subsequent requests. For persistent data storage across requests, use external storage mechanisms like databases, files, or in-memory caches.
This simplified example shows how to use MCP middleware to store user info in the context state, and how to access that state in a tool:
```
`from fastmcp.server.middleware import Middleware, MiddlewareContext
class UserAuthMiddleware(Middleware):
async def on\_call\_tool(self, context: MiddlewareContext, call\_next):
# Middleware stores user info in context state
context.fastmcp\_context.set\_state("user\_id", "user\_123")
context.fastmcp\_context.set\_state("permissions", ["read", "write"])
return await call\_next(context)
@mcp.tool
async def secure\_operation(data: str, ctx: Context) -\> str:
"""Tool can access state set by middleware."""
user\_id = ctx.get\_state("user\_id") # "user\_123"
permissions = ctx.get\_state("permissions") # ["read", "write"]
if "write" not in permissions:
return "Access denied"
return f"Processing {data} for user {user\_id}"
`
```
**Method signatures:**
* **`ctx.set\_state(key: str, value: Any) -\> None`**: Store a value in the context state
* **`ctx.get\_state(key: str) -\> Any`**: Retrieve a value from the context state (returns None if not found)
**State Inheritance:**
When a new context is created (nested contexts), it inherits a copy of its parent’s state. This ensures that:
* State set on a child context never affects the parent context
* State set on a parent context after the child context is initialized is not propagated to the child context
This makes state management predictable and prevents unexpected side effects between nested operations.
###
[​
](#change-notifications)
Change Notifications
New in version `2.9.1`
FastMCP automatically sends list change notifications when components (such as tools, resources, or prompts) are added, removed, enabled, or disabled. In rare cases where you need to manually trigger these notifications, you can use the context methods:
```
`@mcp.tool
async def custom\_tool\_management(ctx: Context) -\> str:
"""Example of manual notification after custom tool changes."""
# After making custom changes to tools
await ctx.send\_tool\_list\_changed()
await ctx.send\_resource\_list\_changed()
await ctx.send\_prompt\_list\_changed()
return "Notifications sent"
`
```
These methods are primarily used internally by FastMCP’s automatic notification system and most users will not need to invoke them directly.
###
[​
](#fastmcp-server)
FastMCP Server
To access the underlying FastMCP server instance, you can use the `ctx.fastmcp` property:
```
`@mcp.tool
async def my\_tool(ctx: Context) -\> None:
# Access the FastMCP server instance
server\_name = ctx.fastmcp.name
...
`
```
###
[​
](#mcp-request)
MCP Request
Access metadata about the current request and client.
```
`@mcp.tool
async def request\_info(ctx: Context) -\> dict:
"""Return information about the current request."""
return {
"request\_id": ctx.request\_id,
"client\_id": ctx.client\_id or "Unknown client"
}
`
```
**Available Properties:**
* **`ctx.request\_id -\> str`**: Get the unique ID for the current MCP request
* **`ctx.client\_id -\> str | None`**: Get the ID of the client making the request, if provided during initialization
* **`ctx.session\_id -\> str | None`**: Get the MCP session ID for session-based data sharing (HTTP transports only)
####
[​
](#request-context-availability)
Request Context Availability
New in version `2.13.1`
The `ctx.request\_context` property provides access to the underlying MCP request context, but returns `None` when the MCP session has not been established yet. This typically occurs:
* During middleware execution in the `on\_request` hook before the MCP handshake completes
* During the initialization phase of client connections
The MCP request context is distinct from the HTTP request. For HTTP transports, HTTP request data may be available even when the MCP session is not yet established.
To safely access the request context in situations where it may not be available:
```
`from fastmcp import FastMCP, Context
from fastmcp.server.dependencies import get\_http\_request
mcp = FastMCP(name="Session Aware Demo")
@mcp.tool
async def session\_info(ctx: Context) -\> dict:
"""Return session information when available."""
# Check if MCP session is available
if ctx.request\_context:
# MCP session available - can access MCP-specific attributes
return {
"session\_id": ctx.session\_id,
"request\_id": ctx.request\_id,
"has\_meta": ctx.request\_context.meta is not None
}
else:
# MCP session not available - use HTTP helpers for request data (if using HTTP transport)
request = get\_http\_request()
return {
"message": "MCP session not available",
"user\_agent": request.headers.get("user-agent", "Unknown")
}
`
```
For HTTP request access that works regardless of MCP session availability (when using HTTP transports), use the [HTTP request helpers](#http-requests) like `get\_http\_request()` and `get\_http\_headers()`.
####
[​
](#client-metadata)
Client Metadata
New in version `2.13.1`
Clients can send contextual information with their requests using the `meta` parameter. This metadata is accessible through `ctx.request\_context.meta` and is available for all MCP operations (tools, resources, prompts).
The `meta` field is `None` when clients don’t provide metadata. When provided, metadata is accessible via attribute access (e.g., `meta.user\_id`) rather than dictionary access. The structure of metadata is determined by the client making the request.
```
`@mcp.tool
def send\_email(to: str, subject: str, body: str, ctx: Context) -\> str:
"""Send an email, logging metadata about the request."""
# Access client-provided metadata
meta = ctx.request\_context.meta
if meta:
# Meta is accessed as an object with attribute access
user\_id = meta.user\_id if hasattr(meta, 'user\_id') else None
trace\_id = meta.trace\_id if hasattr(meta, 'trace\_id') else None
# Use metadata for logging, observability, etc.
if trace\_id:
log\_with\_trace(f"Sending email for user {user\_id}", trace\_id)
# Send the email...
return f"Email sent to {to}"
`
```
The MCP request is part of the low-level MCP SDK and intended for advanced use cases. Most users will not need to use it directly.
##
[​
](#runtime-dependencies)
Runtime Dependencies
###
[​
](#http-requests)
HTTP Requests
New in version `2.2.11`
The recommended way to access the current HTTP request is through the `get\_http\_request()` dependency function:
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_http\_request
from starlette.requests import Request
mcp = FastMCP(name="HTTP Request Demo")
@mcp.tool
async def user\_agent\_info() -\> dict:
"""Return information about the user agent."""
# Get the HTTP request
request: Request = get\_http\_request()
# Access request data
user\_agent = request.headers.get("user-agent", "Unknown")
client\_ip = request.client.host if request.client else "Unknown"
return {
"user\_agent": user\_agent,
"client\_ip": client\_ip,
"path": request.url.path,
}
`
```
This approach works anywhere within a request’s execution flow, not just within your MCP function. It’s useful when:
1. You need access to HTTP information in helper functions
2. You’re calling nested functions that need HTTP request data
3. You’re working with middleware or other request processing code
###
[​
](#http-headers)
HTTP Headers
New in version `2.2.11`
If you only need request headers and want to avoid potential errors, you can use the `get\_http\_headers()` helper:
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_http\_headers
mcp = FastMCP(name="Headers Demo")
@mcp.tool
async def safe\_header\_info() -\> dict:
"""Safely get header information without raising errors."""
# Get headers (returns empty dict if no request context)
headers = get\_http\_headers()
# Get authorization header
auth\_header = headers.get("authorization", "")
is\_bearer = auth\_header.startswith("Bearer ")
return {
"user\_agent": headers.get("user-agent", "Unknown"),
"content\_type": headers.get("content-type", "Unknown"),
"has\_auth": bool(auth\_header),
"auth\_type": "Bearer" if is\_bearer else "Other" if auth\_header else "None",
"headers\_count": len(headers)
}
`
```
By default, `get\_http\_headers()` excludes problematic headers like `host` and `content-length`. To include all headers, use `get\_http\_headers(include\_all=True)`.
###
[​
](#access-tokens)
Access Tokens
New in version `2.11.0`
When using authentication with your FastMCP server, you can access the authenticated user’s access token information using the `get\_access\_token()` dependency function:
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_access\_token, AccessToken
mcp = FastMCP(name="Auth Token Demo")
@mcp.tool
async def get\_user\_info() -\> dict:
"""Get information about the authenticated user."""
# Get the access token (None if not authenticated)
token: AccessToken | None = get\_access\_token()
if token is None:
return {"authenticated": False}
return {
"authenticated": True,
"client\_id": token.client\_id,
"scopes": token.scopes,
"expires\_at": token.expires\_at,
"token\_claims": token.claims, # JWT claims or custom token data
}
`
```
This is particularly useful when you need to:
1. **Access user identification** - Get the `client\_id` or subject from token claims
2. **Check permissions** - Verify scopes or custom claims before performing operations
3. **Multi-tenant applications** - Extract tenant information from token claims
4. **Audit logging** - Track which user performed which actions
####
[​
](#working-with-token-claims)
Working with Token Claims
The `claims` field contains all the data from the original token (JWT claims for JWT tokens, or custom data for other token types):
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_access\_token
mcp = FastMCP(name="Multi-tenant Demo")
@mcp.tool
async def get\_tenant\_data(resource\_id: str) -\> dict:
"""Get tenant-specific data using token claims."""
token: AccessToken | None = get\_access\_token()
# Extract tenant ID from token claims
tenant\_id = token.claims.get("tenant\_id") if token else None
# Extract user ID from standard JWT subject claim
user\_id = token.claims.get("sub") if token else None
# Use tenant and user info to authorize and filter data
if not tenant\_id:
raise ValueError("No tenant information in token")
return {
"resource\_id": resource\_id,
"tenant\_id": tenant\_id,
"user\_id": user\_id,
"data": f"Tenant-specific data for {tenant\_id}",
}
`
```
##
[​
](#custom-dependencies)
Custom Dependencies
New in version `2.14`
FastMCP’s dependency injection is powered by [Docket](https://github.com/chrisguidry/docket), which provides a flexible system for injecting values into your functions. Beyond the built-in dependencies like `CurrentContext()`, you can create your own.
###
[​
](#using-depends)
Using `Depends()`
The simplest way to create a custom dependency is with `Depends()`. Pass any callable (sync or async function, or async context manager) and its return value will be injected:
```
`from contextlib import asynccontextmanager
from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP(name="Custom Deps Demo")
# Simple function dependency
def get\_config() -\> dict:
return {"api\_url": "https://api.example.com", "timeout": 30}
# Async function dependency
async def get\_user\_id() -\> int:
return 42
@mcp.tool
async def fetch\_data(
query: str,
config: dict = Depends(get\_config),
user\_id: int = Depends(get\_user\_id),
) -\> str:
return f"User {user\_id} fetching '{query}' from {config['api\_url']}"
`
```
Dependencies using `Depends()` are automatically excluded from the MCP schema—clients never see them as parameters.
###
[​
](#resource-management-with-context-managers)
Resource Management with Context Managers
For dependencies that need cleanup (database connections, file handles, etc.), use an async context manager:
```
`from contextlib import asynccontextmanager
from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP(name="Resource Demo")
@asynccontextmanager
async def get\_database():
db = await connect\_to\_database()
try:
yield db
finally:
await db.close()
@mcp.tool
async def query\_users(sql: str, db = Depends(get\_database)) -\> list:
return await db.execute(sql)
`
```
The context manager’s cleanup code runs after your function completes, even if an error occurs.
###
[​
](#nested-dependencies)
Nested Dependencies
Dependencies can depend on other dependencies:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP(name="Nested Demo")
def get\_base\_url() -\> str:
return "https://api.example.com"
def get\_api\_client(base\_url: str = Depends(get\_base\_url)) -\> dict:
return {"base\_url": base\_url, "version": "v1"}
@mcp.tool
async def call\_api(endpoint: str, client: dict = Depends(get\_api\_client)) -\> str:
return f"Calling {client['base\_url']}/{client['version']}/{endpoint}"
`
```
###
[​
](#advanced-subclassing-dependency)
Advanced: Subclassing `Dependency`
For more complex dependency patterns—like dependencies that need access to Docket’s execution context or require custom lifecycle management—you can subclass Docket’s `Dependency` class. See the [Docket documentation on dependencies](https://chrisguidry.github.io/docket/dependencies/) for details.