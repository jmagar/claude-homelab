FastMCP CLI - FastMCP
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
FastMCP provides a command-line interface (CLI) that makes it easy to run, develop, and install your MCP servers. The CLI is automatically installed when you install FastMCP.
```
`fastmcp --help
`
```
##
[​
](#commands-overview)
Commands Overview
|Command|Purpose|Dependency Management|
|`run`|Run a FastMCP server directly|**Supports:** Local files, factory functions, URLs, fastmcp.json configs, MCP configs. **Deps:** Uses your local environment directly. With `--python`, `--with`, `--project`, or `--with-requirements`: Runs via `uv run` subprocess. With fastmcp.json: Automatically manages dependencies based on configuration|
|`dev`|Run a server with the MCP Inspector for testing|**Supports:** Local files and fastmcp.json configs. **Deps:** Always runs via `uv run` subprocess (never uses your local environment); dependencies must be specified or available in a uv-managed project. With fastmcp.json: Uses configured dependencies|
|`install`|Install a server in MCP client applications|**Supports:** Local files and fastmcp.json configs. **Deps:** Creates an isolated environment; dependencies must be explicitly specified with `--with` and/or `--with-editable`. With fastmcp.json: Uses configured dependencies|
|`inspect`|Generate a JSON report about a FastMCP server|**Supports:** Local files and fastmcp.json configs. **Deps:** Uses your current environment; you are responsible for ensuring all dependencies are available|
|`project prepare`|Create a persistent uv project from fastmcp.json environment config|**Supports:** fastmcp.json configs only. **Deps:** Creates a uv project directory with all dependencies pre-installed for reuse with `--project` flag|
|`version`|Display version information|N/A|
##
[​
](#fastmcp-run)
`fastmcp run`
Run a FastMCP server directly or proxy a remote server.
```
`fastmcp run server.py
`
```
By default, this command runs the server directly in your current Python environment. You are responsible for ensuring all dependencies are available. When using `--python`, `--with`, `--project`, or `--with-requirements` options, it runs the server via `uv run` subprocess instead.
###
[​
](#options)
Options
|Option|Flag|Description|
|Transport|`--transport`, `-t`|Transport protocol to use (`stdio`, `http`, or `sse`)|
|Host|`--host`|Host to bind to when using http transport (default: 127.0.0.1)|
|Port|`--port`, `-p`|Port to bind to when using http transport (default: 8000)|
|Path|`--path`|Path to bind to when using http transport (default: `/mcp/` or `/sse/` for SSE)|
|Log Level|`--log-level`, `-l`|Log level (DEBUG, INFO, WARNING, ERROR, CRITICAL)|
|No Banner|`--no-banner`|Disable the startup banner display|
|No Environment|`--skip-env`|Skip environment setup with uv (use when already in a uv environment)|
|Python Version|`--python`|Python version to use (e.g., 3.10, 3.11)|
|Additional Packages|`--with`|Additional packages to install (can be used multiple times)|
|Project Directory|`--project`|Run the command within the given project directory|
|Requirements File|`--with-requirements`|Requirements file to install dependencies from|
###
[​
](#entrypoints)
Entrypoints
New in version `2.3.5`
The `fastmcp run` command supports the following entrypoints:
1. **[Inferred server instance](#inferred-server-instance)**: `server.py` - imports the module and looks for a FastMCP server instance named `mcp`, `server`, or `app`. Errors if no such object is found.
2. **[Explicit server entrypoint](#explicit-server-entrypoint)**: `server.py:custom\_name` - imports and uses the specified server entrypoint
3. **[Factory function](#factory-function)**: `server.py:create\_server` - calls the specified function (sync or async) to create a server instance
4. **[Remote server proxy](#remote-server-proxy)**: `https://example.com/mcp-server` - connects to a remote server and creates a **local proxy server**
5. **[FastMCP configuration file](#fastmcp-configuration)**: `fastmcp.json` - runs servers using FastMCP’s declarative configuration format (auto-detects files in current directory)
6. **MCP configuration file**: `mcp.json` - runs servers defined in a standard MCP configuration file
Note: When using `fastmcp run` with a local file, it **completely ignores** the `if \_\_name\_\_ == "\_\_main\_\_"` block. This means:
* Any setup code in `\_\_main\_\_` will NOT run
* Server configuration in `\_\_main\_\_` is bypassed
* `fastmcp run` finds your server entrypoint/factory and runs it with its own transport settings
If you need setup code to run, use the **factory pattern** instead.
####
[​
](#inferred-server-instance)
Inferred Server Instance
If you provide a path to a file, `fastmcp run` will load the file and look for a FastMCP server instance stored as a variable named `mcp`, `server`, or `app`. If no such object is found, it will raise an error.
For example, if you have a file called `server.py` with the following content:
server.py
```
`from fastmcp import FastMCP
mcp = FastMCP("MyServer")
`
```
You can run it with:
```
`fastmcp run server.py
`
```
####
[​
](#explicit-server-entrypoint)
Explicit Server Entrypoint
If your server is stored as a variable with a custom name, or you want to be explicit about which server to run, you can use the following syntax to load a specific server entrypoint:
```
`fastmcp run server.py:custom\_name
`
```
For example, if you have a file called `server.py` with the following content:
```
`from fastmcp import FastMCP
my\_server = FastMCP("CustomServer")
@my\_server.tool
def hello() -\> str:
return "Hello from custom server!"
`
```
You can run it with:
```
`fastmcp run server.py:my\_server
`
```
####
[​
](#factory-function)
Factory Function
New in version `2.11.2`
Since `fastmcp run` ignores the `if \_\_name\_\_ == "\_\_main\_\_"` block, you can use a factory function to run setup code before your server starts. Factory functions are called without any arguments and must return a FastMCP server instance. Both sync and async factory functions are supported.
The syntax for using a factory function is the same as for an explicit server entrypoint: `fastmcp run server.py:factory\_fn`. FastMCP will automatically detect that you have identified a function rather than a server Instance
For example, if you have a file called `server.py` with the following content:
```
`from fastmcp import FastMCP
async def create\_server() -\> FastMCP:
mcp = FastMCP("MyServer")
@mcp.tool
def add(x: int, y: int) -\> int:
return x + y
# Setup that runs with fastmcp run
tool = await mcp.get\_tool("add")
tool.disable()
return mcp
`
```
You can run it with:
```
`fastmcp run server.py:create\_server
`
```
####
[​
](#remote-server-proxy)
Remote Server Proxy
FastMCP run can also start a local proxy server that connects to a remote server. This is useful when you want to run a remote server locally for testing or development purposes, or to use with a client that doesn’t support direct connections to remote servers.
To start a local proxy, you can use the following syntax:
```
`fastmcp run https://example.com/mcp
`
```
####
[​
](#fastmcp-configuration)
FastMCP Configuration
New in version `2.11.4`
FastMCP supports declarative configuration through `fastmcp.json` files. When you run `fastmcp run` without arguments, it automatically looks for a `fastmcp.json` file in the current directory:
```
`# Auto-detect fastmcp.json in current directory
fastmcp run
# Or explicitly specify a configuration file
fastmcp run my-config.fastmcp.json
`
```
The configuration file handles dependencies, environment variables, and transport settings. Command-line arguments override configuration file values:
```
`# Override port from config file
fastmcp run fastmcp.json --port 8080
# Skip environment setup when already in a uv environment
fastmcp run fastmcp.json --skip-env
`
```
The `--skip-env` flag is useful when:
* You’re already in an activated virtual environment
* You’re inside a Docker container with pre-installed dependencies
* You’re in a uv-managed environment (prevents infinite recursion)
* You want to test the server without environment setup
See [Server Configuration](/v2/deployment/server-configuration) for detailed documentation on fastmcp.json.
####
[​
](#mcp-configuration)
MCP Configuration
FastMCP can also run servers defined in a standard MCP configuration file. This is useful when you want to run multiple servers from a single file, or when you want to use a client that doesn’t support direct connections to remote servers.
To run a MCP configuration file, you can use the following syntax:
```
`fastmcp run mcp.json
`
```
This will run all the servers defined in the file.
##
[​
](#fastmcp-dev)
`fastmcp dev`
Run a MCP server with the [MCP Inspector](https://github.com/modelcontextprotocol/inspector) for testing.
```
`fastmcp dev server.py
`
```
This command always runs your server via `uv run` subprocess (never your local environment) to work with the MCP Inspector. Dependencies can be:
* Specified using `--with` and/or `--with-editable` options
* Defined in a `fastmcp.json` configuration file
* Available in a uv-managed project
When using `fastmcp.json`, the dev command automatically uses the configured dependencies.
The `dev` command is a shortcut for testing a server over STDIO only. When the Inspector launches, you may need to:
1. Select “STDIO” from the transport dropdown
2. Connect manually
This command does not support HTTP testing. To test a server over Streamable HTTP or SSE:
1. Start your server manually with the appropriate transport using either the command line:
```
`fastmcp run server.py --transport http
`
```
or by setting the transport in your code:
```
`python server.py # Assuming your \_\_main\_\_ block sets Streamable HTTP transport
`
```
2. Open the MCP Inspector separately and connect to your running server
###
[​
](#options-2)
Options
|Option|Flag|Description|
|Editable Package|`--with-editable`, `-e`|Directory containing pyproject.toml to install in editable mode|
|Additional Packages|`--with`|Additional packages to install (can be used multiple times)|
|Inspector Version|`--inspector-version`|Version of the MCP Inspector to use|
|UI Port|`--ui-port`|Port for the MCP Inspector UI|
|Server Port|`--server-port`|Port for the MCP Inspector Proxy server|
|Python Version|`--python`|Python version to use (e.g., 3.10, 3.11)|
|Project Directory|`--project`|Run the command within the given project directory|
|Requirements File|`--with-requirements`|Requirements file to install dependencies from|
###
[​
](#entrypoints-2)
Entrypoints
The `dev` command supports local FastMCP server files and configuration:
1. **Inferred server instance**: `server.py` - imports the module and looks for a FastMCP server instance named `mcp`, `server`, or `app`. Errors if no such object is found.
2. **Explicit server entrypoint**: `server.py:custom\_name` - imports and uses the specified server entrypoint
3. **Factory function**: `server.py:create\_server` - calls the specified function (sync or async) to create a server instance
4. **FastMCP configuration**: `fastmcp.json` - uses FastMCP’s declarative configuration (auto-detects in current directory)
The `dev` command **only supports local files and fastmcp.json** - no URLs, remote servers, or standard MCP configuration files.
**Examples**
```
`# Run dev server with editable mode and additional packages
fastmcp dev server.py -e . --with pandas --with matplotlib
# Run dev server with fastmcp.json configuration (auto-detects)
fastmcp dev
# Run dev server with explicit fastmcp.json file
fastmcp dev dev.fastmcp.json
# Run dev server with specific Python version
fastmcp dev server.py --python 3.11
# Run dev server with requirements file
fastmcp dev server.py --with-requirements requirements.txt
# Run dev server within a specific project directory
fastmcp dev server.py --project /path/to/project
`
```
##
[​
](#fastmcp-install)
`fastmcp install`
New in version `2.10.3`
Install a MCP server in MCP client applications. FastMCP currently supports the following clients:
* **Claude Code** - Installs via Claude Code’s built-in MCP management system
* **Claude Desktop** - Installs via direct configuration file modification
* **Cursor** - Installs via deeplink that opens Cursor for user confirmation
* **MCP JSON** - Generates standard MCP JSON configuration for manual use
```
`fastmcp install claude-code server.py
fastmcp install claude-desktop server.py
fastmcp install cursor server.py
fastmcp install mcp-json server.py
`
```
Note that for security reasons, MCP clients usually run every server in a completely isolated environment. Therefore, all dependencies must be explicitly specified using the `--with` and/or `--with-editable` options (following `uv` conventions) or by attaching them to your server in code via the `dependencies` parameter. You should not assume that the MCP server will have access to your local environment.
**`uv` must be installed and available in your system PATH**. Both Claude Desktop and Cursor run in isolated environments and need `uv` to manage dependencies. On macOS, install `uv` globally with Homebrew for Claude Desktop compatibility: `brew install uv`.
**Python Version Considerations**: The install commands now support the `--python` option to specify a Python version directly. You can also use `--project` to run within a specific project directory or `--with-requirements` to install dependencies from a requirements file.
**FastMCP `install` commands focus on local server files with STDIO transport.** For remote servers running with HTTP or SSE transport, use your client’s native configuration - FastMCP’s value is simplifying the complex local setup with dependencies and `uv` commands.
###
[​
](#options-3)
Options
|Option|Flag|Description|
|Server Name|`--server-name`, `-n`|Custom name for the server (defaults to server’s name attribute or file name)|
|Editable Package|`--with-editable`, `-e`|Directory containing pyproject.toml to install in editable mode|
|Additional Packages|`--with`|Additional packages to install (can be used multiple times)|
|Environment Variables|`--env`|Environment variables in KEY=VALUE format (can be used multiple times)|
|Environment File|`--env-file`, `-f`|Load environment variables from a .env file|
|Python Version|`--python`|Python version to use (e.g., 3.10, 3.11)|
|Project Directory|`--project`|Run the command within the given project directory|
|Requirements File|`--with-requirements`|Requirements file to install dependencies from|
###
[​
](#entrypoints-3)
Entrypoints
The `install` command supports local FastMCP server files and configuration:
1. **Inferred server instance**: `server.py` - imports the module and looks for a FastMCP server instance named `mcp`, `server`, or `app`. Errors if no such object is found.
2. **Explicit server entrypoint**: `server.py:custom\_name` - imports and uses the specified server entrypoint
3. **Factory function**: `server.py:create\_server` - calls the specified function (sync or async) to create a server instance
4. **FastMCP configuration**: `fastmcp.json` - uses FastMCP’s declarative configuration with dependencies and settings
Factory functions are particularly useful for install commands since they allow setup code to run that would otherwise be ignored when the MCP client runs your server. When using fastmcp.json, dependencies are automatically handled.
The `install` command **only supports local files and fastmcp.json** - no URLs, remote servers, or standard MCP configuration files. For remote servers, use your MCP client’s native configuration.
**Examples**
```
`# Auto-detects server entrypoint (looks for 'mcp', 'server', or 'app')
fastmcp install claude-desktop server.py
# Install with fastmcp.json configuration (auto-detects)
fastmcp install claude-desktop
# Install with explicit fastmcp.json file
fastmcp install claude-desktop my-config.fastmcp.json
# Uses specific server entrypoint
fastmcp install claude-desktop server.py:my\_server
# With custom name and dependencies
fastmcp install claude-desktop server.py:my\_server --server-name "My Analysis Server" --with pandas
# Install in Claude Code with environment variables
fastmcp install claude-code server.py --env API\_KEY=secret --env DEBUG=true
# Install in Cursor with environment variables
fastmcp install cursor server.py --env API\_KEY=secret --env DEBUG=true
# Install with environment file
fastmcp install cursor server.py --env-file .env
# Install with specific Python version
fastmcp install claude-desktop server.py --python 3.11
# Install with requirements file
fastmcp install claude-code server.py --with-requirements requirements.txt
# Install within a project directory
fastmcp install cursor server.py --project /path/to/project
# Generate MCP JSON configuration
fastmcp install mcp-json server.py --name "My Server" --with pandas
# Copy JSON configuration to clipboard
fastmcp install mcp-json server.py --copy
`
```
###
[​
](#mcp-json-generation)
MCP JSON Generation
The `mcp-json` subcommand generates standard MCP JSON configuration that can be used with any MCP-compatible client. This is useful when:
* Working with MCP clients not directly supported by FastMCP
* Creating configuration for CI/CD environments
* Sharing server configurations with others
* Integration with custom tooling
The generated JSON follows the standard MCP server configuration format used by Claude Desktop, VS Code, Cursor, and other MCP clients, with the server name as the root key:
```
`{
"server-name": {
"command": "uv",
"args": [
"run",
"--with",
"fastmcp",
"fastmcp",
"run",
"/path/to/server.py"
],
"env": {
"API\_KEY": "value"
}
}
}
`
```
To use this configuration with your MCP client, you’ll typically need to add it to the client’s `mcpServers` object. Consult your client’s documentation for any specific configuration requirements or formatting needs.
**Options specific to mcp-json:**
|Option|Flag|Description|
|Copy to Clipboard|`--copy`|Copy configuration to clipboard instead of printing to stdout|
##
[​
](#fastmcp-inspect)
`fastmcp inspect`
New in version `2.9.0`
Inspect a FastMCP server to view summary information or generate a detailed JSON report.
```
`# Show text summary
fastmcp inspect server.py
# Output FastMCP JSON to stdout
fastmcp inspect server.py --format fastmcp
# Save MCP JSON to file (format required with -o)
fastmcp inspect server.py --format mcp -o manifest.json
`
```
###
[​
](#options-4)
Options
|Option|Flag|Description|
|Format|`--format`, `-f`|Output format: `fastmcp` (FastMCP-specific) or `mcp` (MCP protocol). Required when using `-o`|
|Output File|`--output`, `-o`|Save JSON report to file instead of stdout. Requires `--format`|
###
[​
](#output-formats)
Output Formats
####
[​
](#fastmcp-format-format-fastmcp)
FastMCP Format (`--format fastmcp`)
The default and most comprehensive format, includes all FastMCP-specific metadata:
* Server name, instructions, and version
* FastMCP version and MCP version
* Tool tags and enabled status
* Output schemas for tools
* Annotations and custom metadata
* Uses snake\_case field names
* **Use this for**: Complete server introspection and debugging FastMCP servers
####
[​
](#mcp-protocol-format-format-mcp)
MCP Protocol Format (`--format mcp`)
Shows exactly what MCP clients will see via the protocol:
* Only includes standard MCP protocol fields
* Matches output from `client.list\_tools()`, `client.list\_prompts()`, etc.
* Uses camelCase field names (e.g., `inputSchema`)
* Excludes FastMCP-specific fields like tags and enabled status
* **Use this for**: Debugging client visibility and ensuring MCP compatibility
###
[​
](#entrypoints-4)
Entrypoints
The `inspect` command supports local FastMCP server files and configuration:
1. **Inferred server instance**: `server.py` - imports the module and looks for a FastMCP server instance named `mcp`, `server`, or `app`. Errors if no such object is found.
2. **Explicit server entrypoint**: `server.py:custom\_name` - imports and uses the specified server entrypoint
3. **Factory function**: `server.py:create\_server` - calls the specified function (sync or async) to create a server instance
4. **FastMCP configuration**: `fastmcp.json` - inspects servers defined with FastMCP’s declarative configuration
The `inspect` command **only supports local files and fastmcp.json** - no URLs, remote servers, or standard MCP configuration files.
###
[​
](#examples)
Examples
```
`# Show text summary (no JSON output)
fastmcp inspect server.py
# Output:
# Server: MyServer
# Instructions: A helpful MCP server
# Version: 1.0.0
#
# Components:
# Tools: 5
# Prompts: 2
# Resources: 3
# Templates: 1
#
# Environment:
# FastMCP: 2.0.0
# MCP: 1.0.0
#
# Use --format [fastmcp|mcp] for complete JSON output
# Output FastMCP format to stdout
fastmcp inspect server.py --format fastmcp
# Specify server entrypoint
fastmcp inspect server.py:my\_server
# Output MCP protocol format to stdout
fastmcp inspect server.py --format mcp
# Save to file (format required)
fastmcp inspect server.py --format fastmcp -o server-manifest.json
# Save MCP format with custom server object
fastmcp inspect server.py:my\_server --format mcp -o mcp-manifest.json
# Error: format required with output file
fastmcp inspect server.py -o output.json
# Error: --format is required when using -o/--output
`
```
##
[​
](#fastmcp-project-prepare)
`fastmcp project prepare`
Create a persistent uv project directory from a fastmcp.json file’s environment configuration. This allows you to pre-install all dependencies once and reuse them with the `--project` flag.
```
`fastmcp project prepare fastmcp.json --output-dir ./env
`
```
###
[​
](#options-5)
Options
|Option|Flag|Description|
|Output Directory|`--output-dir`|**Required.** Directory where the persistent uv project will be created|
###
[​
](#usage-pattern)
Usage Pattern
```
`# Step 1: Prepare the environment (installs dependencies)
fastmcp project prepare fastmcp.json --output-dir ./my-env
# Step 2: Run using the prepared environment (fast, no dependency installation)
fastmcp run fastmcp.json --project ./my-env
`
```
The prepare command creates a uv project with:
* A `pyproject.toml` containing all dependencies from the fastmcp.json
* A `.venv` with all packages pre-installed
* A `uv.lock` file for reproducible environments
This is useful when you want to separate environment setup from server execution, such as in deployment scenarios where dependencies are installed once and the server is run multiple times.
##
[​
](#fastmcp-version)
`fastmcp version`
Display version information about FastMCP and related components.
```
`fastmcp version
`
```
###
[​
](#options-6)
Options
|Option|Flag|Description|
|Copy to Clipboard|`--copy`|Copy version information to clipboard|