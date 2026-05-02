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
New in version `2.10.0`
User elicitation allows MCP servers to request structured input from users during tool execution. Instead of requiring all inputs upfront, tools can interactively ask for missing parameters, clarification, or additional context as needed.
Elicitation enables tools to pause execution and request specific information from users:
* **Missing parameters**: Ask for required information not provided initially
* **Clarification requests**: Get user confirmation or choices for ambiguous scenarios
* **Progressive disclosure**: Collect complex information step-by-step
* **Dynamic workflows**: Adapt tool behavior based on user responses
For example, a file management tool might ask “Which directory should I create?” or a data analysis tool might request “What date range should I analyze?”
##
[​
](#overview)
Overview
Use the `ctx.elicit()` method within any tool function to request user input. Specify the message to display and the type of response you expect.
```
`from fastmcp import FastMCP, Context
from dataclasses import dataclass
mcp = FastMCP("Elicitation Server")
@dataclass
class UserInfo:
name: str
age: int
@mcp.tool
async def collect\_user\_info(ctx: Context) -\> str:
"""Collect user information through interactive prompts."""
result = await ctx.elicit(
message="Please provide your information",
response\_type=UserInfo
)
if result.action == "accept":
user = result.data
return f"Hello {user.name}, you are {user.age} years old"
elif result.action == "decline":
return "Information not provided"
else: # cancel
return "Operation cancelled"
`
```
The elicitation result contains an `action` field indicating how the user responded:
|Action|Description|
|`accept`|User provided valid input—data is available in the `data` field|
|`decline`|User chose not to provide the requested information|
|`cancel`|User cancelled the entire operation|
FastMCP also provides typed result classes for pattern matching:
```
`from fastmcp.server.elicitation import (
AcceptedElicitation,
DeclinedElicitation,
CancelledElicitation,
)
@mcp.tool
async def pattern\_example(ctx: Context) -\> str:
result = await ctx.elicit("Enter your name:", response\_type=str)
match result:
case AcceptedElicitation(data=name):
return f"Hello {name}!"
case DeclinedElicitation():
return "No name provided"
case CancelledElicitation():
return "Operation cancelled"
`
```
###
[​
](#multi-turn-elicitation)
Multi-Turn Elicitation
Tools can make multiple elicitation calls to gather information progressively:
```
`@mcp.tool
async def plan\_meeting(ctx: Context) -\> str:
"""Plan a meeting by gathering details step by step."""
title\_result = await ctx.elicit("What's the meeting title?", response\_type=str)
if title\_result.action != "accept":
return "Meeting planning cancelled"
duration\_result = await ctx.elicit("Duration in minutes?", response\_type=int)
if duration\_result.action != "accept":
return "Meeting planning cancelled"
priority\_result = await ctx.elicit(
"Is this urgent?",
response\_type=["yes", "no"]
)
if priority\_result.action != "accept":
return "Meeting planning cancelled"
urgent = priority\_result.data == "yes"
return f"Meeting '{title\_result.data}' for {duration\_result.data} minutes (Urgent: {urgent})"
`
```
###
[​
](#client-requirements)
Client Requirements
Elicitation requires the client to implement an elicitation handler. If a client doesn’t support elicitation, calls to `ctx.elicit()` will raise an error indicating that elicitation is not supported.
See [Client Elicitation](/clients/elicitation) for details on how clients handle these requests.
##
[​
](#schema-and-response-types)
Schema and Response Types
The server must send a schema to the client indicating the type of data it expects in response to the elicitation request. The MCP spec only supports a limited subset of JSON Schema types for elicitation responses—specifically JSON **objects** with **primitive** properties including `string`, `number` (or `integer`), `boolean`, and `enum` fields.
FastMCP makes it easy to request a broader range of types, including scalars (e.g. `str`) or no response at all, by automatically wrapping them in MCP-compatible object schemas.
###
[​
](#scalar-types)
Scalar Types
You can request simple scalar data types for basic input, such as a string, integer, or boolean. When you request a scalar type, FastMCP automatically wraps it in an object schema for MCP spec compatibility. Clients will see a schema requesting a single “value” field of the requested type. Once clients respond, the provided object is “unwrapped” and the scalar value is returned directly in the `data` field.
String
Integer
Boolean
```
`@mcp.tool
async def get\_user\_name(ctx: Context) -\> str:
result = await ctx.elicit("What's your name?", response\_type=str)
if result.action == "accept":
return f"Hello, {result.data}!"
return "No name provided"
`
```
###
[​
](#no-response)
No Response
Sometimes, the goal of an elicitation is to simply get a user to approve or reject an action. Pass `None` as the response type to indicate that no data is expected. The `data` field will be `None` when the user accepts.
```
`@mcp.tool
async def approve\_action(ctx: Context) -\> str:
result = await ctx.elicit("Approve this action?", response\_type=None)
if result.action == "accept":
return do\_action()
else:
raise ValueError("Action rejected")
`
```
###
[​
](#constrained-options)
Constrained Options
Constrain the user’s response to a specific set of values using a `Literal` type, Python enum, or a list of strings as a convenient shortcut.
List of strings
Literal type
Python enum
```
`@mcp.tool
async def set\_priority(ctx: Context) -\> str:
result = await ctx.elicit(
"What priority level?",
response\_type=["low", "medium", "high"],
)
if result.action == "accept":
return f"Priority set to: {result.data}"
`
```
###
[​
](#multi-select)
Multi-Select
New in version `2.14.0`
Enable multi-select by wrapping your choices in an additional list level. This allows users to select multiple values from the available options.
List of strings
list[Enum] type
```
`@mcp.tool
async def select\_tags(ctx: Context) -\> str:
result = await ctx.elicit(
"Choose tags",
response\_type=[["bug", "feature", "documentation"]] # Note: list of a list
)
if result.action == "accept":
tags = result.data
return f"Selected tags: {', '.join(tags)}"
`
```
###
[​
](#titled-options)
Titled Options
New in version `2.14.0`
For better UI display, provide human-readable titles for enum options. FastMCP generates SEP-1330 compliant schemas using the `oneOf` pattern with `const` and `title` fields.
```
`@mcp.tool
async def set\_priority(ctx: Context) -\> str:
result = await ctx.elicit(
"What priority level?",
response\_type={
"low": {"title": "Low Priority"},
"medium": {"title": "Medium Priority"},
"high": {"title": "High Priority"}
}
)
if result.action == "accept":
return f"Priority set to: {result.data}"
`
```
For multi-select with titles, wrap the dict in a list:
```
`@mcp.tool
async def select\_priorities(ctx: Context) -\> str:
result = await ctx.elicit(
"Choose priorities",
response\_type=[{
"low": {"title": "Low Priority"},
"medium": {"title": "Medium Priority"},
"high": {"title": "High Priority"}
}]
)
if result.action == "accept":
return f"Selected: {', '.join(result.data)}"
`
```
###
[​
](#structured-responses)
Structured Responses
Request structured data with multiple fields by using a dataclass, typed dict, or Pydantic model as the response type. Note that the MCP spec only supports shallow objects with scalar (string, number, boolean) or enum properties.
```
`from dataclasses import dataclass
from typing import Literal
@dataclass
class TaskDetails:
title: str
description: str
priority: Literal["low", "medium", "high"]
due\_date: str
@mcp.tool
async def create\_task(ctx: Context) -\> str:
result = await ctx.elicit(
"Please provide task details",
response\_type=TaskDetails
)
if result.action == "accept":
task = result.data
return f"Created task: {task.title} (Priority: {task.priority})"
return "Task creation cancelled"
`
```
###
[​
](#default-values)
Default Values
New in version `2.14.0`
Provide default values for elicitation fields using Pydantic’s `Field(default=...)`. Clients will pre-populate form fields with these defaults. Fields with default values are automatically marked as optional.
```
`from pydantic import BaseModel, Field
from enum import Enum
class Priority(Enum):
LOW = "low"
MEDIUM = "medium"
HIGH = "high"
class TaskDetails(BaseModel):
title: str = Field(description="Task title")
description: str = Field(default="", description="Task description")
priority: Priority = Field(default=Priority.MEDIUM, description="Task priority")
@mcp.tool
async def create\_task(ctx: Context) -\> str:
result = await ctx.elicit("Please provide task details", response\_type=TaskDetails)
if result.action == "accept":
return f"Created: {result.data.title}"
return "Task creation cancelled"
`
```
Default values are supported for strings, integers, numbers, booleans, and enums.