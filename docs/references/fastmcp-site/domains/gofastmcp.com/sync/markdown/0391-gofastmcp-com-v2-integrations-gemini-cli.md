Gemini CLI 🤝 FastMCP - FastMCP
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
* [
ChatGPT
NEW
](/v2/integrations/chatgpt)
* [
Claude Code
](/v2/integrations/claude-code)
* [
Claude Desktop
](/v2/integrations/claude-desktop)
* [
Cursor
](/v2/integrations/cursor)
* [
Gemini CLI
NEW
](/v2/integrations/gemini-cli)
* [
MCP.json
](/v2/integrations/mcp-json-configuration)
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
**This integration focuses on running local FastMCP server files with STDIO transport.** For remote servers running with HTTP or SSE transport, use your client's native configuration - FastMCP's integrations focus on simplifying the complex local setup with dependencies and `uv` commands.
Gemini CLI supports MCP servers through multiple transport methods including STDIO, SSE, and HTTP, allowing you to extend Gemini’s capabilities with custom tools, resources, and prompts from your FastMCP servers.
##
[​
](#requirements)
Requirements
This integration uses STDIO transport to run your FastMCP server locally. For remote deployments, you can run your FastMCP server with HTTP or SSE transport and configure it directly using Gemini CLI’s built-in MCP management commands.
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
New in version `2.13.0`
The easiest way to install a FastMCP server in Gemini CLI is using the `fastmcp install gemini-cli` command. This automatically handles the configuration, dependency management, and calls Gemini CLI’s built-in MCP management system.
```
`fastmcp install gemini-cli server.py
`
```
The install command supports the same `file.py:object` notation as the `run` command. If no object is specified, it will automatically look for a FastMCP server object named `mcp`, `server`, or `app` in your file:
```
`# These are equivalent if your server object is named 'mcp'
fastmcp install gemini-cli server.py
fastmcp install gemini-cli server.py:mcp
# Use explicit object name if your server has a different name
fastmcp install gemini-cli server.py:my\_custom\_server
`
```
The command will automatically configure the server with Gemini CLI’s `gemini mcp add` command.
####
[​
](#dependencies)
Dependencies
FastMCP provides flexible dependency management options for your Gemini CLI servers:
**Individual packages**: Use the `--with` flag to specify packages your server needs. You can use this flag multiple times:
```
`fastmcp install gemini-cli server.py --with pandas --with requests
`
```
**Requirements file**: If you maintain a `requirements.txt` file with all your dependencies, use `--with-requirements` to install them:
```
`fastmcp install gemini-cli server.py --with-requirements requirements.txt
`
```
**Editable packages**: For local packages under development, use `--with-editable` to install them in editable mode:
```
`fastmcp install gemini-cli server.py --with-editable ./my-local-package
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
`fastmcp install gemini-cli server.py --python 3.11
`
```
**Project directory**: Use `--project` to run your server within a specific project context. This tells `uv` to use the project’s configuration files and virtual environment:
```
`fastmcp install gemini-cli server.py --project /path/to/my-project
`
```
####
[​
](#environment-variables)
Environment Variables
If your server needs environment variables (like API keys), you must include them:
```
`fastmcp install gemini-cli server.py --server-name "Weather Server" \\
--env API\_KEY=your-api-key \\
--env DEBUG=true
`
```
Or load them from a `.env` file:
```
`fastmcp install gemini-cli server.py --server-name "Weather Server" --env-file .env
`
```
**Gemini CLI must be installed**. The integration looks for the Gemini CLI and uses the `gemini mcp add` command to register servers.
###
[​
](#manual-configuration)
Manual Configuration
For more control over the configuration, you can manually use Gemini CLI’s built-in MCP management commands. This gives you direct control over how your server is launched:
```
`# Add a server with custom configuration
gemini mcp add dice-roller uv -- run --with fastmcp fastmcp run server.py
# Add with environment variables
gemini mcp add weather-server -e API\_KEY=secret -e DEBUG=true uv -- run --with fastmcp fastmcp run server.py
# Add with specific scope (user, or project)
gemini mcp add my-server --scope user uv -- run --with fastmcp fastmcp run server.py
`
```
You can also manually specify Python versions and project directories in your Gemini CLI commands:
```
`# With specific Python version
gemini mcp add ml-server uv -- run --python 3.11 --with fastmcp fastmcp run server.py
# Within a project directory
gemini mcp add project-server uv -- run --project /path/to/project --with fastmcp fastmcp run server.py
`
```
##
[​
](#using-the-server)
Using the Server
Once your server is installed, you can start using your FastMCP server with Gemini CLI.
Try asking Gemini something like:
>
> “Roll some dice for me”
>
Gemini will automatically detect your `roll\_dice` tool and use it to fulfill your request.
Gemini CLI can now access all the tools and prompts you’ve defined in your FastMCP server.
If your server provides prompts, you can use them as slash commands with `/prompt\_name`.