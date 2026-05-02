Server Logging - FastMCP
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
New in version `2.0.0`
Use this when you need to capture or process log messages sent by the server.
MCP servers can emit log messages to clients. The client handles these through a log handler callback.
##
[​
](#log-handler)
Log Handler
Provide a `log\_handler` function when creating the client:
```
`import logging
from fastmcp import Client
from fastmcp.client.logging import LogMessage
logging.basicConfig(
level=logging.INFO,
format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(\_\_name\_\_)
LOGGING\_LEVEL\_MAP = logging.getLevelNamesMapping()
async def log\_handler(message: LogMessage):
"""Forward MCP server logs to Python's logging system."""
msg = message.data.get('msg')
extra = message.data.get('extra')
level = LOGGING\_LEVEL\_MAP.get(message.level.upper(), logging.INFO)
logger.log(level, msg, extra=extra)
client = Client(
"my\_mcp\_server.py",
log\_handler=log\_handler,
)
`
```
The handler receives a `LogMessage` object:
## LogMessage
[​
](#param-level)
level
Literal["debug", "info", "notice", "warning", "error", "critical", "alert", "emergency"]
The log level
[​
](#param-logger)
logger
str | None
The logger name (may be None)
[​
](#param-data)
data
dict
The log payload, containing `msg` and `extra` keys
##
[​
](#structured-logs)
Structured Logs
The `message.data` attribute is a dictionary containing the log payload. This enables structured logging with rich contextual information.
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
This structure is preserved even when logs are forwarded through a FastMCP proxy, making it useful for debugging multi-server applications.
##
[​
](#default-behavior)
Default Behavior
If you do not provide a custom `log\_handler`, FastMCP’s default handler routes server logs to Python’s logging system at the appropriate severity level. The MCP levels map as follows: `notice` becomes INFO; `alert` and `emergency` become CRITICAL.
```
`client = Client("my\_mcp\_server.py")
async with client:
# Server logs are forwarded at proper severity automatically
await client.call\_tool("some\_tool")
`
```