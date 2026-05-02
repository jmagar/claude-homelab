Running Your Server - FastMCP
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
* [
Running Your Server
](/deployment/running-server)
* [
HTTP Deployment
](/deployment/http)
* [
Prefect Horizon
](/deployment/prefect-horizon)
* [
Project Configuration
](/deployment/server-configuration)
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
FastMCP servers can be run in different ways depending on your needs. This guide focuses on running servers locally for development and testing. For production deployment to a URL, see the [HTTP Deployment](/deployment/http) guide.
##
[​
](#the-run-method)
The `run()` Method
Every FastMCP server needs to be started to accept connections. The simplest way to run a server is by calling the `run()` method on your FastMCP instance. This method starts the server and blocks until it’s stopped, handling all the connection management for you.
For maximum compatibility, it’s best practice to place the `run()` call within an `if \_\_name\_\_ == "\_\_main\_\_":` block. This ensures the server starts only when the script is executed directly, not when imported as a module.
my\_server.py
```
`from fastmcp import FastMCP
mcp = FastMCP(name="MyServer")
@mcp.tool
def hello(name: str) -\> str:
return f"Hello, {name}!"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
You can now run this MCP server by executing `python my\_server.py`.
##
[​
](#transport-protocols)
Transport Protocols
MCP servers communicate with clients through different transport protocols. Think of transports as the “language” your server speaks to communicate with clients. FastMCP supports three main transport protocols, each designed for specific use cases and deployment scenarios.
The choice of transport determines how clients connect to your server, what network capabilities are available, and how many clients can connect simultaneously. Understanding these transports helps you choose the right approach for your application.
###
[​
](#stdio-transport-default)
STDIO Transport (Default)
STDIO (Standard Input/Output) is the default transport for FastMCP servers. When you call `run()` without arguments, your server uses STDIO transport. This transport communicates through standard input and output streams, making it perfect for command-line tools and desktop applications like Claude Desktop.
With STDIO transport, the client spawns a new server process for each session and manages its lifecycle. The server reads MCP messages from stdin and writes responses to stdout. This is why STDIO servers don’t stay running - they’re started on-demand by the client.
```
`from fastmcp import FastMCP
mcp = FastMCP("MyServer")
@mcp.tool
def hello(name: str) -\> str:
return f"Hello, {name}!"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run() # Uses STDIO transport by default
`
```
STDIO is ideal for:
* Local development and testing
* Claude Desktop integration
* Command-line tools
* Single-user applications
###
[​
](#http-transport-streamable)
HTTP Transport (Streamable)
HTTP transport turns your MCP server into a web service accessible via a URL. This transport uses the Streamable HTTP protocol, which allows clients to connect over the network. Unlike STDIO where each client gets its own process, an HTTP server can handle multiple clients simultaneously.
The Streamable HTTP protocol provides full bidirectional communication between client and server, supporting all MCP operations including streaming responses. This makes it the recommended choice for network-based deployments.
To use HTTP transport, specify it in the `run()` method along with networking options:
```
`from fastmcp import FastMCP
mcp = FastMCP("MyServer")
@mcp.tool
def hello(name: str) -\> str:
return f"Hello, {name}!"
if \_\_name\_\_ == "\_\_main\_\_":
# Start an HTTP server on port 8000
mcp.run(transport="http", host="127.0.0.1", port=8000)
`
```
Your server is now accessible at `http://localhost:8000/mcp`. This URL is the MCP endpoint that clients will connect to. HTTP transport enables:
* Network accessibility
* Multiple concurrent clients
* Integration with web infrastructure
* Remote deployment capabilities
For production HTTP deployment with authentication and advanced configuration, see the [HTTP Deployment](/deployment/http) guide.
###
[​
](#sse-transport-legacy)
SSE Transport (Legacy)
Server-Sent Events (SSE) transport was the original HTTP-based transport for MCP. While still supported for backward compatibility, it has limitations compared to the newer Streamable HTTP transport. SSE only supports server-to-client streaming, making it less efficient for bidirectional communication.
```
`if \_\_name\_\_ == "\_\_main\_\_":
# SSE transport - use HTTP instead for new projects
mcp.run(transport="sse", host="127.0.0.1", port=8000)
`
```
We recommend using HTTP transport instead of SSE for all new projects. SSE remains available only for compatibility with older clients that haven’t upgraded to Streamable HTTP.
###
[​
](#choosing-the-right-transport)
Choosing the Right Transport
Each transport serves different needs. STDIO is perfect when you need simple, local execution - it’s what Claude Desktop and most command-line tools expect. HTTP transport is essential when you need network access, want to serve multiple clients, or plan to deploy your server remotely. SSE exists only for backward compatibility and shouldn’t be used in new projects.
Consider your deployment scenario: Are you building a tool for local use? STDIO is your best choice. Need a centralized service that multiple clients can access? HTTP transport is the way to go.
##
[​
](#the-fastmcp-cli)
The FastMCP CLI
FastMCP provides a powerful command-line interface for running servers without modifying the source code. The CLI can automatically find and run your server with different transports, manage dependencies, and handle development workflows:
```
`fastmcp run server.py
`
```
The CLI automatically finds a FastMCP instance in your file (named `mcp`, `server`, or `app`) and runs it with the specified options. This is particularly useful for testing different transports or configurations without changing your code.
###
[​
](#dependency-management)
Dependency Management
The CLI integrates with `uv` to manage Python environments and dependencies:
```
`# Run with a specific Python version
fastmcp run server.py --python 3.11
# Run with additional packages
fastmcp run server.py --with pandas --with numpy
# Run with dependencies from a requirements file
fastmcp run server.py --with-requirements requirements.txt
# Combine multiple options
fastmcp run server.py --python 3.10 --with httpx --transport http
# Run within a specific project directory
fastmcp run server.py --project /path/to/project
`
```
When using `--python`, `--with`, `--project`, or `--with-requirements`, the server runs via `uv run` subprocess instead of using your local environment.
###
[​
](#passing-arguments-to-servers)
Passing Arguments to Servers
When servers accept command line arguments (using argparse, click, or other libraries), you can pass them after `--`:
```
`fastmcp run config\_server.py -- --config config.json
fastmcp run database\_server.py -- --database-path /tmp/db.sqlite --debug
`
```
This is useful for servers that need configuration files, database paths, API keys, or other runtime options.
For more CLI features including development mode with the MCP Inspector, see the [CLI documentation](/cli/running).
###
[​
](#auto-reload-for-development)
Auto-Reload for Development
New in version `3.0.0`
During development, you can use the `--reload` flag to automatically restart your server when source files change:
```
`fastmcp run server.py --reload
`
```
The server watches for changes to Python files in the current directory and restarts automatically when you save changes. This provides a fast feedback loop during development without manually stopping and starting the server.
```
`# Watch specific directories for changes
fastmcp run server.py --reload --reload-dir ./src --reload-dir ./lib
# Combine with other options
fastmcp run server.py --reload --transport http --port 8080
`
```
Auto-reload uses stateless mode to enable seamless restarts. For stdio transport, this is fully featured. For HTTP transport, some bidirectional features like elicitation are not available during reload mode.
SSE transport does not support auto-reload due to session limitations. Use HTTP transport instead if you need both network access and auto-reload.
###
[​
](#async-usage)
Async Usage
FastMCP servers are built on async Python, but the framework provides both synchronous and asynchronous APIs to fit your application’s needs. The `run()` method we’ve been using is actually a synchronous wrapper around the async server implementation.
For applications that are already running in an async context, FastMCP provides the `run\_async()` method:
```
`from fastmcp import FastMCP
import asyncio
mcp = FastMCP(name="MyServer")
@mcp.tool
def hello(name: str) -\> str:
return f"Hello, {name}!"
async def main():
# Use run\_async() in async contexts
await mcp.run\_async(transport="http", port=8000)
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
The `run()` method cannot be called from inside an async function because it creates its own async event loop internally. If you attempt to call `run()` from inside an async function, you’ll get an error about the event loop already running.Always use `run\_async()` inside async functions and `run()` in synchronous contexts.
Both `run()` and `run\_async()` accept the same transport arguments, so all the examples above apply to both methods.
##
[​
](#custom-routes)
Custom Routes
When using HTTP transport, you might want to add custom web endpoints alongside your MCP server. This is useful for health checks, status pages, or simple APIs. FastMCP lets you add custom routes using the `@custom\_route` decorator:
```
`from fastmcp import FastMCP
from starlette.requests import Request
from starlette.responses import PlainTextResponse
mcp = FastMCP("MyServer")
@mcp.custom\_route("/health", methods=["GET"])
async def health\_check(request: Request) -\> PlainTextResponse:
return PlainTextResponse("OK")
@mcp.tool
def process(data: str) -\> str:
return f"Processed: {data}"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http") # Health check at http://localhost:8000/health
`
```
Custom routes are served by the same web server as your MCP endpoint. They’re available at the root of your domain while the MCP endpoint is at `/mcp/`. For more complex web applications, consider [mounting your MCP server into a FastAPI or Starlette app](/deployment/http#integration-with-web-frameworks).
##
[​
](#alternative-initialization-patterns)
Alternative Initialization Patterns
The `if \_\_name\_\_ == "\_\_main\_\_"` pattern works well for standalone scripts, but some deployment scenarios require different approaches. FastMCP handles these cases automatically.
###
[​
](#cli-only-servers)
CLI-Only Servers
When using the FastMCP CLI, you don’t need the `if \_\_name\_\_` block at all. The CLI will find your FastMCP instance and run it:
```
`# server.py
from fastmcp import FastMCP
mcp = FastMCP("MyServer") # CLI looks for 'mcp', 'server', or 'app'
@mcp.tool
def process(data: str) -\> str:
return f"Processed: {data}"
# No if \_\_name\_\_ block needed - CLI will find and run 'mcp'
`
```
###
[​
](#asgi-applications)
ASGI Applications
For ASGI deployment (running with Uvicorn or similar), you’ll want to create an ASGI application object. This approach is common in production deployments where you need more control over the server configuration:
```
`# app.py
from fastmcp import FastMCP
def create\_app():
mcp = FastMCP("MyServer")
@mcp.tool
def process(data: str) -\> str:
return f"Processed: {data}"
return mcp.http\_app()
app = create\_app() # Uvicorn will use this
`
```
See the [HTTP Deployment](/deployment/http) guide for more ASGI deployment patterns.