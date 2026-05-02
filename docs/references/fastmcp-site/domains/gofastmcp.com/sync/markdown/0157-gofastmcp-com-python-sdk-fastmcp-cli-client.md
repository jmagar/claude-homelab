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
](#fastmcp-cli-client)
`fastmcp.cli.client`
Client-side CLI commands for querying and invoking MCP servers.
##
[​
](#functions)
Functions
###
[​
](#resolve_server_spec)
`resolve\_server\_spec` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/client.py#L43)
```
`resolve\_server\_spec(server\_spec: str | None) -\> str | dict[str, Any] | ClientTransport
`
```
Turn CLI inputs into something `Client()` accepts.
Exactly one of `server\_spec` or `command` should be provided.
Resolution order for `server\_spec`:
1. URLs (`http://`, `https://`) — passed through as-is.
If `--transport` is `sse`, the URL is rewritten to end with `/sse`
so `infer\_transport` picks the right transport.
2. Existing file paths, or strings ending in `.py`/`.js`/`.json`.
3. Anything else — name-based resolution via `resolve\_name`.
When `command` is provided, the string is shell-split into a
`StdioTransport(command, args)`.
###
[​
](#coerce_value)
`coerce\_value` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/client.py#L264)
```
`coerce\_value(raw: str, schema: dict[str, Any]) -\> Any
`
```
Coerce a string CLI value according to a JSON-Schema type hint.
###
[​
](#parse_tool_arguments)
`parse\_tool\_arguments` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/client.py#L298)
```
`parse\_tool\_arguments(raw\_args: tuple[str, ...], input\_json: str | None, input\_schema: dict[str, Any]) -\> dict[str, Any]
`
```
Build a tool-call argument dict from CLI inputs.
A single JSON object argument is treated as the full argument dict.
`--input-json` provides the base dict; `key=value` pairs override.
Values are coerced using the tool’s `inputSchema`.
###
[​
](#format_tool_signature)
`format\_tool\_signature` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/client.py#L370)
```
`format\_tool\_signature(tool: mcp.types.Tool) -\> str
`
```
Build `name(param: type, ...) -\> return\_type` from a tool’s JSON schemas.
###
[​
](#list_command)
`list\_command` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/client.py#L641)
```
`list\_command(server\_spec: Annotated[str | None, cyclopts.Parameter(help='Server URL, Python file, MCPConfig JSON, or .js file')] = None) -\> None
`
```
List tools available on an MCP server.
**Examples:**
fastmcp list [http://localhost:8000/mcp](http://localhost:8000/mcp)
fastmcp list server.py
fastmcp list mcp.json —json
fastmcp list —command ‘npx -y @mcp/server’ —resources
fastmcp list [http://server/mcp](http://server/mcp) —transport sse
###
[​
](#call_command)
`call\_command` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/client.py#L796)
```
`call\_command(server\_spec: Annotated[str | None, cyclopts.Parameter(help='Server URL, Python file, MCPConfig JSON, or .js file')] = None, target: Annotated[str, cyclopts.Parameter(help='Tool name, resource URI, or prompt name (with --prompt)')] = '', \*arguments: str) -\> None
`
```
Call a tool, read a resource, or get a prompt on an MCP server.
By default the target is treated as a tool name. If the target
contains `://` it is treated as a resource URI. Pass `--prompt`
to treat it as a prompt name.
Arguments are passed as key=value pairs. Use —input-json for complex
or nested arguments.
**Examples:**
```
`fastmcp call server.py greet name=World
fastmcp call server.py resource://docs/readme
fastmcp call server.py analyze --prompt data='[1,2,3]'
fastmcp call http://server/mcp create --input-json '{"tags": ["a","b"]}'
`
```
###
[​
](#discover_command)
`discover\_command` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/client.py#L897)
```
`discover\_command() -\> None
`
```
Discover MCP servers configured in editor and project configs.
Scans Claude Desktop, Claude Code, Cursor, Gemini CLI, Goose, and
project-level mcp.json files for MCP server definitions.
Discovered server names can be used directly with `fastmcp list`
and `fastmcp call` instead of specifying a URL or file path.
**Examples:**
fastmcp discover
fastmcp discover —source claude-code
fastmcp discover —source cursor —source gemini —json
fastmcp list weather
fastmcp call cursor:weather get\_forecast city=London