Background Tasks - FastMCP
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
New in version `2.14.0`
The [MCP task protocol](https://modelcontextprotocol.io/specification/2025-11-25/basic/utilities/tasks) lets you request operations to run asynchronously. This returns a Task object immediately, letting you track progress, cancel operations, or await results.
See [Server Background Tasks](/v2/servers/tasks) for how to enable this on the server side.
##
[​
](#requesting-background-execution)
Requesting Background Execution
Pass `task=True` to run an operation as a background task. The call returns immediately with a Task object while the work executes on the server.
```
`from fastmcp import Client
async with Client(server) as client:
# Start a background task
task = await client.call\_tool("slow\_computation", {"duration": 10}, task=True)
print(f"Task started: {task.task\_id}")
# Do other work while it runs...
# Get the result when ready
result = await task.result()
`
```
This works with tools, resources, and prompts:
```
`tool\_task = await client.call\_tool("my\_tool", args, task=True)
resource\_task = await client.read\_resource("file://large.txt", task=True)
prompt\_task = await client.get\_prompt("my\_prompt", args, task=True)
`
```
##
[​
](#working-with-task-objects)
Working with Task Objects
All task types share a common interface for retrieving results, checking status, and receiving updates.
To get the result, call `await task.result()` or simply `await task`. This blocks until the task completes and returns the result. You can also check status without blocking using `await task.status()`, which returns the current state (`"working"`, `"completed"`, `"failed"`, or `"cancelled"`) along with any progress message from the server.
```
`task = await client.call\_tool("analyze", {"text": "hello"}, task=True)
# Check current status (non-blocking)
status = await task.status()
print(f"{status.status}: {status.statusMessage}")
# Wait for result (blocking)
result = await task.result()
`
```
For more control over waiting, use `task.wait()` with an optional timeout or target state:
```
`# Wait up to 30 seconds for completion
status = await task.wait(timeout=30.0)
# Wait for a specific state
status = await task.wait(state="completed", timeout=30.0)
`
```
To cancel a running task, call `await task.cancel()`.
###
[​
](#real-time-status-updates)
Real-Time Status Updates
Register callbacks to receive status updates as the server reports progress. Both sync and async callbacks are supported.
```
`def on\_status\_change(status):
print(f"Task {status.taskId}: {status.status} - {status.statusMessage}")
task.on\_status\_change(on\_status\_change)
# Async callbacks work too
async def on\_status\_async(status):
await log\_status(status)
task.on\_status\_change(on\_status\_async)
`
```
##
[​
](#graceful-degradation)
Graceful Degradation
You can always pass `task=True` regardless of whether the server supports background tasks. Per the MCP specification, servers without task support execute the operation immediately and return the result inline. The Task API provides a consistent interface either way.
```
`task = await client.call\_tool("my\_tool", args, task=True)
if task.returned\_immediately:
print("Server executed immediately (no background support)")
else:
print("Running in background")
# Either way, this works
result = await task.result()
`
```
This means you can write task-aware client code without worrying about server capabilities.
##
[​
](#complete-example)
Complete Example
```
`import asyncio
from fastmcp import Client
async def main():
async with Client(server) as client:
# Start background task
task = await client.call\_tool(
"slow\_computation",
{"duration": 10},
task=True,
)
# Subscribe to updates
def on\_update(status):
print(f"Progress: {status.statusMessage}")
task.on\_status\_change(on\_update)
# Do other work while task runs
print("Doing other work...")
await asyncio.sleep(2)
# Wait for completion and get result
result = await task.result()
print(f"Result: {result.content}")
asyncio.run(main())
`
```