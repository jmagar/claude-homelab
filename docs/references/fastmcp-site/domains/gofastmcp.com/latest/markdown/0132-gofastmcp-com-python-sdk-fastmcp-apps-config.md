config - FastMCP
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
](#fastmcp-apps-config)
`fastmcp.apps.config`
MCP Apps support — extension negotiation and typed UI metadata models.
Provides constants and Pydantic models for the MCP Apps extension
(io.modelcontextprotocol/ui), enabling tools and resources to carry
UI metadata for clients that support interactive app rendering.
##
[​
](#functions)
Functions
###
[​
](#app_config_to_meta_dict)
`app\_config\_to\_meta\_dict` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/config.py#L173)
```
`app\_config\_to\_meta\_dict(app: AppConfig | dict[str, Any]) -\> dict[str, Any]
`
```
Convert an AppConfig or dict to the wire-format dict for `meta["ui"]`.
##
[​
](#classes)
Classes
###
[​
](#resourcecsp)
`ResourceCSP` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/config.py#L20)
Content Security Policy for MCP App resources.
Declares which external origins the app is allowed to connect to or
load resources from. Hosts use these declarations to build the
`Content-Security-Policy` header for the sandboxed iframe.
###
[​
](#resourcepermissions)
`ResourcePermissions` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/config.py#L52)
Iframe sandbox permissions for MCP App resources.
Each field, when set (typically to `{}`), requests that the host
grant the corresponding Permission Policy feature to the sandboxed
iframe. Hosts MAY honour these; apps should use JS feature detection
as a fallback.
###
[​
](#appconfig)
`AppConfig` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/config.py#L79)
Configuration for MCP App tools and resources.
Controls how a tool or resource participates in the MCP Apps extension.
On tools, `resource\_uri` and `visibility` specify which UI resource
to render and where the tool appears. On resources, those fields must
be left unset (the resource itself is the UI).
All fields use `exclude\_none` serialization so only explicitly-set
values appear on the wire. Aliases match the MCP Apps wire format
(camelCase).
###
[​
](#prefabappconfig)
`PrefabAppConfig` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/config.py#L117)
App configuration for Prefab tools with sensible defaults.
Like `app=True` but customizable. Auto-wires the Prefab renderer
URI and merges the renderer’s CSP with any additional domains you
specify. The renderer resource is registered automatically.
Example::
@mcp.tool(app=PrefabAppConfig()) # same as app=True
@mcp.tool(app=PrefabAppConfig(
csp=ResourceCSP(frame\_domains=[“[https://example.com](https://example.com)”]),
))
**Methods:**
####
[​
](#model_post_init)
`model\_post\_init` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/config.py#L133)
```
`model\_post\_init(self, \_\_context: Any) -\> None
`
```