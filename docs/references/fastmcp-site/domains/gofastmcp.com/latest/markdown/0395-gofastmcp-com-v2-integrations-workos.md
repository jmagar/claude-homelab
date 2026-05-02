WorkOS 🤝 FastMCP - FastMCP
Documentation
##### Get Started
* [
Welcome!
](/v2/getting-started/welcome)
* [
Installation
](/v2/getting-started/installation)
* [
Quickstart
](/v2/getting-started/quickstart)
* [
Updates
NEW
](/v2/updates)
##### Servers
* [
Overview
](/v2/servers/server)
*
Core Components
*
Advanced Features
*
Authentication
*
Deployment
##### Clients
*
Essentials
*
Core Operations
*
Advanced Features
*
Authentication
##### Integrations
*
Authentication
* [
Auth0
NEW
](/v2/integrations/auth0)
* [
AuthKit
NEW
](/v2/integrations/authkit)
* [
AWS Cognito
NEW
](/v2/integrations/aws-cognito)
* [
Azure (Entra ID)
NEW
](/v2/integrations/azure)
* [
Descope
NEW
](/v2/integrations/descope)
* [
Discord
NEW
](/v2/integrations/discord)
* [
GitHub
NEW
](/v2/integrations/github)
* [
Google
NEW
](/v2/integrations/google)
* [
Oracle
NEW
](/v2/integrations/oci)
* [
Scalekit
NEW
](/v2/integrations/scalekit)
* [
Supabase
NEW
](/v2/integrations/supabase)
* [
WorkOS
NEW
](/v2/integrations/workos)
*
Authorization
*
AI Assistants
*
AI SDKs
*
API Integration
##### Patterns
* [
Tool Transformation
](/v2/patterns/tool-transformation)
* [
Decorating Methods
](/v2/patterns/decorating-methods)
* [
CLI
](/v2/patterns/cli)
* [
Contrib Modules
](/v2/patterns/contrib)
* [
Testing
](/v2/patterns/testing)
##### Development
* [
Contributing
](/v2/development/contributing)
* [
Tests
](/v2/development/tests)
* [
Releases
](/v2/development/releases)
* [
Upgrade Guide
NEW
](/v2/development/upgrade-guide)
* [
Changelog
](/v2/changelog)
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
New in version `2.12.0`
Secure your FastMCP server with WorkOS Connect authentication. This integration uses the OAuth Proxy pattern to handle authentication through WorkOS Connect while maintaining compatibility with MCP clients.
This guide covers WorkOS Connect applications. For Dynamic Client Registration (DCR) with AuthKit, see the [AuthKit integration](/v2/integrations/authkit) instead.
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
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/v2/servers/auth/oauth-proxy#configuration-parameters).
##
[​
](#environment-variables)
Environment Variables
New in version `2.12.1`
For production deployments, use environment variables instead of hardcoding credentials.
###
[​
](#provider-selection)
Provider Selection
Setting this environment variable allows the WorkOS provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.workos.WorkOSProvider` to use WorkOS authentication.
###
[​
](#workos-specific-configuration)
WorkOS-Specific Configuration
These environment variables provide default values for the WorkOS provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-workos-client-id)
FASTMCP\_SERVER\_AUTH\_WORKOS\_CLIENT\_ID
required
Your WorkOS OAuth App Client ID (e.g., `client\_01K33Y6GGS7T3AWMPJWKW42Y3Q`)
[​
](#param-fastmcp-server-auth-workos-client-secret)
FASTMCP\_SERVER\_AUTH\_WORKOS\_CLIENT\_SECRET
required
Your WorkOS OAuth App Client Secret
[​
](#param-fastmcp-server-auth-workos-authkit-domain)
FASTMCP\_SERVER\_AUTH\_WORKOS\_AUTHKIT\_DOMAIN
required
Your WorkOS AuthKit domain (e.g., `https://your-app.authkit.app`)
[​
](#param-fastmcp-server-auth-workos-base-url)
FASTMCP\_SERVER\_AUTH\_WORKOS\_BASE\_URL
default:"http://localhost:8000"
Public URL where OAuth endpoints will be accessible (includes any mount path)
[​
](#param-fastmcp-server-auth-workos-issuer-url)
FASTMCP\_SERVER\_AUTH\_WORKOS\_ISSUER\_URL
default:"Uses BASE\_URL"
Issuer URL for OAuth metadata (defaults to `BASE\_URL`). Set to root-level URL when mounting under a path prefix to avoid 404 logs. See [HTTP Deployment guide](/v2/deployment/http#mounting-authenticated-servers) for details.
[​
](#param-fastmcp-server-auth-workos-redirect-path)
FASTMCP\_SERVER\_AUTH\_WORKOS\_REDIRECT\_PATH
default:"/auth/callback"
Redirect path configured in your WorkOS OAuth App
[​
](#param-fastmcp-server-auth-workos-required-scopes)
FASTMCP\_SERVER\_AUTH\_WORKOS\_REQUIRED\_SCOPES
default:"[]"
Comma-, space-, or JSON-separated list of required OAuth scopes (e.g., `openid profile email` or `["openid","profile","email"]`)
[​
](#param-fastmcp-server-auth-workos-timeout-seconds)
FASTMCP\_SERVER\_AUTH\_WORKOS\_TIMEOUT\_SECONDS
default:"10"
HTTP request timeout for WorkOS API calls
Example `.env` file:
```
`# WorkOS OAuth credentials (always used as defaults)
FASTMCP\_SERVER\_AUTH\_WORKOS\_CLIENT\_ID=client\_01K33Y6GGS7T3AWMPJWKW42Y3Q
FASTMCP\_SERVER\_AUTH\_WORKOS\_CLIENT\_SECRET=your\_client\_secret
FASTMCP\_SERVER\_AUTH\_WORKOS\_AUTHKIT\_DOMAIN=https://your-app.authkit.app
FASTMCP\_SERVER\_AUTH\_WORKOS\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_WORKOS\_REQUIRED\_SCOPES=["openid","profile","email"]
# Optional: Automatically provision WorkOS auth for all servers
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.workos.WorkOSProvider
`
```
With environment variables set, you can either:
**Option 1: Manual instantiation (env vars provide defaults)**
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.workos import WorkOSProvider
# Env vars provide default values for WorkOSProvider()
auth = WorkOSProvider() # Uses env var defaults
mcp = FastMCP(name="WorkOS Protected Server", auth=auth)
`
```
**Option 2: Automatic provisioning (requires FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.workos.WorkOSProvider)**
server.py
```
`from fastmcp import FastMCP
# Auth is automatically provisioned from FASTMCP\_SERVER\_AUTH
mcp = FastMCP(name="WorkOS Protected Server")
`
```
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