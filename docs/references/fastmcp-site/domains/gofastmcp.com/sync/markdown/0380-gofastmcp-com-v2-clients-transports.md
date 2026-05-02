Client Transports - FastMCP
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
* [
Overview
](/v2/clients/client)
* [
Transports
](/v2/clients/transports)
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
The FastMCP `Client` communicates with MCP servers through transport objects that handle the underlying connection mechanics. While the client can automatically select a transport based on what you pass to it, instantiating transports explicitly gives you full control over configuration—environment variables, authentication, session management, and more.
Think of transports as configurable adapters between your client code and MCP servers. Each transport type handles a different communication pattern: subprocesses with pipes, HTTP connections, or direct in-memory calls.
##
[​
](#choosing-the-right-transport)
Choosing the Right Transport
* **Use [STDIO Transport](#stdio-transport)** when you need to run local MCP servers with full control over their environment and lifecycle
* **Use [Remote Transports](#remote-transports)** when connecting to production services or shared MCP servers running independently
* **Use [In-Memory Transport](#in-memory-transport)** for testing FastMCP servers without subprocess or network overhead
* **Use [MCP JSON Configuration](#mcp-json-configuration-transport)** when you need to connect to multiple servers defined in configuration files
##
[​
](#stdio-transport)
STDIO Transport
STDIO (Standard Input/Output) transport communicates with MCP servers through subprocess pipes. This is the standard mechanism used by desktop clients like Claude Desktop and is the primary way to run local MCP servers.
###
[​
](#the-client-runs-the-server)
The Client Runs the Server
**Critical Concept**: When using STDIO transport, your client actually launches and manages the server process. This is fundamentally different from network transports where you connect to an already-running server. Understanding this relationship is key to using STDIO effectively.
With STDIO transport, your client:
* Starts the server as a subprocess when you connect
* Manages the server’s lifecycle (start, stop, restart)
* Controls the server’s environment and configuration
* Communicates through stdin/stdout pipes
This architecture enables powerful local integrations but requires understanding environment isolation and process management.
###
[​
](#environment-isolation)
Environment Isolation
STDIO servers run in isolated environments by default. This is a security feature enforced by the MCP protocol to prevent accidental exposure of sensitive data.
When your client launches an MCP server:
* The server does NOT inherit your shell’s environment variables
* API keys, paths, and other configuration must be explicitly passed
* The working directory and system paths may differ from your shell
To pass environment variables to your server, use the `env` parameter:
```
`from fastmcp import Client
# If your server needs environment variables (like API keys),
# you must explicitly pass them:
client = Client(
"my\_server.py",
env={"API\_KEY": "secret", "DEBUG": "true"}
)
# This won't work - the server runs in isolation:
# export API\_KEY="secret" # in your shell
# client = Client("my\_server.py") # server can't see API\_KEY
`
```
###
[​
](#basic-usage)
Basic Usage
To use STDIO transport, you create a transport instance with the command and arguments needed to run your server:
```
`from fastmcp.client.transports import StdioTransport
transport = StdioTransport(
command="python",
args=["my\_server.py"]
)
client = Client(transport)
`
```
You can configure additional settings like environment variables, working directory, or command arguments:
```
`transport = StdioTransport(
command="python",
args=["my\_server.py", "--verbose"],
env={"LOG\_LEVEL": "DEBUG"},
cwd="/path/to/server"
)
client = Client(transport)
`
```
For convenience, the client can also infer STDIO transport from file paths, but this doesn’t allow configuration:
```
`from fastmcp import Client
client = Client("my\_server.py") # Limited - no configuration options
`
```
###
[​
](#environment-variables)
Environment Variables
Since STDIO servers don’t inherit your environment, you need strategies for passing configuration. Here are two common approaches:
**Selective forwarding** passes only the variables your server actually needs:
```
`import os
from fastmcp.client.transports import StdioTransport
required\_vars = ["API\_KEY", "DATABASE\_URL", "REDIS\_HOST"]
env = {
var: os.environ[var]
for var in required\_vars
if var in os.environ
}
transport = StdioTransport(
command="python",
args=["server.py"],
env=env
)
client = Client(transport)
`
```
**Loading from .env files** keeps configuration separate from code:
```
`from dotenv import dotenv\_values
from fastmcp.client.transports import StdioTransport
env = dotenv\_values(".env")
transport = StdioTransport(
command="python",
args=["server.py"],
env=env
)
client = Client(transport)
`
```
###
[​
](#session-persistence)
Session Persistence
STDIO transports maintain sessions across multiple client contexts by default (`keep\_alive=True`). This improves performance by reusing the same subprocess for multiple connections, but can be controlled when you need isolation.
By default, the subprocess persists between connections:
```
`from fastmcp.client.transports import StdioTransport
transport = StdioTransport(
command="python",
args=["server.py"]
)
client = Client(transport)
async def efficient\_multiple\_operations():
async with client:
await client.ping()
async with client: # Reuses the same subprocess
await client.call\_tool("process\_data", {"file": "data.csv"})
`
```
For complete isolation between connections, disable session persistence:
```
`transport = StdioTransport(
command="python",
args=["server.py"],
keep\_alive=False
)
client = Client(transport)
`
```
Use `keep\_alive=False` when you need complete isolation (e.g., in test suites) or when server state could cause issues between connections.
###
[​
](#specialized-stdio-transports)
Specialized STDIO Transports
FastMCP provides convenience transports that are thin wrappers around `StdioTransport` with pre-configured commands:
* **`PythonStdioTransport`** - Uses `python` command for `.py` files
* **`NodeStdioTransport`** - Uses `node` command for `.js` files
* **`UvStdioTransport`** - Uses `uv` for Python packages (uses `env\_vars` parameter)
* **`UvxStdioTransport`** - Uses `uvx` for Python packages (uses `env\_vars` parameter)
* **`NpxStdioTransport`** - Uses `npx` for Node packages (uses `env\_vars` parameter)
For most use cases, instantiate `StdioTransport` directly with your desired command. These specialized transports are primarily useful for client inference shortcuts.
##
[​
](#remote-transports)
Remote Transports
Remote transports connect to MCP servers running as web services. This is a fundamentally different model from STDIO transports—instead of your client launching and managing a server process, you connect to an already-running service that manages its own environment and lifecycle.
###
[​
](#streamable-http-transport)
Streamable HTTP Transport
New in version `2.3.0`
Streamable HTTP is the recommended transport for production deployments, providing efficient bidirectional streaming over HTTP connections.
* **Class:** `StreamableHttpTransport`
* **Server compatibility:** FastMCP servers running with `mcp run --transport http`
The transport requires a URL and optionally supports custom headers for authentication and configuration:
```
`from fastmcp.client.transports import StreamableHttpTransport
# Basic connection
transport = StreamableHttpTransport(url="https://api.example.com/mcp")
client = Client(transport)
# With custom headers for authentication
transport = StreamableHttpTransport(
url="https://api.example.com/mcp",
headers={
"Authorization": "Bearer your-token-here",
"X-Custom-Header": "value"
}
)
client = Client(transport)
`
```
For convenience, FastMCP also provides authentication helpers:
```
`from fastmcp.client.auth import BearerAuth
client = Client(
"https://api.example.com/mcp",
auth=BearerAuth("your-token-here")
)
`
```
###
[​
](#sse-transport-legacy)
SSE Transport (Legacy)
Server-Sent Events transport is maintained for backward compatibility but is superseded by Streamable HTTP for new deployments.
* **Class:** `SSETransport`
* **Server compatibility:** FastMCP servers running with `mcp run --transport sse`
SSE transport supports the same configuration options as Streamable HTTP:
```
`from fastmcp.client.transports import SSETransport
transport = SSETransport(
url="https://api.example.com/sse",
headers={"Authorization": "Bearer token"}
)
client = Client(transport)
`
```
Use Streamable HTTP for new deployments unless you have specific infrastructure requirements for SSE.
##
[​
](#in-memory-transport)
In-Memory Transport
In-memory transport connects directly to a FastMCP server instance within the same Python process. This eliminates both subprocess management and network overhead, making it ideal for testing and development.
* **Class:** `FastMCPTransport`
Unlike STDIO transports, in-memory servers have full access to your Python process’s environment. They share the same memory space and environment variables as your client code—no isolation or explicit environment passing required.
```
`from fastmcp import FastMCP, Client
import os
mcp = FastMCP("TestServer")
@mcp.tool
def greet(name: str) -\> str:
prefix = os.environ.get("GREETING\_PREFIX", "Hello")
return f"{prefix}, {name}!"
client = Client(mcp)
async with client:
result = await client.call\_tool("greet", {"name": "World"})
`
```
##
[​
](#mcp-json-configuration-transport)
MCP JSON Configuration Transport
New in version `2.4.0`
This transport supports the emerging MCP JSON configuration standard for defining multiple servers:
* **Class:** `MCPConfigTransport`
```
`config = {
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"transport": "http"
},
"assistant": {
"command": "python",
"args": ["./assistant.py"],
"env": {"LOG\_LEVEL": "INFO"}
}
}
}
client = Client(config)
async with client:
# Tools are namespaced by server
weather = await client.call\_tool("weather\_get\_forecast", {"city": "NYC"})
answer = await client.call\_tool("assistant\_ask", {"question": "What?"})
`
```
###
[​
](#tool-transformation-with-fastmcp-and-mcpconfig)
Tool Transformation with FastMCP and MCPConfig
FastMCP supports basic tool transformations to be defined alongside the MCP Servers in the MCPConfig file.
```
`config = {
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"transport": "http",
"tools": { } # \<--- This is the tool transformation section
}
}
}
`
```
With these transformations, you can transform (change) the name, title, description, tags, enablement, and arguments of a tool.
For each argument the tool takes, you can transform (change) the name, description, default, visibility, whether it’s required, and you can provide example values.
In the following example, we’re transforming the `weather\_get\_forecast` tool to only retrieve the weather for `Miami` and hiding the `city` argument from the client.
```
`tool\_transformations = {
"weather\_get\_forecast": {
"name": "miami\_weather",
"description": "Get the weather for Miami",
"arguments": {
"city": {
"name": "city",
"default": "Miami",
"hide": True,
}
}
}
}
config = {
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"transport": "http",
"tools": tool\_transformations
}
}
}
`
```
####
[​
](#allowlisting-and-blocklisting-tools)
Allowlisting and Blocklisting Tools
Tools can be allowlisted or blocklisted from the client by applying `tags` to the tools on the server. In the following example, we’re allowlisting only tools marked with the `forecast` tag, all other tools will be unavailable to the client.
```
`tool\_transformations = {
"weather\_get\_forecast": {
"enabled": True,
"tags": ["forecast"]
}
}
config = {
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"transport": "http",
"tools": tool\_transformations,
"include\_tags": ["forecast"]
}
}
}
`
```