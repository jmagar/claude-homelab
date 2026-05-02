Transforms Overview - FastMCP
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
Transforms modify components as they flow from providers to clients. When a client asks “what tools do you have?”, the request passes through each transform in the chain. Each transform can modify the components before passing them along.
##
[​
](#mental-model)
Mental Model
Think of transforms as filters in a pipeline. Components flow from providers through transforms to reach clients:
```
`Provider → [Transform A] → [Transform B] → Client
`
```
When listing components, transforms receive sequences and return transformed sequences—a pure function pattern. When getting a specific component by name, transforms use a middleware pattern with `call\_next`, working in reverse: mapping the client’s requested name back to the original, then transforming the result.
##
[​
](#built-in-transforms)
Built-in Transforms
FastMCP provides several transforms for common use cases:
* **[Namespace](/servers/transforms/namespace)** - Prefix component names to prevent conflicts when composing servers
* **[Tool Transformation](/servers/transforms/tool-transformation)** - Rename tools, modify descriptions, reshape arguments
* **[Enabled](/servers/visibility)** - Control which components are visible at runtime
* **[Tool Search](/servers/transforms/tool-search)** - Replace large tool catalogs with on-demand search
* **[Resources as Tools](/servers/transforms/resources-as-tools)** - Expose resources to tool-only clients
* **[Prompts as Tools](/servers/transforms/prompts-as-tools)** - Expose prompts to tool-only clients
* **[Code Mode (Experimental)](/servers/transforms/code-mode)** - Replace many tools with programmable `search` + `execute`
##
[​
](#server-vs-provider-transforms)
Server vs Provider Transforms
Transforms can be added at two levels, each serving different purposes.
###
[​
](#provider-level-transforms)
Provider-Level Transforms
Provider transforms apply to components from a specific provider. They run first, modifying components before they reach the server level.
```
`from fastmcp import FastMCP
from fastmcp.server.providers import FastMCPProvider
from fastmcp.server.transforms import Namespace, ToolTransform
from fastmcp.tools.tool\_transform import ToolTransformConfig
sub\_server = FastMCP("Sub")
@sub\_server.tool
def process(data: str) -\> str:
return f"Processed: {data}"
# Create provider and add transforms
provider = FastMCPProvider(sub\_server)
provider.add\_transform(Namespace("api"))
provider.add\_transform(ToolTransform({
"api\_process": ToolTransformConfig(description="Process data through the API"),
}))
main = FastMCP("Main", providers=[provider])
# Tool is now: api\_process with updated description
`
```
When using `mount()`, the returned provider reference lets you add transforms directly.
```
`main = FastMCP("Main")
mount = main.mount(sub\_server, namespace="api")
mount.add\_transform(ToolTransform({...}))
`
```
###
[​
](#server-level-transforms)
Server-Level Transforms
Server transforms apply to all components from all providers. They run after provider transforms, seeing the already-transformed names.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms import Namespace
mcp = FastMCP("Server", transforms=[Namespace("v1")])
@mcp.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
# All tools become v1\_toolname
`
```
Server-level transforms are useful for API versioning or applying consistent naming across your entire server.
###
[​
](#transform-order)
Transform Order
Transforms stack in the order they’re added. The first transform added is innermost (closest to the provider), and subsequent transforms wrap it.
```
`from fastmcp.server.providers import FastMCPProvider
from fastmcp.server.transforms import Namespace, ToolTransform
from fastmcp.tools.tool\_transform import ToolTransformConfig
provider = FastMCPProvider(server)
provider.add\_transform(Namespace("api")) # Applied first
provider.add\_transform(ToolTransform({ # Sees namespaced names
"api\_verbose\_name": ToolTransformConfig(name="short"),
}))
# Flow: "verbose\_name" -\> "api\_verbose\_name" -\> "short"
`
```
When a client requests “short”, the transforms reverse the mapping: ToolTransform maps “short” to “api\_verbose\_name”, then Namespace strips the prefix to find “verbose\_name” in the provider.
##
[​
](#custom-transforms)
Custom Transforms
Create custom transforms by subclassing `Transform` and overriding the methods you need.
```
`from collections.abc import Sequence
from fastmcp.server.transforms import Transform, GetToolNext
from fastmcp.tools.tool import Tool
class TagFilter(Transform):
"""Filter tools to only those with specific tags."""
def \_\_init\_\_(self, required\_tags: set[str]):
self.required\_tags = required\_tags
async def list\_tools(self, tools: Sequence[Tool]) -\> Sequence[Tool]:
return [t for t in tools if t.tags & self.required\_tags]
async def get\_tool(self, name: str, call\_next: GetToolNext) -\> Tool | None:
tool = await call\_next(name)
if tool and tool.tags & self.required\_tags:
return tool
return None
`
```
The `Transform` base class provides default implementations that pass through unchanged. Override only the methods relevant to your transform.
Each component type has two methods with different patterns:
|Method|Pattern|Purpose|
|`list\_tools(tools)`|Pure function|Transform the sequence of tools|
|`get\_tool(name, call\_next)`|Middleware|Transform lookup by name|
|`list\_resources(resources)`|Pure function|Transform the sequence of resources|
|`get\_resource(uri, call\_next)`|Middleware|Transform lookup by URI|
|`list\_resource\_templates(templates)`|Pure function|Transform the sequence of templates|
|`get\_resource\_template(uri, call\_next)`|Middleware|Transform template lookup by URI|
|`list\_prompts(prompts)`|Pure function|Transform the sequence of prompts|
|`get\_prompt(name, call\_next)`|Middleware|Transform lookup by name|
List methods receive sequences directly and return transformed sequences. Get methods use `call\_next` for routing flexibility—when a client requests “new\_name”, your transform maps it back to “original\_name” before calling `call\_next()`.
```
`class PrefixTransform(Transform):
def \_\_init\_\_(self, prefix: str):
self.prefix = prefix
async def list\_tools(self, tools: Sequence[Tool]) -\> Sequence[Tool]:
return [t.model\_copy(update={"name": f"{self.prefix}\_{t.name}"}) for t in tools]
async def get\_tool(self, name: str, call\_next: GetToolNext) -\> Tool | None:
# Reverse the prefix to find the original
if not name.startswith(f"{self.prefix}\_"):
return None
original = name[len(self.prefix) + 1:]
tool = await call\_next(original)
if tool:
return tool.model\_copy(update={"name": name})
return None
`
```