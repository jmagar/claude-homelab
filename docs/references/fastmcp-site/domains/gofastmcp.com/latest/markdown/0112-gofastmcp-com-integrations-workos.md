WorkOS 🤝 FastMCP - FastMCP
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
New in version `2.12.0`
Secure your FastMCP server with WorkOS Connect authentication. This integration uses the OAuth Proxy pattern to handle authentication through WorkOS Connect while maintaining compatibility with MCP clients.
This guide covers WorkOS Connect applications. For Dynamic Client Registration (DCR) with AuthKit, see the [AuthKit integration](/integrations/authkit) instead.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A **[WorkOS Account](https://workos.com/)** with access to create OAuth Apps
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-create-a-workos-oauth-app)
Step 1: Create a WorkOS OAuth App
Create an OAuth App in your WorkOS dashboard to get the credentials needed for authentication:
1
[
](#)
Create OAuth Application
In your WorkOS dashboard:
1. Navigate to **Applications**
2. Click **Create Application**
3. Select **OAuth Application**
4. Name your application
2
[
](#)
Get Credentials
In your OAuth application settings:
1. Copy your **Client ID** (starts with `client\_`)
2. Click **Generate Client Secret** and save it securely
3. Copy your **AuthKit Domain** (e.g., `https://your-app.authkit.app`)
3
[
](#)
Configure Redirect URI
In the **Redirect URIs** section:
* Add: `http://localhost:8000/auth/callback` (for development)
* For production, add your server’s public URL + `/auth/callback`
The callback URL must match exactly. The default path is `/auth/callback`, but you can customize it using the `redirect\_path` parameter.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `WorkOSProvider`:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.workos import WorkOSProvider
# Configure WorkOS OAuth
auth = WorkOSProvider(
client\_id="client\_YOUR\_CLIENT\_ID",
client\_secret="YOUR\_CLIENT\_SECRET",
authkit\_domain="https://your-app.authkit.app",
base\_url="http://localhost:8000",
required\_scopes=["openid", "profile", "email"]
)
mcp = FastMCP("WorkOS Protected Server", auth=auth)
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
Your server is now running and protected by WorkOS OAuth authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your WorkOS-protected server:
client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle WorkOS OAuth
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
# First-time connection will open WorkOS login in your browser
print("✓ Authenticated with WorkOS!")
# Test the protected tool
result = await client.call\_tool("protected\_tool", {"message": "Hello!"})
print(result)
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to WorkOS’s authorization page
2. After you authorize the app, you’ll be redirected back
3. The client receives the token and can make authenticated requests
The client caches tokens locally, so you won’t need to re-authenticate for subsequent runs unless the token expires or you explicitly clear the cache.
##
[​
](#production-configuration)
Production Configuration
New in version `2.13.0`
For production deployments with persistent token management across server restarts, configure `jwt\_signing\_key`, and `client\_storage`:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.workos import WorkOSProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
# Production setup with encrypted persistent token storage
auth = WorkOSProvider(
client\_id="client\_YOUR\_CLIENT\_ID",
client\_secret="YOUR\_CLIENT\_SECRET",
authkit\_domain="https://your-app.authkit.app",
base\_url="https://your-production-domain.com",
required\_scopes=["openid", "profile", "email"],
# Production token management
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
client\_storage=FernetEncryptionWrapper(
key\_value=RedisStore(
host=os.environ["REDIS\_HOST"],
port=int(os.environ["REDIS\_PORT"])
),
fernet=Fernet(os.environ["STORAGE\_ENCRYPTION\_KEY"])
)
)
mcp = FastMCP(name="Production WorkOS App", auth=auth)
`
```
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/servers/auth/oauth-proxy#configuration-parameters).
##
[​
](#configuration-options)
Configuration Options
##
[​
](#param-client-id)
client\_id
required
WorkOS OAuth application client ID
[​
](#param-client-secret)
client\_secret
required
WorkOS OAuth application client secret
[​
](#param-authkit-domain)
authkit\_domain
required
Your WorkOS AuthKit domain URL (e.g., `https://your-app.authkit.app`)
[​
](#param-base-url)
base\_url
required
Your FastMCP server’s public URL
[​
](#param-required-scopes)
required\_scopes
default:"[]"
OAuth scopes to request
[​
](#param-redirect-path)
redirect\_path
default:"/auth/callback"
OAuth callback path
[​
](#param-timeout-seconds)
timeout\_seconds
default:"10"
API request timeout