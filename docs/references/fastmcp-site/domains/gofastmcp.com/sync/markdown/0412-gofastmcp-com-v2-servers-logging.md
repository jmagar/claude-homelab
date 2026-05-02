Client Logging - FastMCP
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
This documentation covers **MCP client logging** - sending messages from your server to MCP clients. For standard server-side logging (e.g., writing to files, console), use `fastmcp.utilities.logging.get\_logger()` or Python’s built-in `logging` module.
Server logging allows MCP tools to send debug, info, warning, and error messages back to the client. This provides visibility into function execution and helps with debugging during development and operation.
##
[​
](#why-use-server-logging)
Why Use Server Logging?
Server logging is essential for:
* **Debugging**: Send detailed execution information to help diagnose issues
* **Progress visibility**: Keep users informed about what the tool is doing
* **Error reporting**: Communicate problems and their context to clients
* **Audit trails**: Create records of tool execution for compliance or analysis
Unlike standard Python logging, MCP server logging sends messages directly to the client, making them visible in the client’s interface or logs.
###
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
](#structured-logging-with-extra)
Structured Logging with `extra`
All logging methods (`debug`, `info`, `warning`, `error`, `log`) now accept an `extra` parameter, which is a dictionary of arbitrary data. This allows you to send structured data to the client, which is useful for creating rich, queryable logs.
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
# ... processing logic ...
`
```
##
[​
](#server-logs)
Server Logs
Client Logging in the form of `ctx.log()` and its convenience methods (`debug`, `info`, `warning`, `error`) are meant for sending messages to the MCP clients. Messages sent to clients are also logged to the server’s log at `DEBUG` level. Enable debug logging on the server or enable debug logging on the `fastmcp.server.context.to\_client` logger to see these messages in the server’s log.
```
`import logging
from fastmcp.utilities.logging import get\_logger
to\_client\_logger = get\_logger(name="fastmcp.server.context.to\_client")
to\_client\_logger.setLevel(level=logging.DEBUG)
`
```
##
[​
](#logging-methods)
Logging Methods
## Context Logging Methods
[​
](#param-ctx-debug)
ctx.debug
async method
Send debug-level messages for detailed execution information
Show parameters
[​
](#param-message)
message
str
The debug message to send to the client
[​
](#param-extra)
extra
dict | None
default:"None"
Optional dictionary for structured logging data
[​
](#param-ctx-info)
ctx.info
async method
Send informational messages about normal execution
Show parameters
[​
](#param-message-1)
message
str
The information message to send to the client
[​
](#param-extra-1)
extra
dict | None
default:"None"
Optional dictionary for structured logging data
[​
](#param-ctx-warning)
ctx.warning
async method
Send warning messages for potential issues that didn’t prevent execution
Show parameters
[​
](#param-message-2)
message
str
The warning message to send to the client
[​
](#param-extra-2)
extra
dict | None
default:"None"
Optional dictionary for structured logging data
[​
](#param-ctx-error)
ctx.error
async method
Send error messages for problems that occurred during execution
Show parameters
[​
](#param-message-3)
message
str
The error message to send to the client
[​
](#param-extra-3)
extra
dict | None
default:"None"
Optional dictionary for structured logging data
[​
](#param-ctx-log)
ctx.log
async method
Generic logging method with custom level and logger name
Show parameters
[​
](#param-level)
level
Literal['debug', 'info', 'warning', 'error']
The log level for the message
[​
](#param-message-4)
message
str
The message to send to the client
[​
](#param-logger-name)
logger\_name
str | None
default:"None"
Optional custom logger name for categorizing messages
[​
](#param-extra-4)
extra
dict | None
default:"None"
Optional dictionary for structured logging data
##
[​
](#log-levels)
Log Levels
###
[​
](#debug)
Debug
Use for detailed information that’s typically only useful when diagnosing problems:
```
`@mcp.tool
async def process\_file(file\_path: str, ctx: Context) -\> str:
"""Process a file with detailed debug logging."""
await ctx.debug(f"Starting to process file: {file\_path}")
await ctx.debug("Checking file permissions")
# File processing logic
await ctx.debug("File processing completed successfully")
return "File processed"
`
```
###
[​
](#info)
Info
Use for general information about normal program execution:
```
`@mcp.tool
async def backup\_database(ctx: Context) -\> str:
"""Backup database with progress information."""
await ctx.info("Starting database backup")
await ctx.info("Connecting to database")
await ctx.info("Backup completed successfully")
return "Database backed up"
`
```
###
[​
](#warning)
Warning
Use for potentially harmful situations that don’t prevent execution:
```
`@mcp.tool
async def validate\_config(config: dict, ctx: Context) -\> dict:
"""Validate configuration with warnings for deprecated options."""
if "old\_api\_key" in config:
await ctx.warning(
"Using deprecated 'old\_api\_key' field. Please use 'api\_key' instead",
extra={"deprecated\_field": "old\_api\_key"}
)
if config.get("timeout", 30) \> 300:
await ctx.warning(
"Timeout value is very high (\>5 minutes), this may cause issues",
extra={"timeout\_value": config.get("timeout")}
)
return {"status": "valid", "warnings": "see logs"}
`
```
###
[​
](#error)
Error
Use for error events that might still allow the application to continue:
```
`@mcp.tool
async def batch\_process(items: list[str], ctx: Context) -\> dict:
"""Process multiple items, logging errors for failed items."""
successful = 0
failed = 0
for item in items:
try:
# Process item
successful += 1
except Exception as e:
await ctx.error(
f"Failed to process item '{item}': {str(e)}",
extra={"failed\_item": item}
)
failed += 1
return {"successful": successful, "failed": failed}
`
```
##
[​
](#client-handling)
Client Handling
Log messages are sent to the client through the MCP protocol. How clients handle these messages depends on their implementation:
* **Development clients**: May display logs in real-time for debugging
* **Production clients**: May store logs for later analysis or display to users
* **Integration clients**: May forward logs to external logging systems
See [Client Logging](/v2/clients/logging) for details on how clients can handle server log messages.