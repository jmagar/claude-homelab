Azure (Microsoft Entra ID) OAuth 🤝 FastMCP - FastMCP
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
New in version `2.13.0`
This guide shows you how to secure your FastMCP server using **Azure OAuth** (Microsoft Entra ID). Since Azure doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/v2/servers/auth/oauth-proxy) pattern to bridge Azure’s traditional OAuth with MCP’s authentication requirements. FastMCP validates Azure JWTs against your application’s client\_id.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. An **[Azure Account](https://portal.azure.com/)** with access to create App registrations
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
3. Your Azure tenant ID (found in Azure Portal under Microsoft Entra ID)
###
[​
](#step-1-create-an-azure-app-registration)
Step 1: Create an Azure App Registration
Create an App registration in Azure Portal to get the credentials needed for authentication:
1
[
](#)
Navigate to App registrations
Go to the [Azure Portal](https://portal.azure.com) and navigate to **Microsoft Entra ID → App registrations**.Click **“New registration”** to create a new application.
2
[
](#)
Configure Your Application
Fill in the application details:
* **Name**: Choose a name users will recognize (e.g., “My FastMCP Server”)
* **Supported account types**: Choose based on your needs:
* **Single tenant**: Only users in your organization
* **Multitenant**: Users in any Microsoft Entra directory
* **Multitenant + personal accounts**: Any Microsoft account
* **Redirect URI**: Select “Web” and enter your server URL + `/auth/callback` (e.g., `http://localhost:8000/auth/callback`)
The redirect URI must match exactly. The default path is `/auth/callback`, but you can customize it using the `redirect\_path` parameter. For local development, Azure allows `http://localhost` URLs. For production, you must use HTTPS.
If you want to use a custom callback path (e.g., `/auth/azure/callback`), make sure to set the same path in both your Azure App registration and the `redirect\_path` parameter when configuring the AzureProvider.
* **Expose an API**: Configure your Application ID URI and define scopes
* Go to **Expose an API** in the App registration sidebar.
* Click **Set** next to “Application ID URI” and choose one of:
* Keep the default `api://{client\_id}`
* Set a custom value, following the supported formats (see [Identifier URI restrictions](https://learn.microsoft.com/en-us/entra/identity-platform/identifier-uri-restrictions))
* Click **Add a scope** and create a scope your app will require, for example:
* Scope name: `read` (or `write`, etc.)
* Admin consent display name/description: as appropriate for your org
* Who can consent: as needed (Admins only or Admins and users)
* **Configure Access Token Version**: Ensure your app uses access token v2
* Go to **Manifest** in the App registration sidebar.
* Find the `requestedAccessTokenVersion` property and set it to `2`:
```
`"api": {
"requestedAccessTokenVersion": 2
}
`
```
* Click **Save** at the top of the manifest editor.
Access token v2 is required for FastMCP’s Azure integration to work correctly. If this is not set, you may encounter authentication errors.
In FastMCP’s `AzureProvider`, set `identifier\_uri` to your Application ID URI (optional; defaults to `api://{client\_id}`) and set `required\_scopes` to the unprefixed scope names (e.g., `read`, `write`). During authorization, FastMCP automatically prefixes scopes with your `identifier\_uri`.
3
[
](#)
Create Client Secret
After registration, navigate to **Certificates & secrets** in your app’s settings.
* Click **“New client secret”**
* Add a description (e.g., “FastMCP Server”)
* Choose an expiration period
* Click **“Add”**
Copy the secret value immediately - it won’t be shown again! You’ll need to create a new secret if you lose it.
4
[
](#)
Note Your Credentials
From the **Overview** page of your app registration, note:
* **Application (client) ID**: A UUID like `835f09b6-0f0f-40cc-85cb-f32c5829a149`
* **Directory (tenant) ID**: A UUID like `08541b6e-646d-43de-a0eb-834e6713d6d5`
* **Client Secret**: The value you copied in the previous step
Store these credentials securely. Never commit them to version control. Use environment variables or a secrets manager in production.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `AzureProvider`, which handles Azure’s OAuth flow automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.azure import AzureProvider
# The AzureProvider handles Azure's token format and validation
auth\_provider = AzureProvider(
client\_id="835f09b6-0f0f-40cc-85cb-f32c5829a149", # Your Azure App Client ID
client\_secret="your-client-secret", # Your Azure App Client Secret
tenant\_id="08541b6e-646d-43de-a0eb-834e6713d6d5", # Your Azure Tenant ID (REQUIRED)
base\_url="http://localhost:8000", # Must match your App registration
required\_scopes=["your-scope"], # At least one scope REQUIRED - name of scope from your App
# identifier\_uri defaults to api://{client\_id}
# identifier\_uri="api://your-api-id",
# Optional: request additional upstream scopes in the authorize request
# additional\_authorize\_scopes=["User.Read", "offline\_access", "openid", "email"],
# redirect\_path="/auth/callback" # Default value, customize if needed
# base\_authority="login.microsoftonline.us" # For Azure Government (default: login.microsoftonline.com)
)
mcp = FastMCP(name="Azure Secured App", auth=auth\_provider)
# Add a protected tool to test authentication
@mcp.tool
async def get\_user\_info() -\> dict:
"""Returns information about the authenticated Azure user."""
from fastmcp.server.dependencies import get\_access\_token
token = get\_access\_token()
# The AzureProvider stores user data in token claims
return {
"azure\_id": token.claims.get("sub"),
"email": token.claims.get("email"),
"name": token.claims.get("name"),
"job\_title": token.claims.get("job\_title"),
"office\_location": token.claims.get("office\_location")
}
`
```
**Important**: The `tenant\_id` parameter is **REQUIRED**. Azure no longer supports using “common” for new applications due to security requirements. You must use one of:
* **Your specific tenant ID**: Found in Azure Portal (e.g., `08541b6e-646d-43de-a0eb-834e6713d6d5`)
* **“organizations”**: For work and school accounts only
* **“consumers”**: For personal Microsoft accounts only
Using your specific tenant ID is recommended for better security and control.
**Important**: The `required\_scopes` parameter is **REQUIRED** and must include at least one scope. Azure’s OAuth API requires the `scope` parameter in all authorization requests - you cannot authenticate without specifying at least one scope. Use the unprefixed scope names from your Azure App registration (e.g., `["read", "write"]`). These scopes must be created under **Expose an API** in your App registration.
###
[​
](#scope-handling)
Scope Handling
FastMCP automatically prefixes `required\_scopes` with your `identifier\_uri` (e.g., `api://your-client-id`) since these are your custom API scopes. Scopes in `additional\_authorize\_scopes` are sent as-is since they target external resources like Microsoft Graph.
**`required\_scopes`** — Your custom API scopes, defined in Azure “Expose an API”:
|You write|Sent to Azure|Validated on tokens|
|`mcp-read`|`api://xxx/mcp-read`|✓|
|`my.scope`|`api://xxx/my.scope`|✓|
|`openid`|`openid`|✗ (OIDC scope)|
|`api://xxx/read`|`api://xxx/read`|✓|
**`additional\_authorize\_scopes`** — External scopes (e.g., Microsoft Graph) for server-side use:
|You write|Sent to Azure|Validated on tokens|
|`User.Read`|`User.Read`|✗|
|`Mail.Send`|`Mail.Send`|✗|
**Why aren’t `additional\_authorize\_scopes` validated?** Azure issues separate tokens per resource. The access token FastMCP receives is for *your API*—Graph scopes aren’t in its `scp` claim. To call Graph APIs, your server uses the upstream Azure token in an on-behalf-of (OBO) flow.
OIDC scopes (`openid`, `profile`, `email`, `offline\_access`) are never prefixed and excluded from validation because Azure doesn’t include them in access token `scp` claims.
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
Your server is now running and protected by Azure OAuth authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your Azure-protected server:
test\_client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle Azure OAuth
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
# First-time connection will open Azure login in your browser
print("✓ Authenticated with Azure!")
# Test the protected tool
result = await client.call\_tool("get\_user\_info")
print(f"Azure user: {result['email']}")
print(f"Name: {result['name']}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to Microsoft’s authorization page
2. Sign in with your Microsoft account (work, school, or personal based on your tenant configuration)
3. Grant the requested permissions
4. After authorization, you’ll be redirected back
5. The client receives the token and can make authenticated requests
The client caches tokens locally, so you won’t need to re-authenticate for subsequent runs unless the token expires or you explicitly clear the cache.
##
[​
](#production-configuration)
Production Configuration
New in version `2.13.0`
For production deployments with persistent token management across server restarts, configure `jwt\_signing\_key` and `client\_storage`:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.azure import AzureProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
# Production setup with encrypted persistent token storage
auth\_provider = AzureProvider(
client\_id="835f09b6-0f0f-40cc-85cb-f32c5829a149",
client\_secret="your-client-secret",
tenant\_id="08541b6e-646d-43de-a0eb-834e6713d6d5",
base\_url="https://your-production-domain.com",
required\_scopes=["your-scope"],
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
mcp = FastMCP(name="Production Azure App", auth=auth\_provider)
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
Setting this environment variable allows the Azure provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.azure.AzureProvider` to use Azure authentication.
###
[​
](#azure-specific-configuration)
Azure-Specific Configuration
These environment variables provide default values for the Azure provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-azure-client-id)
FASTMCP\_SERVER\_AUTH\_AZURE\_CLIENT\_ID
required
Your Azure App registration Client ID (e.g., `835f09b6-0f0f-40cc-85cb-f32c5829a149`)
[​
](#param-fastmcp-server-auth-azure-client-secret)
FASTMCP\_SERVER\_AUTH\_AZURE\_CLIENT\_SECRET
required
Your Azure App registration Client Secret
[​
](#param-fastmcp-server-auth-azure-tenant-id)
FASTMCP\_SERVER\_AUTH\_AZURE\_TENANT\_ID
required
Your Azure tenant ID (specific ID, “organizations”, or “consumers”)
This is **REQUIRED**. Find your tenant ID in Azure Portal under Microsoft Entra ID → Overview.
[​
](#param-fastmcp-server-auth-azure-base-url)
FASTMCP\_SERVER\_AUTH\_AZURE\_BASE\_URL
default:"http://localhost:8000"
Public URL where OAuth endpoints will be accessible (includes any mount path)
[​
](#param-fastmcp-server-auth-azure-issuer-url)
FASTMCP\_SERVER\_AUTH\_AZURE\_ISSUER\_URL
default:"Uses BASE\_URL"
Issuer URL for OAuth metadata (defaults to `BASE\_URL`). Set to root-level URL when mounting under a path prefix to avoid 404 logs. See [HTTP Deployment guide](/v2/deployment/http#mounting-authenticated-servers) for details.
[​
](#param-fastmcp-server-auth-azure-redirect-path)
FASTMCP\_SERVER\_AUTH\_AZURE\_REDIRECT\_PATH
default:"/auth/callback"
Redirect path configured in your Azure App registration
[​
](#param-fastmcp-server-auth-azure-required-scopes)
FASTMCP\_SERVER\_AUTH\_AZURE\_REQUIRED\_SCOPES
required
Comma-, space-, or JSON-separated list of required scopes for your API (at least one scope required). These are validated on tokens and used as defaults if the client does not request specific scopes. Use unprefixed scope names from your Azure App registration (e.g., `read,write`).You can include standard OIDC scopes (`openid`, `profile`, `email`, `offline\_access`) in `required\_scopes`. FastMCP automatically handles them correctly: they’re sent to Azure unprefixed and excluded from token validation (since Azure doesn’t include OIDC scopes in access token `scp` claims).
Azure’s OAuth API requires the `scope` parameter - you must provide at least one scope.
[​
](#param-fastmcp-server-auth-azure-additional-authorize-scopes)
FASTMCP\_SERVER\_AUTH\_AZURE\_ADDITIONAL\_AUTHORIZE\_SCOPES
default:""
Comma-, space-, or JSON-separated list of additional scopes to include in the authorization request without prefixing. Use this to request upstream scopes such as Microsoft Graph permissions. These are not used for token validation.
[​
](#param-fastmcp-server-auth-azure-identifier-uri)
FASTMCP\_SERVER\_AUTH\_AZURE\_IDENTIFIER\_URI
default:"api://{client\_id}"
Application ID URI used to prefix scopes during authorization.
[​
](#param-fastmcp-server-auth-azure-base-authority)
FASTMCP\_SERVER\_AUTH\_AZURE\_BASE\_AUTHORITY
default:"login.microsoftonline.com"
Azure authority base URL. Override this to use Azure Government:
* `login.microsoftonline.com` - Azure Public Cloud (default)
* `login.microsoftonline.us` - Azure Government
This setting affects all Azure OAuth endpoints (authorization, token, issuer, JWKS).
Example `.env` file:
```
`# Use the Azure provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.azure.AzureProvider
# Azure OAuth credentials
FASTMCP\_SERVER\_AUTH\_AZURE\_CLIENT\_ID=835f09b6-0f0f-40cc-85cb-f32c5829a149
FASTMCP\_SERVER\_AUTH\_AZURE\_CLIENT\_SECRET=your-client-secret-here
FASTMCP\_SERVER\_AUTH\_AZURE\_TENANT\_ID=08541b6e-646d-43de-a0eb-834e6713d6d5
FASTMCP\_SERVER\_AUTH\_AZURE\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_AZURE\_REQUIRED\_SCOPES=read,write
# Optional custom API configuration
# FASTMCP\_SERVER\_AUTH\_AZURE\_IDENTIFIER\_URI=api://your-api-id
# Request additional upstream scopes (optional)
# FASTMCP\_SERVER\_AUTH\_AZURE\_ADDITIONAL\_AUTHORIZE\_SCOPES=User.Read,Mail.Read
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
# Authentication is automatically configured from environment
mcp = FastMCP(name="Azure Secured App")
@mcp.tool
async def protected\_tool(query: str) -\> str:
"""A tool that requires Azure authentication to access."""
# Your tool implementation here
return f"Processing authenticated request: {query}"
`
```