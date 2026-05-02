Welcome to FastMCP - FastMCP
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
**FastMCP is the standard framework for building MCP applications.** The [Model Context Protocol](https://modelcontextprotocol.io/) (MCP) connects LLMs to tools and data. FastMCP gives you everything you need to go from prototype to production — build servers that expose capabilities, connect clients to any MCP service, and give your tools interactive UIs:
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
](#move-fast-and-make-things)
Move Fast and Make Things
The [Model Context Protocol](https://modelcontextprotocol.io/) (MCP) lets you give agents access to your tools and data. But building an effective MCP application is harder than it looks.
FastMCP handles all of it. Declare a tool with a Python function, and the schema, validation, and documentation are generated automatically. Connect to a server with a URL, and transport negotiation, authentication, and protocol lifecycle are managed for you. You focus on your logic, and the MCP part just works: **with FastMCP, best practices are built in.**
**That’s why FastMCP is the standard framework for working with MCP.** FastMCP 1.0 was incorporated into the official MCP Python SDK in 2024. Today, the actively maintained standalone project is downloaded a million times a day, and some version of FastMCP powers 70% of MCP servers across all languages.
FastMCP has three pillars:
## Servers
Expose tools, resources, and prompts to LLMs.
## Apps
Give your tools interactive UIs rendered directly in the conversation.
## Clients
Connect to any MCP server — local or remote, programmatic or CLI.
**[Servers](/servers/server)** wrap your Python functions into MCP-compliant tools, resources, and prompts. **[Clients](/clients/client)** connect to any server with full protocol support. And **[Apps](/apps/overview)** give your tools interactive UIs rendered directly in the conversation.
Ready to build? Start with the [installation guide](/getting-started/installation) or jump straight to the [quickstart](/getting-started/quickstart).
FastMCP is made with 💙 by [Prefect](https://www.prefect.io/).
##
[​
](#run-fastmcp-in-production-with-horizon)
Run FastMCP in production with Horizon
FastMCP is the standard way to build MCP servers. **[Prefect Horizon](https://www.prefect.io/horizon?utm_source=gofastmcp&amp;utm_medium=docs&amp;utm_campaign=docs_welcome&amp;utm_content=welcome_body)** is the enterprise MCP gateway for running them safely.
Built by the FastMCP team, Horizon packages the best practices we’ve learned shipping the world’s most popular MCP framework.
Deploy FastMCP servers from GitHub with branch previews and instant rollback. Create a private registry of every MCP your company uses. Secure access with SSO and tool-level RBAC. Get audit logs, observability, and governance across your MCP stack. Remix approved tools into purpose-built endpoints for teams and agents.
Start with FastMCP. [Scale with Horizon →](https://www.prefect.io/horizon?utm_source=gofastmcp&amp;utm_medium=docs&amp;utm_campaign=docs_welcome&amp;utm_content=welcome_cta)
**This documentation reflects FastMCP’s `main` branch**, meaning it always reflects the latest development version. Features are generally marked with version badges (e.g. `New in version: 3.0.0`) to indicate when they were introduced. Note that this may include features that are not yet released.
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