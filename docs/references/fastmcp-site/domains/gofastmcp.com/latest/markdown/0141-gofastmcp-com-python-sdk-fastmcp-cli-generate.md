generate - FastMCP
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
](#fastmcp-cli-generate)
`fastmcp.cli.generate`
Generate a standalone CLI script and agent skill from an MCP server.
##
[​
](#functions)
Functions
###
[​
](#serialize_transport)
`serialize\_transport` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/generate.py#L122)
```
`serialize\_transport(resolved: str | dict[str, Any] | ClientTransport) -\> tuple[str, set[str]]
`
```
Serialize a resolved transport to a Python expression string.
Returns `(expression, extra\_imports)` where *extra\_imports* is a set of
import lines needed by the expression.
###
[​
](#generate_cli_script)
`generate\_cli\_script` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/generate.py#L283)
```
`generate\_cli\_script(server\_name: str, server\_spec: str, transport\_code: str, extra\_imports: set[str], tools: list[mcp.types.Tool]) -\> str
`
```
Generate the full CLI script source code.
###
[​
](#generate_skill_content)
`generate\_skill\_content` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/generate.py#L621)
```
`generate\_skill\_content(server\_name: str, cli\_filename: str, tools: list[mcp.types.Tool]) -\> str
`
```
Generate a SKILL.md file for a generated CLI script.
###
[​
](#generate_cli_command)
`generate\_cli\_command` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/generate.py#L672)
```
`generate\_cli\_command(server\_spec: Annotated[str, cyclopts.Parameter(help='Server URL, Python file, MCPConfig JSON, discovered name, or .js file')], output: Annotated[str, cyclopts.Parameter(help='Output file path (default: cli.py)')] = 'cli.py') -\> None
`
```
Generate a standalone CLI script from an MCP server.
Connects to the server, reads its tools/resources/prompts, and writes
a Python script that can invoke them directly. Also generates a SKILL.md
agent skill file unless —no-skill is passed.
**Examples:**
fastmcp generate-cli weather
fastmcp generate-cli weather my\_cli.py
fastmcp generate-cli [http://localhost:8000/mcp](http://localhost:8000/mcp)
fastmcp generate-cli server.py output.py -f
fastmcp generate-cli weather —no-skill