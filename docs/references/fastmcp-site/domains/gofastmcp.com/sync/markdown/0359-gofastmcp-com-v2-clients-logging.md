Server Logging - FastMCP
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
New in version `2.0.0`
MCP servers can emit log messages to clients. The client can handle these logs through a log handler callback.
##
[​
](#log-handler)
Log Handler
Provide a `log\_handler` function when creating the client. For robust logging, the log messages can be integrated with Python’s standard `logging` module.
```
`import logging
from fastmcp import Client
from fastmcp.client.logging import LogMessage
# In a real app, you might configure this in your main entry point
logging.basicConfig(
level=logging.INFO,
format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
# Get a logger for the module where the client is used
logger = logging.getLogger(\_\_name\_\_)
# This mapping is useful for converting MCP level strings to Python's levels
LOGGING\_LEVEL\_MAP = logging.getLevelNamesMapping()
async def log\_handler(message: LogMessage):
"""
Handles incoming logs from the MCP server and forwards them
to the standard Python logging system.
"""
msg = message.data.get('msg')
extra = message.data.get('extra')
# Convert the MCP log level to a Python log level
level = LOGGING\_LEVEL\_MAP.get(message.level.upper(), logging.INFO)
# Log the message using the standard logging library
logger.log(level, msg, extra=extra)
client = Client(
"my\_mcp\_server.py",
log\_handler=log\_handler,
)
`
```
##
[​
](#handling-structured-logs)
Handling Structured Logs
The `message.data` attribute is a dictionary that contains the log payload from the server. This enables structured logging, allowing you to receive rich, contextual information.
The dictionary contains two keys:
* `msg`: The string log message.
* `extra`: A dictionary containing any extra data sent from the server.
This structure is preserved even when logs are forwarded through a FastMCP proxy, making it a powerful tool for debugging complex, multi-server applications.
###
[​
](#handler-parameters)
Handler Parameters
The `log\_handler` is called every time a log message is received. It receives a `LogMessage` object:
## Log Handler Parameters
[​
](#param-log-message)
LogMessage
Log Message Object
Show attributes
[​
](#param-level)
level
Literal["debug", "info", "notice", "warning", "error", "critical", "alert", "emergency"]
The log level
[​
](#param-logger)
logger
str | None
The logger name (optional, may be None)
[​
](#param-data)
data
dict
The log payload, containing `msg` and `extra` keys.
```
`async def detailed\_log\_handler(message: LogMessage):
msg = message.data.get('msg')
extra = message.data.get('extra')
if message.level == "error":
print(f"ERROR: {msg} | Details: {extra}")
elif message.level == "warning":
print(f"WARNING: {msg} | Details: {extra}")
else:
print(f"{message.level.upper()}: {msg}")
`
```
##
[​
](#default-log-handling)
Default Log Handling
If you don’t provide a custom `log\_handler`, FastMCP’s default handler routes server logs to the appropriate Python logging levels. The MCP levels are mapped as follows: `notice` → INFO; `alert` and `emergency` → CRITICAL. If the server includes a logger name, it is prefixed in the message, and any `extra` data is forwarded via the logging `extra` parameter.
```
`client = Client("my\_mcp\_server.py")
async with client:
# Server logs are forwarded at their proper severity (DEBUG/INFO/WARNING/ERROR/CRITICAL)
await client.call\_tool("some\_tool")
`
```