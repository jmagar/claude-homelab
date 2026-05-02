cli - FastMCP
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
](#fastmcp-cli-cli)
`fastmcp.cli.cli`
FastMCP CLI tools using Cyclopts.
##
[​
](#functions)
Functions
###
[​
](#with_argv)
`with\_argv` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/cli.py#L73)
```
`with\_argv(args: list[str] | None)
`
```
Temporarily replace sys.argv if args provided.
This context manager is used at the CLI boundary to inject
server arguments when needed, without mutating sys.argv deep
in the source loading logic.
Args are provided without the script name, so we preserve sys.argv[0]
and replace the rest.
###
[​
](#version)
`version` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/cli.py#L96)
```
`version()
`
```
Display version information and platform details.
###
[​
](#inspector)
`inspector` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/cli.py#L142)
```
`inspector(server\_spec: str | None = None) -\> None
`
```
Run an MCP server with the MCP Inspector for development.
**Args:**
* `server\_spec`: Python file to run, optionally with :object suffix, or None to auto-detect fastmcp.json
###
[​
](#apps)
`apps` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/cli.py#L337)
```
`apps(server\_spec: str) -\> None
`
```
Preview a FastMCPApp UI in the browser.
Starts the MCP server from SERVER\_SPEC on —mcp-port, launches a local
dev UI on —dev-port with a tool picker and AppBridge host, then opens
the browser automatically.
Requires fastmcp[apps] to be installed (prefab-ui).
###
[​
](#run)
`run` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/cli.py#L385)
```
`run(server\_spec: str | None = None, \*server\_args: str) -\> None
`
```
Run an MCP server or connect to a remote one.
The server can be specified in several ways:
1. Module approach: “server.py” - runs the module directly, looking for an object named ‘mcp’, ‘server’, or ‘app’
2. Import approach: “server.py:app” - imports and runs the specified server object
3. URL approach: “[http://server-url](http://server-url)” - connects to a remote server and creates a proxy
4. MCPConfig file: “mcp.json” - runs as a proxy server for the MCP Servers in the MCPConfig file
5. FastMCP config: “fastmcp.json” - runs server using FastMCP configuration
6. No argument: looks for fastmcp.json in current directory
7. Module mode: “-m my\_module” - runs the module directly via python -m
Server arguments can be passed after — :
fastmcp run server.py — —config config.json —debug
**Args:**
* `server\_spec`: Python file, object specification (file:obj), config file, URL, or None to auto-detect
###
[​
](#inspect)
`inspect` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/cli.py#L760)
```
`inspect(server\_spec: str | None = None) -\> None
`
```
Inspect an MCP server and display information or generate a JSON report.
This command analyzes an MCP server. Without flags, it displays a text summary.
Use —format to output complete JSON data.
**Examples:**
#
[​
](#show-text-summary)
Show text summary
fastmcp inspect server.py
#
[​
](#output-fastmcp-format-json-to-stdout)
Output FastMCP format JSON to stdout
fastmcp inspect server.py —format fastmcp
#
[​
](#save-mcp-protocol-format-to-file-format-required-with-o)
Save MCP protocol format to file (format required with -o)
fastmcp inspect server.py —format mcp -o manifest.json
#
[​
](#inspect-from-fastmcp-json-configuration)
Inspect from fastmcp.json configuration
fastmcp inspect fastmcp.json
fastmcp inspect # auto-detect fastmcp.json
**Args:**
* `server\_spec`: Python file to inspect, optionally with :object suffix, or fastmcp.json
###
[​
](#prepare)
`prepare` [](https://github.com/PrefectHQ/fastmcp/blob/main/src/fastmcp/cli/cli.py#L1002)
```
`prepare(config\_path: Annotated[str | None, cyclopts.Parameter(help='Path to fastmcp.json configuration file')] = None, output\_dir: Annotated[str | None, cyclopts.Parameter(help='Directory to create the persistent environment in')] = None, skip\_source: Annotated[bool, cyclopts.Parameter(help='Skip source preparation (e.g., git clone)')] = False) -\> None
`
```
Prepare a FastMCP project by creating a persistent uv environment.
This command creates a persistent uv project with all dependencies installed:
* Creates a pyproject.toml with dependencies from the config
* Installs all Python packages into a .venv
* Prepares the source (git clone, download, etc.) unless —skip-source
After running this command, you can use:
fastmcp run \<config\> —project \<output-dir\>
This is useful for:
* CI/CD pipelines with separate build and run stages
* Docker images where you prepare during build
* Production deployments where you want fast startup times