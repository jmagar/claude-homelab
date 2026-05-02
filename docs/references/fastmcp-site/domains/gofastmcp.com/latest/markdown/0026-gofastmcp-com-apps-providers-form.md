Form Input - FastMCP
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
`FormInput` generates a validated form from a Pydantic model. The user fills it out, and the submission is validated against the model before being returned. Structured elicitation that can’t be hallucinated.
```
`from typing import Literal
from pydantic import BaseModel, Field
from fastmcp import FastMCP
from fastmcp.apps.form import FormInput
class BugReport(BaseModel):
title: str = Field(description="Brief summary")
severity: Literal["low", "medium", "high", "critical"]
description: str = Field(
description="Detailed description",
json\_schema\_extra={"ui": {"type": "textarea"}},
)
mcp = FastMCP("My Server")
mcp.add\_provider(FormInput(model=BugReport))
`
```
This registers two tools:
|Tool|Visibility|Purpose|
|`collect\_bugreport`|Model|Opens the form UI|
|`submit\_form`|App only|Validates and processes the submission|
The tool name is derived from the model class name, lowercased: `collect\_{modelname}`. So `BugReport` becomes `collect\_bugreport`, `ShippingAddress` becomes `collect\_shippingaddress`. Use `tool\_name` to override if needed. The LLM calls it with a prompt explaining what it needs, and the user gets a form with fields matching the model.
##
[​
](#field-mapping)
Field Mapping
`FormInput` uses Prefab’s `Form.from\_model()`, which maps Pydantic types to form components:
|Python type|Form component|
|`str`|Text input|
|`int`, `float`|Number input|
|`bool`|Checkbox|
|`datetime.date`|Date picker|
|`Literal[...]`|Select dropdown|
|`SecretStr`|Password input|
Use `Field()` metadata to control labels (`title`), placeholders (`description`), and validation (`min\_length`, `max\_length`, `ge`, `le`). Use `json\_schema\_extra={"ui": {"type": "textarea"}}` for multiline text.
##
[​
](#callback)
Callback
By default, the validated model is returned as JSON. Provide an `on\_submit` callback to process the data server-side:
```
`def save\_report(report: BugReport) -\> str:
db.insert(report.model\_dump())
return f"Bug #{db.last\_id} filed: {report.title}"
mcp.add\_provider(FormInput(model=BugReport, on\_submit=save\_report))
`
```
The callback receives a validated model instance and returns a string that becomes the tool result.
##
[​
](#configuration)
Configuration
```
`FormInput(
model=BugReport, # Required: the Pydantic model
name="BugTracker", # App name (default: model name)
title="File a Bug", # Card heading (default: model name)
tool\_name="file\_bug", # Tool name (default: collect\_{model})
submit\_text="Submit Report", # Button label (default: "Submit")
on\_submit=save\_report, # Optional callback
send\_message=True, # Push result as a chat message
)
`
```
Set `send\_message=True` to push the result back into the conversation via `SendMessage`, triggering the LLM’s next turn. Without it, the result is just the tool return value.
##
[​
](#multiple-forms)
Multiple Forms
Add multiple providers for different models — each gets its own tool:
```
`mcp = FastMCP(
"My Server",
providers=[
FormInput(model=ShippingAddress),
FormInput(model=BugReport),
FormInput(model=ContactInfo),
],
)
`
```