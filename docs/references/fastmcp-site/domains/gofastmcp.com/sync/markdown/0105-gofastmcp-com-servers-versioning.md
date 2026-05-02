Versioning - FastMCP
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
Component versioning lets you maintain multiple implementations of the same tool, resource, or prompt under a single identifier. You register each version, and FastMCP handles the rest: clients see the highest version by default, but you can filter to expose exactly the versions you want.
The primary use case is serving different API versions from one codebase. Instead of maintaining separate deployments for v1 and v2 clients, you version your components and use `VersionFilter` to create distinct API surfaces.
##
[​
](#versioned-api-surfaces)
Versioned API Surfaces
Consider a server that needs to support both v1 and v2 clients. The v2 API adds new parameters to existing tools, and you want both versions to coexist cleanly. Define your components on a shared provider, then create separate servers with different version filters.
```
`from fastmcp import FastMCP
from fastmcp.server.providers import LocalProvider
from fastmcp.server.transforms import VersionFilter
# Define versioned components on a shared provider
components = LocalProvider()
@components.tool(version="1.0")
def calculate(x: int, y: int) -\> int:
"""Add two numbers."""
return x + y
@components.tool(version="2.0")
def calculate(x: int, y: int, z: int = 0) -\> int:
"""Add two or three numbers."""
return x + y + z
# Create servers that share the provider with different filters
api\_v1 = FastMCP("API v1", providers=[components])
api\_v1.add\_transform(VersionFilter(version\_lt="2.0"))
api\_v2 = FastMCP("API v2", providers=[components])
api\_v2.add\_transform(VersionFilter(version\_gte="2.0"))
`
```
Clients connecting to `api\_v1` see the two-argument `calculate`. Clients connecting to `api\_v2` see the three-argument version. Both servers share the same component definitions.
`VersionFilter` accepts two keyword-only parameters that mirror comparison operators: `version\_gte` (greater than or equal) and `version\_lt` (less than). You can use either or both to define your version range.
```
`# Versions \< 3.0 (v1.x and v2.x)
VersionFilter(version\_lt="3.0")
# Versions \>= 2.0 (v2.x and later)
VersionFilter(version\_gte="2.0")
# Versions in range [2.0, 3.0) (only v2.x)
VersionFilter(version\_gte="2.0", version\_lt="3.0")
`
```
**Unversioned components are exempt from version filtering by default.** Set `include\_unversioned=False` to exclude them. Including them by default ensures that adding version filtering to a server with mixed versioned and unversioned components doesn’t accidentally hide the unversioned ones. To prevent confusion, FastMCP forbids mixing versioned and unversioned components with the same name.
###
[​
](#filtering-mounted-servers)
Filtering Mounted Servers
When you mount child servers and apply a `VersionFilter` to the parent, the filter applies to components from mounted servers as well. Range filtering (`version\_gte` and `version\_lt`) is handled at the provider level, meaning mounted servers don’t need to know about the parent’s version constraints.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms import VersionFilter
# Child server with versioned components
child = FastMCP("Child")
@child.tool(version="1.0")
def process(data: str) -\> str:
return data.upper()
@child.tool(version="2.0")
def process(data: str, mode: str = "default") -\> str:
return data.upper() if mode == "default" else data.lower()
# Parent server mounts child and applies version filter
parent = FastMCP("Parent")
parent.mount(child, namespace="child")
parent.add\_transform(VersionFilter(version\_lt="2.0"))
# Clients see only child\_process v1.0
`
```
The parent’s `VersionFilter` sees components after they’ve been namespaced, but filters based on version regardless of namespace. This lets you apply version policies consistently across your entire server hierarchy.
##
[​
](#declaring-versions)
Declaring Versions
Add a `version` parameter to any component decorator. FastMCP stores versions as strings and groups components by their identifier (name for tools and prompts, URI for resources).
```
`from fastmcp import FastMCP
mcp = FastMCP()
@mcp.tool(version="1.0")
def process(data: str) -\> str:
"""Original processing."""
return data.upper()
@mcp.tool(version="2.0")
def process(data: str, mode: str = "default") -\> str:
"""Enhanced processing with mode selection."""
if mode == "reverse":
return data[::-1].upper()
return data.upper()
`
```
Both versions are registered. When a client lists tools, they see only `process` with version 2.0 (the highest). When they invoke `process`, version 2.0 executes. The same pattern applies to resources and prompts.
###
[​
](#versioned-vs-unversioned-components)
Versioned vs Unversioned Components
For any given component name, you must choose one approach: either version all implementations or version none of them. Mixing versioned and unversioned components with the same name raises an error at registration time.
```
`from fastmcp import FastMCP
mcp = FastMCP()
@mcp.tool
def calculate(x: int, y: int) -\> int:
"""Unversioned tool."""
return x + y
@mcp.tool(version="2.0") # Raises ValueError
def calculate(x: int, y: int, z: int = 0) -\> int:
"""Cannot mix versioned with unversioned."""
return x + y + z
`
```
The error message explains the conflict: “Cannot add versioned tool ‘calculate’ (version=‘2.0’): an unversioned tool with this name already exists. Either version all components or none.”
This restriction helps keep version filtering behavior predictable.
Resources and prompts follow the same pattern.
```
`@mcp.resource("config://app", version="1.0")
def config\_v1() -\> str:
return '{"format": "legacy"}'
@mcp.resource("config://app", version="2.0")
def config\_v2() -\> str:
return '{"format": "modern", "schema": "v2"}'
@mcp.prompt(version="1.0")
def summarize(text: str) -\> str:
return f"Summarize: {text}"
@mcp.prompt(version="2.0")
def summarize(text: str, style: str = "concise") -\> str:
return f"Summarize in a {style} style: {text}"
`
```
###
[​
](#version-discovery)
Version Discovery
When clients list components, each versioned component includes metadata about all available versions. This lets clients discover what versions exist before deciding which to use. The `meta.fastmcp.versions` field contains all registered versions sorted from highest to lowest.
```
`from fastmcp import Client
async with Client(server) as client:
tools = await client.list\_tools()
for tool in tools:
if tool.meta:
fastmcp\_meta = tool.meta.get("fastmcp", {})
# Current version being returned (highest by default)
print(f"Version: {fastmcp\_meta.get('version')}")
# All available versions for this component
print(f"Available: {fastmcp\_meta.get('versions')}")
`
```
For a tool with versions `"1.0"` and `"2.0"`, listing returns the `2.0` implementation with `meta.fastmcp.version` set to `"2.0"` and `meta.fastmcp.versions` set to `["2.0", "1.0"]`. Unversioned components omit these fields entirely.
This discovery mechanism enables clients to make informed decisions about which version to request, support graceful degradation when newer versions introduce breaking changes, or display version information in developer tools.
##
[​
](#requesting-specific-versions)
Requesting Specific Versions
By default, clients receive and invoke the highest version of each component. When you need a specific version, FastMCP provides two approaches: the FastMCP client API for Python applications, and the MCP protocol mechanism for any MCP-compatible client.
###
[​
](#fastmcp-client)
FastMCP Client
The FastMCP client’s `call\_tool` and `get\_prompt` methods accept an optional `version` parameter. When specified, the server executes that exact version instead of the highest.
```
`from fastmcp import Client
async with Client(server) as client:
# Call the highest version (default behavior)
result = await client.call\_tool("calculate", {"x": 1, "y": 2})
# Call a specific version
result\_v1 = await client.call\_tool("calculate", {"x": 1, "y": 2}, version="1.0")
# Get a specific prompt version
prompt = await client.get\_prompt("summarize", {"text": "..."}, version="1.0")
`
```
If the requested version doesn’t exist, the server raises a `NotFoundError`. This ensures you get exactly what you asked for rather than silently falling back to a different version.
###
[​
](#mcp-protocol)
MCP Protocol
For generic MCP clients that don’t have built-in version support, pass the version through the `\_meta` field in arguments. FastMCP servers extract the version from `\_meta.fastmcp.version` before processing.
Tool Call Arguments
Prompt Arguments
```
`{
"x": 1,
"y": 2,
"\_meta": {
"fastmcp": {
"version": "1.0"
}
}
}
`
```
The `\_meta` field is part of the MCP request params, not arguments, so your component implementation never sees it. This convention allows version selection to work across any MCP client without requiring protocol changes. The FastMCP client handles this automatically when you pass the `version` parameter.
##
[​
](#version-comparison)
Version Comparison
FastMCP compares versions to determine which is “highest” when multiple versions share an identifier. The comparison behavior depends on the version format.
For [PEP 440](https://peps.python.org/pep-0440/) versions (like `"1.0"`, `"2.1.3"`, `"1.0a1"`), FastMCP uses semantic comparison where numeric segments are compared as numbers.
```
`# PEP 440 versions compare semantically
"1" \< "2" \< "10" # Numeric order (not "1" \< "10" \< "2")
"1.9" \< "1.10" # Numeric order (not "1.10" \< "1.9")
"1.0a1" \< "1.0b1" \< "1.0" # Pre-releases sort before releases
`
```
For other formats (dates, custom schemes), FastMCP falls back to lexicographic string comparison. This works well for ISO dates and other naturally sortable formats.
```
`# Non-PEP 440 versions compare as strings
"2025-01-15" \< "2025-02-01" # ISO dates sort correctly
"alpha" \< "beta" # Alphabetical order
`
```
The `v` prefix is stripped before comparison, so `"v1.0"` and `"1.0"` are treated as equal for sorting purposes.
##
[​
](#retrieving-specific-versions)
Retrieving Specific Versions
Server-side code can retrieve specific versions rather than just the highest. This is useful during migrations when you need to compare behavior between versions or access legacy implementations.
The `get\_tool`, `get\_resource`, and `get\_prompt` methods accept an optional `version` parameter. Without it, they return the highest version. With it, they return exactly that version.
```
`from fastmcp import FastMCP
mcp = FastMCP()
@mcp.tool(version="1.0")
def add(x: int, y: int) -\> int:
return x + y
@mcp.tool(version="2.0")
def add(x: int, y: int) -\> int:
return x + y + 100 # Different behavior
# Get highest version (default)
tool = await mcp.get\_tool("add")
print(tool.version) # "2.0"
# Get specific version
tool\_v1 = await mcp.get\_tool("add", version="1.0")
print(tool\_v1.version) # "1.0"
`
```
If the requested version doesn’t exist, a `NotFoundError` is raised.
##
[​
](#removing-versions)
Removing Versions
The `remove\_tool`, `remove\_resource`, and `remove\_prompt` methods on the server’s [local provider](/servers/providers/local) accept an optional `version` parameter that controls what gets removed.
```
`# Remove ALL versions of a component
mcp.local\_provider.remove\_tool("calculate")
# Remove only a specific version
mcp.local\_provider.remove\_tool("calculate", version="1.0")
`
```
When you remove a specific version, other versions remain registered. When you remove without specifying a version, all versions are removed.
##
[​
](#migration-workflow)
Migration Workflow
Versioning supports gradual migration when updating component behavior. You can deploy new versions alongside old ones, verify the new behavior works correctly, then clean up.
When migrating an existing unversioned component to use versioning, start by assigning an initial version to your existing implementation. Then add the new version alongside it.
```
`from fastmcp import FastMCP
mcp = FastMCP()
@mcp.tool(version="1.0")
def process\_data(input: str) -\> str:
"""Original implementation, now versioned."""
return legacy\_process(input)
@mcp.tool(version="2.0")
def process\_data(input: str, options: dict | None = None) -\> str:
"""Updated implementation with new options parameter."""
return modern\_process(input, options or {})
`
```
Clients automatically see version 2.0 (the highest). During the transition, your server code can still access the original implementation via `get\_tool("process\_data", version="1.0")`.
Once the migration is complete, remove the old version.
```
`mcp.local\_provider.remove\_tool("process\_data", version="1.0")
`
```