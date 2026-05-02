dependencies - FastMCP
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
](#fastmcp-server-dependencies)
`fastmcp.server.dependencies`
Dependency injection for FastMCP.
DI features (Depends, CurrentContext, CurrentFastMCP) work without pydocket
using the uncalled-for DI engine. Only task-related dependencies (CurrentDocket,
CurrentWorker) and background task execution require fastmcp[tasks].
##
[​
](#functions)
Functions
###
[​
](#get_task_context)
`get\_task\_context` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L104)
```
`get\_task\_context() -\> TaskContextInfo | None
`
```
Get the current task context if running inside a background task worker.
This function extracts task information from the Docket execution context.
Returns None if not running in a task context (e.g., foreground execution).
**Returns:**
* TaskContextInfo with task\_id and session\_id, or None if not in a task.
###
[​
](#register_task_session)
`register\_task\_session` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L142)
```
`register\_task\_session(session\_id: str, session: ServerSession) -\> None
`
```
Register a session for Context access in background tasks.
Called automatically when a task is submitted to Docket. The session is
stored as a weakref so it doesn’t prevent garbage collection when the
client disconnects.
**Args:**
* `session\_id`: The session identifier
* `session`: The ServerSession instance
###
[​
](#get_task_session)
`get\_task\_session` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L156)
```
`get\_task\_session(session\_id: str) -\> ServerSession | None
`
```
Get a registered session by ID if still alive.
**Args:**
* `session\_id`: The session identifier
**Returns:**
* The ServerSession if found and alive, None otherwise
###
[​
](#register_task_server)
`register\_task\_server` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L191)
```
`register\_task\_server(task\_id: str, server: FastMCP) -\> None
`
```
Register the server for a background task.
Called at task-submission time (inside the child server’s call\_tool
context) so that background workers can resolve CurrentFastMCP() and
ctx.fastmcp to the child server for mounted tasks.
The map is bounded to avoid unbounded growth in long-lived servers.
Evicted entries fall back to the ContextVar (parent server).
###
[​
](#is_docket_available)
`is\_docket\_available` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L221)
```
`is\_docket\_available() -\> bool
`
```
Check if pydocket is installed.
###
[​
](#require_docket)
`require\_docket` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L234)
```
`require\_docket(feature: str) -\> None
`
```
Raise ImportError with install instructions if docket not available.
**Args:**
* `feature`: Description of what requires docket (e.g., “`task=True`”,
“CurrentDocket()”). Will be included in the error message.
###
[​
](#transform_context_annotations)
`transform\_context\_annotations` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L259)
```
`transform\_context\_annotations(fn: Callable[..., Any]) -\> Callable[..., Any]
`
```
Transform ctx: Context into ctx: Context = CurrentContext().
Transforms ALL params typed as Context to use Docket’s DI system,
unless they already have a Dependency-based default (like CurrentContext()).
This unifies the legacy type annotation DI with Docket’s Depends() system,
allowing both patterns to work through a single resolution path.
Note: Only POSITIONAL\_OR\_KEYWORD parameters are reordered (params with defaults
after those without). KEYWORD\_ONLY parameters keep their position since Python
allows them to have defaults in any order.
**Args:**
* `fn`: Function to transform
**Returns:**
* Function with modified signature (same function object, updated **signature**)
###
[​
](#get_context)
`get\_context` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L400)
```
`get\_context() -\> Context
`
```
Get the current FastMCP Context instance directly.
###
[​
](#get_server)
`get\_server` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L410)
```
`get\_server() -\> FastMCP
`
```
Get the current FastMCP server instance directly.
In a background-task worker, checks the task-server map first so that
mounted-child tasks resolve to the child server (not the parent that
started the worker).
**Returns:**
* The active FastMCP server
**Raises:**
* `RuntimeError`: If no server in context
###
[​
](#get_http_request)
`get\_http\_request` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L444)
```
`get\_http\_request() -\> Request
`
```
Get the current HTTP request.
Tries MCP SDK’s request\_ctx first, then falls back to FastMCP’s HTTP context.
In background tasks, returns a synthetic request populated with the
snapshotted headers from the originating HTTP request.
###
[​
](#get_http_headers)
`get\_http\_headers` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L489)
```
`get\_http\_headers(include\_all: bool = False, include: set[str] | None = None) -\> dict[str, str]
`
```
Extract headers from the current HTTP request if available.
Never raises an exception, even if there is no active HTTP request (in which case
an empty dict is returned).
By default, strips problematic headers like `content-length` and `authorization`
that cause issues if forwarded to downstream services. If `include\_all` is True,
all headers are returned.
The `include` parameter allows specific headers to be included even if they would
normally be excluded. This is useful for proxy transports that need to forward
authorization headers to upstream MCP servers.
###
[​
](#get_access_token)
`get\_access\_token` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L546)
```
`get\_access\_token() -\> AccessToken | None
`
```
Get the FastMCP access token from the current context.
This function first tries to get the token from the current HTTP request’s scope,
which is more reliable for long-lived connections where the SDK’s auth\_context\_var
may become stale after token refresh. Falls back to the SDK’s context var if no
request is available. In background tasks (Docket workers), falls back to the
token snapshot stored in Redis at task submission time.
**Returns:**
* The access token if an authenticated user is available, None otherwise.
###
[​
](#without_injected_parameters)
`without\_injected\_parameters` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L618)
```
`without\_injected\_parameters(fn: Callable[..., Any]) -\> Callable[..., Any]
`
```
Create a wrapper function without injected parameters.
Returns a wrapper that excludes Context and Docket dependency parameters,
making it safe to use with Pydantic TypeAdapter for schema generation and
validation. The wrapper internally handles all dependency resolution and
Context injection when called.
Handles:
* Legacy Context injection (always works)
* Depends() injection (always works - uses docket or vendored DI engine)
**Args:**
* `fn`: Original function with Context and/or dependencies
**Returns:**
* Async wrapper function without injected parameters
###
[​
](#resolve_dependencies)
`resolve\_dependencies` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L767)
```
`resolve\_dependencies(fn: Callable[..., Any], arguments: dict[str, Any]) -\> AsyncGenerator[dict[str, Any], None]
`
```
Resolve dependencies for a FastMCP function.
This function:
1. Filters out any dependency parameter names from user arguments (security)
2. Resolves Depends() parameters via the DI system
The filtering prevents external callers from overriding injected parameters by
providing values for dependency parameter names. This is a security feature.
Note: Context injection is handled via transform\_context\_annotations() which
converts `ctx: Context` to `ctx: Context = Depends(get\_context)` at registration
time, so all injection goes through the unified DI system.
**Args:**
* `fn`: The function to resolve dependencies for
* `arguments`: User arguments (may contain keys that match dependency names,
which will be filtered out)
###
[​
](#currentcontext)
`CurrentContext` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1022)
```
`CurrentContext() -\> Context
`
```
Get the current FastMCP Context instance.
This dependency provides access to the active FastMCP Context for the
current MCP operation (tool/resource/prompt call).
**Returns:**
* A dependency that resolves to the active Context instance
**Raises:**
* `RuntimeError`: If no active context found (during resolution)
###
[​
](#optionalcurrentcontext)
`OptionalCurrentContext` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1047)
```
`OptionalCurrentContext() -\> Context | None
`
```
Get the current FastMCP Context, or None when no context is active.
###
[​
](#currentdocket)
`CurrentDocket` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1075)
```
`CurrentDocket() -\> Docket
`
```
Get the current Docket instance managed by FastMCP.
This dependency provides access to the Docket instance that FastMCP
automatically creates for background task scheduling.
**Returns:**
* A dependency that resolves to the active Docket instance
**Raises:**
* `RuntimeError`: If not within a FastMCP server context
* `ImportError`: If fastmcp[tasks] not installed
###
[​
](#currentworker)
`CurrentWorker` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1125)
```
`CurrentWorker() -\> Worker
`
```
Get the current Docket Worker instance managed by FastMCP.
This dependency provides access to the Worker instance that FastMCP
automatically creates for background task processing.
**Returns:**
* A dependency that resolves to the active Worker instance
**Raises:**
* `RuntimeError`: If not within a FastMCP server context
* `ImportError`: If fastmcp[tasks] not installed
###
[​
](#currentfastmcp)
`CurrentFastMCP` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1166)
```
`CurrentFastMCP() -\> FastMCP
`
```
Get the current FastMCP server instance.
This dependency provides access to the active FastMCP server.
**Returns:**
* A dependency that resolves to the active FastMCP server
**Raises:**
* `RuntimeError`: If no server in context (during resolution)
###
[​
](#currentrequest)
`CurrentRequest` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1220)
```
`CurrentRequest() -\> Request
`
```
Get the current HTTP request.
This dependency provides access to the Starlette Request object for the
current HTTP request. Only available when running over HTTP transports
(SSE or Streamable HTTP).
**Returns:**
* A dependency that resolves to the active Starlette Request
**Raises:**
* `RuntimeError`: If no HTTP request in context (e.g., STDIO transport)
###
[​
](#currentheaders)
`CurrentHeaders` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1271)
```
`CurrentHeaders() -\> dict[str, str]
`
```
Get the current HTTP request headers.
This dependency provides access to the HTTP headers for the current request,
including the authorization header. Returns an empty dictionary when no HTTP
request is available, making it safe to use in code that might run over any
transport.
**Returns:**
* A dependency that resolves to a dictionary of header name -\> value
###
[​
](#currentaccesstoken)
`CurrentAccessToken` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1505)
```
`CurrentAccessToken() -\> AccessToken
`
```
Get the current access token for the authenticated user.
This dependency provides access to the AccessToken for the current
authenticated request. Raises an error if no authentication is present.
**Returns:**
* A dependency that resolves to the active AccessToken
**Raises:**
* `RuntimeError`: If no authenticated user (use get\_access\_token() for optional)
###
[​
](#tokenclaim)
`TokenClaim` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1562)
```
`TokenClaim(name: str) -\> str
`
```
Get a specific claim from the access token.
This dependency extracts a single claim value from the current access token.
It’s useful for getting user identifiers, roles, or other token claims
without needing the full token object.
**Args:**
* `name`: The name of the claim to extract (e.g., “oid”, “sub”, “email”)
**Returns:**
* A dependency that resolves to the claim value as a string
**Raises:**
* `RuntimeError`: If no access token is available or claim is missing
##
[​
](#classes)
Classes
###
[​
](#taskcontextinfo)
`TaskContextInfo` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L90)
Information about the current background task context.
Returned by `get\_task\_context()` when running inside a Docket worker.
Contains identifiers needed to communicate with the MCP session.
###
[​
](#progresslike)
`ProgressLike` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1299)
Protocol for progress tracking interface.
Defines the common interface between InMemoryProgress (server context)
and Docket’s Progress (worker context).
**Methods:**
####
[​
](#current)
`current` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1307)
```
`current(self) -\> int | None
`
```
Current progress value.
####
[​
](#total)
`total` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1312)
```
`total(self) -\> int
`
```
Total/target progress value.
####
[​
](#message)
`message` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1317)
```
`message(self) -\> str | None
`
```
Current progress message.
####
[​
](#set_total)
`set\_total` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1321)
```
`set\_total(self, total: int) -\> None
`
```
Set the total/target value for progress tracking.
####
[​
](#increment)
`increment` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1325)
```
`increment(self, amount: int = 1) -\> None
`
```
Atomically increment the current progress value.
####
[​
](#set_message)
`set\_message` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1329)
```
`set\_message(self, message: str | None) -\> None
`
```
Update the progress status message.
###
[​
](#inmemoryprogress)
`InMemoryProgress` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1334)
In-memory progress tracker for immediate tool execution.
Provides the same interface as Docket’s Progress but stores state in memory
instead of Redis. Useful for testing and immediate execution where
progress doesn’t need to be observable across processes.
**Methods:**
####
[​
](#current-2)
`current` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1359)
```
`current(self) -\> int | None
`
```
####
[​
](#total-2)
`total` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1363)
```
`total(self) -\> int
`
```
####
[​
](#message-2)
`message` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1367)
```
`message(self) -\> str | None
`
```
####
[​
](#set_total-2)
`set\_total` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1370)
```
`set\_total(self, total: int) -\> None
`
```
Set the total/target value for progress tracking.
####
[​
](#increment-2)
`increment` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1376)
```
`increment(self, amount: int = 1) -\> None
`
```
Atomically increment the current progress value.
####
[​
](#set_message-2)
`set\_message` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1385)
```
`set\_message(self, message: str | None) -\> None
`
```
Update the progress status message.
###
[​
](#progress)
`Progress` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1390)
FastMCP Progress dependency that works in both server and worker contexts.
Handles three execution modes:
* In Docket worker: Uses the execution’s progress (observable via Redis)
* In FastMCP server with Docket: Falls back to in-memory progress
* In FastMCP server without Docket: Uses in-memory progress
This allows tools to use Progress() regardless of whether they’re called
immediately or as background tasks, and regardless of whether pydocket
is installed.
**Methods:**
####
[​
](#current-3)
`current` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1432)
```
`current(self) -\> int | None
`
```
Current progress value.
####
[​
](#total-3)
`total` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1438)
```
`total(self) -\> int
`
```
Total/target progress value.
####
[​
](#message-3)
`message` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1444)
```
`message(self) -\> str | None
`
```
Current progress message.
####
[​
](#set_total-3)
`set\_total` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1449)
```
`set\_total(self, total: int) -\> None
`
```
Set the total/target value for progress tracking.
####
[​
](#increment-3)
`increment` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1454)
```
`increment(self, amount: int = 1) -\> None
`
```
Atomically increment the current progress value.
####
[​
](#set_message-3)
`set\_message` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/server/dependencies.py#L1459)
```
`set\_message(self, message: str | None) -\> None
`
```
Update the progress status message.