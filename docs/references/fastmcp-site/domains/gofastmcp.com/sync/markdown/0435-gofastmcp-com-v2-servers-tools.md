Tools - FastMCP
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
Tools are the core building blocks that allow your LLM to interact with external systems, execute code, and access data that isn’t in its training data. In FastMCP, tools are Python functions exposed to LLMs through the MCP protocol.
Tools in FastMCP transform regular Python functions into capabilities that LLMs can invoke during conversations. When an LLM decides to use a tool:
1. It sends a request with parameters based on the tool’s schema.
2. FastMCP validates these parameters against your function’s signature.
3. Your function executes with the validated inputs.
4. The result is returned to the LLM, which can use it in its response.
This allows LLMs to perform tasks like querying databases, calling APIs, making calculations, or accessing files—extending their capabilities beyond what’s in their training data.
##
[​
](#the-@tool-decorator)
The `@tool` Decorator
Creating a tool is as simple as decorating a Python function with `@mcp.tool`:
```
`from fastmcp import FastMCP
mcp = FastMCP(name="CalculatorServer")
@mcp.tool
def add(a: int, b: int) -\> int:
"""Adds two integer numbers together."""
return a + b
`
```
When this tool is registered, FastMCP automatically:
* Uses the function name (`add`) as the tool name.
* Uses the function’s docstring (`Adds two integer numbers...`) as the tool description.
* Generates an input schema based on the function’s parameters and type annotations.
* Handles parameter validation and error reporting.
The way you define your Python function dictates how the tool appears and behaves for the LLM client.
Functions with `\*args` or `\*\*kwargs` are not supported as tools. This restriction exists because FastMCP needs to generate a complete parameter schema for the MCP protocol, which isn’t possible with variable argument lists.
###
[​
](#decorator-arguments)
Decorator Arguments
While FastMCP infers the name and description from your function, you can override these and add additional metadata using arguments to the `@mcp.tool` decorator:
```
`@mcp.tool(
name="find\_products", # Custom tool name for the LLM
description="Search the product catalog with optional category filtering.", # Custom description
tags={"catalog", "search"}, # Optional tags for organization/filtering
meta={"version": "1.2", "author": "product-team"} # Custom metadata
)
def search\_products\_implementation(query: str, category: str | None = None) -\> list[dict]:
"""Internal function description (ignored if description is provided above)."""
# Implementation...
print(f"Searching for '{query}' in category '{category}'")
return [{"id": 2, "name": "Another Product"}]
`
```
## @tool Decorator Arguments
[​
](#param-name)
name
str | None
Sets the explicit tool name exposed via MCP. If not provided, uses the function name
[​
](#param-description)
description
str | None
Provides the description exposed via MCP. If set, the function’s docstring is ignored for this purpose
[​
](#param-tags)
tags
set[str] | None
A set of strings used to categorize the tool. These can be used by the server and, in some cases, by clients to filter or group available tools.
[​
](#param-enabled)
enabled
bool
default:"True"
A boolean to enable or disable the tool. See [Disabling Tools](#disabling-tools) for more information
[​
](#param-icons)
icons
list[Icon] | None
New in version `2.13.0`Optional list of icon representations for this tool. See [Icons](/v2/servers/icons) for detailed examples
[​
](#param-annotations)
annotations
ToolAnnotations | dict | None
An optional `ToolAnnotations` object or dictionary to add additional metadata about the tool.
Show ToolAnnotations attributes
[​
](#param-title)
title
str | None
A human-readable title for the tool.
[​
](#param-read-only-hint)
readOnlyHint
bool | None
If true, the tool does not modify its environment.
[​
](#param-destructive-hint)
destructiveHint
bool | None
If true, the tool may perform destructive updates to its environment.
[​
](#param-idempotent-hint)
idempotentHint
bool | None
If true, calling the tool repeatedly with the same arguments will have no additional effect on the its environment.
[​
](#param-open-world-hint)
openWorldHint
bool | None
If true, this tool may interact with an “open world” of external entities. If false, the tool’s domain of interaction is closed.
[​
](#param-meta)
meta
dict[str, Any] | None
New in version `2.11.0`Optional meta information about the tool. This data is passed through to the MCP client as the `\_meta` field of the client-side tool object and can be used for custom metadata, versioning, or other application-specific purposes.
###
[​
](#async-support)
Async Support
FastMCP is an async-first framework that seamlessly supports both asynchronous (`async def`) and synchronous (`def`) functions as tools. Async tools are preferred for I/O-bound operations to keep your server responsive.
While synchronous tools work seamlessly in FastMCP, they can block the event loop during execution. For CPU-intensive or potentially blocking synchronous operations, consider alternative strategies. One approach is to use `anyio` (which FastMCP already uses internally) to wrap them as async functions, for example:
```
`import anyio
from fastmcp import FastMCP
mcp = FastMCP()
def cpu\_intensive\_task(data: str) -\> str:
# Some heavy computation that could block the event loop
return processed\_data
@mcp.tool
async def wrapped\_cpu\_task(data: str) -\> str:
"""CPU-intensive task wrapped to prevent blocking."""
return await anyio.to\_thread.run\_sync(cpu\_intensive\_task, data)
`
```
Alternative approaches include using `asyncio.get\_event\_loop().run\_in\_executor()` or other threading techniques to manage blocking operations without impacting server responsiveness. For example, here’s a recipe for using the `asyncer` library (not included in FastMCP) to create a decorator that wraps synchronous functions, courtesy of [@hsheth2](https://github.com/PrefectHQ/fastmcp/issues/864#issuecomment-3103678258):
Decorator Recipe
Using the Decorator
```
`import asyncer
import functools
from typing import Callable, ParamSpec, TypeVar, Awaitable
\_P = ParamSpec("\_P")
\_R = TypeVar("\_R")
def make\_async\_background(fn: Callable[\_P, \_R]) -\> Callable[\_P, Awaitable[\_R]]:
@functools.wraps(fn)
async def wrapper(\*args: \_P.args, \*\*kwargs: \_P.kwargs) -\> \_R:
return await asyncer.asyncify(fn)(\*args, \*\*kwargs)
return wrapper
`
```
##
[​
](#arguments)
Arguments
By default, FastMCP converts Python functions into MCP tools by inspecting the function’s signature and type annotations. This allows you to use standard Python type annotations for your tools. In general, the framework strives to “just work”: idiomatic Python behaviors like parameter defaults and type annotations are automatically translated into MCP schemas. However, there are a number of ways to customize the behavior of your tools.
FastMCP automatically dereferences `$ref` entries in tool schemas to ensure compatibility with MCP clients that don’t fully support JSON Schema references (e.g., VS Code Copilot, Claude Desktop). This means complex Pydantic models with shared types are inlined in the schema rather than using `$defs` references.
###
[​
](#type-annotations)
Type Annotations
MCP tools have typed arguments, and FastMCP uses type annotations to determine those types. Therefore, you should use standard Python type annotations for tool arguments:
```
`@mcp.tool
def analyze\_text(
text: str,
max\_tokens: int = 100,
language: str | None = None
) -\> dict:
"""Analyze the provided text."""
# Implementation...
`
```
FastMCP supports a wide range of type annotations, including all Pydantic types:
|Type Annotation|Example|Description|
|Basic types|`int`, `float`, `str`, `bool`|Simple scalar values|
|Binary data|`bytes`|Binary content (raw strings, not auto-decoded base64)|
|Date and Time|`datetime`, `date`, `timedelta`|Date and time objects (ISO format strings)|
|Collection types|`list[str]`, `dict[str, int]`, `set[int]`|Collections of items|
|Optional types|`float | None`, `Optional[float]`|Parameters that may be null/omitted|
|Union types|`str | int`, `Union[str, int]`|Parameters accepting multiple types|
|Constrained types|`Literal["A", "B"]`, `Enum`|Parameters with specific allowed values|
|Paths|`Path`|File system paths (auto-converted from strings)|
|UUIDs|`UUID`|Universally unique identifiers (auto-converted from strings)|
|Pydantic models|`UserData`|Complex structured data with validation|
FastMCP supports all types that Pydantic supports as fields, including all Pydantic custom types. A few FastMCP-specific behaviors to note:
**Binary Data**: `bytes` parameters accept raw strings without automatic base64 decoding. For base64 data, use `str` and decode manually with `base64.b64decode()`.
**Enums**: Clients send enum values (`"red"`), not names (`"RED"`). Your function receives the Enum member (`Color.RED`).
**Paths and UUIDs**: String inputs are automatically converted to `Path` and `UUID` objects.
**Pydantic Models**: Must be provided as JSON objects (dicts), not stringified JSON. Even with flexible validation, `{"user": {"name": "Alice"}}` works, but `{"user": '{"name": "Alice"}'}` does not.
###
[​
](#optional-arguments)
Optional Arguments
FastMCP follows Python’s standard function parameter conventions. Parameters without default values are required, while those with default values are optional.
```
`@mcp.tool
def search\_products(
query: str, # Required - no default value
max\_results: int = 10, # Optional - has default value
sort\_by: str = "relevance", # Optional - has default value
category: str | None = None # Optional - can be None
) -\> list[dict]:
"""Search the product catalog."""
# Implementation...
`
```
In this example, the LLM must provide a `query` parameter, while `max\_results`, `sort\_by`, and `category` will use their default values if not explicitly provided.
###
[​
](#validation-modes)
Validation Modes
New in version `2.13.0`
By default, FastMCP uses Pydantic’s flexible validation that coerces compatible inputs to match your type annotations. This improves compatibility with LLM clients that may send string representations of values (like `"10"` for an integer parameter).
If you need stricter validation that rejects any type mismatches, you can enable strict input validation. Strict mode uses the MCP SDK’s built-in JSON Schema validation to validate inputs against the exact schema before passing them to your function:
```
`# Enable strict validation for this server
mcp = FastMCP("StrictServer", strict\_input\_validation=True)
@mcp.tool
def add\_numbers(a: int, b: int) -\> int:
"""Add two numbers."""
return a + b
# With strict\_input\_validation=True, sending {"a": "10", "b": "20"} will fail
# With strict\_input\_validation=False (default), it will be coerced to integers
`
```
**Validation Behavior Comparison:**
|Input Type|strict\_input\_validation=False (default)|strict\_input\_validation=True|
|String integers (`"10"` for `int`)|✅ Coerced to integer|❌ Validation error|
|String floats (`"3.14"` for `float`)|✅ Coerced to float|❌ Validation error|
|String booleans (`"true"` for `bool`)|✅ Coerced to boolean|❌ Validation error|
|Lists with string elements (`["1", "2"]` for `list[int]`)|✅ Elements coerced|❌ Validation error|
|Pydantic model fields with type mismatches|✅ Fields coerced|❌ Validation error|
|Invalid values (`"abc"` for `int`)|❌ Validation error|❌ Validation error|
**Note on Pydantic Models:** Even with `strict\_input\_validation=False`, Pydantic model parameters must be provided as JSON objects (dicts), not as stringified JSON. For example, `{"user": {"name": "Alice"}}` works, but `{"user": '{"name": "Alice"}'}` does not.
The default flexible validation mode is recommended for most use cases as it handles common LLM client behaviors gracefully while still providing strong type safety through Pydantic’s validation.
###
[​
](#parameter-metadata)
Parameter Metadata
You can provide additional metadata about parameters in several ways:
####
[​
](#simple-string-descriptions)
Simple String Descriptions
New in version `2.11.0`
For basic parameter descriptions, you can use a convenient shorthand with `Annotated`:
```
`from typing import Annotated
@mcp.tool
def process\_image(
image\_url: Annotated[str, "URL of the image to process"],
resize: Annotated[bool, "Whether to resize the image"] = False,
width: Annotated[int, "Target width in pixels"] = 800,
format: Annotated[str, "Output image format"] = "jpeg"
) -\> dict:
"""Process an image with optional resizing."""
# Implementation...
`
```
This shorthand syntax is equivalent to using `Field(description=...)` but more concise for simple descriptions.
This shorthand syntax is only applied to `Annotated` types with a single string description.
####
[​
](#advanced-metadata-with-field)
Advanced Metadata with Field
For validation constraints and advanced metadata, use Pydantic’s `Field` class with `Annotated`:
```
`from typing import Annotated
from pydantic import Field
@mcp.tool
def process\_image(
image\_url: Annotated[str, Field(description="URL of the image to process")],
resize: Annotated[bool, Field(description="Whether to resize the image")] = False,
width: Annotated[int, Field(description="Target width in pixels", ge=1, le=2000)] = 800,
format: Annotated[
Literal["jpeg", "png", "webp"],
Field(description="Output image format")
] = "jpeg"
) -\> dict:
"""Process an image with optional resizing."""
# Implementation...
`
```
You can also use the Field as a default value, though the Annotated approach is preferred:
```
`@mcp.tool
def search\_database(
query: str = Field(description="Search query string"),
limit: int = Field(10, description="Maximum number of results", ge=1, le=100)
) -\> list:
"""Search the database with the provided query."""
# Implementation...
`
```
Field provides several validation and documentation features:
* `description`: Human-readable explanation of the parameter (shown to LLMs)
* `ge`/`gt`/`le`/`lt`: Greater/less than (or equal) constraints
* `min\_length`/`max\_length`: String or collection length constraints
* `pattern`: Regex pattern for string validation
* `default`: Default value if parameter is omitted
###
[​
](#hiding-parameters-from-the-llm)
Hiding Parameters from the LLM
New in version `2.14.0`
To inject values at runtime without exposing them to the LLM (such as `user\_id`, credentials, or database connections), use dependency injection with `Depends()`. Parameters using `Depends()` are automatically excluded from the tool schema:
```
`from fastmcp import FastMCP
from fastmcp.dependencies import Depends
mcp = FastMCP()
def get\_user\_id() -\> str:
return "user\_123" # Injected at runtime
@mcp.tool
def get\_user\_details(user\_id: str = Depends(get\_user\_id)) -\> str:
# user\_id is injected by the server, not provided by the LLM
return f"Details for {user\_id}"
`
```
See [Custom Dependencies](/v2/servers/context#custom-dependencies) for more details on dependency injection.
##
[​
](#return-values)
Return Values
FastMCP tools can return data in two complementary formats: **traditional content blocks** (like text and images) and **structured outputs** (machine-readable JSON). When you add return type annotations, FastMCP automatically generates **output schemas** to validate the structured data and enables clients to deserialize results back to Python objects.
Understanding how these three concepts work together:
* **Return Values**: What your Python function returns (determines both content blocks and structured data)
* **Structured Outputs**: JSON data sent alongside traditional content for machine processing
* **Output Schemas**: JSON Schema declarations that describe and validate the structured output format
The following sections explain each concept in detail.
###
[​
](#content-blocks)
Content Blocks
FastMCP automatically converts tool return values into appropriate MCP content blocks:
* **`str`**: Sent as `TextContent`
* **`bytes`**: Base64 encoded and sent as `BlobResourceContents` (within an `EmbeddedResource`)
* **`fastmcp.utilities.types.Image`**: Sent as `ImageContent`
* **`fastmcp.utilities.types.Audio`**: Sent as `AudioContent`
* **`fastmcp.utilities.types.File`**: Sent as base64-encoded `EmbeddedResource`
* **MCP SDK content blocks**: Sent as-is
* **A list of any of the above**: Converts each item according to the above rules
* **`None`**: Results in an empty response
####
[​
](#media-helper-classes)
Media Helper Classes
FastMCP provides helper classes for returning images, audio, and files. When you return one of these classes, either directly or as part of a list, FastMCP automatically converts it to the appropriate MCP content block. For example, if you return a `fastmcp.utilities.types.Image` object, FastMCP will convert it to an MCP `ImageContent` block with the correct MIME type and base64 encoding.
```
`from fastmcp.utilities.types import Image, Audio, File
@mcp.tool
def get\_chart() -\> Image:
"""Generate a chart image."""
return Image(path="chart.png")
@mcp.tool
def get\_multiple\_charts() -\> list[Image]:
"""Return multiple charts."""
return [Image(path="chart1.png"), Image(path="chart2.png")]
`
```
Helper classes are only automatically converted to MCP content blocks when returned **directly** or as part of a **list**. For more complex containers like dicts, you can manually convert them to MCP types:
```
`# ✅ Automatic conversion
return Image(path="chart.png")
return [Image(path="chart1.png"), "text content"]
# ❌ Will not be automatically converted
return {"image": Image(path="chart.png")}
# ✅ Manual conversion for nested use
return {"image": Image(path="chart.png").to\_image\_content()}
`
```
Each helper class accepts either `path=` or `data=` (mutually exclusive):
* **`path`**: File path (string or Path object) - MIME type detected from extension
* **`data`**: Raw bytes - requires `format=` parameter for MIME type
* **`format`**: Optional format override (e.g., “png”, “wav”, “pdf”)
* **`name`**: Optional name for `File` when using `data=`
* **`annotations`**: Optional MCP annotations for the content
###
[​
](#structured-output)
Structured Output
New in version `2.10.0`
The 6/18/2025 MCP spec update [introduced](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#structured-content) structured content, which is a new way to return data from tools. Structured content is a JSON object that is sent alongside traditional content. FastMCP automatically creates structured outputs alongside traditional content when your tool returns data that has a JSON object representation. This provides machine-readable JSON data that clients can deserialize back to Python objects.
**Automatic Structured Content Rules:**
* **Object-like results** (`dict`, Pydantic models, dataclasses) → Always become structured content (even without output schema)
* **Non-object results** (`int`, `str`, `list`) → Only become structured content if there’s an output schema to validate/serialize them
* **All results** → Always become traditional content blocks for backward compatibility
This automatic behavior enables clients to receive machine-readable data alongside human-readable content without requiring explicit output schemas for object-like returns.
####
[​
](#dictionaries-and-objects)
Dictionaries and Objects
When your tool returns a dictionary, dataclass, or Pydantic model, FastMCP automatically creates structured content from it. The structured content contains the actual object data, making it easy for clients to deserialize back to native objects.
Tool Definition
MCP Result
```
`@mcp.tool
def get\_user\_data(user\_id: str) -\> dict:
"""Get user data."""
return {"name": "Alice", "age": 30, "active": True}
`
```
####
[​
](#primitives-and-collections)
Primitives and Collections
When your tool returns a primitive type (int, str, bool) or a collection (list, set), FastMCP needs a return type annotation to generate structured content. The annotation tells FastMCP how to validate and serialize the result.
Without a type annotation, the tool only produces `content`:
Tool Definition
MCP Result
```
`@mcp.tool
def calculate\_sum(a: int, b: int):
"""Calculate sum without return annotation."""
return a + b # Returns 8
`
```
When you add a return annotation, such as `-\> int`, FastMCP generates `structuredContent` by wrapping the primitive value in a `{"result": ...}` object, since JSON schemas require object-type roots for structured output:
Tool Definition
MCP Result
```
`@mcp.tool
def calculate\_sum(a: int, b: int) -\> int:
"""Calculate sum with return annotation."""
return a + b # Returns 8
`
```
####
[​
](#typed-models)
Typed Models
Return type annotations work with any type that can be converted to a JSON schema. Dataclasses and Pydantic models are particularly useful because FastMCP extracts their field definitions to create detailed schemas.
Tool Definition
Generated Output Schema
MCP Result
```
`from dataclasses import dataclass
from fastmcp import FastMCP
mcp = FastMCP()
@dataclass
class Person:
name: str
age: int
email: str
@mcp.tool
def get\_user\_profile(user\_id: str) -\> Person:
"""Get a user's profile information."""
return Person(
name="Alice",
age=30,
email="alice@example.com",
)
`
```
The `Person` dataclass becomes an output schema (second tab) that describes the expected format. When executed, clients receive the result (third tab) with both `content` and `structuredContent` fields.
###
[​
](#output-schemas)
Output Schemas
New in version `2.10.0`
The 6/18/2025 MCP spec update [introduced](https://modelcontextprotocol.io/specification/2025-06-18/server/tools#output-schema) output schemas, which are a new way to describe the expected output format of a tool. When an output schema is provided, the tool *must* return structured output that matches the schema.
When you add return type annotations to your functions, FastMCP automatically generates JSON schemas that describe the expected output format. These schemas help MCP clients understand and validate the structured data they receive.
####
[​
](#primitive-type-wrapping)
Primitive Type Wrapping
For primitive return types (like `int`, `str`, `bool`), FastMCP automatically wraps the result under a `"result"` key to create valid structured output:
Primitive Return Type
Generated Schema (Wrapped)
Structured Output
```
`@mcp.tool
def calculate\_sum(a: int, b: int) -\> int:
"""Add two numbers together."""
return a + b
`
```
####
[​
](#manual-schema-control)
Manual Schema Control
You can override the automatically generated schema by providing a custom `output\_schema`:
```
`@mcp.tool(output\_schema={
"type": "object",
"properties": {
"data": {"type": "string"},
"metadata": {"type": "object"}
}
})
def custom\_schema\_tool() -\> dict:
"""Tool with custom output schema."""
return {"data": "Hello", "metadata": {"version": "1.0"}}
`
```
Schema generation works for most common types including basic types, collections, union types, Pydantic models, TypedDict structures, and dataclasses.
**Important Constraints**:
* Output schemas must be object types (`"type": "object"`)
* If you provide an output schema, your tool **must** return structured output that matches it
* However, you can provide structured output without an output schema (using `ToolResult`)
###
[​
](#toolresult-and-metadata)
ToolResult and Metadata
For complete control over tool responses, return a `ToolResult` object. This gives you explicit control over all aspects of the tool’s output: traditional content, structured data, and metadata.
```
`from fastmcp.tools.tool import ToolResult
from mcp.types import TextContent
@mcp.tool
def advanced\_tool() -\> ToolResult:
"""Tool with full control over output."""
return ToolResult(
content=[TextContent(type="text", text="Human-readable summary")],
structured\_content={"data": "value", "count": 42},
meta={"execution\_time\_ms": 145}
)
`
```
`ToolResult` accepts three fields:
**`content`** - The traditional MCP content blocks that clients display to users. Can be a string (automatically converted to `TextContent`), a list of MCP content blocks, or any serializable value (converted to JSON string). At least one of `content` or `structured\_content` must be provided.
```
`# Simple string
ToolResult(content="Hello, world!")
# List of content blocks
ToolResult(content=[
TextContent(type="text", text="Result: 42"),
ImageContent(type="image", data="base64...", mimeType="image/png")
])
`
```
**`structured\_content`** - A dictionary containing structured data that matches your tool’s output schema. This enables clients to programmatically process the results. If you provide `structured\_content`, it must be a dictionary or `None`. If only `structured\_content` is provided, it will also be used as `content` (converted to JSON string).
```
`ToolResult(
content="Found 3 users",
structured\_content={"users": [{"name": "Alice"}, {"name": "Bob"}]}
)
`
```
**`meta`**
New in version `2.13.1`
Runtime metadata about the tool execution. Use this for performance metrics, debugging information, or any client-specific data that doesn’t belong in the content or structured output.
```
`ToolResult(
content="Analysis complete",
structured\_content={"result": "positive"},
meta={
"execution\_time\_ms": 145,
"model\_version": "2.1",
"confidence": 0.95
}
)
`
```
The `meta` field in `ToolResult` is for runtime metadata about tool execution (e.g., execution time, performance metrics). This is separate from the `meta` parameter in `@mcp.tool(meta={...})`, which provides static metadata about the tool definition itself.
When returning `ToolResult`, you have full control - FastMCP won’t automatically wrap or transform your data. `ToolResult` can be returned with or without an output schema.
##
[​
](#error-handling)
Error Handling
New in version `2.4.1`
If your tool encounters an error, you can raise a standard Python exception (`ValueError`, `TypeError`, `FileNotFoundError`, custom exceptions, etc.) or a FastMCP `ToolError`.
By default, all exceptions (including their details) are logged and converted into an MCP error response to be sent back to the client LLM. This helps the LLM understand failures and react appropriately.
If you want to mask internal error details for security reasons, you can:
1. Use the `mask\_error\_details=True` parameter when creating your `FastMCP` instance:
```
`mcp = FastMCP(name="SecureServer", mask\_error\_details=True)
`
```
1. Or use `ToolError` to explicitly control what error information is sent to clients:
```
`from fastmcp import FastMCP
from fastmcp.exceptions import ToolError
@mcp.tool
def divide(a: float, b: float) -\> float:
"""Divide a by b."""
if b == 0:
# Error messages from ToolError are always sent to clients,
# regardless of mask\_error\_details setting
raise ToolError("Division by zero is not allowed.")
# If mask\_error\_details=True, this message would be masked
if not isinstance(a, (int, float)) or not isinstance(b, (int, float)):
raise TypeError("Both arguments must be numbers.")
return a / b
`
```
When `mask\_error\_details=True`, only error messages from `ToolError` will include details, other exceptions will be converted to a generic message.
##
[​
](#disabling-tools)
Disabling Tools
New in version `2.8.0`
You can control the visibility and availability of tools by enabling or disabling them. This is useful for feature flagging, maintenance, or dynamically changing the toolset available to a client. Disabled tools will not appear in the list of available tools returned by `list\_tools`, and attempting to call a disabled tool will result in an “Unknown tool” error, just as if the tool did not exist.
By default, all tools are enabled. You can disable a tool upon creation using the `enabled` parameter in the decorator:
```
`@mcp.tool(enabled=False)
def maintenance\_tool():
"""This tool is currently under maintenance."""
return "This tool is disabled."
`
```
You can also toggle a tool’s state programmatically after it has been created:
```
`@mcp.tool
def dynamic\_tool():
return "I am a dynamic tool."
# Disable and re-enable the tool
dynamic\_tool.disable()
dynamic\_tool.enable()
`
```
##
[​
](#mcp-annotations)
MCP Annotations
New in version `2.2.7`
FastMCP allows you to add specialized metadata to your tools through annotations. These annotations communicate how tools behave to client applications without consuming token context in LLM prompts.
Annotations serve several purposes in client applications:
* Adding user-friendly titles for display purposes
* Indicating whether tools modify data or systems
* Describing the safety profile of tools (destructive vs. non-destructive)
* Signaling if tools interact with external systems
You can add annotations to a tool using the `annotations` parameter in the `@mcp.tool` decorator:
```
`@mcp.tool(
annotations={
"title": "Calculate Sum",
"readOnlyHint": True,
"openWorldHint": False
}
)
def calculate\_sum(a: float, b: float) -\> float:
"""Add two numbers together."""
return a + b
`
```
FastMCP supports these standard annotations:
|Annotation|Type|Default|Purpose|
|`title`|string|-|Display name for user interfaces|
|`readOnlyHint`|boolean|false|Indicates if the tool only reads without making changes|
|`destructiveHint`|boolean|true|For non-readonly tools, signals if changes are destructive|
|`idempotentHint`|boolean|false|Indicates if repeated identical calls have the same effect as a single call|
|`openWorldHint`|boolean|true|Specifies if the tool interacts with external systems|
Remember that annotations help make better user experiences but should be treated as advisory hints. They help client applications present appropriate UI elements and safety controls, but won’t enforce security boundaries on their own. Always focus on making your annotations accurately represent what your tool actually does.
###
[​
](#using-annotation-hints)
Using Annotation Hints
MCP clients like Claude and ChatGPT use annotation hints to determine when to skip confirmation prompts and how to present tools to users. The most commonly used hint is `readOnlyHint`, which signals that a tool only reads data without making changes.
**Read-only tools** improve user experience by:
* Skipping confirmation prompts for safe operations
* Allowing broader access without security concerns
* Enabling more aggressive batching and caching
Mark a tool as read-only when it retrieves data, performs calculations, or checks status without modifying state:
```
`from fastmcp import FastMCP
from mcp.types import ToolAnnotations
mcp = FastMCP("Data Server")
@mcp.tool(annotations={"readOnlyHint": True})
def get\_user(user\_id: str) -\> dict:
"""Retrieve user information by ID."""
return {"id": user\_id, "name": "Alice"}
@mcp.tool(
annotations=ToolAnnotations(
readOnlyHint=True,
idempotentHint=True, # Same result for repeated calls
openWorldHint=False # Only internal data
)
)
def search\_products(query: str) -\> list[dict]:
"""Search the product catalog."""
return [{"id": 1, "name": "Widget", "price": 29.99}]
# Write operations - no readOnlyHint
@mcp.tool()
def update\_user(user\_id: str, name: str) -\> dict:
"""Update user information."""
return {"id": user\_id, "name": name, "updated": True}
@mcp.tool(annotations={"destructiveHint": True})
def delete\_user(user\_id: str) -\> dict:
"""Permanently delete a user account."""
return {"deleted": user\_id}
`
```
For tools that write to databases, send notifications, create/update/delete resources, or trigger workflows, omit `readOnlyHint` or set it to `False`. Use `destructiveHint=True` for operations that cannot be undone.
Client-specific behavior:
* **ChatGPT**: Skips confirmation prompts for read-only tools in Chat mode (see [ChatGPT integration](/v2/integrations/chatgpt))
* **Claude**: Uses hints to understand tool safety profiles and make better execution decisions
##
[​
](#notifications)
Notifications
New in version `2.9.1`
FastMCP automatically sends `notifications/tools/list\_changed` notifications to connected clients when tools are added, removed, enabled, or disabled. This allows clients to stay up-to-date with the current tool set without manually polling for changes.
```
`@mcp.tool
def example\_tool() -\> str:
return "Hello!"
# These operations trigger notifications:
mcp.add\_tool(example\_tool) # Sends tools/list\_changed notification
example\_tool.disable() # Sends tools/list\_changed notification
example\_tool.enable() # Sends tools/list\_changed notification
mcp.remove\_tool("example\_tool") # Sends tools/list\_changed notification
`
```
Notifications are only sent when these operations occur within an active MCP request context (e.g., when called from within a tool or other MCP operation). Operations performed during server initialization do not trigger notifications.
Clients can handle these notifications using a [message handler](/v2/clients/messages) to automatically refresh their tool lists or update their interfaces.
##
[​
](#accessing-the-mcp-context)
Accessing the MCP Context
Tools can access MCP features like logging, reading resources, or reporting progress through the `Context` object. To use it, add a parameter to your tool function with the type hint `Context`.
```
`from fastmcp import FastMCP, Context
mcp = FastMCP(name="ContextDemo")
@mcp.tool
async def process\_data(data\_uri: str, ctx: Context) -\> dict:
"""Process data from a resource with progress reporting."""
await ctx.info(f"Processing data from {data\_uri}")
# Read a resource
resource = await ctx.read\_resource(data\_uri)
data = resource[0].content if resource else ""
# Report progress
await ctx.report\_progress(progress=50, total=100)
# Example request to the client's LLM for help
summary = await ctx.sample(f"Summarize this in 10 words: {data[:200]}")
await ctx.report\_progress(progress=100, total=100)
return {
"length": len(data),
"summary": summary.text
}
`
```
The Context object provides access to:
* **Logging**: `ctx.debug()`, `ctx.info()`, `ctx.warning()`, `ctx.error()`
* **Progress Reporting**: `ctx.report\_progress(progress, total)`
* **Resource Access**: `ctx.read\_resource(uri)`
* **LLM Sampling**: `ctx.sample(...)`
* **Request Information**: `ctx.request\_id`, `ctx.client\_id`
For full documentation on the Context object and all its capabilities, see the [Context documentation](/v2/servers/context).
##
[​
](#server-behavior)
Server Behavior
###
[​
](#duplicate-tools)
Duplicate Tools
New in version `2.1.0`
You can control how the FastMCP server behaves if you try to register multiple tools with the same name. This is configured using the `on\_duplicate\_tools` argument when creating the `FastMCP` instance.
```
`from fastmcp import FastMCP
mcp = FastMCP(
name="StrictServer",
# Configure behavior for duplicate tool names
on\_duplicate\_tools="error"
)
@mcp.tool
def my\_tool(): return "Version 1"
# This will now raise a ValueError because 'my\_tool' already exists
# and on\_duplicate\_tools is set to "error".
# @mcp.tool
# def my\_tool(): return "Version 2"
`
```
The duplicate behavior options are:
* `"warn"` (default): Logs a warning and the new tool replaces the old one.
* `"error"`: Raises a `ValueError`, preventing the duplicate registration.
* `"replace"`: Silently replaces the existing tool with the new one.
* `"ignore"`: Keeps the original tool and ignores the new registration attempt.
###
[​
](#removing-tools)
Removing Tools
New in version `2.3.4`
You can dynamically remove tools from a server using the `remove\_tool` method:
```
`from fastmcp import FastMCP
mcp = FastMCP(name="DynamicToolServer")
@mcp.tool
def calculate\_sum(a: int, b: int) -\> int:
"""Add two numbers together."""
return a + b
mcp.remove\_tool("calculate\_sum")
`
```