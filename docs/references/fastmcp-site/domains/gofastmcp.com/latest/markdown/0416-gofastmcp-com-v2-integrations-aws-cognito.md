AWS Cognito OAuth 🤝 FastMCP - FastMCP
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
New in version `2.12.4`
This guide shows you how to secure your FastMCP server using **AWS Cognito user pools**. Since AWS Cognito doesn’t support Dynamic Client Registration, this integration uses the [**OAuth Proxy**](/v2/servers/auth/oauth-proxy) pattern to bridge AWS Cognito’s traditional OAuth with MCP’s authentication requirements. It also includes robust JWT token validation, ensuring enterprise-grade authentication.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. An **[AWS Account](https://aws.amazon.com/)** with access to create AWS Cognito user pools
2. Basic familiarity with AWS Cognito concepts (user pools, app clients)
3. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`)
###
[​
](#step-1-create-an-aws-cognito-user-pool-and-app-client)
Step 1: Create an AWS Cognito User Pool and App Client
Set up AWS Cognito user pool with an app client to get the credentials needed for authentication:
1
[
](#)
Navigate to AWS Cognito
Go to the **[AWS Cognito Console](https://console.aws.amazon.com/cognito/)** and ensure you’re in your desired AWS region.Select **“User pools”** from the side navigation (click on the hamburger icon at the top left in case you don’t see any), and click **“Create user pool”** to create a new user pool.
2
[
](#)
Define Your Application
AWS Cognito now provides a streamlined setup experience:
1. **Application type**: Select **“Traditional web application”** (this is the correct choice for FastMCP server-side authentication)
2. **Name your application**: Enter a descriptive name (e.g., `FastMCP Server`)
The traditional web application type automatically configures:
* Server-side authentication with client secrets
* Authorization code grant flow
* Appropriate security settings for confidential clients
Choose “Traditional web application” rather than SPA, Mobile app, or Machine-to-machine options. This ensures proper OAuth 2.0 configuration for FastMCP.
3
[
](#)
Configure Options
AWS will guide you through configuration options:
* **Sign-in identifiers**: Choose how users will sign in (email, username, or phone)
* **Required attributes**: Select any additional user information you need
* **Return URL**: Add your callback URL (e.g., `http://localhost:8000/auth/callback` for development)
The simplified interface handles most OAuth security settings automatically based on your application type selection.
4
[
](#)
Review and Create
Review your configuration and click **“Create user pool”**.After creation, you’ll see your user pool details. Save these important values:
* **User pool ID** (format: `eu-central-1\_XXXXXXXXX`)
* **Client ID** (found under → “Applications” → “App clients” in the side navigation → \<Your application name, e.g., `FastMCP Server`\> → “App client information”)
* **Client Secret** (found under → “Applications” → “App clients” in the side navigation → \<Your application name, e.g., `FastMCP Server`\> → “App client information”)
The user pool ID and app client credentials are all you need for FastMCP configuration.
5
[
](#)
Configure OAuth Settings
Under “Login pages” in your app client’s settings, you can double check and adjust the OAuth configuration:
* **Allowed callback URLs**: Add your server URL + `/auth/callback` (e.g., `http://localhost:8000/auth/callback`)
* **Allowed sign-out URLs**: Optional, for logout functionality
* **OAuth 2.0 grant types**: Ensure “Authorization code grant” is selected
* **OpenID Connect scopes**: Select scopes your application needs (e.g., `openid`, `email`, `profile`)
For local development, you can use `http://localhost` URLs. For production, you must use HTTPS.
6
[
](#)
Configure Resource Server
AWS Cognito requires a resource server entry to support OAuth with protected resources. Without this, token exchange will fail with an `invalid\_grant` error.Navigate to **“Branding” → “Domain”** in the side navigation, then:
1. Click **“Create resource server”**
2. **Resource server name**: Enter a descriptive name (e.g., `My MCP Server`)
3. **Resource server identifier**: Enter your MCP endpoint URL exactly as it will be accessed (e.g., `http://localhost:8000/mcp` for development, or `https://your-server.com/mcp` for production)
4. Click **“Create resource server”**
The resource server identifier must exactly match your `base\_url + mcp\_path`. For the default configuration with `base\_url="http://localhost:8000"` and `path="/mcp"`, use `http://localhost:8000/mcp`.
7
[
](#)
Save Your Credentials
After setup, you’ll have:
* **User Pool ID**: Format like `eu-central-1\_XXXXXXXXX`
* **Client ID**: Your application’s client identifier
* **Client Secret**: Generated client secret (keep secure)
* **AWS Region**: Where Your AWS Cognito user pool is located
Store these credentials securely. Never commit them to version control. Use environment variables or AWS Secrets Manager in production.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server using the `AWSCognitoProvider`, which handles AWS Cognito’s JWT tokens and user claims automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.aws import AWSCognitoProvider
from fastmcp.server.dependencies import get\_access\_token
# The AWSCognitoProvider handles JWT validation and user claims
auth\_provider = AWSCognitoProvider(
user\_pool\_id="eu-central-1\_XXXXXXXXX", # Your AWS Cognito user pool ID
aws\_region="eu-central-1", # AWS region (defaults to eu-central-1)
client\_id="your-app-client-id", # Your app client ID
client\_secret="your-app-client-secret", # Your app client Secret
base\_url="http://localhost:8000", # Must match your callback URL
# redirect\_path="/auth/callback" # Default value, customize if needed
)
mcp = FastMCP(name="AWS Cognito Secured App", auth=auth\_provider)
# Add a protected tool to test authentication
@mcp.tool
async def get\_access\_token\_claims() -\> dict:
"""Get the authenticated user's access token claims."""
token = get\_access\_token()
return {
"sub": token.claims.get("sub"),
"username": token.claims.get("username"),
"cognito:groups": token.claims.get("cognito:groups", []),
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
Your server is now running and protected by AWS Cognito OAuth authentication.
###
[​
](#testing-with-a-client)
Testing with a Client
Create a test client that authenticates with Your AWS Cognito-protected server:
test\_client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle AWS Cognito OAuth
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
# First-time connection will open AWS Cognito login in your browser
print("✓ Authenticated with AWS Cognito!")
# Test the protected tool
print("Calling protected tool: get\_access\_token\_claims")
result = await client.call\_tool("get\_access\_token\_claims")
user\_data = result.data
print("Available access token claims:")
print(f"- sub: {user\_data.get('sub', 'N/A')}")
print(f"- username: {user\_data.get('username', 'N/A')}")
print(f"- cognito:groups: {user\_data.get('cognito:groups', [])}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to AWS Cognito’s hosted UI login page
2. After you sign in (or sign up), you’ll be redirected back to your MCP server
3. The client receives the JWT token and can make authenticated requests
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
from fastmcp.server.auth.providers.aws import AWSCognitoProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
# Production setup with encrypted persistent token storage
auth\_provider = AWSCognitoProvider(
user\_pool\_id="eu-central-1\_XXXXXXXXX",
aws\_region="eu-central-1",
client\_id="your-app-client-id",
client\_secret="your-app-client-secret",
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
mcp = FastMCP(name="Production AWS Cognito App", auth=auth\_provider)
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
Setting this environment variable allows the AWS Cognito provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.aws.AWSCognitoProvider` to use AWS Cognito authentication.
###
[​
](#aws-cognito-specific-configuration)
AWS Cognito-Specific Configuration
These environment variables provide default values for the AWS Cognito provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-aws-cognito-user-pool-id)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_USER\_POOL\_ID
required
Your AWS Cognito user pool ID (e.g., `eu-central-1\_XXXXXXXXX`)
[​
](#param-fastmcp-server-auth-aws-cognito-aws-region)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_AWS\_REGION
default:"eu-central-1"
AWS region where your AWS Cognito user pool is located
[​
](#param-fastmcp-server-auth-aws-cognito-client-id)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_CLIENT\_ID
required
Your AWS Cognito app client ID
[​
](#param-fastmcp-server-auth-aws-cognito-client-secret)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_CLIENT\_SECRET
required
Your AWS Cognito app client secret
[​
](#param-fastmcp-server-auth-aws-cognito-base-url)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_BASE\_URL
default:"http://localhost:8000"
Public URL where OAuth endpoints will be accessible (includes any mount path)
[​
](#param-fastmcp-server-auth-aws-cognito-issuer-url)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_ISSUER\_URL
default:"Uses BASE\_URL"
Issuer URL for OAuth metadata (defaults to `BASE\_URL`). Set to root-level URL when mounting under a path prefix to avoid 404 logs. See [HTTP Deployment guide](/v2/deployment/http#mounting-authenticated-servers) for details.
[​
](#param-fastmcp-server-auth-aws-cognito-redirect-path)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_REDIRECT\_PATH
default:"/auth/callback"
One of the redirect paths configured in your AWS Cognito app client
[​
](#param-fastmcp-server-auth-aws-cognito-required-scopes)
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_REQUIRED\_SCOPES
default:"[\\"openid\\"]"
Comma-, space-, or JSON-separated list of required OAuth scopes (e.g., `openid email` or `["openid","email","profile"]`)
Example `.env` file:
```
`# Use the AWS Cognito provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.aws.AWSCognitoProvider
# AWS Cognito credentials
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_USER\_POOL\_ID=eu-central-1\_XXXXXXXXX
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_AWS\_REGION=eu-central-1
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_CLIENT\_ID=your-app-client-id
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_CLIENT\_SECRET=your-app-client-secret
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_AWS\_COGNITO\_REQUIRED\_SCOPES=openid,email,profile
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_access\_token
# Authentication is automatically configured from environment
mcp = FastMCP(name="AWS Cognito Secured App")
@mcp.tool
async def get\_access\_token\_claims() -\> dict:
"""Get the authenticated user's access token claims."""
token = get\_access\_token()
return {
"sub": token.claims.get("sub"),
"username": token.claims.get("username"),
"cognito:groups": token.claims.get("cognito:groups", []),
}
`
```
##
[​
](#features)
Features
###
[​
](#jwt-token-validation)
JWT Token Validation
The AWS Cognito provider includes robust JWT token validation:
* **Signature Verification**: Validates tokens against AWS Cognito’s public keys (JWKS)
* **Expiration Checking**: Automatically rejects expired tokens
* **Issuer Validation**: Ensures tokens come from your specific AWS Cognito user pool
* **Scope Enforcement**: Verifies required OAuth scopes are present
###
[​
](#user-claims-and-groups)
User Claims and Groups
Access rich user information from AWS Cognito JWT tokens:
```
`from fastmcp.server.dependencies import get\_access\_token
@mcp.tool
async def admin\_only\_tool() -\> str:
"""A tool only available to admin users."""
token = get\_access\_token()
user\_groups = token.claims.get("cognito:groups", [])
if "admin" not in user\_groups:
raise ValueError("This tool requires admin access")
return "Admin access granted!"
`
```
###
[​
](#enterprise-integration)
Enterprise Integration
Perfect for enterprise environments with:
* **Single Sign-On (SSO)**: Integrate with corporate identity providers
* **Multi-Factor Authentication (MFA)**: Leverage AWS Cognito’s built-in MFA
* **User Groups**: Role-based access control through AWS Cognito groups
* **Custom Attributes**: Access custom user attributes defined in your AWS Cognito user pool
* **Compliance**: Meet enterprise security and compliance requirements