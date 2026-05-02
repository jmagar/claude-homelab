The FastMCP Server - FastMCP
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
The central piece of a FastMCP application is the `FastMCP` server class. This class acts as the main container for your application’s tools, resources, and prompts, and manages communication with MCP clients.
##
[​
](#creating-a-server)
Creating a Server
Instantiating a server is straightforward. You typically provide a name for your server, which helps identify it in client applications or logs.
```
`from fastmcp import FastMCP
# Create a basic server instance
mcp = FastMCP(name="MyAssistantServer")
# You can also add instructions for how to interact with the server
mcp\_with\_instructions = FastMCP(
name="HelpfulAssistant",
instructions="""
This server provides data analysis tools.
Call get\_average() to analyze numerical data.
""",
)
`
```
The `FastMCP` constructor accepts several arguments:
## FastMCP Constructor Parameters
[​
](#param-name)
name
str
default:"FastMCP"
A human-readable name for your server
[​
](#param-instructions)
instructions
str | None
Description of how to interact with this server. These instructions help clients understand the server’s purpose and available functionality
[​
](#param-version)
version
str | None
Version string for your server. If not provided, defaults to the FastMCP library version
[​
](#param-website-url)
website\_url
str | None
New in version `2.13.0`URL to a website with more information about your server. Displayed in client applications
[​
](#param-icons)
icons
list[Icon] | None
New in version `2.13.0`List of icon representations for your server. Icons help users visually identify your server in client applications. See [Icons](/v2/servers/icons) for detailed examples
[​
](#param-auth)
auth
OAuthProvider | TokenVerifier | None
Authentication provider for securing HTTP-based transports. See [Authentication](/v2/servers/auth/authentication) for configuration options
[​
](#param-lifespan)
lifespan
AsyncContextManager | None
An async context manager function for server startup and shutdown logic
[​
](#param-tools)
tools
list[Tool | Callable] | None
A list of tools (or functions to convert to tools) to add to the server. In some cases, providing tools programmatically may be more convenient than using the `@mcp.tool` decorator
[​
](#param-include-tags)
include\_tags
set[str] | None
Only expose components with at least one matching tag
[​
](#param-exclude-tags)
exclude\_tags
set[str] | None
Hide components with any matching tag
[​
](#param-on-duplicate-tools)
on\_duplicate\_tools
Literal["error", "warn", "replace"]
default:"error"
How to handle duplicate tool registrations
[​
](#param-on-duplicate-resources)
on\_duplicate\_resources
Literal["error", "warn", "replace"]
default:"warn"
How to handle duplicate resource registrations
[​
](#param-on-duplicate-prompts)
on\_duplicate\_prompts
Literal["error", "warn", "replace"]
default:"replace"
How to handle duplicate prompt registrations
[​
](#param-strict-input-validation)
strict\_input\_validation
bool
default:"False"
New in version `2.13.0`Controls how tool input parameters are validated. When `False` (default), FastMCP uses Pydantic’s flexible validation that coerces compatible inputs (e.g., `"10"` → `10` for int parameters). When `True`, uses the MCP SDK’s JSON Schema validation to validate inputs against the exact schema before passing them to your function, rejecting any type mismatches. The default mode improves compatibility with LLM clients while maintaining type safety. See [Input Validation Modes](/v2/servers/tools#input-validation-modes) for details
[​
](#param-include-fastmcp-meta)
include\_fastmcp\_meta
bool
default:"True"
New in version `2.11.0`Whether to include FastMCP metadata in component responses. When `True`, component tags and other FastMCP-specific metadata are included in the `\_fastmcp` namespace within each component’s `meta` field. When `False`, this metadata is omitted, resulting in cleaner integration with external systems. Can be overridden globally via `FASTMCP\_INCLUDE\_FASTMCP\_META` environment variable
##
[​
](#components)
Components
FastMCP servers expose several types of components to the client:
###
[​
](#tools)
Tools
Tools are functions that the client can call to perform actions or access external systems.
```
`@mcp.tool
def multiply(a: float, b: float) -\> float:
"""Multiplies two numbers together."""
return a \* b
`
```
See [Tools](/v2/servers/tools) for detailed documentation.
###
[​
](#resources)
Resources
Resources expose data sources that the client can read.
```
`@mcp.resource("data://config")
def get\_config() -\> dict:
"""Provides the application configuration."""
return {"theme": "dark", "version": "1.0"}
`
```
See [Resources & Templates](/v2/servers/resources) for detailed documentation.
###
[​
](#resource-templates)
Resource Templates
Resource templates are parameterized resources that allow the client to request specific data.
```
`@mcp.resource("users://{user\_id}/profile")
def get\_user\_profile(user\_id: int) -\> dict:
"""Retrieves a user's profile by ID."""
# The {user\_id} in the URI is extracted and passed to this function
return {"id": user\_id, "name": f"User {user\_id}", "status": "active"}
`
```
See [Resources & Templates](/v2/servers/resources) for detailed documentation.
###
[​
](#prompts)
Prompts
Prompts are reusable message templates for guiding the LLM.
```
`@mcp.prompt
def analyze\_data(data\_points: list[float]) -\> str:
"""Creates a prompt asking for analysis of numerical data."""
formatted\_data = ", ".join(str(point) for point in data\_points)
return f"Please analyze these data points: {formatted\_data}"
`
```
See [Prompts](/v2/servers/prompts) for detailed documentation.
##
[​
](#tag-based-filtering)
Tag-Based Filtering
New in version `2.8.0`
FastMCP supports tag-based filtering to selectively expose components based on configurable include/exclude tag sets. This is useful for creating different views of your server for different environments or users.
Components can be tagged when defined using the `tags` parameter:
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
* **Include tags**: If specified, only components with at least one matching tag are exposed
* **Exclude tags**: Components with any matching tag are filtered out
* **Precedence**: Exclude tags always take priority over include tags
To ensure a component is never exposed, you can set `enabled=False` on the component itself. To learn more, see the component-specific documentation.
You configure tag-based filtering when creating your server:
```
`# Only expose components tagged with "public"
mcp = FastMCP(include\_tags={"public"})
# Hide components tagged as "internal" or "deprecated"
mcp = FastMCP(exclude\_tags={"internal", "deprecated"})
# Combine both: show admin tools but hide deprecated ones
mcp = FastMCP(include\_tags={"admin"}, exclude\_tags={"deprecated"})
`
```
This filtering applies to all component types (tools, resources, resource templates, and prompts) and affects both listing and access.
##
[​
](#running-the-server)
Running the Server
FastMCP servers need a transport mechanism to communicate with clients. You typically start your server by calling the `mcp.run()` method on your `FastMCP` instance, often within an `if \_\_name\_\_ == "\_\_main\_\_":` block in your main server script. This pattern ensures compatibility with various MCP clients.
```
`# my\_server.py
from fastmcp import FastMCP
mcp = FastMCP(name="MyServer")
@mcp.tool
def greet(name: str) -\> str:
"""Greet a user by name."""
return f"Hello, {name}!"
if \_\_name\_\_ == "\_\_main\_\_":
# This runs the server, defaulting to STDIO transport
mcp.run()
# To use a different transport, e.g., HTTP:
# mcp.run(transport="http", host="127.0.0.1", port=9000)
`
```
FastMCP supports several transport options:
* STDIO (default, for local tools)
* HTTP (recommended for web services, uses Streamable HTTP protocol)
* SSE (legacy web transport, deprecated)
The server can also be run using the FastMCP CLI.
For detailed information on each transport, how to configure them (host, port, paths), and when to use which, please refer to the [**Running Your FastMCP Server**](/v2/deployment/running-server) guide.
##
[​
](#custom-routes)
Custom Routes
When running your server with HTTP transport, you can add custom web routes alongside your MCP endpoint using the `@custom\_route` decorator. This is useful for simple endpoints like health checks that need to be served alongside your MCP server:
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
Custom routes are served alongside your MCP endpoint and are useful for:
* Health check endpoints for monitoring
* Simple status or info endpoints
* Basic webhooks or callbacks
For more complex web applications, consider [mounting your MCP server into a FastAPI or Starlette app](/v2/deployment/http#integration-with-web-frameworks).
##
[​
](#composing-servers)
Composing Servers
New in version `2.2.0`
FastMCP supports composing multiple servers together using `import\_server` (static copy) and `mount` (live link). This allows you to organize large applications into modular components or reuse existing servers.
See the [Server Composition](/v2/servers/composition) guide for full details, best practices, and examples.
```
`# Example: Importing a subserver
from fastmcp import FastMCP
import asyncio
main = FastMCP(name="Main")
sub = FastMCP(name="Sub")
@sub.tool
def hello():
return "hi"
# Mount directly
main.mount(sub, prefix="sub")
`
```
##
[​
](#proxying-servers)
Proxying Servers
New in version `2.0.0`
FastMCP can act as a proxy for any MCP server (local or remote) using `FastMCP.as\_proxy`, letting you bridge transports or add a frontend to existing servers. For example, you can expose a remote SSE server locally via stdio, or vice versa.
Proxies automatically handle concurrent operations safely by creating fresh sessions for each request when using disconnected clients.
See the [Proxying Servers](/v2/servers/proxy) guide for details and advanced usage.
```
`from fastmcp import FastMCP, Client
backend = Client("http://example.com/mcp/sse")
proxy = FastMCP.as\_proxy(backend, name="ProxyServer")
# Now use the proxy like any FastMCP server
`
```
##
[​
](#openapi-integration)
OpenAPI Integration
New in version `2.0.0`
FastMCP can automatically generate servers from OpenAPI specifications or existing FastAPI applications using `FastMCP.from\_openapi()` and `FastMCP.from\_fastapi()`. This allows you to instantly convert existing APIs into MCP servers without manual tool creation.
See the [FastAPI Integration](/v2/integrations/fastapi) and [OpenAPI Integration](/v2/integrations/openapi) guides for detailed examples and configuration options.
```
`import httpx
from fastmcp import FastMCP
# From OpenAPI spec
spec = httpx.get("https://api.example.com/openapi.json").json()
mcp = FastMCP.from\_openapi(openapi\_spec=spec, client=httpx.AsyncClient())
# From FastAPI app
from fastapi import FastAPI
app = FastAPI()
mcp = FastMCP.from\_fastapi(app=app)
`
```
##
[​
](#server-configuration)
Server Configuration
Servers can be configured using a combination of initialization arguments, global settings, and transport-specific settings.
###
[​
](#server-specific-configuration)
Server-Specific Configuration
Server-specific settings are passed when creating the `FastMCP` instance and control server behavior:
```
`from fastmcp import FastMCP
# Configure server-specific settings
mcp = FastMCP(
name="ConfiguredServer",
include\_tags={"public", "api"}, # Only expose these tagged components
exclude\_tags={"internal", "deprecated"}, # Hide these tagged components
on\_duplicate\_tools="error", # Handle duplicate registrations
on\_duplicate\_resources="warn",
on\_duplicate\_prompts="replace",
include\_fastmcp\_meta=False, # Disable FastMCP metadata for cleaner integration
)
`
```
###
[​
](#global-settings)
Global Settings
Global settings affect all FastMCP servers and can be configured via environment variables (prefixed with `FASTMCP\_`) or in a `.env` file:
```
`import fastmcp
# Access global settings
print(fastmcp.settings.log\_level) # Default: "INFO"
print(fastmcp.settings.mask\_error\_details) # Default: False
print(fastmcp.settings.strict\_input\_validation) # Default: False
print(fastmcp.settings.include\_fastmcp\_meta) # Default: True
`
```
Common global settings include:
* **`log\_level`**: Logging level (“DEBUG”, “INFO”, “WARNING”, “ERROR”, “CRITICAL”), set with `FASTMCP\_LOG\_LEVEL`
* **`mask\_error\_details`**: Whether to hide detailed error information from clients, set with `FASTMCP\_MASK\_ERROR\_DETAILS`
* **`strict\_input\_validation`**: Controls tool input validation mode (default: False for flexible coercion), set with `FASTMCP\_STRICT\_INPUT\_VALIDATION`. See [Input Validation Modes](/v2/servers/tools#input-validation-modes)
* **`include\_fastmcp\_meta`**: Whether to include FastMCP metadata in component responses (default: True), set with `FASTMCP\_INCLUDE\_FASTMCP\_META`
* **`env\_file`**: Path to the environment file to load settings from (default: “.env”), set with `FASTMCP\_ENV\_FILE`. Useful when your project uses a `.env` file with syntax incompatible with python-dotenv
###
[​
](#transport-specific-configuration)
Transport-Specific Configuration
Transport settings are provided when running the server and control network behavior:
```
`# Configure transport when running
mcp.run(
transport="http",
host="0.0.0.0", # Bind to all interfaces
port=9000, # Custom port
log\_level="DEBUG", # Override global log level
)
# Or for async usage
await mcp.run\_async(
transport="http",
host="127.0.0.1",
port=8080,
)
`
```
###
[​
](#setting-global-configuration)
Setting Global Configuration
Global FastMCP settings can be configured via environment variables (prefixed with `FASTMCP\_`):
```
`# Configure global FastMCP behavior
export FASTMCP\_LOG\_LEVEL=DEBUG
export FASTMCP\_MASK\_ERROR\_DETAILS=True
export FASTMCP\_STRICT\_INPUT\_VALIDATION=False
export FASTMCP\_INCLUDE\_FASTMCP\_META=False
`
```
###
[​
](#custom-tool-serialization)
Custom Tool Serialization
New in version `2.2.7`
By default, FastMCP serializes tool return values to JSON when they need to be converted to text. You can customize this behavior by providing a `tool\_serializer` function when creating your server:
```
`import yaml
from fastmcp import FastMCP
# Define a custom serializer that formats dictionaries as YAML
def yaml\_serializer(data):
return yaml.dump(data, sort\_keys=False)
# Create a server with the custom serializer
mcp = FastMCP(name="MyServer", tool\_serializer=yaml\_serializer)
@mcp.tool
def get\_config():
"""Returns configuration in YAML format."""
return {"api\_key": "abc123", "debug": True, "rate\_limit": 100}
`
```
The serializer function takes any data object and returns a string representation. This is applied to **all non-string return values** from your tools. Tools that already return strings bypass the serializer.
This customization is useful when you want to:
* Format data in a specific way (like YAML or custom formats)
* Control specific serialization options (like indentation or sorting)
* Add metadata or transform data before sending it to clients
If the serializer function raises an exception, the tool will fall back to the default JSON serialization to avoid breaking the server.