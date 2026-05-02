Descope 🤝 FastMCP - FastMCP
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
* [
Auth0
](/integrations/auth0)
* [
AuthKit
](/integrations/authkit)
* [
AWS Cognito
](/integrations/aws-cognito)
* [
Azure (Entra ID)
](/integrations/azure)
* [
Descope
](/integrations/descope)
* [
Discord
](/integrations/discord)
* [
Eunomia Auth
](/integrations/eunomia-authorization)
* [
GitHub
](/integrations/github)
* [
Google
](/integrations/google)
* [
Oracle
](/integrations/oci)
* [
Permit.io
](/integrations/permit)
* [
PropelAuth
](/integrations/propelauth)
* [
Scalekit
](/integrations/scalekit)
* [
Supabase
](/integrations/supabase)
* [
WorkOS
](/integrations/workos)
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
New in version `2.12.4`
This guide shows you how to secure your FastMCP server using [**Descope**](https://www.descope.com), a complete authentication and user management solution. This integration uses the [**Remote OAuth**](/servers/auth/remote-oauth) pattern, where Descope handles user login and your FastMCP server validates the tokens.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. To [sign up](https://www.descope.com/sign-up) for a Free Forever Descope account
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:3000`)
###
[​
](#step-1-configure-descope)
Step 1: Configure Descope
1
[
](#)
Create an MCP Server
1. Go to the [MCP Servers page](https://app.descope.com/mcp-servers) of the Descope Console, and create a new MCP Server.
2. Give the MCP server a name and description.
3. Ensure that **Dynamic Client Registration (DCR)** is enabled. Then click **Create**.
4. Once you’ve created the MCP Server, note your Well-Known URL.
DCR is required for FastMCP clients to automatically register with your authentication server.
2
[
](#)
Note Your Well-Known URL
Save your Well-Known URL from [MCP Server Settings](https://app.descope.com/mcp-servers):
```
`Well-Known URL: https://.../v1/apps/agentic/P.../M.../.well-known/openid-configuration
`
```
###
[​
](#step-2-environment-setup)
Step 2: Environment Setup
Create a `.env` file with your Descope configuration:
```
`DESCOPE\_CONFIG\_URL=https://.../v1/apps/agentic/P.../M.../.well-known/openid-configuration # Your Descope Well-Known URL
SERVER\_URL=http://localhost:3000 # Your server's base URL
`
```
###
[​
](#step-3-fastmcp-configuration)
Step 3: FastMCP Configuration
Create your FastMCP server file and use the DescopeProvider to handle all the OAuth integration automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.descope import DescopeProvider
# The DescopeProvider automatically discovers Descope endpoints
# and configures JWT token validation
auth\_provider = DescopeProvider(
config\_url=https://.../.well-known/openid-configuration, # Your MCP Server .well-known URL
base\_url=SERVER\_URL, # Your server's public URL
)
# Create FastMCP server with auth
mcp = FastMCP(name="My Descope Protected Server", auth=auth\_provider)
`
```
##
[​
](#testing)
Testing
To test your server, you can use the `fastmcp` CLI to run it locally. Assuming you’ve saved the above code to `server.py` (after replacing the environment variables with your actual values!), you can run the following command:
```
`fastmcp run server.py --transport http --port 8000
`
```
Now, you can use a FastMCP client to test that you can reach your server after authenticating:
```
`from fastmcp import Client
import asyncio
async def main():
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
assert await client.ping()
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
##
[​
](#production-configuration)
Production Configuration
For production deployments, load configuration from environment variables:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.descope import DescopeProvider
# Load configuration from environment variables
auth = DescopeProvider(
config\_url=os.environ.get("DESCOPE\_CONFIG\_URL"),
base\_url=os.environ.get("BASE\_URL", "https://your-server.com")
)
mcp = FastMCP(name="My Descope Protected Server", auth=auth)
`
```