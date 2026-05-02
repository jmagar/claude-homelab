GitHub OAuth 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using **GitHub OAuth**. Since GitHub doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/v2/servers/auth/oauth-proxy) pattern to bridge GitHub’s traditional OAuth with MCP’s authentication requirements.
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
Setting this environment variable allows the GitHub provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.github.GitHubProvider` to use GitHub authentication.
###
[​
](#github-specific-configuration)
GitHub-Specific Configuration
These environment variables provide default values for the GitHub provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-github-client-id)
FASTMCP\_SERVER\_AUTH\_GITHUB\_CLIENT\_ID
required
Your GitHub OAuth App Client ID (e.g., `Ov23liAbcDefGhiJkLmN`)
[​
](#param-fastmcp-server-auth-github-client-secret)
FASTMCP\_SERVER\_AUTH\_GITHUB\_CLIENT\_SECRET
required
Your GitHub OAuth App Client Secret
[​
](#param-fastmcp-server-auth-github-base-url)
FASTMCP\_SERVER\_AUTH\_GITHUB\_BASE\_URL
default:"http://localhost:8000"
Public URL where OAuth endpoints will be accessible (includes any mount path)
[​
](#param-fastmcp-server-auth-github-issuer-url)
FASTMCP\_SERVER\_AUTH\_GITHUB\_ISSUER\_URL
default:"Uses BASE\_URL"
Issuer URL for OAuth metadata (defaults to `BASE\_URL`). Set to root-level URL when mounting under a path prefix to avoid 404 logs. See [HTTP Deployment guide](/v2/deployment/http#mounting-authenticated-servers) for details.
[​
](#param-fastmcp-server-auth-github-redirect-path)
FASTMCP\_SERVER\_AUTH\_GITHUB\_REDIRECT\_PATH
default:"/auth/callback"
Redirect path configured in your GitHub OAuth App
[​
](#param-fastmcp-server-auth-github-required-scopes)
FASTMCP\_SERVER\_AUTH\_GITHUB\_REQUIRED\_SCOPES
default:"[\\"user\\"]"
Comma-, space-, or JSON-separated list of required GitHub scopes (e.g., `user repo` or `["user","repo"]`)
[​
](#param-fastmcp-server-auth-github-timeout-seconds)
FASTMCP\_SERVER\_AUTH\_GITHUB\_TIMEOUT\_SECONDS
default:"10"
HTTP request timeout for GitHub API calls
Example `.env` file:
```
`# Use the GitHub provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.github.GitHubProvider
# GitHub OAuth credentials
FASTMCP\_SERVER\_AUTH\_GITHUB\_CLIENT\_ID=Ov23liAbcDefGhiJkLmN
FASTMCP\_SERVER\_AUTH\_GITHUB\_CLIENT\_SECRET=github\_pat\_...
FASTMCP\_SERVER\_AUTH\_GITHUB\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_GITHUB\_REQUIRED\_SCOPES=user,repo
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
# Authentication is automatically configured from environment
mcp = FastMCP(name="GitHub Secured App")
@mcp.tool
async def list\_repos() -\> list[str]:
"""List the authenticated user's repositories."""
# Your tool implementation here
pass
`
```