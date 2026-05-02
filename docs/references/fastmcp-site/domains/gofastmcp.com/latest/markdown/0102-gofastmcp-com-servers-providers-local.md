Local Provider - FastMCP
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
`LocalProvider` stores components that you define directly on your server. When you use `@mcp.tool`, `@mcp.resource`, or `@mcp.prompt`, you’re adding components to your server’s `LocalProvider`.
##
[​
](#how-it-works)
How It Works
Every FastMCP server has a `LocalProvider` as its first provider. Components registered via decorators or direct methods are stored here:
```
`from fastmcp import FastMCP
mcp = FastMCP("MyServer")
# These are stored in the server's `LocalProvider`
@mcp.tool
def greet(name: str) -\> str:
"""Greet someone by name."""
return f"Hello, {name}!"
@mcp.resource("data://config")
def get\_config() -\> str:
"""Return configuration data."""
return '{"version": "1.0"}'
@mcp.prompt
def analyze(topic: str) -\> str:
"""Create an analysis prompt."""
return f"Please analyze: {topic}"
`
```
The `LocalProvider` is always queried first when clients request components, ensuring that your directly-defined components take precedence over those from mounted or proxied servers.
##
[​
](#component-registration)
Component Registration
###
[​
](#using-decorators)
Using Decorators
The most common way to register components:
```
`@mcp.tool
def my\_tool(x: int) -\> str:
return str(x)
@mcp.resource("data://info")
def my\_resource() -\> str:
return "info"
@mcp.prompt
def my\_prompt(topic: str) -\> str:
return f"Discuss: {topic}"
`
```
###
[​
](#using-direct-methods)
Using Direct Methods
You can also add pre-built component objects:
```
`from fastmcp.tools import Tool
# Create a tool object
my\_tool = Tool.from\_function(some\_function, name="custom\_tool")
# Add it to the server
mcp.add\_tool(my\_tool)
mcp.add\_resource(my\_resource)
mcp.add\_prompt(my\_prompt)
`
```
###
[​
](#removing-components)
Removing Components
Remove components by name or URI:
```
`mcp.local\_provider.remove\_tool("my\_tool")
mcp.local\_provider.remove\_resource("data://info")
mcp.local\_provider.remove\_prompt("my\_prompt")
`
```
##
[​
](#duplicate-handling)
Duplicate Handling
When you try to add a component that already exists, the behavior depends on the `on\_duplicate` setting:
|Mode|Behavior|
|`"error"` (default)|Raise `ValueError`|
|`"warn"`|Log warning and replace|
|`"replace"`|Silently replace|
|`"ignore"`|Keep existing component|
Configure this when creating the server:
```
`mcp = FastMCP("MyServer", on\_duplicate="warn")
`
```
##
[​
](#component-visibility)
Component Visibility
New in version `3.0.0`
Components can be dynamically enabled or disabled at runtime. Disabled components don’t appear in listings and can’t be called.
```
`@mcp.tool(tags={"admin"})
def delete\_all() -\> str:
"""Delete everything."""
return "Deleted"
@mcp.tool
def get\_status() -\> str:
"""Get system status."""
return "OK"
# Disable admin tools
mcp.disable(tags={"admin"})
# Or only enable specific tools
mcp.enable(keys={"tool:get\_status"}, only=True)
`
```
See [Visibility](/servers/visibility) for the full documentation on keys, tags, allowlist mode, and provider-level control.
##
[​
](#standalone-localprovider)
Standalone LocalProvider
You can create a LocalProvider independently and attach it to multiple servers:
```
`from fastmcp import FastMCP
from fastmcp.server.providers import LocalProvider
# Create a reusable provider
shared\_tools = LocalProvider()
@shared\_tools.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
@shared\_tools.resource("data://version")
def get\_version() -\> str:
return "1.0.0"
# Attach to multiple servers
server1 = FastMCP("Server1", providers=[shared\_tools])
server2 = FastMCP("Server2", providers=[shared\_tools])
`
```
This is useful for:
* Sharing components across servers
* Testing components in isolation
* Building reusable component libraries
Standalone providers also support visibility control with `enable()` and `disable()`. See [Visibility](/servers/visibility) for details.