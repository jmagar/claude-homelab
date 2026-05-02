The FastMCP Client - FastMCP
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
New in version `2.0.0`
The `fastmcp.Client` class provides a programmatic interface for interacting with any MCP server. It handles protocol details and connection management automatically, letting you focus on the operations you want to perform.
The FastMCP Client is designed for deterministic, controlled interactions rather than autonomous behavior, making it ideal for testing MCP servers during development, building deterministic applications that need reliable MCP interactions, and creating the foundation for agentic or LLM-based clients with structured, type-safe operations.
This is a programmatic client that requires explicit function calls and provides direct control over all MCP operations. Use it as a building block for higher-level systems.
##
[​
](#creating-a-client)
Creating a Client
You provide a server source and the client automatically infers the appropriate transport mechanism.
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
All client operations require using the `async with` context manager for proper connection lifecycle management.
##
[​
](#choosing-a-transport)
Choosing a Transport
The client automatically selects a transport based on what you pass to it, but different transports have different characteristics that matter for your use case.
**In-memory transport** connects directly to a FastMCP server instance within the same Python process. Use this for testing and development where you want to eliminate subprocess and network complexity. The server shares your process’s environment and memory space.
```
`from fastmcp import Client, FastMCP
server = FastMCP("TestServer")
client = Client(server) # In-memory, no network or subprocess
`
```
**STDIO transport** launches a server as a subprocess and communicates through stdin/stdout pipes. This is the standard mechanism used by desktop clients like Claude Desktop. The subprocess runs in an isolated environment, so you must explicitly pass any environment variables the server needs.
```
`from fastmcp import Client
# Simple inference from file path
client = Client("my\_server.py")
# With explicit environment configuration
client = Client("my\_server.py", env={"API\_KEY": "secret"})
`
```
**HTTP transport** connects to servers running as web services. Use this for production deployments where the server runs independently and manages its own lifecycle.
```
`from fastmcp import Client
client = Client("https://api.example.com/mcp")
`
```
See [Transports](/clients/transports) for detailed configuration options including authentication headers, session persistence, and multi-server configurations.
##
[​
](#configuration-based-clients)
Configuration-Based Clients
New in version `2.4.0`
Create clients from MCP configuration dictionaries, which can include multiple servers. While there is no official standard for MCP configuration format, FastMCP follows established conventions used by tools like Claude Desktop.
```
`config = {
"mcpServers": {
"weather": {
"url": "https://weather-api.example.com/mcp"
},
"assistant": {
"command": "python",
"args": ["./assistant\_server.py"]
}
}
}
client = Client(config)
async with client:
# Tools are prefixed with server names
weather\_data = await client.call\_tool("weather\_get\_forecast", {"city": "London"})
response = await client.call\_tool("assistant\_answer\_question", {"question": "What's the capital of France?"})
# Resources use prefixed URIs
icons = await client.read\_resource("weather://weather/icons/sunny")
`
```
##
[​
](#connection-lifecycle)
Connection Lifecycle
The client uses context managers for connection management. When you enter the context, the client establishes a connection and performs an MCP initialization handshake with the server. This handshake exchanges capabilities, server metadata, and instructions.
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
print(f"Instructions: {client.initialize\_result.instructions}")
print(f"Capabilities: {client.initialize\_result.capabilities.tools}")
`
```
For advanced scenarios where you need precise control over when initialization happens, disable automatic initialization and call `initialize()` manually:
```
`from fastmcp import Client
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
##
[​
](#operations)
Operations
FastMCP clients interact with three types of server components.
**Tools** are server-side functions that the client can execute with arguments. Call them with `call\_tool()` and receive structured results.
```
`async with client:
tools = await client.list\_tools()
result = await client.call\_tool("multiply", {"a": 5, "b": 3})
print(result.data) # 15
`
```
See [Tools](/clients/tools) for detailed documentation including version selection, error handling, and structured output.
**Resources** are data sources that the client can read, either static or templated. Access them with `read\_resource()` using URIs.
```
`async with client:
resources = await client.list\_resources()
content = await client.read\_resource("file:///config/settings.json")
print(content[0].text)
`
```
See [Resources](/clients/resources) for detailed documentation including templates and binary content.
**Prompts** are reusable message templates that can accept arguments. Retrieve rendered prompts with `get\_prompt()`.
```
`async with client:
prompts = await client.list\_prompts()
messages = await client.get\_prompt("analyze\_data", {"data": [1, 2, 3]})
print(messages.messages)
`
```
See [Prompts](/clients/prompts) for detailed documentation including argument serialization.
##
[​
](#callback-handlers)
Callback Handlers
The client supports callback handlers for advanced server interactions. These let you respond to server-initiated requests and receive notifications.
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
Each handler type has its own documentation:
* **[Sampling](/clients/sampling)** - Respond to server LLM requests
* **[Elicitation](/clients/elicitation)** - Handle server requests for user input
* **[Progress](/clients/progress)** - Monitor long-running operations
* **[Logging](/clients/logging)** - Handle server log messages
* **[Roots](/clients/roots)** - Provide local context to servers
The FastMCP Client is designed as a foundational tool. Use it directly for deterministic operations, or build higher-level agentic systems on top of its reliable, type-safe interface.