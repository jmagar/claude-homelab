GitHub OAuth 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using **GitHub OAuth**. Since GitHub doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/servers/auth/oauth-proxy) pattern to bridge GitHub’s traditional OAuth with MCP’s authentication requirements.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A **[GitHub Account](https://github.com/)** with access to create OAuth Apps
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-create-a-github-oauth-app)
Step 1: Create a GitHub OAuth App
Create an OAuth App in your GitHub settings to get the credentials needed for authentication:
1
[
](#)
Navigate to OAuth Apps
Go to **Settings → Developer settings → OAuth Apps** in your GitHub account, or visit [github.com/settings/developers](https://github.com/settings/developers).Click **“New OAuth App”** to create a new application.
2
[
](#)
Configure Your OAuth App
Fill in the application details:
* **Application name**: Choose a name users will recognize (e.g., “My FastMCP Server”)
* **Homepage URL**: Your application’s homepage or documentation URL
* **Authorization callback URL**: Your server URL + `/auth/callback` (e.g., `http://localhost:8000/auth/callback`)
The callback URL must match exactly. The default path is `/auth/callback`, but you can customize it using the `redirect\_path` parameter. For local development, GitHub allows `http://localhost` URLs. For production, you must use HTTPS.
If you want to use a custom callback path (e.g., `/auth/github/callback`), make sure to set the same path in both your GitHub OAuth App settings and the `redirect\_path` parameter when configuring the GitHubProvider.
3
[
](#)
Save Your Credentials
After creating the app, you’ll see:
* **Client ID**: A public identifier like `Ov23liAbcDefGhiJkLmN`
* **Client Secret**: Click “Generate a new client secret” and save the value securely
Store these credentials securely. Never commit them to version control. Use environment variables or a secrets manager in production.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `GitHubProvider`, which handles GitHub’s OAuth quirks automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.github import GitHubProvider
# The GitHubProvider handles GitHub's token format and validation
auth\_provider = GitHubProvider(
client\_id="Ov23liAbcDefGhiJkLmN", # Your GitHub OAuth App Client ID
client\_secret="github\_pat\_...", # Your GitHub OAuth App Client Secret
base\_url="http://localhost:8000", # Must match your OAuth App configuration
# redirect\_path="/auth/callback" # Default value, customize if needed
)
mcp = FastMCP(name="GitHub Secured App", auth=auth\_provider)
# Add a protected tool to test authentication
@mcp.tool
async def get\_user\_info() -\> dict:
"""Returns information about the authenticated GitHub user."""
from fastmcp.server.dependencies import get\_access\_token
token = get\_access\_token()
# The GitHubProvider stores user data in token claims
return {
"github\_user": token.claims.get("login"),
"name": token.claims.get("name"),
"email": token.claims.get("email")
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
Your server is now running and protected by GitHub OAuth authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your GitHub-protected server:
test\_client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle GitHub OAuth
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
# First-time connection will open GitHub login in your browser
print("✓ Authenticated with GitHub!")
# Test the protected tool
result = await client.call\_tool("get\_user\_info")
print(f"GitHub user: {result['github\_user']}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to GitHub’s authorization page
2. After you authorize the app, you’ll be redirected back
3. The client receives the token and can make authenticated requests
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
from fastmcp.server.auth.providers.github import GitHubProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
# Production setup with encrypted persistent token storage
auth\_provider = GitHubProvider(
client\_id="Ov23liAbcDefGhiJkLmN",
client\_secret="github\_pat\_...",
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
mcp = FastMCP(name="Production GitHub App", auth=auth\_provider)
`
```
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/servers/auth/oauth-proxy#configuration-parameters).