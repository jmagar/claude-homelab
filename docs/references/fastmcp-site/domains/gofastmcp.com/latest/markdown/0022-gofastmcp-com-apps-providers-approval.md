Approval - FastMCP
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
`Approval` adds a human-in-the-loop confirmation step to any server. The LLM presents what it’s about to do, the user approves or rejects via buttons, and the decision flows back into the conversation as a message.
```
`from fastmcp import FastMCP
from fastmcp.apps.approval import Approval
mcp = FastMCP("My Server")
mcp.add\_provider(Approval())
`
```
This registers a single tool:
|Tool|Visibility|Purpose|
|`request\_approval`|Model|Shows an approval card, sends the user’s decision back as a message|
The LLM calls `request\_approval` with a summary (and optional details) whenever it’s about to take a significant action. The user sees a card with Approve and Reject buttons. Clicking either sends a message back into the conversation via `SendMessage`, which triggers the LLM’s next turn.
The message looks like it came from the user:
```
`"Deploy v3.2 to production" — I selected: Approve
`
```
Approval is an advisory gate, not an enforcement mechanism. The conversation isn’t blocked while the card is open — the user can keep typing, and a determined LLM could proceed without waiting. Think of it as a strong UX signal that encourages confirmation, not a security boundary. For hard enforcement, implement approval logic server-side in your tool implementations.
##
[​
](#configuration)
Configuration
The constructor sets defaults; the LLM can override all of these per-call via tool arguments.
```
`Approval(
name="Approval", # App name
title="Approval Required", # Card heading
approve\_text="Approve", # Approve button label
reject\_text="Reject", # Reject button label
approve\_variant="default", # "default", "destructive", "success", "info"
reject\_variant="outline", # same options plus "outline"
)
`
```
The LLM can customize each invocation:
```
`request\_approval(
summary="Delete 47 files from /tmp",
details="This cannot be undone.",
title="Destructive Action",
approve\_text="Delete",
approve\_variant="destructive",
reject\_text="Keep files",
)
`
```
##
[​
](#how-it-works)
How It Works
When the user clicks a button, two things happen:
1. `SendMessage` pushes the decision into the conversation as a user message
2. `SetState("decided", True)` replaces the buttons with “Response sent.”
The tool description instructs the LLM to stop and wait for the “I selected:” message before proceeding. If approved, it continues. If rejected, it acknowledges and asks how to proceed.