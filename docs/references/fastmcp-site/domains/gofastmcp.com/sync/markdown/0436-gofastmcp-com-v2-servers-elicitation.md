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
New in version `2.10.0`
User elicitation allows MCP servers to request structured input from users during tool execution. Instead of requiring all inputs upfront, tools can interactively ask for missing parameters, clarification, or additional context as needed.
Most of the examples in this document assume you have a FastMCP server instance named `mcp` and show how to use the `ctx.elicit` method to request user input from an `@mcp.tool`-decorated function.
##
[​
](#what-is-elicitation)
What is Elicitation?
Elicitation enables tools to pause execution and request specific information from users. This is particularly useful for:
* **Missing parameters**: Ask for required information not provided initially
* **Clarification requests**: Get user confirmation or choices for ambiguous scenarios
* **Progressive disclosure**: Collect complex information step-by-step
* **Dynamic workflows**: Adapt tool behavior based on user responses
For example, a file management tool might ask “Which directory should I create?” or a data analysis tool might request “What date range should I analyze?”
###
[​
](#basic-usage)
Basic Usage
Use the `ctx.elicit()` method within any tool function to request user input:
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
##
[​
](#method-signature)
Method Signature
## Context Elicitation Method
[​
](#param-ctx-elicit)
ctx.elicit
async method
Show Parameters
[​
](#param-message)
message
str
The prompt message to display to the user
[​
](#param-response-type)
response\_type
type
default:"None"
The Python type defining the expected response structure (dataclass, primitive type, etc.) Note that elicitation responses are subject to a restricted subset of JSON Schema types. See [Supported Response Types](#supported-response-types) for more details.
Show Response
[​
](#param-elicitation-result)
ElicitationResult
object
Result object containing the user’s response
Show properties
[​
](#param-action)
action
Literal['accept', 'decline', 'cancel']
How the user responded to the request
[​
](#param-data)
data
response\_type | None
The user’s input data (only present when action is “accept”)
##
[​
](#elicitation-actions)
Elicitation Actions
The elicitation result contains an `action` field indicating how the user responded:
* **`accept`**: User provided valid input - data is available in the `data` field
* **`decline`**: User chose not to provide the requested information and the data field is `None`
* **`cancel`**: User cancelled the entire operation and the data field is `None`
```
`@mcp.tool
async def my\_tool(ctx: Context) -\> str:
result = await ctx.elicit("Choose an action")
if result.action == "accept":
return "Accepted!"
elif result.action == "decline":
return "Declined!"
else:
return "Cancelled!"
`
```
FastMCP also provides typed result classes for pattern matching on the `action` field:
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
##
[​
](#response-types)
Response Types
The server must send a schema to the client indicating the type of data it expects in response to the elicitation request. If the request is `accept`-ed, the client must send a response that matches the schema.
The MCP spec only supports a limited subset of JSON Schema types for elicitation responses. Specifically, it only supports JSON **objects** with **primitive** properties including `string`, `number` (or `integer`), `boolean` and `enum` fields.
FastMCP makes it easy to request a broader range of types, including scalars (e.g. `str`) or no response at all, by automatically wrapping them in MCP-compatible object schemas.
###
[​
](#scalar-types)
Scalar Types
You can request simple scalar data types for basic input, such as a string, integer, or boolean.
When you request a scalar type, FastMCP automatically wraps it in an object schema for MCP spec compatibility. Clients will see a corresponding schema requesting a single “value” field of the requested type. Once clients respond, the provided object is “unwrapped” and the scalar value is returned to your tool function as the `data` field of the `ElicitationResult` object.
As a developer, this means you do not have to worry about creating or accessing a structured object when you only need a scalar value.
Request a string
Request an integer
Request a boolean
```
`@mcp.tool
async def get\_user\_name(ctx: Context) -\> str:
"""Get the user's name."""
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
Sometimes, the goal of an elicitation is to simply get a user to approve or reject an action. In this case, you can pass `None` as the response type to indicate that no response is expected. In order to comply with the MCP spec, the client will see a schema requesting an empty object in response. In this case, the `data` field of the `ElicitationResult` object will be `None` when the user accepts the elicitation.
No response
```
`@mcp.tool
async def approve\_action(ctx: Context) -\> str:
"""Approve an action."""
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
Often you’ll want to constrain the user’s response to a specific set of values. You can do this by using a `Literal` type or a Python enum as the response type, or by passing a list of strings to the `response\_type` parameter as a convenient shortcut.
Using a list of strings
Using a Literal type
Using a Python enum
```
`@mcp.tool
async def set\_priority(ctx: Context) -\> str:
"""Set task priority level."""
result = await ctx.elicit(
"What priority level?",
response\_type=["low", "medium", "high"],
)
if result.action == "accept":
return f"Priority set to: {result.data}"
`
```
####
[​
](#multi-select)
Multi-Select
New in version `2.14.0`
Enable multi-select by wrapping your choices in an additional list level. This allows users to select multiple values from the available options.
List of a list of strings
list[Enum] type annotation
```
`@mcp.tool
async def select\_tags(ctx: Context) -\> str:
"""Select multiple tags."""
result = await ctx.elicit(
"Choose tags",
response\_type=[["bug", "feature", "documentation"]] # Note: list of a list
)
if result.action == "accept":
tags = result.data # List of selected strings
return f"Selected tags: {', '.join(tags)}"
`
```
For titled multi-select, wrap a dict in a list (see [Titled Options](#titled-options) for dict syntax):
```
`@mcp.tool
async def select\_priorities(ctx: Context) -\> str:
"""Select multiple priorities."""
result = await ctx.elicit(
"Choose priorities",
response\_type=[{ # Note: list containing a dict
"low": {"title": "Low Priority"},
"medium": {"title": "Medium Priority"},
"high": {"title": "High Priority"}
}]
)
if result.action == "accept":
priorities = result.data # List of selected strings
return f"Selected: {', '.join(priorities)}"
`
```
####
[​
](#titled-options)
Titled Options
New in version `2.14.0`
For better UI display, you can provide human-readable titles for enum options. FastMCP generates SEP-1330 compliant schemas using the `oneOf` pattern with `const` and `title` fields.
Use a dict to specify titles for enum values:
```
`@mcp.tool
async def set\_priority(ctx: Context) -\> str:
"""Set task priority level."""
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
"""Select multiple priorities."""
result = await ctx.elicit(
"Choose priorities",
response\_type=[{ # List containing a dict for multi-select
"low": {"title": "Low Priority"},
"medium": {"title": "Medium Priority"},
"high": {"title": "High Priority"}
}]
)
if result.action == "accept":
priorities = result.data # List of selected strings
return f"Selected: {', '.join(priorities)}"
`
```
###
[​
](#structured-responses)
Structured Responses
You can request structured data with multiple fields by using a dataclass, typed dict, or Pydantic model as the response type. Note that the MCP spec only supports shallow objects with scalar (string, number, boolean) or enum properties.
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
"""Create a new task with user-provided details."""
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
You can provide default values for elicitation fields using Pydantic’s `Field(default=...)`. Clients will pre-populate form fields with these defaults, making it easier for users to provide input.
Default values are supported for all primitive types:
* Strings: `Field(default="[email protected]")`
* Integers: `Field(default=50)`
* Numbers: `Field(default=3.14)`
* Booleans: `Field(default=False)`
* Enums: `Field(default=EnumValue.A)`
Fields with default values are automatically marked as optional (not included in the `required` list), so users can accept the default or provide their own value.
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
##
[​
](#multi-turn-elicitation)
Multi-Turn Elicitation
Tools can make multiple elicitation calls to gather information progressively:
```
`@mcp.tool
async def plan\_meeting(ctx: Context) -\> str:
"""Plan a meeting by gathering details step by step."""
# Get meeting title
title\_result = await ctx.elicit("What's the meeting title?", response\_type=str)
if title\_result.action != "accept":
return "Meeting planning cancelled"
# Get duration
duration\_result = await ctx.elicit("Duration in minutes?", response\_type=int)
if duration\_result.action != "accept":
return "Meeting planning cancelled"
# Get priority
priority\_result = await ctx.elicit(
"Is this urgent?",
response\_type=Literal["yes", "no"]
)
if priority\_result.action != "accept":
return "Meeting planning cancelled"
urgent = priority\_result.data == "yes"
return f"Meeting '{title\_result.data}' planned for {duration\_result.data} minutes (Urgent: {urgent})"
`
```
##
[​
](#client-requirements)
Client Requirements
Elicitation requires the client to implement an elicitation handler. See [Client Elicitation](/v2/clients/elicitation) for details on how clients can handle these requests.
If a client doesn’t support elicitation, calls to `ctx.elicit()` will raise an error indicating that elicitation is not supported.