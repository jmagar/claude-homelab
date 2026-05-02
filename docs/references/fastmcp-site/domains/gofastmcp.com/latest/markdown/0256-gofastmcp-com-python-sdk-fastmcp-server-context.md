context - FastMCP
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
](#fastmcp-server-context)
`fastmcp.server.context`
##
[​
](#functions)
Functions
###
[​
](#set_transport)
`set\_transport` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L88)
```
`set\_transport(transport: TransportType) -\> Token[TransportType | None]
`
```
Set the current transport type. Returns token for reset.
###
[​
](#reset_transport)
`reset\_transport` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L95)
```
`reset\_transport(token: Token[TransportType | None]) -\> None
`
```
Reset transport to previous value.
###
[​
](#set_context)
`set\_context` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L125)
```
`set\_context(context: Context) -\> Generator[Context, None, None]
`
```
##
[​
](#classes)
Classes
###
[​
](#logdata)
`LogData` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L101)
Data object for passing log arguments to client-side handlers.
This provides an interface to match the Python standard library logging,
for compatibility with structured logging.
###
[​
](#context)
`Context` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L134)
Context object providing access to MCP capabilities.
This provides a cleaner interface to MCP’s RequestContext functionality.
It gets injected into tool and resource functions that request it via type hints.
To use context in a tool function, add a parameter with the Context type annotation:
```
`@server.tool
async def my\_tool(x: int, ctx: Context) -\> str:
# Log messages to the client
await ctx.info(f"Processing {x}")
await ctx.debug("Debug info")
await ctx.warning("Warning message")
await ctx.error("Error message")
# Report progress
await ctx.report\_progress(50, 100, "Processing")
# Access resources
data = await ctx.read\_resource("resource://data")
# Get request info
request\_id = ctx.request\_id
client\_id = ctx.client\_id
# Manage state across the session (persists across requests)
await ctx.set\_state("key", "value")
value = await ctx.get\_state("key")
# Store non-serializable values for the current request only
await ctx.set\_state("client", http\_client, serializable=False)
return str(x)
`
```
State Management:
Context provides session-scoped state that persists across requests within
the same MCP session. State is automatically keyed by session, ensuring
isolation between different clients.
State set during `on\_initialize` middleware will persist to subsequent tool
calls when using the same session object (STDIO, SSE, single-server HTTP).
For distributed/serverless HTTP deployments where different machines handle
the init and tool calls, state is isolated by the mcp-session-id header.
The context parameter name can be anything as long as it’s annotated with Context.
The context is optional - tools that don’t need it can omit the parameter.
**Methods:**
####
[​
](#is_background_task)
`is\_background\_task` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L207)
```
`is\_background\_task(self) -\> bool
`
```
True when this context is running in a background task (Docket worker).
When True, certain operations like elicit() and sample() will use
task-aware implementations that can pause the task and wait for
client input.
####
[​
](#task_id)
`task\_id` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L226)
```
`task\_id(self) -\> str | None
`
```
Get the background task ID if running in a background task.
Returns None if not running in a background task context.
####
[​
](#origin_request_id)
`origin\_request\_id` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L234)
```
`origin\_request\_id(self) -\> str | None
`
```
Get the request ID that originated this execution, if available.
In foreground request mode, this is the current request\_id.
In background task mode, this is the request\_id captured when the task
was submitted, if one was available.
####
[​
](#fastmcp)
`fastmcp` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L246)
```
`fastmcp(self) -\> FastMCP
`
```
Get the FastMCP instance.
####
[​
](#request_context)
`request\_context` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L321)
```
`request\_context(self) -\> RequestContext[ServerSession, Any, Request] | None
`
```
Access to the underlying request context.
Returns None when the MCP session has not been established yet.
Returns the full RequestContext once the MCP session is available.
For HTTP request access in middleware, use `get\_http\_request()` from fastmcp.server.dependencies,
which works whether or not the MCP session is available.
Example in middleware:
```
`async def on\_request(self, context, call\_next):
ctx = context.fastmcp\_context
if ctx.request\_context:
# MCP session available - can access session\_id, request\_id, etc.
session\_id = ctx.session\_id
else:
# MCP session not available yet - use HTTP helpers
from fastmcp.server.dependencies import get\_http\_request
request = get\_http\_request()
return await call\_next(context)
`
```
####
[​
](#lifespan_context)
`lifespan\_context` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L350)
```
`lifespan\_context(self) -\> dict[str, Any]
`
```
Access the server’s lifespan context.
Returns the context dict yielded by the server’s lifespan function.
Returns an empty dict if no lifespan was configured or if the MCP
session is not yet established.
In background tasks (Docket workers), where request\_context is not
available, falls back to reading from the FastMCP server’s lifespan
result directly.
Example:
```
`@server.tool
def my\_tool(ctx: Context) -\> str:
db = ctx.lifespan\_context.get("db")
if db:
return db.query("SELECT 1")
return "No database connection"
`
```
####
[​
](#report_progress)
`report\_progress` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L381)
```
`report\_progress(self, progress: float, total: float | None = None, message: str | None = None) -\> None
`
```
Report progress for the current operation.
Works in both foreground (MCP progress notifications) and background
(Docket task execution) contexts.
**Args:**
* `progress`: Current progress value e.g. 24
* `total`: Optional total value e.g. 100
* `message`: Optional status message describing current progress
####
[​
](#list_resources)
`list\_resources` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L474)
```
`list\_resources(self) -\> list[SDKResource]
`
```
List all available resources from the server.
**Returns:**
* List of Resource objects available on the server
####
[​
](#list_prompts)
`list\_prompts` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L490)
```
`list\_prompts(self) -\> list[SDKPrompt]
`
```
List all available prompts from the server.
**Returns:**
* List of Prompt objects available on the server
####
[​
](#get_prompt)
`get\_prompt` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L506)
```
`get\_prompt(self, name: str, arguments: dict[str, Any] | None = None) -\> GetPromptResult
`
```
Get a prompt by name with optional arguments.
**Args:**
* `name`: The name of the prompt to get
* `arguments`: Optional arguments to pass to the prompt
**Returns:**
* The prompt result
####
[​
](#read_resource)
`read\_resource` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L525)
```
`read\_resource(self, uri: str | AnyUrl) -\> ResourceResult
`
```
Read a resource by URI.
**Args:**
* `uri`: Resource URI to read
**Returns:**
* ResourceResult with contents
####
[​
](#log)
`log` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L541)
```
`log(self, message: str, level: LoggingLevel | None = None, logger\_name: str | None = None, extra: Mapping[str, Any] | None = None) -\> None
`
```
Send a log message to the client.
Messages sent to Clients are also logged to the `fastmcp.server.context.to\_client` logger with a level of `DEBUG`.
**Args:**
* `message`: Log message
* `level`: Optional log level. One of “debug”, “info”, “notice”, “warning”, “error”, “critical”,
“alert”, or “emergency”. Default is “info”.
* `logger\_name`: Optional logger name
* `extra`: Optional mapping for additional arguments
####
[​
](#transport)
`transport` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L571)
```
`transport(self) -\> TransportType | None
`
```
Get the current transport type.
Returns the transport type used to run this server: “stdio”, “sse”,
or “streamable-http”. Returns None if called outside of a server context.
####
[​
](#client_supports_extension)
`client\_supports\_extension` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L579)
```
`client\_supports\_extension(self, extension\_id: str) -\> bool
`
```
Check whether the connected client supports a given MCP extension.
Inspects the `extensions` extra field on `ClientCapabilities`
sent by the client during initialization.
Returns `False` when no session is available (e.g., outside a
request context) or when the client did not advertise the extension.
Example::
from fastmcp.apps.config import UI\_EXTENSION\_ID
@mcp.tool
async def my\_tool(ctx: Context) -\> str:
if ctx.client\_supports\_extension(UI\_EXTENSION\_ID):
return “UI-capable client”
return “text-only client”
####
[​
](#client_id)
`client\_id` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L607)
```
`client\_id(self) -\> str | None
`
```
Get the client ID if available.
####
[​
](#request_id)
`request\_id` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L616)
```
`request\_id(self) -\> str
`
```
Get the unique ID for this request.
Raises RuntimeError if MCP request context is not available.
####
[​
](#session_id)
`session\_id` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L629)
```
`session\_id(self) -\> str
`
```
Get the MCP session ID for ALL transports.
Returns the session ID that can be used as a key for session-based
data storage (e.g., Redis) to share data between tool calls within
the same client session.
**Returns:**
* The session ID for StreamableHTTP transports, or a generated ID
* for other transports.
####
[​
](#session)
`session` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L686)
```
`session(self) -\> ServerSession
`
```
Access to the underlying session for advanced usage.
In request mode: Returns the session from the active request context.
In background task mode: Returns the session stored at Context creation.
Raises RuntimeError if no session is available.
####
[​
](#debug)
`debug` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L712)
```
`debug(self, message: str, logger\_name: str | None = None, extra: Mapping[str, Any] | None = None) -\> None
`
```
Send a `DEBUG`-level message to the connected MCP Client.
Messages sent to Clients are also logged to the `fastmcp.server.context.to\_client` logger with a level of `DEBUG`.
####
[​
](#info)
`info` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L728)
```
`info(self, message: str, logger\_name: str | None = None, extra: Mapping[str, Any] | None = None) -\> None
`
```
Send a `INFO`-level message to the connected MCP Client.
Messages sent to Clients are also logged to the `fastmcp.server.context.to\_client` logger with a level of `DEBUG`.
####
[​
](#warning)
`warning` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L744)
```
`warning(self, message: str, logger\_name: str | None = None, extra: Mapping[str, Any] | None = None) -\> None
`
```
Send a `WARNING`-level message to the connected MCP Client.
Messages sent to Clients are also logged to the `fastmcp.server.context.to\_client` logger with a level of `DEBUG`.
####
[​
](#error)
`error` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L760)
```
`error(self, message: str, logger\_name: str | None = None, extra: Mapping[str, Any] | None = None) -\> None
`
```
Send a `ERROR`-level message to the connected MCP Client.
Messages sent to Clients are also logged to the `fastmcp.server.context.to\_client` logger with a level of `DEBUG`.
####
[​
](#list_roots)
`list\_roots` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L776)
```
`list\_roots(self) -\> list[Root]
`
```
List the roots available to the server, as indicated by the client.
####
[​
](#send_notification)
`send\_notification` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L781)
```
`send\_notification(self, notification: mcp.types.ServerNotificationType) -\> None
`
```
Send a notification to the client immediately.
**Args:**
* `notification`: An MCP notification instance (e.g., ToolListChangedNotification())
####
[​
](#close_sse_stream)
`close\_sse\_stream` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L791)
```
`close\_sse\_stream(self) -\> None
`
```
Close the current response stream to trigger client reconnection.
When using StreamableHTTP transport with an EventStore configured, this
method gracefully closes the HTTP connection for the current request.
The client will automatically reconnect (after `retry\_interval` milliseconds)
and resume receiving events from where it left off via the EventStore.
This is useful for long-running operations to avoid load balancer timeouts.
Instead of holding a connection open for minutes, you can periodically close
and let the client reconnect.
####
[​
](#sample_step)
`sample\_step` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L830)
```
`sample\_step(self, messages: str | Sequence[str | SamplingMessage]) -\> SampleStep
`
```
Make a single LLM sampling call.
This is a stateless function that makes exactly one LLM call and optionally
executes any requested tools. Use this for fine-grained control over the
sampling loop.
**Args:**
* `messages`: The message(s) to send. Can be a string, list of strings,
or list of SamplingMessage objects.
* `system\_prompt`: Optional system prompt for the LLM.
* `temperature`: Optional sampling temperature.
* `max\_tokens`: Maximum tokens to generate. Defaults to 512.
* `model\_preferences`: Optional model preferences.
* `tools`: Optional list of tools the LLM can use.
* `tool\_choice`: Tool choice mode (“auto”, “required”, or “none”).
* `execute\_tools`: If True (default), execute tool calls and append results
to history. If False, return immediately with tool\_calls available
in the step for manual execution.
* `mask\_error\_details`: If True, mask detailed error messages from tool
execution. When None (default), uses the global settings value.
Tools can raise ToolError to bypass masking.
* `tool\_concurrency`: Controls parallel execution of tools:
* None (default): Sequential execution (one at a time)
* 0: Unlimited parallel execution
* N \> 0: Execute at most N tools concurrently
If any tool has sequential=True, all tools execute sequentially
regardless of this setting.
**Returns:**
* SampleStep containing:
*
* .response: The raw LLM response
*
* .history: Messages including input, assistant response, and tool results
*
* .is\_tool\_use: True if the LLM requested tool execution
*
* .tool\_calls: List of tool calls (if any)
*
* .text: The text content (if any)
####
[​
](#sample)
`sample` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L909)
```
`sample(self, messages: str | Sequence[str | SamplingMessage]) -\> SamplingResult[ResultT]
`
```
Overload: With result\_type, returns SamplingResult[ResultT].
####
[​
](#sample-2)
`sample` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L925)
```
`sample(self, messages: str | Sequence[str | SamplingMessage]) -\> SamplingResult[str]
`
```
Overload: Without result\_type, returns SamplingResult[str].
####
[​
](#sample-3)
`sample` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L940)
```
`sample(self, messages: str | Sequence[str | SamplingMessage]) -\> SamplingResult[ResultT] | SamplingResult[str]
`
```
Send a sampling request to the client and await the response.
This method runs to completion automatically. When tools are provided,
it executes a tool loop: if the LLM returns a tool use request, the tools
are executed and the results are sent back to the LLM. This continues
until the LLM provides a final text response.
When result\_type is specified, a synthetic `final\_response` tool is
created. The LLM calls this tool to provide the structured response,
which is validated against the result\_type and returned as `.result`.
For fine-grained control over the sampling loop, use sample\_step() instead.
**Args:**
* `messages`: The message(s) to send. Can be a string, list of strings,
or list of SamplingMessage objects.
* `system\_prompt`: Optional system prompt for the LLM.
* `temperature`: Optional sampling temperature.
* `max\_tokens`: Maximum tokens to generate. Defaults to 512.
* `model\_preferences`: Optional model preferences.
* `tools`: Optional list of tools the LLM can use. Accepts plain
functions or SamplingTools.
* `result\_type`: Optional type for structured output. When specified,
a synthetic `final\_response` tool is created and the LLM’s
response is validated against this type.
* `mask\_error\_details`: If True, mask detailed error messages from tool
execution. When None (default), uses the global settings value.
Tools can raise ToolError to bypass masking.
* `tool\_concurrency`: Controls parallel execution of tools:
* None (default): Sequential execution (one at a time)
* 0: Unlimited parallel execution
* N \> 0: Execute at most N tools concurrently
If any tool has sequential=True, all tools execute sequentially
regardless of this setting.
**Returns:**
* SamplingResult[T] containing:
*
* .text: The text representation (raw text or JSON for structured)
*
* .result: The typed result (str for text, parsed object for structured)
*
* .history: All messages exchanged during sampling
####
[​
](#elicit)
`elicit` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1015)
```
`elicit(self, message: str, response\_type: None) -\> AcceptedElicitation[dict[str, Any]] | DeclinedElicitation | CancelledElicitation
`
```
####
[​
](#elicit-2)
`elicit` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1027)
```
`elicit(self, message: str, response\_type: type[T]) -\> AcceptedElicitation[T] | DeclinedElicitation | CancelledElicitation
`
```
####
[​
](#elicit-3)
`elicit` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1037)
```
`elicit(self, message: str, response\_type: list[str]) -\> AcceptedElicitation[str] | DeclinedElicitation | CancelledElicitation
`
```
####
[​
](#elicit-4)
`elicit` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1047)
```
`elicit(self, message: str, response\_type: dict[str, dict[str, str]]) -\> AcceptedElicitation[str] | DeclinedElicitation | CancelledElicitation
`
```
####
[​
](#elicit-5)
`elicit` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1057)
```
`elicit(self, message: str, response\_type: list[list[str]]) -\> AcceptedElicitation[list[str]] | DeclinedElicitation | CancelledElicitation
`
```
####
[​
](#elicit-6)
`elicit` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1069)
```
`elicit(self, message: str, response\_type: list[dict[str, dict[str, str]]]) -\> AcceptedElicitation[list[str]] | DeclinedElicitation | CancelledElicitation
`
```
####
[​
](#elicit-7)
`elicit` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1081)
```
`elicit(self, message: str, response\_type: type[T] | list[str] | dict[str, dict[str, str]] | list[list[str]] | list[dict[str, dict[str, str]]] | None = None) -\> AcceptedElicitation[T] | AcceptedElicitation[dict[str, Any]] | AcceptedElicitation[str] | AcceptedElicitation[list[str]] | DeclinedElicitation | CancelledElicitation
`
```
Send an elicitation request to the client and await the response.
Call this method at any time to request additional information from
the user through the client. The client must support elicitation,
or the request will error.
Note that the MCP protocol only supports simple object schemas with
primitive types. You can provide a dataclass, TypedDict, or BaseModel to
comply. If you provide a primitive type, an object schema with a single
“value” field will be generated for the MCP interaction and
automatically deconstructed into the primitive type upon response.
If the response\_type is None, the generated schema will be that of an
empty object in order to comply with the MCP protocol requirements.
Clients must send an empty object ("")in response.
**Args:**
* `message`: A human-readable message explaining what information is needed
* `response\_type`: The type of the response, which should be a primitive
type or dataclass or BaseModel. If it is a primitive type, an
object schema with a single “value” field will be generated.
####
[​
](#set_state)
`set\_state` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1195)
```
`set\_state(self, key: str, value: Any) -\> None
`
```
Set a value in the state store.
By default, values are stored in the session-scoped state store and
persist across requests within the same MCP session. Values must be
JSON-serializable (dicts, lists, strings, numbers, etc.).
For non-serializable values (e.g., HTTP clients, database connections),
pass `serializable=False`. These values are stored in a request-scoped
dict and only live for the current MCP request (tool call, resource
read, or prompt render). They will not be available in subsequent
requests.
The key is automatically prefixed with the session identifier.
####
[​
](#get_state)
`get\_state` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1237)
```
`get\_state(self, key: str) -\> Any
`
```
Get a value from the state store.
Checks request-scoped state first (set with `serializable=False`),
then falls back to the session-scoped state store.
Returns None if the key is not found.
####
[​
](#delete_state)
`delete\_state` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1251)
```
`delete\_state(self, key: str) -\> None
`
```
Delete a value from the state store.
Removes from both request-scoped and session-scoped stores.
####
[​
](#enable_components)
`enable\_components` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1272)
```
`enable\_components(self) -\> None
`
```
Enable components matching criteria for this session only.
Session rules override global transforms. Rules accumulate - each call
adds a new rule to the session. Later marks override earlier ones
(Visibility transform semantics).
Sends notifications to this session only: ToolListChangedNotification,
ResourceListChangedNotification, and PromptListChangedNotification.
**Args:**
* `names`: Component names or URIs to match.
* `keys`: Component keys to match (e.g., ).
* `version`: Component version spec to match.
* `tags`: Tags to match (component must have at least one).
* `components`: Component types to match (e.g., ).
* `match\_all`: If True, matches all components regardless of other criteria.
####
[​
](#disable_components)
`disable\_components` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1310)
```
`disable\_components(self) -\> None
`
```
Disable components matching criteria for this session only.
Session rules override global transforms. Rules accumulate - each call
adds a new rule to the session. Later marks override earlier ones
(Visibility transform semantics).
Sends notifications to this session only: ToolListChangedNotification,
ResourceListChangedNotification, and PromptListChangedNotification.
**Args:**
* `names`: Component names or URIs to match.
* `keys`: Component keys to match (e.g., ).
* `version`: Component version spec to match.
* `tags`: Tags to match (component must have at least one).
* `components`: Component types to match (e.g., ).
* `match\_all`: If True, matches all components regardless of other criteria.
####
[​
](#reset_visibility)
`reset\_visibility` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/context.py#L1348)
```
`reset\_visibility(self) -\> None
`
```
Clear all session visibility rules.
Use this to reset session visibility back to global defaults.
Sends notifications to this session only: ToolListChangedNotification,
ResourceListChangedNotification, and PromptListChangedNotification.