app - FastMCP
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
](#fastmcp-apps-app)
`fastmcp.apps.app`
FastMCPApp — a Provider that represents a composable MCP application.
FastMCPApp binds entry-point tools (model calls these) together with backend
tools (the UI calls these via CallTool). Backend tools are tagged with
`meta["fastmcp"]["app"]` so they can be found through the provider chain
even when transforms (namespace, visibility, etc.) have renamed or hidden
them — the server sets a context var that tells `Provider.get\_tool` to
fall back to a direct lookup for app-visible tools.
Usage::
from fastmcp import FastMCP, FastMCPApp
app = FastMCPApp(“Dashboard”)
@app.ui()
def show\_dashboard() -\> Component:
return Column(…)
@app.tool()
def save\_contact(name: str, email: str) -\> str:
return name
server = FastMCP(“Platform”)
server.add\_provider(app)
##
[​
](#classes)
Classes
###
[​
](#fastmcpapp)
`FastMCPApp` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L131)
A Provider that represents an MCP application.
Binds together entry-point tools (`@app.ui`), backend tools
(`@app.tool`), and the Prefab renderer resource. Backend tools
are tagged with `meta["fastmcp"]["app"]` so `Provider.get\_tool`
can find them by original name even when transforms have been applied.
**Methods:**
####
[​
](#tool)
`tool` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L158)
```
`tool(self, name\_or\_fn: F) -\> F
`
```
####
[​
](#tool-2)
`tool` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L170)
```
`tool(self, name\_or\_fn: str | None = None) -\> Callable[[F], F]
`
```
####
[​
](#tool-3)
`tool` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L181)
```
`tool(self, name\_or\_fn: str | AnyFunction | None = None) -\> Any
`
```
Register a backend tool that the UI calls via CallTool.
Backend tools default to `visibility=["app"]`. Pass `model=True`
to also expose the tool to the model (`visibility=["app", "model"]`).
Supports multiple calling patterns::
@app.tool
def save(name: str): …
@app.tool()
def save(name: str): …
@app.tool(“custom\_name”)
def save(name: str): …
####
[​
](#ui)
`ui` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L242)
```
`ui(self, name\_or\_fn: F) -\> F
`
```
####
[​
](#ui-2)
`ui` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L257)
```
`ui(self, name\_or\_fn: str | None = None) -\> Callable[[F], F]
`
```
####
[​
](#ui-3)
`ui` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L271)
```
`ui(self, name\_or\_fn: str | AnyFunction | None = None) -\> Any
`
```
Register a UI entry-point tool that the model calls.
Entry-point tools default to `visibility=["model"]` and auto-wire
the Prefab renderer resource and CSP. They are tagged with the app
name so structured content includes `\_meta.fastmcp.app`.
Supports multiple calling patterns::
@app.ui
def dashboard() -\> Component: …
@app.ui()
def dashboard() -\> Component: …
@app.ui(“my\_dashboard”)
def dashboard() -\> Component: …
####
[​
](#add_tool)
`add\_tool` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L360)
```
`add\_tool(self, tool: Tool | Callable[..., Any]) -\> Tool
`
```
Add a tool to this app programmatically.
The tool is tagged with this app’s name for routing.
####
[​
](#lifespan)
`lifespan` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L410)
```
`lifespan(self) -\> AsyncIterator[None]
`
```
####
[​
](#run)
`run` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/apps/app.py#L418)
```
`run(self, transport: Literal['stdio', 'http', 'sse', 'streamable-http'] | None = None, \*\*kwargs: Any) -\> None
`
```
Create a temporary FastMCP server and run this app standalone.