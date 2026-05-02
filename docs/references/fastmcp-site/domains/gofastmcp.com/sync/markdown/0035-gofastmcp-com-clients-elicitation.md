User Elicitation - FastMCP
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
New in version `2.10.0`
Use this when you need to respond to server requests for user input during tool execution.
Elicitation allows MCP servers to request structured input from users during operations. Instead of requiring all inputs upfront, servers can interactively ask for missing parameters, request clarification, or gather additional context.
##
[​
](#handler-template)
Handler Template
```
`from fastmcp import Client
from fastmcp.client.elicitation import ElicitResult, ElicitRequestParams, RequestContext
async def elicitation\_handler(
message: str,
response\_type: type | None,
params: ElicitRequestParams,
context: RequestContext
) -\> ElicitResult | object:
"""
Handle server requests for user input.
Args:
message: The prompt to display to the user
response\_type: Python dataclass type for the response (None if no data expected)
params: Original MCP elicitation parameters including raw JSON schema
context: Request context with metadata
Returns:
- Data directly (implicitly accepts the elicitation)
- ElicitResult for explicit control over the action
"""
# Present the message and collect input
user\_input = input(f"{message}: ")
if not user\_input:
return ElicitResult(action="decline")
# Create response using the provided dataclass type
return response\_type(value=user\_input)
client = Client(
"my\_mcp\_server.py",
elicitation\_handler=elicitation\_handler,
)
`
```
##
[​
](#how-it-works)
How It Works
When a server needs user input, it sends an elicitation request with a message prompt and a JSON schema describing the expected response structure. FastMCP automatically converts this schema into a Python dataclass type, making it easy to construct properly typed responses without manually parsing JSON schemas.
The handler receives four parameters:
## Handler Parameters
[​
](#param-message)
message
str
The prompt message to display to the user
[​
](#param-response-type)
response\_type
type | None
A Python dataclass type that FastMCP created from the server’s JSON schema. Use this to construct your response with proper typing. If the server requests an empty object, this will be `None`.
[​
](#param-params)
params
ElicitRequestParams
The original MCP elicitation parameters, including the raw JSON schema in `params.requestedSchema`
[​
](#param-context)
context
RequestContext
Request context containing metadata about the elicitation request
##
[​
](#response-actions)
Response Actions
You can return data directly, which implicitly accepts the elicitation:
```
`async def elicitation\_handler(message, response\_type, params, context):
user\_input = input(f"{message}: ")
return response\_type(value=user\_input) # Implicit accept
`
```
Or return an `ElicitResult` for explicit control over the action:
```
`from fastmcp.client.elicitation import ElicitResult
async def elicitation\_handler(message, response\_type, params, context):
user\_input = input(f"{message}: ")
if not user\_input:
return ElicitResult(action="decline") # User declined
if user\_input == "cancel":
return ElicitResult(action="cancel") # Cancel entire operation
return ElicitResult(
action="accept",
content=response\_type(value=user\_input)
)
`
```
**Action types:**
* **`accept`**: User provided valid input. Include the data in the `content` field.
* **`decline`**: User chose not to provide the requested information. Omit `content`.
* **`cancel`**: User cancelled the entire operation. Omit `content`.
##
[​
](#example)
Example
A file management tool might ask which directory to create:
```
`from fastmcp import Client
from fastmcp.client.elicitation import ElicitResult
async def elicitation\_handler(message, response\_type, params, context):
print(f"Server asks: {message}")
user\_response = input("Your response: ")
if not user\_response:
return ElicitResult(action="decline")
# Use the response\_type dataclass to create a properly structured response
return response\_type(value=user\_response)
client = Client(
"my\_mcp\_server.py",
elicitation\_handler=elicitation\_handler
)
`
```