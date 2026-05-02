Auth0 OAuth 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using **Auth0 OAuth**. While Auth0 does have support for Dynamic Client Registration, it is not enabled by default so this integration uses the [**OIDC Proxy**](/servers/auth/oidc-proxy) pattern to bridge Auth0’s dynamic OIDC configuration with MCP’s authentication requirements.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. An **[Auth0 Account](https://auth0.com/)** with access to create Applications
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-create-an-auth0-application)
Step 1: Create an Auth0 Application
Create an Application in your Auth0 settings to get the credentials needed for authentication:
1
[
](#)
Navigate to Applications
Go to **Applications → Applications** in your Auth0 account.Click **”+ Create Application”** to create a new application.
2
[
](#)
Create Your Application
* **Name**: Choose a name users will recognize (e.g., “My FastMCP Server”)
* **Choose an application type**: Choose “Single Page Web Applications”
* Click **Create** to create the application
3
[
](#)
Configure Your Application
Select the “Settings” tab for your application, then find the “Application URIs” section.
* **Allowed Callback URLs**: Your server URL + `/auth/callback` (e.g., `http://localhost:8000/auth/callback`)
* Click **Save** to save your changes
The callback URL must match exactly. The default path is `/auth/callback`, but you can customize it using the `redirect\_path` parameter.
If you want to use a custom callback path (e.g., `/auth/auth0/callback`), make sure to set the same path in both your Auth0 Application settings and the `redirect\_path` parameter when configuring the Auth0Provider.
4
[
](#)
Save Your Credentials
After creating the app, in the “Basic Information” section you’ll see:
* **Client ID**: A public identifier like `tv2ObNgaZAWWhhycr7Bz1LU2mxlnsmsB`
* **Client Secret**: A private hidden value that should always be stored securely
Store these credentials securely. Never commit them to version control. Use environment variables or a secrets manager in production.
5
[
](#)
Select Your Audience
Go to **Applications → APIs** in your Auth0 account.
* Find the API that you want to use for your application
* **API Audience**: A URL that uniquely identifies the API
Store this along with of the credentials above. Never commit this to version control. Use environment variables or a secrets manager in production.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `Auth0Provider`.
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.auth0 import Auth0Provider
# The Auth0Provider utilizes Auth0 OIDC configuration
auth\_provider = Auth0Provider(
config\_url="https://.../.well-known/openid-configuration", # Your Auth0 configuration URL
client\_id="tv2ObNgaZAWWhhycr7Bz1LU2mxlnsmsB", # Your Auth0 application Client ID
client\_secret="vPYqbjemq...", # Your Auth0 application Client Secret
audience="https://...", # Your Auth0 API audience
base\_url="http://localhost:8000", # Must match your application configuration
# redirect\_path="/auth/callback" # Default value, customize if needed
)
mcp = FastMCP(name="Auth0 Secured App", auth=auth\_provider)
# Add a protected tool to test authentication
@mcp.tool
async def get\_token\_info() -\> dict:
"""Returns information about the Auth0 token."""
from fastmcp.server.dependencies import get\_access\_token
token = get\_access\_token()
return {
"issuer": token.claims.get("iss"),
"audience": token.claims.get("aud"),
"scope": token.claims.get("scope")
}
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
Your server is now running and protected by Auth0 authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your Auth0-protected server:
test\_client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle Auth0 OAuth flows
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
# First-time connection will open Auth0 login in your browser
print("✓ Authenticated with Auth0!")
# Test the protected tool
result = await client.call\_tool("get\_token\_info")
print(f"Auth0 audience: {result['audience']}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to Auth0’s authorization page
2. After you authorize the app, you’ll be redirected back
3. The client receives the token and can make authenticated requests
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
from fastmcp.server.auth.providers.auth0 import Auth0Provider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
# Production setup with encrypted persistent token storage
auth\_provider = Auth0Provider(
config\_url="https://.../.well-known/openid-configuration",
client\_id="tv2ObNgaZAWWhhycr7Bz1LU2mxlnsmsB",
client\_secret="vPYqbjemq...",
audience="https://...",
base\_url="https://your-production-domain.com",
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
mcp = FastMCP(name="Production Auth0 App", auth=auth\_provider)
`
```
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/servers/auth/oauth-proxy#configuration-parameters).
The client caches tokens locally, so you won’t need to re-authenticate for subsequent runs unless the token expires or you explicitly clear the cache.