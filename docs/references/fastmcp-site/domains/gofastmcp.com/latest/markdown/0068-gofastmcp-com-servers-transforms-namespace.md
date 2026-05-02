Namespace Transform - FastMCP
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
* [
Overview
NEW
](/servers/transforms/transforms)
* [
Namespace
NEW
](/servers/transforms/namespace)
* [
Tool Transformation
NEW
](/servers/transforms/tool-transformation)
* [
Visibility
NEW
](/servers/visibility)
* [
Code Mode
NEW
](/servers/transforms/code-mode)
* [
Tool Search
NEW
](/servers/transforms/tool-search)
* [
Resources as Tools
NEW
](/servers/transforms/resources-as-tools)
* [
Prompts as Tools
NEW
](/servers/transforms/prompts-as-tools)
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
The `Namespace` transform prefixes all component names, preventing conflicts when composing multiple servers.
Tools and prompts receive an underscore-separated prefix. Resources and templates receive a path-segment prefix in their URIs.
|Component|Original|With `Namespace("api")`|
|Tool|`my\_tool`|`api\_my\_tool`|
|Prompt|`my\_prompt`|`api\_my\_prompt`|
|Resource|`data://info`|`data://api/info`|
|Template|`data://{id}`|`data://api/{id}`|
The most common use is through the `mount()` method’s `namespace` parameter.
```
`from fastmcp import FastMCP
weather = FastMCP("Weather")
calendar = FastMCP("Calendar")
@weather.tool
def get\_data() -\> str:
return "Weather data"
@calendar.tool
def get\_data() -\> str:
return "Calendar data"
# Without namespacing, these would conflict
main = FastMCP("Main")
main.mount(weather, namespace="weather")
main.mount(calendar, namespace="calendar")
# Clients see: weather\_get\_data, calendar\_get\_data
`
```
You can also apply namespacing directly using the `Namespace` transform.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms import Namespace
mcp = FastMCP("Server")
@mcp.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
# Namespace all components
mcp.add\_transform(Namespace("api"))
# Tool is now: api\_greet
`
```