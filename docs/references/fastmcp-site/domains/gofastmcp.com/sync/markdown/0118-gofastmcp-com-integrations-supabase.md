Supabase 🤝 FastMCP - FastMCP
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
New in version `2.13.0`
This guide shows you how to secure your FastMCP server using **Supabase Auth**. This integration uses the [**Remote OAuth**](/servers/auth/remote-oauth) pattern, where Supabase handles user authentication and your FastMCP server validates the tokens.
Supabase Auth does not currently support [RFC 8707](https://www.rfc-editor.org/rfc/rfc8707.html) resource indicators, so FastMCP cannot validate that tokens were issued for the specific resource server.
##
[​
](#consent-ui-requirement)
Consent UI Requirement
Supabase’s OAuth Server delegates the user consent screen to your application. When an MCP client initiates authorization, Supabase authenticates the user and then redirects to your application at a configured callback URL (e.g., `https://your-app.com/oauth/callback?authorization\_id=...`). Your application must host a page that calls Supabase’s `approveAuthorization()` or `denyAuthorization()` APIs to complete the flow.
`SupabaseProvider` handles the resource server side (token verification and metadata), but you are responsible for building and hosting the consent UI separately. See [Supabase’s OAuth Server documentation](https://supabase.com/docs/guides/auth/oauth-server/getting-started) for details on implementing the authorization page.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A **[Supabase Account](https://supabase.com/)** with a project or a self-hosted **Supabase Auth** instance
2. **OAuth Server enabled** in your Supabase Dashboard (Authentication → OAuth Server)
3. **Dynamic Client Registration enabled** in the same settings
4. A **consent UI** hosted at your configured authorization path (see above)
5. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-enable-supabase-oauth-server)
Step 1: Enable Supabase OAuth Server
In your Supabase Dashboard:
1. Go to **Authentication → OAuth Server**
2. Enable the **OAuth Server**
3. Set your **Site URL** to where your consent UI is hosted
4. Set the **Authorization Path** (e.g., `/oauth/callback`)
5. Enable **Allow Dynamic OAuth Apps** for MCP client registration
###
[​
](#step-2-get-supabase-project-url)
Step 2: Get Supabase Project URL
In your Supabase Dashboard:
1. Go to **Project Settings**
2. Copy your **Project URL** (e.g., `https://abc123.supabase.co`)
###
[​
](#step-3-fastmcp-configuration)
Step 3: FastMCP Configuration
Create your FastMCP server using the `SupabaseProvider`:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.supabase import SupabaseProvider
auth = SupabaseProvider(
project\_url="https://abc123.supabase.co",
base\_url="http://localhost:8000",
)
mcp = FastMCP("Supabase Protected Server", auth=auth)
@mcp.tool
def protected\_tool(message: str) -\> str:
"""This tool requires authentication."""
return f"Authenticated user says: {message}"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http", port=8000)
`
```
##
[​
](#testing)
Testing
###
[​
](#running-the-server)
Running the Server
Start your FastMCP server with HTTP transport to enable OAuth flows:
```
`fastmcp run server.py --transport http --port 8000
`
```
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your Supabase-protected server:
client.py
```
`from fastmcp import Client
import asyncio
async def main():
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
print("Authenticated with Supabase!")
result = await client.call\_tool("protected\_tool", {"message": "Hello!"})
print(result)
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to Supabase’s authorization endpoint
2. After authenticating, Supabase redirects to your consent UI
3. After you approve, the client receives the token and can make authenticated requests
##
[​
](#production-configuration)
Production Configuration
For production deployments, load configuration from environment variables:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.supabase import SupabaseProvider
auth = SupabaseProvider(
project\_url=os.environ["SUPABASE\_PROJECT\_URL"],
base\_url=os.environ.get("BASE\_URL", "https://your-server.com"),
)
mcp = FastMCP(name="Supabase Secured App", auth=auth)
`
```