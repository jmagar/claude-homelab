Google OAuth 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using **Google OAuth**. Since Google doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/v2/servers/auth/oauth-proxy) pattern to bridge Google’s traditional OAuth with MCP’s authentication requirements.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A **[Google Cloud Account](https://console.cloud.google.com/)** with access to create OAuth 2.0 Client IDs
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-create-a-google-oauth-2-0-client-id)
Step 1: Create a Google OAuth 2.0 Client ID
Create an OAuth 2.0 Client ID in your Google Cloud Console to get the credentials needed for authentication:
1
[
](#)
Navigate to OAuth Consent Screen
Go to the [Google Cloud Console](https://console.cloud.google.com/apis/credentials) and select your project (or create a new one).First, configure the OAuth consent screen by navigating to **APIs & Services → OAuth consent screen**. Choose “External” for testing or “Internal” for G Suite organizations.
2
[
](#)
Create OAuth 2.0 Client ID
Navigate to **APIs & Services → Credentials** and click **”+ CREATE CREDENTIALS”** → **“OAuth client ID”**.Configure your OAuth client:
* **Application type**: Web application
* **Name**: Choose a descriptive name (e.g., “FastMCP Server”)
* **Authorized JavaScript origins**: Add your server’s base URL (e.g., `http://localhost:8000`)
* **Authorized redirect URIs**: Add your server URL + `/auth/callback` (e.g., `http://localhost:8000/auth/callback`)
The redirect URI must match exactly. The default path is `/auth/callback`, but you can customize it using the `redirect\_path` parameter. For local development, Google allows `http://localhost` URLs with various ports. For production, you must use HTTPS.
If you want to use a custom callback path (e.g., `/auth/google/callback`), make sure to set the same path in both your Google OAuth Client settings and the `redirect\_path` parameter when configuring the GoogleProvider.
3
[
](#)
Save Your Credentials
After creating the client, you’ll receive:
* **Client ID**: A string ending in `.apps.googleusercontent.com`
* **Client Secret**: A string starting with `GOCSPX-`
Download the JSON credentials or copy these values securely.
Store these credentials securely. Never commit them to version control. Use environment variables or a secrets manager in production.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `GoogleProvider`, which handles Google’s OAuth flow automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.google import GoogleProvider
# The GoogleProvider handles Google's token format and validation
auth\_provider = GoogleProvider(
client\_id="123456789.apps.googleusercontent.com", # Your Google OAuth Client ID
client\_secret="GOCSPX-abc123...", # Your Google OAuth Client Secret
base\_url="http://localhost:8000", # Must match your OAuth configuration
required\_scopes=[ # Request user information
"openid",
"https://www.googleapis.com/auth/userinfo.email",
],
# redirect\_path="/auth/callback" # Default value, customize if needed
)
mcp = FastMCP(name="Google Secured App", auth=auth\_provider)
# Add a protected tool to test authentication
@mcp.tool
async def get\_user\_info() -\> dict:
"""Returns information about the authenticated Google user."""
from fastmcp.server.dependencies import get\_access\_token
token = get\_access\_token()
# The GoogleProvider stores user data in token claims
return {
"google\_id": token.claims.get("sub"),
"email": token.claims.get("email"),
"name": token.claims.get("name"),
"picture": token.claims.get("picture"),
"locale": token.claims.get("locale")
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
Your server is now running and protected by Google OAuth authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with your Google-protected server:
test\_client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle Google OAuth
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
# First-time connection will open Google login in your browser
print("✓ Authenticated with Google!")
# Test the protected tool
result = await client.call\_tool("get\_user\_info")
print(f"Google user: {result['email']}")
print(f"Name: {result['name']}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to Google’s authorization page
2. Sign in with your Google account and grant the requested permissions
3. After authorization, you’ll be redirected back
4. The client receives the token and can make authenticated requests
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
from fastmcp.server.auth.providers.google import GoogleProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
# Production setup with encrypted persistent token storage
auth\_provider = GoogleProvider(
client\_id="123456789.apps.googleusercontent.com",
client\_secret="GOCSPX-abc123...",
base\_url="https://your-production-domain.com",
required\_scopes=["openid", "https://www.googleapis.com/auth/userinfo.email"],
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
mcp = FastMCP(name="Production Google App", auth=auth\_provider)
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
Setting this environment variable allows the Google provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.google.GoogleProvider` to use Google authentication.
###
[​
](#google-specific-configuration)
Google-Specific Configuration
These environment variables provide default values for the Google provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-google-client-id)
FASTMCP\_SERVER\_AUTH\_GOOGLE\_CLIENT\_ID
required
Your Google OAuth 2.0 Client ID (e.g., `123456789.apps.googleusercontent.com`)
[​
](#param-fastmcp-server-auth-google-client-secret)
FASTMCP\_SERVER\_AUTH\_GOOGLE\_CLIENT\_SECRET
required
Your Google OAuth 2.0 Client Secret (e.g., `GOCSPX-abc123...`)
[​
](#param-fastmcp-server-auth-google-base-url)
FASTMCP\_SERVER\_AUTH\_GOOGLE\_BASE\_URL
default:"http://localhost:8000"
Public URL where OAuth endpoints will be accessible (includes any mount path)
[​
](#param-fastmcp-server-auth-google-issuer-url)
FASTMCP\_SERVER\_AUTH\_GOOGLE\_ISSUER\_URL
default:"Uses BASE\_URL"
Issuer URL for OAuth metadata (defaults to `BASE\_URL`). Set to root-level URL when mounting under a path prefix to avoid 404 logs. See [HTTP Deployment guide](/v2/deployment/http#mounting-authenticated-servers) for details.
[​
](#param-fastmcp-server-auth-google-redirect-path)
FASTMCP\_SERVER\_AUTH\_GOOGLE\_REDIRECT\_PATH
default:"/auth/callback"
Redirect path configured in your Google OAuth Client
[​
](#param-fastmcp-server-auth-google-required-scopes)
FASTMCP\_SERVER\_AUTH\_GOOGLE\_REQUIRED\_SCOPES
default:"[]"
Comma-, space-, or JSON-separated list of required Google scopes (e.g., `"openid,https://www.googleapis.com/auth/userinfo.email"` or `["openid", "https://www.googleapis.com/auth/userinfo.email"]`)
[​
](#param-fastmcp-server-auth-google-timeout-seconds)
FASTMCP\_SERVER\_AUTH\_GOOGLE\_TIMEOUT\_SECONDS
default:"10"
HTTP request timeout for Google API calls
Example `.env` file:
```
`# Use the Google provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.google.GoogleProvider
# Google OAuth credentials
FASTMCP\_SERVER\_AUTH\_GOOGLE\_CLIENT\_ID=123456789.apps.googleusercontent.com
FASTMCP\_SERVER\_AUTH\_GOOGLE\_CLIENT\_SECRET=GOCSPX-abc123...
FASTMCP\_SERVER\_AUTH\_GOOGLE\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_GOOGLE\_REQUIRED\_SCOPES=openid,https://www.googleapis.com/auth/userinfo.email
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
# Authentication is automatically configured from environment
mcp = FastMCP(name="Google Secured App")
@mcp.tool
async def protected\_tool(query: str) -\> str:
"""A tool that requires Google authentication to access."""
# Your tool implementation here
return f"Processing authenticated request: {query}"
`
```