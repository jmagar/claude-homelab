Patterns - FastMCP
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
Each pattern below is a complete, copy-pasteable tool. They’re organized by what you’re building — pick the one closest to your use case, paste it, and adapt.
For the full set of available components — layout containers, form controls, overlays, and more — see the [Prefab component reference](https://prefab.prefect.io/docs/components).
##
[​
](#charts)
Charts
Prefab includes [bar, line, area, pie, radar, and radial charts](https://prefab.prefect.io/docs/components/charts). They render client-side with tooltips, legends, and responsive sizing.
###
[​
](#bar-chart)
Bar Chart
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading
from prefab\_ui.components.charts import BarChart, ChartSeries
from fastmcp import FastMCP
mcp = FastMCP("Charts")
@mcp.tool(app=True)
def quarterly\_revenue(year: int) -\> PrefabApp:
"""Show quarterly revenue as a bar chart."""
data = [
{"quarter": "Q1", "revenue": 42000, "costs": 28000},
{"quarter": "Q2", "revenue": 51000, "costs": 31000},
{"quarter": "Q3", "revenue": 47000, "costs": 29000},
{"quarter": "Q4", "revenue": 63000, "costs": 35000},
]
with Column(gap=4, css\_class="p-6") as view:
Heading(f"{year} Revenue vs Costs")
BarChart(
data=data,
series=[
ChartSeries(data\_key="revenue", label="Revenue"),
ChartSeries(data\_key="costs", label="Costs"),
],
x\_axis="quarter",
show\_legend=True,
)
return PrefabApp(view=view)
`
```
Multiple `ChartSeries` entries plot different data keys. Add `stacked=True` to stack bars, or `horizontal=True` to flip the axes.
###
[​
](#area-chart)
Area Chart
`LineChart` and `AreaChart` share the same API as `BarChart`, with `curve` for interpolation and `show\_dots` for data points:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading
from prefab\_ui.components.charts import AreaChart, ChartSeries
from fastmcp import FastMCP
mcp = FastMCP("Charts")
@mcp.tool(app=True)
def usage\_trend() -\> PrefabApp:
"""Show API usage over time."""
data = [
{"date": "Feb 1", "requests": 1200},
{"date": "Feb 2", "requests": 1350},
{"date": "Feb 3", "requests": 980},
{"date": "Feb 4", "requests": 1500},
{"date": "Feb 5", "requests": 1420},
]
with Column(gap=4, css\_class="p-6") as view:
Heading("API Usage")
AreaChart(
data=data,
series=[ChartSeries(data\_key="requests", label="Requests")],
x\_axis="date",
curve="smooth",
height=250,
)
return PrefabApp(view=view)
`
```
###
[​
](#pie-and-donut-charts)
Pie and Donut Charts
`PieChart` uses `data\_key` (the numeric value) and `name\_key` (the label). Set `inner\_radius` for a donut:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading
from prefab\_ui.components.charts import PieChart
from fastmcp import FastMCP
mcp = FastMCP("Charts")
@mcp.tool(app=True)
def ticket\_breakdown() -\> PrefabApp:
"""Show open tickets by category."""
data = [
{"category": "Bug", "count": 23},
{"category": "Feature", "count": 15},
{"category": "Docs", "count": 8},
{"category": "Infra", "count": 12},
]
with Column(gap=4, css\_class="p-6") as view:
Heading("Open Tickets")
PieChart(
data=data,
data\_key="count",
name\_key="category",
show\_legend=True,
inner\_radius=60,
)
return PrefabApp(view=view)
`
```
##
[​
](#data-tables)
Data Tables
[DataTable](https://prefab.prefect.io/docs/components/data-display/data-table) provides sortable columns, full-text search, and pagination — all client-side:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading, DataTable, DataTableColumn
from fastmcp import FastMCP
mcp = FastMCP("Directory")
@mcp.tool(app=True)
def employee\_directory() -\> PrefabApp:
"""Show a searchable, sortable employee directory."""
employees = [
{"name": "Alice Chen", "department": "Engineering", "role": "Staff Engineer", "location": "SF"},
{"name": "Bob Martinez", "department": "Design", "role": "Lead Designer", "location": "NYC"},
{"name": "Carol Johnson", "department": "Engineering", "role": "Senior Engineer", "location": "London"},
{"name": "David Kim", "department": "Product", "role": "Product Manager", "location": "SF"},
{"name": "Eva Müller", "department": "Engineering", "role": "Engineer", "location": "Berlin"},
]
with Column(gap=4, css\_class="p-6") as view:
Heading("Employee Directory")
DataTable(
columns=[
DataTableColumn(key="name", header="Name", sortable=True),
DataTableColumn(key="department", header="Department", sortable=True),
DataTableColumn(key="role", header="Role"),
DataTableColumn(key="location", header="Office", sortable=True),
],
rows=employees,
search=True,
paginated=True,
page\_size=15,
)
return PrefabApp(view=view)
`
```
##
[​
](#status-displays)
Status Displays
Cards, badges, progress bars, and grids combine naturally for dashboards:
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import (
Column, Row, Grid, Heading, Text, Muted, Badge,
Card, CardContent, Progress, Separator,
)
from fastmcp import FastMCP
mcp = FastMCP("Monitoring")
@mcp.tool(app=True)
def system\_status() -\> PrefabApp:
"""Show current system health."""
services = [
{"name": "API Gateway", "status": "healthy", "ok": True, "latency\_ms": 12, "uptime\_pct": 99.9},
{"name": "Database", "status": "healthy", "ok": True, "latency\_ms": 3, "uptime\_pct": 99.99},
{"name": "Cache", "status": "degraded", "ok": False, "latency\_ms": 45, "uptime\_pct": 98.2},
{"name": "Queue", "status": "healthy", "ok": True, "latency\_ms": 8, "uptime\_pct": 99.8},
]
all\_ok = all(s["ok"] for s in services)
with Column(gap=4, css\_class="p-6") as view:
with Row(gap=2, align="center"):
Heading("System Status")
Badge(
"All Healthy" if all\_ok else "Degraded",
variant="success" if all\_ok else "destructive",
)
Separator()
with Grid(columns=2, gap=4):
for svc in services:
with Card():
with CardContent():
with Row(gap=2, align="center"):
Text(svc["name"], css\_class="font-medium")
Badge(
svc["status"],
variant="success" if svc["ok"] else "destructive",
)
Muted(f"Response: {svc['latency\_ms']}ms")
Progress(value=svc["uptime\_pct"])
return PrefabApp(view=view)
`
```
##
[​
](#reactive-displays)
Reactive Displays
These patterns use state and `Rx()` for client-side interactivity — no server calls needed.
###
[​
](#feature-toggles)
Feature Toggles
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import Column, Heading, Switch, Alert, If, Separator
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
Separator()
with If(Rx("dark\_mode")):
Alert(title="Dark mode enabled", description="UI will use dark theme.")
with If(Rx("beta")):
Alert(
title="Beta features active",
description="Experimental features are now visible.",
variant="warning",
)
return PrefabApp(view=view, state={"dark\_mode": False, "beta": False})
`
```
###
[​
](#tabs)
Tabs
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import (
Column, Heading, Text, Muted, Badge, Row,
DataTable, DataTableColumn, Tabs, Tab, ForEach,
)
from fastmcp import FastMCP
mcp = FastMCP("Projects")
@mcp.tool(app=True)
def project\_overview() -\> PrefabApp:
"""Show project details organized in tabs."""
project = {
"name": "FastMCP v3",
"description": "Next generation MCP framework with Apps support.",
"status": "Active",
"members": [
{"name": "Alice Chen", "role": "Lead"},
{"name": "Bob Martinez", "role": "Design"},
],
"activity": [
{"timestamp": "2 hours ago", "message": "Merged PR #342"},
{"timestamp": "1 day ago", "message": "Released v3.0.1"},
],
}
with Column(gap=4, css\_class="p-6") as view:
Heading(project["name"])
with Tabs():
with Tab("Overview"):
Text(project["description"])
with Row(gap=4):
Badge(project["status"])
with Tab("Members"):
DataTable(
columns=[
DataTableColumn(key="name", header="Name", sortable=True),
DataTableColumn(key="role", header="Role"),
],
rows=project["members"],
)
with Tab("Activity"):
with ForEach("activity") as item:
with Row(gap=2):
Muted(item.timestamp)
Text(item.message)
return PrefabApp(view=view, state={"activity": project["activity"]})
`
```
###
[​
](#accordion)
Accordion
```
`from prefab\_ui.app import PrefabApp
from prefab\_ui.components import (
Column, Heading, Row, Text, Badge, Progress,
Accordion, AccordionItem,
)
from fastmcp import FastMCP
mcp = FastMCP("API Monitor")
@mcp.tool(app=True)
def api\_health() -\> PrefabApp:
"""Show health details for each API endpoint."""
endpoints = [
{"path": "/api/users", "status": 200, "healthy": True, "avg\_ms": 45, "p99\_ms": 120, "uptime\_pct": 99.9},
{"path": "/api/orders", "status": 200, "healthy": True, "avg\_ms": 82, "p99\_ms": 250, "uptime\_pct": 99.7},
{"path": "/api/search", "status": 200, "healthy": True, "avg\_ms": 150, "p99\_ms": 500, "uptime\_pct": 99.5},
{"path": "/api/webhooks", "status": 503, "healthy": False, "avg\_ms": 2000, "p99\_ms": 5000, "uptime\_pct": 95.1},
]
with Column(gap=4, css\_class="p-6") as view:
Heading("API Health")
with Accordion(multiple=True):
for ep in endpoints:
with AccordionItem(ep["path"]):
with Row(gap=4):
Badge(
f"{ep['status']}",
variant="success" if ep["healthy"] else "destructive",
)
Text(f"Avg: {ep['avg\_ms']}ms")
Text(f"P99: {ep['p99\_ms']}ms")
Progress(value=ep["uptime\_pct"])
return PrefabApp(view=view)
`
```
##
[​
](#interactive-patterns)
Interactive Patterns
These patterns call server tools. For context on `FastMCPApp`, `@app.tool()`, and `CallTool`, see [FastMCPApp](/apps/interactive-apps).
###
[​
](#contact-form)
Contact Form
```
`from prefab\_ui.actions import SetState, ShowToast
from prefab\_ui.actions.mcp import CallTool
from prefab\_ui.app import PrefabApp
from prefab\_ui.components import (
Badge, Button, Column, ForEach, Form, Heading,
Input, Muted, Row, Select, SelectOption, Separator, Text, Textarea,
)
from prefab\_ui.rx import RESULT
from fastmcp import FastMCP, FastMCPApp
app = FastMCPApp("Contacts")
contacts\_db: list[dict] = [
{"name": "Zaphod Beeblebrox", "email": "zaphod@galaxy.gov", "category": "Partner"},
]
@app.tool()
def save\_contact(
name: str, email: str, category: str = "Other", notes: str = "",
) -\> list[dict]:
"""Save a new contact and return the updated list."""
contacts\_db.append({"name": name, "email": email, "category": category})
return list(contacts\_db)
@app.ui()
def contact\_form() -\> PrefabApp:
"""Contact list with an add form."""
with Column(gap=6, css\_class="p-6") as view:
Heading("Contacts")
with ForEach("contacts") as contact:
with Row(gap=2, align="center"):
Text(contact.name, css\_class="font-medium")
Muted(contact.email)
Badge(contact.category)
Separator()
with Form(
on\_submit=CallTool(
"save\_contact",
on\_success=[
SetState("contacts", RESULT),
ShowToast("Contact saved!", variant="success"),
],
on\_error=ShowToast("Failed to save", variant="error"),
)
):
Input(name="name", label="Full Name", required=True)
Input(name="email", label="Email", input\_type="email", required=True)
with Select(name="category", label="Category"):
SelectOption("Customer", value="Customer")
SelectOption("Vendor", value="Vendor")
SelectOption("Partner", value="Partner")
SelectOption("Other", value="Other")
Textarea(name="notes", label="Notes", placeholder="Optional notes...")
Button("Save Contact")
return PrefabApp(view=view, state={"contacts": list(contacts\_db)})
mcp = FastMCP("Server", providers=[app])
`
```
##
[​
](#next-steps)
Next Steps
* **[FastMCPApp](/apps/interactive-apps)** — Managed tool binding for server-connected UIs
* **[Development](/apps/development)** — Preview app tools locally with `fastmcp dev apps`
* **[Prefab UI Docs](https://prefab.prefect.io)** — Full component reference, layout guides, and more