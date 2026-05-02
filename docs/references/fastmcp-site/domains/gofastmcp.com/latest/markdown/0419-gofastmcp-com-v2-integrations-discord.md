Discord OAuth 🤝 FastMCP - FastMCP
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
New in version `2.13.2`
This guide shows you how to secure your FastMCP server using **Discord OAuth**. Since Discord doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/v2/servers/auth/oauth-proxy) pattern to bridge Discord’s traditional OAuth with MCP’s authentication requirements.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A **[Discord Account](https://discord.com/)** with access to create applications
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-create-a-discord-application)
Step 1: Create a Discord Application
Create an application in the Discord Developer Portal to get the credentials needed for authentication:
1
[
](#)
Navigate to Discord Developer Portal
Go to the [Discord Developer Portal](https://discord.com/developers/applications).Click **“New Application”** and give it a name users will recognize (e.g., “My FastMCP Server”).
2
[
](#)
Configure OAuth2 Settings
In the left sidebar, click **“OAuth2”**.In the **Redirects** section, click **“Add Redirect”** and enter your callback URL:
* For development: `http://localhost:8000/auth/callback`
* For production: `https://your-domain.com/auth/callback`
The redirect URL must match exactly. The default path is `/auth/callback`, but you can customize it using the `redirect\_path` parameter. Discord allows `http://localhost` URLs for development. For production, use HTTPS.
3
[
](#)
Save Your Credentials
On the same OAuth2 page, you’ll find:
* **Client ID**: A numeric string like `12345`
* **Client Secret**: Click “Reset Secret” to generate one
Store these credentials securely. Never commit them to version control. Use environment variables or a secrets manager in production.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `DiscordProvider`, which handles Discord’s OAuth flow automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.discord import DiscordProvider
auth\_provider = DiscordProvider(
client\_id="12345", # Your Discord Application Client ID
client\_secret="your-client-secret", # Your Discord OAuth Client Secret
base\_url="http://localhost:8000", # Must match your OAuth configuration
)
mcp = FastMCP(name="Discord Secured App", auth=auth\_provider)
@mcp.tool
async def get\_user\_info() -\> dict:
"""Returns information about the authenticated Discord user."""
from fastmcp.server.dependencies import get\_access\_token
token = get\_access\_token()
return {
"discord\_id": token.claims.get("sub"),
"username": token.claims.get("username"),
"avatar": token.claims.get("avatar"),
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
Your server is now running and protected by Discord OAuth authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your Discord-protected server:
test\_client.py
```
`from fastmcp import Client
import asyncio
async def main():
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
print("✓ Authenticated with Discord!")
result = await client.call\_tool("get\_user\_info")
print(f"Discord user: {result['username']}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to Discord’s authorization page
2. Sign in with your Discord account and authorize the app
3. After authorization, you’ll be redirected back
4. The client receives the token and can make authenticated requests
The client caches tokens locally, so you won’t need to re-authenticate for subsequent runs unless the token expires or you explicitly clear the cache.
##
[​
](#discord-scopes)
Discord Scopes
Discord OAuth supports several scopes for accessing different types of user data:
|Scope|Description|
|`identify`|Access username, avatar, and discriminator (default)|
|`email`|Access the user’s email address|
|`guilds`|Access the user’s list of servers|
|`guilds.join`|Ability to add the user to a server|
To request additional scopes:
```
`auth\_provider = DiscordProvider(
client\_id="...",
client\_secret="...",
base\_url="http://localhost:8000",
required\_scopes=["identify", "email"],
)
`
```
##
[​
](#production-configuration)
Production Configuration
For production deployments with persistent token management across server restarts, configure `jwt\_signing\_key` and `client\_storage`:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.discord import DiscordProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
auth\_provider = DiscordProvider(
client\_id="12345",
client\_secret=os.environ["DISCORD\_CLIENT\_SECRET"],
base\_url="https://your-production-domain.com",
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
client\_storage=FernetEncryptionWrapper(
key\_value=RedisStore(
host=os.environ["REDIS\_HOST"],
port=int(os.environ["REDIS\_PORT"])
),
fernet=Fernet(os.environ["STORAGE\_ENCRYPTION\_KEY"])
)
)
mcp = FastMCP(name="Production Discord App", auth=auth\_provider)
`
```
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/v2/servers/auth/oauth-proxy#configuration-parameters).
##
[​
](#environment-variables)
Environment Variables
For production deployments, use environment variables instead of hardcoding credentials.
###
[​
](#provider-selection)
Provider Selection
Setting this environment variable allows the Discord provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.discord.DiscordProvider` to use Discord authentication.
###
[​
](#discord-specific-configuration)
Discord-Specific Configuration
These environment variables provide default values for the Discord provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-discord-client-id)
FASTMCP\_SERVER\_AUTH\_DISCORD\_CLIENT\_ID
required
Your Discord Application Client ID (e.g., `12345`)
[​
](#param-fastmcp-server-auth-discord-client-secret)
FASTMCP\_SERVER\_AUTH\_DISCORD\_CLIENT\_SECRET
required
Your Discord OAuth Client Secret
[​
](#param-fastmcp-server-auth-discord-base-url)
FASTMCP\_SERVER\_AUTH\_DISCORD\_BASE\_URL
default:"http://localhost:8000"
Public URL where OAuth endpoints will be accessible (includes any mount path)
[​
](#param-fastmcp-server-auth-discord-issuer-url)
FASTMCP\_SERVER\_AUTH\_DISCORD\_ISSUER\_URL
default:"Uses BASE\_URL"
Issuer URL for OAuth metadata (defaults to `BASE\_URL`). Set to root-level URL when mounting under a path prefix to avoid 404 logs. See [HTTP Deployment guide](/v2/deployment/http#mounting-authenticated-servers) for details.
[​
](#param-fastmcp-server-auth-discord-redirect-path)
FASTMCP\_SERVER\_AUTH\_DISCORD\_REDIRECT\_PATH
default:"/auth/callback"
Redirect path configured in your Discord OAuth settings
[​
](#param-fastmcp-server-auth-discord-required-scopes)
FASTMCP\_SERVER\_AUTH\_DISCORD\_REQUIRED\_SCOPES
default:"[\\"identify\\"]"
Comma-, space-, or JSON-separated list of required Discord scopes (e.g., `identify,email` or `["identify","email"]`)
[​
](#param-fastmcp-server-auth-discord-timeout-seconds)
FASTMCP\_SERVER\_AUTH\_DISCORD\_TIMEOUT\_SECONDS
default:"10"
HTTP request timeout for Discord API calls
Example `.env` file:
```
`FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.discord.DiscordProvider
FASTMCP\_SERVER\_AUTH\_DISCORD\_CLIENT\_ID=12345
FASTMCP\_SERVER\_AUTH\_DISCORD\_CLIENT\_SECRET=your-client-secret
FASTMCP\_SERVER\_AUTH\_DISCORD\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_DISCORD\_REQUIRED\_SCOPES=identify,email
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
mcp = FastMCP(name="Discord Secured App")
@mcp.tool
async def protected\_tool(query: str) -\> str:
"""A tool that requires Discord authentication to access."""
return f"Processing authenticated request: {query}"
`
```