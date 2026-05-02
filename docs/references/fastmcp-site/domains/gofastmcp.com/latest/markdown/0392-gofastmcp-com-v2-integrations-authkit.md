AuthKit 🤝 FastMCP - FastMCP
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
New in version `2.11.0`
This guide shows you how to secure your FastMCP server using WorkOS’s **AuthKit**, a complete authentication and user management solution. This integration uses the [**Remote OAuth**](/v2/servers/auth/remote-oauth) pattern, where AuthKit handles user login and your FastMCP server validates the tokens.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. A **[WorkOS Account](https://workos.com/)** and a new **Project**.
2. An **[AuthKit](https://www.authkit.com/)** instance configured within your WorkOS project.
3. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:8000`).
###
[​
](#step-1-authkit-configuration)
Step 1: AuthKit Configuration
In your WorkOS Dashboard, enable AuthKit and configure the following settings:
1
[
](#)
Enable Dynamic Client Registration
Go to **Applications → Configuration** and enable **Dynamic Client Registration**. This allows MCP clients register with your application automatically.
2
[
](#)
Note Your AuthKit Domain
Find your **AuthKit Domain** on the configuration page. It will look like `https://your-project-12345.authkit.app`. You’ll need this for your FastMCP server configuration.
###
[​
](#step-2-fastmcp-configuration)
Step 2: FastMCP Configuration
Create your FastMCP server file and use the `AuthKitProvider` to handle all the OAuth integration automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.workos import AuthKitProvider
# The AuthKitProvider automatically discovers WorkOS endpoints
# and configures JWT token validation
auth\_provider = AuthKitProvider(
authkit\_domain="https://your-project-12345.authkit.app",
base\_url="http://localhost:8000" # Use your actual server URL
)
mcp = FastMCP(name="AuthKit Secured App", auth=auth\_provider)
`
```
##
[​
](#testing)
Testing
To test your server, you can use the `fastmcp` CLI to run it locally. Assuming you’ve saved the above code to `server.py` (after replacing the `authkit\_domain` and `base\_url` with your actual values!), you can run the following command:
```
`fastmcp run server.py --transport http --port 8000
`
```
Now, you can use a FastMCP client to test that you can reach your server after authenticating:
```
`from fastmcp import Client
import asyncio
async def main():
async with Client("http://localhost:8000/mcp", auth="oauth") as client:
assert await client.ping()
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
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
Setting this environment variable allows the AuthKit provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.workos.AuthKitProvider` to use AuthKit authentication.
###
[​
](#authkit-specific-configuration)
AuthKit-Specific Configuration
These environment variables provide default values for the AuthKit provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-authkitprovider-authkit-domain)
FASTMCP\_SERVER\_AUTH\_AUTHKITPROVIDER\_AUTHKIT\_DOMAIN
required
Your AuthKit domain (e.g., `https://your-project-12345.authkit.app`)
[​
](#param-fastmcp-server-auth-authkitprovider-base-url)
FASTMCP\_SERVER\_AUTH\_AUTHKITPROVIDER\_BASE\_URL
required
Public URL of your FastMCP server (e.g., `https://your-server.com` or `http://localhost:8000` for development)
[​
](#param-fastmcp-server-auth-authkitprovider-required-scopes)
FASTMCP\_SERVER\_AUTH\_AUTHKITPROVIDER\_REQUIRED\_SCOPES
default:"[]"
Comma-, space-, or JSON-separated list of required OAuth scopes (e.g., `openid profile email` or `["openid", "profile", "email"]`)
Example `.env` file:
```
`# Use the AuthKit provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.workos.AuthKitProvider
# AuthKit configuration
FASTMCP\_SERVER\_AUTH\_AUTHKITPROVIDER\_AUTHKIT\_DOMAIN=https://your-project-12345.authkit.app
FASTMCP\_SERVER\_AUTH\_AUTHKITPROVIDER\_BASE\_URL=https://your-server.com
FASTMCP\_SERVER\_AUTH\_AUTHKITPROVIDER\_REQUIRED\_SCOPES=openid,profile,email
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
# Authentication is automatically configured from environment
mcp = FastMCP(name="AuthKit Secured App")
`
```