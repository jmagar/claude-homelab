MCP JSON Configuration 🤝 FastMCP - FastMCP
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
New in version `2.10.3`
FastMCP can generate standard MCP JSON configuration files that work with any MCP-compatible client including Claude Desktop, VS Code, Cursor, and other applications that support the Model Context Protocol.
##
[​
](#mcp-json-configuration-standard)
MCP JSON Configuration Standard
The MCP JSON configuration format is an **emergent standard** that has developed across the MCP ecosystem. This format defines how MCP clients should configure and launch MCP servers, providing a consistent way to specify server commands, arguments, and environment variables.
###
[​
](#configuration-structure)
Configuration Structure
The standard uses a `mcpServers` object where each key represents a server name and the value contains the server’s configuration:
```
`{
"mcpServers": {
"server-name": {
"command": "executable",
"args": ["arg1", "arg2"],
"env": {
"VAR": "value"
}
}
}
}
`
```
###
[​
](#server-configuration-fields)
Server Configuration Fields
####
[​
](#command-required)
`command` (required)
The executable command to run the MCP server. This should be an absolute path or a command available in the system PATH.
```
`{
"command": "python"
}
`
```
####
[​
](#args-optional)
`args` (optional)
An array of command-line arguments passed to the server executable. Arguments are passed in order.
```
`{
"args": ["server.py", "--verbose", "--port", "8080"]
}
`
```
####
[​
](#env-optional)
`env` (optional)
An object containing environment variables to set when launching the server. All values must be strings.
```
`{
"env": {
"API\_KEY": "secret-key",
"DEBUG": "true",
"PORT": "8080"
}
}
`
```
###
[​
](#client-adoption)
Client Adoption
This format is widely adopted across the MCP ecosystem:
* **Claude Desktop**: Uses `\~/.claude/claude\_desktop\_config.json`
* **Cursor**: Uses `\~/.cursor/mcp.json`
* **VS Code**: Uses workspace `.vscode/mcp.json`
* **Other clients**: Many MCP-compatible applications follow this standard
##
[​
](#overview)
Overview
**For the best experience, use FastMCP’s first-class integrations:** [`fastmcp install claude-code`](/integrations/claude-code), [`fastmcp install claude-desktop`](/integrations/claude-desktop), or [`fastmcp install cursor`](/integrations/cursor). Use MCP JSON generation for advanced use cases and unsupported clients.
The `fastmcp install mcp-json` command generates configuration in the standard `mcpServers` format used across the MCP ecosystem. This is useful when:
* **Working with unsupported clients** - Any MCP client not directly integrated with FastMCP
* **CI/CD environments** - Automated configuration generation for deployments
* **Configuration sharing** - Easy distribution of server setups to team members
* **Custom tooling** - Integration with your own MCP management tools
* **Manual setup** - When you prefer to manually configure your MCP client
##
[​
](#basic-usage)
Basic Usage
Generate configuration and output to stdout (useful for piping):
```
`fastmcp install mcp-json server.py
`
```
This outputs the server configuration JSON with the server name as the root key:
```
`{
"My Server": {
"command": "uv",
"args": [
"run",
"--with",
"fastmcp",
"fastmcp",
"run",
"/absolute/path/to/server.py"
]
}
}
`
```
To use this in a client configuration file, add it to the `mcpServers` object in your client’s configuration:
```
`{
"mcpServers": {
"My Server": {
"command": "uv",
"args": [
"run",
"--with",
"fastmcp",
"fastmcp",
"run",
"/absolute/path/to/server.py"
]
}
}
}
`
```
When using `--python`, `--project`, or `--with-requirements`, the generated configuration will include these options in the `uv run` command, ensuring your server runs with the correct Python version and dependencies.
Different MCP clients may have specific configuration requirements or formatting needs. Always consult your client’s documentation to ensure proper integration.
##
[​
](#configuration-options)
Configuration Options
###
[​
](#server-naming)
Server Naming
```
`# Use server's built-in name (from FastMCP constructor)
fastmcp install mcp-json server.py
# Override with custom name
fastmcp install mcp-json server.py --name "Custom Server Name"
`
```
###
[​
](#dependencies)
Dependencies
Add Python packages your server needs:
```
`# Single package
fastmcp install mcp-json server.py --with pandas
# Multiple packages
fastmcp install mcp-json server.py --with pandas --with requests --with httpx
# Editable local package
fastmcp install mcp-json server.py --with-editable ./my-package
# From requirements file
fastmcp install mcp-json server.py --with-requirements requirements.txt
`
```
You can also use a `fastmcp.json` configuration file (recommended):
fastmcp.json
```
`{
"$schema": "https://gofastmcp.com/public/schemas/fastmcp.json/v1.json",
"source": {
"path": "server.py",
"entrypoint": "mcp"
},
"environment": {
"dependencies": ["pandas", "matplotlib", "seaborn"]
}
}
`
```
Then simply install with:
```
`fastmcp install mcp-json fastmcp.json
`
```
###
[​
](#environment-variables)
Environment Variables
```
`# Individual environment variables
fastmcp install mcp-json server.py \\
--env API\_KEY=your-secret-key \\
--env DEBUG=true
# Load from .env file
fastmcp install mcp-json server.py --env-file .env
`
```
###
[​
](#python-version-and-project-directory)
Python Version and Project Directory
Specify Python version or run within a specific project:
```
`# Use specific Python version
fastmcp install mcp-json server.py --python 3.11
# Run within a project directory
fastmcp install mcp-json server.py --project /path/to/project
`
```
###
[​
](#server-object-selection)
Server Object Selection
Use the same `file.py:object` notation as other FastMCP commands:
```
`# Auto-detects server object (looks for 'mcp', 'server', or 'app')
fastmcp install mcp-json server.py
# Explicit server object
fastmcp install mcp-json server.py:my\_custom\_server
`
```
##
[​
](#clipboard-integration)
Clipboard Integration
Copy configuration directly to your clipboard for easy pasting:
```
`fastmcp install mcp-json server.py --copy
`
```
The `--copy` flag requires the `pyperclip` Python package. If not installed, you’ll see an error message with installation instructions.
##
[​
](#usage-examples)
Usage Examples
###
[​
](#basic-server)
Basic Server
```
`fastmcp install mcp-json dice\_server.py
`
```
Output:
```
`{
"Dice Server": {
"command": "uv",
"args": [
"run",
"--with",
"fastmcp",
"fastmcp",
"run",
"/home/user/dice\_server.py"
]
}
}
`
```
###
[​
](#production-server-with-dependencies)
Production Server with Dependencies
```
`fastmcp install mcp-json api\_server.py \\
--name "Production API Server" \\
--with requests \\
--with python-dotenv \\
--env API\_BASE\_URL=https://api.example.com \\
--env TIMEOUT=30
`
```
###
[​
](#advanced-configuration)
Advanced Configuration
```
`fastmcp install mcp-json ml\_server.py \\
--name "ML Analysis Server" \\
--python 3.11 \\
--with-requirements requirements.txt \\
--project /home/user/ml-project \\
--env GPU\_DEVICE=0
`
```
Output:
```
`{
"Production API Server": {
"command": "uv",
"args": [
"run",
"--with",
"fastmcp",
"--with",
"python-dotenv",
"--with",
"requests",
"fastmcp",
"run",
"/home/user/api\_server.py"
],
"env": {
"API\_BASE\_URL": "https://api.example.com",
"TIMEOUT": "30"
}
}
}
`
```
The advanced configuration example generates:
```
`{
"ML Analysis Server": {
"command": "uv",
"args": [
"run",
"--python",
"3.11",
"--project",
"/home/user/ml-project",
"--with",
"fastmcp",
"--with-requirements",
"requirements.txt",
"fastmcp",
"run",
"/home/user/ml\_server.py"
],
"env": {
"GPU\_DEVICE": "0"
}
}
}
`
```
###
[​
](#pipeline-usage)
Pipeline Usage
Save configuration to file:
```
`fastmcp install mcp-json server.py \> mcp-config.json
`
```
Use in shell scripts:
```
`#!/bin/bash
CONFIG=$(fastmcp install mcp-json server.py --name "CI Server")
echo "$CONFIG" | jq '."CI Server".command'
# Output: "uv"
`
```
##
[​
](#integration-with-mcp-clients)
Integration with MCP Clients
The generated configuration works with any MCP-compatible application:
###
[​
](#claude-desktop)
Claude Desktop
**Prefer [`fastmcp install claude-desktop`](/integrations/claude-desktop)** for automatic installation. Use MCP JSON for advanced configuration needs.
Copy the `mcpServers` object into `\~/.claude/claude\_desktop\_config.json`
###
[​
](#cursor)
Cursor
**Prefer [`fastmcp install cursor`](/integrations/cursor)** for automatic installation. Use MCP JSON for advanced configuration needs.
Add to `\~/.cursor/mcp.json`
###
[​
](#vs-code)
VS Code
Add to your workspace’s `.vscode/mcp.json` file
###
[​
](#custom-applications)
Custom Applications
Use the JSON configuration with any application that supports the MCP protocol
##
[​
](#configuration-format)
Configuration Format
The generated configuration outputs a server object with the server name as the root key:
```
`{
"\<server-name\>": {
"command": "\<executable\>",
"args": ["\<arg1\>", "\<arg2\>", "..."],
"env": {
"\<ENV\_VAR\>": "\<value\>"
}
}
}
`
```
To use this in an MCP client, add it to the client’s `mcpServers` configuration object.
**Fields:**
* `command`: The executable to run (always `uv` for FastMCP servers)
* `args`: Command-line arguments including dependencies and server path
* `env`: Environment variables (only included if specified)
**All file paths in the generated configuration are absolute paths**. This ensures the configuration works regardless of the working directory when the MCP client starts the server.
##
[​
](#requirements)
Requirements
* **uv**: Must be installed and available in your system PATH
* **pyperclip** (optional): Required only for `--copy` functionality
Install uv if not already available:
```
`# macOS
brew install uv
# Linux/Windows
curl -LsSf https://astral.sh/uv/install.sh | sh
`
```