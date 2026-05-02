Resources as Tools - FastMCP
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
Some MCP clients only support tools. They cannot list or read resources directly because they lack resource protocol support. The `ResourcesAsTools` transform bridges this gap by generating tools that provide access to your server’s resources.
When you add `ResourcesAsTools` to a server, it creates two tools that clients can call instead of using the resource protocol:
* **`list\_resources`** returns JSON describing all available resources and templates
* **`read\_resource`** reads a specific resource by URI
This means any client that can call tools can now access resources, even if the client has no native resource support.
##
[​
](#basic-usage)
Basic Usage
Pass your FastMCP server to `ResourcesAsTools` when adding the transform. The generated tools route through the server at runtime, which means all server middleware — auth, visibility, rate limiting — applies to resource operations automatically, exactly as it would for direct `resources/read` calls.
`ResourcesAsTools` (and `PromptsAsTools`) should be applied to a FastMCP server instance, not a raw Provider. The generated tools call back into the server’s middleware chain at runtime, so they need a server to route through. If you want to expose only a subset of resources, create a dedicated FastMCP server for those resources and apply the transform there.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms import ResourcesAsTools
mcp = FastMCP("My Server")
@mcp.resource("config://app")
def app\_config() -\> str:
"""Application configuration."""
return '{"app\_name": "My App", "version": "1.0.0"}'
@mcp.resource("user://{user\_id}/profile")
def user\_profile(user\_id: str) -\> str:
"""Get a user's profile by ID."""
return f'{{"user\_id": "{user\_id}", "name": "User {user\_id}"}}'
# Add the transform - creates list\_resources and read\_resource tools
mcp.add\_transform(ResourcesAsTools(mcp))
`
```
Clients now see three tools: whatever tools you defined directly, plus `list\_resources` and `read\_resource`.
Both generated tools are annotated with `readOnlyHint=True`, since they only read data. Clients that respect tool annotations (like Cursor) can use this to auto-confirm these tool calls without prompting the user.
##
[​
](#static-resources-vs-templates)
Static Resources vs Templates
Resources come in two forms, and the `list\_resources` tool distinguishes between them in its JSON output.
Static resources have fixed URIs. They represent concrete data that exists at a known location. In the listing output, static resources include a `uri` field containing the exact URI to request.
Resource templates have parameterized URIs with placeholders like `{user\_id}`. They represent patterns for accessing dynamic data. In the listing output, templates include a `uri\_template` field showing the pattern with its placeholders.
When a client calls `list\_resources`, it receives JSON like this:
```
`[
{
"uri": "config://app",
"name": "app\_config",
"description": "Application configuration.",
"mime\_type": "text/plain"
},
{
"uri\_template": "user://{user\_id}/profile",
"name": "user\_profile",
"description": "Get a user's profile by ID."
}
]
`
```
The client can distinguish resource types by checking which field is present: `uri` for static resources, `uri\_template` for templates.
##
[​
](#reading-resources)
Reading Resources
The `read\_resource` tool accepts a single `uri` argument. For static resources, pass the exact URI. For templates, fill in the placeholders with actual values.
```
`# Reading a static resource
result = await client.call\_tool("read\_resource", {"uri": "config://app"})
print(result.data) # '{"app\_name": "My App", "version": "1.0.0"}'
# Reading a templated resource - fill in {user\_id} with an actual ID
result = await client.call\_tool("read\_resource", {"uri": "user://42/profile"})
print(result.data) # '{"user\_id": "42", "name": "User 42"}'
`
```
The transform handles template matching automatically. When you request `user://42/profile`, it matches against the `user://{user\_id}/profile` template, extracts `user\_id=42`, and calls your resource function with that parameter.
##
[​
](#binary-content)
Binary Content
Resources that return binary data (like images or files) are automatically base64-encoded when read through the `read\_resource` tool. This ensures binary content can be transmitted as a string in the tool response.
```
`@mcp.resource("data://binary", mime\_type="application/octet-stream")
def binary\_data() -\> bytes:
return b"\\x00\\x01\\x02\\x03"
# Client receives base64-encoded string
result = await client.call\_tool("read\_resource", {"uri": "data://binary"})
decoded = base64.b64decode(result.data) # b'\\x00\\x01\\x02\\x03'
`
```