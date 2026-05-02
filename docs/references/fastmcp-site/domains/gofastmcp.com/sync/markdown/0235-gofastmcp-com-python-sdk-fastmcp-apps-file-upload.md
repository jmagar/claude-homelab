file\_upload - FastMCP
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
](#fastmcp-apps-file_upload)
`fastmcp.apps.file\_upload`
FileUpload — a Provider that adds drag-and-drop file upload to any server.
Lets users upload files directly to the server through an interactive UI,
bypassing the LLM context window entirely. The LLM can then read and work
with uploaded files through model-visible tools.
Requires `fastmcp[apps]` (prefab-ui).
Usage::
from fastmcp import FastMCP
from fastmcp.apps import FileUpload
mcp = FastMCP(“My Server”)
mcp.add\_provider(FileUpload())
For custom persistence, override the storage methods::
class S3Upload(FileUpload):
def on\_store(self, files, ctx):
#
[​
](#write-to-s3-return-summaries)
write to S3, return summaries
…
def on\_list(self, ctx):
#
[​
](#list-from-s3)
list from S3
…
def on\_read(self, name, ctx):
#
[​
](#read-from-s3)
read from S3
…
##
[​
](#classes)
Classes
###
[​
](#fileupload)
`FileUpload` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/file_upload.py#L93)
A Provider that adds file upload capabilities to a server.
Registers a drag-and-drop UI tool, a backend storage tool, and
model-visible tools for listing and reading uploaded files.
Files are scoped by MCP session and stored in memory by default.
Override `on\_store`, `on\_list`, and `on\_read` for custom
persistence (filesystem, S3, database, etc.). Each method receives
the current `Context`, giving access to session ID, auth tokens,
and request metadata for partitioning and authorization.
**Session scoping:** The default storage uses `ctx.session\_id` to
isolate files by session. This works with stdio, SSE, and stateful
HTTP transports. In **stateless HTTP** mode, each request creates a
new session, so files won’t persist across requests. For stateless
deployments, override the storage methods to partition by a stable
identifier from the auth context::
class UserScopedUpload(FileUpload):
def on\_store(self, files, ctx):
user\_id = ctx.access\_token[“sub”]
…
Example::
from fastmcp import FastMCP
from fastmcp.apps.file\_upload import FileUpload
mcp = FastMCP(“My Server”)
mcp.add\_provider(FileUpload())
**Methods:**
####
[​
](#on_store)
`on\_store` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/file_upload.py#L174)
```
`on\_store(self, files: list[dict[str, Any]], ctx: Context) -\> list[dict[str, Any]]
`
```
Store uploaded files and return summaries.
**Args:**
* `files`: List of file dicts, each with `name`, `size`,
`type`, and `data` (base64-encoded content).
* `ctx`: The current request context. Use for session ID,
auth tokens, or any metadata needed for partitioning.
Override this method for custom persistence. The default
implementation stores files in memory, scoped by
`\_get\_scope\_key(ctx)`.
**Returns:**
* List of file summary dicts (`name`, `type`, `size`,
* `size\_display`, `uploaded\_at`).
####
[​
](#on_list)
`on\_list` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/file_upload.py#L207)
```
`on\_list(self, ctx: Context) -\> list[dict[str, Any]]
`
```
List all stored files.
**Args:**
* `ctx`: The current request context.
Override this method for custom persistence. The default
implementation returns files from the current scope.
**Returns:**
* List of file summary dicts.
####
[​
](#on_read)
`on\_read` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/file_upload.py#L223)
```
`on\_read(self, name: str, ctx: Context) -\> dict[str, Any]
`
```
Read a file’s contents by name.
**Args:**
* `name`: The filename to read.
* `ctx`: The current request context.
Override this method for custom persistence. The default
implementation reads from the current scope’s in-memory store.
Text files are decoded from base64; binary files return a
truncated base64 preview.
**Returns:**
* Dict with file metadata and `content` (text) or
* `content\_base64` (binary preview).
**Raises:**
* `ValueError`: If the file is not found.