Welcome to FastMCP 2.0! - FastMCP
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
**FastMCP is the standard framework for building MCP applications.** The [Model Context Protocol](https://modelcontextprotocol.io/) (MCP) provides a standardized way to connect LLMs to tools and data, and FastMCP makes it production-ready with clean, Pythonic code:
```
`from fastmcp import FastMCP
mcp = FastMCP("Demo 🚀")
@mcp.tool
def add(a: int, b: int) -\> int:
"""Add two numbers"""
return a + b
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
##
[​
](#beyond-basic-mcp)
Beyond Basic MCP
FastMCP pioneered Python MCP development, and FastMCP 1.0 was incorporated into the [official MCP SDK](https://github.com/modelcontextprotocol/python-sdk) in 2024.
**This is FastMCP 2.0,** the actively maintained version that extends far beyond basic protocol implementation. While the SDK provides core functionality, FastMCP 2.0 delivers everything needed for production: advanced MCP patterns (server composition, proxying, OpenAPI/FastAPI generation, tool transformation), enterprise auth (Google, GitHub, Azure, Auth0, WorkOS, and more), deployment tools, testing frameworks, and comprehensive client libraries.
Ready to build? Start with our [installation guide](/v2/getting-started/installation) or jump straight to the [quickstart](/v2/getting-started/quickstart).
FastMCP is made with 💙 by [Prefect](https://www.prefect.io/).
**FastMCP 3.0** is in development and may include breaking changes. To avoid unexpected issues, pin your dependency to v2: `fastmcp\<3`
##
[​
](#what-is-mcp)
What is MCP?
The Model Context Protocol lets you build servers that expose data and functionality to LLM applications in a secure, standardized way. It is often described as “the USB-C port for AI”, providing a uniform way to connect LLMs to resources they can use. It may be easier to think of it as an API, but specifically designed for LLM interactions. MCP servers can:
* Expose data through `Resources` (think of these sort of like GET endpoints; they are used to load information into the LLM’s context)
* Provide functionality through `Tools` (sort of like POST endpoints; they are used to execute code or otherwise produce a side effect)
* Define interaction patterns through `Prompts` (reusable templates for LLM interactions)
* And more!
FastMCP provides a high-level, Pythonic interface for building, managing, and interacting with these servers.
##
[​
](#why-fastmcp)
Why FastMCP?
FastMCP handles all the complex protocol details so you can focus on building. In most cases, decorating a Python function is all you need — FastMCP handles the rest.
🚀 **Fast**: High-level interface means less code and faster development
🍀 **Simple**: Build MCP servers with minimal boilerplate
🐍 **Pythonic**: Feels natural to Python developers
🔍 **Complete**: Everything for production — enterprise auth (Google, GitHub, Azure, Auth0, WorkOS), deployment tools, testing frameworks, client libraries, and more
FastMCP provides the shortest path from idea to production. Deploy locally, to the cloud with [Prefect Horizon](https://horizon.prefect.io) (free for personal projects), or to your own infrastructure.
**This documentation reflects FastMCP’s `main` branch**, meaning it always reflects the latest development version. Features are generally marked with version badges (e.g. `New in version: 2.13.1`) to indicate when they were introduced. Note that this may include features that are not yet released.
##
[​
](#llm-friendly-docs)
LLM-Friendly Docs
The FastMCP documentation is available in multiple LLM-friendly formats:
###
[​
](#mcp-server)
MCP Server
The FastMCP docs are accessible via MCP! The server URL is `https://gofastmcp.com/mcp`.
In fact, you can use FastMCP to search the FastMCP docs:
```
`import asyncio
from fastmcp import Client
async def main():
async with Client("https://gofastmcp.com/mcp") as client:
result = await client.call\_tool(
name="SearchFastMcp",
arguments={"query": "deploy a FastMCP server"}
)
print(result)
asyncio.run(main())
`
```
###
[​
](#text-formats)
Text Formats
The docs are also available in [llms.txt format](https://llmstxt.org/):
* [llms.txt](https://gofastmcp.com/llms.txt) - A sitemap listing all documentation pages
* [llms-full.txt](https://gofastmcp.com/llms-full.txt) - The entire documentation in one file (may exceed context windows)
Any page can be accessed as markdown by appending `.md` to the URL. For example, this page becomes `https://gofastmcp.com/getting-started/welcome.md`.
You can also copy any page as markdown by pressing “Cmd+C” (or “Ctrl+C” on Windows) on your keyboard.