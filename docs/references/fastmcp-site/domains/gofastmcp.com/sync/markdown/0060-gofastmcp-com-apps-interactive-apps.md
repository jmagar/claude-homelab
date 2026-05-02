FastMCPApp - FastMCP
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
[Prefab](https://prefab.prefect.io) is in early, active development — its API changes frequently and breaking changes can occur with any release. Always pin `prefab-ui` to a specific version in your dependencies.
Any [Prefab app](/apps/prefab) can call server tools — there’s nothing stopping you from using `CallTool("tool\_name")` in a regular `@mcp.tool(app=True)`. But once you have multiple backend tools, the management overhead adds up: Which tools should the model see vs. only the UI? What happens to string-based tool references when servers are composed under namespaces? How do you keep things wired correctly as the app grows?
`FastMCPApp` is a class that solves these problems. It gives you two decorators that work together:
* **`@app.ui()`** — entry-point tools the model calls to open the app. These return a Prefab UI.
* **`@app.tool()`** — backend tools the UI calls via `CallTool`. These do the work.
Backend tools get globally stable identifiers that survive namespacing. Visibility is managed automatically — the model sees entry points, the UI sees backends. And `CallTool` accepts function references instead of strings, so references are refactorable and composition-safe.
##
[​
](#your-first-interactive-app)
Your First Interactive App
Here’s a minimal app with a form that saves data:
```
`from prefab\_ui.actions import SetState, ShowToast
from prefab\_ui.actions.mcp import CallTool
from prefab\_ui.app import PrefabApp
from prefab\_ui.components import (
Badge, Button, Column, ForEach, Form,
Heading, Input, Row, Separator, Text,
)
from prefab\_ui.rx import RESULT
from fastmcp import FastMCP, FastMCPApp
app = FastMCPApp("Notes")
notes\_db: list[dict] = []
@app.tool()
def add\_note(title: str, body: str) -\> list[dict]:
"""Save a note and return all notes."""
notes\_db.append({"title": title, "body": body})
return list(notes\_db)
@app.ui()
def notes\_app() -\> PrefabApp:
"""Open the notes app."""
with Column(gap=6, css\_class="p-6") as view:
Heading("Notes")
with ForEach("notes") as note:
with Row(gap=2, align="center"):
Text(note.title, css\_class="font-semibold")
Badge(note.body)
Separator()
with Form(
on\_submit=CallTool(
"add\_note",
on\_success=[
SetState("notes", RESULT),
ShowToast("Note saved!", variant="success"),
],
on\_error=ShowToast("Failed to save", variant="error"),
)
):
Input(name="title", label="Title", required=True)
Input(name="body", label="Body", required=True)
Button("Add Note")
return PrefabApp(view=view, state={"notes": list(notes\_db)})
mcp = FastMCP("Notes Server", providers=[app])
`
```
When the model calls `notes\_app`, the user sees a form. Submitting it calls `add\_note` on the server, updates the state with the result, and shows a toast — all without leaving the UI.
Let’s break down the key concepts.
##
[​
](#entry-points-@app-ui)
Entry Points: @app.ui()
Entry points are what the model sees and calls to open your app. They return a Prefab UI, just like display tools:
```
`@app.ui()
def dashboard() -\> PrefabApp:
"""The model calls this to open the dashboard."""
with Column(gap=4, css\_class="p-6") as view:
Heading("Dashboard")
# ... build UI ...
return PrefabApp(view=view)
`
```
Entry points default to `visibility=["model"]` — they show up in the tool list for the LLM but aren’t callable from within the app UI. They support the same options as `@mcp.tool`: `name`, `description`, `title`, `tags`, `icons`, `auth`, and `timeout`.
```
`@app.ui(title="Contact Manager", description="Open the contact management interface")
def contact\_manager() -\> PrefabApp:
...
`
```
##
[​
](#backend-tools-@app-tool)
Backend Tools: @app.tool()
Backend tools do the work. The UI calls them via `CallTool`; they run on the server and return data:
```
`@app.tool()
def save\_contact(name: str, email: str) -\> list[dict]:
"""Save a contact and return the updated list."""
db.append({"name": name, "email": email})
return list(db)
`
```
By default, backend tools are only visible to the app UI (`visibility=["app"]`). The model doesn’t see them in the tool list. If you want a tool callable by both the model and the UI, pass `model=True`:
```
`@app.tool(model=True)
def list\_contacts() -\> list[dict]:
"""Both the model and the UI can call this."""
return list(db)
`
```
Backend tools support `name`, `description`, `auth`, and `timeout`:
```
`@app.tool(description="Search contacts by name or email", timeout=10.0)
def search(query: str) -\> list[dict]:
...
`
```
##
[​
](#connecting-ui-to-backend-calltool)
Connecting UI to Backend: CallTool
`CallTool` is the bridge between the UI and the server. Pass the name of a backend tool registered with `@app.tool()`:
```
`from prefab\_ui.actions.mcp import CallTool
# Reference a backend tool by name
CallTool("save\_contact", arguments={"name": "Alice", "email": "alice@example.com"})
# Arguments can reference state with Rx
from prefab\_ui.rx import STATE
CallTool("search", arguments={"query": STATE.search\_term})
`
```
FastMCPApp resolves the name to the tool’s stable global key automatically, so `CallTool("save\_contact")` keeps working even when the server is mounted under a namespace.
You can also pass the function directly — `CallTool(save\_contact)` — which can be convenient when the tool is defined in the same file. Both forms resolve identically.
###
[​
](#handling-results)
Handling Results
Server calls are asynchronous. Use `on\_success` and `on\_error` callbacks to handle outcomes:
```
`from prefab\_ui.actions import SetState, ShowToast
from prefab\_ui.rx import RESULT
CallTool(
"save\_contact",
on\_success=[
SetState("contacts", RESULT),
ShowToast("Saved!", variant="success"),
],
on\_error=ShowToast("Something went wrong", variant="error"),
)
`
```
`RESULT` is a reactive reference to the value the tool returned — available inside `on\_success` callbacks. Similarly, `ERROR` (from `prefab\_ui.rx`) is available inside `on\_error`.
Callbacks can be a single action or a list of actions. They execute in order, and an error in any action short-circuits the rest.
###
[​
](#result_key-shorthand)
result\_key Shorthand
When a tool returns data that should replace a state key, `result\_key` is a convenient shorthand for `on\_success=SetState(key, RESULT)`:
```
`CallTool("list\_contacts", result\_key="contacts")
# equivalent to:
CallTool(
"list\_contacts",
on\_success=SetState("contacts", RESULT),
)
`
```
##
[​
](#actions)
Actions
`CallTool` is one of several actions available in Prefab. Actions are events attached to component handlers like `on\_click`, `on\_submit`, and `on\_change`.
###
[​
](#client-actions)
Client Actions
These run instantly in the browser — no server round-trip:
```
`from prefab\_ui.actions import SetState, ToggleState, AppendState, PopState, ShowToast
# Set a value
SetState("count", 42)
# Toggle a boolean
ToggleState("expanded")
# Append to a list
AppendState("items", {"name": "New Item"})
# Remove by index
PopState("items", 0)
# Show a notification
ShowToast("Done!", variant="success")
`
```
###
[​
](#chaining-actions)
Chaining Actions
Pass a list to execute multiple actions in sequence:
```
`from prefab\_ui.components import Button
from prefab\_ui.actions import SetState, ShowToast
Button(
"Reset",
on\_click=[
SetState("query", ""),
SetState("results", []),
ShowToast("Cleared", variant="default"),
],
)
`
```
###
[​
](#loading-states)
Loading States
A common pattern: show a loading indicator while a server call is in flight.
```
`from prefab\_ui.actions import SetState, ShowToast
from prefab\_ui.actions.mcp import CallTool
from prefab\_ui.components import Button
from prefab\_ui.rx import RESULT, Rx
saving = Rx("saving")
Button(
saving.then("Saving...", "Save"),
disabled=saving,
on\_click=[
SetState("saving", True),
CallTool(
"save\_data",
on\_success=[
SetState("saving", False),
SetState("result", RESULT),
ShowToast("Saved!", variant="success"),
],
on\_error=[
SetState("saving", False),
ShowToast("Failed", variant="error"),
],
),
],
)
# Pass state={"saving": False} to PrefabApp when returning
`
```
##
[​
](#forms)
Forms
Forms are the most common way to collect input and send it to the server. When a form submits, all named input values are gathered and passed as arguments to the `CallTool` action.
###
[​
](#manual-forms)
Manual Forms
Build forms with individual input components:
```
`from prefab\_ui.components import Form, Input, Select, SelectOption, Textarea, Button
from prefab\_ui.actions.mcp import CallTool
from prefab\_ui.actions import ShowToast
with Form(
on\_submit=CallTool(
"create\_ticket",
on\_success=ShowToast("Ticket created!", variant="success"),
)
):
Input(name="title", label="Title", required=True)
with Select(name="priority", label="Priority"):
SelectOption("Low", value="low")
SelectOption("Medium", value="medium")
SelectOption("High", value="high")
SelectOption("Critical", value="critical")
Textarea(name="description", label="Description")
Button("Create Ticket")
`
```
When submitted, the CallTool receives `{"title": "...", "priority": "...", "description": "..."}` as arguments to `create\_ticket`.
###
[​
](#pydantic-model-forms)
Pydantic Model Forms
For structured data, `Form.from\_model()` generates the entire form from a Pydantic model — inputs, labels, and submit wiring:
```
`from typing import Literal
from pydantic import BaseModel, Field
from prefab\_ui.components import Column, Heading, Form
from prefab\_ui.actions.mcp import CallTool
from prefab\_ui.actions import SetState, ShowToast
from prefab\_ui.app import PrefabApp
from prefab\_ui.rx import RESULT
class BugReport(BaseModel):
title: str = Field(title="Bug Title")
severity: Literal["low", "medium", "high", "critical"] = Field(
title="Severity", default="medium"
)
description: str = Field(title="Description")
@app.ui()
def report\_bug() -\> PrefabApp:
"""File a bug report."""
with Column(gap=4, css\_class="p-6") as view:
Heading("Report a Bug")
Form.from\_model(
BugReport,
on\_submit=CallTool(
"create\_bug",
on\_success=ShowToast("Bug filed!", variant="success"),
on\_error=ShowToast("Failed to submit", variant="error"),
),
)
return PrefabApp(view=view)
@app.tool()
def create\_bug(data: BugReport) -\> str:
"""Create a bug report."""
# save to database...
return f"Created: {data.title}"
`
```
`str` fields become text inputs, `Literal` becomes a select dropdown, `bool` becomes a checkbox. Field titles and defaults are respected.
##
[​
](#composition-and-namespacing)
Composition and Namespacing
The reason `FastMCPApp` exists — and why you’d use it instead of plain `@mcp.tool(app=True)` with `CallTool("tool\_name")` — is composition safety.
When you mount a server under a namespace, tool names get prefixed:
```
`from fastmcp import FastMCP
platform = FastMCP("Platform")
platform.mount("contacts", contacts\_server)
# "save\_contact" becomes "contacts\_save\_contact"
`
```
If your UI used `CallTool("save\_contact")`, it would break — the tool is now named `contacts\_save\_contact`. But `CallTool(save\_contact)` with a function reference resolves to a globally stable key (like `save\_contact-a1b2c3d4`) that bypasses the namespace entirely.
This is why `FastMCPApp` assigns global keys to backend tools, and why `CallTool` accepts function references. Your app works the same whether it’s running standalone or mounted inside a larger platform.
###
[​
](#mounting-an-app)
Mounting an App
`FastMCPApp` is a Provider. Add it to a server with `providers=` or `add\_provider`:
```
`from fastmcp import FastMCP, FastMCPApp
app = FastMCPApp("Contacts")
@app.ui()
def contact\_manager() -\> PrefabApp:
...
@app.tool()
def save\_contact(name: str, email: str) -\> dict:
...
# Option 1: providers list
mcp = FastMCP("Platform", providers=[app])
# Option 2: add\_provider
mcp = FastMCP("Platform")
mcp.add\_provider(app)
`
```
Multiple apps can coexist on the same server:
```
`mcp = FastMCP("Platform", providers=[contacts\_app, inventory\_app, billing\_app])
`
```
Each app’s backend tools have their own global keys, so there’s no collision even if two apps have a tool named `save`.
###
[​
](#running-standalone)
Running Standalone
For development, `FastMCPApp` has a convenience `run()` method that wraps itself in a temporary `FastMCP` server:
```
`app = FastMCPApp("Contacts")
# ... register tools ...
if \_\_name\_\_ == "\_\_main\_\_":
app.run()
`
```
##
[​
](#complete-example-contact-manager)
Complete Example: Contact Manager
This pulls together everything — entry points, backend tools, callable references, forms (both manual and Pydantic), state management, and actions:
```
`from \_\_future\_\_ import annotations
from typing import Literal
from prefab\_ui.actions import SetState, ShowToast
from prefab\_ui.actions.mcp import CallTool
from prefab\_ui.app import PrefabApp
from prefab\_ui.components import (
Badge, Button, Column, ForEach, Form,
Heading, Input, Muted, Row, Separator, Text,
)
from prefab\_ui.rx import RESULT, Rx
from pydantic import BaseModel, Field
from fastmcp import FastMCP, FastMCPApp
# Data
contacts\_db: list[dict] = [
{"name": "Arthur Dent", "email": "arthur@earth.com", "category": "Customer"},
{"name": "Ford Prefect", "email": "ford@betelgeuse.org", "category": "Partner"},
]
class ContactModel(BaseModel):
name: str = Field(title="Full Name", min\_length=1)
email: str = Field(title="Email")
category: Literal["Customer", "Vendor", "Partner", "Other"] = "Other"
# App
app = FastMCPApp("Contacts")
@app.tool()
def save\_contact(data: ContactModel) -\> list[dict]:
"""Save a new contact and return the updated list."""
contacts\_db.append(data.model\_dump())
return list(contacts\_db)
@app.tool()
def search\_contacts(query: str) -\> list[dict]:
"""Filter contacts by name or email."""
q = query.lower()
return [
c for c in contacts\_db
if q in c["name"].lower() or q in c["email"].lower()
]
@app.tool(model=True)
def list\_contacts() -\> list[dict]:
"""Return all contacts. Visible to both the model and the UI."""
return list(contacts\_db)
@app.ui()
def contact\_manager() -\> PrefabApp:
"""Open the contact manager."""
with Column(gap=6, css\_class="p-6") as view:
Heading("Contacts")
with ForEach("contacts") as contact:
with Row(gap=2, align="center"):
Text(contact.name, css\_class="font-medium")
Muted(contact.email)
Badge(contact.category)
Separator()
Heading("Add Contact", level=3)
Form.from\_model(
ContactModel,
on\_submit=CallTool(
"save\_contact",
on\_success=[
SetState("contacts", RESULT),
ShowToast("Contact saved!", variant="success"),
],
on\_error=ShowToast("Failed to save", variant="error"),
),
)
Separator()
Heading("Search", level=3)
with Form(
on\_submit=CallTool(
"search\_contacts",
arguments={"query": Rx("query")},
on\_success=SetState("contacts", RESULT),
)
):
Input(name="query", placeholder="Search by name or email...")
Button("Search")
return PrefabApp(view=view, state={"contacts": list(contacts\_db)})
mcp = FastMCP("Contacts Server", providers=[app])
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
See all 104 lines
This example is also available as a runnable server at `examples/apps/contacts/contacts\_server.py`.
##
[​
](#next-steps)
Next Steps
* **[Prefab Apps](/apps/prefab)** — Components, state, and reactive displays (the building blocks)
* **[Patterns](/apps/patterns)** — Copy-paste examples for common UIs
* **[Development](/apps/development)** — Preview and test app tools locally
* **[Prefab UI Docs](https://prefab.prefect.io)** — Full component reference and advanced patterns