Progress Monitoring - FastMCP
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
New in version `2.3.5`
Use this when you need to track progress of long-running operations.
MCP servers can report progress during operations. The client receives these updates through a progress handler.
##
[​
](#progress-handler)
Progress Handler
Set a handler when creating the client:
```
`from fastmcp import Client
async def progress\_handler(
progress: float,
total: float | None,
message: str | None
) -\> None:
if total is not None:
percentage = (progress / total) \* 100
print(f"Progress: {percentage:.1f}% - {message or ''}")
else:
print(f"Progress: {progress} - {message or ''}")
client = Client(
"my\_mcp\_server.py",
progress\_handler=progress\_handler
)
`
```
The handler receives three parameters:
## Handler Parameters
[​
](#param-progress)
progress
float
Current progress value
[​
](#param-total)
total
float | None
Expected total value (may be None if unknown)
[​
](#param-message)
message
str | None
Optional status message
##
[​
](#per-call-handler)
Per-Call Handler
Override the client-level handler for specific tool calls:
```
`async with client:
result = await client.call\_tool(
"long\_running\_task",
{"param": "value"},
progress\_handler=my\_progress\_handler
)
`
```