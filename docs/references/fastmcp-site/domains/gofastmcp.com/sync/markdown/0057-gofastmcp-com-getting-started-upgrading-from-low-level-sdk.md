Upgrading from the MCP Low-Level SDK - FastMCP
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
* [
From FastMCP 2
](/getting-started/upgrading/from-fastmcp-2)
* [
From MCP SDK
](/getting-started/upgrading/from-mcp-sdk)
* [
From MCP Low-Level SDK
](/getting-started/upgrading/from-low-level-sdk)
*
Development
*
What's New
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
If you’ve been building MCP servers directly on the `mcp` package’s `Server` class — writing `list\_tools()` and `call\_tool()` handlers, hand-crafting JSON Schema dicts, and wiring up transport boilerplate — this guide is for you. FastMCP replaces all of that machinery with a declarative, Pythonic API where your functions *are* the protocol surface.
The core idea: instead of telling the SDK what your tools look like and then separately implementing them, you write ordinary Python functions and let FastMCP derive the protocol layer from your code. Type hints become JSON Schema. Docstrings become descriptions. Return values are serialized automatically. The plumbing you wrote to satisfy the protocol just disappears.
This guide covers upgrading from **v1** of the `mcp` package. We’ll provide a separate guide when v2 ships.
Already using FastMCP 1.0 via `from mcp.server.fastmcp import FastMCP`? Your upgrade is simpler — see the [FastMCP 1.0 upgrade guide](/getting-started/upgrading/from-mcp-sdk) instead.
Copy this prompt into any LLM along with your server code to get automated upgrade guidance.
Copy prompt
##
[​
](#install)
Install
```
`pip install --upgrade fastmcp
# or
uv add fastmcp
`
```
FastMCP includes the `mcp` package as a transitive dependency, so you don’t lose access to anything.
##
[​
](#server-and-transport)
Server and Transport
The `Server` class requires you to choose a transport, connect streams, build initialization options, and run an event loop. FastMCP collapses all of that into a constructor and a `run()` call.
Before
After
```
`import asyncio
from mcp.server import Server
from mcp.server.stdio import stdio\_server
server = Server("my-server")
# ... register handlers ...
async def main():
async with stdio\_server() as (read\_stream, write\_stream):
await server.run(
read\_stream,
write\_stream,
server.create\_initialization\_options(),
)
asyncio.run(main())
`
```
Need HTTP instead of stdio? With the `Server` class, you’d wire up Starlette routes and `SseServerTransport` or `StreamableHTTPSessionManager`. With FastMCP:
```
`mcp.run(transport="http", host="0.0.0.0", port=8000)
`
```
##
[​
](#tools)
Tools
This is where the difference is most dramatic. The `Server` class requires two handlers — one to describe your tools (with hand-written JSON Schema) and another to dispatch calls by name. FastMCP eliminates both by deriving everything from your function signature.
Before
After
```
`import mcp.types as types
from mcp.server import Server
server = Server("math")
@server.list\_tools()
async def list\_tools() -\> list[types.Tool]:
return [
types.Tool(
name="add",
description="Add two numbers",
inputSchema={
"type": "object",
"properties": {
"a": {"type": "number"},
"b": {"type": "number"},
},
"required": ["a", "b"],
},
),
types.Tool(
name="multiply",
description="Multiply two numbers",
inputSchema={
"type": "object",
"properties": {
"a": {"type": "number"},
"b": {"type": "number"},
},
"required": ["a", "b"],
},
),
]
@server.call\_tool()
async def call\_tool(
name: str, arguments: dict
) -\> list[types.TextContent]:
if name == "add":
result = arguments["a"] + arguments["b"]
return [types.TextContent(type="text", text=str(result))]
elif name == "multiply":
result = arguments["a"] \* arguments["b"]
return [types.TextContent(type="text", text=str(result))]
raise ValueError(f"Unknown tool: {name}")
`
```
Each `@mcp.tool` function is self-contained: its name becomes the tool name, its docstring becomes the description, its type annotations become the JSON Schema, and its return value is serialized automatically. No routing. No schema dictionaries. No content-type wrappers.
###
[​
](#type-mapping)
Type Mapping
When converting your `inputSchema` to Python type hints:
|JSON Schema|Python Type|
|`{"type": "string"}`|`str`|
|`{"type": "number"}`|`float`|
|`{"type": "integer"}`|`int`|
|`{"type": "boolean"}`|`bool`|
|`{"type": "array", "items": {"type": "string"}}`|`list[str]`|
|`{"type": "object"}`|`dict`|
|Optional property (not in `required`)|`param: str | None = None`|
###
[​
](#return-values)
Return Values
With the `Server` class, tools return `list[types.TextContent | types.ImageContent | ...]`. In FastMCP, return plain Python values — strings, numbers, dicts, lists, dataclasses, Pydantic models — and serialization is handled for you.
For images or other non-text content, FastMCP provides helpers:
```
`from fastmcp import FastMCP
from fastmcp.utilities.types import Image
mcp = FastMCP("media")
@mcp.tool
def create\_chart(data: list[float]) -\> Image:
"""Generate a chart from data."""
png\_bytes = generate\_chart(data) # your logic
return Image(data=png\_bytes, format="png")
`
```
##
[​
](#resources)
Resources
The `Server` class uses three handlers for resources: `list\_resources()` to enumerate them, `list\_resource\_templates()` for URI templates, and `read\_resource()` to serve content — all with manual routing by URI. FastMCP replaces all three with per-resource decorators.
Before
After
```
`import json
import mcp.types as types
from mcp.server import Server
from pydantic import AnyUrl
server = Server("data")
@server.list\_resources()
async def list\_resources() -\> list[types.Resource]:
return [
types.Resource(
uri=AnyUrl("config://app"),
name="app\_config",
description="Application configuration",
mimeType="application/json",
),
types.Resource(
uri=AnyUrl("config://features"),
name="feature\_flags",
description="Active feature flags",
mimeType="application/json",
),
]
@server.list\_resource\_templates()
async def list\_resource\_templates() -\> list[types.ResourceTemplate]:
return [
types.ResourceTemplate(
uriTemplate="users://{user\_id}/profile",
name="user\_profile",
description="User profile by ID",
),
types.ResourceTemplate(
uriTemplate="projects://{project\_id}/status",
name="project\_status",
description="Project status by ID",
),
]
@server.read\_resource()
async def read\_resource(uri: AnyUrl) -\> str:
uri\_str = str(uri)
if uri\_str == "config://app":
return json.dumps({"debug": False, "version": "1.0"})
if uri\_str == "config://features":
return json.dumps({"dark\_mode": True, "beta": False})
if uri\_str.startswith("users://"):
user\_id = uri\_str.split("/")[2]
return json.dumps({"id": user\_id, "name": f"User {user\_id}"})
if uri\_str.startswith("projects://"):
project\_id = uri\_str.split("/")[2]
return json.dumps({"id": project\_id, "status": "active"})
raise ValueError(f"Unknown resource: {uri}")
`
```
Static resources and URI templates use the same `@mcp.resource` decorator — FastMCP detects `{placeholders}` in the URI and automatically registers a template. The function parameter `user\_id` maps directly to the `{user\_id}` placeholder.
##
[​
](#prompts)
Prompts
Same pattern: the `Server` class uses `list\_prompts()` and `get\_prompt()` with manual routing. FastMCP uses one decorator per prompt.
Before
After
```
`import mcp.types as types
from mcp.server import Server
server = Server("prompts")
@server.list\_prompts()
async def list\_prompts() -\> list[types.Prompt]:
return [
types.Prompt(
name="review\_code",
description="Review code for issues",
arguments=[
types.PromptArgument(
name="code",
description="The code to review",
required=True,
),
types.PromptArgument(
name="language",
description="Programming language",
required=False,
),
],
)
]
@server.get\_prompt()
async def get\_prompt(
name: str, arguments: dict[str, str] | None
) -\> types.GetPromptResult:
if name == "review\_code":
code = (arguments or {}).get("code", "")
language = (arguments or {}).get("language", "")
lang\_note = f" (written in {language})" if language else ""
return types.GetPromptResult(
description="Code review prompt",
messages=[
types.PromptMessage(
role="user",
content=types.TextContent(
type="text",
text=f"Please review this code{lang\_note}:\\n\\n{code}",
),
)
],
)
raise ValueError(f"Unknown prompt: {name}")
`
```
Returning a `str` from a prompt function automatically wraps it as a user message. For multi-turn prompts, return a `list[Message]`:
```
`from fastmcp import FastMCP
from fastmcp.prompts import Message
mcp = FastMCP("prompts")
@mcp.prompt
def debug\_session(error: str) -\> list[Message]:
"""Start a debugging conversation"""
return [
Message(f"I'm seeing this error:\\n\\n{error}"),
Message("I'll help you debug that. Can you share the relevant code?", role="assistant"),
]
`
```
##
[​
](#request-context)
Request Context
The `Server` class exposes request context through `server.request\_context`, which gives you the raw `ServerSession` for sending notifications. FastMCP replaces this with a typed `Context` object injected into any function that declares it.
Before
After
```
`import mcp.types as types
from mcp.server import Server
server = Server("worker")
@server.call\_tool()
async def call\_tool(name: str, arguments: dict):
if name == "process\_data":
ctx = server.request\_context
await ctx.session.send\_log\_message(
level="info", data="Starting processing..."
)
# ... do work ...
await ctx.session.send\_log\_message(
level="info", data="Done!"
)
return [types.TextContent(type="text", text="Processed")]
`
```
The `Context` object provides logging (`ctx.debug()`, `ctx.info()`, `ctx.warning()`, `ctx.error()`), progress reporting (`ctx.report\_progress()`), resource subscriptions, session state, and more. See [Context](/servers/context) for the full API.
##
[​
](#complete-example)
Complete Example
A full server upgrade, showing how all the pieces fit together:
Before
After
```
`import asyncio
import json
import mcp.types as types
from mcp.server import Server
from mcp.server.stdio import stdio\_server
from pydantic import AnyUrl
server = Server("demo")
@server.list\_tools()
async def list\_tools() -\> list[types.Tool]:
return [
types.Tool(
name="greet",
description="Greet someone by name",
inputSchema={
"type": "object",
"properties": {
"name": {"type": "string"},
},
"required": ["name"],
},
)
]
@server.call\_tool()
async def call\_tool(name: str, arguments: dict) -\> list[types.TextContent]:
if name == "greet":
return [types.TextContent(type="text", text=f"Hello, {arguments['name']}!")]
raise ValueError(f"Unknown tool: {name}")
@server.list\_resources()
async def list\_resources() -\> list[types.Resource]:
return [
types.Resource(
uri=AnyUrl("info://version"),
name="version",
description="Server version",
)
]
@server.read\_resource()
async def read\_resource(uri: AnyUrl) -\> str:
if str(uri) == "info://version":
return json.dumps({"version": "1.0.0"})
raise ValueError(f"Unknown resource: {uri}")
@server.list\_prompts()
async def list\_prompts() -\> list[types.Prompt]:
return [
types.Prompt(
name="summarize",
description="Summarize text",
arguments=[
types.PromptArgument(name="text", required=True)
],
)
]
@server.get\_prompt()
async def get\_prompt(
name: str, arguments: dict[str, str] | None
) -\> types.GetPromptResult:
if name == "summarize":
return types.GetPromptResult(
description="Summarize text",
messages=[
types.PromptMessage(
role="user",
content=types.TextContent(
type="text",
text=f"Summarize:\\n\\n{(arguments or {}).get('text', '')}",
),
)
],
)
raise ValueError(f"Unknown prompt: {name}")
async def main():
async with stdio\_server() as (read\_stream, write\_stream):
await server.run(
read\_stream, write\_stream,
server.create\_initialization\_options(),
)
asyncio.run(main())
`
```
See all 86 lines
##
[​
](#what’s-next)
What’s Next
Once you’ve upgraded, you have access to everything FastMCP provides beyond the basics:
* **[Server composition](/servers/composition)** — Mount sub-servers to build modular applications
* **[Middleware](/servers/middleware)** — Add logging, rate limiting, error handling, and caching
* **[Proxy servers](/servers/providers/proxy)** — Create a proxy to any existing MCP server
* **[OpenAPI integration](/integrations/openapi)** — Generate an MCP server from an OpenAPI spec
* **[Authentication](/servers/auth/authentication)** — Built-in OAuth and token verification
* **[Testing](/servers/testing)** — Test your server directly in Python without running a subprocess
Explore the full documentation at [gofastmcp.com](https://gofastmcp.com).