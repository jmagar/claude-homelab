Quickstart - FastMCP
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
Welcome! This guide will help you quickly set up FastMCP, run your first MCP server, give it a visual UI, and deploy it to Prefect Horizon.
If you haven’t already installed FastMCP, follow the [installation instructions](/getting-started/installation).
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
](#give-your-tool-a-ui)
Give Your Tool a UI
Tools normally return text, but any tool can return an interactive UI instead. Add `app=True` to your tool decorator and return a [Prefab](https://prefab.prefect.io) component — the host renders it as a chart, table, form, or any other visual element right in the conversation. This requires the `apps` extra (`pip install "fastmcp[apps]"`).
The `app=True` flag tells FastMCP to wire up the renderer and protocol metadata automatically. The tool still works like any other MCP tool — it receives arguments and returns a result — but the result is a component tree that the host displays visually instead of as plain text.
my\_server.py
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading, Text, Badge, Row
from fastmcp import FastMCP
mcp = FastMCP("My MCP Server")
@mcp.tool(app=True)
def greet(name: str) -\> PrefabApp:
"""Greet someone with a visual card."""
with Column(gap=4, css\_class="p-6") as view:
Heading(f"Hello, {name}!")
with Row(gap=2, align="center"):
Text("Status")
Badge("Greeted", variant="success")
return PrefabApp(view=view)
`
```
You can preview app tools locally with `fastmcp dev apps my\_server.py` — no MCP host required. See the [Apps overview](/apps/overview) for the full guide, including state management, forms, charts, and server-connected interactivity.
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