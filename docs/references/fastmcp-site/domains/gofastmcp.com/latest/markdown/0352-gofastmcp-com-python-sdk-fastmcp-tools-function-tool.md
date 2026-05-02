function\_tool - FastMCP
SDK Reference
* [Python SDK](/python-sdk/fastmcp-decorators)
* [
decorators
](/python-sdk/fastmcp-decorators)
* [
dependencies
](/python-sdk/fastmcp-dependencies)
* [
exceptions
](/python-sdk/fastmcp-exceptions)
* [
mcp\_config
](/python-sdk/fastmcp-mcp_config)
* [
settings
](/python-sdk/fastmcp-settings)
* [
telemetry
](/python-sdk/fastmcp-telemetry)
* [
types
](/python-sdk/fastmcp-types)
##### fastmcp.apps
* [
\_\_init\_\_
](/python-sdk/fastmcp-apps-__init__)
* [
app
](/python-sdk/fastmcp-apps-app)
* [
approval
](/python-sdk/fastmcp-apps-approval)
* [
choice
](/python-sdk/fastmcp-apps-choice)
* [
config
](/python-sdk/fastmcp-apps-config)
* [
file\_upload
](/python-sdk/fastmcp-apps-file_upload)
* [
form
](/python-sdk/fastmcp-apps-form)
* [
generative
](/python-sdk/fastmcp-apps-generative)
##### fastmcp.cli
* [
\_\_init\_\_
](/python-sdk/fastmcp-cli-__init__)
* [
apps\_dev
](/python-sdk/fastmcp-cli-apps_dev)
* [
auth
](/python-sdk/fastmcp-cli-auth)
* [
cimd
](/python-sdk/fastmcp-cli-cimd)
* [
cli
](/python-sdk/fastmcp-cli-cli)
* [
client
](/python-sdk/fastmcp-cli-client)
* [
discovery
](/python-sdk/fastmcp-cli-discovery)
* [
generate
](/python-sdk/fastmcp-cli-generate)
*
install
* [
run
](/python-sdk/fastmcp-cli-run)
* [
tasks
](/python-sdk/fastmcp-cli-tasks)
##### fastmcp.client
* [
\_\_init\_\_
](/python-sdk/fastmcp-client-__init__)
*
auth
* [
client
](/python-sdk/fastmcp-client-client)
* [
elicitation
](/python-sdk/fastmcp-client-elicitation)
* [
logging
](/python-sdk/fastmcp-client-logging)
* [
messages
](/python-sdk/fastmcp-client-messages)
*
mixins
* [
oauth\_callback
](/python-sdk/fastmcp-client-oauth_callback)
* [
progress
](/python-sdk/fastmcp-client-progress)
* [
roots
](/python-sdk/fastmcp-client-roots)
*
sampling
* [
tasks
](/python-sdk/fastmcp-client-tasks)
* [
telemetry
](/python-sdk/fastmcp-client-telemetry)
*
transports
##### fastmcp.experimental
* [
\_\_init\_\_
](/python-sdk/fastmcp-experimental-__init__)
*
sampling
*
transforms
##### fastmcp.prompts
* [
\_\_init\_\_
](/python-sdk/fastmcp-prompts-__init__)
* [
base
](/python-sdk/fastmcp-prompts-base)
* [
function\_prompt
](/python-sdk/fastmcp-prompts-function_prompt)
##### fastmcp.resources
* [
\_\_init\_\_
](/python-sdk/fastmcp-resources-__init__)
* [
base
](/python-sdk/fastmcp-resources-base)
* [
function\_resource
](/python-sdk/fastmcp-resources-function_resource)
* [
template
](/python-sdk/fastmcp-resources-template)
* [
types
](/python-sdk/fastmcp-resources-types)
##### fastmcp.server
* [
\_\_init\_\_
](/python-sdk/fastmcp-server-__init__)
* [
app
](/python-sdk/fastmcp-server-app)
* [
apps
](/python-sdk/fastmcp-server-apps)
*
auth
* [
context
](/python-sdk/fastmcp-server-context)
* [
dependencies
](/python-sdk/fastmcp-server-dependencies)
* [
elicitation
](/python-sdk/fastmcp-server-elicitation)
* [
event\_store
](/python-sdk/fastmcp-server-event_store)
* [
http
](/python-sdk/fastmcp-server-http)
* [
lifespan
](/python-sdk/fastmcp-server-lifespan)
* [
low\_level
](/python-sdk/fastmcp-server-low_level)
*
middleware
*
mixins
*
openapi
*
providers
* [
proxy
](/python-sdk/fastmcp-server-proxy)
*
sampling
* [
server
](/python-sdk/fastmcp-server-server)
*
tasks
* [
telemetry
](/python-sdk/fastmcp-server-telemetry)
*
transforms
##### fastmcp.tools
* [
\_\_init\_\_
](/python-sdk/fastmcp-tools-__init__)
* [
base
](/python-sdk/fastmcp-tools-base)
* [
function\_parsing
](/python-sdk/fastmcp-tools-function_parsing)
* [
function\_tool
](/python-sdk/fastmcp-tools-function_tool)
* [
tool\_transform
](/python-sdk/fastmcp-tools-tool_transform)
##### fastmcp.utilities
* [
\_\_init\_\_
](/python-sdk/fastmcp-utilities-__init__)
* [
async\_utils
](/python-sdk/fastmcp-utilities-async_utils)
* [
auth
](/python-sdk/fastmcp-utilities-auth)
* [
cli
](/python-sdk/fastmcp-utilities-cli)
* [
components
](/python-sdk/fastmcp-utilities-components)
* [
exceptions
](/python-sdk/fastmcp-utilities-exceptions)
* [
http
](/python-sdk/fastmcp-utilities-http)
* [
inspect
](/python-sdk/fastmcp-utilities-inspect)
* [
json\_schema
](/python-sdk/fastmcp-utilities-json_schema)
* [
json\_schema\_type
](/python-sdk/fastmcp-utilities-json_schema_type)
* [
lifespan
](/python-sdk/fastmcp-utilities-lifespan)
* [
logging
](/python-sdk/fastmcp-utilities-logging)
*
mcp\_server\_config
* [
mime
](/python-sdk/fastmcp-utilities-mime)
*
openapi
* [
pagination
](/python-sdk/fastmcp-utilities-pagination)
* [
skills
](/python-sdk/fastmcp-utilities-skills)
* [
tests
](/python-sdk/fastmcp-utilities-tests)
* [
timeout
](/python-sdk/fastmcp-utilities-timeout)
* [
token\_cache
](/python-sdk/fastmcp-utilities-token_cache)
* [
types
](/python-sdk/fastmcp-utilities-types)
* [
ui
](/python-sdk/fastmcp-utilities-ui)
* [
version\_check
](/python-sdk/fastmcp-utilities-version_check)
* [
versions
](/python-sdk/fastmcp-utilities-versions)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
#
[​
](#fastmcp-tools-function_tool)
`fastmcp.tools.function\_tool`
Standalone @tool decorator for FastMCP.
##
[​
](#functions)
Functions
###
[​
](#tool)
`tool` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L396)
```
`tool(name\_or\_fn: str | Callable[..., Any] | None = None) -\> Any
`
```
Standalone decorator to mark a function as an MCP tool.
Returns the original function with metadata attached. Register with a server
using mcp.add\_tool().
##
[​
](#classes)
Classes
###
[​
](#decoratedtool)
`DecoratedTool` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L65)
Protocol for functions decorated with @tool.
###
[​
](#toolmeta)
`ToolMeta` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L74)
Metadata attached to functions by the @tool decorator.
###
[​
](#functiontool)
`FunctionTool` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L96)
**Methods:**
####
[​
](#from_function)
`from\_function` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L101)
```
`from\_function(cls, fn: Callable[..., Any]) -\> FunctionTool
`
```
Create a FunctionTool from a function.
**Args:**
* `fn`: The function to wrap
* `metadata`: ToolMeta object with all configuration. If provided,
individual parameters must not be passed.
* `name, title, etc.`: Individual parameters for backwards compatibility.
Cannot be used together with metadata parameter.
####
[​
](#run)
`run` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L244)
```
`run(self, arguments: dict[str, Any]) -\> ToolResult
`
```
Run the tool with arguments.
####
[​
](#register_with_docket)
`register\_with\_docket` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L289)
```
`register\_with\_docket(self, docket: Docket) -\> None
`
```
Register this tool with docket for background execution.
FunctionTool registers the underlying function, which has the user’s
Depends parameters for docket to resolve. The function is wrapped to
eagerly restore HTTP headers from Redis so that get\_http\_request()
works even without explicit dependency injection.
####
[​
](#add_to_docket)
`add\_to\_docket` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/tools/function_tool.py#L301)
```
`add\_to\_docket(self, docket: Docket, arguments: dict[str, Any], \*\*kwargs: Any) -\> Execution
`
```
Schedule this tool for background execution via docket.
FunctionTool splats the arguments dict since .fn expects \*\*kwargs.
**Args:**
* `docket`: The Docket instance
* `arguments`: Tool arguments
* `fn\_key`: Function lookup key in Docket registry (defaults to self.key)
* `task\_key`: Redis storage key for the result
* `\*\*kwargs`: Additional kwargs passed to docket.add()