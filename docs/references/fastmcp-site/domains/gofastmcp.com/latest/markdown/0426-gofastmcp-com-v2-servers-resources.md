Resources & Templates - FastMCP
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
Resources represent data or files that an MCP client can read, and resource templates extend this concept by allowing clients to request dynamically generated resources based on parameters passed in the URI.
FastMCP simplifies defining both static and dynamic resources, primarily using the `@mcp.resource` decorator.
##
[​
](#what-are-resources)
What Are Resources?
Resources provide read-only access to data for the LLM or client application. When a client requests a resource URI:
1. FastMCP finds the corresponding resource definition.
2. If it’s dynamic (defined by a function), the function is executed.
3. The content (text, JSON, binary data) is returned to the client.
This allows LLMs to access files, database content, configuration, or dynamically generated information relevant to the conversation.
##
[​
](#resources)
Resources
###
[​
](#the-@resource-decorator)
The `@resource` Decorator
The most common way to define a resource is by decorating a Python function. The decorator requires the resource’s unique URI.
```
`import json
from fastmcp import FastMCP
mcp = FastMCP(name="DataServer")
# Basic dynamic resource returning a string
@mcp.resource("resource://greeting")
def get\_greeting() -\> str:
"""Provides a simple greeting message."""
return "Hello from FastMCP Resources!"
# Resource returning JSON data (dict is auto-serialized)
@mcp.resource("data://config")
def get\_config() -\> dict:
"""Provides application configuration as JSON."""
return {
"theme": "dark",
"version": "1.2.0",
"features": ["tools", "resources"],
}
`
```
**Key Concepts:**
* **URI:** The first argument to `@resource` is the unique URI (e.g., `"resource://greeting"`) clients use to request this data.
* **Lazy Loading:** The decorated function (`get\_greeting`, `get\_config`) is only executed when a client specifically requests that resource URI via `resources/read`.
* **Inferred Metadata:** By default:
* Resource Name: Taken from the function name (`get\_greeting`).
* Resource Description: Taken from the function’s docstring.
####
[​
](#decorator-arguments)
Decorator Arguments
You can customize the resource’s properties using arguments in the `@mcp.resource` decorator:
```
`from fastmcp import FastMCP
mcp = FastMCP(name="DataServer")
# Example specifying metadata
@mcp.resource(
uri="data://app-status", # Explicit URI (required)
name="ApplicationStatus", # Custom name
description="Provides the current status of the application.", # Custom description
mime\_type="application/json", # Explicit MIME type
tags={"monitoring", "status"}, # Categorization tags
meta={"version": "2.1", "team": "infrastructure"} # Custom metadata
)
def get\_application\_status() -\> dict:
"""Internal function description (ignored if description is provided above)."""
return {"status": "ok", "uptime": 12345, "version": mcp.settings.version} # Example usage
`
```
## @resource Decorator Arguments
[​
](#param-uri)
uri
str
required
The unique identifier for the resource
[​
](#param-name)
name
str | None
A human-readable name. If not provided, defaults to function name
[​
](#param-description)
description
str | None
Explanation of the resource. If not provided, defaults to docstring
[​
](#param-mime-type)
mime\_type
str | None
Specifies the content type. FastMCP often infers a default like `text/plain` or `application/json`, but explicit is better for non-text types
[​
](#param-tags)
tags
set[str] | None
A set of strings used to categorize the resource. These can be used by the server and, in some cases, by clients to filter or group available resources.
[​
](#param-enabled)
enabled
bool
default:"True"
A boolean to enable or disable the resource. See [Disabling Resources](#disabling-resources) for more information
[​
](#param-icons)
icons
list[Icon] | None
New in version `2.13.0`Optional list of icon representations for this resource or template. See [Icons](/v2/servers/icons) for detailed examples
[​
](#param-annotations)
annotations
Annotations | dict | None
An optional `Annotations` object or dictionary to add additional metadata about the resource.
Show Annotations attributes
[​
](#param-read-only-hint)
readOnlyHint
bool | None
If true, the resource is read-only and does not modify its environment.
[​
](#param-idempotent-hint)
idempotentHint
bool | None
If true, reading the resource repeatedly will have no additional effect on its environment.
[​
](#param-meta)
meta
dict[str, Any] | None
New in version `2.11.0`Optional meta information about the resource. This data is passed through to the MCP client as the `\_meta` field of the client-side resource object and can be used for custom metadata, versioning, or other application-specific purposes.
###
[​
](#return-values)
Return Values
FastMCP automatically converts your function’s return value into the appropriate MCP resource content:
* **`str`**: Sent as `TextResourceContents` (with `mime\_type="text/plain"` by default).
* **`dict`, `list`, `pydantic.BaseModel`**: Automatically serialized to a JSON string and sent as `TextResourceContents` (with `mime\_type="application/json"` by default).
* **`bytes`**: Base64 encoded and sent as `BlobResourceContents`. You should specify an appropriate `mime\_type` (e.g., `"image/png"`, `"application/octet-stream"`).
* **`None`**: Results in an empty resource content list being returned.
###
[​
](#disabling-resources)
Disabling Resources
New in version `2.8.0`
You can control the visibility and availability of resources and templates by enabling or disabling them. Disabled resources will not appear in the list of available resources or templates, and attempting to read a disabled resource will result in an “Unknown resource” error.
By default, all resources are enabled. You can disable a resource upon creation using the `enabled` parameter in the decorator:
```
`@mcp.resource("data://secret", enabled=False)
def get\_secret\_data():
"""This resource is currently disabled."""
return "Secret data"
`
```
You can also toggle a resource’s state programmatically after it has been created:
```
`@mcp.resource("data://config")
def get\_config(): return {"version": 1}
# Disable and re-enable the resource
get\_config.disable()
get\_config.enable()
`
```
###
[​
](#accessing-mcp-context)
Accessing MCP Context
New in version `2.2.5`
Resources and resource templates can access additional MCP information and features through the `Context` object. To access it, add a parameter to your resource function with a type annotation of `Context`:
```
`from fastmcp import FastMCP, Context
mcp = FastMCP(name="DataServer")
@mcp.resource("resource://system-status")
async def get\_system\_status(ctx: Context) -\> dict:
"""Provides system status information."""
return {
"status": "operational",
"request\_id": ctx.request\_id
}
@mcp.resource("resource://{name}/details")
async def get\_details(name: str, ctx: Context) -\> dict:
"""Get details for a specific name."""
return {
"name": name,
"accessed\_at": ctx.request\_id
}
`
```
For full documentation on the Context object and all its capabilities, see the [Context documentation](/v2/servers/context).
###
[​
](#async-resources)
Async Resources
Use `async def` for resource functions that perform I/O operations (e.g., reading from a database or network) to avoid blocking the server.
```
`import aiofiles
from fastmcp import FastMCP
mcp = FastMCP(name="DataServer")
@mcp.resource("file:///app/data/important\_log.txt", mime\_type="text/plain")
async def read\_important\_log() -\> str:
"""Reads content from a specific log file asynchronously."""
try:
async with aiofiles.open("/app/data/important\_log.txt", mode="r") as f:
content = await f.read()
return content
except FileNotFoundError:
return "Log file not found."
`
```
###
[​
](#resource-classes)
Resource Classes
While `@mcp.resource` is ideal for dynamic content, you can directly register pre-defined resources (like static files or simple text) using `mcp.add\_resource()` and concrete `Resource` subclasses.
```
`from pathlib import Path
from fastmcp import FastMCP
from fastmcp.resources import FileResource, TextResource, DirectoryResource
mcp = FastMCP(name="DataServer")
# 1. Exposing a static file directly
readme\_path = Path("./README.md").resolve()
if readme\_path.exists():
# Use a file:// URI scheme
readme\_resource = FileResource(
uri=f"file://{readme\_path.as\_posix()}",
path=readme\_path, # Path to the actual file
name="README File",
description="The project's README.",
mime\_type="text/markdown",
tags={"documentation"}
)
mcp.add\_resource(readme\_resource)
# 2. Exposing simple, predefined text
notice\_resource = TextResource(
uri="resource://notice",
name="Important Notice",
text="System maintenance scheduled for Sunday.",
tags={"notification"}
)
mcp.add\_resource(notice\_resource)
# 3. Exposing a directory listing
data\_dir\_path = Path("./app\_data").resolve()
if data\_dir\_path.is\_dir():
data\_listing\_resource = DirectoryResource(
uri="resource://data-files",
path=data\_dir\_path, # Path to the directory
name="Data Directory Listing",
description="Lists files available in the data directory.",
recursive=False # Set to True to list subdirectories
)
mcp.add\_resource(data\_listing\_resource) # Returns JSON list of files
`
```
**Common Resource Classes:**
* `TextResource`: For simple string content.
* `BinaryResource`: For raw `bytes` content.
* `FileResource`: Reads content from a local file path. Handles text/binary modes and lazy reading.
* `HttpResource`: Fetches content from an HTTP(S) URL (requires `httpx`).
* `DirectoryResource`: Lists files in a local directory (returns JSON).
* (`FunctionResource`: Internal class used by `@mcp.resource`).
Use these when the content is static or sourced directly from a file/URL, bypassing the need for a dedicated Python function.
###
[​
](#notifications)
Notifications
New in version `2.9.1`
FastMCP automatically sends `notifications/resources/list\_changed` notifications to connected clients when resources or templates are added, enabled, or disabled. This allows clients to stay up-to-date with the current resource set without manually polling for changes.
```
`@mcp.resource("data://example")
def example\_resource() -\> str:
return "Hello!"
# These operations trigger notifications:
mcp.add\_resource(example\_resource) # Sends resources/list\_changed notification
example\_resource.disable() # Sends resources/list\_changed notification
example\_resource.enable() # Sends resources/list\_changed notification
`
```
Notifications are only sent when these operations occur within an active MCP request context (e.g., when called from within a tool or other MCP operation). Operations performed during server initialization do not trigger notifications.
Clients can handle these notifications using a [message handler](/v2/clients/messages) to automatically refresh their resource lists or update their interfaces.
###
[​
](#annotations)
Annotations
New in version `2.11.0`
FastMCP allows you to add specialized metadata to your resources through annotations. These annotations communicate how resources behave to client applications without consuming token context in LLM prompts.
Annotations serve several purposes in client applications:
* Indicating whether resources are read-only or may have side effects
* Describing the safety profile of resources (idempotent vs. non-idempotent)
* Helping clients optimize caching and access patterns
You can add annotations to a resource using the `annotations` parameter in the `@mcp.resource` decorator:
```
`@mcp.resource(
"data://config",
annotations={
"readOnlyHint": True,
"idempotentHint": True
}
)
def get\_config() -\> dict:
"""Get application configuration."""
return {"version": "1.0", "debug": False}
`
```
FastMCP supports these standard annotations:
|Annotation|Type|Default|Purpose|
|`readOnlyHint`|boolean|true|Indicates if the resource only provides data without side effects|
|`idempotentHint`|boolean|true|Indicates if repeated reads have the same effect as a single read|
Remember that annotations help make better user experiences but should be treated as advisory hints. They help client applications present appropriate UI elements and optimize access patterns, but won’t enforce behavior on their own. Always focus on making your annotations accurately represent what your resource actually does.
##
[​
](#resource-templates)
Resource Templates
Resource Templates allow clients to request resources whose content depends on parameters embedded in the URI. Define a template using the **same `@mcp.resource` decorator**, but include `{parameter\_name}` placeholders in the URI string and add corresponding arguments to your function signature.
Resource templates share most configuration options with regular resources (name, description, mime\_type, tags, annotations), but add the ability to define URI parameters that map to function parameters.
Resource templates generate a new resource for each unique set of parameters, which means that resources can be dynamically created on-demand. For example, if the resource template `"user://profile/{name}"` is registered, MCP clients could request `"user://profile/ford"` or `"user://profile/marvin"` to retrieve either of those two user profiles as resources, without having to register each resource individually.
Functions with `\*args` are not supported as resource templates. However, unlike tools and prompts, resource templates do support `\*\*kwargs` because the URI template defines specific parameter names that will be collected and passed as keyword arguments.
Here is a complete example that shows how to define two resource templates:
```
`from fastmcp import FastMCP
mcp = FastMCP(name="DataServer")
# Template URI includes {city} placeholder
@mcp.resource("weather://{city}/current")
def get\_weather(city: str) -\> dict:
"""Provides weather information for a specific city."""
# In a real implementation, this would call a weather API
# Here we're using simplified logic for example purposes
return {
"city": city.capitalize(),
"temperature": 22,
"condition": "Sunny",
"unit": "celsius"
}
# Template with multiple parameters and annotations
@mcp.resource(
"repos://{owner}/{repo}/info",
annotations={
"readOnlyHint": True,
"idempotentHint": True
}
)
def get\_repo\_info(owner: str, repo: str) -\> dict:
"""Retrieves information about a GitHub repository."""
# In a real implementation, this would call the GitHub API
return {
"owner": owner,
"name": repo,
"full\_name": f"{owner}/{repo}",
"stars": 120,
"forks": 48
}
`
```
With these two templates defined, clients can request a variety of resources:
* `weather://london/current` → Returns weather for London
* `weather://paris/current` → Returns weather for Paris
* `repos://PrefectHQ/fastmcp/info` → Returns info about the PrefectHQ/fastmcp repository
* `repos://prefecthq/prefect/info` → Returns info about the prefecthq/prefect repository
###
[​
](#rfc-6570-uri-templates)
RFC 6570 URI Templates
FastMCP implements [RFC 6570 URI Templates](https://datatracker.ietf.org/doc/html/rfc6570) for resource templates, providing a standardized way to define parameterized URIs. This includes support for simple expansion, wildcard path parameters, and form-style query parameters.
####
[​
](#wildcard-parameters)
Wildcard Parameters
New in version `2.2.4`
Resource templates support wildcard parameters that can match multiple path segments. While standard parameters (`{param}`) only match a single path segment and don’t cross ”/” boundaries, wildcard parameters (`{param\*}`) can capture multiple segments including slashes. Wildcards capture all subsequent path segments *up until* the defined part of the URI template (whether literal or another parameter). This allows you to have multiple wildcard parameters in a single URI template.
```
`from fastmcp import FastMCP
mcp = FastMCP(name="DataServer")
# Standard parameter only matches one segment
@mcp.resource("files://{filename}")
def get\_file(filename: str) -\> str:
"""Retrieves a file by name."""
# Will only match files://\<single-segment\>
return f"File content for: {filename}"
# Wildcard parameter can match multiple segments
@mcp.resource("path://{filepath\*}")
def get\_path\_content(filepath: str) -\> str:
"""Retrieves content at a specific path."""
# Can match path://docs/server/resources.mdx
return f"Content at path: {filepath}"
# Mixing standard and wildcard parameters
@mcp.resource("repo://{owner}/{path\*}/template.py")
def get\_template\_file(owner: str, path: str) -\> dict:
"""Retrieves a file from a specific repository and path, but
only if the resource ends with `template.py`"""
# Can match repo://PrefectHQ/fastmcp/src/resources/template.py
return {
"owner": owner,
"path": path + "/template.py",
"content": f"File at {path}/template.py in {owner}'s repository"
}
`
```
Wildcard parameters are useful when:
* Working with file paths or hierarchical data
* Creating APIs that need to capture variable-length path segments
* Building URL-like patterns similar to REST APIs
Note that like regular parameters, each wildcard parameter must still be a named parameter in your function signature, and all required function parameters must appear in the URI template.
####
[​
](#query-parameters)
Query Parameters
New in version `2.13.0`
FastMCP supports RFC 6570 form-style query parameters using the `{?param1,param2}` syntax. Query parameters provide a clean way to pass optional configuration to resources without cluttering the path.
Query parameters must be optional function parameters (have default values), while path parameters map to required function parameters. This enforces a clear separation: required data goes in the path, optional configuration in query params.
```
`from fastmcp import FastMCP
mcp = FastMCP(name="DataServer")
# Basic query parameters
@mcp.resource("data://{id}{?format}")
def get\_data(id: str, format: str = "json") -\> str:
"""Retrieve data in specified format."""
if format == "xml":
return f"\<data id='{id}' /\>"
return f'{{"id": "{id}"}}'
# Multiple query parameters with type coercion
@mcp.resource("api://{endpoint}{?version,limit,offset}")
def call\_api(endpoint: str, version: int = 1, limit: int = 10, offset: int = 0) -\> dict:
"""Call API endpoint with pagination."""
return {
"endpoint": endpoint,
"version": version,
"limit": limit,
"offset": offset,
"results": fetch\_results(endpoint, version, limit, offset)
}
# Query parameters with wildcards
@mcp.resource("files://{path\*}{?encoding,lines}")
def read\_file(path: str, encoding: str = "utf-8", lines: int = 100) -\> str:
"""Read file with optional encoding and line limit."""
return read\_file\_content(path, encoding, lines)
`
```
**Example requests:**
* `data://123` → Uses default format `"json"`
* `data://123?format=xml` → Uses format `"xml"`
* `api://users?version=2&limit=50` → `version=2, limit=50, offset=0`
* `files://src/main.py?encoding=ascii&lines=50` → Custom encoding and line limit
FastMCP automatically coerces query parameter string values to the correct types based on your function’s type hints (`int`, `float`, `bool`, `str`).
**Query parameters vs. hidden defaults:**
Query parameters expose optional configuration to clients. To hide optional parameters from clients entirely (always use defaults), simply omit them from the URI template:
```
`# Clients CAN override max\_results via query string
@mcp.resource("search://{query}{?max\_results}")
def search\_configurable(query: str, max\_results: int = 10) -\> dict:
return {"query": query, "limit": max\_results}
# Clients CANNOT override max\_results (not in URI template)
@mcp.resource("search://{query}")
def search\_fixed(query: str, max\_results: int = 10) -\> dict:
return {"query": query, "limit": max\_results}
`
```
###
[​
](#template-parameter-rules)
Template Parameter Rules
New in version `2.2.0`
FastMCP enforces these validation rules when creating resource templates:
1. **Required function parameters** (no default values) must appear in the URI path template
2. **Query parameters** (specified with `{?param}` syntax) must be optional function parameters with default values
3. **All URI template parameters** (path and query) must exist as function parameters
Optional function parameters (those with default values) can be:
* Included as query parameters (`{?param}`) - clients can override via query string
* Omitted from URI template - always uses default value, not exposed to clients
* Used in alternative path templates - enables multiple ways to access the same resource
**Multiple templates for one function:**
Create multiple resource templates that expose the same function through different URI patterns by manually applying decorators:
```
`from fastmcp import FastMCP
mcp = FastMCP(name="DataServer")
# Define a user lookup function that can be accessed by different identifiers
def lookup\_user(name: str | None = None, email: str | None = None) -\> dict:
"""Look up a user by either name or email."""
if email:
return find\_user\_by\_email(email) # pseudocode
elif name:
return find\_user\_by\_name(name) # pseudocode
else:
return {"error": "No lookup parameters provided"}
# Manually apply multiple decorators to the same function
mcp.resource("users://email/{email}")(lookup\_user)
mcp.resource("users://name/{name}")(lookup\_user)
`
```
Now an LLM or client can retrieve user information in two different ways:
* `users://email/alice@example.com` → Looks up user by email (with name=None)
* `users://name/Bob` → Looks up user by name (with email=None)
This approach allows a single function to be registered with multiple URI patterns while keeping the implementation clean and straightforward.
Templates provide a powerful way to expose parameterized data access points following REST-like principles.
##
[​
](#error-handling)
Error Handling
New in version `2.4.1`
If your resource function encounters an error, you can raise a standard Python exception (`ValueError`, `TypeError`, `FileNotFoundError`, custom exceptions, etc.) or a FastMCP `ResourceError`.
By default, all exceptions (including their details) are logged and converted into an MCP error response to be sent back to the client LLM. This helps the LLM understand failures and react appropriately.
If you want to mask internal error details for security reasons, you can:
1. Use the `mask\_error\_details=True` parameter when creating your `FastMCP` instance:
```
`mcp = FastMCP(name="SecureServer", mask\_error\_details=True)
`
```
1. Or use `ResourceError` to explicitly control what error information is sent to clients:
```
`from fastmcp import FastMCP
from fastmcp.exceptions import ResourceError
mcp = FastMCP(name="DataServer")
@mcp.resource("resource://safe-error")
def fail\_with\_details() -\> str:
"""This resource provides detailed error information."""
# ResourceError contents are always sent back to clients,
# regardless of mask\_error\_details setting
raise ResourceError("Unable to retrieve data: file not found")
@mcp.resource("resource://masked-error")
def fail\_with\_masked\_details() -\> str:
"""This resource masks internal error details when mask\_error\_details=True."""
# This message would be masked if mask\_error\_details=True
raise ValueError("Sensitive internal file path: /etc/secrets.conf")
@mcp.resource("data://{id}")
def get\_data\_by\_id(id: str) -\> dict:
"""Template resources also support the same error handling pattern."""
if id == "secure":
raise ValueError("Cannot access secure data")
elif id == "missing":
raise ResourceError("Data ID 'missing' not found in database")
return {"id": id, "value": "data"}
`
```
When `mask\_error\_details=True`, only error messages from `ResourceError` will include details, other exceptions will be converted to a generic message.
##
[​
](#server-behavior)
Server Behavior
###
[​
](#duplicate-resources)
Duplicate Resources
New in version `2.1.0`
You can configure how the FastMCP server handles attempts to register multiple resources or templates with the same URI. Use the `on\_duplicate\_resources` setting during `FastMCP` initialization.
```
`from fastmcp import FastMCP
mcp = FastMCP(
name="ResourceServer",
on\_duplicate\_resources="error" # Raise error on duplicates
)
@mcp.resource("data://config")
def get\_config\_v1(): return {"version": 1}
# This registration attempt will raise a ValueError because
# "data://config" is already registered and the behavior is "error".
# @mcp.resource("data://config")
# def get\_config\_v2(): return {"version": 2}
`
```
The duplicate behavior options are:
* `"warn"` (default): Logs a warning, and the new resource/template replaces the old one.
* `"error"`: Raises a `ValueError`, preventing the duplicate registration.
* `"replace"`: Silently replaces the existing resource/template with the new one.
* `"ignore"`: Keeps the original resource/template and ignores the new registration attempt.