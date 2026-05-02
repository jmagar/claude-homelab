PropelAuth 🤝 FastMCP - FastMCP
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
New in version `3.1.0`
This guide shows you how to secure your FastMCP server using [**PropelAuth**](https://www.propelauth.com), a complete authentication and user management solution. This integration uses the [**Remote OAuth**](/servers/auth/remote-oauth) pattern, where PropelAuth handles user login, consent management, and your FastMCP server validates the tokens.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A [PropelAuth](https://www.propelauth.com) account
2. Your FastMCP server’s base URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-configure-propelauth)
Step 1: Configure PropelAuth
1
[
](#)
Enable MCP Authentication
Navigate to the **MCP** section in your PropelAuth dashboard, click **Enable MCP**, and choose which environments to enable it for (Test, Staging, Prod).
2
[
](#)
Configure Allowed MCP Clients
Under **MCP \> Allowed MCP Clients**, add redirect URIs for each MCP client you want to allow. PropelAuth provides templates for popular clients like Claude, Cursor, and ChatGPT.
3
[
](#)
Configure Scopes
Under **MCP \> Scopes**, define the permissions available to MCP clients (e.g., `read:user\_data`).
4
[
](#)
Choose How Users Create OAuth Clients
Under **MCP \> Settings \> How Do Users Create OAuth Clients?**, you can optionally enable:
* **Dynamic Client Registration** — clients self-register automatically via the DCR protocol
* **Manually via Hosted Pages** — PropelAuth creates a UI for your users to register OAuth clients
You can enable neither, one, or both. If you enable neither, you’ll manage OAuth client creation yourself.
5
[
](#)
Generate Introspection Credentials
Go to **MCP \> Request Validation** and click **Create Credentials**. Note the **Client ID** and **Client Secret** - you’ll need these to validate tokens.
6
[
](#)
Note Your Auth URL
Find your Auth URL in the **Backend Integration** section of the dashboard (e.g., `https://auth.yourdomain.com`).
For more details, see the [PropelAuth MCP documentation](https://docs.propelauth.com/mcp-authentication/overview).
###
[​
](#step-2-environment-setup)
Step 2: Environment Setup
Create a `.env` file with your PropelAuth configuration:
```
`PROPELAUTH\_AUTH\_URL=https://auth.yourdomain.com # From Backend Integration page
PROPELAUTH\_INTROSPECTION\_CLIENT\_ID=your-client-id # From MCP \> Request Validation
PROPELAUTH\_INTROSPECTION\_CLIENT\_SECRET=your-client-secret # From MCP \> Request Validation
SERVER\_URL=http://localhost:8000 # Your server's base URL
`
```
###
[​
](#step-3-fastmcp-configuration)
Step 3: FastMCP Configuration
Create your FastMCP server file and use the PropelAuthProvider to handle all the OAuth integration automatically:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.propelauth import PropelAuthProvider
auth\_provider = PropelAuthProvider(
auth\_url=os.environ["PROPELAUTH\_AUTH\_URL"],
introspection\_client\_id=os.environ["PROPELAUTH\_INTROSPECTION\_CLIENT\_ID"],
introspection\_client\_secret=os.environ["PROPELAUTH\_INTROSPECTION\_CLIENT\_SECRET"],
base\_url=os.environ["SERVER\_URL"],
required\_scopes=["read:user\_data"], # Optional scope enforcement
)
mcp = FastMCP(name="My PropelAuth Protected Server", auth=auth\_provider)
`
```
##
[​
](#testing)
Testing
With your `.env` loaded, start the server:
```
`fastmcp run server.py --transport http --port 8000
`
```
Then use a FastMCP client to verify authentication works:
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
](#accessing-user-information)
Accessing User Information
You can use `get\_access\_token()` inside your tools to identify the authenticated user:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.propelauth import PropelAuthProvider
from fastmcp.server.dependencies import get\_access\_token
auth = PropelAuthProvider(
auth\_url=os.environ["PROPELAUTH\_AUTH\_URL"],
introspection\_client\_id=os.environ["PROPELAUTH\_INTROSPECTION\_CLIENT\_ID"],
introspection\_client\_secret=os.environ["PROPELAUTH\_INTROSPECTION\_CLIENT\_SECRET"],
base\_url=os.environ["SERVER\_URL"],
required\_scopes=["read:user\_data"],
)
mcp = FastMCP(name="My PropelAuth Protected Server", auth=auth)
@mcp.tool
def whoami() -\> dict:
"""Return the authenticated user's ID."""
token = get\_access\_token()
if token is None:
return {"error": "Not authenticated"}
user\_id = token.claims.get("sub")
return {"user\_id": user\_id}
`
```
##
[​
](#advanced-configuration)
Advanced Configuration
The `PropelAuthProvider` supports optional overrides for token introspection behavior, including caching and request timeouts:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.propelauth import PropelAuthProvider
auth = PropelAuthProvider(
auth\_url=os.environ["PROPELAUTH\_AUTH\_URL"],
introspection\_client\_id=os.environ["PROPELAUTH\_INTROSPECTION\_CLIENT\_ID"],
introspection\_client\_secret=os.environ["PROPELAUTH\_INTROSPECTION\_CLIENT\_SECRET"],
base\_url=os.environ.get("BASE\_URL", "https://your-server.com"),
required\_scopes=["read:user\_data"],
resource="https://your-server.com/mcp", # Restrict to tokens intended for this server (RFC 8707)
token\_introspection\_overrides={
"cache\_ttl\_seconds": 300, # Cache introspection results for 5 minutes
"max\_cache\_size": 1000, # Maximum cached tokens
"timeout\_seconds": 15, # HTTP request timeout
},
)
mcp = FastMCP(name="My PropelAuth Protected Server", auth=auth)
`
```