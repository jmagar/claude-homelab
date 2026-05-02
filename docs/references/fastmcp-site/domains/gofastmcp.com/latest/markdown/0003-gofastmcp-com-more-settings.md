Settings - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/getting-started/welcome)
* [
Installation
](/getting-started/installation)
* [
Quickstart
](/getting-started/quickstart)
##### Servers
* [
Overview
](/servers/server)
*
Core Components
*
FeaturesUPDATED
*
Providers
*
Transforms
*
Auth
*
Deployment
##### Apps
* [
Overview
NEW
](/apps/overview)
* [
Quickstart
NEW
](/apps/quickstart)
* [
Examples
NEW
](/apps/examples)
*
Building AppsNEW
*
ProvidersNEW
*
AdvancedNEW
##### Clients
* [
Overview
](/clients/client)
* [
Transports
](/clients/transports)
*
Core Operations
*
HandlersUPDATED
*
AuthenticationUPDATED
##### Integrations
*
Auth
*
Web Frameworks
*
AI Assistants
*
AI SDKs
* [
MCP.json
](/integrations/mcp-json-configuration)
##### CLI
* [
Overview
](/cli/overview)
* [
Running
](/cli/running)
* [
Install MCPs
](/cli/install-mcp)
* [
Inspecting
](/cli/inspecting)
* [
Client
](/cli/client)
* [
Generate CLI
](/cli/generate-cli)
* [
Auth
](/cli/auth)
##### More
* [
Settings
](/more/settings)
*
Upgrading
*
Development
*
What's New
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
FastMCP uses [pydantic-settings](https://docs.pydantic.dev/latest/concepts/pydantic_settings/) for configuration. Every setting is available as an environment variable with a `FASTMCP\_` prefix. Settings are loaded from environment variables and from a `.env` file (see the [Tasks (Docket)](#tasks-docket) section for a caveat about nested settings in `.env` files).
```
`# Set via environment
export FASTMCP\_LOG\_LEVEL=DEBUG
export FASTMCP\_PORT=3000
# Or use a .env file (loaded automatically)
echo "FASTMCP\_LOG\_LEVEL=DEBUG" \>\> .env
`
```
You can change which `.env` file is loaded by setting the `FASTMCP\_ENV\_FILE` environment variable (defaults to `.env`). Because this controls which file is loaded, it must be set as an environment variable — it cannot be set inside a `.env` file itself.
##
[​
](#logging)
Logging
|Environment Variable|Type|Default|Description|
|`FASTMCP\_LOG\_LEVEL`|`Literal["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"]`|`INFO`|Log level for FastMCP’s own logging output. Case-insensitive.|
|`FASTMCP\_LOG\_ENABLED`|`bool`|`true`|Enable or disable FastMCP logging entirely.|
|`FASTMCP\_CLIENT\_LOG\_LEVEL`|`Literal["debug", "info", "notice", "warning", "error", "critical", "alert", "emergency"]`|None|Default minimum log level for messages sent to MCP clients via `context.log()`. When set, messages below this level are suppressed. Individual clients can override this per-session using the MCP `logging/setLevel` request.|
|`FASTMCP\_ENABLE\_RICH\_LOGGING`|`bool`|`true`|Use rich formatting for log output. Set to `false` for plain Python logging.|
|`FASTMCP\_ENABLE\_RICH\_TRACEBACKS`|`bool`|`true`|Use rich tracebacks for errors.|
|`FASTMCP\_DEPRECATION\_WARNINGS`|`bool`|`true`|Show deprecation warnings.|
##
[​
](#transport-&amp;-http)
Transport & HTTP
These control how the server listens when running with an HTTP transport.
|Environment Variable|Type|Default|Description|
|`FASTMCP\_TRANSPORT`|`Literal["stdio", "http", "sse", "streamable-http"]`|`stdio`|Default transport.|
|`FASTMCP\_HOST`|`str`|`127.0.0.1`|Host to bind to.|
|`FASTMCP\_PORT`|`int`|`8000`|Port to bind to.|
|`FASTMCP\_SSE\_PATH`|`str`|`/sse`|Path for SSE endpoint.|
|`FASTMCP\_MESSAGE\_PATH`|`str`|`/messages/`|Path for SSE message endpoint.|
|`FASTMCP\_STREAMABLE\_HTTP\_PATH`|`str`|`/mcp`|Path for Streamable HTTP endpoint.|
|`FASTMCP\_STATELESS\_HTTP`|`bool`|`false`|Enable stateless HTTP mode (new transport per request). Useful for multi-worker deployments.|
|`FASTMCP\_JSON\_RESPONSE`|`bool`|`false`|Use JSON responses instead of SSE for Streamable HTTP.|
|`FASTMCP\_DEBUG`|`bool`|`false`|Enable debug mode.|
##
[​
](#error-handling)
Error Handling
|Environment Variable|Type|Default|Description|
|`FASTMCP\_MASK\_ERROR\_DETAILS`|`bool`|`false`|Mask error details before sending to clients. When enabled, only messages from explicitly raised `ToolError`, `ResourceError`, or `PromptError` are included in responses.|
|`FASTMCP\_STRICT\_INPUT\_VALIDATION`|`bool`|`false`|Strictly validate tool inputs against the JSON schema. When disabled, compatible inputs are coerced (e.g., the string `"10"` becomes the integer `10`).|
|`FASTMCP\_MOUNTED\_COMPONENTS\_RAISE\_ON\_LOAD\_ERROR`|`bool`|`false`|Raise errors when loading mounted components instead of logging warnings.|
##
[​
](#client)
Client
|Environment Variable|Type|Default|Description|
|`FASTMCP\_CLIENT\_INIT\_TIMEOUT`|`float | None`|None|Timeout in seconds for the client initialization handshake. Set to `0` or leave unset to disable.|
|`FASTMCP\_CLIENT\_DISCONNECT\_TIMEOUT`|`float`|`5`|Maximum time in seconds to wait for a clean disconnect before giving up.|
|`FASTMCP\_CLIENT\_RAISE\_FIRST\_EXCEPTIONGROUP\_ERROR`|`bool`|`true`|When an `ExceptionGroup` is raised, re-raise the first error directly instead of the group. Simplifies debugging but may mask secondary errors.|
##
[​
](#cli-&amp;-display)
CLI & Display
|Environment Variable|Type|Default|Description|
|`FASTMCP\_SHOW\_SERVER\_BANNER`|`bool`|`true`|Show the server banner on startup. Also controllable via `--no-banner` or `server.run(show\_banner=False)`.|
|`FASTMCP\_CHECK\_FOR\_UPDATES`|`Literal["stable", "prerelease", "off"]`|`stable`|Update checking on CLI startup. `stable` checks stable releases only, `prerelease` includes pre-releases, `off` disables checking.|
##
[​
](#tasks-docket)
Tasks (Docket)
These configure the [Docket](https://github.com/prefecthq/docket) task queue used by [server tasks](/servers/tasks). All use the `FASTMCP\_DOCKET\_` prefix.
When setting Docket values in a `.env` file, use a **double** underscore: `FASTMCP\_DOCKET\_\_URL` (not `FASTMCP\_DOCKET\_URL`). This is because `.env` values are resolved through the parent `Settings` class, which uses `\_\_` as its nested delimiter. As regular environment variables (e.g., `export`), the single-underscore form `FASTMCP\_DOCKET\_URL` works fine.
|Environment Variable|Type|Default|Description|
|`FASTMCP\_DOCKET\_NAME`|`str`|`fastmcp`|Queue name. Servers and workers sharing the same name and backend URL share a task queue.|
|`FASTMCP\_DOCKET\_URL`|`str`|`memory://`|Backend URL. Use `memory://` for single-process or `redis://host:port/db` for distributed workers.|
|`FASTMCP\_DOCKET\_WORKER\_NAME`|`str | None`|None|Worker name. Auto-generated if unset.|
|`FASTMCP\_DOCKET\_CONCURRENCY`|`int`|`10`|Maximum concurrent tasks per worker.|
|`FASTMCP\_DOCKET\_REDELIVERY\_TIMEOUT`|`timedelta`|`300s`|If a worker doesn’t complete a task within this time, it’s redelivered to another worker.|
|`FASTMCP\_DOCKET\_RECONNECTION\_DELAY`|`timedelta`|`5s`|Delay between reconnection attempts when the worker loses its backend connection.|
|`FASTMCP\_DOCKET\_MINIMUM\_CHECK\_INTERVAL`|`timedelta`|`50ms`|How frequently the worker polls for new tasks. Lower values reduce latency at the cost of more CPU usage.|
##
[​
](#advanced)
Advanced
|Environment Variable|Type|Default|Description|
|`FASTMCP\_HOME`|`Path`|Platform default|Data directory for FastMCP. Defaults to the platform-specific user data directory.|
|`FASTMCP\_ENV\_FILE`|`str`|`.env`|Path to the `.env` file to load settings from. Must be set as an environment variable (see above).|
|`FASTMCP\_SERVER\_DEPENDENCIES`|`list[str]`|`[]`|Additional dependencies to install in the server environment.|
|`FASTMCP\_DECORATOR\_MODE`|`Literal["function", "object"]`|`function`|Controls what `@tool`, `@resource`, and `@prompt` decorators return. `function` returns the original function (default); `object` returns component objects (deprecated, will be removed).|
|`FASTMCP\_TEST\_MODE`|`bool`|`false`|Enable test mode.|