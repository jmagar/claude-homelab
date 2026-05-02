Quickstart - FastMCP
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
Welcome! This guide will help you quickly set up FastMCP, run your first MCP server, and deploy a server to Prefect Horizon.
If you haven’t already installed FastMCP, follow the [installation instructions](/v2/getting-started/installation).
##
[​
](#create-a-fastmcp-server)
Create a FastMCP Server
A FastMCP server is a collection of tools, resources, and other MCP components. To create a server, start by instantiating the `FastMCP` class.
Create a new file called `my\_server.py` and add the following code:
my\_server.py
```
`from fastmcp import FastMCP
mcp = FastMCP("My MCP Server")
`
```
That’s it! You’ve created a FastMCP server, albeit a very boring one. Let’s add a tool to make it more interesting.
##
[​
](#add-a-tool)
Add a Tool
To add a tool that returns a simple greeting, write a function and decorate it with `@mcp.tool` to register it with the server:
my\_server.py
```
`from fastmcp import FastMCP
mcp = FastMCP("My MCP Server")
@mcp.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
`
```
##
[​
](#run-the-server)
Run the Server
The simplest way to run your FastMCP server is to call its `run()` method. You can choose between different transports, like `stdio` for local servers, or `http` for remote access:
my\_server.py (stdio)
my\_server.py (HTTP)
```
`from fastmcp import FastMCP
mcp = FastMCP("My MCP Server")
@mcp.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
This lets us run the server with `python my\_server.py`. The stdio transport is the traditional way to connect MCP servers to clients, while the HTTP transport enables remote connections.
Why do we need the `if \_\_name\_\_ == "\_\_main\_\_":` block?The `\_\_main\_\_` block is recommended for consistency and compatibility, ensuring your server works with all MCP clients that execute your server file as a script. Users who will exclusively run their server with the FastMCP CLI can omit it, as the CLI imports the server object directly.
###
[​
](#using-the-fastmcp-cli)
Using the FastMCP CLI
You can also use the `fastmcp run` command to start your server. Note that the FastMCP CLI **does not** execute the `\_\_main\_\_` block of your server file. Instead, it imports your server object and runs it with whatever transport and options you provide.
For example, to run this server with the default stdio transport (no matter how you called `mcp.run()`), you can use the following command:
```
`fastmcp run my\_server.py:mcp
`
```
To run this server with the HTTP transport, you can use the following command:
```
`fastmcp run my\_server.py:mcp --transport http --port 8000
`
```
##
[​
](#call-your-server)
Call Your Server
Once your server is running with HTTP transport, you can connect to it with a FastMCP client or any LLM client that supports the MCP protocol:
my\_client.py
```
`import asyncio
from fastmcp import Client
client = Client("http://localhost:8000/mcp")
async def call\_tool(name: str):
async with client:
result = await client.call\_tool("greet", {"name": name})
print(result)
asyncio.run(call\_tool("Ford"))
`
```
Note that:
* FastMCP clients are asynchronous, so we need to use `asyncio.run` to run the client
* We must enter a client context (`async with client:`) before using the client
* You can make multiple client calls within the same context
##
[​
](#deploy-to-prefect-horizon)
Deploy to Prefect Horizon
[Prefect Horizon](https://horizon.prefect.io) is the enterprise MCP platform built by the FastMCP team at [Prefect](https://www.prefect.io). It provides managed hosting, authentication, access control, and observability for MCP servers.
Horizon is **free for personal projects** and offers enterprise governance for teams.
To deploy your server, you’ll need a [GitHub account](https://github.com). Once you have one, you can deploy your server in three steps:
1. Push your `my\_server.py` file to a GitHub repository
2. Sign in to [Prefect Horizon](https://horizon.prefect.io) with your GitHub account
3. Create a new project from your repository and enter `my\_server.py:mcp` as the server entrypoint
That’s it! Horizon will build and deploy your server, making it available at a URL like `https://your-project.fastmcp.app/mcp`. You can chat with it to test its functionality, or connect to it from any LLM client that supports the MCP protocol.
For more details, see the [Prefect Horizon guide](/deployment/prefect-horizon).