Providers - FastMCP
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
Every FastMCP server has one or more component providers. A provider is a source of tools, resources, and prompts - it’s what makes components available to clients.
##
[​
](#what-is-a-provider)
What Is a Provider?
When a client connects to your server and asks “what tools do you have?”, FastMCP asks each provider that question and combines the results. When a client calls a specific tool, FastMCP finds which provider has it and delegates the call.
You’re already using providers. When you write `@mcp.tool`, you’re adding a tool to your server’s `LocalProvider` - the default provider that stores components you define directly in code. You just don’t have to think about it for simple servers.
Providers become important when your components come from multiple sources: another FastMCP server to include, a remote MCP server to proxy, or a database where tools are defined dynamically. Each source gets its own provider, and FastMCP queries them all seamlessly.
##
[​
](#why-providers)
Why Providers?
The provider abstraction solves a common problem: as servers grow, you need to organize components across multiple sources without tangling everything together.
**Composition**: Break a large server into focused modules. A “weather” server and a “calendar” server can each be developed independently, then mounted into a main server. Each mounted server becomes a `FastMCPProvider`.
**Proxying**: Expose a remote MCP server through your local server. Maybe you’re bridging transports (remote HTTP to local stdio) or aggregating multiple backends. Remote connections become `ProxyProvider` instances.
**Dynamic sources**: Load tools from a database, generate them from an OpenAPI spec, or create them based on user permissions. Custom providers let components come from anywhere.
##
[​
](#built-in-providers)
Built-in Providers
FastMCP includes providers for common patterns:
|Provider|What it does|How you use it|
|`LocalProvider`|Stores components you define in code|`@mcp.tool`, `mcp.add\_tool()`|
|`FastMCPProvider`|Wraps another FastMCP server|`mcp.mount(server)`|
|`ProxyProvider`|Connects to remote MCP servers|`create\_proxy(client)`|
Most users only interact with `LocalProvider` (through decorators) and occasionally mount or proxy other servers. The provider abstraction stays invisible until you need it.
##
[​
](#transforms)
Transforms
[Transforms](/servers/transforms/transforms) modify components as they flow from providers to clients. Each transform sits in a chain, intercepting queries and modifying results before passing them along.
|Transform|Purpose|
|`Namespace`|Prefixes names to avoid conflicts|
|`ToolTransform`|Modifies tool schemas (rename, description, arguments)|
The most common use is namespacing mounted servers to prevent name collisions. When you call `mount(server, namespace="api")`, FastMCP creates a `Namespace` transform automatically.
Transforms can be added to individual providers (affecting just that source) or to the server itself (affecting all components). See [Transforms](/servers/transforms/transforms) for the full picture.
##
[​
](#provider-order)
Provider Order
When a client requests a tool, FastMCP queries providers in registration order. The first provider that has the tool handles the request.
`LocalProvider` is always first, so your decorator-defined tools take precedence. Additional providers are queried in the order you added them. This means if two providers have a tool with the same name, the first one wins.
##
[​
](#when-to-care-about-providers)
When to Care About Providers
**You can ignore providers entirely** if you’re building a simple server with decorators. Just use `@mcp.tool`, `@mcp.resource`, and `@mcp.prompt` - FastMCP handles the rest.
**Learn about providers when** you want to:
* [Mount another server](/servers/composition) into yours
* [Proxy a remote server](/servers/providers/proxy) through yours
* [Control visibility state](/servers/visibility) of components
* [Build dynamic sources](/servers/providers/custom) like database-backed tools
##
[​
](#next-steps)
Next Steps
* [Local](/servers/providers/local) - How decorators work
* [Mounting](/servers/composition) - Compose servers together
* [Proxying](/servers/providers/proxy) - Connect to remote servers
* [Transforms](/servers/transforms/transforms) - Namespace, rename, and modify components
* [Visibility](/servers/visibility) - Control which components clients can access
* [Custom](/servers/providers/custom) - Build your own providers