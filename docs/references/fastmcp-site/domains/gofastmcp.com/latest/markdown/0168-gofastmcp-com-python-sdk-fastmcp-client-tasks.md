tasks - FastMCP
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
](#fastmcp-client-tasks)
`fastmcp.client.tasks`
SEP-1686 client Task classes.
##
[​
](#classes)
Classes
###
[​
](#tasknotificationhandler)
`TaskNotificationHandler` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L26)
MessageHandler that routes task status notifications to Task objects.
**Methods:**
####
[​
](#dispatch)
`dispatch` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L33)
```
`dispatch(self, message: Message) -\> None
`
```
Dispatch messages, including task status notifications.
###
[​
](#task)
`Task` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L47)
Abstract base class for MCP background tasks (SEP-1686).
Provides a uniform API whether the server accepts background execution
or executes synchronously (graceful degradation per SEP-1686).
**Methods:**
####
[​
](#task_id)
`task\_id` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L105)
```
`task\_id(self) -\> str
`
```
Get the task ID.
####
[​
](#returned_immediately)
`returned\_immediately` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L110)
```
`returned\_immediately(self) -\> bool
`
```
Check if server executed the task immediately.
**Returns:**
* True if server executed synchronously (graceful degradation or no task support)
* False if server accepted background execution
####
[​
](#on_status_change)
`on\_status\_change` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L145)
```
`on\_status\_change(self, callback: Callable[[GetTaskResult], None | Awaitable[None]]) -\> None
`
```
Register callback for status change notifications.
The callback will be invoked when a notifications/tasks/status is received
for this task (optional server feature per SEP-1686 lines 436-444).
Supports both sync and async callbacks (auto-detected).
**Args:**
* `callback`: Function to call with GetTaskResult when status changes.
Can return None (sync) or Awaitable[None] (async).
####
[​
](#status)
`status` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L171)
```
`status(self) -\> GetTaskResult
`
```
Get current task status.
If server executed immediately, returns synthetic completed status.
Otherwise queries the server for current status.
####
[​
](#result)
`result` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L202)
```
`result(self) -\> TaskResultT
`
```
Wait for and return the task result.
Must be implemented by subclasses to return the appropriate result type.
####
[​
](#wait)
`wait` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L209)
```
`wait(self) -\> GetTaskResult
`
```
Wait for task to reach a specific state or complete.
Uses event-based waiting when notifications are available (fast),
with fallback to polling (reliable). Optimally wakes up immediately
on status changes when server sends notifications/tasks/status.
**Args:**
* `state`: Desired state (‘submitted’, ‘working’, ‘completed’, ‘failed’).
If None, waits for any terminal state (completed/failed)
* `timeout`: Maximum time to wait in seconds
**Returns:**
* Final task status
**Raises:**
* `TimeoutError`: If desired state not reached within timeout
####
[​
](#cancel)
`cancel` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L272)
```
`cancel(self) -\> None
`
```
Cancel this task, transitioning it to cancelled state.
Sends a tasks/cancel protocol request. The server will attempt to halt
execution and move the task to cancelled state.
Note: If server executed immediately (graceful degradation), this is a no-op
as there’s no server-side task to cancel.
###
[​
](#tooltask)
`ToolTask` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L294)
Represents a tool call that may execute in background or immediately.
Provides a uniform API whether the server accepts background execution
or executes synchronously (graceful degradation per SEP-1686).
**Methods:**
####
[​
](#result-2)
`result` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L336)
```
`result(self) -\> CallToolResult
`
```
Wait for and return the tool result.
If server executed immediately, returns the immediate result.
Otherwise waits for background task to complete and retrieves result.
**Returns:**
* The parsed tool result (same as call\_tool returns)
###
[​
](#prompttask)
`PromptTask` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L396)
Represents a prompt call that may execute in background or immediately.
Provides a uniform API whether the server accepts background execution
or executes synchronously (graceful degradation per SEP-1686).
**Methods:**
####
[​
](#result-3)
`result` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L427)
```
`result(self) -\> mcp.types.GetPromptResult
`
```
Wait for and return the prompt result.
If server executed immediately, returns the immediate result.
Otherwise waits for background task to complete and retrieves result.
**Returns:**
* The prompt result with messages and description
###
[​
](#resourcetask)
`ResourceTask` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L461)
Represents a resource read that may execute in background or immediately.
Provides a uniform API whether the server accepts background execution
or executes synchronously (graceful degradation per SEP-1686).
**Methods:**
####
[​
](#result-4)
`result` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/client/tasks.py#L497)
```
`result(self) -\> list[mcp.types.TextResourceContents | mcp.types.BlobResourceContents]
`
```
Wait for and return the resource contents.
If server executed immediately, returns the immediate result.
Otherwise waits for background task to complete and retrieves result.
**Returns:**
* list[ReadResourceContents]: The resource contents