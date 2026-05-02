Prompts - FastMCP
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
* [
Tools
](/v2/servers/tools)
* [
Resources
](/v2/servers/resources)
* [
Prompts
](/v2/servers/prompts)
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
Prompts are reusable message templates that help LLMs generate structured, purposeful responses. FastMCP simplifies defining these templates, primarily using the `@mcp.prompt` decorator.
##
[​
](#what-are-prompts)
What Are Prompts?
Prompts provide parameterized message templates for LLMs. When a client requests a prompt:
1. FastMCP finds the corresponding prompt definition.
2. If it has parameters, they are validated against your function signature.
3. Your function executes with the validated inputs.
4. The generated message(s) are returned to the LLM to guide its response.
This allows you to define consistent, reusable templates that LLMs can use across different clients and contexts.
##
[​
](#prompts)
Prompts
###
[​
](#the-@prompt-decorator)
The `@prompt` Decorator
The most common way to define a prompt is by decorating a Python function. The decorator uses the function name as the prompt’s identifier.
```
`from fastmcp import FastMCP
from fastmcp.prompts.prompt import Message, PromptMessage, TextContent
mcp = FastMCP(name="PromptServer")
# Basic prompt returning a string (converted to user message automatically)
@mcp.prompt
def ask\_about\_topic(topic: str) -\> str:
"""Generates a user message asking for an explanation of a topic."""
return f"Can you please explain the concept of '{topic}'?"
# Prompt returning a specific message type
@mcp.prompt
def generate\_code\_request(language: str, task\_description: str) -\> PromptMessage:
"""Generates a user message requesting code generation."""
content = f"Write a {language} function that performs the following task: {task\_description}"
return PromptMessage(role="user", content=TextContent(type="text", text=content))
`
```
**Key Concepts:**
* **Name:** By default, the prompt name is taken from the function name.
* **Parameters:** The function parameters define the inputs needed to generate the prompt.
* **Inferred Metadata:** By default:
* Prompt Name: Taken from the function name (`ask\_about\_topic`).
* Prompt Description: Taken from the function’s docstring.
Functions with `\*args` or `\*\*kwargs` are not supported as prompts. This restriction exists because FastMCP needs to generate a complete parameter schema for the MCP protocol, which isn’t possible with variable argument lists.
####
[​
](#decorator-arguments)
Decorator Arguments
While FastMCP infers the name and description from your function, you can override these and add additional metadata using arguments to the `@mcp.prompt` decorator:
```
`@mcp.prompt(
name="analyze\_data\_request", # Custom prompt name
description="Creates a request to analyze data with specific parameters", # Custom description
tags={"analysis", "data"}, # Optional categorization tags
meta={"version": "1.1", "author": "data-team"} # Custom metadata
)
def data\_analysis\_prompt(
data\_uri: str = Field(description="The URI of the resource containing the data."),
analysis\_type: str = Field(default="summary", description="Type of analysis.")
) -\> str:
"""This docstring is ignored when description is provided."""
return f"Please perform a '{analysis\_type}' analysis on the data found at {data\_uri}."
`
```
## @prompt Decorator Arguments
[​
](#param-name)
name
str | None
Sets the explicit prompt name exposed via MCP. If not provided, uses the function name
[​
](#param-title)
title
str | None
A human-readable title for the prompt
[​
](#param-description)
description
str | None
Provides the description exposed via MCP. If set, the function’s docstring is ignored for this purpose
[​
](#param-tags)
tags
set[str] | None
A set of strings used to categorize the prompt. These can be used by the server and, in some cases, by clients to filter or group available prompts.
[​
](#param-enabled)
enabled
bool
default:"True"
A boolean to enable or disable the prompt. See [Disabling Prompts](#disabling-prompts) for more information
[​
](#param-icons)
icons
list[Icon] | None
New in version `2.13.0`Optional list of icon representations for this prompt. See [Icons](/v2/servers/icons) for detailed examples
[​
](#param-meta)
meta
dict[str, Any] | None
New in version `2.11.0`Optional meta information about the prompt. This data is passed through to the MCP client as the `\_meta` field of the client-side prompt object and can be used for custom metadata, versioning, or other application-specific purposes.
###
[​
](#argument-types)
Argument Types
New in version `2.9.0`
The MCP specification requires that all prompt arguments be passed as strings, but FastMCP allows you to use typed annotations for better developer experience. When you use complex types like `list[int]` or `dict[str, str]`, FastMCP:
1. **Automatically converts** string arguments from MCP clients to the expected types
2. **Generates helpful descriptions** showing the exact JSON string format needed
3. **Preserves direct usage** - you can still call prompts with properly typed arguments
Since the MCP specification only allows string arguments, clients need to know what string format to use for complex types. FastMCP solves this by automatically enhancing the argument descriptions with JSON schema information, making it clear to both humans and LLMs how to format their arguments.
Python Code
Resulting MCP Prompt
```
`@mcp.prompt
def analyze\_data(
numbers: list[int],
metadata: dict[str, str],
threshold: float
) -\> str:
"""Analyze numerical data."""
avg = sum(numbers) / len(numbers)
return f"Average: {avg}, above threshold: {avg \> threshold}"
`
```
**MCP clients will call this prompt with string arguments:**
```
`{
"numbers": "[1, 2, 3, 4, 5]",
"metadata": "{\\"source\\": \\"api\\", \\"version\\": \\"1.0\\"}",
"threshold": "2.5"
}
`
```
**But you can still call it directly with proper types:**
```
`# This also works for direct calls
result = await prompt.render({
"numbers": [1, 2, 3, 4, 5],
"metadata": {"source": "api", "version": "1.0"},
"threshold": 2.5
})
`
```
Keep your type annotations simple when using this feature. Complex nested types or custom classes may not convert reliably from JSON strings. The automatically generated schema descriptions are the only guidance users receive about the expected format.Good choices: `list[int]`, `dict[str, str]`, `float`, `bool`
Avoid: Complex Pydantic models, deeply nested structures, custom classes
###
[​
](#return-values)
Return Values
FastMCP intelligently handles different return types from your prompt function:
* **`str`**: Automatically converted to a single `PromptMessage`.
* **`PromptMessage`**: Used directly as provided. (Note a more user-friendly `Message` constructor is available that can accept raw strings instead of `TextContent` objects.)
* **`list[PromptMessage | str]`**: Used as a sequence of messages (a conversation).
* **`Any`**: If the return type is not one of the above, the return value is attempted to be converted to a string and used as a `PromptMessage`.
```
`from fastmcp.prompts.prompt import Message, PromptResult
@mcp.prompt
def roleplay\_scenario(character: str, situation: str) -\> PromptResult:
"""Sets up a roleplaying scenario with initial messages."""
return [
Message(f"Let's roleplay. You are {character}. The situation is: {situation}"),
Message("Okay, I understand. I am ready. What happens next?", role="assistant")
]
`
```
###
[​
](#required-vs-optional-parameters)
Required vs. Optional Parameters
Parameters in your function signature are considered **required** unless they have a default value.
```
`@mcp.prompt
def data\_analysis\_prompt(
data\_uri: str, # Required - no default value
analysis\_type: str = "summary", # Optional - has default value
include\_charts: bool = False # Optional - has default value
) -\> str:
"""Creates a request to analyze data with specific parameters."""
prompt = f"Please perform a '{analysis\_type}' analysis on the data found at {data\_uri}."
if include\_charts:
prompt += " Include relevant charts and visualizations."
return prompt
`
```
In this example, the client *must* provide `data\_uri`. If `analysis\_type` or `include\_charts` are omitted, their default values will be used.
###
[​
](#disabling-prompts)
Disabling Prompts
New in version `2.8.0`
You can control the visibility and availability of prompts by enabling or disabling them. Disabled prompts will not appear in the list of available prompts, and attempting to call a disabled prompt will result in an “Unknown prompt” error.
By default, all prompts are enabled. You can disable a prompt upon creation using the `enabled` parameter in the decorator:
```
`@mcp.prompt(enabled=False)
def experimental\_prompt():
"""This prompt is not ready for use."""
return "This is an experimental prompt."
`
```
You can also toggle a prompt’s state programmatically after it has been created:
```
`@mcp.prompt
def seasonal\_prompt(): return "Happy Holidays!"
# Disable and re-enable the prompt
seasonal\_prompt.disable()
seasonal\_prompt.enable()
`
```
###
[​
](#async-prompts)
Async Prompts
FastMCP seamlessly supports both standard (`def`) and asynchronous (`async def`) functions as prompts.
```
`# Synchronous prompt
@mcp.prompt
def simple\_question(question: str) -\> str:
"""Generates a simple question to ask the LLM."""
return f"Question: {question}"
# Asynchronous prompt
@mcp.prompt
async def data\_based\_prompt(data\_id: str) -\> str:
"""Generates a prompt based on data that needs to be fetched."""
# In a real scenario, you might fetch data from a database or API
async with aiohttp.ClientSession() as session:
async with session.get(f"https://api.example.com/data/{data\_id}") as response:
data = await response.json()
return f"Analyze this data: {data['content']}"
`
```
Use `async def` when your prompt function performs I/O operations like network requests, database queries, file I/O, or external service calls.
###
[​
](#accessing-mcp-context)
Accessing MCP Context
New in version `2.2.5`
Prompts can access additional MCP information and features through the `Context` object. To access it, add a parameter to your prompt function with a type annotation of `Context`:
```
`from fastmcp import FastMCP, Context
mcp = FastMCP(name="PromptServer")
@mcp.prompt
async def generate\_report\_request(report\_type: str, ctx: Context) -\> str:
"""Generates a request for a report."""
return f"Please create a {report\_type} report. Request ID: {ctx.request\_id}"
`
```
For full documentation on the Context object and all its capabilities, see the [Context documentation](/v2/servers/context).
###
[​
](#notifications)
Notifications
New in version `2.9.1`
FastMCP automatically sends `notifications/prompts/list\_changed` notifications to connected clients when prompts are added, enabled, or disabled. This allows clients to stay up-to-date with the current prompt set without manually polling for changes.
```
`@mcp.prompt
def example\_prompt() -\> str:
return "Hello!"
# These operations trigger notifications:
mcp.add\_prompt(example\_prompt) # Sends prompts/list\_changed notification
example\_prompt.disable() # Sends prompts/list\_changed notification
example\_prompt.enable() # Sends prompts/list\_changed notification
`
```
Notifications are only sent when these operations occur within an active MCP request context (e.g., when called from within a tool or other MCP operation). Operations performed during server initialization do not trigger notifications.
Clients can handle these notifications using a [message handler](/v2/clients/messages) to automatically refresh their prompt lists or update their interfaces.
##
[​
](#server-behavior)
Server Behavior
###
[​
](#duplicate-prompts)
Duplicate Prompts
New in version `2.1.0`
You can configure how the FastMCP server handles attempts to register multiple prompts with the same name. Use the `on\_duplicate\_prompts` setting during `FastMCP` initialization.
```
`from fastmcp import FastMCP
mcp = FastMCP(
name="PromptServer",
on\_duplicate\_prompts="error" # Raise an error if a prompt name is duplicated
)
@mcp.prompt
def greeting(): return "Hello, how can I help you today?"
# This registration attempt will raise a ValueError because
# "greeting" is already registered and the behavior is "error".
# @mcp.prompt
# def greeting(): return "Hi there! What can I do for you?"
`
```
The duplicate behavior options are:
* `"warn"` (default): Logs a warning, and the new prompt replaces the old one.
* `"error"`: Raises a `ValueError`, preventing the duplicate registration.
* `"replace"`: Silently replaces the existing prompt with the new one.
* `"ignore"`: Keeps the original prompt and ignores the new registration attempt.