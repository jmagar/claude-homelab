Custom HTML Apps - FastMCP
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
* [
Development
NEW
](/apps/development)
* [
Architecture
NEW
](/apps/architecture)
* [
Custom HTML
NEW
](/apps/low-level)
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
The [MCP Apps extension](https://modelcontextprotocol.io/docs/extensions/apps) is an open protocol that lets tools return interactive UIs — an HTML page rendered in a sandboxed iframe inside the host client. [Prefab UI](/apps/prefab) builds on this protocol so you never have to think about it, but when you need full control — custom rendering, a specific JavaScript framework, maps, 3D, video — you can use the MCP Apps extension directly.
This page covers how to write custom HTML apps and wire them up in FastMCP. You’ll be working with the [`@modelcontextprotocol/ext-apps`](https://github.com/modelcontextprotocol/ext-apps) JavaScript SDK for host communication, and FastMCP’s `AppConfig` for resource and CSP management.
##
[​
](#how-it-works)
How It Works
An MCP App has two parts:
1. A **tool** that does the work and returns data
2. A **`ui://` resource** containing the HTML that renders that data
The tool declares which resource to use via `AppConfig`. When the host calls the tool, it also fetches the linked resource, renders it in a sandboxed iframe, and pushes the tool result into the app via `postMessage`. The app can also call tools back, enabling interactive workflows.
```
`import json
from fastmcp import FastMCP
from fastmcp.apps import AppConfig, ResourceCSP
mcp = FastMCP("My App Server")
# The tool does the work
@mcp.tool(app=AppConfig(resource\_uri="ui://my-app/view.html"))
def generate\_chart(data: list[float]) -\> str:
return json.dumps({"values": data})
# The resource provides the UI
@mcp.resource("ui://my-app/view.html")
def chart\_view() -\> str:
return "\<html\>...\</html\>"
`
```
##
[​
](#appconfig)
AppConfig
`AppConfig` controls how a tool or resource participates in the Apps extension. Import it from `fastmcp.server.apps`:
```
`from fastmcp.apps import AppConfig
`
```
On **tools**, you’ll typically set `resource\_uri` to point to the UI resource:
```
`@mcp.tool(app=AppConfig(resource\_uri="ui://my-app/view.html"))
def my\_tool() -\> str:
return "result"
`
```
You can also pass a raw dict with camelCase keys, matching the wire format:
```
`@mcp.tool(app={"resourceUri": "ui://my-app/view.html"})
def my\_tool() -\> str:
return "result"
`
```
###
[​
](#tool-visibility)
Tool Visibility
The `visibility` field controls where a tool appears:
* `["model"]` — visible to the LLM (the default behavior)
* `["app"]` — only callable from within the app UI, hidden from the LLM
* `["model", "app"]` — both
This is useful when you have tools that only make sense as part of the app’s interactive flow, not as standalone LLM actions.
```
`@mcp.tool(
app=AppConfig(
resource\_uri="ui://my-app/view.html",
visibility=["app"],
)
)
def refresh\_data() -\> str:
"""Only callable from the app UI, not by the LLM."""
return fetch\_latest()
`
```
###
[​
](#appconfig-fields)
AppConfig Fields
|Field|Type|Description|
|`resource\_uri`|`str`|URI of the UI resource. Tools only.|
|`visibility`|`list[str]`|Where the tool appears: `"model"`, `"app"`, or both. Tools only.|
|`csp`|`ResourceCSP`|Content Security Policy for the iframe.|
|`permissions`|`ResourcePermissions`|Iframe sandbox permissions.|
|`domain`|`str`|Stable sandbox origin for the iframe.|
|`prefers\_border`|`bool`|Whether the UI prefers a visible border.|
On **resources**, `resource\_uri` and `visibility` must not be set — the resource *is* the UI. Use `AppConfig` on resources only for `csp`, `permissions`, and other display settings.
##
[​
](#ui-resources)
UI Resources
Resources using the `ui://` scheme are automatically served with the MIME type `text/html;profile=mcp-app`. You don’t need to set this manually.
```
`@mcp.resource("ui://my-app/view.html")
def my\_view() -\> str:
return "\<html\>...\</html\>"
`
```
The HTML can be anything — a full single-page app, a simple display, or a complex interactive tool. The host renders it in a sandboxed iframe and establishes a `postMessage` channel for communication.
###
[​
](#writing-the-app-html)
Writing the App HTML
Your HTML app communicates with the host using the [`@modelcontextprotocol/ext-apps`](https://github.com/modelcontextprotocol/ext-apps) JavaScript SDK. The simplest approach is to load it from a CDN:
```
`\<script type="module"\>
import { App } from "https://unpkg.com/@modelcontextprotocol/ext-apps@0.4.0/app-with-deps";
const app = new App({ name: "My App", version: "1.0.0" });
// Receive tool results pushed by the host
app.ontoolresult = ({ content }) =\> {
const text = content?.find(c =\> c.type === 'text');
if (text) {
document.getElementById('output').textContent = text.text;
}
};
// Connect to the host
await app.connect();
\</script\>
`
```
The `App` object provides:
* **`app.ontoolresult`** — callback that receives tool results pushed by the host
* **`app.callServerTool({name, arguments})`** — call a tool on the server from within the app
* **`app.onhostcontextchanged`** — callback for host context changes (e.g., safe area insets)
* **`app.getHostContext()`** — get current host context
See the full [ext-apps SDK documentation](https://github.com/modelcontextprotocol/ext-apps) for the complete API reference.
If your HTML loads external scripts, styles, or makes API calls, you need to declare those domains in the CSP configuration. See [Security](#security) below.
##
[​
](#security)
Security
Apps run in sandboxed iframes with a deny-by-default Content Security Policy. By default, only inline scripts and styles are allowed — no external network access.
###
[​
](#content-security-policy)
Content Security Policy
If your app needs to load external resources (CDN scripts, API calls, embedded iframes), declare the allowed domains with `ResourceCSP`:
```
`from fastmcp.apps import AppConfig, ResourceCSP
@mcp.resource(
"ui://my-app/view.html",
app=AppConfig(
csp=ResourceCSP(
resource\_domains=["https://unpkg.com", "https://cdn.example.com"],
connect\_domains=["https://api.example.com"],
)
),
)
def my\_view() -\> str:
return "\<html\>...\</html\>"
`
```
|CSP Field|Controls|
|`connect\_domains`|`fetch`, XHR, WebSocket (`connect-src`)|
|`resource\_domains`|Scripts, images, styles, fonts (`script-src`, etc.)|
|`frame\_domains`|Nested iframes (`frame-src`)|
|`base\_uri\_domains`|Document base URI (`base-uri`)|
###
[​
](#permissions)
Permissions
If your app needs browser capabilities like camera or clipboard access, request them via `ResourcePermissions`:
```
`from fastmcp.apps import AppConfig, ResourcePermissions
@mcp.resource(
"ui://my-app/view.html",
app=AppConfig(
permissions=ResourcePermissions(
camera={},
clipboard\_write={},
)
),
)
def my\_view() -\> str:
return "\<html\>...\</html\>"
`
```
Hosts may or may not grant these permissions. Your app should use JavaScript feature detection as a fallback.
##
[​
](#example-qr-code-server)
Example: QR Code Server
This example creates a tool that generates QR codes and an app that renders them as images. It’s based on the [official MCP Apps example](https://github.com/modelcontextprotocol/ext-apps/tree/main/examples/qr-server). Requires the `qrcode[pil]` package.
```
`import base64
import io
import qrcode
from mcp import types
from fastmcp import FastMCP
from fastmcp.apps import AppConfig, ResourceCSP
from fastmcp.tools import ToolResult
mcp = FastMCP("QR Code Server")
VIEW\_URI = "ui://qr-server/view.html"
@mcp.tool(app=AppConfig(resource\_uri=VIEW\_URI))
def generate\_qr(text: str = "https://gofastmcp.com") -\> ToolResult:
"""Generate a QR code from text."""
qr = qrcode.QRCode(version=1, box\_size=10, border=4)
qr.add\_data(text)
qr.make(fit=True)
img = qr.make\_image()
buffer = io.BytesIO()
img.save(buffer, format="PNG")
b64 = base64.b64encode(buffer.getvalue()).decode()
return ToolResult(
content=[types.ImageContent(type="image", data=b64, mimeType="image/png")]
)
@mcp.resource(
VIEW\_URI,
app=AppConfig(csp=ResourceCSP(resource\_domains=["https://unpkg.com"])),
)
def view() -\> str:
"""Interactive QR code viewer."""
return """\\
\<!DOCTYPE html\>
\<html\>
\<head\>
\<meta name="color-scheme" content="light dark"\>
\<style\>
body { display: flex; justify-content: center;
align-items: center; height: 340px; width: 340px;
margin: 0; background: transparent; }
img { width: 300px; height: 300px; border-radius: 8px;
box-shadow: 0 2px 8px rgba(0,0,0,0.1); }
\</style\>
\</head\>
\<body\>
\<div id="qr"\>\</div\>
\<script type="module"\>
import { App } from
"https://unpkg.com/@modelcontextprotocol/ext-apps@0.4.0/app-with-deps";
const app = new App({ name: "QR View", version: "1.0.0" });
app.ontoolresult = ({ content }) =\> {
const img = content?.find(c =\> c.type === 'image');
if (img) {
const el = document.createElement('img');
el.src = `data:${img.mimeType};base64,${img.data}`;
el.alt = "QR Code";
document.getElementById('qr').replaceChildren(el);
}
};
await app.connect();
\</script\>
\</body\>
\</html\>"""
`
```
See all 73 lines
The tool generates a QR code as a base64 PNG. The resource loads the MCP Apps JS SDK from unpkg (declared in the CSP), listens for tool results, and renders the image. The host wires them together — when the LLM calls `generate\_qr`, the QR code appears in an interactive frame inside the conversation.
##
[​
](#checking-client-support)
Checking Client Support
Not all hosts support the Apps extension. You can check at runtime using the tool’s [context](/servers/context):
```
`from fastmcp import Context
from fastmcp.apps import AppConfig, UI\_EXTENSION\_ID
@mcp.tool(app=AppConfig(resource\_uri="ui://my-app/view.html"))
async def my\_tool(ctx: Context) -\> str:
if ctx.client\_supports\_extension(UI\_EXTENSION\_ID):
# Return data optimized for UI rendering
return rich\_response()
else:
# Fall back to plain text
return plain\_text\_response()
`
```