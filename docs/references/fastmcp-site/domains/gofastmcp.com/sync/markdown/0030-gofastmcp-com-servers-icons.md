Icons - FastMCP
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
* [
Background Tasks
NEW
](/servers/tasks)
* [
Composition
](/servers/composition)
* [
Dependencies
NEW
](/servers/dependency-injection)
* [
Elicitation
](/servers/elicitation)
* [
Icons
](/servers/icons)
* [
Lifespan
NEW
](/servers/lifespan)
* [
Logging
](/servers/logging)
* [
Middleware
](/servers/middleware)
* [
Pagination
NEW
](/servers/pagination)
* [
Progress
](/servers/progress)
* [
Sampling
](/servers/sampling)
* [
Storage Backends
NEW
](/servers/storage-backends)
* [
Telemetry
NEW
](/servers/telemetry)
* [
Testing
](/servers/testing)
* [
Versioning
NEW
](/servers/versioning)
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
New in version `2.13.0`
Icons provide visual representations for your MCP servers and components, helping client applications present better user interfaces. When displayed in MCP clients, icons help users quickly identify and navigate your server’s capabilities.
##
[​
](#icon-format)
Icon Format
Icons use the standard MCP Icon type from the MCP protocol specification. Each icon specifies a source URL or data URI, and optionally includes MIME type and size information.
```
`from mcp.types import Icon
icon = Icon(
src="https://example.com/icon.png",
mimeType="image/png",
sizes=["48x48"]
)
`
```
The fields serve different purposes:
* **src**: URL or data URI pointing to the icon image
* **mimeType** (optional): MIME type of the image (e.g., “image/png”, “image/svg+xml”)
* **sizes** (optional): Array of size descriptors (e.g., [“48x48”], [“any”])
##
[​
](#server-icons)
Server Icons
Add icons and a website URL to your server for display in client applications. Multiple icons at different sizes help clients choose the best resolution for their display context.
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
Icons can be added to individual tools, resources, resource templates, and prompts. This helps users visually distinguish between different component types and purposes.
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
For small icons or when you want to embed the icon directly without external dependencies, use data URIs. This approach eliminates the need for hosting and ensures the icon is always available.
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
`
```
###
[​
](#generating-data-uris-from-files)
Generating Data URIs from Files
FastMCP provides the `Image` utility class to convert local image files into data URIs.
```
`from mcp.types import Icon
from fastmcp.utilities.types import Image
# Generate a data URI from a local image file
img = Image(path="./assets/brand/favicon.png")
icon = Icon(src=img.to\_data\_uri())
@mcp.tool(icons=[icon])
def file\_icon\_tool() -\> str:
"""A tool with an icon generated from a local file."""
return "result"
`
```
This approach is useful when you have local image assets and want to embed them directly in your server definition.