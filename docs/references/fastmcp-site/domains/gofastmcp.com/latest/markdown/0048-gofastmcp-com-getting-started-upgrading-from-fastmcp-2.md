Upgrading from FastMCP 2 - FastMCP
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
This guide covers breaking changes and migration steps when upgrading FastMCP.
##
[​
](#v3-0-0)
v3.0.0
For most servers, upgrading to v3 is straightforward. The breaking changes below affect deprecated constructor kwargs, sync-to-async shifts, a few renamed methods, and some less commonly used features.
###
[​
](#install)
Install
Since you already have `fastmcp` installed, you need to explicitly request the new version — `pip install fastmcp` won’t upgrade an existing installation:
```
`pip install --upgrade fastmcp
# or
uv add --upgrade fastmcp
`
```
If you pin versions in a requirements file or `pyproject.toml`, update your pin to `fastmcp\>=3.0.0,\<4`.
**New repository home.** As part of the v3 release, FastMCP’s GitHub repository has moved from `jlowin/fastmcp` to [`PrefectHQ/fastmcp`](https://github.com/PrefectHQ/fastmcp) under [Prefect](https://prefect.io)’s stewardship. GitHub automatically redirects existing clones and bookmarks, so nothing breaks — but you can update your local remote whenever convenient:
```
`git remote set-url origin https://github.com/PrefectHQ/fastmcp.git
`
```
If you reference the repository URL in dependency specifications (e.g., `git+https://github.com/jlowin/fastmcp.git`), update those to the new location.
Copy this prompt into any LLM along with your server code to get automated upgrade guidance.
Copy prompt
###
[​
](#breaking-changes)
Breaking Changes
**Transport and server settings removed from constructor**
In v2, you could configure transport settings directly in the `FastMCP()` constructor. In v3, `FastMCP()` is purely about your server’s identity and behavior — transport configuration happens when you actually start serving. Passing any of the old kwargs now raises `TypeError` with a migration hint.
```
`# Before
mcp = FastMCP("server", host="0.0.0.0", port=8080)
mcp.run()
# After
mcp = FastMCP("server")
mcp.run(transport="http", host="0.0.0.0", port=8080)
`
```
The full list of removed kwargs and their replacements:
* `host`, `port`, `log\_level`, `debug`, `sse\_path`, `streamable\_http\_path`, `json\_response`, `stateless\_http` — pass to `run()`, `run\_http\_async()`, or `http\_app()`, or set via environment variables (e.g. `FASTMCP\_HOST`)
* `message\_path` — set via environment variable `FASTMCP\_MESSAGE\_PATH` only (not a `run()` kwarg)
* `on\_duplicate\_tools`, `on\_duplicate\_resources`, `on\_duplicate\_prompts` — consolidated into a single `on\_duplicate=` parameter
* `tool\_serializer` — return [`ToolResult`](/servers/tools#custom-serialization) from your tools instead
* `include\_tags` / `exclude\_tags` — use `server.enable(tags=..., only=True)` / `server.disable(tags=...)` after construction
* `tool\_transformations` — use `server.add\_transform(ToolTransform(...))` after construction
**OAuth storage backend changed (diskcache CVE)**
The default OAuth client storage has moved from `DiskStore` to `FileTreeStore` to address a pickle deserialization vulnerability in diskcache ([CVE-2025-69872](https://github.com/PrefectHQ/fastmcp/issues/3166)).
If you were using the default storage (i.e., not passing an explicit `client\_storage`), clients will need to re-register on their first connection after upgrading. This happens automatically — no user action required, and it’s the same flow that already occurs whenever a server restarts with in-memory storage.
If you were passing a `DiskStore` explicitly, you can either [switch to `FileTreeStore`](/servers/storage-backends) (recommended) or keep using `DiskStore` by adding the dependency yourself.
When switching to `FileTreeStore`, you **must** configure key and collection sanitization strategies. Without them, keys containing special characters (such as URL-based OAuth client IDs) will cause filesystem errors. See the [File Storage](/servers/storage-backends#file-storage) section for the recommended setup.
Keeping `DiskStore` requires `pip install 'py-key-value-aio[disk]'`, which re-introduces the vulnerable `diskcache` package into your dependency tree.
**Component enable()/disable() moved to server**
In v2, you could enable or disable individual components by calling methods on the component object itself. In v3, visibility is controlled through the server (or provider), which lets you target components by name, tag, or type without needing a reference to the object:
```
`# Before
tool = await server.get\_tool("my\_tool")
tool.disable()
# After
server.disable(names={"my\_tool"}, components={"tool"})
`
```
Calling `.enable()` or `.disable()` on a component object now raises `NotImplementedError`. See [Visibility](/servers/visibility) for the full API, including tag-based filtering and per-session visibility.
**Listing methods renamed and return lists**
The `get\_tools()`, `get\_resources()`, `get\_prompts()`, and `get\_resource\_templates()` methods have been renamed to `list\_tools()`, `list\_resources()`, `list\_prompts()`, and `list\_resource\_templates()`. More importantly, they now return lists instead of dicts — so code that indexes by name needs to change:
```
`# Before
tools = await server.get\_tools()
tool = tools["my\_tool"]
# After
tools = await server.list\_tools()
tool = next((t for t in tools if t.name == "my\_tool"), None)
`
```
**Prompts use Message class**
Prompt functions now use FastMCP’s `Message` class instead of `mcp.types.PromptMessage`. The new class is simpler — it accepts a plain string and defaults to `role="user"`, so most prompts become one-liners:
```
`# Before
from mcp.types import PromptMessage, TextContent
@mcp.prompt
def my\_prompt() -\> PromptMessage:
return PromptMessage(role="user", content=TextContent(type="text", text="Hello"))
# After
from fastmcp.prompts import Message
@mcp.prompt
def my\_prompt() -\> Message:
return Message("Hello")
`
```
If your prompt functions return raw dicts with `role` and `content` keys, those also need to change. v2 silently coerced dicts into prompt messages, but v3 requires typed `Message` objects (or plain strings for single user messages):
```
`# Before (v2 accepted this)
@mcp.prompt
def my\_prompt():
return [
{"role": "user", "content": "Hello"},
{"role": "assistant", "content": "How can I help?"},
]
# After
from fastmcp.prompts import Message
@mcp.prompt
def my\_prompt() -\> list[Message]:
return [
Message("Hello"),
Message("How can I help?", role="assistant"),
]
`
```
**Context state methods are async**
`ctx.set\_state()` and `ctx.get\_state()` are now async because state in v3 is session-scoped and backed by a pluggable storage backend (rather than a simple dict). This means state persists across multiple tool calls within the same session:
```
`# Before
ctx.set\_state("key", "value")
value = ctx.get\_state("key")
# After
await ctx.set\_state("key", "value")
value = await ctx.get\_state("key")
`
```
State values must also be JSON-serializable by default (dicts, lists, strings, numbers, etc.). If you need to store non-serializable values like an HTTP client, pass `serializable=False` — these values are request-scoped and only available during the current tool call:
```
`await ctx.set\_state("client", my\_http\_client, serializable=False)
`
```
**Mounted servers have isolated state stores**
Each `FastMCP` instance has its own state store. In v2 this wasn’t noticeable because mounted tools ran in the parent’s context, but in v3’s provider architecture each server is isolated. Non-serializable state (`serializable=False`) is request-scoped and automatically shared across mount boundaries. For serializable state, pass the same `session\_state\_store` to both servers:
```
`from fastmcp import FastMCP
from key\_value.aio.stores.memory import MemoryStore
store = MemoryStore()
parent = FastMCP("Parent", session\_state\_store=store)
child = FastMCP("Child", session\_state\_store=store)
parent.mount(child, namespace="child")
`
```
**Auth provider environment variables removed**
In v2, auth providers like `GitHubProvider` could auto-load configuration from environment variables with a `FASTMCP\_SERVER\_AUTH\_\*` prefix. This magic has been removed — pass values explicitly:
```
`# Before (v2) — client\_id and client\_secret loaded automatically
# from FASTMCP\_SERVER\_AUTH\_GITHUB\_CLIENT\_ID, etc.
auth = GitHubProvider()
# After (v3) — pass values explicitly
import os
from fastmcp.server.auth.providers.github import GitHubProvider
auth = GitHubProvider(
client\_id=os.environ["GITHUB\_CLIENT\_ID"],
client\_secret=os.environ["GITHUB\_CLIENT\_SECRET"],
)
`
```
**WSTransport removed**
The deprecated WebSocket client transport has been removed. Use `StreamableHttpTransport` instead:
```
`# Before
from fastmcp.client.transports import WSTransport
transport = WSTransport("ws://localhost:8000/ws")
# After
from fastmcp.client.transports import StreamableHttpTransport
transport = StreamableHttpTransport("http://localhost:8000/mcp")
`
```
**OpenAPI `timeout` parameter removed**
`OpenAPIProvider` no longer accepts a `timeout` parameter. Configure timeout on the httpx client directly. The `client` parameter is also now optional — when omitted, a default client is created from the spec’s `servers` URL with a 30-second timeout:
```
`# Before
provider = OpenAPIProvider(spec, client, timeout=60)
# After
client = httpx.AsyncClient(base\_url="https://api.example.com", timeout=60)
provider = OpenAPIProvider(spec, client)
`
```
**Metadata namespace renamed**
The FastMCP metadata key in component `meta` dicts changed from `\_fastmcp` to `fastmcp`. If you read metadata from tool or resource objects, update the key:
```
`# Before
tags = tool.meta.get("\_fastmcp", {}).get("tags", [])
# After
tags = tool.meta.get("fastmcp", {}).get("tags", [])
`
```
Metadata is now always included — the `include\_fastmcp\_meta` parameter has been removed from `FastMCP()` and `to\_mcp\_tool()`, so there is no way to suppress it.
**Server banner environment variable renamed**
`FASTMCP\_SHOW\_CLI\_BANNER` is now `FASTMCP\_SHOW\_SERVER\_BANNER`.
**Decorators return functions**
In v2, `@mcp.tool` transformed your function into a `FunctionTool` object. In v3, decorators return your original function unchanged — which means decorated functions stay callable for testing, reuse, and composition:
```
`@mcp.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
greet("World") # Works! Returns "Hello, World!"
`
```
If you have code that treats the decorated result as a `FunctionTool` (e.g., accessing `.name` or `.description`), set `FASTMCP\_DECORATOR\_MODE=object` for v2 compatibility. This escape hatch is itself deprecated and will be removed in a future release.
**Background tasks require optional dependency**
FastMCP’s background task system (SEP-1686) is now behind an optional extra. If your server uses background tasks, install with:
```
`pip install "fastmcp[tasks]"
`
```
Without the extra, configuring a tool with `task=True` or `TaskConfig` will raise an import error at runtime. See [Background Tasks](/servers/tasks) for details.
###
[​
](#deprecated-features)
Deprecated Features
These still work but emit warnings. Update when convenient.
**mount() prefix → namespace**
```
`# Deprecated
main.mount(subserver, prefix="api")
# New
main.mount(subserver, namespace="api")
`
```
**import\_server() → mount()**
```
`# Deprecated
main.import\_server(subserver)
# New
main.mount(subserver)
`
```
**Module import paths for proxy and OpenAPI**
The proxy and OpenAPI modules have moved under `providers` to reflect v3’s provider-based architecture:
```
`# Deprecated
from fastmcp.server.proxy import FastMCPProxy
from fastmcp.server.openapi import FastMCPOpenAPI
# New
from fastmcp.server.providers.proxy import FastMCPProxy
from fastmcp.server.providers.openapi import OpenAPIProvider
`
```
`FastMCPOpenAPI` itself is deprecated — use `FastMCP` with an `OpenAPIProvider` instead:
```
`# Deprecated
from fastmcp.server.openapi import FastMCPOpenAPI
server = FastMCPOpenAPI(spec, client)
# New
from fastmcp import FastMCP
from fastmcp.server.providers.openapi import OpenAPIProvider
server = FastMCP("my\_api", providers=[OpenAPIProvider(spec, client)])
`
```
**add\_tool\_transformation() → add\_transform()**
```
`# Deprecated
mcp.add\_tool\_transformation("name", config)
# New
from fastmcp.server.transforms import ToolTransform
mcp.add\_transform(ToolTransform({"name": config}))
`
```
**FastMCP.as\_proxy() → create\_proxy()**
```
`# Deprecated
proxy = FastMCP.as\_proxy("http://example.com/mcp")
# New
from fastmcp.server import create\_proxy
proxy = create\_proxy("http://example.com/mcp")
`
```
##
[​
](#v2-14-0)
v2.14.0
###
[​
](#openapi-parser-promotion)
OpenAPI Parser Promotion
The experimental OpenAPI parser is now standard. Update imports:
```
`# Before
from fastmcp.experimental.server.openapi import FastMCPOpenAPI
# After
from fastmcp.server.openapi import FastMCPOpenAPI
`
```
###
[​
](#removed-deprecated-features)
Removed Deprecated Features
* `BearerAuthProvider` → use `JWTVerifier`
* `Context.get\_http\_request()` → use `get\_http\_request()` from dependencies
* `from fastmcp import Image` → use `from fastmcp.utilities.types import Image`
* `FastMCP(dependencies=[...])` → use `fastmcp.json` configuration
* `FastMCPProxy(client=...)` → use `client\_factory=lambda: ...`
* `output\_schema=False` → use `output\_schema=None`
##
[​
](#v2-13-0)
v2.13.0
###
[​
](#oauth-token-key-management)
OAuth Token Key Management
The OAuth proxy now issues its own JWT tokens. For production, provide explicit keys:
```
`auth = GitHubProvider(
client\_id=os.environ["GITHUB\_CLIENT\_ID"],
client\_secret=os.environ["GITHUB\_CLIENT\_SECRET"],
base\_url="https://your-server.com",
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
client\_storage=RedisStore(host="redis.example.com"),
)
`
```
See [OAuth Token Security](/deployment/http#oauth-token-security) for details.