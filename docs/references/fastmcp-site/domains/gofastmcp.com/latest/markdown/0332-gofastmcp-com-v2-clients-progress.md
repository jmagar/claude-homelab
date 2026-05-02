Progress Monitoring - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/v2/getting-started/welcome)
* [
Installation
](/v2/getting-started/installation)
* [
Quickstart
](/v2/getting-started/quickstart)
* [
Updates
NEW
](/v2/updates)
##### Servers
* [
Overview
](/v2/servers/server)
*
Core Components
*
Advanced Features
*
Authentication
*
Deployment
##### Clients
*
Essentials
*
Core Operations
*
Advanced Features
* [
Elicitation
](/v2/clients/elicitation)
* [
Logging
](/v2/clients/logging)
* [
Progress
](/v2/clients/progress)
* [
Sampling
](/v2/clients/sampling)
* [
Background Tasks
NEW
](/v2/clients/tasks)
* [
Messages
](/v2/clients/messages)
* [
Roots
](/v2/clients/roots)
*
Authentication
##### Integrations
*
Authentication
*
Authorization
*
AI Assistants
*
AI SDKs
*
API Integration
##### Patterns
* [
Tool Transformation
](/v2/patterns/tool-transformation)
* [
Decorating Methods
](/v2/patterns/decorating-methods)
* [
CLI
](/v2/patterns/cli)
* [
Contrib Modules
](/v2/patterns/contrib)
* [
Testing
](/v2/patterns/testing)
##### Development
* [
Contributing
](/v2/development/contributing)
* [
Tests
](/v2/development/tests)
* [
Releases
](/v2/development/releases)
* [
Upgrade Guide
NEW
](/v2/development/upgrade-guide)
* [
Changelog
](/v2/changelog)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
New in version `2.3.5`
MCP servers can report progress during long-running operations. The client can receive these updates through a progress handler.
##
[​
](#progress-handler)
Progress Handler
Set a progress handler when creating the client:
```
`from fastmcp import Client
async def my\_progress\_handler(
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
progress\_handler=my\_progress\_handler
)
`
```
###
[​
](#handler-parameters)
Handler Parameters
The progress handler receives three parameters:
## Progress Handler Parameters
[​
](#param-progress)
progress
float
Current progress value
[​
](#param-total)
total
float | None
Expected total value (may be None)
[​
](#param-message)
message
str | None
Optional status message (may be None)
##
[​
](#per-call-progress-handler)
Per-Call Progress Handler
Override the progress handler for specific tool calls:
```
`async with client:
# Override with specific progress handler for this call
result = await client.call\_tool(
"long\_running\_task",
{"param": "value"},
progress\_handler=my\_progress\_handler
)
`
```