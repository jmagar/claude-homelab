Filesystem Provider - FastMCP
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
* [
Overview
NEW
](/servers/providers/overview)
* [
Local
NEW
](/servers/providers/local)
* [
Filesystem
NEW
](/servers/providers/filesystem)
* [
MCP Proxy
](/servers/providers/proxy)
* [
Skills
NEW
](/servers/providers/skills)
* [
Custom
NEW
](/servers/providers/custom)
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
New in version `3.0.0`
`FileSystemProvider` scans a directory for Python files and automatically registers functions decorated with `@tool`, `@resource`, or `@prompt`. This enables a file-based organization pattern similar to Next.js routing, where your project structure becomes your component registry.
##
[​
](#why-filesystem-discovery)
Why Filesystem Discovery
Traditional FastMCP servers require coordination between files. Either your tool files import the server to call `@server.tool()`, or your server file imports all the tool modules. Both approaches create coupling that some developers prefer to avoid.
`FileSystemProvider` eliminates this coordination. Each file is self-contained—it uses standalone decorators (`@tool`, `@resource`, `@prompt`) that don’t require access to a server instance. The provider discovers these files at startup, so you can add new tools without modifying your server file.
This is a convention some teams prefer, not necessarily better for all projects. The tradeoffs:
* **No coordination**: Files don’t import the server; server doesn’t import files
* **Predictable naming**: Function names become component names (unless overridden)
* **Development mode**: Optionally re-scan files on every request for rapid iteration
##
[​
](#quick-start)
Quick Start
Create a provider pointing to your components directory, then pass it to your server. Use `Path(\_\_file\_\_).parent` to make the path relative to your server file.
```
`from pathlib import Path
from fastmcp import FastMCP
from fastmcp.server.providers import FileSystemProvider
mcp = FastMCP("MyServer", providers=[FileSystemProvider(Path(\_\_file\_\_).parent / "mcp")])
`
```
In your `mcp/` directory, create Python files with decorated functions.
```
`# mcp/tools/greet.py
from fastmcp.tools import tool
@tool
def greet(name: str) -\> str:
"""Greet someone by name."""
return f"Hello, {name}!"
`
```
When the server starts, `FileSystemProvider` scans the directory, imports all Python files, and registers any decorated functions it finds.
##
[​
](#decorators)
Decorators
FastMCP provides standalone decorators that mark functions for discovery: `@tool` from `fastmcp.tools`, `@resource` from `fastmcp.resources`, and `@prompt` from `fastmcp.prompts`. These support the full syntax of server-bound decorators—all the same parameters work identically.
###
[​
](#@tool)
@tool
Mark a function as a tool. The function name becomes the tool name by default.
```
`from fastmcp.tools import tool
@tool
def calculate\_sum(a: float, b: float) -\> float:
"""Add two numbers together."""
return a + b
`
```
Customize the tool with optional parameters.
```
`from fastmcp.tools import tool
@tool(
name="add-numbers",
description="Add two numbers together.",
tags={"math", "arithmetic"},
)
def add(a: float, b: float) -\> float:
return a + b
`
```
The decorator supports all standard tool options: `name`, `title`, `description`, `icons`, `tags`, `output\_schema`, `annotations`, and `meta`.
###
[​
](#@resource)
@resource
Mark a function as a resource. Unlike `@tool`, the `@resource` decorator requires a URI argument.
```
`from fastmcp.resources import resource
@resource("config://app")
def get\_app\_config() -\> str:
"""Get application configuration."""
return '{"version": "1.0"}'
`
```
URIs with template parameters create resource templates. The provider automatically detects whether to register a static resource or a template based on whether the URI contains `{parameters}` or the function has arguments.
```
`from fastmcp.resources import resource
@resource("users://{user\_id}/profile")
def get\_user\_profile(user\_id: str) -\> str:
"""Get a user's profile by ID."""
return f'{{"id": "{user\_id}", "name": "User"}}'
`
```
The decorator supports: `uri` (required), `name`, `title`, `description`, `icons`, `mime\_type`, `tags`, `annotations`, and `meta`.
###
[​
](#@prompt)
@prompt
Mark a function as a prompt template.
```
`from fastmcp.prompts import prompt
@prompt
def code\_review(code: str, language: str = "python") -\> str:
"""Generate a code review prompt."""
return f"Please review this {language} code:\\n\\n```{language}\\n{code}\\n```"
`
```
```
`from fastmcp.prompts import prompt
@prompt(name="explain-concept", tags={"education"})
def explain(topic: str) -\> str:
"""Generate an explanation prompt."""
return f"Explain {topic} using clear examples and analogies."
`
```
The decorator supports: `name`, `title`, `description`, `icons`, `tags`, and `meta`.
##
[​
](#directory-structure)
Directory Structure
The directory structure is purely organizational. The provider recursively scans all `.py` files regardless of which subdirectory they’re in. Subdirectories like `tools/`, `resources/`, and `prompts/` are optional conventions that help you organize code.
```
`mcp/
├── tools/
│ ├── greeting.py # @tool functions
│ └── calculator.py # @tool functions
├── resources/
│ └── config.py # @resource functions
└── prompts/
└── assistant.py # @prompt functions
`
```
You can also put all components in a single file or organize by feature rather than type.
```
`mcp/
├── user\_management.py # @tool, @resource, @prompt for users
├── billing.py # @tool, @resource for billing
└── analytics.py # @tool for analytics
`
```
##
[​
](#discovery-rules)
Discovery Rules
The provider follows these rules when scanning:
|Rule|Behavior|
|File extensions|Only `.py` files are scanned|
|`\_\_init\_\_.py`|Skipped (used for package structure, not components)|
|`\_\_pycache\_\_`|Skipped|
|Private functions|Functions starting with `\_` are ignored, even if decorated|
|No decorators|Files without `@tool`, `@resource`, or `@prompt` are silently skipped|
|Multiple components|A single file can contain any number of decorated functions|
###
[​
](#package-imports)
Package Imports
If your directory contains an `\_\_init\_\_.py` file, the provider imports files as proper Python package members. This means relative imports work correctly within your components directory.
```
`# mcp/\_\_init\_\_.py exists
# mcp/tools/greeting.py
from ..helpers import format\_name # Relative imports work
@tool
def greet(name: str) -\> str:
return f"Hello, {format\_name(name)}!"
`
```
Without `\_\_init\_\_.py`, files are imported directly using `importlib.util.spec\_from\_file\_location`.
##
[​
](#reload-mode)
Reload Mode
During development, you may want changes to component files to take effect without restarting the server. Enable reload mode to re-scan the directory on every request.
```
`from pathlib import Path
from fastmcp.server.providers import FileSystemProvider
provider = FileSystemProvider(Path(\_\_file\_\_).parent / "mcp", reload=True)
`
```
With `reload=True`, the provider:
1. Re-discovers all Python files on each request
2. Re-imports modules that have changed
3. Updates the component registry with any new, modified, or removed components
Reload mode adds overhead to every request. Use it only during development, not in production.
##
[​
](#error-handling)
Error Handling
When a file fails to import (syntax error, missing dependency, etc.), the provider logs a warning and continues scanning other files. Failed imports don’t prevent the server from starting.
```
`WARNING - Failed to import /path/to/broken.py: No module named 'missing\_dep'
`
```
The provider tracks which files have failed and only re-logs warnings when the file’s modification time changes. This prevents log spam when a broken file is repeatedly scanned in reload mode.
##
[​
](#example-project)
Example Project
A complete example is available in the repository at `examples/filesystem-provider/`. The structure demonstrates the recommended organization.
```
`examples/filesystem-provider/
├── server.py # Server entry point
└── mcp/
├── tools/
│ ├── greeting.py # greet, farewell tools
│ └── calculator.py # add, multiply tools
├── resources/
│ └── config.py # Static and templated resources
└── prompts/
└── assistant.py # code\_review, explain prompts
`
```
The server entry point is minimal.
```
`from pathlib import Path
from fastmcp import FastMCP
from fastmcp.server.providers import FileSystemProvider
provider = FileSystemProvider(
root=Path(\_\_file\_\_).parent / "mcp",
reload=True,
)
mcp = FastMCP("FilesystemDemo", providers=[provider])
`
```
Run with `fastmcp run examples/filesystem-provider/server.py` or inspect with `fastmcp inspect examples/filesystem-provider/server.py`.