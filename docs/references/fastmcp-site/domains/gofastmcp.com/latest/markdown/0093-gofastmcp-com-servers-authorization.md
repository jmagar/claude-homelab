Authorization - FastMCP
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
Authentication
* [
Authorization
NEW
](/servers/authorization)
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
Authorization controls what authenticated users can do with your FastMCP server. While [authentication](/servers/auth/authentication) verifies identity (who you are), authorization determines access (what you can do). FastMCP provides a callable-based authorization system that works at both the component level and globally via middleware.
The authorization model centers on a simple concept: callable functions that receive context about the current request and return `True` to allow access or `False` to deny it. Multiple checks combine with AND logic, meaning all checks must pass for access to be granted.
Authorization relies on OAuth tokens which are only available with HTTP transports (SSE, Streamable HTTP). In STDIO mode, there’s no OAuth mechanism, so `get\_access\_token()` returns `None` and all auth checks are skipped.
When an `AuthProvider` is configured, all requests to the MCP endpoint must carry a valid token—unauthenticated requests are rejected at the transport level before any auth checks run. Authorization checks therefore differentiate between authenticated users based on their scopes and claims, not between authenticated and unauthenticated users.
##
[​
](#auth-checks)
Auth Checks
An auth check is any callable that accepts an `AuthContext` and returns a boolean. Auth checks can be synchronous or asynchronous, so checks that need to perform async operations (like reading server state or calling external services) work naturally.
```
`from fastmcp.server.auth import AuthContext
def my\_custom\_check(ctx: AuthContext) -\> bool:
# ctx.token is AccessToken | None
# ctx.component is the Tool, Resource, or Prompt being accessed
return ctx.token is not None and "special" in ctx.token.scopes
`
```
FastMCP provides two built-in auth checks that cover common authorization patterns.
###
[​
](#require_scopes)
require\_scopes
Scope-based authorization checks that the token contains all specified OAuth scopes. When multiple scopes are provided, all must be present (AND logic).
```
`from fastmcp import FastMCP
from fastmcp.server.auth import require\_scopes
mcp = FastMCP("Scoped Server")
@mcp.tool(auth=require\_scopes("admin"))
def admin\_operation() -\> str:
"""Requires the 'admin' scope."""
return "Admin action completed"
@mcp.tool(auth=require\_scopes("read", "write"))
def read\_write\_operation() -\> str:
"""Requires both 'read' AND 'write' scopes."""
return "Read/write action completed"
`
```
###
[​
](#restrict_tag)
restrict\_tag
Tag-based restrictions apply scope requirements conditionally. If a component has the specified tag, the token must have the required scopes. Components without the tag are unaffected.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import restrict\_tag
from fastmcp.server.middleware import AuthMiddleware
mcp = FastMCP(
"Tagged Server",
middleware=[
AuthMiddleware(auth=restrict\_tag("admin", scopes=["admin"]))
]
)
@mcp.tool(tags={"admin"})
def admin\_tool() -\> str:
"""Tagged 'admin', so requires 'admin' scope."""
return "Admin only"
@mcp.tool(tags={"public"})
def public\_tool() -\> str:
"""Not tagged 'admin', so no scope required by the restriction."""
return "Anyone can access"
`
```
###
[​
](#combining-checks)
Combining Checks
Multiple auth checks can be combined by passing a list. All checks must pass for authorization to succeed (AND logic).
```
`from fastmcp import FastMCP
from fastmcp.server.auth import require\_scopes
mcp = FastMCP("Combined Auth Server")
@mcp.tool(auth=[require\_scopes("admin"), require\_scopes("write")])
def secure\_admin\_action() -\> str:
"""Requires both 'admin' AND 'write' scopes."""
return "Secure admin action"
`
```
###
[​
](#custom-auth-checks)
Custom Auth Checks
Any callable that accepts `AuthContext` and returns `bool` can serve as an auth check. This enables authorization logic based on token claims, component metadata, or external systems.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import AuthContext
mcp = FastMCP("Custom Auth Server")
def require\_premium\_user(ctx: AuthContext) -\> bool:
"""Check for premium user status in token claims."""
if ctx.token is None:
return False
return ctx.token.claims.get("premium", False) is True
def require\_access\_level(minimum\_level: int):
"""Factory function for level-based authorization."""
def check(ctx: AuthContext) -\> bool:
if ctx.token is None:
return False
user\_level = ctx.token.claims.get("level", 0)
return user\_level \>= minimum\_level
return check
@mcp.tool(auth=require\_premium\_user)
def premium\_feature() -\> str:
"""Only for premium users."""
return "Premium content"
@mcp.tool(auth=require\_access\_level(5))
def advanced\_feature() -\> str:
"""Requires access level 5 or higher."""
return "Advanced feature"
`
```
###
[​
](#async-auth-checks)
Async Auth Checks
Auth checks can be `async` functions, which is useful when the authorization decision depends on asynchronous operations like reading server state or querying external services.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import AuthContext
mcp = FastMCP("Async Auth Server")
async def check\_user\_permissions(ctx: AuthContext) -\> bool:
"""Async auth check that reads server state."""
if ctx.token is None:
return False
user\_id = ctx.token.claims.get("sub")
# Async operations work naturally in auth checks
permissions = await fetch\_user\_permissions(user\_id)
return "admin" in permissions
@mcp.tool(auth=check\_user\_permissions)
def admin\_tool() -\> str:
return "Admin action completed"
`
```
Sync and async checks can be freely combined in a list — each check is handled according to its type.
###
[​
](#error-handling)
Error Handling
Auth checks can raise exceptions for explicit denial with custom messages:
* **`AuthorizationError`**: Propagates with its custom message, useful for explaining why access was denied
* **Other exceptions**: Masked for security (logged internally, treated as denial)
```
`from fastmcp.server.auth import AuthContext
from fastmcp.exceptions import AuthorizationError
def require\_verified\_email(ctx: AuthContext) -\> bool:
"""Require verified email with explicit denial message."""
if ctx.token is None:
raise AuthorizationError("Authentication required")
if not ctx.token.claims.get("email\_verified"):
raise AuthorizationError("Email verification required")
return True
`
```
##
[​
](#component-level-authorization)
Component-Level Authorization
The `auth` parameter on decorators controls visibility and access for individual components. When auth checks fail for the current request, the component is hidden from list responses and direct access returns not-found.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import require\_scopes
mcp = FastMCP("Component Auth Server")
@mcp.tool(auth=require\_scopes("write"))
def write\_tool() -\> str:
"""Only visible to users with 'write' scope."""
return "Written"
@mcp.resource("secret://data", auth=require\_scopes("read"))
def secret\_resource() -\> str:
"""Only visible to users with 'read' scope."""
return "Secret data"
@mcp.prompt(auth=require\_scopes("admin"))
def admin\_prompt() -\> str:
"""Only visible to users with 'admin' scope."""
return "Admin prompt content"
`
```
Component-level `auth` controls both visibility (list filtering) and access (direct lookups return not-found for unauthorized requests). Additionally use `AuthMiddleware` to apply server-wide authorization rules and get explicit `AuthorizationError` responses on unauthorized execution attempts.
##
[​
](#server-level-authorization)
Server-Level Authorization
For server-wide authorization enforcement, use `AuthMiddleware`. This middleware applies auth checks globally to all components—filtering list responses and blocking unauthorized execution with explicit `AuthorizationError` responses.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import require\_scopes
from fastmcp.server.middleware import AuthMiddleware
mcp = FastMCP(
"Enforced Auth Server",
middleware=[AuthMiddleware(auth=require\_scopes("api"))]
)
@mcp.tool
def any\_tool() -\> str:
"""Requires 'api' scope to see AND call."""
return "Protected"
`
```
###
[​
](#component-auth-+-middleware)
Component Auth + Middleware
Component-level `auth` and `AuthMiddleware` work together as complementary layers. The middleware applies server-wide rules to all components, while component-level auth adds per-component requirements. Both layers are checked—all checks must pass.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import require\_scopes, restrict\_tag
from fastmcp.server.middleware import AuthMiddleware
mcp = FastMCP(
"Layered Auth Server",
middleware=[
AuthMiddleware(auth=restrict\_tag("admin", scopes=["admin"]))
]
)
# Requires "write" scope (component-level)
# Also requires "admin" scope if tagged "admin" (middleware-level)
@mcp.tool(auth=require\_scopes("write"), tags={"admin"})
def admin\_write() -\> str:
"""Requires both 'write' AND 'admin' scopes."""
return "Admin write"
# Requires "write" scope (component-level only)
@mcp.tool(auth=require\_scopes("write"))
def user\_write() -\> str:
"""Requires 'write' scope."""
return "User write"
`
```
###
[​
](#tag-based-global-authorization)
Tag-Based Global Authorization
A common pattern uses `restrict\_tag` with `AuthMiddleware` to apply scope requirements based on component tags.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import restrict\_tag
from fastmcp.server.middleware import AuthMiddleware
mcp = FastMCP(
"Tag-Based Auth Server",
middleware=[
AuthMiddleware(auth=restrict\_tag("admin", scopes=["admin"])),
AuthMiddleware(auth=restrict\_tag("write", scopes=["write"])),
]
)
@mcp.tool(tags={"admin"})
def delete\_all\_data() -\> str:
"""Requires 'admin' scope."""
return "Deleted"
@mcp.tool(tags={"write"})
def update\_record(id: str, data: str) -\> str:
"""Requires 'write' scope."""
return f"Updated {id}"
@mcp.tool
def read\_record(id: str) -\> str:
"""No tag restrictions, accessible to all."""
return f"Record {id}"
`
```
##
[​
](#accessing-tokens-in-tools)
Accessing Tokens in Tools
Tools can access the current authentication token using `get\_access\_token()` from `fastmcp.server.dependencies`. This enables tools to make decisions based on user identity or permissions beyond simple authorization checks.
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_access\_token
mcp = FastMCP("Token Access Server")
@mcp.tool
def personalized\_greeting() -\> str:
"""Greet the user based on their token claims."""
token = get\_access\_token()
if token is None:
return "Hello, guest!"
name = token.claims.get("name", "user")
return f"Hello, {name}!"
@mcp.tool
def user\_dashboard() -\> dict:
"""Return user-specific data based on token."""
token = get\_access\_token()
if token is None:
return {"error": "Not authenticated"}
return {
"client\_id": token.client\_id,
"scopes": token.scopes,
"claims": token.claims,
}
`
```
##
[​
](#reference)
Reference
###
[​
](#accesstoken)
AccessToken
The `AccessToken` object contains information extracted from the OAuth token.
|Property|Type|Description|
|`token`|`str`|The raw token string|
|`client\_id`|`str | None`|OAuth client identifier|
|`scopes`|`list[str]`|Granted OAuth scopes|
|`expires\_at`|`datetime | None`|Token expiration time|
|`claims`|`dict[str, Any]`|All JWT claims or custom token data|
###
[​
](#authcontext)
AuthContext
The `AuthContext` dataclass is passed to all auth check functions.
|Property|Type|Description|
|`token`|`AccessToken | None`|Current access token, or `None` if unauthenticated|
|`component`|`Tool | Resource | Prompt`|The component being accessed|
Access to the component object enables authorization decisions based on metadata like tags, name, or custom properties.
```
`from fastmcp.server.auth import AuthContext
def require\_matching\_tag(ctx: AuthContext) -\> bool:
"""Require a scope matching each of the component's tags."""
if ctx.token is None:
return False
user\_scopes = set(ctx.token.scopes)
return ctx.component.tags.issubset(user\_scopes)
`
```
###
[​
](#imports)
Imports
```
`from fastmcp.server.auth import (
AccessToken, # Token with .token, .client\_id, .scopes, .expires\_at, .claims
AuthContext, # Context with .token, .component
AuthCheck, # Type alias: sync or async Callable[[AuthContext], bool]
require\_scopes, # Built-in: requires specific scopes
restrict\_tag, # Built-in: tag-based scope requirements
run\_auth\_checks, # Utility: run checks with AND logic
)
from fastmcp.server.middleware import AuthMiddleware
`
```