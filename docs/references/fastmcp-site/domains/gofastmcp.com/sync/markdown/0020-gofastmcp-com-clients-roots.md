Client Roots - FastMCP
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
* [
Notifications
](/clients/notifications)
* [
Sampling
](/clients/sampling)
* [
Elicitation
](/clients/elicitation)
* [
Tasks
NEW
](/clients/tasks)
* [
Progress
](/clients/progress)
* [
Logging
](/clients/logging)
* [
Roots
](/clients/roots)
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
New in version `2.0.0`
Use this when you need to tell servers what local resources the client has access to.
Roots inform servers about resources the client can provide. Servers can use this information to adjust behavior or provide more relevant responses.
##
[​
](#static-roots)
Static Roots
Provide a list of roots when creating the client:
```
`from fastmcp import Client
client = Client(
"my\_mcp\_server.py",
roots=["/path/to/root1", "/path/to/root2"]
)
`
```
##
[​
](#dynamic-roots)
Dynamic Roots
Use a callback to compute roots dynamically when the server requests them:
```
`from fastmcp import Client
from fastmcp.client.roots import RequestContext
async def roots\_callback(context: RequestContext) -\> list[str]:
print(f"Server requested roots (Request ID: {context.request\_id})")
return ["/path/to/root1", "/path/to/root2"]
client = Client(
"my\_mcp\_server.py",
roots=roots\_callback
)
`
```