HTTP Deployment - FastMCP
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
* [
Running Your Server
](/v2/deployment/running-server)
* [
HTTP Deployment
NEW
](/v2/deployment/http)
* [
Prefect Horizon
](/deployment/prefect-horizon)
* [
Project Configuration
](/v2/deployment/server-configuration)
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
STDIO transport is perfect for local development and desktop applications. But to unlock the full potential of MCP—centralized services, multi-client access, and network availability—you need remote HTTP deployment.
This guide walks you through deploying your FastMCP server as a remote MCP service that’s accessible via a URL. Once deployed, your MCP server will be available over the network, allowing multiple clients to connect simultaneously and enabling integration with cloud-based LLM applications. This guide focuses specifically on remote MCP deployment, not local STDIO servers.
##
[​
](#choosing-your-approach)
Choosing Your Approach
FastMCP provides two ways to deploy your server as an HTTP service. Understanding the trade-offs helps you choose the right approach for your needs.
The **direct HTTP server** approach is simpler and perfect for getting started quickly. You modify your server’s `run()` method to use HTTP transport, and FastMCP handles all the web server configuration. This approach works well for standalone deployments where you want your MCP server to be the only service running on a port.
The **ASGI application** approach gives you more control and flexibility. Instead of running the server directly, you create an ASGI application that can be served by Uvicorn. This approach is better when you need advanced server features like multiple workers, custom middleware, or when you’re integrating with existing web applications.
###
[​
](#direct-http-server)
Direct HTTP Server
The simplest way to get your MCP server online is to use the built-in `run()` method with HTTP transport. This approach handles all the server configuration for you and is ideal when you want a standalone MCP server without additional complexity.
server.py
```
`from fastmcp import FastMCP
mcp = FastMCP("My Server")
@mcp.tool
def process\_data(input: str) -\> str:
"""Process data on the server"""
return f"Processed: {input}"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http", host="0.0.0.0", port=8000)
`
```
Run your server with a simple Python command:
```
`python server.py
`
```
Your server is now accessible at `http://localhost:8000/mcp` (or use your server’s actual IP address for remote access).
This approach is ideal when you want to get online quickly with minimal configuration. It’s perfect for internal tools, development environments, or simple deployments where you don’t need advanced server features. The built-in server handles all the HTTP details, letting you focus on your MCP implementation.
###
[​
](#asgi-application)
ASGI Application
For production deployments, you’ll often want more control over how your server runs. FastMCP can create a standard ASGI application that works with any ASGI server like Uvicorn, Gunicorn, or Hypercorn. This approach is particularly useful when you need to configure advanced server options, run multiple workers, or integrate with existing infrastructure.
app.py
```
`from fastmcp import FastMCP
mcp = FastMCP("My Server")
@mcp.tool
def process\_data(input: str) -\> str:
"""Process data on the server"""
return f"Processed: {input}"
# Create ASGI application
app = mcp.http\_app()
`
```
Run with any ASGI server - here’s an example with Uvicorn:
```
`uvicorn app:app --host 0.0.0.0 --port 8000
`
```
Your server is accessible at the same URL: `http://localhost:8000/mcp` (or use your server’s actual IP address for remote access).
The ASGI approach shines in production environments where you need reliability and performance. You can run multiple worker processes to handle concurrent requests, add custom middleware for logging or monitoring, integrate with existing deployment pipelines, or mount your MCP server as part of a larger application.
##
[​
](#configuring-your-server)
Configuring Your Server
###
[​
](#custom-path)
Custom Path
By default, your MCP server is accessible at `/mcp/` on your domain. You can customize this path to fit your URL structure or avoid conflicts with existing endpoints. This is particularly useful when integrating MCP into an existing application or following specific API conventions.
```
`# Option 1: With mcp.run()
mcp.run(transport="http", host="0.0.0.0", port=8000, path="/api/mcp/")
# Option 2: With ASGI app
app = mcp.http\_app(path="/api/mcp/")
`
```
Now your server is accessible at `http://localhost:8000/api/mcp/`.
###
[​
](#authentication)
Authentication
Authentication is **highly recommended** for remote MCP servers. Some LLM clients require authentication for remote servers and will refuse to connect without it.
FastMCP supports multiple authentication methods to secure your remote server. See the [Authentication Overview](/v2/servers/auth/authentication) for complete configuration options including Bearer tokens, JWT, and OAuth.
If you’re mounting an authenticated server under a path prefix, see [Mounting Authenticated Servers](#mounting-authenticated-servers) below for important routing considerations.
###
[​
](#health-checks)
Health Checks
Health check endpoints are essential for monitoring your deployed server and ensuring it’s responding correctly. FastMCP allows you to add custom routes alongside your MCP endpoints, making it easy to implement health checks that work with both deployment approaches.
```
`from starlette.responses import JSONResponse
@mcp.custom\_route("/health", methods=["GET"])
async def health\_check(request):
return JSONResponse({"status": "healthy", "service": "mcp-server"})
`
```
This health endpoint will be available at `http://localhost:8000/health` and can be used by load balancers, monitoring systems, or deployment platforms to verify your server is running.
###
[​
](#custom-middleware)
Custom Middleware
New in version `2.3.2`
Add custom Starlette middleware to your FastMCP ASGI apps:
```
`from fastmcp import FastMCP
from starlette.middleware import Middleware
from starlette.middleware.cors import CORSMiddleware
# Create your FastMCP server
mcp = FastMCP("MyServer")
# Define middleware
middleware = [
Middleware(
CORSMiddleware,
allow\_origins=["\*"],
allow\_methods=["\*"],
allow\_headers=["\*"],
)
]
# Create ASGI app with middleware
http\_app = mcp.http\_app(middleware=middleware)
`
```
###
[​
](#cors-for-browser-based-clients)
CORS for Browser-Based Clients
Most MCP clients, including those that you access through a browser like ChatGPT or Claude, don’t need CORS configuration. Only enable CORS if you’re working with an MCP client that connects directly from a browser, such as debugging tools or inspectors.
CORS (Cross-Origin Resource Sharing) is needed when JavaScript running in a web browser connects directly to your MCP server. This is different from using an LLM through a browser—in that case, the browser connects to the LLM service, and the LLM service connects to your MCP server (no CORS needed).
Browser-based MCP clients that need CORS include:
* **MCP Inspector** - Browser-based debugging tool for testing MCP servers
* **Custom browser-based MCP clients** - If you’re building a web app that directly connects to MCP servers
For these scenarios, add CORS middleware with the specific headers required for MCP protocol:
```
`from fastmcp import FastMCP
from starlette.middleware import Middleware
from starlette.middleware.cors import CORSMiddleware
mcp = FastMCP("MyServer")
# Configure CORS for browser-based clients
middleware = [
Middleware(
CORSMiddleware,
allow\_origins=["\*"], # Allow all origins; use specific origins for security
allow\_methods=["GET", "POST", "DELETE", "OPTIONS"],
allow\_headers=[
"mcp-protocol-version",
"mcp-session-id",
"Authorization",
"Content-Type",
],
expose\_headers=["mcp-session-id"],
)
]
app = mcp.http\_app(middleware=middleware)
`
```
**Key configuration details:**
* **`allow\_origins`**: Specify exact origins (e.g., `["http://localhost:3000"]`) rather than `["\*"]` for production deployments
* **`allow\_headers`**: Must include `mcp-protocol-version`, `mcp-session-id`, and `Authorization` (for authenticated servers)
* **`expose\_headers`**: Must include `mcp-session-id` so JavaScript can read the session ID from responses and send it in subsequent requests
Without `expose\_headers=["mcp-session-id"]`, browsers will receive the session ID but JavaScript won’t be able to access it, causing session management to fail.
**Production Security**: Never use `allow\_origins=["\*"]` in production. Specify the exact origins of your browser-based clients. Using wildcards exposes your server to unauthorized access from any website.
###
[​
](#sse-polling-for-long-running-operations)
SSE Polling for Long-Running Operations
New in version `2.14.0`
This feature only applies to the **StreamableHTTP transport** (the default for `http\_app()`). It does not apply to the legacy SSE transport (`transport="sse"`).
When running tools that take a long time to complete, you may encounter issues with load balancers or proxies terminating connections that stay idle too long. [SEP-1699](https://github.com/modelcontextprotocol/modelcontextprotocol/issues/1699) introduces SSE polling to solve this by allowing the server to gracefully close connections and have clients automatically reconnect.
To enable SSE polling, configure an `EventStore` when creating your HTTP application:
```
`from fastmcp import FastMCP, Context
from fastmcp.server.event\_store import EventStore
mcp = FastMCP("My Server")
@mcp.tool
async def long\_running\_task(ctx: Context) -\> str:
"""A task that takes several minutes to complete."""
for i in range(100):
await ctx.report\_progress(i, 100)
# Periodically close the connection to avoid load balancer timeouts
# Client will automatically reconnect and resume receiving progress
if i % 30 == 0 and i \> 0:
await ctx.close\_sse\_stream()
await do\_expensive\_work()
return "Done!"
# Configure with EventStore for resumability
event\_store = EventStore()
app = mcp.http\_app(
event\_store=event\_store,
retry\_interval=2000, # Client reconnects after 2 seconds
)
`
```
**How it works:**
1. When `event\_store` is configured, the server stores all events (progress updates, results) with unique IDs
2. Calling `ctx.close\_sse\_stream()` gracefully closes the HTTP connection
3. The client automatically reconnects with a `Last-Event-ID` header
4. The server replays any events the client missed during the disconnection
The `retry\_interval` parameter (in milliseconds) controls how long clients wait before reconnecting. Choose a value that balances responsiveness with server load.
`close\_sse\_stream()` is a no-op if called without an `EventStore` configured, so you can safely include it in tools that may run in different deployment configurations.
####
[​
](#custom-storage-backends)
Custom Storage Backends
By default, `EventStore` uses in-memory storage. For production deployments with multiple server instances, you can provide a custom storage backend using the `key\_value` package:
```
`from fastmcp.server.event\_store import EventStore
from key\_value.aio.stores.redis import RedisStore
# Use Redis for distributed deployments
redis\_store = RedisStore(url="redis://localhost:6379")
event\_store = EventStore(
storage=redis\_store,
max\_events\_per\_stream=100, # Keep last 100 events per stream
ttl=3600, # Events expire after 1 hour
)
app = mcp.http\_app(event\_store=event\_store)
`
```
##
[​
](#integration-with-web-frameworks)
Integration with Web Frameworks
If you already have a web application running, you can add MCP capabilities by mounting a FastMCP server as a sub-application. This allows you to expose MCP tools alongside your existing API endpoints, sharing the same domain and infrastructure. The MCP server becomes just another route in your application, making it easy to manage and deploy.
###
[​
](#mounting-in-starlette)
Mounting in Starlette
Mount your FastMCP server in a Starlette application:
```
`from fastmcp import FastMCP
from starlette.applications import Starlette
from starlette.routing import Mount
# Create your FastMCP server
mcp = FastMCP("MyServer")
@mcp.tool
def analyze(data: str) -\> dict:
return {"result": f"Analyzed: {data}"}
# Create the ASGI app
mcp\_app = mcp.http\_app(path='/mcp')
# Create a Starlette app and mount the MCP server
app = Starlette(
routes=[
Mount("/mcp-server", app=mcp\_app),
# Add other routes as needed
],
lifespan=mcp\_app.lifespan,
)
`
```
The MCP endpoint will be available at `/mcp-server/mcp/` of the resulting Starlette app.
For Streamable HTTP transport, you **must** pass the lifespan context from the FastMCP app to the resulting Starlette app, as nested lifespans are not recognized. Otherwise, the FastMCP server’s session manager will not be properly initialized.
####
[​
](#nested-mounts)
Nested Mounts
You can create complex routing structures by nesting mounts:
```
`from fastmcp import FastMCP
from starlette.applications import Starlette
from starlette.routing import Mount
# Create your FastMCP server
mcp = FastMCP("MyServer")
# Create the ASGI app
mcp\_app = mcp.http\_app(path='/mcp')
# Create nested application structure
inner\_app = Starlette(routes=[Mount("/inner", app=mcp\_app)])
app = Starlette(
routes=[Mount("/outer", app=inner\_app)],
lifespan=mcp\_app.lifespan,
)
`
```
In this setup, the MCP server is accessible at the `/outer/inner/mcp/` path.
###
[​
](#fastapi-integration)
FastAPI Integration
For FastAPI-specific integration patterns including both mounting MCP servers into FastAPI apps and generating MCP servers from FastAPI apps, see the [FastAPI Integration guide](/v2/integrations/fastapi).
Here’s a quick example showing how to add MCP to an existing FastAPI application:
```
`from fastapi import FastAPI
from fastmcp import FastMCP
# Your existing API
api = FastAPI()
@api.get("/api/status")
def status():
return {"status": "ok"}
# Create your MCP server
mcp = FastMCP("API Tools")
@mcp.tool
def query\_database(query: str) -\> dict:
"""Run a database query"""
return {"result": "data"}
# Mount MCP at /mcp
api.mount("/mcp", mcp.http\_app())
# Run with: uvicorn app:api --host 0.0.0.0 --port 8000
`
```
Your existing API remains at `http://localhost:8000/api` while MCP is available at `http://localhost:8000/mcp`.
##
[​
](#mounting-authenticated-servers)
Mounting Authenticated Servers
New in version `2.13.0`
This section only applies if you’re **mounting an OAuth-protected FastMCP server under a path prefix** (like `/api`) inside another application using `Mount()`.If you’re deploying your FastMCP server at root level without any `Mount()` prefix, the well-known routes are automatically included in `mcp.http\_app()` and you don’t need to do anything special.
OAuth specifications (RFC 8414 and RFC 9728) require discovery metadata to be accessible at well-known paths under the root level of your domain. When you mount an OAuth-protected FastMCP server under a path prefix like `/api`, this creates a routing challenge: your operational OAuth endpoints move under the prefix, but discovery endpoints must remain at the root.
**Common Mistakes to Avoid:**
1. **Forgetting to mount `.well-known` routes at root** - FastMCP cannot do this automatically when your server is mounted under a path prefix. You must explicitly mount well-known routes at the root level.
2. **Including mount prefix in both base\_url AND mcp\_path** - The mount prefix (like `/api`) should only be in `base\_url`, not in `mcp\_path`. Otherwise you’ll get double paths.
✅ **Correct:**
```
`base\_url = "http://localhost:8000/api"
mcp\_path = "/mcp"
# Result: /api/mcp
`
```
❌ **Wrong:**
```
`base\_url = "http://localhost:8000/api"
mcp\_path = "/api/mcp"
# Result: /api/api/mcp (double prefix!)
`
```
Follow the configuration instructions below to set up mounting correctly.
**CORS Middleware Conflicts:**If you’re integrating FastMCP into an existing application with its own CORS middleware, be aware that layering CORS middleware can cause conflicts (such as 404 errors on `.well-known` routes or OPTIONS requests).FastMCP and the MCP SDK already handle CORS for OAuth routes. If you need CORS on your own application routes, consider using the sub-app pattern: mount FastMCP and your routes as separate apps, each with their own middleware, rather than adding application-wide CORS middleware.
###
[​
](#route-types)
Route Types
OAuth-protected MCP servers expose two categories of routes:
**Operational routes** handle the OAuth flow and MCP protocol:
* `/authorize` - OAuth authorization endpoint
* `/token` - Token exchange endpoint
* `/auth/callback` - OAuth callback handler
* `/mcp` - MCP protocol endpoint
**Discovery routes** provide metadata for OAuth clients:
* `/.well-known/oauth-authorization-server` - Authorization server metadata
* `/.well-known/oauth-protected-resource/\*` - Protected resource metadata
When you mount your MCP app under a prefix, operational routes move with it, but discovery routes must stay at root level for RFC compliance.
###
[​
](#configuration-parameters)
Configuration Parameters
Three parameters control where routes are located and how they combine:
**`base\_url`** tells clients where to find operational endpoints. This includes any Starlette `Mount()` path prefix (e.g., `/api`):
```
`base\_url="http://localhost:8000/api" # Includes mount prefix
`
```
**`mcp\_path`** is the internal FastMCP endpoint path, which gets appended to `base\_url`:
```
`mcp\_path="/mcp" # Internal MCP path, NOT the mount prefix
`
```
**`issuer\_url`** (optional) controls the authorization server identity for OAuth discovery. Defaults to `base\_url`.
```
`# Usually not needed - just set base\_url and it works
issuer\_url="http://localhost:8000" # Only if you want root-level discovery
`
```
When `issuer\_url` has a path (either explicitly or by defaulting from `base\_url`), FastMCP creates path-aware discovery routes per RFC 8414. For example, if `base\_url` is `http://localhost:8000/api`, the authorization server metadata will be at `/.well-known/oauth-authorization-server/api`.
**Key Invariant:** `base\_url + mcp\_path = actual externally-accessible MCP URL`
Example:
* `base\_url`: `http://localhost:8000/api` (mount prefix `/api`)
* `mcp\_path`: `/mcp` (internal path)
* Result: `http://localhost:8000/api/mcp` (final MCP endpoint)
Note that the mount prefix (`/api` from `Mount("/api", ...)`) goes in `base\_url`, while `mcp\_path` is just the internal MCP route. Don’t include the mount prefix in both places or you’ll get `/api/api/mcp`.
###
[​
](#mounting-strategy)
Mounting Strategy
When mounting an OAuth-protected server under a path prefix, declare your URLs upfront to make the relationships clear:
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.github import GitHubProvider
from starlette.applications import Starlette
from starlette.routing import Mount
# Define the routing structure
ROOT\_URL = "http://localhost:8000"
MOUNT\_PREFIX = "/api"
MCP\_PATH = "/mcp"
`
```
Create the auth provider with `base\_url`:
```
`auth = GitHubProvider(
client\_id="your-client-id",
client\_secret="your-client-secret",
base\_url=f"{ROOT\_URL}{MOUNT\_PREFIX}", # Operational endpoints under prefix
# issuer\_url defaults to base\_url - path-aware discovery works automatically
)
`
```
Create the MCP app, which generates operational routes at the specified path:
```
`mcp = FastMCP("Protected Server", auth=auth)
mcp\_app = mcp.http\_app(path=MCP\_PATH)
`
```
Retrieve the discovery routes from the auth provider. The `mcp\_path` argument should match the path used when creating the MCP app:
```
`well\_known\_routes = auth.get\_well\_known\_routes(mcp\_path=MCP\_PATH)
`
```
Finally, mount everything in the Starlette app with discovery routes at root and the MCP app under the prefix:
```
`app = Starlette(
routes=[
\*well\_known\_routes, # Discovery routes at root level
Mount(MOUNT\_PREFIX, app=mcp\_app), # Operational routes under prefix
],
lifespan=mcp\_app.lifespan,
)
`
```
This configuration produces the following URL structure:
* MCP endpoint: `http://localhost:8000/api/mcp`
* OAuth authorization: `http://localhost:8000/api/authorize`
* OAuth callback: `http://localhost:8000/api/auth/callback`
* Authorization server metadata: `http://localhost:8000/.well-known/oauth-authorization-server/api`
* Protected resource metadata: `http://localhost:8000/.well-known/oauth-protected-resource/api/mcp`
Both discovery endpoints use path-aware URLs per RFC 8414 and RFC 9728, matching the `base\_url` path.
###
[​
](#complete-example)
Complete Example
Here’s a complete working example showing all the pieces together:
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.github import GitHubProvider
from starlette.applications import Starlette
from starlette.routing import Mount
import uvicorn
# Define routing structure
ROOT\_URL = "http://localhost:8000"
MOUNT\_PREFIX = "/api"
MCP\_PATH = "/mcp"
# Create OAuth provider
auth = GitHubProvider(
client\_id="your-client-id",
client\_secret="your-client-secret",
base\_url=f"{ROOT\_URL}{MOUNT\_PREFIX}",
# issuer\_url defaults to base\_url - path-aware discovery works automatically
)
# Create MCP server
mcp = FastMCP("Protected Server", auth=auth)
@mcp.tool
def analyze(data: str) -\> dict:
return {"result": f"Analyzed: {data}"}
# Create MCP app
mcp\_app = mcp.http\_app(path=MCP\_PATH)
# Get discovery routes for root level
well\_known\_routes = auth.get\_well\_known\_routes(mcp\_path=MCP\_PATH)
# Assemble the application
app = Starlette(
routes=[
\*well\_known\_routes,
Mount(MOUNT\_PREFIX, app=mcp\_app),
],
lifespan=mcp\_app.lifespan,
)
if \_\_name\_\_ == "\_\_main\_\_":
uvicorn.run(app, host="0.0.0.0", port=8000)
`
```
For more details on OAuth authentication, see the [Authentication guide](/v2/servers/auth).
##
[​
](#production-deployment)
Production Deployment
###
[​
](#running-with-uvicorn)
Running with Uvicorn
When deploying to production, you’ll want to optimize your server for performance and reliability. Uvicorn provides several options to improve your server’s capabilities:
```
`# Run with basic configuration
uvicorn app:app --host 0.0.0.0 --port 8000
# Run with multiple workers for production (requires stateless mode - see below)
uvicorn app:app --host 0.0.0.0 --port 8000 --workers 4
`
```
###
[​
](#horizontal-scaling)
Horizontal Scaling
New in version `2.10.2`
When deploying FastMCP behind a load balancer or running multiple server instances, you need to understand how the HTTP transport handles sessions and configure your server appropriately.
####
[​
](#understanding-sessions)
Understanding Sessions
By default, FastMCP’s Streamable HTTP transport maintains server-side sessions. Sessions enable stateful MCP features like [elicitation](/v2/servers/elicitation) and [sampling](/v2/servers/sampling), where the server needs to maintain context across multiple requests from the same client.
This works perfectly for single-instance deployments. However, sessions are stored in memory on each server instance, which creates challenges when scaling horizontally.
####
[​
](#without-stateless-mode)
Without Stateless Mode
When running multiple server instances behind a load balancer (Traefik, nginx, HAProxy, Kubernetes, etc.), requests from the same client may be routed to different instances:
1. Client connects to Instance A → session created on Instance A
2. Next request routes to Instance B → session doesn’t exist → **request fails**
You might expect sticky sessions (session affinity) to solve this, but they don’t work reliably with MCP clients.
**Why sticky sessions don’t work:** Most MCP clients—including Cursor and Claude Code—use `fetch()` internally and don’t properly forward `Set-Cookie` headers. Without cookies, load balancers can’t identify which instance should handle subsequent requests. This is a limitation in how these clients implement HTTP, not something you can fix with load balancer configuration.
####
[​
](#enabling-stateless-mode)
Enabling Stateless Mode
For horizontally scaled deployments, enable stateless HTTP mode. In stateless mode, each request creates a fresh transport context, eliminating the need for session affinity entirely.
**Option 1: Via constructor**
```
`from fastmcp import FastMCP
mcp = FastMCP("My Server", stateless\_http=True)
@mcp.tool
def process(data: str) -\> str:
return f"Processed: {data}"
app = mcp.http\_app()
`
```
**Option 2: Via `run()`**
```
`if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http", stateless\_http=True)
`
```
**Option 3: Via environment variable**
```
`FASTMCP\_STATELESS\_HTTP=true uvicorn app:app --host 0.0.0.0 --port 8000 --workers 4
`
```
###
[​
](#environment-variables)
Environment Variables
Production deployments should never hardcode sensitive information like API keys or authentication tokens. Instead, use environment variables to configure your server at runtime. This keeps your code secure and makes it easy to deploy the same code to different environments with different configurations.
Here’s an example using bearer token authentication (though OAuth is recommended for production):
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth import BearerTokenAuth
# Read configuration from environment
auth\_token = os.environ.get("MCP\_AUTH\_TOKEN")
if auth\_token:
auth = BearerTokenAuth(token=auth\_token)
mcp = FastMCP("Production Server", auth=auth)
else:
mcp = FastMCP("Production Server")
app = mcp.http\_app()
`
```
Deploy with your secrets safely stored in environment variables:
```
`MCP\_AUTH\_TOKEN=secret uvicorn app:app --host 0.0.0.0 --port 8000
`
```
###
[​
](#oauth-token-security)
OAuth Token Security
New in version `2.13.0`
If you’re using the [OAuth Proxy](/v2/servers/auth/oauth-proxy), FastMCP issues its own JWT tokens to clients instead of forwarding upstream provider tokens. This maintains proper OAuth 2.0 token boundaries.
**Default Behavior (Development Only):**
By default, FastMCP automatically manages cryptographic keys:
* **Mac/Windows**: Keys are generated and stored in your system keyring, surviving server restarts. Suitable **only** for development and local testing.
* **Linux**: Keys are ephemeral (random salt at startup), so tokens are invalidated on restart.
This automatic approach is convenient for development but not suitable for production deployments.
**For Production:**
Production requires explicit key management to ensure tokens survive restarts and can be shared across multiple server instances. This requires the following two things working together:
1. **Explicit JWT signing key** for signing tokens issued to clients
2. **Persistent network-accessible storage** for upstream tokens (wrapped in `FernetEncryptionWrapper` to encrypt sensitive data at rest)
**Configuration:**
Add two parameters to your auth provider:
```
`from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
auth = GitHubProvider(
client\_id=os.environ["GITHUB\_CLIENT\_ID"],
client\_secret=os.environ["GITHUB\_CLIENT\_SECRET"],
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
client\_storage=FernetEncryptionWrapper(
key\_value=RedisStore(host="redis.example.com", port=6379),
fernet=Fernet(os.environ["STORAGE\_ENCRYPTION\_KEY"])
),
base\_url="https://your-server.com" # use HTTPS
)
`
```
Both parameters are required for production. Without an explicit signing key, keys are signed using a key derived from the client\_secret, which will cause invalidation upon rotation of the client secret. Without persistent storage, tokens are local to the server and won’t be trusted across hosts. **Wrap your storage backend in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without encryption, tokens are stored in plaintext.
For more details on the token architecture and key management, see [OAuth Proxy Key and Storage Management](/v2/servers/auth/oauth-proxy#key-and-storage-management).
##
[​
](#reverse-proxy-nginx)
Reverse Proxy (nginx)
In production, you’ll typically run your FastMCP server behind a reverse proxy like nginx. A reverse proxy provides TLS termination, domain-based routing, static file serving, and an additional layer of security between the internet and your application.
###
[​
](#running-fastmcp-as-a-linux-service)
Running FastMCP as a Linux Service
Before configuring nginx, you need your FastMCP server running as a background service. A systemd unit file ensures your server starts automatically and restarts on failure.
Create a file at `/etc/systemd/system/fastmcp.service`:
```
`[Unit]
Description=FastMCP Server
After=network.target
[Service]
User=www-data
Group=www-data
WorkingDirectory=/opt/fastmcp
ExecStart=/opt/fastmcp/.venv/bin/uvicorn app:app --host 127.0.0.1 --port 8000
Restart=always
RestartSec=5
Environment="PATH=/opt/fastmcp/.venv/bin"
[Install]
WantedBy=multi-user.target
`
```
Enable and start the service:
```
`sudo systemctl daemon-reload
sudo systemctl enable fastmcp
sudo systemctl start fastmcp
`
```
This assumes your ASGI application is in `/opt/fastmcp/app.py` with a virtual environment at `/opt/fastmcp/.venv`. Adjust paths to match your deployment layout.
###
[​
](#nginx-configuration)
nginx Configuration
FastMCP’s Streamable HTTP transport uses Server-Sent Events (SSE) for streaming responses. This requires specific nginx settings to prevent buffering from breaking the event stream.
Create a site configuration at `/etc/nginx/sites-available/fastmcp`:
```
`server {
listen 80;
server\_name mcp.example.com;
# Redirect HTTP to HTTPS
return 301 https://$host$request\_uri;
}
server {
listen 443 ssl;
server\_name mcp.example.com;
ssl\_certificate /etc/letsencrypt/live/mcp.example.com/fullchain.pem;
ssl\_certificate\_key /etc/letsencrypt/live/mcp.example.com/privkey.pem;
location / {
proxy\_pass http://127.0.0.1:8000;
proxy\_http\_version 1.1;
proxy\_set\_header Connection '';
proxy\_set\_header Host $host;
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto $scheme;
# Required for SSE (Server-Sent Events) streaming
proxy\_buffering off;
proxy\_cache off;
# Allow long-lived connections for streaming responses
proxy\_read\_timeout 300s;
proxy\_send\_timeout 300s;
}
}
`
```
Enable the site and reload nginx:
```
`sudo ln -s /etc/nginx/sites-available/fastmcp /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
`
```
Your FastMCP server is now accessible at `https://mcp.example.com/mcp`.
**SSE buffering is the most common issue.** If clients connect but never receive streaming responses (progress updates, tool results), verify that `proxy\_buffering off` is set. Without it, nginx buffers the entire SSE stream and delivers it only when the connection closes, which breaks real-time communication.
###
[​
](#key-considerations)
Key Considerations
When deploying FastMCP behind a reverse proxy, keep these points in mind:
* **Disable buffering**: SSE requires `proxy\_buffering off` so events reach clients immediately. This is the single most important setting.
* **Increase timeouts**: The default nginx `proxy\_read\_timeout` is 60 seconds. Long-running MCP tools will cause the connection to drop. Set timeouts to at least 300 seconds, or higher if your tools run longer. For tools that may exceed any timeout, use [SSE Polling](#sse-polling-for-long-running-operations) to gracefully handle proxy disconnections.
* **Use HTTP/1.1**: Set `proxy\_http\_version 1.1` and `proxy\_set\_header Connection ''` to enable keep-alive connections between nginx and your server. Clearing the `Connection` header prevents clients from sending `Connection: close` to your upstream, which would break SSE streams. Both settings are required for proper SSE support.
* **Forward headers**: Pass `X-Forwarded-For` and `X-Forwarded-Proto` so your FastMCP server can determine the real client IP and protocol. This is important for logging and for OAuth redirect URLs.
* **TLS termination**: Let nginx handle TLS certificates (e.g., via Let’s Encrypt with Certbot). Your FastMCP server can then run on plain HTTP internally.
###
[​
](#mounting-under-a-path-prefix)
Mounting Under a Path Prefix
If you want your MCP server available at a subpath like `https://example.com/api/mcp` instead of at the root domain, adjust the nginx `location` block:
```
`location /api/ {
proxy\_pass http://127.0.0.1:8000/;
proxy\_http\_version 1.1;
proxy\_set\_header Connection '';
proxy\_set\_header Host $host;
proxy\_set\_header X-Real-IP $remote\_addr;
proxy\_set\_header X-Forwarded-For $proxy\_add\_x\_forwarded\_for;
proxy\_set\_header X-Forwarded-Proto $scheme;
# Required for SSE streaming
proxy\_buffering off;
proxy\_cache off;
proxy\_read\_timeout 300s;
proxy\_send\_timeout 300s;
}
`
```
Note the trailing `/` on both `location /api/` and `proxy\_pass http://127.0.0.1:8000/` — this ensures nginx strips the `/api` prefix before forwarding to your server. If you’re using OAuth authentication with a mount prefix, see [Mounting Authenticated Servers](#mounting-authenticated-servers) for additional configuration.
##
[​
](#testing-your-deployment)
Testing Your Deployment
Once your server is deployed, you’ll need to verify it’s accessible and functioning correctly. For comprehensive testing strategies including connectivity tests, client testing, and authentication testing, see the [Testing Your Server](/v2/development/tests) guide.
##
[​
](#hosting-your-server)
Hosting Your Server
This guide has shown you how to create an HTTP-accessible MCP server, but you’ll still need a hosting provider to make it available on the internet. Your FastMCP server can run anywhere that supports Python web applications:
* **Cloud VMs** (AWS EC2, Google Compute Engine, Azure VMs)
* **Container platforms** (Cloud Run, Container Instances, ECS)
* **Platform-as-a-Service** (Railway, Render, Vercel)
* **Edge platforms** (Cloudflare Workers)
* **Kubernetes clusters** (self-managed or managed)
The key requirements are Python 3.10+ support and the ability to expose an HTTP port. Most providers will require you to package your server (requirements.txt, Dockerfile, etc.) according to their deployment format. For managed, zero-configuration deployment, see [Prefect Horizon](/deployment/prefect-horizon).