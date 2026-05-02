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
New in version `2.14.0`
Background tasks require the `tasks` optional extra. See [installation instructions](#enabling-background-tasks) below.
FastMCP implements the MCP background task protocol ([SEP-1686](https://modelcontextprotocol.io/specification/2025-11-25/basic/utilities/tasks)), giving your servers a production-ready distributed task scheduler with a single decorator change.
**What is Docket?** FastMCP’s task system is powered by [Docket](https://github.com/chrisguidry/docket), originally built by [Prefect](https://prefect.io) to power [Prefect Cloud](https://www.prefect.io/prefect/cloud)’s managed task scheduling and execution service, where it processes millions of concurrent tasks every day. Docket is now open-sourced for the community.
##
[​
](#what-are-mcp-background-tasks)
What Are MCP Background Tasks?
In MCP, all component interactions are blocking by default. When a client calls a tool, reads a resource, or fetches a prompt, it sends a request and waits for the response. For operations that take seconds or minutes, this creates a poor user experience.
The MCP background task protocol solves this by letting clients:
1. **Start** an operation and receive a task ID immediately
2. **Track** progress as the operation runs
3. **Retrieve** the result when ready
FastMCP handles all of this for you. Add `task=True` to your decorator, and your function gains full background execution with progress reporting, distributed processing, and horizontal scaling.
###
[​
](#mcp-background-tasks-vs-python-concurrency)
MCP Background Tasks vs Python Concurrency
You can always use Python’s concurrency primitives (asyncio, threads, multiprocessing) or external task queues in your FastMCP servers. FastMCP is just Python—run code however you like.
MCP background tasks are different: they’re **protocol-native**. This means MCP clients that support the task protocol can start operations, receive progress updates, and retrieve results through the standard MCP interface. The coordination happens at the protocol level, not inside your application code.
##
[​
](#enabling-background-tasks)
Enabling Background Tasks
New in version `3.0.0` Background tasks require the `tasks` extra:
```
`pip install "fastmcp[tasks]"
`
```
Add `task=True` to any tool, resource, resource template, or prompt decorator. This marks the component as capable of background execution.
```
`import asyncio
from fastmcp import FastMCP
mcp = FastMCP("MyServer")
@mcp.tool(task=True)
async def slow\_computation(duration: int) -\> str:
"""A long-running operation."""
for i in range(duration):
await asyncio.sleep(1)
return f"Completed in {duration} seconds"
`
```
When a client requests background execution, the call returns immediately with a task ID. The work executes in a background worker, and the client can poll for status or wait for the result.
Background tasks require async functions. Attempting to use `task=True` with a sync function raises a `ValueError` at registration time.
##
[​
](#execution-modes)
Execution Modes
For fine-grained control over task execution behavior, use `TaskConfig` instead of the boolean shorthand. The MCP task protocol defines three execution modes:
|Mode|Client calls without task|Client calls with task|
|`"forbidden"`|Executes synchronously|Error: task not supported|
|`"optional"`|Executes synchronously|Executes as background task|
|`"required"`|Error: task required|Executes as background task|
```
`from fastmcp import FastMCP
from fastmcp.server.tasks import TaskConfig
mcp = FastMCP("MyServer")
# Supports both sync and background execution (default when task=True)
@mcp.tool(task=TaskConfig(mode="optional"))
async def flexible\_task() -\> str:
return "Works either way"
# Requires background execution - errors if client doesn't request task
@mcp.tool(task=TaskConfig(mode="required"))
async def must\_be\_background() -\> str:
return "Only runs as a background task"
# No task support (default when task=False or omitted)
@mcp.tool(task=TaskConfig(mode="forbidden"))
async def sync\_only() -\> str:
return "Never runs as background task"
`
```
The boolean shortcuts map to these modes:
* `task=True` → `TaskConfig(mode="optional")`
* `task=False` → `TaskConfig(mode="forbidden")`
###
[​
](#poll-interval)
Poll Interval
New in version `2.15.0`
When clients poll for task status, the server tells them how frequently to check back. By default, FastMCP suggests a 5-second interval, but you can customize this per component:
```
`from datetime import timedelta
from fastmcp import FastMCP
from fastmcp.server.tasks import TaskConfig
mcp = FastMCP("MyServer")
# Poll every 2 seconds for a fast-completing task
@mcp.tool(task=TaskConfig(mode="optional", poll\_interval=timedelta(seconds=2)))
async def quick\_task() -\> str:
return "Done quickly"
# Poll every 30 seconds for a long-running task
@mcp.tool(task=TaskConfig(mode="optional", poll\_interval=timedelta(seconds=30)))
async def slow\_task() -\> str:
return "Eventually done"
`
```
Shorter intervals give clients faster feedback but increase server load. Longer intervals reduce load but delay status updates.
###
[​
](#server-wide-default)
Server-Wide Default
To enable background task support for all components by default, pass `tasks=True` to the constructor. Individual decorators can still override this with `task=False`.
```
`mcp = FastMCP("MyServer", tasks=True)
`
```
If your server defines any synchronous tools, resources, or prompts, you will need to explicitly set `task=False` on their decorators to avoid an error.
###
[​
](#graceful-degradation)
Graceful Degradation
When a client requests background execution but the component has `mode="forbidden"`, FastMCP executes synchronously and returns the result inline. This follows the SEP-1686 specification for graceful degradation—clients can always request background execution without worrying about server capabilities.
Conversely, when a component has `mode="required"` but the client doesn’t request background execution, FastMCP returns an error indicating that task execution is required.
###
[​
](#configuration)
Configuration
|Environment Variable|Default|Description|
|`FASTMCP\_DOCKET\_URL`|`memory://`|Backend URL (`memory://` or `redis://host:port/db`)|
##
[​
](#backends)
Backends
FastMCP supports two backends for task execution, each with different tradeoffs.
###
[​
](#in-memory-backend-default)
In-Memory Backend (Default)
The in-memory backend (`memory://`) requires zero configuration and works out of the box.
**Advantages:**
* No external dependencies
* Simple single-process deployment
**Disadvantages:**
* **Ephemeral**: If the server restarts, all pending tasks are lost
* **Higher latency**: \~250ms task pickup time vs single-digit milliseconds with Redis
* **No horizontal scaling**: Single process only—you cannot add additional workers
###
[​
](#redis-backend)
Redis Backend
For production deployments, use Redis (or Valkey) as your backend by setting `FASTMCP\_DOCKET\_URL=redis://localhost:6379`.
**Advantages:**
* **Persistent**: Tasks survive server restarts
* **Fast**: Single-digit millisecond task pickup latency
* **Scalable**: Add workers to distribute load across processes or machines
##
[​
](#workers)
Workers
Every FastMCP server with task-enabled components automatically starts an **embedded worker**. You do not need to start a separate worker process for tasks to execute.
To scale horizontally, add more workers using the CLI:
```
`fastmcp tasks worker server.py
`
```
Each additional worker pulls tasks from the same queue, distributing load across processes. Configure worker concurrency via environment:
```
`export FASTMCP\_DOCKET\_CONCURRENCY=20
fastmcp tasks worker server.py
`
```
Additional workers only work with Redis/Valkey backends. The in-memory backend is single-process only.
Task-enabled components must be defined at server startup to be registered with all workers. Components added dynamically after the server starts will not be available for background execution.
##
[​
](#progress-reporting)
Progress Reporting
The `Progress` dependency lets you report progress back to clients. Inject it as a parameter with a default value, and FastMCP will provide the active progress reporter.
```
`from fastmcp import FastMCP
from fastmcp.dependencies import Progress
mcp = FastMCP("MyServer")
@mcp.tool(task=True)
async def process\_files(files: list[str], progress: Progress = Progress()) -\> str:
await progress.set\_total(len(files))
for file in files:
await progress.set\_message(f"Processing {file}")
# ... do work ...
await progress.increment()
return f"Processed {len(files)} files"
`
```
The progress API:
* `await progress.set\_total(n)` — Set the total number of steps
* `await progress.increment(amount=1)` — Increment progress
* `await progress.set\_message(text)` — Update the status message
Progress works in both immediate and background execution modes—you can use the same code regardless of how the client invokes your function.
##
[​
](#docket-dependencies)
Docket Dependencies
FastMCP exposes Docket’s full dependency injection system within your task-enabled functions. Beyond `Progress`, you can access the Docket instance, worker information, and use advanced features like retries and timeouts.
```
`from docket import Docket, Worker
from fastmcp import FastMCP
from fastmcp.dependencies import Progress, CurrentDocket, CurrentWorker
mcp = FastMCP("MyServer")
@mcp.tool(task=True)
async def my\_task(
progress: Progress = Progress(),
docket: Docket = CurrentDocket(),
worker: Worker = CurrentWorker(),
) -\> str:
# Schedule additional background work
await docket.add(another\_task, arg1, arg2)
# Access worker metadata
worker\_name = worker.name
return "Done"
`
```
With `CurrentDocket()`, you can schedule additional background tasks, chain work together, and coordinate complex workflows. See the [Docket documentation](https://chrisguidry.github.io/docket/) for the complete API, including retry policies, timeouts, and custom dependencies.