Progress Reporting - FastMCP
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
* [
Composition
](/v2/servers/composition)
* [
Context
](/v2/servers/context)
* [
Elicitation
NEW
](/v2/servers/elicitation)
* [
Icons
NEW
](/v2/servers/icons)
* [
Logging
](/v2/servers/logging)
* [
Middleware
NEW
](/v2/servers/middleware)
* [
Progress
](/v2/servers/progress)
* [
Proxy Servers
](/v2/servers/proxy)
* [
Sampling
NEW
](/v2/servers/sampling)
* [
Storage Backends
NEW
](/v2/servers/storage-backends)
* [
Background Tasks
NEW
](/v2/servers/tasks)
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
Progress reporting allows MCP tools to notify clients about the progress of long-running operations. This enables clients to display progress indicators and provide better user experience during time-consuming tasks.
##
[​
](#why-use-progress-reporting)
Why Use Progress Reporting?
Progress reporting is valuable for:
* **User experience**: Keep users informed about long-running operations
* **Progress indicators**: Enable clients to show progress bars or percentages
* **Timeout prevention**: Demonstrate that operations are actively progressing
* **Debugging**: Track execution progress for performance analysis
###
[​
](#basic-usage)
Basic Usage
Use `ctx.report\_progress()` to send progress updates to the client:
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
# Report progress as we process each item
await ctx.report\_progress(progress=i, total=total)
# Simulate processing time
await asyncio.sleep(0.1)
results.append(item.upper())
# Report 100% completion
await ctx.report\_progress(progress=total, total=total)
return {"processed": len(results), "results": results}
`
```
##
[​
](#method-signature)
Method Signature
## Context Progress Method
[​
](#param-ctx-report-progress)
ctx.report\_progress
async method
Report progress to the client for long-running operations
Show Parameters
[​
](#param-progress)
progress
float
Current progress value (e.g., 24, 0.75, 1500)
[​
](#param-total)
total
float | None
default:"None"
Optional total value (e.g., 100, 1.0, 2000). When provided, clients may interpret this as enabling percentage calculation.
##
[​
](#progress-patterns)
Progress Patterns
###
[​
](#percentage-based-progress)
Percentage-Based Progress
Report progress as a percentage (0-100):
```
`@mcp.tool
async def download\_file(url: str, ctx: Context) -\> str:
"""Download a file with percentage progress."""
total\_size = 1000 # KB
downloaded = 0
while downloaded \< total\_size:
# Download chunk
chunk\_size = min(50, total\_size - downloaded)
downloaded += chunk\_size
# Report percentage progress
percentage = (downloaded / total\_size) \* 100
await ctx.report\_progress(progress=percentage, total=100)
await asyncio.sleep(0.1) # Simulate download time
return f"Downloaded file from {url}"
`
```
###
[​
](#absolute-progress)
Absolute Progress
Report progress with absolute values:
```
`@mcp.tool
async def backup\_database(ctx: Context) -\> str:
"""Backup database tables with absolute progress."""
tables = ["users", "orders", "products", "inventory", "logs"]
for i, table in enumerate(tables):
await ctx.info(f"Backing up table: {table}")
# Report absolute progress
await ctx.report\_progress(progress=i + 1, total=len(tables))
# Simulate backup time
await asyncio.sleep(0.5)
return "Database backup completed"
`
```
###
[​
](#indeterminate-progress)
Indeterminate Progress
Report progress without a known total for operations where the endpoint is unknown:
```
`@mcp.tool
async def scan\_directory(directory: str, ctx: Context) -\> dict:
"""Scan directory with indeterminate progress."""
files\_found = 0
# Simulate directory scanning
for i in range(10): # Unknown number of files
files\_found += 1
# Report progress without total for indeterminate operations
await ctx.report\_progress(progress=files\_found)
await asyncio.sleep(0.2)
return {"files\_found": files\_found, "directory": directory}
`
```
###
[​
](#multi-stage-operations)
Multi-Stage Operations
Break complex operations into stages with progress for each:
```
`@mcp.tool
async def data\_migration(source: str, destination: str, ctx: Context) -\> str:
"""Migrate data with multi-stage progress reporting."""
# Stage 1: Validation (0-25%)
await ctx.info("Validating source data")
for i in range(5):
await ctx.report\_progress(progress=i \* 5, total=100)
await asyncio.sleep(0.1)
# Stage 2: Export (25-60%)
await ctx.info("Exporting data from source")
for i in range(7):
progress = 25 + (i \* 5)
await ctx.report\_progress(progress=progress, total=100)
await asyncio.sleep(0.1)
# Stage 3: Transform (60-80%)
await ctx.info("Transforming data format")
for i in range(4):
progress = 60 + (i \* 5)
await ctx.report\_progress(progress=progress, total=100)
await asyncio.sleep(0.1)
# Stage 4: Import (80-100%)
await ctx.info("Importing to destination")
for i in range(4):
progress = 80 + (i \* 5)
await ctx.report\_progress(progress=progress, total=100)
await asyncio.sleep(0.1)
# Final completion
await ctx.report\_progress(progress=100, total=100)
return f"Migration from {source} to {destination} completed"
`
```
##
[​
](#client-requirements)
Client Requirements
Progress reporting requires clients to support progress handling:
* Clients must send a `progressToken` in the initial request to receive progress updates
* If no progress token is provided, progress calls will have no effect (they won’t error)
* See [Client Progress](/v2/clients/progress) for details on implementing client-side progress handling