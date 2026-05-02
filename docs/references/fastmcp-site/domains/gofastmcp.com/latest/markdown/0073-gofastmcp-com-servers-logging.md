Client Logging - FastMCP
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
This documentation covers **MCP client logging**—sending messages from your server to MCP clients. For standard server-side logging (e.g., writing to files, console), use `fastmcp.utilities.logging.get\_logger()` or Python’s built-in `logging` module.
Server logging allows MCP tools to send debug, info, warning, and error messages back to the client. Unlike standard Python logging, MCP server logging sends messages directly to the client, making them visible in the client’s interface or logs.
##
[​
](#basic-usage)
Basic Usage
Use the context logging methods within any tool function:
```
`from fastmcp import FastMCP, Context
mcp = FastMCP("LoggingDemo")
@mcp.tool
async def analyze\_data(data: list[float], ctx: Context) -\> dict:
"""Analyze numerical data with comprehensive logging."""
await ctx.debug("Starting analysis of numerical data")
await ctx.info(f"Analyzing {len(data)} data points")
try:
if not data:
await ctx.warning("Empty data list provided")
return {"error": "Empty data list"}
result = sum(data) / len(data)
await ctx.info(f"Analysis complete, average: {result}")
return {"average": result, "count": len(data)}
except Exception as e:
await ctx.error(f"Analysis failed: {str(e)}")
raise
`
```
##
[​
](#log-levels)
Log Levels
|Level|Use Case|
|`ctx.debug()`|Detailed execution information for diagnosing problems|
|`ctx.info()`|General information about normal program execution|
|`ctx.warning()`|Potentially harmful situations that don’t prevent execution|
|`ctx.error()`|Error events that might still allow the application to continue|
##
[​
](#structured-logging)
Structured Logging
All logging methods accept an `extra` parameter for sending structured data to the client. This is useful for creating rich, queryable logs.
```
`@mcp.tool
async def process\_transaction(transaction\_id: str, amount: float, ctx: Context):
await ctx.info(
f"Processing transaction {transaction\_id}",
extra={
"transaction\_id": transaction\_id,
"amount": amount,
"currency": "USD"
}
)
`
```
##
[​
](#server-side-logs)
Server-Side Logs
Messages sent to clients via `ctx.log()` and its convenience methods are also logged to the server’s log at `DEBUG` level. Enable debug logging on the `fastmcp.server.context.to\_client` logger to see these messages:
```
`import logging
from fastmcp.utilities.logging import get\_logger
to\_client\_logger = get\_logger(name="fastmcp.server.context.to\_client")
to\_client\_logger.setLevel(level=logging.DEBUG)
`
```
##
[​
](#client-handling)
Client Handling
Log messages are sent to the client through the MCP protocol. How clients handle these messages depends on their implementation—development clients may display logs in real-time, production clients may store them for analysis, and integration clients may forward them to external logging systems.
See [Client Logging](/clients/logging) for details on how clients handle server log messages.