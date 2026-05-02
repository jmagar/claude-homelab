Upgrading from the MCP SDK - FastMCP
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
If your server starts with `from mcp.server.fastmcp import FastMCP`, you’re using FastMCP 1.0 — the version bundled with v1 of the `mcp` package. Upgrading to the standalone FastMCP framework is easy. **For most servers, it’s a single import change.**
```
`# Before
from mcp.server.fastmcp import FastMCP
# After
from fastmcp import FastMCP
`
```
That’s it. Your `@mcp.tool`, `@mcp.resource`, and `@mcp.prompt` decorators, your `mcp.run()` call, and the rest of your server code all work as-is.
**Why upgrade?** FastMCP 1.0 pioneered the Pythonic MCP server experience, and we’re proud it was bundled into the `mcp` package. The standalone FastMCP project has since grown into a full framework for taking MCP servers from prototype to production — with composition, middleware, proxy servers, authentication, and much more. Upgrading gives you access to all of that, plus ongoing updates and fixes.
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
FastMCP includes the `mcp` package as a dependency, so you don’t lose access to anything. Update your import, run your server, and if your tools work, you’re done.
Copy this prompt into any LLM along with your server code to get automated upgrade guidance.
Copy prompt
##
[​
](#what-might-need-updating)
What Might Need Updating
Most servers need nothing beyond the import change. Skim the sections below to see if any apply.
###
[​
](#constructor-settings)
Constructor Settings
If you passed transport settings like `host` or `port` directly to `FastMCP()`, those now belong on `run()`. This keeps your server definition independent of how it’s deployed:
```
`# Before
mcp = FastMCP("my-server", host="0.0.0.0", port=8080)
mcp.run()
# After
mcp = FastMCP("my-server")
mcp.run(transport="http", host="0.0.0.0", port=8080)
`
```
If you pass the old kwargs, you’ll get a clear `TypeError` with a migration hint.
###
[​
](#prompts)
Prompts
If your prompt functions return `mcp.types.PromptMessage` objects or raw dicts with `role`/`content` keys, you’ll need to upgrade to FastMCP’s `Message` class. Or just return a plain string — it’s automatically wrapped as a user message. The MCP SDK’s bundled FastMCP 1.0 silently coerced dicts into messages; standalone FastMCP requires typed `Message` objects or strings.
```
`from fastmcp import FastMCP
mcp = FastMCP("prompts")
@mcp.prompt
def review(code: str) -\> str:
"""Review code for issues"""
return f"Please review this code:\\n\\n{code}"
`
```
For multi-turn prompts:
```
`from fastmcp.prompts import Message
@mcp.prompt
def debug(error: str) -\> list[Message]:
"""Start a debugging session"""
return [
Message(f"I'm seeing this error:\\n\\n{error}"),
Message("I'll help debug that. Can you share the relevant code?", role="assistant"),
]
`
```
###
[​
](#other-mcp-imports)
Other `mcp.\*` Imports
If your server imports directly from the `mcp` package — like `import mcp.types` or `from mcp.server.stdio import stdio\_server` — those still work. FastMCP includes `mcp` as a dependency, so nothing breaks.
Where FastMCP provides its own API for the same thing, it’s worth switching over:
|mcp Package|FastMCP Equivalent|
|`mcp.types.TextContent(type="text", text=str(x))`|Just return `x` from your tool|
|`mcp.types.ImageContent(...)`|`from fastmcp.utilities.types import Image`|
|`mcp.types.PromptMessage(...)`|`from fastmcp.prompts import Message`|
|`from mcp.server.stdio import stdio\_server`|Not needed — `mcp.run()` handles transport|
For anything without a FastMCP equivalent (e.g., specific protocol types you use directly), the `mcp.\*` import is fine to keep.
###
[​
](#decorated-functions)
Decorated Functions
In FastMCP 1.0, `@mcp.tool` returned a `FunctionTool` object. Now decorators return your original function unchanged — so decorated functions stay callable for testing, reuse, and composition:
```
`@mcp.tool
def greet(name: str) -\> str:
"""Greet someone"""
return f"Hello, {name}!"
# This works now — the function is still a regular function
assert greet("World") == "Hello, World!"
`
```
If you have code that accesses `.name`, `.description`, or other attributes on the decorated result, that will need updating. This is uncommon — most servers don’t interact with the tool object directly. If you need the old behavior temporarily, set `FASTMCP\_DECORATOR\_MODE=object` to restore it (this compatibility setting is itself deprecated and will be removed in a future release).
##
[​
](#verify-the-upgrade)
Verify the Upgrade
```
`# Install
pip install --upgrade fastmcp
# Check version
fastmcp version
# Run your server
python my\_server.py
`
```
You can also inspect your server’s registered components with the FastMCP CLI:
```
`fastmcp inspect my\_server.py
`
```
##
[​
](#looking-ahead)
Looking Ahead
The MCP ecosystem is evolving fast. Part of FastMCP’s job is to absorb that complexity on your behalf — as the protocol and its tooling grow, we do the work so your server code doesn’t have to change.