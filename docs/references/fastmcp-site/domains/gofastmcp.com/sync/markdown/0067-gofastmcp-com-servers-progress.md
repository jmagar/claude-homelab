Progress Reporting - FastMCP
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
Progress reporting allows MCP tools to notify clients about the progress of long-running operations. Clients can display progress indicators and provide better user experience during time-consuming tasks.
##
[​
](#basic-usage)
Basic Usage
Use `ctx.report\_progress()` to send progress updates to the client. The method accepts a `progress` value representing how much work is complete, and an optional `total` representing the full scope of work.
```
`from fastmcp import FastMCP, Context
import asyncio
mcp = FastMCP("ProgressDemo")
@mcp.tool
async def process\_items(items: list[str], ctx: Context) -\> dict:
"""Process a list of items with progress updates."""
total = len(items)
results = []
for i, item in enumerate(items):
await ctx.report\_progress(progress=i, total=total)
await asyncio.sleep(0.1)
results.append(item.upper())
await ctx.report\_progress(progress=total, total=total)
return {"processed": len(results), "results": results}
`
```
##
[​
](#progress-patterns)
Progress Patterns
|Pattern|Description|Example|
|Percentage|Progress as 0-100 percentage|`progress=75, total=100`|
|Absolute|Completed items of a known count|`progress=3, total=10`|
|Indeterminate|Progress without known endpoint|`progress=files\_found` (no total)|
For multi-stage operations, map each stage to a portion of the total progress range. A four-stage operation might allocate 0-25% to validation, 25-60% to export, 60-80% to transform, and 80-100% to import.
##
[​
](#client-requirements)
Client Requirements
Progress reporting requires clients to support progress handling. Clients must send a `progressToken` in the initial request to receive progress updates. If no progress token is provided, progress calls have no effect (they don’t error).
See [Client Progress](/clients/progress) for details on implementing client-side progress handling.