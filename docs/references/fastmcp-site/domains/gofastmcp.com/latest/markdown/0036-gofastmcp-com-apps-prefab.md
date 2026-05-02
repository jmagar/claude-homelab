Prefab UI - FastMCP
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
[Prefab](https://prefab.prefect.io) is in early, active development — breaking changes can occur with any release. FastMCP pins a minimum version of `prefab-ui` for compatibility but does not pin an upper bound. If you are deploying to production, **pin `prefab-ui` to a specific version** in your own dependencies.
[Prefab UI](https://prefab.prefect.io) is the component library behind all FastMCP app features. You describe layouts, charts, tables, and forms in Python, and Prefab compiles them to interactive UIs that render in the host’s conversation.
The simplest way to use it: add `app=True` to a tool and return Prefab components. The host renders an interactive UI instead of text. This works for everything from static charts to reactive dashboards with client-side state — no server round-trips needed.
For apps that need server interaction (forms, search, CRUD), see [FastMCPApp](/apps/interactive-apps) which adds managed tool binding on top of Prefab UI. For LLM-generated UIs, see [Generative UI](/apps/generative).
##
[​
](#getting-started)
Getting Started
Here’s a tool that returns a bar chart:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading
from prefab\_ui.components.charts import BarChart, ChartSeries
from fastmcp import FastMCP
mcp = FastMCP("Dashboard")
@mcp.tool(app=True)
def revenue\_chart(year: int) -\> PrefabApp:
"""Show annual revenue as an interactive bar chart."""
data = [
{"quarter": "Q1", "revenue": 42000},
{"quarter": "Q2", "revenue": 51000},
{"quarter": "Q3", "revenue": 47000},
{"quarter": "Q4", "revenue": 63000},
]
with Column(gap=4, css\_class="p-6") as view:
Heading(f"{year} Revenue")
BarChart(
data=data,
series=[ChartSeries(data\_key="revenue", label="Revenue")],
x\_axis="quarter",
)
return PrefabApp(view=view)
`
```
The `app=True` flag tells FastMCP this tool returns a UI. When a host calls the tool, the user sees an interactive chart instead of a JSON blob. The [Patterns](/apps/patterns) page has more examples.
##
[​
](#layout-and-components)
Layout and Components
Prefab uses Python’s `with` statement to express nesting. Containers like `Column`, `Row`, and `Grid` collect their children automatically:
```
`from prefab\_ui.components import (
Column, Row, Grid, Heading, Text, Muted, Badge,
Card, CardContent, Separator,
)
with Column(gap=4, css\_class="p-6") as view:
Heading("Team Status")
Separator()
with Grid(columns=2, gap=4):
with Card():
with CardContent():
Text("API Gateway", css\_class="font-medium")
Badge("healthy", variant="success")
with Card():
with CardContent():
Text("Cache", css\_class="font-medium")
Badge("degraded", variant="destructive")
`
```
You can also use Python loops to generate components at build time:
```
`services = [
{"name": "API", "status": "healthy", "ok": True},
{"name": "Cache", "status": "degraded", "ok": False},
]
with Grid(columns=2, gap=4):
for svc in services:
with Card():
with CardContent():
Text(svc["name"])
Badge(
svc["status"],
variant="success" if svc["ok"] else "destructive",
)
`
```
Build-time loops produce static content — the data is baked into the component tree at construction time. For dynamic iteration over state that changes at render time, use `ForEach` (covered below).
The full component library — layout containers, data display, charts, forms, overlays — is documented in the [Prefab component reference](https://prefab.prefect.io/docs/components).
##
[​
](#state-and-reactivity)
State and Reactivity
Display tools can be interactive without calling the server. The key is **state** — a client-side key-value store that lives in the browser. Components read from state, actions mutate it, and the UI re-renders automatically.
###
[​
](#declaring-state)
Declaring State
Pass a `state` dict to `PrefabApp` to declare initial state, then use `Rx("key")` to create reactive references:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading, Switch, Alert, If
from prefab\_ui.rx import Rx
from fastmcp import FastMCP
mcp = FastMCP("Flags")
@mcp.tool(app=True)
def feature\_flags() -\> PrefabApp:
"""Toggle feature flags with live preview."""
with Column(gap=4, css\_class="p-6") as view:
Heading("Feature Flags")
Switch(name="dark\_mode", label="Dark Mode")
Switch(name="beta", label="Beta Features")
with If(Rx("dark\_mode")):
Alert(title="Dark mode enabled")
with If(Rx("beta")):
Alert(title="Beta features active", variant="warning")
return PrefabApp(view=view, state={"dark\_mode": False, "beta": False})
`
```
Three things to notice here:
The `state` dict on `PrefabApp` declares the keys and their starting values. `Rx("dark\_mode")` creates a reactive reference that compiles to `{{ dark\_mode }}` in the wire protocol.
Interactive components with a `name` prop automatically bind to state. The `Switch(name="dark\_mode")` syncs its on/off value to the `dark\_mode` state key on every toggle — no event wiring needed.
`If(Rx("dark\_mode"))` shows its children only when the state key is truthy. When the switch flips, the condition re-evaluates instantly in the browser.
###
[​
](#reactive-references-with-rx)
Reactive References with Rx
The `Rx` class is how you reference state in component props:
```
`from prefab\_ui.rx import Rx
count = Rx("count")
`
```
Rx objects support arithmetic, comparisons, and formatting — they compile to expressions the renderer evaluates at render time:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Text, Slider
from prefab\_ui.rx import Rx
from fastmcp import FastMCP
mcp = FastMCP("Calculator")
@mcp.tool(app=True)
def tip\_calculator() -\> PrefabApp:
"""Calculate tip with a slider."""
tip\_pct = Rx("tip\_pct")
bill = Rx("bill")
tip\_amount = tip\_pct / 100 \* bill
total = bill + tip\_amount
with Column(gap=4, css\_class="p-6") as view:
Slider(name="bill", label="Bill Amount", min=0, max=500, step=0.5)
Slider(name="tip\_pct", label="Tip %", min=0, max=50)
Text(f"Tip: {tip\_amount.currency()}")
Text(f"Total: {total.currency()}")
return PrefabApp(view=view, state={"bill": 50.00, "tip\_pct": 18})
`
```
`Rx("tip\_pct") / 100 \* Rx("bill")` builds a compound expression — it doesn’t do the math in Python. The renderer evaluates it live as the sliders move. The `.currency()` pipe formats the result as currency.
####
[​
](#pipes)
Pipes
Rx objects support formatting pipes that transform values at render time:
```
`from prefab\_ui.rx import Rx
price = Rx("price")
ratio = Rx("ratio")
name = Rx("name")
price.currency() # $42.50
price.currency("EUR") # EUR format
ratio.percent() # 85%
name.upper() # ALICE
name.truncate(10) # alice (or truncated if longer)
`
```
Number pipes include `currency`, `percent`, `number`, `compact`, `round`, and `abs`. String pipes include `upper`, `lower`, and `truncate`. See the [Prefab expression docs](https://prefab.prefect.io/docs/concepts/expressions) for the full list.
####
[​
](#conditionals)
Conditionals
The `.then()` method creates ternary expressions:
```
`from prefab\_ui.rx import Rx
connected = Rx("connected")
Badge(
connected.then("Online", "Offline"),
variant=connected.then("success", "destructive"),
)
`
```
###
[​
](#dynamic-iteration-with-foreach)
Dynamic Iteration with ForEach
Python `for` loops generate static content at build time. When you need to iterate over state that can change — a list that grows, items that get filtered — use `ForEach`:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading, ForEach, Row, Text, Badge
from fastmcp import FastMCP
mcp = FastMCP("Directory")
@mcp.tool(app=True)
def team\_list() -\> PrefabApp:
"""Show the current team."""
members = [
{"name": "Alice", "role": "Engineering"},
{"name": "Bob", "role": "Design"},
]
with Column(gap=4, css\_class="p-6") as view:
Heading("Team")
with ForEach("members") as member:
with Row(gap=2, align="center"):
Text(member.name, css\_class="font-medium")
Badge(member.role)
return PrefabApp(view=view, state={"members": members})
`
```
`ForEach("members")` iterates over the `members` state key. The `as member` gives you an Rx proxy scoped to each item, so `member.name` resolves to `{{ $item.name }}` in the wire protocol. If the `members` state changes (e.g., through an action), the list re-renders automatically.
###
[​
](#conditional-rendering)
Conditional Rendering
`If`, `Elif`, and `Else` control what’s visible based on state:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Select, SelectOption, If, Elif, Else, Text
from prefab\_ui.rx import Rx
tier = Rx("tier")
with Column(gap=4) as view:
with Select(name="tier", label="Plan"):
SelectOption("Free", value="free")
SelectOption("Pro", value="pro")
SelectOption("Enterprise", value="enterprise")
with If(tier == "enterprise"):
Text("Full access to all features")
with Elif(tier == "pro"):
Text("Advanced features unlocked")
with Else():
Text("Basic features only")
# Pass state={"tier": "free"} to PrefabApp when returning
`
```
Changes are instant — switching the dropdown re-evaluates the conditions in the browser.
##
[​
](#giving-the-llm-context)
Giving the LLM Context
By default, Prefab sends `"[Rendered Prefab UI]"` as the text content for the LLM. If the model needs to reason about the data, wrap your return in a `ToolResult` with a meaningful summary:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading
from prefab\_ui.components.charts import BarChart, ChartSeries
from fastmcp import FastMCP
from fastmcp.tools import ToolResult
mcp = FastMCP("Sales")
@mcp.tool(app=True)
def sales\_overview(year: int) -\> ToolResult:
"""Show sales data visually and summarize for the model."""
data = get\_sales\_data(year)
total = sum(row["revenue"] for row in data)
with Column(gap=4, css\_class="p-6") as view:
Heading("Sales Overview")
BarChart(data=data, series=[ChartSeries(data\_key="revenue")])
return ToolResult(
content=f"Total revenue for {year}: ${total:,} across {len(data)} quarters",
structured\_content=view,
)
`
```
The user sees the chart. The LLM sees the summary string.
##
[​
](#advanced)
Advanced
Customizing CSP
`app=True` auto-wires the Prefab renderer with default CSP settings. If your app loads external resources — embedding iframes, fetching from APIs, loading scripts — use `PrefabAppConfig` to add the required domains:
```
`from fastmcp.apps import PrefabAppConfig, ResourceCSP
@mcp.tool(app=PrefabAppConfig(
csp=ResourceCSP(frame\_domains=["https://example.com"]),
))
def dashboard\_with\_embed() -\> PrefabApp:
...
`
```
`PrefabAppConfig()` with no arguments is equivalent to `app=True`. It auto-sets the renderer URI and merges the renderer’s CSP with any additional domains you provide.
Type inference
If your return type annotation is a Prefab type — `PrefabApp`, `Component`, or unions containing them — FastMCP enables app rendering automatically, even without `app=True`:
```
`@mcp.tool
def greet(name: str) -\> PrefabApp:
return PrefabApp(view=Heading(f"Hello, {name}!"))
`
```
Explicit `app=True` is recommended for clarity.
Mixing with custom HTML
Prefab tools and [custom HTML tools](/apps/low-level) coexist on the same server:
```
`from fastmcp.apps import AppConfig
@mcp.tool(app=True)
def team\_directory() -\> PrefabApp:
...
@mcp.tool(app=AppConfig(resource\_uri="ui://my-app/map.html"))
def map\_view() -\> str:
...
`
```
##
[​
](#next-steps)
Next Steps
* **[FastMCPApp](/apps/interactive-apps)** — Managed tool binding for apps with heavy server interaction
* **[Patterns](/apps/patterns)** — Charts, tables, dashboards, and other common examples
* **[Development](/apps/development)** — Preview app tools locally with `fastmcp dev apps`
* **[Prefab UI Docs](https://prefab.prefect.io)** — Full component reference, advanced state patterns, and more