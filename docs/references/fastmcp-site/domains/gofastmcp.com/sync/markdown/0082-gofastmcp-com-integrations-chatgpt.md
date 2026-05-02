ChatGPT 🤝 FastMCP - FastMCP
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
* [
ChatGPT
](/integrations/chatgpt)
* [
Claude Code
](/integrations/claude-code)
* [
Claude Desktop
](/integrations/claude-desktop)
* [
Cursor
](/integrations/cursor)
* [
Gemini CLI
](/integrations/gemini-cli)
* [
Goose
](/integrations/goose)
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
[ChatGPT](https://chatgpt.com/) supports MCP servers through remote HTTP connections in two modes: **Chat mode** for interactive conversations and **Deep Research mode** for comprehensive information retrieval.
**Developer Mode Required for Chat Mode**: To use MCP servers in regular ChatGPT conversations, you must first enable Developer Mode in your ChatGPT settings. This feature is available for ChatGPT Pro, Team, Enterprise, and Edu users.
OpenAI’s official MCP documentation and examples are built with **FastMCP v2**! Learn more from their [MCP documentation](https://platform.openai.com/docs/mcp) and [Developer Mode guide](https://platform.openai.com/docs/guides/developer-mode).
##
[​
](#build-a-server)
Build a Server
First, let’s create a simple FastMCP server:
server.py
```
`from fastmcp import FastMCP
import random
mcp = FastMCP("Demo Server")
@mcp.tool
def roll\_dice(sides: int = 6) -\> int:
"""Roll a dice with the specified number of sides."""
return random.randint(1, sides)
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http", port=8000)
`
```
###
[​
](#deploy-your-server)
Deploy Your Server
Your server must be accessible from the internet. For development, use `ngrok`:
Terminal 1
Terminal 2
```
`python server.py
`
```
Note your public URL (e.g., `https://abc123.ngrok.io`) for the next steps.
##
[​
](#chat-mode)
Chat Mode
Chat mode lets you use MCP tools directly in ChatGPT conversations. See [OpenAI’s Developer Mode guide](https://platform.openai.com/docs/guides/developer-mode) for the latest requirements.
###
[​
](#add-to-chatgpt)
Add to ChatGPT
####
[​
](#1-enable-developer-mode)
1. Enable Developer Mode
1. Open ChatGPT and go to **Settings** → **Connectors**
2. Under **Advanced**, toggle **Developer Mode** to enabled
####
[​
](#2-create-connector)
2. Create Connector
1. In **Settings** → **Connectors**, click **Create**
2. Enter:
* **Name**: Your server name
* **Server URL**: `https://your-server.ngrok.io/mcp/`
* Check **I trust this provider**
* Add authentication if needed
* Click **Create**
**Without Developer Mode**: If you don’t have search/fetch tools, ChatGPT will reject the server. With Developer Mode enabled, you don’t need search/fetch tools for Chat mode.
####
[​
](#3-use-in-chat)
3. Use in Chat
1. Start a new chat
2. Click the **+** button → **More** → **Developer Mode**
3. **Enable your MCP server connector** (required - the connector must be explicitly added to each chat)
4. Now you can use your tools:
Example usage:
* “Roll a 20-sided dice”
* “Roll dice” (uses default 6 sides)
The connector must be explicitly enabled in each chat session through Developer Mode. Once added, it remains active for the entire conversation.
###
[​
](#skip-confirmations)
Skip Confirmations
Use `annotations={"readOnlyHint": True}` to skip confirmation prompts for read-only tools:
```
`@mcp.tool(annotations={"readOnlyHint": True})
def get\_status() -\> str:
"""Check system status."""
return "All systems operational"
@mcp.tool() # No annotation - ChatGPT may ask for confirmation
def delete\_item(id: str) -\> str:
"""Delete an item."""
return f"Deleted {id}"
`
```
##
[​
](#deep-research-mode)
Deep Research Mode
Deep Research mode provides systematic information retrieval with citations. See [OpenAI’s MCP documentation](https://platform.openai.com/docs/mcp) for the latest Deep Research specifications.
**Search and Fetch Required**: Without Developer Mode, ChatGPT will reject any server that doesn’t have both `search` and `fetch` tools. Even in Developer Mode, Deep Research only uses these two tools.
###
[​
](#tool-implementation)
Tool Implementation
Deep Research tools must follow this pattern:
```
`@mcp.tool()
def search(query: str) -\> dict:
"""
Search for records matching the query.
Must return {"ids": [list of string IDs]}
"""
# Your search logic
matching\_ids = ["id1", "id2", "id3"]
return {"ids": matching\_ids}
@mcp.tool()
def fetch(id: str) -\> dict:
"""
Fetch a complete record by ID.
Return the full record data for ChatGPT to analyze.
"""
# Your fetch logic
return {
"id": id,
"title": "Record Title",
"content": "Full record content...",
"metadata": {"author": "Jane Doe", "date": "2024"}
}
`
```
###
[​
](#using-deep-research)
Using Deep Research
1. Ensure your server is added to ChatGPT’s connectors (same as Chat mode)
2. Start a new chat
3. Click **+** → **Deep Research**
4. Select your MCP server as a source
5. Ask research questions
ChatGPT will use your `search` and `fetch` tools to find and cite relevant information.