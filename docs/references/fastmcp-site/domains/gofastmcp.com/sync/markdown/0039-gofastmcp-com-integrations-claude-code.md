Claude Code 🤝 FastMCP - FastMCP
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
* [
ChatGPT
](/integrations/chatgpt)
* [
Claude Code
](/integrations/claude-code)
* [
Claude Desktop
](/integrations/claude-desktop)
* [
Cursor
](/integrations/cursor)
* [
Gemini CLI
](/integrations/gemini-cli)
* [
Goose
](/integrations/goose)
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
**This integration focuses on running local FastMCP server files with STDIO transport.** For remote servers running with HTTP or SSE transport, use your client's native configuration - FastMCP's integrations focus on simplifying the complex local setup with dependencies and `uv` commands.
[Claude Code](https://docs.anthropic.com/en/docs/claude-code) supports MCP servers through multiple transport methods including STDIO, SSE, and HTTP, allowing you to extend Claude’s capabilities with custom tools, resources, and prompts from your FastMCP servers.
##
[​
](#requirements)
Requirements
This integration uses STDIO transport to run your FastMCP server locally. For remote deployments, you can run your FastMCP server with HTTP or SSE transport and configure it directly using Claude Code’s built-in MCP management commands.
##
[​
](#create-a-server)
Create a Server
The examples in this guide will use the following simple dice-rolling server, saved as `server.py`.
server.py
```
`import random
from fastmcp import FastMCP
mcp = FastMCP(name="Dice Roller")
@mcp.tool
def roll\_dice(n\_dice: int) -\> list[int]:
"""Roll `n\_dice` 6-sided dice and return the results."""
return [random.randint(1, 6) for \_ in range(n\_dice)]
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
##
[​
](#install-the-server)
Install the Server
###
[​
](#fastmcp-cli)
FastMCP CLI
New in version `2.10.3`
The easiest way to install a FastMCP server in Claude Code is using the `fastmcp install claude-code` command. This automatically handles the configuration, dependency management, and calls Claude Code’s built-in MCP management system.
```
`fastmcp install claude-code server.py
`
```
The install command supports the same `file.py:object` notation as the `run` command. If no object is specified, it will automatically look for a FastMCP server object named `mcp`, `server`, or `app` in your file:
```
`# These are equivalent if your server object is named 'mcp'
fastmcp install claude-code server.py
fastmcp install claude-code server.py:mcp
# Use explicit object name if your server has a different name
fastmcp install claude-code server.py:my\_custom\_server
`
```
The command will automatically configure the server with Claude Code’s `claude mcp add` command.
####
[​
](#dependencies)
Dependencies
FastMCP provides flexible dependency management options for your Claude Code servers:
**Individual packages**: Use the `--with` flag to specify packages your server needs. You can use this flag multiple times:
```
`fastmcp install claude-code server.py --with pandas --with requests
`
```
**Requirements file**: If you maintain a `requirements.txt` file with all your dependencies, use `--with-requirements` to install them:
```
`fastmcp install claude-code server.py --with-requirements requirements.txt
`
```
**Editable packages**: For local packages under development, use `--with-editable` to install them in editable mode:
```
`fastmcp install claude-code server.py --with-editable ./my-local-package
`
```
Alternatively, you can use a `fastmcp.json` configuration file (recommended):
fastmcp.json
```
`{
"$schema": "https://gofastmcp.com/public/schemas/fastmcp.json/v1.json",
"source": {
"path": "server.py",
"entrypoint": "mcp"
},
"environment": {
"dependencies": ["pandas", "requests"]
}
}
`
```
####
[​
](#python-version-and-project-configuration)
Python Version and Project Configuration
Control the Python environment for your server with these options:
**Python version**: Use `--python` to specify which Python version your server requires. This ensures compatibility when your server needs specific Python features:
```
`fastmcp install claude-code server.py --python 3.11
`
```
**Project directory**: Use `--project` to run your server within a specific project context. This tells `uv` to use the project’s configuration files and virtual environment:
```
`fastmcp install claude-code server.py --project /path/to/my-project
`
```
####
[​
](#environment-variables)
Environment Variables
If your server needs environment variables (like API keys), you must include them:
```
`fastmcp install claude-code server.py --server-name "Weather Server" \\
--env API\_KEY=your-api-key \\
--env DEBUG=true
`
```
Or load them from a `.env` file:
```
`fastmcp install claude-code server.py --server-name "Weather Server" --env-file .env
`
```
**Claude Code must be installed**. The integration looks for the Claude Code CLI at the default installation location (`\~/.claude/local/claude`) and uses the `claude mcp add` command to register servers.
###
[​
](#manual-configuration)
Manual Configuration
For more control over the configuration, you can manually use Claude Code’s built-in MCP management commands. This gives you direct control over how your server is launched:
```
`# Add a server with custom configuration
claude mcp add dice-roller -- uv run --with fastmcp fastmcp run server.py
# Add with environment variables
claude mcp add weather-server -e API\_KEY=secret -e DEBUG=true -- uv run --with fastmcp fastmcp run server.py
# Add with specific scope (local, user, or project)
claude mcp add my-server --scope user -- uv run --with fastmcp fastmcp run server.py
`
```
You can also manually specify Python versions and project directories in your Claude Code commands:
```
`# With specific Python version
claude mcp add ml-server -- uv run --python 3.11 --with fastmcp fastmcp run server.py
# Within a project directory
claude mcp add project-server -- uv run --project /path/to/project --with fastmcp fastmcp run server.py
`
```
##
[​
](#using-the-server)
Using the Server
Once your server is installed, you can start using your FastMCP server with Claude Code.
Try asking Claude something like:
>
> “Roll some dice for me”
>
Claude will automatically detect your `roll\_dice` tool and use it to fulfill your request, returning something like:
>
> I’ll roll some dice for you! Here are your results: [4, 2, 6]
>
> You rolled three dice and got a 4, a 2, and a 6!
>
Claude Code can now access all the tools, resources, and prompts you’ve defined in your FastMCP server.
If your server provides resources, you can reference them with `@` mentions using the format `@server:protocol://resource/path`. If your server provides prompts, you can use them as slash commands with `/mcp\_\_servername\_\_promptname`.