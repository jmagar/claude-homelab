Icons - FastMCP
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
* [
Composition
](/v2/servers/composition)
* [
Context
](/v2/servers/context)
* [
Elicitation
NEW
](/v2/servers/elicitation)
* [
Icons
NEW
](/v2/servers/icons)
* [
Logging
](/v2/servers/logging)
* [
Middleware
NEW
](/v2/servers/middleware)
* [
Progress
](/v2/servers/progress)
* [
Proxy Servers
](/v2/servers/proxy)
* [
Sampling
NEW
](/v2/servers/sampling)
* [
Storage Backends
NEW
](/v2/servers/storage-backends)
* [
Background Tasks
NEW
](/v2/servers/tasks)
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
New in version `2.13.0`
Icons provide visual representations for your MCP servers and components, helping client applications present better user interfaces. When displayed in MCP clients, icons help users quickly identify and navigate your server’s capabilities.
##
[​
](#icon-format)
Icon Format
Icons use the standard MCP Icon type from the MCP protocol specification. Each icon specifies:
* **src**: URL or data URI pointing to the icon image
* **mimeType** (optional): MIME type of the image (e.g., “image/png”, “image/svg+xml”)
* **sizes** (optional): Array of size descriptors (e.g., [“48x48”], [“any”])
```
`from mcp.types import Icon
icon = Icon(
src="https://example.com/icon.png",
mimeType="image/png",
sizes=["48x48"]
)
`
```
##
[​
](#server-icons)
Server Icons
Add icons and a website URL to your server for display in client applications:
```
`from fastmcp import FastMCP
from mcp.types import Icon
mcp = FastMCP(
name="WeatherService",
website\_url="https://weather.example.com",
icons=[
Icon(
src="https://weather.example.com/icon-48.png",
mimeType="image/png",
sizes=["48x48"]
),
Icon(
src="https://weather.example.com/icon-96.png",
mimeType="image/png",
sizes=["96x96"]
),
]
)
`
```
Server icons appear in MCP client interfaces to help users identify your server among others they may have installed.
##
[​
](#component-icons)
Component Icons
Icons can be added to individual tools, resources, resource templates, and prompts:
###
[​
](#tool-icons)
Tool Icons
```
`from mcp.types import Icon
@mcp.tool(
icons=[Icon(src="https://example.com/calculator-icon.png")]
)
def calculate\_sum(a: int, b: int) -\> int:
"""Add two numbers together."""
return a + b
`
```
###
[​
](#resource-icons)
Resource Icons
```
`@mcp.resource(
"config://settings",
icons=[Icon(src="https://example.com/config-icon.png")]
)
def get\_settings() -\> dict:
"""Retrieve application settings."""
return {"theme": "dark", "language": "en"}
`
```
###
[​
](#resource-template-icons)
Resource Template Icons
```
`@mcp.resource(
"user://{user\_id}/profile",
icons=[Icon(src="https://example.com/user-icon.png")]
)
def get\_user\_profile(user\_id: str) -\> dict:
"""Get a user's profile."""
return {"id": user\_id, "name": f"User {user\_id}"}
`
```
###
[​
](#prompt-icons)
Prompt Icons
```
`@mcp.prompt(
icons=[Icon(src="https://example.com/prompt-icon.png")]
)
def analyze\_code(code: str):
"""Create a prompt for code analysis."""
return f"Please analyze this code:\\n\\n{code}"
`
```
##
[​
](#using-data-uris)
Using Data URIs
For small icons or when you want to embed the icon directly, use data URIs:
```
`from mcp.types import Icon
from fastmcp.utilities.types import Image
# SVG icon as data URI
svg\_icon = Icon(
src="data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIyNCIgaGVpZ2h0PSIyNCI+PHBhdGggZD0iTTEyIDJDNi40OCAyIDIgNi40OCAyIDEyczQuNDggMTAgMTAgMTAgMTAtNC40OCAxMC0xMFMxNy41MiAyIDEyIDJ6Ii8+PC9zdmc+",
mimeType="image/svg+xml"
)
@mcp.tool(icons=[svg\_icon])
def my\_tool() -\> str:
"""A tool with an embedded SVG icon."""
return "result"
# Generating a data URI from a local image file.
img = Image(path="./assets/brand/favicon.png")
icon = Icon(src=img.to\_data\_uri())
@mcp.tool(icons=[icon])
def file\_icon\_tool() -\> str:
"""A tool with an icon generated from a local file."""
return "result"
`
```