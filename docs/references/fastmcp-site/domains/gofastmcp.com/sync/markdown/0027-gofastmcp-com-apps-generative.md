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
* [
Prefab UI
NEW
](/apps/prefab)
* [
FastMCPApp
NEW
](/apps/interactive-apps)
* [
Generative UI
NEW
](/apps/generative)
* [
Patterns
NEW
](/apps/patterns)
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
Generative UI means the LLM writes the UI code at runtime. Instead of calling a pre-built tool with a fixed interface, the model writes Prefab Python code tailored to the current data and request. The user watches the UI build up in real time as the model generates code.
```
`from fastmcp import FastMCP
from fastmcp.apps.generative import GenerativeUI
mcp = FastMCP("Prefab Studio")
mcp.add\_provider(GenerativeUI())
`
```
That’s it. The `GenerativeUI` provider registers everything:
* **`generate\_prefab\_ui`** — a tool that accepts Python code, executes it in a Pyodide sandbox, and renders the result as a Prefab app
* **`search\_prefab\_components`** — a tool that lets the LLM search the Prefab component library to discover what’s available
* **The generative renderer** — a `ui://` resource with browser-side Pyodide for streaming progressive rendering
##
[​
](#how-it-works)
How It Works
When the LLM decides to call `generate\_prefab\_ui`, it writes Prefab Python code into the `code` argument. The MCP Apps protocol creates the renderer iframe in parallel with the tool call, so the app is already running when partial arguments start flowing.
As the LLM generates each token:
1. The host forwards partial arguments to the app via `ontoolinputpartial`
2. The renderer extracts the growing `code` string
3. Browser-side Pyodide executes whatever compiles successfully
4. The user sees components appear as they’re written
When the LLM finishes, the server runs the complete code in a server-side Pyodide sandbox for validation, and the renderer replaces the streaming preview with the final server-validated result.
##
[​
](#what-the-llm-writes)
What the LLM Writes
The tool description includes code examples that teach the LLM the Prefab patterns. A typical generation looks like:
```
`from prefab\_ui.components import Column, Row, Heading, Text, Badge, Card, CardContent
from prefab\_ui.components.charts import BarChart, ChartSeries
from prefab\_ui.app import PrefabApp
with PrefabApp() as app:
with Column(gap=6, css\_class="p-6"):
Heading("Q3 Revenue Report")
BarChart(
data=[
{"month": "Jul", "revenue": 42000},
{"month": "Aug", "revenue": 51000},
{"month": "Sep", "revenue": 63000},
],
series=[ChartSeries(data\_key="revenue", label="Revenue")],
x\_axis="month",
)
with Row(gap=4):
with Card():
with CardContent():
Text("Total", css\_class="text-sm text-muted-foreground")
Heading("$156,000")
with Card():
with CardContent():
Text("Growth", css\_class="text-sm text-muted-foreground")
Badge("+18%", variant="success")
`
```
The model writes real Python — loops, f-strings, computation, helper functions. Prefab’s component library gives it charts, tables, forms, cards, badges, and layout primitives to work with.
##
[​
](#the-component-search-tool)
The Component Search Tool
Before writing code, the LLM can call `search\_prefab\_components` to discover what’s available:
```
`search\_prefab\_components("Chart")
→ 7 components matching 'Chart':
AreaChart — from prefab\_ui.components.charts import AreaChart
BarChart — from prefab\_ui.components.charts import BarChart
...
`
```
Passing `detail=True` returns full field descriptions and docstrings. The search tool introspects the actual Prefab classes at runtime, so it’s always up to date with the installed version.
##
[​
](#passing-data)
Passing Data
The `generate\_prefab\_ui` tool accepts a `data` parameter. Values passed here become global variables in the sandbox:
```
`# The LLM can reference 'sales\_data' directly in its code
result = await generate\_prefab\_ui(
code="...",
data={"sales\_data": [{"month": "Jan", "revenue": 42000}, ...]}
)
`
```
This lets the model use real data from earlier in the conversation to build visualizations.
##
[​
](#configuration)
Configuration
`GenerativeUI` accepts options for customizing tool names:
```
`GenerativeUI(
tool\_name="generate\_prefab\_ui", # default
components\_tool\_name="search\_prefab\_components", # default
include\_components\_tool=True, # default
)
`
```
##
[​
](#requirements)
Requirements
Generative UI requires `fastmcp[apps]` which installs `prefab-ui`. The Pyodide sandbox (for server-side validation) requires Deno — it installs automatically on first use.
The streaming renderer loads Pyodide from CDN in the browser. The CSP is configured automatically by the provider — no manual setup needed.
##
[​
](#sandbox-limitations)
Sandbox Limitations
The Pyodide sandbox includes the Python standard library and Prefab. External packages (NumPy, pandas, requests, etc.) are **not available** — the LLM’s code must work with only built-in Python and Prefab components. If the LLM tries to import an unavailable package, the sandbox will raise an `ImportError`.
##
[​
](#next-steps)
Next Steps
* **[GenerativeUI Provider Reference](/apps/providers/generative)** — Configuration options and quick setup
* **[Prefab UI](/apps/prefab)** — The component library and state system the LLM writes code against
* **[Prefab Component Reference](https://prefab.prefect.io/docs/components)** — Full component library documentation
* **[Development](/apps/development)** — Preview generative UI tools locally with `fastmcp dev apps`