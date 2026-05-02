Background Tasks - FastMCP
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
New in version `2.14.0`
Use this when you need to run long operations asynchronously while doing other work.
The MCP task protocol lets you request operations to run in the background. The call returns a Task object immediately, letting you track progress, cancel operations, or await results.
##
[​
](#requesting-background-execution)
Requesting Background Execution
Pass `task=True` to run an operation as a background task:
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
](#task-api)
Task API
All task types share a common interface.
###
[​
](#getting-results)
Getting Results
Call `await task.result()` or simply `await task` to block until the task completes:
```
`task = await client.call\_tool("analyze", {"text": "hello"}, task=True)
# Wait for result (blocking)
result = await task.result()
# or: result = await task
`
```
###
[​
](#checking-status)
Checking Status
Check the current status without blocking:
```
`status = await task.status()
print(f"{status.status}: {status.statusMessage}")
# status.status is "working", "completed", "failed", or "cancelled"
`
```
###
[​
](#waiting-with-control)
Waiting with Control
Use `task.wait()` for more control over waiting:
```
`# Wait up to 30 seconds for completion
status = await task.wait(timeout=30.0)
# Wait for a specific state
status = await task.wait(state="completed", timeout=30.0)
`
```
###
[​
](#cancellation)
Cancellation
Cancel a running task:
```
`await task.cancel()
`
```
##
[​
](#status-updates)
Status Updates
Register callbacks to receive real-time status updates as the server reports progress:
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
###
[​
](#handler-template)
Handler Template
```
`from fastmcp import Client
def status\_handler(status):
"""
Handle task status updates.
Args:
status: Task status object with:
- taskId: Unique task identifier
- status: "working", "completed", "failed", or "cancelled"
- statusMessage: Optional progress message from server
"""
if status.status == "working":
print(f"Progress: {status.statusMessage}")
elif status.status == "completed":
print("Task completed")
elif status.status == "failed":
print(f"Task failed: {status.statusMessage}")
task.on\_status\_change(status\_handler)
`
```
##
[​
](#graceful-degradation)
Graceful Degradation
You can always pass `task=True` regardless of whether the server supports background tasks. Per the MCP specification, servers without task support execute the operation immediately and return the result inline.
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
This lets you write task-aware client code without worrying about server capabilities.
##
[​
](#example)
Example
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
See [Server Background Tasks](/servers/tasks) for how to enable background task support on the server side.