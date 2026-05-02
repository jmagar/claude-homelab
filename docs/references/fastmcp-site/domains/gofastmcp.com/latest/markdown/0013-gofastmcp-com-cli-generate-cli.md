Generate CLI - FastMCP
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
New in version `3.0.0`
`fastmcp list` and `fastmcp call` are general-purpose — you always specify the server, the tool name, and the arguments from scratch. `fastmcp generate-cli` goes further: it connects to a server, reads its tool schemas, and writes a standalone Python script where every tool is a proper subcommand with typed flags, help text, and tab completion. The result is a CLI that feels hand-written for that specific server.
MCP tool schemas already contain everything a CLI framework needs — parameter names, types, descriptions, required/optional status, and defaults. `generate-cli` maps that into [cyclopts](https://cyclopts.readthedocs.io/) commands, so JSON Schema types become Python type annotations, descriptions become `--help` text, and required parameters become mandatory flags.
##
[​
](#generating-a-script)
Generating a Script
Point the command at any [server target](/cli/overview#server-targets) and it writes a CLI script:
```
`fastmcp generate-cli weather
fastmcp generate-cli http://localhost:8000/mcp
fastmcp generate-cli server.py my\_weather\_cli.py
`
```
The second positional argument sets the output path (defaults to `cli.py`). If the file already exists, pass `-f` to overwrite:
```
`fastmcp generate-cli weather -f
`
```
##
[​
](#what-you-get)
What You Get
The generated script is a regular Python file — executable, editable, and yours:
```
`$ python cli.py call-tool --help
Usage: weather-cli call-tool COMMAND
Call a tool on the server
Commands:
get\_forecast Get the weather forecast for a city.
search\_city Search for a city by name.
`
```
Each tool has typed parameters with help text pulled directly from the server’s schema:
```
`$ python cli.py call-tool get\_forecast --help
Usage: weather-cli call-tool get\_forecast [OPTIONS]
Get the weather forecast for a city.
Options:
--city [str] City name (required)
--days [int] Number of forecast days (default: 3)
`
```
Beyond tool commands, the script includes generic MCP operations — `list-tools`, `list-resources`, `read-resource`, `list-prompts`, and `get-prompt` — that always reflect the server’s current state, even if tools have changed since generation.
##
[​
](#parameter-handling)
Parameter Handling
Parameters are mapped based on their JSON Schema type:
**Simple types** (`string`, `integer`, `number`, `boolean`) become typed flags:
```
`python cli.py call-tool get\_forecast --city London --days 3
`
```
**Arrays of simple types** become repeatable flags:
```
`python cli.py call-tool tag\_items --tags python --tags fastapi --tags mcp
`
```
**Complex types** (objects, nested arrays, unions) accept JSON strings. The `--help` output shows the full schema so you know what structure to pass:
```
`python cli.py call-tool create\_user \\
--name John \\
--metadata '{"role": "admin", "dept": "engineering"}'
`
```
##
[​
](#agent-skill)
Agent Skill
Alongside the CLI script, `generate-cli` writes a `SKILL.md` file — a [Claude Code agent skill](https://docs.anthropic.com/en/docs/agents-and-tools/claude-code/skills) that documents every tool’s exact invocation syntax, parameter flags, types, and descriptions. An agent can pick up the CLI immediately without running `--help` or experimenting with flag names.
To skip skill generation:
```
`fastmcp generate-cli weather --no-skill
`
```
##
[​
](#how-it-works)
How It Works
The generated script is a *client*, not a server — it connects to the server on every invocation rather than bundling it. A `CLIENT\_SPEC` variable at the top holds the resolved transport (a URL string or `StdioTransport` with baked-in command and arguments).
The most common edit is changing `CLIENT\_SPEC` — for example, pointing a script generated from a dev server at production. Beyond that, the helper functions (`\_call\_tool`, `\_print\_tool\_result`) are thin wrappers around `fastmcp.Client` that are easy to adapt.
The script requires `fastmcp` as a dependency. If it lives outside a project that already has FastMCP installed:
```
`uv run --with fastmcp python cli.py call-tool get\_forecast --city London
`
```