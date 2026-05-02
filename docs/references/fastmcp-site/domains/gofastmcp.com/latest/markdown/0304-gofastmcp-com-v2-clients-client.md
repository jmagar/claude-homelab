The FastMCP Client - FastMCP
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
The central piece of MCP client applications is the `fastmcp.Client` class. This class provides a **programmatic interface** for interacting with any Model Context Protocol (MCP) server, handling protocol details and connection management automatically.
The FastMCP Client is designed for deterministic, controlled interactions rather than autonomous behavior, making it ideal for:
* **Testing MCP servers** during development
* **Building deterministic applications** that need reliable MCP interactions
* **Creating the foundation for agentic or LLM-based clients** with structured, type-safe operations
All client operations require using the `async with` context manager for proper connection lifecycle management.
This is not an agentic client - it requires explicit function calls and provides direct control over all MCP operations. Use it as a building block for higher-level systems.
##
[​
](#creating-a-client)
Creating a Client
Creating a client is straightforward. You provide a server source and the client automatically infers the appropriate transport mechanism.
```
`import asyncio
from fastmcp import Client, FastMCP
# In-memory server (ideal for testing)
server = FastMCP("TestServer")
client = Client(server)
# HTTP server
client = Client("https://example.com/mcp")
# Local Python script
client = Client("my\_mcp\_server.py")
async def main():
async with client:
# Basic server interaction
await client.ping()
# List available operations
tools = await client.list\_tools()
resources = await client.list\_resources()
prompts = await client.list\_prompts()
# Execute operations
result = await client.call\_tool("example\_tool", {"param": "value"})
print(result)
asyncio.run(main())
`
```
##
[​
](#client-transport-architecture)
Client-Transport Architecture
The FastMCP Client separates concerns between protocol and connection:
* **`Client`**: Handles MCP protocol operations (tools, resources, prompts) and manages callbacks
* **`Transport`**: Establishes and maintains the connection (WebSockets, HTTP, Stdio, in-memory)
###
[​
](#transport-inference)
Transport Inference
The client automatically infers the appropriate transport based on the input:
1. **`FastMCP` instance** → In-memory transport (perfect for testing)
2. **File path ending in `.py`** → Python Stdio transport
3. **File path ending in `.js`** → Node.js Stdio transport
4. **URL starting with `http://` or `https://`** → HTTP transport
5. **`MCPConfig` dictionary** → Multi-server client
```
`from fastmcp import Client, FastMCP
# Examples of transport inference
client\_memory = Client(FastMCP("TestServer"))
client\_script = Client("./server.py")
client\_http = Client("https://api.example.com/mcp")
`
```
For testing and development, always prefer the in-memory transport by passing a `FastMCP` server directly to the client. This eliminates network complexity and separate processes.
##
[​
](#configuration-based-clients)
Configuration-Based Clients
New in version `2.4.0`
Create clients from MCP configuration dictionaries, which can include multiple servers. While there is no official standard for MCP configuration format, FastMCP follows established conventions used by tools like Claude Desktop.
###
[​
](#configuration-format)
Configuration Format
```
`config = {
"mcpServers": {
"server\_name": {
# Remote HTTP/SSE server
"transport": "http", # or "sse"
"url": "https://api.example.com/mcp",
"headers": {"Authorization": "Bearer token"},
"auth": "oauth" # or bearer token string
},
"local\_server": {
# Local stdio server
"transport": "stdio",
"command": "python",
"args": ["./server.py", "--verbose"],
"env": {"DEBUG": "true"},
"cwd": "/path/to/server",
}
}
}
`
```
###
[​
](#multi-server-example)
Multi-Server Example
```
`config = {
"mcpServers": {
"weather": {"url": "https://weather-api.example.com/mcp"},
"assistant": {"command": "python", "args": ["./assistant\_server.py"]}
}
}
client = Client(config)
async with client:
# Tools are prefixed with server names
weather\_data = await client.call\_tool("weather\_get\_forecast", {"city": "London"})
response = await client.call\_tool("assistant\_answer\_question", {"question": "What's the capital of France?"})
# Resources use prefixed URIs
icons = await client.read\_resource("weather://weather/icons/sunny")
templates = await client.read\_resource("resource://assistant/templates/list")
`
```
##
[​
](#connection-lifecycle)
Connection Lifecycle
The client operates asynchronously and uses context managers for connection management:
```
`async def example():
client = Client("my\_mcp\_server.py")
# Connection established here
async with client:
print(f"Connected: {client.is\_connected()}")
# Make multiple calls within the same session
tools = await client.list\_tools()
result = await client.call\_tool("greet", {"name": "World"})
# Connection closed automatically here
print(f"Connected: {client.is\_connected()}")
`
```
##
[​
](#operations)
Operations
FastMCP clients can interact with several types of server components:
###
[​
](#tools)
Tools
Tools are server-side functions that the client can execute with arguments.
```
`async with client:
# List available tools
tools = await client.list\_tools()
# Execute a tool
result = await client.call\_tool("multiply", {"a": 5, "b": 3})
print(result.data) # 15
`
```
See [Tools](/v2/clients/tools) for detailed documentation.
###
[​
](#resources)
Resources
Resources are data sources that the client can read, either static or templated.
```
`async with client:
# List available resources
resources = await client.list\_resources()
# Read a resource
content = await client.read\_resource("file:///config/settings.json")
print(content[0].text)
`
```
See [Resources](/v2/clients/resources) for detailed documentation.
###
[​
](#prompts)
Prompts
Prompts are reusable message templates that can accept arguments.
```
`async with client:
# List available prompts
prompts = await client.list\_prompts()
# Get a rendered prompt
messages = await client.get\_prompt("analyze\_data", {"data": [1, 2, 3]})
print(messages.messages)
`
```
See [Prompts](/v2/clients/prompts) for detailed documentation.
###
[​
](#server-connectivity)
Server Connectivity
Use `ping()` to verify the server is reachable:
```
`async with client:
await client.ping()
print("Server is reachable")
`
```
###
[​
](#initialization-and-server-information)
Initialization and Server Information
When you enter the client context manager, the client automatically performs an MCP initialization handshake with the server. This handshake exchanges capabilities, server metadata, and instructions. The result is available through the `initialize\_result` property.
```
`from fastmcp import Client, FastMCP
mcp = FastMCP(name="MyServer", instructions="Use the greet tool to say hello!")
@mcp.tool
def greet(name: str) -\> str:
"""Greet a user by name."""
return f"Hello, {name}!"
async with Client(mcp) as client:
# Initialization already happened automatically
print(f"Server: {client.initialize\_result.serverInfo.name}")
print(f"Version: {client.initialize\_result.serverInfo.version}")
print(f"Instructions: {client.initialize\_result.instructions}")
print(f"Capabilities: {client.initialize\_result.capabilities.tools}")
`
```
####
[​
](#manual-initialization-control)
Manual Initialization Control
In advanced scenarios, you might want precise control over when initialization happens. For example, you may need custom error handling, want to defer initialization until after other setup, or need to measure initialization timing separately.
Disable automatic initialization and call `initialize()` manually:
```
`from fastmcp import Client
# Disable automatic initialization
client = Client("my\_mcp\_server.py", auto\_initialize=False)
async with client:
# Connection established, but not initialized yet
print(f"Connected: {client.is\_connected()}")
print(f"Initialized: {client.initialize\_result is not None}") # False
# Initialize manually with custom timeout
result = await client.initialize(timeout=10.0)
print(f"Server: {result.serverInfo.name}")
# Now ready for operations
tools = await client.list\_tools()
`
```
The `initialize()` method is idempotent - calling it multiple times returns the cached result from the first successful call.
##
[​
](#client-configuration)
Client Configuration
Clients can be configured with additional handlers and settings for specialized use cases.
###
[​
](#callback-handlers)
Callback Handlers
The client supports several callback handlers for advanced server interactions:
```
`from fastmcp import Client
from fastmcp.client.logging import LogMessage
async def log\_handler(message: LogMessage):
print(f"Server log: {message.data}")
async def progress\_handler(progress: float, total: float | None, message: str | None):
print(f"Progress: {progress}/{total} - {message}")
async def sampling\_handler(messages, params, context):
# Integrate with your LLM service here
return "Generated response"
client = Client(
"my\_mcp\_server.py",
log\_handler=log\_handler,
progress\_handler=progress\_handler,
sampling\_handler=sampling\_handler,
timeout=30.0
)
`
```
The `Client` constructor accepts several configuration options:
* `transport`: Transport instance or source for automatic inference
* `log\_handler`: Handle server log messages
* `progress\_handler`: Monitor long-running operations
* `sampling\_handler`: Respond to server LLM requests
* `roots`: Provide local context to servers
* `timeout`: Default timeout for requests (in seconds)
###
[​
](#transport-configuration)
Transport Configuration
For detailed transport configuration (headers, authentication, environment variables), see the [Transports](/v2/clients/transports) documentation.
##
[​
](#next-steps)
Next Steps
Explore the detailed documentation for each operation type:
###
[​
](#core-operations)
Core Operations
* **[Tools](/v2/clients/tools)** - Execute server-side functions and handle results
* **[Resources](/v2/clients/resources)** - Access static and templated resources
* **[Prompts](/v2/clients/prompts)** - Work with message templates and argument serialization
###
[​
](#advanced-features)
Advanced Features
* **[Logging](/v2/clients/logging)** - Handle server log messages
* **[Progress](/v2/clients/progress)** - Monitor long-running operations
* **[Sampling](/v2/clients/sampling)** - Respond to server LLM requests
* **[Roots](/v2/clients/roots)** - Provide local context to servers
###
[​
](#connection-details)
Connection Details
* **[Transports](/v2/clients/transports)** - Configure connection methods and parameters
* **[Authentication](/v2/clients/auth/oauth)** - Set up OAuth and bearer token authentication
The FastMCP Client is designed as a foundational tool. Use it directly for deterministic operations, or build higher-level agentic systems on top of its reliable, type-safe interface.