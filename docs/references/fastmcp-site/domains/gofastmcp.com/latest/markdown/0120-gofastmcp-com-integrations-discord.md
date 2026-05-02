Discord OAuth 🤝 FastMCP - FastMCP
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
New in version `2.13.2`
This guide shows you how to secure your FastMCP server using **Discord OAuth**. Since Discord doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/servers/auth/oauth-proxy) pattern to bridge Discord’s traditional OAuth with MCP’s authentication requirements.
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
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/servers/auth/oauth-proxy#configuration-parameters).