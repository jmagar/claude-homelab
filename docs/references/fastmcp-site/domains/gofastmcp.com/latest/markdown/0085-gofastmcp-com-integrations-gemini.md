Gemini SDK 🤝 FastMCP - FastMCP
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
Anthropic API
](/integrations/anthropic)
* [
Gemini SDK
](/integrations/gemini)
* [
OpenAI API
](/integrations/openai)
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
Google’s Gemini API includes built-in support for MCP servers in their Python and JavaScript SDKs, allowing you to connect directly to MCP servers and use their tools seamlessly with Gemini models.
##
[​
](#gemini-python-sdk)
Gemini Python SDK
Google’s [Gemini Python SDK](https://ai.google.dev/gemini-api/docs) can use FastMCP clients directly.
Google’s MCP integration is currently experimental and available in the Python and JavaScript SDKs. The API automatically calls MCP tools when needed and can connect to both local and remote MCP servers.
Currently, Gemini’s MCP support only accesses **tools** from MCP servers—it queries the `list\_tools` endpoint and exposes those functions to the AI. Other MCP features like resources and prompts are not currently supported.
###
[​
](#create-a-server)
Create a Server
First, create a FastMCP server with the tools you want to expose. For this example, we’ll create a server with a single tool that rolls dice.
server.py
```
`import random
from fastmcp import FastMCP
mcp = FastMCP(name="Dice Roller")
@mcp.tool
def roll\_dice(n\_dice: int) -\> list[int]:
"""Roll `n\_dice` 6-sided dice and return the results."""
return [random.randint(1, 6) for \_ in range(n\_dice)]
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run()
`
```
###
[​
](#call-the-server)
Call the Server
To use the Gemini API with MCP, you’ll need to install the Google Generative AI SDK:
```
`pip install google-genai
`
```
You’ll also need to authenticate with Google. You can do this by setting the `GEMINI\_API\_KEY` environment variable. Consult the Gemini SDK documentation for more information.
```
`export GEMINI\_API\_KEY="your-api-key"
`
```
Gemini’s SDK interacts directly with the MCP client session. To call the server, you’ll need to instantiate a FastMCP client, enter its connection context, and pass the client session to the Gemini SDK.
```
`from fastmcp import Client
from google import genai
import asyncio
mcp\_client = Client("server.py")
gemini\_client = genai.Client()
async def main():
async with mcp\_client:
response = await gemini\_client.aio.models.generate\_content(
model="gemini-2.0-flash",
contents="Roll 3 dice!",
config=genai.types.GenerateContentConfig(
temperature=0,
tools=[mcp\_client.session], # Pass the FastMCP client session
),
)
print(response.text)
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
If you run this code, you’ll see output like:
```
`Okay, I rolled 3 dice and got a 5, 4, and 1.
`
```
###
[​
](#remote-&amp;-authenticated-servers)
Remote & Authenticated Servers
In the above example, we connected to our local server using `stdio` transport. Because we’re using a FastMCP client, you can also connect to any local or remote MCP server, using any [transport](/clients/transports) or [auth](/clients/auth) method supported by FastMCP, simply by changing the client configuration.
For example, to connect to a remote, authenticated server, you can use the following client:
```
`from fastmcp import Client
from fastmcp.client.auth import BearerAuth
mcp\_client = Client(
"https://my-server.com/mcp/",
auth=BearerAuth("\<your-token\>"),
)
`
```
The rest of the code remains the same.