Dependency Injection - FastMCP
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
FastMCP uses dependency injection to provide runtime values to your tools, resources, and prompts. Instead of passing context through every layer of your code, you declare what you need as parameter defaults—FastMCP resolves them automatically when your function runs.
The dependency injection system is powered by [Docket](https://github.com/chrisguidry/docket) and its dependency system [uncalled-for](https://github.com/chrisguidry/uncalled-for). Core DI features like `Depends()` and `CurrentContext()` work without installing Docket. For background tasks and advanced task-related dependencies, install `fastmcp[tasks]`. For comprehensive coverage of dependency patterns, see the [Docket dependency documentation](https://docket.lol/en/latest/dependency-injection/).
Dependency parameters are automatically excluded from the MCP schema—clients never see them as callable parameters. This separation keeps your function signatures clean while giving you access to the runtime context you need.
##
[​
](#how-dependency-injection-works)
How Dependency Injection Works
Dependency injection in FastMCP follows a simple pattern: declare a parameter with a recognized type annotation or a dependency default value, and FastMCP injects the resolved value at runtime.
```
`from fastmcp import FastMCP
from fastmcp.server.context import Context
mcp = FastMCP("Demo")
@mcp.tool
async def my\_tool(query: str, ctx: Context) -\> str:
await ctx.info(f"Processing: {query}")
return f"Results for: {query}"
`
```
When a client calls `my\_tool`, they only see `query` as a parameter. The `ctx` parameter is injected automatically because it has a `Context` type annotation—FastMCP recognizes this and provides the active context for the request.
This works identically for tools, resources, resource templates, and prompts.
###
[​
](#explicit-dependencies-with-currentcontext)
Explicit Dependencies with CurrentContext
For more explicit code, you can use `CurrentContext()` as a default value instead of relying on the type annotation:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentContext
from fastmcp.server.context import Context
mcp = FastMCP("Demo")
@mcp.tool
async def my\_tool(query: str, ctx: Context = CurrentContext()) -\> str:
await ctx.info(f"Processing: {query}")
return f"Results for: {query}"
`
```
Both approaches work identically. The type-annotation approach is more concise; the explicit `CurrentContext()` approach makes the dependency injection visible in the signature.
##
[​
](#built-in-dependencies)
Built-in Dependencies
###
[​
](#mcp-context)
MCP Context
The MCP Context provides logging, progress reporting, resource access, and other request-scoped operations. See [MCP Context](/servers/context) for the full API.
**Dependency injection:** Use a `Context` type annotation (FastMCP injects automatically) or `CurrentContext()`:
```
`from fastmcp import FastMCP
from fastmcp.server.context import Context
mcp = FastMCP("Demo")
@mcp.tool
async def process\_data(data: str, ctx: Context) -\> str:
await ctx.info(f"Processing: {data}")
return "Done"
# Or explicitly with CurrentContext()
from fastmcp.dependencies import CurrentContext
@mcp.tool
async def process\_data(data: str, ctx: Context = CurrentContext()) -\> str:
...
`
```
**Function:** Use `get\_context()` in helper functions or middleware:
```
`from fastmcp.server.dependencies import get\_context
async def log\_something(message: str):
ctx = get\_context()
await ctx.info(message)
`
```
###
[​
](#server-instance)
Server Instance
Access the FastMCP server instance for introspection or server-level configuration.
**Dependency injection:** Use `CurrentFastMCP()`:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentFastMCP
mcp = FastMCP("Demo")
@mcp.tool
async def server\_info(server: FastMCP = CurrentFastMCP()) -\> str:
return f"Server: {server.name}"
`
```
**Function:** Use `get\_server()`:
```
`from fastmcp.server.dependencies import get\_server
def get\_server\_name() -\> str:
return get\_server().name
`
```
###
[​
](#http-request)
HTTP Request
Access the Starlette Request when running over HTTP transports (SSE or Streamable HTTP).
**Dependency injection:** Use `CurrentRequest()`:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentRequest
from starlette.requests import Request
mcp = FastMCP("Demo")
@mcp.tool
async def client\_info(request: Request = CurrentRequest()) -\> dict:
return {
"user\_agent": request.headers.get("user-agent", "Unknown"),
"client\_ip": request.client.host if request.client else "Unknown",
}
`
```
**Function:** Use `get\_http\_request()`:
```
`from fastmcp.server.dependencies import get\_http\_request
def get\_client\_ip() -\> str:
request = get\_http\_request()
return request.client.host if request.client else "Unknown"
`
```
Both raise `RuntimeError` when called outside an HTTP context (e.g., STDIO transport).
For background tasks created from an HTTP request, FastMCP restores a minimal request
backed by the originating request’s snapshotted headers. Use HTTP Headers if you need
graceful fallback.
###
[​
](#http-headers)
HTTP Headers
Access HTTP headers with graceful fallback. When a background task originates from an
HTTP request, FastMCP restores the originating headers inside the worker. When no HTTP
request is available, this returns an empty dictionary, making it safe for code that
might run over any transport.
**Dependency injection:** Use `CurrentHeaders()`:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentHeaders
mcp = FastMCP("Demo")
@mcp.tool
async def get\_auth\_type(headers: dict = CurrentHeaders()) -\> str:
auth = headers.get("authorization", "")
return "Bearer" if auth.startswith("Bearer ") else "None"
`
```
**Function:** Use `get\_http\_headers()`:
```
`from fastmcp.server.dependencies import get\_http\_headers
def get\_user\_agent() -\> str:
headers = get\_http\_headers()
return headers.get("user-agent", "Unknown")
`
```
By default, problematic headers like `host` and `content-length` are excluded. Use `get\_http\_headers(include\_all=True)` to include all headers.
###
[​
](#access-token)
Access Token
Access the authenticated user’s token when your server uses authentication.
**Dependency injection:** Use `CurrentAccessToken()` (raises if not authenticated):
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentAccessToken
from fastmcp.server.auth import AccessToken
mcp = FastMCP("Demo")
@mcp.tool
async def get\_user\_id(token: AccessToken = CurrentAccessToken()) -\> str:
return token.claims.get("sub", "unknown")
`
```
**Function:** Use `get\_access\_token()` (returns `None` if not authenticated):
```
`from fastmcp.server.dependencies import get\_access\_token
@mcp.tool
async def get\_user\_info() -\> dict:
token = get\_access\_token()
if token is None:
return {"authenticated": False}
return {"authenticated": True, "user": token.claims.get("sub")}
`
```
The `AccessToken` object provides:
* **`client\_id`**: The OAuth client identifier
* **`scopes`**: List of granted permission scopes
* **`expires\_at`**: Token expiration timestamp (if available)
* **`claims`**: Dictionary of all token claims (JWT claims or provider-specific data)
###
[​
](#token-claims)
Token Claims
When you need just one specific value from the token—like a user ID or tenant identifier—`TokenClaim()` extracts it directly without needing the full token object.
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import TokenClaim
mcp = FastMCP("Demo")
@mcp.tool
async def add\_expense(
amount: float,
user\_id: str = TokenClaim("oid"), # Azure object ID
) -\> dict:
await db.insert({"user\_id": user\_id, "amount": amount})
return {"status": "created", "user\_id": user\_id}
`
```
`TokenClaim()` raises a `RuntimeError` if the claim doesn’t exist, listing available claims to help with debugging.
Common claims vary by identity provider:
|Provider|User ID Claim|Email Claim|Name Claim|
|Azure/Entra|`oid`|`email`|`name`|
|GitHub|`sub`|`email`|`name`|
|Google|`sub`|`email`|`name`|
|Auth0|`sub`|`email`|`name`|
###
[​
](#background-task-dependencies)
Background Task Dependencies
For background task execution, FastMCP provides dependencies that integrate with [Docket](https://github.com/chrisguidry/docket). These require installing `fastmcp[tasks]`.
```
`from fastmcp import FastMCP
from fastmcp.dependencies import CurrentDocket, CurrentWorker, Progress
mcp = FastMCP("Task Demo")
@mcp.tool(task=True)
async def long\_running\_task(
data: str,
docket=CurrentDocket(),
worker=CurrentWorker(),
progress=Progress(),
) -\> str:
await progress.set\_total(100)
for i in range(100):
# Process chunk...
await progress.increment()
await progress.set\_message(f"Processing chunk {i + 1}")
return "Complete"
`
```
* **`CurrentDocket()`**: Access the Docket instance for scheduling additional background work
* **`CurrentWorker()`**: Access the worker processing tasks (name, concurrency settings)
* **`Progress()`**: Track task progress with atomic updates
Task dependencies require `pip install 'fastmcp[tasks]'`. They’re only available within task-enabled components (`task=True`). For comprehensive task patterns, see the [Docket documentation](https://chrisguidry.github.io/docket/dependencies/).
##
[​
](#custom-dependencies)
Custom Dependencies
Beyond the built-in dependencies, you can create your own to inject configuration, database connections, API clients, or any other values your functions need.
###
[​
](#using-depends)
Using Depends()
The `Depends()` function wraps any callable and injects its return value. This works with synchronous functions, async functions, and async context managers.
```
`from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP("Custom Deps Demo")
def get\_config() -\> dict:
return {"api\_url": "https://api.example.com", "timeout": 30}
async def get\_user\_id() -\> int:
# Could fetch from database, external service, etc.
return 42
@mcp.tool
async def fetch\_data(
query: str,
config: dict = Depends(get\_config),
user\_id: int = Depends(get\_user\_id),
) -\> str:
return f"User {user\_id} fetching '{query}' from {config['api\_url']}"
`
```
###
[​
](#caching)
Caching
Dependencies are cached per-request. If multiple parameters use the same dependency, or if nested dependencies share a common dependency, it’s resolved once and the same instance is reused.
```
`from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP("Caching Demo")
def get\_db\_connection():
print("Connecting to database...") # Only printed once per request
return {"connection": "active"}
def get\_user\_repo(db=Depends(get\_db\_connection)):
return {"db": db, "type": "user"}
def get\_order\_repo(db=Depends(get\_db\_connection)):
return {"db": db, "type": "order"}
@mcp.tool
async def process\_order(
order\_id: str,
users=Depends(get\_user\_repo),
orders=Depends(get\_order\_repo),
) -\> str:
# Both repos share the same db connection
return f"Processed order {order\_id}"
`
```
###
[​
](#resource-management)
Resource Management
For dependencies that need cleanup—database connections, file handles, HTTP clients—use an async context manager. The cleanup code runs after your function completes, even if an error occurs.
```
`from contextlib import asynccontextmanager
from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP("Resource Demo")
@asynccontextmanager
async def get\_database():
db = await connect\_to\_database()
try:
yield db
finally:
await db.close()
@mcp.tool
async def query\_users(sql: str, db=Depends(get\_database)) -\> list:
return await db.execute(sql)
`
```
###
[​
](#nested-dependencies)
Nested Dependencies
Dependencies can depend on other dependencies. FastMCP resolves them in the correct order and applies caching across the dependency tree.
```
`from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP("Nested Demo")
def get\_base\_url() -\> str:
return "https://api.example.com"
def get\_api\_client(base\_url: str = Depends(get\_base\_url)) -\> dict:
return {"base\_url": base\_url, "version": "v1"}
@mcp.tool
async def call\_api(endpoint: str, client: dict = Depends(get\_api\_client)) -\> str:
return f"Calling {client['base\_url']}/{client['version']}/{endpoint}"
`
```
For advanced dependency patterns—like `TaskArgument()` for accessing task parameters, or custom `Dependency` subclasses—see the [Docket dependency documentation](https://chrisguidry.github.io/docket/dependencies/).