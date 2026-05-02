Message Handling - FastMCP
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
New in version `2.9.1`
MCP clients can receive various types of messages from servers, including requests that need responses and notifications that don’t. The message handler provides a unified way to process all these messages.
##
[​
](#function-based-handler)
Function-Based Handler
The simplest way to handle messages is with a function that receives all messages:
```
`from fastmcp import Client
async def message\_handler(message):
"""Handle all MCP messages from the server."""
if hasattr(message, 'root'):
method = message.root.method
print(f"Received: {method}")
# Handle specific notifications
if method == "notifications/tools/list\_changed":
print("Tools have changed - might want to refresh tool cache")
elif method == "notifications/resources/list\_changed":
print("Resources have changed")
client = Client(
"my\_mcp\_server.py",
message\_handler=message\_handler,
)
`
```
##
[​
](#message-handler-class)
Message Handler Class
For fine-grained targeting, FastMCP provides a `MessageHandler` class you can subclass to take advantage of specific hooks:
```
`from fastmcp import Client
from fastmcp.client.messages import MessageHandler
import mcp.types
class MyMessageHandler(MessageHandler):
async def on\_tool\_list\_changed(
self, notification: mcp.types.ToolListChangedNotification
) -\> None:
"""Handle tool list changes specifically."""
print("Tool list changed - refreshing available tools")
client = Client(
"my\_mcp\_server.py",
message\_handler=MyMessageHandler(),
)
`
```
###
[​
](#available-handler-methods)
Available Handler Methods
All handler methods receive a single argument - the specific message type:
## Message Handler Methods
[​
](#param-on-message-message)
on\_message(message)
Any MCP message
Called for ALL messages (requests and notifications)
[​
](#param-on-request-request)
on\_request(request)
mcp.types.ClientRequest
Called for requests that expect responses
[​
](#param-on-notification-notification)
on\_notification(notification)
mcp.types.ServerNotification
Called for notifications (fire-and-forget)
[​
](#param-on-tool-list-changed-notification)
on\_tool\_list\_changed(notification)
mcp.types.ToolListChangedNotification
Called when the server’s tool list changes
[​
](#param-on-resource-list-changed-notification)
on\_resource\_list\_changed(notification)
mcp.types.ResourceListChangedNotification
Called when the server’s resource list changes
[​
](#param-on-prompt-list-changed-notification)
on\_prompt\_list\_changed(notification)
mcp.types.PromptListChangedNotification
Called when the server’s prompt list changes
[​
](#param-on-progress-notification)
on\_progress(notification)
mcp.types.ProgressNotification
Called for progress updates during long-running operations
[​
](#param-on-logging-message-notification)
on\_logging\_message(notification)
mcp.types.LoggingMessageNotification
Called for log messages from the server
##
[​
](#example-handling-tool-changes)
Example: Handling Tool Changes
Here’s a practical example of handling tool list changes:
```
`from fastmcp.client.messages import MessageHandler
import mcp.types
class ToolCacheHandler(MessageHandler):
def \_\_init\_\_(self):
self.cached\_tools = []
async def on\_tool\_list\_changed(
self, notification: mcp.types.ToolListChangedNotification
) -\> None:
"""Clear tool cache when tools change."""
print("Tools changed - clearing cache")
self.cached\_tools = [] # Force refresh on next access
client = Client("server.py", message\_handler=ToolCacheHandler())
`
```
##
[​
](#handling-requests)
Handling Requests
While the message handler receives server-initiated requests, for most use cases you should use the dedicated callback parameters instead:
* **Sampling requests**: Use [`sampling\_handler`](/v2/clients/sampling)
* **Progress requests**: Use [`progress\_handler`](/v2/clients/progress)
* **Log requests**: Use [`log\_handler`](/v2/clients/logging)
The message handler is primarily for monitoring and handling notifications rather than responding to requests.