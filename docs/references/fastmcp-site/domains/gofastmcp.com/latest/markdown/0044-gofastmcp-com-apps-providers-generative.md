Generative UI - FastMCP
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
* [
Approval
NEW
](/apps/providers/approval)
* [
Choice
NEW
](/apps/providers/choice)
* [
File Upload
NEW
](/apps/providers/file-upload)
* [
Form Input
NEW
](/apps/providers/form)
* [
Generative UI
NEW
](/apps/providers/generative)
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
`GenerativeUI` lets the LLM write Prefab Python code at runtime and render it as a streaming interactive UI. Instead of calling pre-built tools with fixed interfaces, the model creates tailored visualizations for whatever data it’s working with.
```
`from fastmcp import FastMCP
from fastmcp.apps.generative import GenerativeUI
mcp = FastMCP("My Server")
mcp.add\_provider(GenerativeUI())
`
```
This registers:
|Component|Type|Purpose|
|`generate\_prefab\_ui`|Tool|Accepts Python code, executes in Pyodide sandbox, renders result|
|`search\_prefab\_components`|Tool|Lets the LLM discover available Prefab components|
|Generative renderer|Resource|`ui://` resource with browser-side Pyodide for streaming|
The LLM writes real Python — loops, f-strings, computation — using Prefab’s component library (charts, tables, forms, cards, layout primitives). As the model generates tokens, the host streams partial code to the renderer via `ontoolinputpartial`, so the user watches the UI build up in real time.
##
[​
](#configuration)
Configuration
```
`GenerativeUI(
tool\_name="generate\_prefab\_ui", # Rename the generation tool
components\_tool\_name="search\_prefab\_components", # Rename the search tool
include\_components\_tool=True, # Set False to omit the search tool
)
`
```
##
[​
](#what-the-llm-sees)
What the LLM Sees
The tool description includes code examples that teach the LLM the Prefab patterns. The LLM calls `generate\_prefab\_ui` with a `code` argument containing Prefab Python, and optionally a `data` argument to pass in real data from the conversation:
```
`# The LLM generates something like:
generate\_prefab\_ui(
code="""
from prefab\_ui.components import Column, Heading
from prefab\_ui.components.charts import BarChart, ChartSeries
from prefab\_ui.app import PrefabApp
with PrefabApp() as app:
with Column(gap=4):
Heading("Revenue")
BarChart(data=data, series=[ChartSeries(data\_key="revenue")], x\_axis="quarter")
""",
data={"data": [{"quarter": "Q1", "revenue": 42000}, ...]}
)
`
```
The component search tool lets the LLM discover what’s available before writing code — `search\_prefab\_components("Chart")` returns matching components with import paths.
##
[​
](#requirements)
Requirements
Requires `fastmcp[apps]` (installs `prefab-ui`). The Pyodide sandbox for server-side validation requires Deno, which installs automatically on first use. The streaming renderer loads Pyodide from CDN in the browser — CSP is configured automatically.
The sandbox includes the Python standard library and Prefab. External packages (NumPy, pandas, etc.) are not available.
##
[​
](#learn-more)
Learn More
The full **[Generative UI guide](/apps/generative)** covers the streaming mechanics in detail, how to pass data, the component search tool, and sandbox limitations.