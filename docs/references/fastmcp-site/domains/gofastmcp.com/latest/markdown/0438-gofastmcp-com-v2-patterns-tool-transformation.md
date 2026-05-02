Tool Transformation - FastMCP
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
New in version `2.8.0`
Tool transformation allows you to create new, enhanced tools from existing ones. This powerful feature enables you to adapt tools for different contexts, simplify complex interfaces, or add custom logic without duplicating code.
##
[​
](#why-transform-tools)
Why Transform Tools?
Often, an existing tool is *almost* perfect for your use case, but it might have:
* A confusing description (or no description at all).
* Argument names or descriptions that are not intuitive for an LLM (e.g., `q` instead of `query`).
* Unnecessary parameters that you want to hide from the LLM.
* A need for input validation before the original tool is called.
* A need to modify or format the tool’s output.
Instead of rewriting the tool from scratch, you can **transform** it to fit your needs.
##
[​
](#basic-transformation)
Basic Transformation
The primary way to create a transformed tool is with the `Tool.from\_tool()` class method. At its simplest, you can use it to change a tool’s top-level metadata like its `name`, `description`, or `tags`.
In the following simple example, we take a generic `search` tool and adjust its name and description to help an LLM client better understand its purpose.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
mcp = FastMCP()
# The original, generic tool
@mcp.tool
def search(query: str, category: str = "all") -\> list[dict]:
"""Searches for items in the database."""
return database.search(query, category)
# Create a more domain-specific version by changing its metadata
product\_search\_tool = Tool.from\_tool(
search,
name="find\_products",
description="""
Search for products in the e-commerce catalog.
Use this when customers ask about finding specific items,
checking availability, or browsing product categories.
""",
)
mcp.add\_tool(product\_search\_tool)
`
```
When you transform a tool, the original tool remains registered on the server. To avoid confusing an LLM with two similar tools, you can disable the original one:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
mcp = FastMCP()
# The original, generic tool
@mcp.tool
def search(query: str, category: str = "all") -\> list[dict]:
...
# Create a more domain-specific version
product\_search\_tool = Tool.from\_tool(search, ...)
mcp.add\_tool(product\_search\_tool)
# Disable the original tool
search.disable()
`
```
Now, clients see a tool named `find\_products` with a clear, domain-specific purpose and relevant tags, even though it still uses the original generic `search` function’s logic.
###
[​
](#parameters)
Parameters
The `Tool.from\_tool()` class method is the primary way to create a transformed tool. It takes the following parameters:
* `tool`: The tool to transform. This is the only required argument.
* `name`: An optional name for the new tool.
* `description`: An optional description for the new tool.
* `transform\_args`: A dictionary of `ArgTransform` objects, one for each argument you want to modify.
* `transform\_fn`: An optional function that will be called instead of the parent tool’s logic.
* `output\_schema`: Control output schema and structured outputs (see [Output Schema Control](#output-schema-control)).
* `tags`: An optional set of tags for the new tool.
* `annotations`: An optional set of `ToolAnnotations` for the new tool.
* `serializer`: An optional function that will be called to serialize the result of the new tool.
* `meta`: Control meta information for the tool. Use `None` to remove meta, any dict to set meta, or leave unset to inherit from parent.
The result is a new `TransformedTool` object that wraps the parent tool and applies the transformations you specify. You can add this tool to your MCP server using its `add\_tool()` method.
##
[​
](#modifying-arguments)
Modifying Arguments
To modify a tool’s parameters, provide a dictionary of `ArgTransform` objects to the `transform\_args` parameter of `Tool.from\_tool()`. Each key is the name of the *original* argument you want to modify.
You only need to provide a `transform\_args` entry for arguments you want to modify. All other arguments will be passed through unchanged.
###
[​
](#the-argtransform-class)
The ArgTransform Class
To modify an argument, you need to create an `ArgTransform` object. This object has the following parameters:
* `name`: The new name for the argument.
* `description`: The new description for the argument.
* `default`: The new default value for the argument.
* `default\_factory`: A function that will be called to generate a default value for the argument. This is useful for arguments that need to be generated for each tool call, such as timestamps or unique IDs.
* `hide`: Whether to hide the argument from the LLM.
* `required`: Whether the argument is required, usually used to make an optional argument be required instead.
* `type`: The new type for the argument.
Certain combinations of parameters are not allowed. For example, you can only use `default\_factory` with `hide=True`, because dynamic defaults cannot be represented in a JSON schema for the client. You can only set required=True for arguments that do not declare a default value.
###
[​
](#descriptions)
Descriptions
By far the most common reason to transform a tool, after its own description, is to improve its argument descriptions. A good description is crucial for helping an LLM understand how to use a parameter correctly. This is especially important when wrapping tools from external APIs, whose argument descriptions may be missing or written for developers, not LLMs.
In this example, we add a helpful description to the `user\_id` argument:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import ArgTransform
mcp = FastMCP()
@mcp.tool
def find\_user(user\_id: str):
"""Finds a user by their ID."""
...
new\_tool = Tool.from\_tool(
find\_user,
transform\_args={
"user\_id": ArgTransform(
description=(
"The unique identifier for the user, "
"usually in the format 'usr-xxxxxxxx'."
)
)
}
)
`
```
###
[​
](#names)
Names
At times, you may want to rename an argument to make it more intuitive for an LLM.
For example, in the following example, we take a generic `q` argument and expand it to `search\_query`:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import ArgTransform
mcp = FastMCP()
@mcp.tool
def search(q: str):
"""Searches for items in the database."""
return database.search(q)
new\_tool = Tool.from\_tool(
search,
transform\_args={
"q": ArgTransform(name="search\_query")
}
)
`
```
###
[​
](#default-values)
Default Values
You can update the default value for any argument using the `default` parameter. Here, we change the default value of the `y` argument to 10:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import ArgTransform
mcp = FastMCP()
@mcp.tool
def add(x: int, y: int) -\> int:
"""Adds two numbers."""
return x + y
new\_tool = Tool.from\_tool(
add,
transform\_args={
"y": ArgTransform(default=10)
}
)
`
```
Default values are especially useful in combination with hidden arguments.
###
[​
](#hiding-arguments)
Hiding Arguments
Sometimes a tool requires arguments that shouldn’t be exposed to the LLM, such as API keys, configuration flags, or internal IDs. You can hide these parameters using `hide=True`. Note that you can only hide arguments that have a default value (or for which you provide a new default), because the LLM can’t provide a value at call time.
To pass a constant value to the parent tool, combine `hide=True` with `default=\<value\>`.
```
`import os
from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import ArgTransform
mcp = FastMCP()
@mcp.tool
def send\_email(to: str, subject: str, body: str, api\_key: str):
"""Sends an email."""
...
# Create a simplified version that hides the API key
new\_tool = Tool.from\_tool(
send\_email,
name="send\_notification",
transform\_args={
"api\_key": ArgTransform(
hide=True,
default=os.environ.get("EMAIL\_API\_KEY"),
)
}
)
`
```
The LLM now only sees the `to`, `subject`, and `body` parameters. The `api\_key` is supplied automatically from an environment variable.
For values that must be generated for each tool call (like timestamps or unique IDs), use `default\_factory`, which is called with no arguments every time the tool is called. For example,
```
`transform\_args = {
'timestamp': ArgTransform(
hide=True,
default\_factory=lambda: datetime.now(),
)
}
`
```
`default\_factory` can only be used with `hide=True`. This is because visible parameters need static defaults that can be represented in a JSON schema for the client.
###
[​
](#meta-information)
Meta Information
New in version `2.11.0`
You can control meta information on transformed tools using the `meta` parameter. Meta information is additional data about the tool that doesn’t affect its functionality but can be used by clients for categorization, routing, or other purposes.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
mcp = FastMCP()
@mcp.tool
def analyze\_data(data: str) -\> dict:
"""Analyzes the provided data."""
return {"result": f"Analysis of {data}"}
# Add custom meta information
enhanced\_tool = Tool.from\_tool(
analyze\_data,
name="enhanced\_analyzer",
meta={
"category": "analytics",
"priority": "high",
"requires\_auth": True
}
)
mcp.add\_tool(enhanced\_tool)
`
```
You can also remove meta information entirely:
```
`# Remove meta information from parent tool
simplified\_tool = Tool.from\_tool(
analyze\_data,
name="simple\_analyzer",
meta=None # Removes any meta information
)
`
```
If you don’t specify the `meta` parameter, the transformed tool inherits the parent tool’s meta information.
###
[​
](#required-values)
Required Values
In rare cases where you want to make an optional argument required, you can set `required=True`. This has no effect if the argument was already required.
```
`transform\_args = {
'user\_id': ArgTransform(
required=True,
)
}
`
```
##
[​
](#modifying-tool-behavior)
Modifying Tool Behavior
With great power comes great responsibility. Modifying tool behavior is a very advanced feature.
In addition to changing a tool’s schema, advanced users can also modify its behavior. This is useful for adding validation logic, or for post-processing the tool’s output.
The `from\_tool()` method takes a `transform\_fn` parameter, which is an async function that replaces the parent tool’s logic and gives you complete control over the tool’s execution.
###
[​
](#the-transform-function)
The Transform Function
The `transform\_fn` is an async function that **completely replaces** the parent tool’s logic.
Critically, the transform function’s arguments are used to determine the new tool’s final schema. Any arguments that are not already present in the parent tool schema OR the `transform\_args` will be added to the new tool’s schema. Note that when `transform\_args` and your function have the same argument name, the `transform\_args` metadata will take precedence, if provided.
```
`async def my\_custom\_logic(user\_input: str, max\_length: int = 100) -\> str:
# Your custom logic here - this completely replaces the parent tool
return f"Custom result for: {user\_input[:max\_length]}"
Tool.from\_tool(transform\_fn=my\_custom\_logic)
`
```
The name / docstring of the `transform\_fn` are ignored. Only its arguments are used to determine the final schema.
###
[​
](#calling-the-parent-tool)
Calling the Parent Tool
Most of the time, you don’t want to completely replace the parent tool’s behavior. Instead, you want to add validation, modify inputs, or post-process outputs while still leveraging the parent tool’s core functionality. For this, FastMCP provides the special `forward()` and `forward\_raw()` functions.
Both `forward()` and `forward\_raw()` are async functions that let you call the parent tool from within your `transform\_fn`:
* **`forward()`** (recommended): Automatically handles argument mapping based on your `ArgTransform` configurations. Call it with the transformed argument names.
* **`forward\_raw()`**: Bypasses all transformation and calls the parent tool directly with its original argument names. This is rarely needed unless you’re doing complex argument manipulation, perhaps without `arg\_transforms`.
The most common transformation pattern is to validate (potentially renamed) arguments before calling the parent tool. Here’s an example that validates that `x` and `y` are positive before calling the parent tool:
*
Using forward()
*
Using forward() with renamed args
*
Using forward\_raw()
In the simplest case, your parent tool and your transform function have the same arguments. You can call `forward()` with the same argument names as the parent tool:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import forward
mcp = FastMCP()
@mcp.tool
def add(x: int, y: int) -\> int:
"""Adds two numbers."""
return x + y
async def ensure\_positive(x: int, y: int) -\> int:
if x \<= 0 or y \<= 0:
raise ValueError("x and y must be positive")
return await forward(x=x, y=y)
new\_tool = Tool.from\_tool(
add,
transform\_fn=ensure\_positive,
)
mcp.add\_tool(new\_tool)
`
```
When your transformed tool has different argument names than the parent tool, you can call `forward()` with the renamed arguments and it will automatically map the arguments to the parent tool’s arguments:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import forward
mcp = FastMCP()
@mcp.tool
def add(x: int, y: int) -\> int:
"""Adds two numbers."""
return x + y
async def ensure\_positive(a: int, b: int) -\> int:
if a \<= 0 or b \<= 0:
raise ValueError("a and b must be positive")
return await forward(a=a, b=b)
new\_tool = Tool.from\_tool(
add,
transform\_fn=ensure\_positive,
transform\_args={
"x": ArgTransform(name="a"),
"y": ArgTransform(name="b"),
}
)
mcp.add\_tool(new\_tool)
`
```
Finally, you can use `forward\_raw()` to bypass all argument mapping and call the parent tool directly with its original argument names.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import forward
mcp = FastMCP()
@mcp.tool
def add(x: int, y: int) -\> int:
"""Adds two numbers."""
return x + y
async def ensure\_positive(a: int, b: int) -\> int:
if a \<= 0 or b \<= 0:
raise ValueError("a and b must be positive")
return await forward\_raw(x=a, y=b)
new\_tool = Tool.from\_tool(
add,
transform\_fn=ensure\_positive,
transform\_args={
"x": ArgTransform(name="a"),
"y": ArgTransform(name="b"),
}
)
mcp.add\_tool(new\_tool)
`
```
###
[​
](#passing-arguments-with-kwargs)
Passing Arguments with \*\*kwargs
If your `transform\_fn` includes `\*\*kwargs` in its signature, it will receive **all arguments from the parent tool after `ArgTransform` configurations have been applied**. This is powerful for creating flexible validation functions that don’t require you to add every argument to the function signature.
In the following example, we wrap a parent tool that accepts two arguments `x` and `y`. These are renamed to `a` and `b` in the transformed tool, and the transform only validates `a`, passing the other argument through as `\*\*kwargs`.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import forward, ArgTransform
mcp = FastMCP()
@mcp.tool
def add(x: int, y: int) -\> int:
"""Adds two numbers."""
return x + y
async def ensure\_a\_positive(a: int, \*\*kwargs) -\> int:
if a \<= 0:
raise ValueError("a must be positive")
return await forward(a=a, \*\*kwargs)
new\_tool = Tool.from\_tool(
add,
transform\_fn=ensure\_a\_positive,
transform\_args={
"x": ArgTransform(name="a"),
"y": ArgTransform(name="b"),
}
)
mcp.add\_tool(new\_tool)
`
```
In the above example, `\*\*kwargs` receives the renamed argument `b`, not the original argument `y`. It is therefore recommended to use with `forward()`, not `forward\_raw()`.
##
[​
](#modifying-mcp-tools-with-mcpconfig)
Modifying MCP Tools with MCPConfig
When running MCP Servers under FastMCP with `MCPConfig`, you can also apply a subset of tool transformations
directly in the MCPConfig json file.
```
`{
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"transport": "http",
"tools": {
"weather\_get\_forecast": {
"name": "miami\_weather",
"description": "Get the weather for Miami",
"meta": {
"category": "weather",
"location": "miami"
},
"arguments": {
"city": {
"name": "city",
"default": "Miami",
"hide": True,
}
}
}
}
}
}
}
`
```
The `tools` section is a dictionary of tool names to tool configurations. Each tool configuration is a
dictionary of tool properties.
See the [MCPConfigTransport](/v2/clients/transports#tool-transformation-with-fastmcp-and-mcpconfig) documentation for more details.
##
[​
](#output-schema-control)
Output Schema Control
New in version `2.10.0`
Transformed tools inherit output schemas from their parent by default, but you can control this behavior:
**Inherit from Parent (Default)**
```
`Tool.from\_tool(parent\_tool, name="renamed\_tool")
`
```
The transformed tool automatically uses the parent tool’s output schema and structured output behavior.
**Custom Output Schema**
```
`Tool.from\_tool(parent\_tool, output\_schema={
"type": "object",
"properties": {"status": {"type": "string"}}
})
`
```
Provide your own schema that differs from the parent. The tool must return data matching this schema.
**Remove Output Schema**
```
`Tool.from\_tool(parent\_tool, output\_schema=None)
`
```
Removes the output schema declaration. Automatic structured content still works for object-like returns (dict, dataclass, Pydantic models) but primitive types won’t be structured.
**Full Control with Transform Functions**
```
`async def custom\_output(\*\*kwargs) -\> ToolResult:
result = await forward(\*\*kwargs)
return ToolResult(content=[...], structured\_content={...})
Tool.from\_tool(parent\_tool, transform\_fn=custom\_output)
`
```
Use a transform function returning `ToolResult` for complete control over both content blocks and structured outputs.
##
[​
](#common-patterns)
Common Patterns
Tool transformation is a flexible feature that supports many powerful patterns. Here are a few common use cases to give you ideas.
###
[​
](#exposing-client-methods-as-tools)
Exposing Client Methods as Tools
A powerful use case for tool transformation is exposing methods from existing Python clients (GitHub clients, API clients, database clients, etc.) directly as MCP tools. This pattern eliminates boilerplate wrapper functions and treats tools as annotations around client methods.
**Without Tool Transformation**, you typically create wrapper functions that duplicate annotations:
```
`async def get\_repository(
owner: Annotated[str, "The owner of the repository."],
repo: Annotated[str, "The name of the repository."],
) -\> Repository:
"""Get basic information about a GitHub repository."""
return await github\_client.get\_repository(owner=owner, repo=repo)
`
```
**With Tool Transformation**, you can wrap the client method directly:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import ArgTransform
mcp = FastMCP("GitHub Tools")
# Wrap a client method directly as a tool
get\_repo\_tool = Tool.from\_tool(
tool=Tool.from\_function(fn=github\_client.get\_repository),
description="Get basic information about a GitHub repository.",
transform\_args={
"owner": ArgTransform(description="The owner of the repository."),
"repo": ArgTransform(description="The name of the repository."),
}
)
mcp.add\_tool(get\_repo\_tool)
`
```
This pattern keeps the implementation in your client and treats the tool as an annotation layer, avoiding duplicate code.
####
[​
](#hiding-client-specific-arguments)
Hiding Client-Specific Arguments
Client methods often have internal parameters (debug flags, auth tokens, rate limit settings) that shouldn’t be exposed to LLMs. Use `hide=True` with a default value to handle these automatically:
```
`get\_issues\_tool = Tool.from\_tool(
tool=Tool.from\_function(fn=github\_client.get\_issues),
description="Get issues from a GitHub repository.",
transform\_args={
"owner": ArgTransform(description="The owner of the repository."),
"repo": ArgTransform(description="The name of the repository."),
"limit": ArgTransform(description="Maximum number of issues to return."),
# Hide internal parameters
"include\_debug\_info": ArgTransform(hide=True, default=False),
"error\_on\_not\_found": ArgTransform(hide=True, default=True),
}
)
mcp.add\_tool(get\_issues\_tool)
`
```
The LLM only sees `owner`, `repo`, and `limit`. Internal parameters are supplied automatically.
####
[​
](#reusable-argument-patterns)
Reusable Argument Patterns
When wrapping multiple client methods, you can define reusable argument transformations. This scales well for larger tool sets and keeps annotations consistent:
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool
from fastmcp.tools.tool\_transform import ArgTransform
mcp = FastMCP("GitHub Tools")
# Define reusable argument patterns
OWNER\_ARG = ArgTransform(description="The repository owner.")
REPO\_ARG = ArgTransform(description="The repository name.")
LIMIT\_ARG = ArgTransform(description="Maximum number of items to return.")
HIDE\_ERROR = ArgTransform(hide=True, default=True)
def create\_github\_tools(client):
"""Create tools from GitHub client methods with shared argument patterns."""
owner\_repo\_args = {
"owner": OWNER\_ARG,
"repo": REPO\_ARG,
}
error\_args = {
"error\_on\_not\_found": HIDE\_ERROR,
}
return [
Tool.from\_tool(
tool=Tool.from\_function(fn=client.get\_repository),
description="Get basic information about a GitHub repository.",
transform\_args={\*\*owner\_repo\_args, \*\*error\_args}
),
Tool.from\_tool(
tool=Tool.from\_function(fn=client.get\_issue),
description="Get a specific issue from a repository.",
transform\_args={
\*\*owner\_repo\_args,
"issue\_number": ArgTransform(description="The issue number."),
"limit\_comments": LIMIT\_ARG,
\*\*error\_args,
}
),
Tool.from\_tool(
tool=Tool.from\_function(fn=client.get\_pull\_request),
description="Get a specific pull request from a repository.",
transform\_args={
\*\*owner\_repo\_args,
"pull\_request\_number": ArgTransform(description="The PR number."),
"limit\_comments": LIMIT\_ARG,
\*\*error\_args,
}
),
]
# Add all tools to the server
for tool in create\_github\_tools(github\_client):
mcp.add\_tool(tool)
`
```
This pattern provides several benefits:
* **No duplicate implementation**: Logic stays in the client
* **Consistent annotations**: Reusable argument patterns ensure consistency
* **Easy maintenance**: Update the client, not wrapper functions
* **Scalable**: Easily add new tools by wrapping additional client methods
###
[​
](#adapting-remote-or-generated-tools)
Adapting Remote or Generated Tools
This is one of the most common reasons to use tool transformation. Tools from remote MCP servers (via a [proxy](/v2/servers/proxy)) or generated from an [OpenAPI spec](/v2/integrations/openapi) are often too generic for direct use by an LLM. You can use transformation to create a simpler, more intuitive version for your specific needs.
###
[​
](#chaining-transformations)
Chaining Transformations
You can chain transformations by using an already transformed tool as the parent for a new transformation. This lets you build up complex behaviors in layers, for example, first renaming arguments, and then adding validation logic to the renamed tool.
###
[​
](#context-aware-tool-factories)
Context-Aware Tool Factories
You can write functions that act as “factories,” generating specialized versions of a tool for different contexts. For example, you could create a `get\_my\_data` tool that is specific to the currently logged-in user by hiding the `user\_id` parameter and providing it automatically.
```
`from fastmcp import FastMCP
from fastmcp.tools import Tool, tool
from fastmcp.tools.tool\_transform import ArgTransform
# A generic tool that requires a user\_id
@tool
def get\_user\_data(user\_id: str, query: str) -\> str:
"""Fetch data for a specific user."""
return f"Data for user {user\_id}: {query}"
def create\_user\_tool(user\_id: str) -\> Tool:
"""Factory that creates a user-specific version of get\_user\_data."""
return Tool.from\_tool(
get\_user\_data,
name="get\_my\_data",
description="Fetch your data. No need to specify a user ID.",
transform\_args={
"user\_id": ArgTransform(hide=True, default=user\_id),
},
)
# Create a server with a tool customized for the current user
mcp = FastMCP("User Server")
current\_user\_id = "user-123" # e.g., from auth context
mcp.add\_tool(create\_user\_tool(current\_user\_id))
# Clients see "get\_my\_data(query: str)" — user\_id is injected automatically
`
```