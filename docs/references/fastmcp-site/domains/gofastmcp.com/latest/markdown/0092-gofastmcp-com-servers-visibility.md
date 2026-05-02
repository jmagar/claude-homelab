Component Visibility - FastMCP
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
Components can be dynamically enabled or disabled at runtime. A disabled tool disappears from listings and cannot be called. This enables runtime access control, feature flags, and context-aware component exposure.
##
[​
](#component-visibility)
Component Visibility
Every FastMCP server provides `enable()` and `disable()` methods for controlling component availability.
###
[​
](#disabling-components)
Disabling Components
The `disable()` method marks components as disabled. Disabled components are filtered out from all client queries.
```
`from fastmcp import FastMCP
mcp = FastMCP("Server")
@mcp.tool(tags={"admin"})
def delete\_everything() -\> str:
"""Delete all data."""
return "Deleted"
@mcp.tool(tags={"admin"})
def reset\_system() -\> str:
"""Reset the system."""
return "Reset"
@mcp.tool
def get\_status() -\> str:
"""Get system status."""
return "OK"
# Disable admin tools
mcp.disable(tags={"admin"})
# Clients only see: get\_status
`
```
###
[​
](#enabling-components)
Enabling Components
The `enable()` method re-enables previously disabled components.
```
`# Re-enable admin tools
mcp.enable(tags={"admin"})
# Clients now see all three tools
`
```
##
[​
](#keys-and-tags)
Keys and Tags
Visibility filtering works with two identifiers: keys (for specific components) and tags (for groups).
###
[​
](#component-keys)
Component Keys
Every component has a unique key in the format `{type}:{identifier}`.
|Component|Key Format|Example|
|Tool|`tool:{name}`|`tool:delete\_everything`|
|Resource|`resource:{uri}`|`resource:data://config`|
|Template|`template:{uri}`|`template:file://{path}`|
|Prompt|`prompt:{name}`|`prompt:analyze`|
Use keys to target specific components.
```
`# Disable a specific tool
mcp.disable(keys={"tool:delete\_everything"})
# Disable multiple specific components
mcp.disable(keys={"tool:reset\_system", "resource:data://secrets"})
`
```
###
[​
](#tags)
Tags
Tags group components for bulk operations. Define tags when creating components, then filter by them.
```
`from fastmcp import FastMCP
mcp = FastMCP("Server")
@mcp.tool(tags={"public", "read"})
def get\_data() -\> str:
return "data"
@mcp.tool(tags={"admin", "write"})
def set\_data(value: str) -\> str:
return f"Set: {value}"
@mcp.tool(tags={"admin", "dangerous"})
def delete\_data() -\> str:
return "Deleted"
# Disable all admin tools
mcp.disable(tags={"admin"})
# Disable all dangerous tools (some overlap with admin)
mcp.disable(tags={"dangerous"})
`
```
A component is disabled if it has **any** of the disabled tags. The component doesn’t need all the tags; one match is enough.
###
[​
](#combining-keys-and-tags)
Combining Keys and Tags
You can specify both keys and tags in a single call. The filters combine additively.
```
`# Disable specific tools AND all dangerous-tagged components
mcp.disable(keys={"tool:debug\_info"}, tags={"dangerous"})
`
```
##
[​
](#allowlist-mode)
Allowlist Mode
By default, visibility filtering uses blocklist mode: everything is enabled unless explicitly disabled. The `only=True` parameter switches to allowlist mode, where **only** specified components are enabled.
```
`from fastmcp import FastMCP
mcp = FastMCP("Server")
@mcp.tool(tags={"safe"})
def read\_only\_operation() -\> str:
return "Read"
@mcp.tool(tags={"safe"})
def list\_items() -\> list[str]:
return ["a", "b", "c"]
@mcp.tool(tags={"dangerous"})
def delete\_all() -\> str:
return "Deleted"
@mcp.tool
def untagged\_tool() -\> str:
return "Untagged"
# Only enable safe tools - everything else is disabled
mcp.enable(tags={"safe"}, only=True)
# Clients see: read\_only\_operation, list\_items
# Disabled: delete\_all, untagged\_tool
`
```
Allowlist mode is useful for restrictive environments where you want to explicitly opt-in components rather than opt-out.
###
[​
](#allowlist-behavior)
Allowlist Behavior
When you call `enable(only=True)`:
1. Default visibility state switches to “disabled”
2. Previous allowlists are cleared
3. Only specified keys/tags become enabled
```
`# Start fresh - only enable these specific tools
mcp.enable(keys={"tool:safe\_read", "tool:safe\_write"}, only=True)
# Later, switch to a different allowlist
mcp.enable(tags={"production"}, only=True)
`
```
###
[​
](#ordering-and-overrides)
Ordering and Overrides
Later `enable()` and `disable()` calls override earlier ones. This lets you create broad rules with specific exceptions.
```
`mcp.enable(tags={"api"}, only=True) # Allow all api-tagged
mcp.disable(keys={"tool:api\_admin"}) # Later disable overrides for this tool
# api\_admin is disabled because the later disable() overrides the allowlist
`
```
You can always re-enable something that was disabled by adding another `enable()` call after it.
##
[​
](#server-vs-provider)
Server vs Provider
Visibility state operates at two levels: the server and individual providers.
###
[​
](#server-level)
Server-Level
Server-level visibility state applies to all components from all providers. When you call `mcp.enable()` or `mcp.disable()`, you’re filtering the final view that clients see.
```
`from fastmcp import FastMCP
main = FastMCP("Main")
main.mount(sub\_server, namespace="api")
@main.tool(tags={"internal"})
def local\_debug() -\> str:
return "Debug"
# Disable internal tools from ALL sources
main.disable(tags={"internal"})
`
```
###
[​
](#provider-level)
Provider-Level
Each provider can add its own visibility transforms. These run before server-level transforms, so the server can override provider-level disables.
```
`from fastmcp import FastMCP
from fastmcp.server.providers import LocalProvider
# Create provider with visibility control
admin\_tools = LocalProvider()
@admin\_tools.tool(tags={"admin"})
def admin\_action() -\> str:
return "Admin"
@admin\_tools.tool
def regular\_action() -\> str:
return "Regular"
# Disable at provider level
admin\_tools.disable(tags={"admin"})
# Server can override if needed
mcp = FastMCP("Server", providers=[admin\_tools])
mcp.enable(names={"admin\_action"}) # Re-enables despite provider disable
`
```
Provider-level transforms are useful for setting default visibility that servers can selectively override.
###
[​
](#layered-transforms)
Layered Transforms
Provider transforms run first, then server transforms. Later transforms override earlier ones, so the server has final say.
```
`from fastmcp import FastMCP
from fastmcp.server.providers import LocalProvider
provider = LocalProvider()
@provider.tool(tags={"feature", "beta"})
def new\_feature() -\> str:
return "New"
# Provider enables feature-tagged
provider.enable(tags={"feature"}, only=True)
# Server disables beta-tagged (runs after provider)
mcp = FastMCP("Server", providers=[provider])
mcp.disable(tags={"beta"})
# new\_feature is disabled (server's later disable overrides provider's enable)
`
```
##
[​
](#per-session-visibility)
Per-Session Visibility
Server-level visibility changes affect all connected clients simultaneously. When you need different clients to see different components, use per-session visibility instead.
Session visibility lets individual sessions customize their view of available components. When a tool calls `ctx.enable\_components()` or `ctx.disable\_components()`, those rules apply only to the current session. Other sessions continue to see the global defaults. This enables patterns like progressive disclosure, role-based access, and on-demand feature activation.
```
`from fastmcp import FastMCP
from fastmcp.server.context import Context
mcp = FastMCP("Session-Aware Server")
@mcp.tool(tags={"premium"})
def premium\_analysis(data: str) -\> str:
"""Advanced analysis available to premium users."""
return f"Premium analysis of: {data}"
@mcp.tool
async def unlock\_premium(ctx: Context) -\> str:
"""Unlock premium features for this session."""
await ctx.enable\_components(tags={"premium"})
return "Premium features unlocked"
@mcp.tool
async def reset\_features(ctx: Context) -\> str:
"""Reset to default feature set."""
await ctx.reset\_visibility()
return "Features reset to defaults"
# Premium tools are disabled globally by default
mcp.disable(tags={"premium"})
`
```
All sessions start with `premium\_analysis` hidden. When a session calls `unlock\_premium`, that session gains access to premium tools while other sessions remain unaffected. Calling `reset\_features` returns the session to the global defaults.
###
[​
](#how-session-rules-work)
How Session Rules Work
Session rules override global transforms. When listing components, FastMCP first applies global enable/disable rules, then applies session-specific rules on top. Rules within a session accumulate, and later rules override earlier ones for the same component.
```
`@mcp.tool
async def customize\_session(ctx: Context) -\> str:
# Enable finance tools for this session
await ctx.enable\_components(tags={"finance"})
# Also enable admin tools
await ctx.enable\_components(tags={"admin"})
# Later: disable a specific admin tool
await ctx.disable\_components(names={"dangerous\_admin\_tool"})
return "Session customized"
`
```
Each call adds a rule to the session. The `dangerous\_admin\_tool` ends up disabled because its disable rule was added after the admin enable rule.
###
[​
](#filter-criteria)
Filter Criteria
The session visibility methods accept the same filter criteria as `server.enable()` and `server.disable()`:
|Parameter|Description|
|`names`|Component names or URIs to match|
|`keys`|Component keys (e.g., `{"tool:my\_tool"}`)|
|`tags`|Tags to match (component must have at least one)|
|`version`|Version specification to match|
|`components`|Component types (`{"tool"}`, `{"resource"}`, `{"prompt"}`, `{"template"}`)|
|`match\_all`|If `True`, matches all components regardless of other criteria|
```
`from fastmcp.utilities.versions import VersionSpec
@mcp.tool
async def enable\_recent\_tools(ctx: Context) -\> str:
"""Enable only tools from version 2.0.0 or later."""
await ctx.enable\_components(
version=VersionSpec(gte="2.0.0"),
components={"tool"}
)
return "Recent tools enabled"
`
```
###
[​
](#automatic-notifications)
Automatic Notifications
When session visibility changes, FastMCP automatically sends notifications to that session. Clients receive `ToolListChangedNotification`, `ResourceListChangedNotification`, and `PromptListChangedNotification` so they can refresh their component lists. These notifications go only to the affected session.
When you specify the `components` parameter, FastMCP optimizes by sending only the relevant notifications:
```
`# Only sends ToolListChangedNotification
await ctx.enable\_components(tags={"finance"}, components={"tool"})
# Sends all three notifications (no components filter)
await ctx.enable\_components(tags={"finance"})
`
```
###
[​
](#namespace-activation-pattern)
Namespace Activation Pattern
A common pattern organizes tools into namespaces using tag prefixes, disables them globally, then provides activation tools that unlock namespaces on demand:
```
`from fastmcp import FastMCP
from fastmcp.server.context import Context
server = FastMCP("Multi-Domain Assistant")
# Finance namespace
@server.tool(tags={"namespace:finance"})
def analyze\_portfolio(symbols: list[str]) -\> str:
return f"Analysis for: {', '.join(symbols)}"
@server.tool(tags={"namespace:finance"})
def get\_market\_data(symbol: str) -\> dict:
return {"symbol": symbol, "price": 150.25}
# Admin namespace
@server.tool(tags={"namespace:admin"})
def list\_users() -\> list[str]:
return ["alice", "bob", "charlie"]
# Activation tools - always visible
@server.tool
async def activate\_finance(ctx: Context) -\> str:
await ctx.enable\_components(tags={"namespace:finance"})
return "Finance tools activated"
@server.tool
async def activate\_admin(ctx: Context) -\> str:
await ctx.enable\_components(tags={"namespace:admin"})
return "Admin tools activated"
@server.tool
async def deactivate\_all(ctx: Context) -\> str:
await ctx.reset\_visibility()
return "All namespaces deactivated"
# Disable namespace tools globally
server.disable(tags={"namespace:finance", "namespace:admin"})
`
```
Sessions start seeing only the activation tools. Calling `activate\_finance` reveals finance tools for that session only. Multiple namespaces can be activated independently, and `deactivate\_all` returns to the initial state.
###
[​
](#method-reference)
Method Reference
* **`await ctx.enable\_components(...) -\> None`**: Enable matching components for this session
* **`await ctx.disable\_components(...) -\> None`**: Disable matching components for this session
* **`await ctx.reset\_visibility() -\> None`**: Clear all session rules, returning to global defaults
##
[​
](#client-notifications)
Client Notifications
When visibility state changes, FastMCP automatically notifies connected clients. Clients supporting the MCP notification protocol receive `list\_changed` events and can refresh their component lists.
This happens automatically. You don’t need to trigger notifications manually.
```
`# This automatically notifies clients
mcp.disable(tags={"maintenance"})
# Clients receive: tools/list\_changed, resources/list\_changed, etc.
`
```
##
[​
](#filtering-logic)
Filtering Logic
Understanding the filtering logic helps when debugging visibility state issues.
The `is\_enabled()` function checks a component’s internal metadata:
1. If the component has `meta.fastmcp.\_internal.visibility = False`, it’s disabled
2. If the component has `meta.fastmcp.\_internal.visibility = True`, it’s enabled
3. If no visibility state is set, the component is enabled by default
When multiple `enable()` and `disable()` calls are made, transforms are applied in order. **Later transforms override earlier ones**, so the last matching transform wins.
##
[​
](#the-visibility-transform)
The Visibility Transform
Under the hood, `enable()` and `disable()` add `Visibility` transforms to the server or provider. The `Visibility` transform marks components with visibility metadata, and the server applies the final filter after all provider and server transforms complete.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms import Visibility
mcp = FastMCP("Server")
# Using the convenience method (recommended)
mcp.disable(names={"secret\_tool"})
# Equivalent to:
mcp.add\_transform(Visibility(False, names={"secret\_tool"}))
`
```
Server-level transforms override provider-level transforms. If a component is disabled at the provider level but enabled at the server level, the server-level `enable()` can re-enable it.