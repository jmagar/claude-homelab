client - FastMCP
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
](#fastmcp-client-client)
`fastmcp.client.client`
##
[​
](#classes)
Classes
###
[​
](#clientsessionstate)
`ClientSessionState` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L97)
Holds all session-related state for a Client instance.
This allows clean separation of configuration (which is copied) from
session state (which should be fresh for each new client instance).
###
[​
](#calltoolresult)
`CallToolResult` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L114)
Parsed result from a tool call.
###
[​
](#client)
`Client` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L124)
MCP client that delegates connection management to a Transport instance.
The Client class is responsible for MCP protocol logic, while the Transport
handles connection establishment and management. Client provides methods for
working with resources, prompts, tools and other MCP capabilities.
This client supports reentrant context managers (multiple concurrent
`async with client:` blocks) using reference counting and background session
management. This allows efficient session reuse in any scenario with
nested or concurrent client usage.
MCP SDK 1.10 introduced automatic list\_tools() calls during call\_tool()
execution. This created a race condition where events could be reset while
other tasks were waiting on them, causing deadlocks. The issue was exposed
in proxy scenarios but affects any reentrant usage.
The solution uses reference counting to track active context managers,
a background task to manage the session lifecycle, events to coordinate
between tasks, and ensures all session state changes happen within a lock.
Events are only created when needed, never reset outside locks.
This design prevents race conditions where tasks wait on events that get
replaced by other tasks, ensuring reliable coordination in concurrent scenarios.
**Args:**
* `transport`:
Connection source specification, which can be:
* ClientTransport: Direct transport instance
* FastMCP: In-process FastMCP server
* AnyUrl or str: URL to connect to
* Path: File path for local socket
* MCPConfig: MCP server configuration
* dict: Transport configuration
* `roots`: Optional RootsList or RootsHandler for filesystem access
* `sampling\_handler`: Optional handler for sampling requests
* `log\_handler`: Optional handler for log messages
* `message\_handler`: Optional handler for protocol messages
* `progress\_handler`: Optional handler for progress notifications
* `timeout`: Optional timeout for requests (seconds or timedelta)
* `init\_timeout`: Optional timeout for initial connection (seconds or timedelta).
Set to 0 to disable. If None, uses the value in the FastMCP global settings.
**Examples:**
```
`# Connect to FastMCP server
client = Client("http://localhost:8080")
async with client:
# List available resources
resources = await client.list\_resources()
# Call a tool
result = await client.call\_tool("my\_tool", {"param": "value"})
`
```
**Methods:**
####
[​
](#session)
`session` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L371)
```
`session(self) -\> ClientSession
`
```
Get the current active session. Raises RuntimeError if not connected.
####
[​
](#initialize_result)
`initialize\_result` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L381)
```
`initialize\_result(self) -\> mcp.types.InitializeResult | None
`
```
Get the result of the initialization request.
####
[​
](#set_roots)
`set\_roots` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L385)
```
`set\_roots(self, roots: RootsList | RootsHandler) -\> None
`
```
Set the roots for the client. This does not automatically call `send\_roots\_list\_changed`.
####
[​
](#set_sampling_callback)
`set\_sampling\_callback` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L389)
```
`set\_sampling\_callback(self, sampling\_callback: SamplingHandler, sampling\_capabilities: mcp.types.SamplingCapability | None = None) -\> None
`
```
Set the sampling callback for the client.
####
[​
](#set_elicitation_callback)
`set\_elicitation\_callback` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L404)
```
`set\_elicitation\_callback(self, elicitation\_callback: ElicitationHandler) -\> None
`
```
Set the elicitation callback for the client.
####
[​
](#is_connected)
`is\_connected` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L412)
```
`is\_connected(self) -\> bool
`
```
Check if the client is currently connected.
####
[​
](#new)
`new` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L416)
```
`new(self) -\> Client[ClientTransportT]
`
```
Create a new client instance with the same configuration but fresh session state.
This creates a new client with the same transport, handlers, and configuration,
but with no active session. Useful for creating independent sessions that don’t
share state with the original client.
**Returns:**
* A new Client instance with the same configuration but disconnected state.
####
[​
](#initialize)
`initialize` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L461)
```
`initialize(self, timeout: datetime.timedelta | float | int | None = None) -\> mcp.types.InitializeResult
`
```
Send an initialize request to the server.
This method performs the MCP initialization handshake with the server,
exchanging capabilities and server information. It is idempotent - calling
it multiple times returns the cached result from the first call.
The initialization happens automatically when entering the client context
manager unless `auto\_initialize=False` was set during client construction.
Manual calls to this method are only needed when auto-initialization is disabled.
**Args:**
* `timeout`: Optional timeout for the initialization request (seconds or timedelta).
If None, uses the client’s init\_timeout setting.
**Returns:**
* The server’s initialization response containing server info,
capabilities, protocol version, and optional instructions.
**Raises:**
* `RuntimeError`: If the client is not connected or initialization times out.
####
[​
](#close)
`close` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L762)
```
`close(self)
`
```
####
[​
](#ping)
`ping` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L768)
```
`ping(self) -\> bool
`
```
Send a ping request.
####
[​
](#cancel)
`cancel` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L773)
```
`cancel(self, request\_id: str | int, reason: str | None = None) -\> None
`
```
Send a cancellation notification for an in-progress request.
####
[​
](#progress)
`progress` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L790)
```
`progress(self, progress\_token: str | int, progress: float, total: float | None = None, message: str | None = None) -\> None
`
```
Send a progress notification.
####
[​
](#set_logging_level)
`set\_logging\_level` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L802)
```
`set\_logging\_level(self, level: mcp.types.LoggingLevel) -\> None
`
```
Send a logging/setLevel request.
####
[​
](#send_roots_list_changed)
`send\_roots\_list\_changed` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L806)
```
`send\_roots\_list\_changed(self) -\> None
`
```
Send a roots/list\_changed notification.
####
[​
](#complete_mcp)
`complete\_mcp` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L812)
```
`complete\_mcp(self, ref: mcp.types.ResourceTemplateReference | mcp.types.PromptReference, argument: dict[str, str], context\_arguments: dict[str, Any] | None = None) -\> mcp.types.CompleteResult
`
```
Send a completion request and return the complete MCP protocol result.
**Args:**
* `ref`: The reference to complete.
* `argument`: Arguments to pass to the completion request.
* `context\_arguments`: Optional context arguments to
include with the completion request. Defaults to None.
**Returns:**
* mcp.types.CompleteResult: The complete response object from the protocol,
containing the completion and any additional metadata.
**Raises:**
* `RuntimeError`: If called while the client is not connected.
* `McpError`: If the request results in a TimeoutError | JSONRPCError
####
[​
](#complete)
`complete` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L843)
```
`complete(self, ref: mcp.types.ResourceTemplateReference | mcp.types.PromptReference, argument: dict[str, str], context\_arguments: dict[str, Any] | None = None) -\> mcp.types.Completion
`
```
Send a completion request to the server.
**Args:**
* `ref`: The reference to complete.
* `argument`: Arguments to pass to the completion request.
* `context\_arguments`: Optional context arguments to
include with the completion request. Defaults to None.
**Returns:**
* mcp.types.Completion: The completion object.
**Raises:**
* `RuntimeError`: If called while the client is not connected.
* `McpError`: If the request results in a TimeoutError | JSONRPCError
####
[​
](#generate_name)
`generate\_name` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/client.py#L870)
```
`generate\_name(cls, name: str | None = None) -\> str
`
```