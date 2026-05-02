Azure (Microsoft Entra ID) OAuth 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using **Azure OAuth** (Microsoft Entra ID). Since Azure doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/servers/auth/oauth-proxy) pattern to bridge Azure’s traditional OAuth with MCP’s authentication requirements. FastMCP validates Azure JWTs against your application’s client\_id.
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
# additional\_authorize\_scopes=["User.Read", "openid", "email"],
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
`offline\_access` is automatically included to obtain refresh tokens. FastMCP manages token refreshing automatically.
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
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/servers/auth/oauth-proxy#configuration-parameters).
##
[​
](#token-verification-only-managed-identity)
Token Verification Only (Managed Identity)
New in version `2.15.0`
For deployments where your server only needs to **validate incoming tokens** — such as Azure Container Apps with Managed Identity — use `AzureJWTVerifier` with `RemoteAuthProvider` instead of the full `AzureProvider`.
This pattern is ideal when:
* Your infrastructure handles authentication (e.g., Managed Identity)
* You don’t need the OAuth proxy flow (no `client\_secret` required)
* You just need to verify that incoming Azure AD tokens are valid
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth import RemoteAuthProvider
from fastmcp.server.auth.providers.azure import AzureJWTVerifier
from pydantic import AnyHttpUrl
tenant\_id = "your-tenant-id"
client\_id = "your-client-id"
# AzureJWTVerifier auto-configures JWKS, issuer, and audience
verifier = AzureJWTVerifier(
client\_id=client\_id,
tenant\_id=tenant\_id,
required\_scopes=["access\_as\_user"], # Scope names from Azure Portal
)
auth = RemoteAuthProvider(
token\_verifier=verifier,
authorization\_servers=[
AnyHttpUrl(f"https://login.microsoftonline.com/{tenant\_id}/v2.0")
],
base\_url="https://your-container-app.azurecontainerapps.io",
)
mcp = FastMCP(name="Azure MI App", auth=auth)
`
```
`AzureJWTVerifier` handles Azure’s scope format automatically. You write scope names exactly as they appear in Azure Portal under **Expose an API** (e.g., `access\_as\_user`). The verifier validates tokens using the short-form scopes that Azure puts in the `scp` claim, while advertising the full URI scopes (e.g., `api://your-client-id/access\_as\_user`) in OAuth metadata so MCP clients know what to request.
For Azure Government, pass `base\_authority="login.microsoftonline.us"` to `AzureJWTVerifier`.
##
[​
](#on-behalf-of-obo)
On-Behalf-Of (OBO)
New in version `3.0.0`
The On-Behalf-Of (OBO) flow allows your FastMCP server to call downstream Microsoft APIs—like Microsoft Graph—using the authenticated user’s identity. When a user authenticates to your MCP server, you receive a token for your API. OBO exchanges that token for a new token that can call other services, maintaining the user’s identity and permissions throughout the chain.
This pattern is useful when your tools need to access user-specific data from Microsoft services: reading emails, accessing calendar events, querying SharePoint, or any other Graph API operation that requires user context.
OBO features require the `azure` extra:
```
`pip install 'fastmcp[azure]'
`
```
###
[​
](#azure-portal-setup)
Azure Portal Setup
OBO requires additional configuration in your Azure App registration beyond basic authentication.
1
[
](#)
Add API Permissions
In your App registration, navigate to **API permissions** and add the Microsoft Graph permissions your tools will need.
* Click **Add a permission** → **Microsoft Graph** → **Delegated permissions**
* Select the permissions required for your use case (e.g., `Mail.Read`, `Calendars.Read`, `User.Read`)
* Repeat for any other APIs you need to call
Only add delegated permissions for OBO. Application permissions bypass user context entirely and are inappropriate for the OBO flow.
2
[
](#)
Grant Admin Consent
OBO requires admin consent for the permissions you’ve added. In the **API permissions** page, click **Grant admin consent for [Your Organization]**.Without admin consent, OBO token exchanges will fail with an `AADSTS65001` error indicating the user or administrator hasn’t consented to use the application.
For development, you can grant consent for just your own account. For production, an Azure AD administrator must grant tenant-wide consent.
###
[​
](#configure-azureprovider-for-obo)
Configure AzureProvider for OBO
The `additional\_authorize\_scopes` parameter tells Azure which downstream API permissions to include during the initial authorization. These scopes establish what your server can request through OBO later.
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.azure import AzureProvider
auth\_provider = AzureProvider(
client\_id="your-client-id",
client\_secret="your-client-secret",
tenant\_id="your-tenant-id",
base\_url="http://localhost:8000",
required\_scopes=["mcp-access"], # Your API scope
# Include Graph scopes for OBO
additional\_authorize\_scopes=[
"https://graph.microsoft.com/Mail.Read",
"https://graph.microsoft.com/User.Read",
"offline\_access", # Enables refresh tokens
],
)
mcp = FastMCP(name="Graph-Enabled Server", auth=auth\_provider)
`
```
Scopes listed in `additional\_authorize\_scopes` are requested during the initial OAuth flow but aren’t validated on incoming tokens. They establish permission for your server to later exchange the user’s token for downstream API access.
Use fully-qualified scope URIs for downstream APIs (e.g., `https://graph.microsoft.com/Mail.Read`). Short forms like `Mail.Read` work for authorization requests, but fully-qualified URIs are clearer and avoid ambiguity.
###
[​
](#entraobotoken-dependency)
EntraOBOToken Dependency
The `EntraOBOToken` dependency handles the complete OBO flow automatically. Declare it as a parameter default with the scopes you need, and FastMCP exchanges the user’s token for a downstream API token before your function runs.
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.azure import AzureProvider, EntraOBOToken
import httpx
auth\_provider = AzureProvider(
client\_id="your-client-id",
client\_secret="your-client-secret",
tenant\_id="your-tenant-id",
base\_url="http://localhost:8000",
required\_scopes=["mcp-access"],
additional\_authorize\_scopes=[
"https://graph.microsoft.com/Mail.Read",
"https://graph.microsoft.com/User.Read",
],
)
mcp = FastMCP(name="Email Reader", auth=auth\_provider)
@mcp.tool
async def get\_recent\_emails(
count: int = 10,
graph\_token: str = EntraOBOToken(["https://graph.microsoft.com/Mail.Read"]),
) -\> list[dict]:
"""Get the user's recent emails from Microsoft Graph."""
async with httpx.AsyncClient() as client:
response = await client.get(
f"https://graph.microsoft.com/v1.0/me/messages?$top={count}",
headers={"Authorization": f"Bearer {graph\_token}"},
)
response.raise\_for\_status()
data = response.json()
return [
{"subject": msg["subject"], "from": msg["from"]["emailAddress"]["address"]}
for msg in data.get("value", [])
]
`
```
The `graph\_token` parameter receives a ready-to-use access token for Microsoft Graph. FastMCP handles the OBO exchange transparently—your function just uses the token to call the API.
**Scope alignment is critical.** The scopes passed to `EntraOBOToken` must be a subset of the scopes in `additional\_authorize\_scopes`. If you request a scope during OBO that wasn’t included in the initial authorization, the exchange will fail.
For advanced OBO scenarios, use `CurrentAccessToken()` to get the user’s token, then construct an `azure.identity.aio.OnBehalfOfCredential` directly with your Azure credentials.
For a complete working example of Azure OBO with FastMCP, see [Pamela Fox’s blog post on OBO flow for Entra-based MCP servers](https://blog.pamelafox.org/2026/01/using-on-behalf-of-flow-for-entra-based.html).