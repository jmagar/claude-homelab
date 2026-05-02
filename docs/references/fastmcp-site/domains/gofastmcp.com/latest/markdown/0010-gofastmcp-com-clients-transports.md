Client Transports - FastMCP
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
Transports handle the underlying connection between your client and MCP servers. While the client can automatically select a transport based on what you pass to it, instantiating transports explicitly gives you full control over configuration.
##
[​
](#stdio-transport)
STDIO Transport
STDIO transport communicates with MCP servers through subprocess pipes. When using STDIO, your client launches and manages the server process, controlling its lifecycle and environment.
STDIO servers run in isolated environments by default. They do not inherit your shell’s environment variables. You must explicitly pass any configuration the server needs.
```
`from fastmcp import Client
from fastmcp.client.transports import StdioTransport
transport = StdioTransport(
command="python",
args=["my\_server.py", "--verbose"],
env={"API\_KEY": "secret", "LOG\_LEVEL": "DEBUG"},
cwd="/path/to/server"
)
client = Client(transport)
`
```
For convenience, the client can infer STDIO transport from file paths, though this limits configuration options:
```
`from fastmcp import Client
client = Client("my\_server.py") # Limited - no configuration options
`
```
###
[​
](#environment-variables)
Environment Variables
Since STDIO servers do not inherit your environment, you need strategies for passing configuration.
**Selective forwarding** passes only the variables your server needs:
```
`import os
from fastmcp.client.transports import StdioTransport
required\_vars = ["API\_KEY", "DATABASE\_URL", "REDIS\_HOST"]
env = {var: os.environ[var] for var in required\_vars if var in os.environ}
transport = StdioTransport(command="python", args=["server.py"], env=env)
client = Client(transport)
`
```
**Loading from .env files** keeps configuration separate from code:
```
`from dotenv import dotenv\_values
from fastmcp.client.transports import StdioTransport
env = dotenv\_values(".env")
transport = StdioTransport(command="python", args=["server.py"], env=env)
client = Client(transport)
`
```
###
[​
](#session-persistence)
Session Persistence
STDIO transports maintain sessions across multiple client contexts by default (`keep\_alive=True`). This reuses the same subprocess for multiple connections, improving performance.
```
`from fastmcp.client.transports import StdioTransport
transport = StdioTransport(command="python", args=["server.py"])
client = Client(transport)
async def efficient\_multiple\_operations():
async with client:
await client.ping()
async with client: # Reuses the same subprocess
await client.call\_tool("process\_data", {"file": "data.csv"})
`
```
For complete isolation between connections, disable session persistence:
```
`transport = StdioTransport(command="python", args=["server.py"], keep\_alive=False)
`
```
##
[​
](#http-transport)
HTTP Transport
HTTP transport connects to MCP servers running as web services. This is the recommended transport for production deployments.
```
`from fastmcp import Client
from fastmcp.client.transports import StreamableHttpTransport
transport = StreamableHttpTransport(
url="https://api.example.com/mcp",
headers={
"Authorization": "Bearer your-token-here",
"X-Custom-Header": "value"
}
)
client = Client(transport)
`
```
FastMCP also provides authentication helpers:
```
`from fastmcp import Client
from fastmcp.client.auth import BearerAuth
client = Client(
"https://api.example.com/mcp",
auth=BearerAuth("your-token-here")
)
`
```
###
[​
](#ssl-verification)
SSL Verification
By default, HTTPS connections verify the server’s SSL certificate. You can customize this behavior with the `verify` parameter, which accepts the same values as [httpx](https://www.python-httpx.org/advanced/ssl/):
```
`from fastmcp import Client
# Disable SSL verification (e.g., for self-signed certs in development)
client = Client("https://dev-server.internal/mcp", verify=False)
# Use a custom CA bundle
client = Client("https://corp-server.internal/mcp", verify="/path/to/ca-bundle.pem")
# Use a custom SSL context for full control
import ssl
ctx = ssl.create\_default\_context()
ctx.load\_verify\_locations("/path/to/internal-ca.pem")
client = Client("https://corp-server.internal/mcp", verify=ctx)
`
```
The `verify` parameter is also available directly on `StreamableHttpTransport` and `SSETransport`:
```
`from fastmcp.client.transports import StreamableHttpTransport
transport = StreamableHttpTransport(
url="https://dev-server.internal/mcp",
verify=False,
)
client = Client(transport)
`
```
###
[​
](#sse-transport)
SSE Transport
Server-Sent Events transport is maintained for backward compatibility. Use Streamable HTTP for new deployments unless you have specific infrastructure requirements.
```
`from fastmcp.client.transports import SSETransport
transport = SSETransport(
url="https://api.example.com/sse",
headers={"Authorization": "Bearer token"}
)
client = Client(transport)
`
```
##
[​
](#in-memory-transport)
In-Memory Transport
In-memory transport connects directly to a FastMCP server instance within the same Python process. This eliminates both subprocess management and network overhead, making it ideal for testing.
```
`from fastmcp import FastMCP, Client
import os
mcp = FastMCP("TestServer")
@mcp.tool
def greet(name: str) -\> str:
prefix = os.environ.get("GREETING\_PREFIX", "Hello")
return f"{prefix}, {name}!"
client = Client(mcp)
async with client:
result = await client.call\_tool("greet", {"name": "World"})
`
```
Unlike STDIO transports, in-memory servers share the same memory space and environment variables as your client code.
##
[​
](#multi-server-configuration)
Multi-Server Configuration
Connect to multiple servers defined in a configuration dictionary:
```
`from fastmcp import Client
config = {
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"transport": "http"
},
"assistant": {
"command": "python",
"args": ["./assistant.py"],
"env": {"LOG\_LEVEL": "INFO"}
}
}
}
client = Client(config)
async with client:
# Tools are namespaced by server
weather = await client.call\_tool("weather\_get\_forecast", {"city": "NYC"})
answer = await client.call\_tool("assistant\_ask", {"question": "What?"})
`
```
###
[​
](#tool-transformations)
Tool Transformations
FastMCP supports tool transformations within the configuration. You can change names, descriptions, tags, and arguments for tools from a server.
```
`config = {
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"transport": "http",
"tools": {
"weather\_get\_forecast": {
"name": "miami\_weather",
"description": "Get the weather for Miami",
"arguments": {
"city": {
"default": "Miami",
"hide": True,
}
}
}
}
}
}
}
`
```
To filter tools by tag, use `include\_tags` or `exclude\_tags` at the server level:
```
`config = {
"mcpServers": {
"weather": {
"url": "https://weather.example.com/mcp",
"include\_tags": ["forecast"] # Only tools with this tag
}
}
}
`
```