User Elicitation - FastMCP
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
New in version `2.10.0`
##
[​
](#what-is-elicitation)
What is Elicitation?
Elicitation allows MCP servers to request structured input from users during tool execution. Instead of requiring all inputs upfront, servers can interactively ask users for information as needed - like prompting for missing parameters, requesting clarification, or gathering additional context.
For example, a file management tool might ask “Which directory should I create?” or a data analysis tool might request “What date range should I analyze?”
##
[​
](#how-fastmcp-makes-elicitation-easy)
How FastMCP Makes Elicitation Easy
FastMCP’s client provides a helpful abstraction layer that:
* **Converts JSON schemas to Python types**: The raw MCP protocol uses JSON schemas, but FastMCP automatically converts these to Python dataclasses
* **Provides structured constructors**: Instead of manually building dictionaries that match the schema, you get dataclass constructors that ensure correct structure
* **Handles type conversion**: FastMCP takes care of converting between JSON representations and Python objects
* **Runtime introspection**: You can inspect the generated dataclass fields to understand the expected structure
When you implement an elicitation handler, FastMCP gives you a dataclass type that matches the server’s schema, making it easy to create properly structured responses without having to manually parse JSON schemas.
##
[​
](#elicitation-handler)
Elicitation Handler
Provide an `elicitation\_handler` function when creating the client. FastMCP automatically converts the server’s JSON schema into a Python dataclass type, making it easy to construct the response:
```
`from fastmcp import Client
from fastmcp.client.elicitation import ElicitResult
async def elicitation\_handler(message: str, response\_type: type, params, context):
# Present the message to the user and collect input
user\_input = input(f"{message}: ")
# Create response using the provided dataclass type
# FastMCP converted the JSON schema to this Python type for you
response\_data = response\_type(value=user\_input)
# You can return data directly - FastMCP will implicitly accept the elicitation
return response\_data
# Or explicitly return an ElicitResult for more control
# return ElicitResult(action="accept", content=response\_data)
client = Client(
"my\_mcp\_server.py",
elicitation\_handler=elicitation\_handler,
)
`
```
###
[​
](#handler-parameters)
Handler Parameters
The elicitation handler receives four parameters:
## Elicitation Handler Parameters
[​
](#param-message)
message
str
The prompt message to display to the user
[​
](#param-response-type)
response\_type
type
A Python dataclass type that FastMCP created from the server’s JSON schema. Use this to construct your response with proper typing and IDE support. If the server requests an empty object (indicating no response), this will be `None`.
[​
](#param-params)
params
ElicitRequestParams
The original MCP elicitation request parameters, including the raw JSON schema in `params.requestedSchema` if you need it
[​
](#param-context)
context
RequestContext
Request context containing metadata about the elicitation request
###
[​
](#response-actions)
Response Actions
The handler can return data directly (which implicitly accepts the elicitation) or an `ElicitResult` object for more control over the response action:
## ElicitResult Structure
[​
](#param-action)
action
Literal['accept', 'decline', 'cancel']
How the user responded to the elicitation request
[​
](#param-content)
content
dataclass instance | dict | None
The user’s input data (required for “accept”, omitted for “decline”/“cancel”)
**Action Types:**
* **`accept`**: User provided valid input - include their data in the `content` field
* **`decline`**: User chose not to provide the requested information - omit `content`
* **`cancel`**: User cancelled the entire operation - omit `content`
##
[​
](#basic-example)
Basic Example
```
`from fastmcp import Client
from fastmcp.client.elicitation import ElicitResult
async def basic\_elicitation\_handler(message: str, response\_type: type, params, context):
print(f"Server asks: {message}")
# Simple text input for demonstration
user\_response = input("Your response: ")
if not user\_response:
# For non-acceptance, use ElicitResult explicitly
return ElicitResult(action="decline")
# Use the response\_type dataclass to create a properly structured response
# FastMCP handles the conversion from JSON schema to Python type
# Return data directly - FastMCP will implicitly accept the elicitation
return response\_type(value=user\_response)
client = Client(
"my\_mcp\_server.py",
elicitation\_handler=basic\_elicitation\_handler
)
`
```