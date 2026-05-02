Tool Transformation - FastMCP
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
Tool transformation lets you modify tool schemas - renaming tools, changing descriptions, adjusting tags, and reshaping argument schemas. FastMCP provides two mechanisms that share the same configuration options but differ in timing.
**Deferred transformation** with `ToolTransform` applies modifications when tools flow through a transform chain. Use this for tools from mounted servers, proxies, or other providers where you don’t control the source directly.
**Immediate transformation** with `Tool.from\_tool()` creates a modified tool object right away. Use this when you have direct access to a tool and want to transform it before registration.
##
[​
](#tooltransform)
ToolTransform
The `ToolTransform` class is a transform that modifies tools as they flow through a provider. Provide a dictionary mapping original tool names to their transformation configuration.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms import ToolTransform
from fastmcp.tools.tool\_transform import ToolTransformConfig
mcp = FastMCP("Server")
@mcp.tool
def verbose\_internal\_data\_fetcher(query: str) -\> str:
"""Fetches data from the internal database."""
return f"Results for: {query}"
# Rename the tool to something simpler
mcp.add\_transform(ToolTransform({
"verbose\_internal\_data\_fetcher": ToolTransformConfig(
name="search",
description="Search the database.",
)
}))
# Clients see "search" with the cleaner description
`
```
`ToolTransform` is useful when you want to modify tools from mounted or proxied servers without changing the original source.
##
[​
](#tool-from_tool)
Tool.from\_tool()
Use `Tool.from\_tool()` when you have the tool object and want to create a transformed version for registration.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool, tool
from fastmcp.tools.tool\_transform import ArgTransform
# Create a tool without registering it
@tool
def search(q: str, limit: int = 10) -\> list[str]:
"""Search for items."""
return [f"Result {i} for {q}" for i in range(limit)]
# Transform it before registration
better\_search = Tool.from\_tool(
search,
name="find\_items",
description="Find items matching your search query.",
transform\_args={
"q": ArgTransform(
name="query",
description="The search terms to look for.",
),
},
)
mcp = FastMCP("Server")
mcp.add\_tool(better\_search)
`
```
The standalone `@tool` decorator (from `fastmcp.tools`) creates a Tool object without registering it to any server. This separates creation from registration, letting you transform tools before deciding where they go.
##
[​
](#modification-options)
Modification Options
Both mechanisms support the same modifications.
**Tool-level options:**
|Option|Description|
|`name`|New name for the tool|
|`description`|New description|
|`title`|Human-readable title|
|`tags`|Set of tags for categorization|
|`annotations`|MCP ToolAnnotations|
|`meta`|Custom metadata dictionary|
|`enabled`|Whether the tool is visible to clients (default `True`)|
**Argument-level options** (via `ArgTransform` or `ArgTransformConfig`):
|Option|Description|
|`name`|Rename the argument|
|`description`|New description for the argument|
|`default`|New default value|
|`default\_factory`|Callable that generates a default (requires `hide=True`)|
|`hide`|Remove from client-visible schema|
|`required`|Make an optional argument required|
|`type`|Change the argument’s type|
|`examples`|Example values for the argument|
##
[​
](#hiding-arguments)
Hiding Arguments
Hide arguments to simplify the interface or inject values the client shouldn’t control.
```
`from fastmcp.tools.tool\_transform import ArgTransform
# Hide with a constant value
transform\_args = {
"api\_key": ArgTransform(hide=True, default="secret-key"),
}
# Hide with a dynamic value
import uuid
transform\_args = {
"request\_id": ArgTransform(hide=True, default\_factory=lambda: str(uuid.uuid4())),
}
`
```
Hidden arguments disappear from the tool’s schema. The client never sees them, but the underlying function receives the configured value.
`default\_factory` requires `hide=True`. Visible arguments need static defaults that can be represented in JSON Schema.
##
[​
](#renaming-arguments)
Renaming Arguments
Rename arguments to make them more intuitive for LLMs or match your API conventions.
```
`from fastmcp.tools import Tool, tool
from fastmcp.tools.tool\_transform import ArgTransform
@tool
def search(q: str, n: int = 10) -\> list[str]:
"""Search for items."""
return []
better\_search = Tool.from\_tool(
search,
transform\_args={
"q": ArgTransform(name="query", description="Search terms"),
"n": ArgTransform(name="max\_results", description="Maximum results to return"),
},
)
`
```
##
[​
](#custom-transform-functions)
Custom Transform Functions
For advanced scenarios, provide a `transform\_fn` that intercepts tool execution. The function can validate inputs, modify outputs, or add custom logic while still calling the original tool via `forward()`.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool, tool
from fastmcp.tools.tool\_transform import forward, ArgTransform
@tool
def divide(a: float, b: float) -\> float:
"""Divide a by b."""
return a / b
async def safe\_divide(numerator: float, denominator: float) -\> float:
if denominator == 0:
raise ValueError("Cannot divide by zero")
return await forward(numerator=numerator, denominator=denominator)
safe\_division = Tool.from\_tool(
divide,
name="safe\_divide",
transform\_fn=safe\_divide,
transform\_args={
"a": ArgTransform(name="numerator"),
"b": ArgTransform(name="denominator"),
},
)
mcp = FastMCP("Server")
mcp.add\_tool(safe\_division)
`
```
The `forward()` function handles argument mapping automatically. Call it with the transformed argument names, and it maps them back to the original function’s parameters.
For direct access to the original function without mapping, use `forward\_raw()` with the original parameter names.
##
[​
](#context-aware-tool-factories)
Context-Aware Tool Factories
You can write functions that act as “factories,” generating specialized versions of a tool for different contexts. For example, create a `get\_my\_data` tool for the current user by hiding the `user\_id` parameter and providing it automatically.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool, tool
from fastmcp.tools.tool\_transform import ArgTransform
# A generic tool that requires a user\_id
@tool
def get\_user\_data(user\_id: str, query: str) -\> str:
"""Fetch data for a specific user."""
return f"Data for user {user\_id}: {query}"
def create\_user\_tool(user\_id: str) -\> Tool:
"""Factory that creates a user-specific version of get\_user\_data."""
return Tool.from\_tool(
get\_user\_data,
name="get\_my\_data",
description="Fetch your data. No need to specify a user ID.",
transform\_args={
"user\_id": ArgTransform(hide=True, default=user\_id),
},
)
# Create a server with a tool customized for the current user
mcp = FastMCP("User Server")
current\_user\_id = "user-123" # e.g., from auth context
mcp.add\_tool(create\_user\_tool(current\_user\_id))
# Clients see "get\_my\_data(query: str)" — user\_id is injected automatically
`
```
This pattern is useful for multi-tenant servers where each connection gets tools pre-configured with their identity, or for wrapping generic tools with environment-specific defaults.