CLI - FastMCP
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
The `fastmcp` CLI is installed automatically with FastMCP. It’s the primary way to run, test, install, and interact with MCP servers from your terminal.
```
`fastmcp --help
`
```
##
[​
](#commands-at-a-glance)
Commands at a Glance
|Command|What it does|
|[`run`](/cli/running)|Run a server (local file, factory function, remote URL, or config file)|
|[`dev apps`](/cli/running#previewing-apps)|Launch a browser-based preview UI for Prefab App tools|
|[`dev inspector`](/cli/running#development-with-the-inspector)|Launch a server inside the MCP Inspector for interactive testing|
|[`install`](/cli/install-mcp)|Install a server into Claude Code, Claude Desktop, Cursor, Gemini CLI, or Goose|
|[`inspect`](/cli/inspecting)|Print a server’s tools, resources, and prompts as a summary or JSON report|
|[`list`](/cli/client)|List a server’s tools (and optionally resources and prompts)|
|[`call`](/cli/client#calling-tools)|Call a single tool with arguments|
|[`discover`](/cli/client#discovering-configured-servers)|Find MCP servers configured in your editors and tools|
|[`generate-cli`](/cli/generate-cli)|Scaffold a standalone typed CLI from a server’s tool schemas|
|[`project prepare`](/cli/running#pre-building-environments)|Pre-install dependencies into a reusable uv project|
|[`auth cimd`](/cli/auth)|Create and validate CIMD documents for OAuth|
|`version`|Print version info (`--copy` to copy to clipboard)|
##
[​
](#server-targets)
Server Targets
Most commands need to know *which server* to talk to. You pass a “server spec” as the first argument, and FastMCP resolves the right transport automatically.
**URLs** connect to a running HTTP server:
```
`fastmcp list http://localhost:8000/mcp
fastmcp call http://localhost:8000/mcp get\_forecast city=London
`
```
**Python files** are loaded directly — no `mcp.run()` boilerplate needed. FastMCP finds a server instance named `mcp`, `server`, or `app` in the file, or you can specify one explicitly:
```
`fastmcp list server.py
fastmcp run server.py:my\_custom\_server
`
```
**Config files** work too — both FastMCP’s own `fastmcp.json` format and standard MCP config files with an `mcpServers` key:
```
`fastmcp run fastmcp.json
fastmcp list mcp-config.json
`
```
**Stdio commands** connect to any MCP server that speaks over standard I/O. Use `--command` instead of a positional argument:
```
`fastmcp list --command 'npx -y @modelcontextprotocol/server-github'
`
```
###
[​
](#name-based-resolution)
Name-Based Resolution
If your servers are already configured in an editor or tool, you can refer to them by name. FastMCP scans configs from Claude Desktop, Claude Code, Cursor, Gemini CLI, and Goose:
```
`fastmcp list weather
fastmcp call weather get\_forecast city=London
`
```
When the same name appears in multiple configs, use the `source:name` form to be specific:
```
`fastmcp list claude-code:my-server
fastmcp call cursor:weather get\_forecast city=London
`
```
Run [`fastmcp discover`](/cli/client#discovering-configured-servers) to see what’s available on your machine.
##
[​
](#authentication)
Authentication
When targeting an HTTP URL, the CLI enables OAuth authentication by default. If the server requires it, you’ll be guided through the flow (typically opening a browser). If it doesn’t, the setup is a silent no-op.
To skip authentication entirely — useful for local development servers — pass `--auth none`:
```
`fastmcp call http://localhost:8000/mcp my\_tool --auth none
`
```
You can also pass a bearer token directly:
```
`fastmcp list http://localhost:8000/mcp --auth "Bearer sk-..."
`
```
##
[​
](#transport-override)
Transport Override
FastMCP defaults to Streamable HTTP for URL targets. If the server only supports Server-Sent Events (SSE), force the older transport:
```
`fastmcp list http://localhost:8000 --transport sse
`
```