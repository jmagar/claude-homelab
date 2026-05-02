base - FastMCP
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
](#fastmcp-resources-base)
`fastmcp.resources.base`
Base classes and interfaces for FastMCP resources.
##
[​
](#classes)
Classes
###
[​
](#resourcecontent)
`ResourceContent` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L38)
Wrapper for resource content with optional MIME type and metadata.
Accepts any value for content - strings and bytes pass through directly,
other types (dict, list, BaseModel, etc.) are automatically JSON-serialized.
**Methods:**
####
[​
](#to_mcp_resource_contents)
`to\_mcp\_resource\_contents` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L93)
```
`to\_mcp\_resource\_contents(self, uri: AnyUrl | str) -\> mcp.types.TextResourceContents | mcp.types.BlobResourceContents
`
```
Convert to MCP resource contents type.
**Args:**
* `uri`: The URI of the resource (required by MCP types)
**Returns:**
* TextResourceContents for str content, BlobResourceContents for bytes
###
[​
](#resourceresult)
`ResourceResult` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L120)
Canonical result type for resource reads.
Provides explicit control over resource responses: multiple content items,
per-item MIME types, and metadata at both the item and result level.
**Methods:**
####
[​
](#to_mcp_result)
`to\_mcp\_result` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L195)
```
`to\_mcp\_result(self, uri: AnyUrl | str) -\> mcp.types.ReadResourceResult
`
```
Convert to MCP ReadResourceResult.
**Args:**
* `uri`: The URI of the resource (required by MCP types)
**Returns:**
* MCP ReadResourceResult with converted contents
###
[​
](#resource)
`Resource` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L211)
Base class for all resources.
**Methods:**
####
[​
](#from_function)
`from\_function` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L236)
```
`from\_function(cls, fn: Callable[..., Any], uri: str | AnyUrl) -\> FunctionResource
`
```
####
[​
](#set_default_mime_type)
`set\_default\_mime\_type` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L275)
```
`set\_default\_mime\_type(cls, mime\_type: str | None) -\> str
`
```
Set default MIME type if not provided.
####
[​
](#set_default_name)
`set\_default\_name` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L282)
```
`set\_default\_name(self) -\> Self
`
```
Set default name from URI if not provided.
####
[​
](#read)
`read` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L292)
```
`read(self) -\> str | bytes | ResourceResult
`
```
Read the resource content.
Subclasses implement this to return resource data. Supported return types:
* str: Text content
* bytes: Binary content
* ResourceResult: Full control over contents and result-level meta
####
[​
](#convert_result)
`convert\_result` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L304)
```
`convert\_result(self, raw\_value: Any) -\> ResourceResult
`
```
Convert a raw result to ResourceResult.
This is used in two contexts:
1. In \_read() to convert user function return values to ResourceResult
2. In tasks\_result\_handler() to convert Docket task results to ResourceResult
Handles ResourceResult passthrough and converts raw values using
ResourceResult’s normalization. When the raw value is a plain
string or bytes, the resource’s own `mime\_type` is forwarded so
that `ui://` resources (and others with non-default MIME types)
don’t fall back to `text/plain`.
The resource’s component-level `meta` (e.g. `ui` metadata for
MCP Apps CSP/permissions) is propagated to each content item so
that hosts can read it from the `resources/read` response.
####
[​
](#to_mcp_resource)
`to\_mcp\_resource` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L375)
```
`to\_mcp\_resource(self, \*\*overrides: Any) -\> SDKResource
`
```
Convert the resource to an SDKResource.
####
[​
](#key)
`key` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L398)
```
`key(self) -\> str
`
```
The globally unique lookup key for this resource.
####
[​
](#register_with_docket)
`register\_with\_docket` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L403)
```
`register\_with\_docket(self, docket: Docket) -\> None
`
```
Register this resource with docket for background execution.
####
[​
](#add_to_docket)
`add\_to\_docket` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L409)
```
`add\_to\_docket(self, docket: Docket, \*\*kwargs: Any) -\> Execution
`
```
Schedule this resource for background execution via docket.
**Args:**
* `docket`: The Docket instance
* `fn\_key`: Function lookup key in Docket registry (defaults to self.key)
* `task\_key`: Redis storage key for the result
* `\*\*kwargs`: Additional kwargs passed to docket.add()
####
[​
](#get_span_attributes)
`get\_span\_attributes` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/resources/base.py#L430)
```
`get\_span\_attributes(self) -\> dict[str, Any]
`
```