The FastMCP Server - FastMCP
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
The `FastMCP` class is the central piece of every FastMCP application. It acts as the container for your tools, resources, and prompts, managing communication with MCP clients and orchestrating the entire server lifecycle.
##
[​
](#creating-a-server)
Creating a Server
At its simplest, a FastMCP server just needs a name. Everything else has sensible defaults.
```
`from fastmcp import FastMCP
mcp = FastMCP("MyServer")
`
```
Instructions help clients (and the LLMs behind them) understand what your server does and how to use it effectively.
```
`mcp = FastMCP(
"DataAnalysis",
instructions="Provides tools for analyzing numerical datasets. Start with get\_summary() for an overview.",
)
`
```
##
[​
](#components)
Components
FastMCP servers expose three types of components to clients, each serving a distinct role in the MCP protocol.
**Tools** are functions that clients invoke to perform actions or access external systems.
```
`@mcp.tool
def multiply(a: float, b: float) -\> float:
"""Multiplies two numbers together."""
return a \* b
`
```
**Resources** expose data that clients can read — passive data sources rather than invocable functions.
```
`@mcp.resource("data://config")
def get\_config() -\> dict:
return {"theme": "dark", "version": "1.0"}
`
```
**Prompts** are reusable message templates that guide LLM interactions.
```
`@mcp.prompt
def analyze\_data(data\_points: list[float]) -\> str:
formatted\_data = ", ".join(str(point) for point in data\_points)
return f"Please analyze these data points: {formatted\_data}"
`
```
Each component type has detailed documentation: [Tools](/servers/tools), [Resources](/servers/resources) (including [Resource Templates](/servers/resources#resource-templates)), and [Prompts](/servers/prompts).
##
[​
](#running-the-server)
Running the Server
Start your server by calling `mcp.run()`. The `if \_\_name\_\_` guard ensures compatibility with MCP clients that launch your server as a subprocess.
```
`from fastmcp import FastMCP
mcp = FastMCP("MyServer")
@mcp.tool
def greet(name: str) -\> str:
"""Greet a user by name."""
return f"Hello, {name}!"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
FastMCP supports several transports:
* **STDIO** (default): For local integrations and CLI tools
* **HTTP**: For web services using the Streamable HTTP protocol
* **SSE**: Legacy web transport (deprecated)
```
`# Run with HTTP transport
mcp.run(transport="http", host="127.0.0.1", port=9000)
`
```
The server can also be run using the FastMCP CLI. For detailed information on transports and deployment, see [Running Your Server](/deployment/running-server).
##
[​
](#configuration-reference)
Configuration Reference
The `FastMCP` constructor accepts parameters organized into four categories: identity, composition, behavior, and handlers.
###
[​
](#identity)
Identity
These parameters control how your server presents itself to clients.
##
[​
](#param-name)
name
str
default:"FastMCP"
A human-readable name for your server, shown in client applications and logs
[​
](#param-instructions)
instructions
str | None
Description of how to interact with this server. Clients surface these instructions to help LLMs understand the server’s purpose and available functionality
[​
](#param-version)
version
str | None
Version string for your server. Defaults to the FastMCP library version if not provided
[​
](#param-website-url)
website\_url
str | None
URL to a website with more information about your server. Displayed in client applications
[​
](#param-icons)
icons
list[Icon] | None
List of icon representations for your server. See [Icons](/servers/icons) for details
###
[​
](#composition)
Composition
These parameters control what your server is built from — its components, middleware, providers, and lifecycle.
##
[​
](#param-tools)
tools
list[Tool | Callable] | None
Tools to register on the server. An alternative to the `@mcp.tool` decorator when you need to add tools programmatically
[​
](#param-auth)
auth
OAuthProvider | TokenVerifier | None
Authentication provider for securing HTTP-based transports. See [Authentication](/servers/auth/authentication) for configuration
[​
](#param-middleware)
middleware
list[Middleware] | None
[Middleware](/servers/middleware) that intercepts and transforms every MCP message flowing through the server — requests, responses, and notifications in both directions. Use for cross-cutting concerns like logging, error handling, and rate limiting
[​
](#param-providers)
providers
list[Provider] | None
[Providers](/servers/providers) that supply tools, resources, and prompts dynamically. Providers are queried at request time, so they can serve components from databases, APIs, or other external sources
[​
](#param-transforms)
transforms
list[Transform] | None
Server-level [transforms](/servers/transforms/transforms) to apply to all components. Transforms modify how tools, resources, and prompts are presented to clients — for example, [search transforms](/servers/transforms/tool-search) replace large catalogs with on-demand discovery
[​
](#param-lifespan)
lifespan
Lifespan | AsyncContextManager | None
Server-level setup and teardown logic that runs when the server starts and stops. See [Lifespans](/servers/lifespan) for composable lifespans
###
[​
](#behavior)
Behavior
These parameters tune how the server processes requests and communicates with clients.
##
[​
](#param-on-duplicate)
on\_duplicate
Literal["warn", "error", "replace", "ignore"]
default:"warn"
How to handle duplicate component registrations
[​
](#param-strict-input-validation)
strict\_input\_validation
bool
default:"False"
When `False` (default), FastMCP uses Pydantic’s flexible validation that coerces compatible inputs (e.g., `"10"` → `10` for int parameters). When `True`, validates inputs against the exact JSON Schema before calling your function, rejecting type mismatches. See [Input Validation Modes](/servers/tools#input-validation-modes) for details
[​
](#param-mask-error-details)
mask\_error\_details
bool | None
When `True`, replaces internal error details in tool/resource responses with a generic message to avoid leaking implementation details to clients. Defaults to the `FASTMCP\_MASK\_ERROR\_DETAILS` environment variable
[​
](#param-list-page-size)
list\_page\_size
int | None
default:"None"
Maximum items per page for list operations (`tools/list`, `resources/list`, etc.). When `None`, all results are returned in a single response. See [Pagination](/servers/pagination) for details
[​
](#param-tasks)
tasks
bool | None
default:"False"
Enable background task support. When `True`, tools and resources can return `CreateTaskResult` to run work asynchronously while the client polls for results
[​
](#param-client-log-level)
client\_log\_level
LoggingLevel | None
Default minimum log level for messages sent to MCP clients via `context.log()`. When set, messages below this level are suppressed. Individual clients can override this per-session using the MCP `logging/setLevel` request. One of `"debug"`, `"info"`, `"notice"`, `"warning"`, `"error"`, `"critical"`, `"alert"`, or `"emergency"`
[​
](#param-dereference-schemas)
dereference\_schemas
bool
default:"True"
Automatically dereference `$ref` pointers in JSON schemas generated from complex Pydantic models. Most clients require flat schemas without `$ref`, so this should usually stay enabled
###
[​
](#handlers-and-storage)
Handlers and Storage
These parameters provide custom handlers for MCP capabilities and persistent storage for session state.
##
[​
](#param-sampling-handler)
sampling\_handler
SamplingHandler | None
Custom handler for MCP sampling requests (server-initiated LLM calls). See [Sampling](/servers/sampling) for details
[​
](#param-sampling-handler-behavior)
sampling\_handler\_behavior
Literal["always", "fallback"] | None
default:"fallback"
When `"fallback"`, the sampling handler is used only when no tool-specific handler exists. When `"always"`, this handler is used for all sampling requests
[​
](#param-session-state-store)
session\_state\_store
AsyncKeyValue | None
Persistent key-value store for session state that survives across requests. Defaults to an in-memory store. Provide a custom implementation for persistence across server restarts
##
[​
](#tag-based-filtering)
Tag-Based Filtering
Tags let you categorize components and selectively expose them. This is useful for creating different views of your server for different environments or user types.
```
`@mcp.tool(tags={"public", "utility"})
def public\_tool() -\> str:
return "This tool is public"
@mcp.tool(tags={"internal", "admin"})
def admin\_tool() -\> str:
return "This tool is for admins only"
`
```
The filtering logic works as follows:
* **Enable with `only=True`**: Switches to allowlist mode — only components with at least one matching tag are exposed
* **Disable**: Components with any matching tag are hidden
* **Precedence**: Later calls override earlier ones, so call `disable` after `enable` to exclude from an allowlist
To ensure a component is never exposed, you can set `enabled=False` on the component itself. See the component-specific documentation for details.
```
`# Only expose components tagged with "public"
mcp = FastMCP()
mcp.enable(tags={"public"}, only=True)
# Hide components tagged as "internal" or "deprecated"
mcp = FastMCP()
mcp.disable(tags={"internal", "deprecated"})
# Combine both: show admin tools but hide deprecated ones
mcp = FastMCP()
mcp.enable(tags={"admin"}, only=True).disable(tags={"deprecated"})
`
```
This filtering applies to all component types (tools, resources, resource templates, and prompts) and affects both listing and access.
##
[​
](#custom-routes)
Custom Routes
When running with HTTP transport, you can add custom web routes alongside your MCP endpoint using the `@custom\_route` decorator.
```
`from fastmcp import FastMCP
from starlette.requests import Request
from starlette.responses import PlainTextResponse
mcp = FastMCP("MyServer")
@mcp.custom\_route("/health", methods=["GET"])
async def health\_check(request: Request) -\> PlainTextResponse:
return PlainTextResponse("OK")
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http") # Health check at http://localhost:8000/health
`
```
Custom routes are useful for health checks, status endpoints, and simple webhooks. For more complex web applications, consider [mounting your MCP server into a FastAPI or Starlette app](/deployment/http#integration-with-web-frameworks).