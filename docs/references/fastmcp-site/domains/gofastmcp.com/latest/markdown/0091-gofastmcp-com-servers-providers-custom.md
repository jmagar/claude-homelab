Custom Providers - FastMCP
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
Custom providers let you source components from anywhere - databases, APIs, configuration systems, or dynamic runtime logic. If you can write Python code to fetch or generate a component, you can wrap it in a provider.
##
[​
](#when-to-build-custom)
When to Build Custom
The built-in providers handle common cases: decorators (`LocalProvider`), composition (`FastMCPProvider`), and proxying (`ProxyProvider`). Build a custom provider when your components come from somewhere else:
* **Database-backed tools**: Admin users define tools in a database, and your server exposes them dynamically
* **API-backed resources**: Resources that fetch content from external services on demand
* **Configuration-driven components**: Components loaded from YAML/JSON config files at startup
* **Multi-tenant systems**: Different users see different tools based on their permissions
* **Plugin systems**: Third-party code registers components at runtime
##
[​
](#providers-vs-middleware)
Providers vs Middleware
Both providers and [middleware](/servers/middleware) can influence what components a client sees, but they work at different levels.
**Providers** are objects that source components. They make it easy to reason about where tools, resources, and prompts come from - a database, another server, an API.
**Middleware** intercepts individual requests. It’s well-suited for request-specific decisions like logging, rate limiting, or authentication.
You *could* use middleware to dynamically add tools based on request context. But it’s often cleaner to have a provider source all possible tools, then use middleware or [visibility controls](/servers/visibility) to filter what each request can see. This separation makes it easier to reason about how components are sourced and how they interact with other server machinery.
##
[​
](#the-provider-interface)
The Provider Interface
A provider implements protected `\_list\_\*` methods that return available components. The public `list\_\*` methods handle transforms automatically - you override the underscore-prefixed versions:
```
`from collections.abc import Sequence
from fastmcp.server.providers import Provider
from fastmcp.tools import Tool
from fastmcp.resources import Resource
from fastmcp.prompts import Prompt
class MyProvider(Provider):
async def \_list\_tools(self) -\> Sequence[Tool]:
"""Return all tools this provider offers."""
return []
async def \_list\_resources(self) -\> Sequence[Resource]:
"""Return all resources this provider offers."""
return []
async def \_list\_prompts(self) -\> Sequence[Prompt]:
"""Return all prompts this provider offers."""
return []
`
```
You only need to implement the methods for component types you provide. The base class returns empty sequences by default.
The `\_get\_\*` methods (`\_get\_tool`, `\_get\_resource`, `\_get\_prompt`) have default implementations that search through the list results. Override them only if you can fetch individual components more efficiently than iterating the full list.
##
[​
](#what-providers-return)
What Providers Return
Providers return component objects that are ready to use. When a client calls a tool, FastMCP invokes the tool’s function - your provider isn’t involved in execution. This means the `Tool`, `Resource`, or `Prompt` you return must actually work.
The easiest way to create components is from functions:
```
`from fastmcp.tools import Tool
def add(a: int, b: int) -\> int:
"""Add two numbers."""
return a + b
tool = Tool.from\_function(add)
`
```
The function’s type hints become the input schema, and the docstring becomes the description. You can override these:
```
`tool = Tool.from\_function(
add,
name="calculator\_add",
description="Add two integers together"
)
`
```
Similar `from\_function` methods exist for `Resource` and `Prompt`.
##
[​
](#registering-providers)
Registering Providers
Add providers when creating the server:
```
`mcp = FastMCP(
"MyServer",
providers=[
DatabaseProvider(db\_url),
ConfigProvider(config\_path),
]
)
`
```
Or add them after creation:
```
`mcp = FastMCP("MyServer")
mcp.add\_provider(DatabaseProvider(db\_url))
`
```
##
[​
](#a-simple-provider)
A Simple Provider
Here’s a minimal provider that serves tools from a dictionary:
```
`from collections.abc import Callable, Sequence
from fastmcp import FastMCP
from fastmcp.server.providers import Provider
from fastmcp.tools import Tool
class DictProvider(Provider):
def \_\_init\_\_(self, tools: dict[str, Callable]):
super().\_\_init\_\_()
self.\_tools = [
Tool.from\_function(fn, name=name)
for name, fn in tools.items()
]
async def \_list\_tools(self) -\> Sequence[Tool]:
return self.\_tools
`
```
Use it like this:
```
`def add(a: int, b: int) -\> int:
"""Add two numbers."""
return a + b
def multiply(a: int, b: int) -\> int:
"""Multiply two numbers."""
return a \* b
mcp = FastMCP("Calculator", providers=[
DictProvider({"add": add, "multiply": multiply})
])
`
```
##
[​
](#lifecycle-management)
Lifecycle Management
Providers often need to set up connections when the server starts and clean them up when it stops. Override the `lifespan` method:
```
`from contextlib import asynccontextmanager
from collections.abc import AsyncIterator, Sequence
class DatabaseProvider(Provider):
def \_\_init\_\_(self, db\_url: str):
super().\_\_init\_\_()
self.db\_url = db\_url
self.db = None
@asynccontextmanager
async def lifespan(self) -\> AsyncIterator[None]:
self.db = await connect\_database(self.db\_url)
try:
yield
finally:
await self.db.close()
async def \_list\_tools(self) -\> Sequence[Tool]:
rows = await self.db.fetch("SELECT \* FROM tools")
return [self.\_make\_tool(row) for row in rows]
`
```
FastMCP calls your provider’s `lifespan` during server startup and shutdown. The connection is available to your methods while the server runs.
##
[​
](#full-example-api-backed-resources)
Full Example: API-Backed Resources
Here’s a complete provider that fetches resources from an external REST API:
```
`from contextlib import asynccontextmanager
from collections.abc import AsyncIterator, Sequence
from fastmcp.server.providers import Provider
from fastmcp.resources import Resource
import httpx
class ApiResourceProvider(Provider):
"""Provides resources backed by an external API."""
def \_\_init\_\_(self, base\_url: str, api\_key: str):
super().\_\_init\_\_()
self.base\_url = base\_url
self.api\_key = api\_key
self.client = None
@asynccontextmanager
async def lifespan(self) -\> AsyncIterator[None]:
self.client = httpx.AsyncClient(
base\_url=self.base\_url,
headers={"Authorization": f"Bearer {self.api\_key}"}
)
try:
yield
finally:
await self.client.aclose()
async def \_list\_resources(self) -\> Sequence[Resource]:
response = await self.client.get("/resources")
response.raise\_for\_status()
return [
self.\_make\_resource(item)
for item in response.json()["items"]
]
def \_make\_resource(self, data: dict) -\> Resource:
resource\_id = data["id"]
async def read\_content() -\> str:
response = await self.client.get(
f"/resources/{resource\_id}/content"
)
return response.text
return Resource.from\_function(
read\_content,
uri=f"api://resources/{resource\_id}",
name=data["name"],
description=data.get("description", ""),
mime\_type=data.get("mime\_type", "text/plain")
)
`
```
Register it like any other provider:
```
`from fastmcp import FastMCP
mcp = FastMCP("API Resources", providers=[
ApiResourceProvider("https://api.example.com", "my-api-key")
])
`
```