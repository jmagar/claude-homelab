Notifications - FastMCP
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
New in version `2.9.1`
Use this when you need to react to server-side changes like tool list updates or resource modifications.
MCP servers can send notifications to inform clients about state changes. The message handler provides a unified way to process these notifications.
##
[​
](#handling-notifications)
Handling Notifications
The simplest approach is a function that receives all messages and filters for the notifications you care about:
```
`from fastmcp import Client
async def message\_handler(message):
"""Handle MCP notifications from the server."""
if hasattr(message, 'root'):
method = message.root.method
if method == "notifications/tools/list\_changed":
print("Tools have changed - refresh tool cache")
elif method == "notifications/resources/list\_changed":
print("Resources have changed")
elif method == "notifications/prompts/list\_changed":
print("Prompts have changed")
client = Client(
"my\_mcp\_server.py",
message\_handler=message\_handler,
)
`
```
##
[​
](#messagehandler-class)
MessageHandler Class
For fine-grained targeting, subclass `MessageHandler` to use specific hooks:
```
`from fastmcp import Client
from fastmcp.client.messages import MessageHandler
import mcp.types
class MyMessageHandler(MessageHandler):
async def on\_tool\_list\_changed(
self, notification: mcp.types.ToolListChangedNotification
) -\> None:
"""Handle tool list changes."""
print("Tool list changed - refreshing available tools")
async def on\_resource\_list\_changed(
self, notification: mcp.types.ResourceListChangedNotification
) -\> None:
"""Handle resource list changes."""
print("Resource list changed")
async def on\_prompt\_list\_changed(
self, notification: mcp.types.PromptListChangedNotification
) -\> None:
"""Handle prompt list changes."""
print("Prompt list changed")
client = Client(
"my\_mcp\_server.py",
message\_handler=MyMessageHandler(),
)
`
```
###
[​
](#handler-template)
Handler Template
```
`from fastmcp.client.messages import MessageHandler
import mcp.types
class MyMessageHandler(MessageHandler):
async def on\_message(self, message) -\> None:
"""Called for ALL messages (requests and notifications)."""
pass
async def on\_notification(
self, notification: mcp.types.ServerNotification
) -\> None:
"""Called for notifications (fire-and-forget)."""
pass
async def on\_tool\_list\_changed(
self, notification: mcp.types.ToolListChangedNotification
) -\> None:
"""Called when the server's tool list changes."""
pass
async def on\_resource\_list\_changed(
self, notification: mcp.types.ResourceListChangedNotification
) -\> None:
"""Called when the server's resource list changes."""
pass
async def on\_prompt\_list\_changed(
self, notification: mcp.types.PromptListChangedNotification
) -\> None:
"""Called when the server's prompt list changes."""
pass
async def on\_progress(
self, notification: mcp.types.ProgressNotification
) -\> None:
"""Called for progress updates during long-running operations."""
pass
async def on\_logging\_message(
self, notification: mcp.types.LoggingMessageNotification
) -\> None:
"""Called for log messages from the server."""
pass
`
```
##
[​
](#list-change-notifications)
List Change Notifications
A practical example of maintaining a tool cache that refreshes when tools change:
```
`from fastmcp import Client
from fastmcp.client.messages import MessageHandler
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
](#server-requests)
Server Requests
While the message handler receives server-initiated requests, you should use dedicated callback parameters for most interactive scenarios:
* **Sampling requests**: Use [`sampling\_handler`](/clients/sampling)
* **Elicitation requests**: Use [`elicitation\_handler`](/clients/elicitation)
* **Progress updates**: Use [`progress\_handler`](/clients/progress)
* **Log messages**: Use [`log\_handler`](/clients/logging)
The message handler is primarily for monitoring and handling notifications rather than responding to requests.