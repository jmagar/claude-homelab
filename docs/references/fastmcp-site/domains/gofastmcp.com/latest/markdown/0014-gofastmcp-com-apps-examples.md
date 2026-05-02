Examples - FastMCP
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
Every example below is a working FastMCP server you can run with `fastmcp dev apps` or connect to from any MCP host. The source is in `examples/apps/` in the repository.
[
Sales Dashboard
Metrics, charts, and deal pipeline
](#sales-dashboard)[
System Monitor
Live CPU, memory, disk with auto-refresh
](#system-monitor)[
Quiz
LLM-generated trivia with scoring
](#quiz)[
Interactive Map
Geocoded addresses on Leaflet
](#interactive-map)[
File Upload
Drag-and-drop upload provider
](/apps/providers/file-upload)[
Approval
Human-in-the-loop confirmation
](/apps/providers/approval)[
Choice
Clickable option selection
](/apps/providers/choice)[
Form Input
Pydantic model forms
](/apps/providers/form)[
Generative UI
LLM writes the UI at runtime
](/apps/generative)
##
[​
](#running-examples)
Running Examples
Preview any example in your browser with the dev server:
```
`pip install "fastmcp[apps]"
fastmcp dev apps examples/apps/sales\_dashboard/sales\_dashboard\_server.py
`
```
The dev server opens an interactive browser UI where you can select a tool and provide arguments. In a real deployment, the LLM provides these arguments on the fly based on the conversation. For example, the quiz example works best when connected to an MCP host like Goose or Claude Desktop, where the LLM generates the questions itself.
##
[​
](#standalone-examples)
Standalone Examples
###
[​
](#sales-dashboard)
Sales Dashboard
A full dashboard with KPI metrics, revenue trends, segment breakdown, and a deal pipeline table. Shows what you can build with a single `app=True` tool and Prefab’s chart and data components.
```
`fastmcp dev apps examples/apps/sales\_dashboard/sales\_dashboard\_server.py
`
```
###
[​
](#system-monitor)
System Monitor
Reads live CPU, memory, and disk stats from your machine using `psutil`. Auto-refreshes via `SetInterval` calling a backend tool, with a dropdown to control the refresh rate. The chart accumulates 100 data points over time.
```
`pip install psutil
fastmcp dev apps examples/apps/system\_monitor/system\_monitor\_server.py
`
```
###
[​
](#quiz)
Quiz
The LLM generates trivia questions and passes them to the tool. The user answers via buttons, sees correct/incorrect feedback, and tracks score across questions. Demonstrates multi-turn client-side state with FastMCPApp.
```
`fastmcp dev apps examples/apps/quiz/quiz\_server.py
`
```
###
[​
](#interactive-map)
Interactive Map
Accepts addresses or place names, geocodes them via OpenStreetMap Nominatim (free, no API key), and renders an interactive Leaflet map using Prefab’s `Embed` component with inline HTML. Proves that Prefab apps aren’t limited to built-in components.
```
`fastmcp dev apps examples/apps/map/map\_server.py
`
```
##
[​
](#built-in-providers)
Built-in Providers
These are ready-made capabilities you add with a single `add\_provider()` call.
###
[​
](#file-upload)
[File Upload](/apps/providers/file-upload)
Drag-and-drop file upload. The user drops files, clicks Upload, and the server stores them. The LLM can list and read uploaded files through model-visible tools.
```
`from fastmcp.apps.file\_upload import FileUpload
mcp.add\_provider(FileUpload())
`
```
###
[​
](#approval)
[Approval](/apps/providers/approval)
Human-in-the-loop confirmation. The LLM presents what it’s about to do, the user clicks Approve or Reject, and the decision flows back as a message.
```
`from fastmcp.apps.approval import Approval
mcp.add\_provider(Approval())
`
```
###
[​
](#choice)
[Choice](/apps/providers/choice)
Present clickable options instead of asking users to type. Clean structured input without parsing free text.
```
`from fastmcp.apps.choice import Choice
mcp.add\_provider(Choice())
`
```
###
[​
](#form-input)
[Form Input](/apps/providers/form)
Generate a validated form from a Pydantic model. Submission is validated against the model before being returned.
```
`from fastmcp.apps.form import FormInput
mcp.add\_provider(FormInput(model=MyModel))
`
```
###
[​
](#generative-ui)
[Generative UI](/apps/providers/generative)
The LLM writes Prefab Python code at runtime and the result renders as a streaming interactive UI. Tailored visualizations for any data. See the [full guide](/apps/generative) for details.
```
`from fastmcp.apps.generative import GenerativeUI
mcp.add\_provider(GenerativeUI())
`
```