Lifespans - FastMCP
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
New in version `3.0.0`
Lifespans let you run code once when the server starts and clean up when it stops. Unlike per-session handlers, lifespans run exactly once regardless of how many clients connect.
##
[​
](#basic-usage)
Basic Usage
Use the `@lifespan` decorator to define a lifespan:
```
`from fastmcp import FastMCP
from fastmcp.server.lifespan import lifespan
@lifespan
async def app\_lifespan(server):
# Setup: runs once when server starts
print("Starting up...")
try:
yield {"started\_at": "2024-01-01"}
finally:
# Teardown: runs when server stops
print("Shutting down...")
mcp = FastMCP("MyServer", lifespan=app\_lifespan)
`
```
The dict you yield becomes the **lifespan context**, accessible from tools.
Always use `try/finally` for cleanup code to ensure it runs even if the server is cancelled.
##
[​
](#accessing-lifespan-context)
Accessing Lifespan Context
Access the lifespan context in tools via `ctx.lifespan\_context`:
```
`from fastmcp import FastMCP, Context
from fastmcp.server.lifespan import lifespan
@lifespan
async def app\_lifespan(server):
# Initialize shared state
data = {"users": ["alice", "bob"]}
yield {"data": data}
mcp = FastMCP("MyServer", lifespan=app\_lifespan)
@mcp.tool
def list\_users(ctx: Context) -\> list[str]:
data = ctx.lifespan\_context["data"]
return data["users"]
`
```
##
[​
](#composing-lifespans)
Composing Lifespans
Compose multiple lifespans with the `|` operator:
```
`from fastmcp import FastMCP
from fastmcp.server.lifespan import lifespan
@lifespan
async def config\_lifespan(server):
config = {"debug": True, "version": "1.0"}
yield {"config": config}
@lifespan
async def data\_lifespan(server):
data = {"items": []}
yield {"data": data}
# Compose with |
mcp = FastMCP("MyServer", lifespan=config\_lifespan | data\_lifespan)
`
```
Composed lifespans:
* Enter in order (left to right)
* Exit in reverse order (right to left)
* Merge their context dicts (later values overwrite earlier on conflict)
##
[​
](#backwards-compatibility)
Backwards Compatibility
Existing `@asynccontextmanager` lifespans still work when passed directly to FastMCP:
```
`from contextlib import asynccontextmanager
from fastmcp import FastMCP
@asynccontextmanager
async def legacy\_lifespan(server):
yield {"key": "value"}
mcp = FastMCP("MyServer", lifespan=legacy\_lifespan)
`
```
To compose an `@asynccontextmanager` function with `@lifespan` functions, wrap it with `ContextManagerLifespan`:
```
`from contextlib import asynccontextmanager
from fastmcp.server.lifespan import lifespan, ContextManagerLifespan
@asynccontextmanager
async def legacy\_lifespan(server):
yield {"legacy": True}
@lifespan
async def new\_lifespan(server):
yield {"new": True}
# Wrap the legacy lifespan explicitly for composition
combined = ContextManagerLifespan(legacy\_lifespan) | new\_lifespan
`
```
##
[​
](#with-fastapi)
With FastAPI
When mounting FastMCP into FastAPI, use `combine\_lifespans` to run both your app’s lifespan and the MCP server’s lifespan:
```
`from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastmcp import FastMCP
from fastmcp.utilities.lifespan import combine\_lifespans
@asynccontextmanager
async def app\_lifespan(app):
print("FastAPI starting...")
yield
print("FastAPI shutting down...")
mcp = FastMCP("Tools")
mcp\_app = mcp.http\_app()
app = FastAPI(lifespan=combine\_lifespans(app\_lifespan, mcp\_app.lifespan))
app.mount("/mcp", mcp\_app)
`
```
See the [FastAPI integration guide](/integrations/fastapi#combining-lifespans) for full details.