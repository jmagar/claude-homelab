OpenAPI 🤝 FastMCP - FastMCP
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
* [
FastAPI
](/integrations/fastapi)
* [
OpenAPI
](/integrations/openapi)
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
New in version `2.0.0`
FastMCP can automatically generate an MCP server from any OpenAPI specification, allowing AI models to interact with existing APIs through the MCP protocol. Instead of manually creating tools and resources, you provide an OpenAPI spec and FastMCP intelligently converts API endpoints into the appropriate MCP components.
Under the hood, OpenAPI integration uses OpenAPIProvider (v3.0.0+) to source tools from the specification. See [Providers](/servers/providers/overview) to understand how FastMCP sources components.
Generating MCP servers from OpenAPI is a great way to get started with FastMCP, but in practice LLMs achieve **significantly better performance** with well-designed and curated MCP servers than with auto-converted OpenAPI servers. This is especially true for complex APIs with many endpoints and parameters.We recommend using the FastAPI integration for bootstrapping and prototyping, not for mirroring your API to LLM clients. See the post [Stop Converting Your REST APIs to MCP](https://www.jlowin.dev/blog/stop-converting-rest-apis-to-mcp) for more details.
##
[​
](#create-a-server)
Create a Server
To convert an OpenAPI specification to an MCP server, use the `FastMCP.from\_openapi()` class method:
server.py
```
`import httpx
from fastmcp import FastMCP
# Create an HTTP client for your API
client = httpx.AsyncClient(base\_url="https://api.example.com")
# Load your OpenAPI spec
openapi\_spec = httpx.get("https://api.example.com/openapi.json").json()
# Create the MCP server
mcp = FastMCP.from\_openapi(
openapi\_spec=openapi\_spec,
client=client,
name="My API Server"
)
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
###
[​
](#authentication)
Authentication
If your API requires authentication, configure it on the HTTP client:
```
`import httpx
from fastmcp import FastMCP
# Bearer token authentication
api\_client = httpx.AsyncClient(
base\_url="https://api.example.com",
headers={"Authorization": "Bearer YOUR\_TOKEN"}
)
# Create MCP server with authenticated client
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=api\_client,
timeout=30.0 # 30 second timeout for all requests
)
`
```
##
[​
](#route-mapping)
Route Mapping
By default, FastMCP converts **every endpoint** in your OpenAPI specification into an MCP **Tool**. This provides a simple, predictable starting point that ensures all your API’s functionality is immediately available to the vast majority of LLM clients which only support MCP tools.
While this is a pragmatic default for maximum compatibility, you can easily customize this behavior. Internally, FastMCP uses an ordered list of `RouteMap` objects to determine how to map OpenAPI routes to various MCP component types.
Each `RouteMap` specifies a combination of methods, patterns, and tags, as well as a corresponding MCP component type. Each OpenAPI route is checked against each `RouteMap` in order, and the first one that matches every criteria is used to determine its converted MCP type. A special type, `EXCLUDE`, can be used to exclude routes from the MCP server entirely.
* **Methods**: HTTP methods to match (e.g. `["GET", "POST"]` or `"\*"` for all)
* **Pattern**: Regex pattern to match the route path (e.g. `r"^/users/.\*"` or `r".\*"` for all)
* **Tags**: A set of OpenAPI tags that must all be present. An empty set (`{}`) means no tag filtering, so the route matches regardless of its tags.
* **MCP type**: What MCP component type to create (`TOOL`, `RESOURCE`, `RESOURCE\_TEMPLATE`, or `EXCLUDE`)
* **MCP tags**: A set of custom tags to add to components created from matching routes
Here is FastMCP’s default rule:
```
`from fastmcp.server.openapi import RouteMap, MCPType
DEFAULT\_ROUTE\_MAPPINGS = [
# All routes become tools
RouteMap(mcp\_type=MCPType.TOOL),
]
`
```
###
[​
](#custom-route-maps)
Custom Route Maps
When creating your FastMCP server, you can customize routing behavior by providing your own list of `RouteMap` objects. Your custom maps are processed before the default route maps, and routes will be assigned to the first matching custom map.
For example, prior to FastMCP 2.8.0, GET requests were automatically mapped to `Resource` and `ResourceTemplate` components based on whether they had path parameters. (This was changed solely for client compatibility reasons.) You can restore this behavior by providing custom route maps:
```
`from fastmcp import FastMCP
from fastmcp.server.openapi import RouteMap, MCPType
# Restore pre-2.8.0 semantic mapping
semantic\_maps = [
# GET requests with path parameters become ResourceTemplates
RouteMap(methods=["GET"], pattern=r".\*\\{.\*\\}.\*", mcp\_type=MCPType.RESOURCE\_TEMPLATE),
# All other GET requests become Resources
RouteMap(methods=["GET"], pattern=r".\*", mcp\_type=MCPType.RESOURCE),
]
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
route\_maps=semantic\_maps,
)
`
```
With these maps, `GET` requests are handled semantically, and all other methods (`POST`, `PUT`, etc.) will fall through to the default rule and become `Tool`s.
Here is a more complete example that uses custom route maps to convert all `GET` endpoints under `/analytics/` to tools while excluding all admin endpoints and all routes tagged “internal”. All other routes will be handled by the default rules:
```
`from fastmcp import FastMCP
from fastmcp.server.openapi import RouteMap, MCPType
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
route\_maps=[
# Analytics `GET` endpoints are tools
RouteMap(
methods=["GET"],
pattern=r"^/analytics/.\*",
mcp\_type=MCPType.TOOL,
),
# Exclude all admin endpoints
RouteMap(
pattern=r"^/admin/.\*",
mcp\_type=MCPType.EXCLUDE,
),
# Exclude all routes tagged "internal"
RouteMap(
tags={"internal"},
mcp\_type=MCPType.EXCLUDE,
),
],
)
`
```
The default route maps are always applied after your custom maps, so you do not have to create route maps for every possible route.
###
[​
](#excluding-routes)
Excluding Routes
To exclude routes from the MCP server, use a route map to assign them to `MCPType.EXCLUDE`.
You can use this to remove sensitive or internal routes by targeting them specifically:
```
`from fastmcp import FastMCP
from fastmcp.server.openapi import RouteMap, MCPType
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
route\_maps=[
RouteMap(pattern=r"^/admin/.\*", mcp\_type=MCPType.EXCLUDE),
RouteMap(tags={"internal"}, mcp\_type=MCPType.EXCLUDE),
],
)
`
```
Or you can use a catch-all rule to exclude everything that your maps don’t handle explicitly:
```
`from fastmcp import FastMCP
from fastmcp.server.openapi import RouteMap, MCPType
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
route\_maps=[
# custom mapping logic goes here
# ... your specific route maps ...
# exclude all remaining routes
RouteMap(mcp\_type=MCPType.EXCLUDE),
],
)
`
```
Using a catch-all exclusion rule will prevent the default route mappings from being applied, since it will match every remaining route. This is useful if you want to explicitly allow-list certain routes.
###
[​
](#advanced-route-mapping)
Advanced Route Mapping
New in version `2.5.0`
For advanced use cases that require more complex logic, you can provide a `route\_map\_fn` callable. After the route map logic is applied, this function is called on each matched route and its assigned MCP component type. It can optionally return a different component type to override the mapped assignment. If it returns `None`, the assigned type is used.
In addition to more precise targeting of methods, patterns, and tags, this function can access any additional OpenAPI metadata about the route.
The `route\_map\_fn` is called on all routes, even those that matched `MCPType.EXCLUDE` in your custom maps. This gives you an opportunity to customize the mapping or even override an exclusion.
```
`from fastmcp import FastMCP
from fastmcp.server.openapi import RouteMap, MCPType, HTTPRoute
def custom\_route\_mapper(route: HTTPRoute, mcp\_type: MCPType) -\> MCPType | None:
"""Advanced route type mapping."""
# Convert all admin routes to tools regardless of HTTP method
if "/admin/" in route.path:
return MCPType.TOOL
elif "internal" in route.tags:
return MCPType.EXCLUDE
# Convert user detail routes to templates even if they're POST
elif route.path.startswith("/users/") and route.method == "POST":
return MCPType.RESOURCE\_TEMPLATE
# Use defaults for all other routes
return None
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
route\_map\_fn=custom\_route\_mapper,
)
`
```
##
[​
](#customization)
Customization
###
[​
](#component-names)
Component Names
New in version `2.5.0`
FastMCP automatically generates names for MCP components based on the OpenAPI specification. By default, it uses the `operationId` from your OpenAPI spec, up to the first double underscore (`\_\_`).
All component names are automatically:
* **Slugified**: Spaces and special characters are converted to underscores or removed
* **Truncated**: Limited to 56 characters maximum to ensure compatibility
* **Unique**: If multiple components have the same name, a number is automatically appended to make them unique
For more control over component names, you can provide an `mcp\_names` dictionary that maps `operationId` values to your desired names. The `operationId` must be exactly as it appears in the OpenAPI spec. The provided name will always be slugified and truncated.
```
`mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
mcp\_names={
"list\_users\_\_with\_pagination": "user\_list",
"create\_user\_\_admin\_required": "create\_user",
"get\_user\_details\_\_admin\_required": "user\_detail",
}
)
`
```
Any `operationId` not found in `mcp\_names` will use the default strategy (operationId up to the first `\_\_`).
###
[​
](#tags)
Tags
New in version `2.8.0`
FastMCP provides several ways to add tags to your MCP components, allowing you to categorize and organize them for better discoverability and filtering. Tags are combined from multiple sources to create the final set of tags on each component.
####
[​
](#routemap-tags)
RouteMap Tags
You can add custom tags to components created from specific routes using the `mcp\_tags` parameter in `RouteMap`. These tags will be applied to all components created from routes that match that particular route map.
```
`from fastmcp.server.openapi import RouteMap, MCPType
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
route\_maps=[
# Add custom tags to all POST endpoints
RouteMap(
methods=["POST"],
pattern=r".\*",
mcp\_type=MCPType.TOOL,
mcp\_tags={"write-operation", "api-mutation"}
),
# Add different tags to detail view endpoints
RouteMap(
methods=["GET"],
pattern=r".\*\\{.\*\\}.\*",
mcp\_type=MCPType.RESOURCE\_TEMPLATE,
mcp\_tags={"detail-view", "parameterized"}
),
# Add tags to list endpoints
RouteMap(
methods=["GET"],
pattern=r".\*",
mcp\_type=MCPType.RESOURCE,
mcp\_tags={"list-data", "collection"}
),
],
)
`
```
####
[​
](#global-tags)
Global Tags
You can add tags to **all** components by providing a `tags` parameter when creating your MCP server. These global tags will be applied to every component created from your OpenAPI specification.
```
`mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
tags={"api-v2", "production", "external"}
)
`
```
####
[​
](#openapi-tags-in-client-meta)
OpenAPI Tags in Client Meta
FastMCP automatically includes OpenAPI tags from your specification in the component’s metadata. These tags are available to MCP clients through the `meta.fastmcp.tags` field, allowing clients to filter and organize components based on the original OpenAPI tagging:
OpenAPI spec with tags
Access OpenAPI tags in MCP client
```
`{
"paths": {
"/users": {
"get": {
"tags": ["users", "public"],
"operationId": "list\_users",
"summary": "List all users"
}
}
}
}
`
```
This makes it easy for clients to understand and organize API endpoints based on their original OpenAPI categorization.
###
[​
](#advanced-customization)
Advanced Customization
New in version `2.5.0`
By default, FastMCP creates MCP components using a variety of metadata from the OpenAPI spec, such as incorporating the OpenAPI description into the MCP component description.
At times you may want to modify those MCP components in a variety of ways, such as adding LLM-specific instructions or tags. For fine-grained customization, you can provide a `mcp\_component\_fn` when creating the MCP server. After each MCP component has been created, this function is called on it and has the opportunity to modify it in-place.
Your `mcp\_component\_fn` is expected to modify the component in-place, not to return a new component. The result of the function is ignored.
```
`from fastmcp.server.openapi import (
HTTPRoute,
OpenAPITool,
OpenAPIResource,
OpenAPIResourceTemplate,
)
def customize\_components(
route: HTTPRoute,
component: OpenAPITool | OpenAPIResource | OpenAPIResourceTemplate,
) -\> None:
# Add custom tags to all components
component.tags.add("openapi")
# Customize based on component type
if isinstance(component, OpenAPITool):
component.description = f"🔧 {component.description} (via API)"
if isinstance(component, OpenAPIResource):
component.description = f"📊 {component.description}"
component.tags.add("data")
mcp = FastMCP.from\_openapi(
openapi\_spec=spec,
client=client,
mcp\_component\_fn=customize\_components,
)
`
```
##
[​
](#request-parameter-handling)
Request Parameter Handling
FastMCP intelligently handles different types of parameters in OpenAPI requests:
###
[​
](#query-parameters)
Query Parameters
By default, FastMCP only includes query parameters that have non-empty values. Parameters with `None` values or empty strings are automatically filtered out.
```
`# When calling this tool...
await client.call\_tool("search\_products", {
"category": "electronics", # ✅ Included
"min\_price": 100, # ✅ Included
"max\_price": None, # ❌ Excluded
"brand": "", # ❌ Excluded
})
# The HTTP request will be: GET /products?category=electronics&min\_price=100
`
```
###
[​
](#path-parameters)
Path Parameters
Path parameters are typically required by REST APIs. FastMCP:
* Filters out `None` values
* Validates that all required path parameters are provided
* Raises clear errors for missing required parameters
```
`# ✅ This works
await client.call\_tool("get\_user", {"user\_id": 123})
# ❌ This raises: "Missing required path parameters: {'user\_id'}"
await client.call\_tool("get\_user", {"user\_id": None})
`
```
###
[​
](#array-parameters)
Array Parameters
FastMCP handles array parameters according to OpenAPI specifications:
* **Query arrays**: Serialized based on the `explode` parameter (default: `True`)
* **Path arrays**: Serialized as comma-separated values (OpenAPI ‘simple’ style)
```
`# Query array with explode=true (default)
# ?tags=red&tags=blue&tags=green
# Query array with explode=false
# ?tags=red,blue,green
# Path array (always comma-separated)
# /items/red,blue,green
`
```
###
[​
](#headers)
Headers
Header parameters are automatically converted to strings and included in the HTTP request.