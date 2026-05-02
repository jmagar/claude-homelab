Descope 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using [**Descope**](https://www.descope.com), a complete authentication and user management solution. This integration uses the [**Remote OAuth**](/v2/servers/auth/remote-oauth) pattern, where Descope handles user login and your FastMCP server validates the tokens.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
Before you begin, you will need:
1. To [sign up](https://www.descope.com/sign-up) for a Free Forever Descope account
2. Your FastMCP server’s URL (can be localhost for development, e.g., `http://localhost:3000`)
###
[​
](#step-1-configure-descope)
Step 1: Configure Descope
1
[
](#)
Create an MCP Server
1. Go to the [MCP Servers page](https://app.descope.com/mcp-servers) of the Descope Console, and create a new MCP Server.
2. Give the MCP server a name and description.
3. Ensure that **Dynamic Client Registration (DCR)** is enabled. Then click **Create**.
4. Once you’ve created the MCP Server, note your Well-Known URL.
DCR is required for FastMCP clients to automatically register with your authentication server.
2
[
](#)
Note Your Well-Known URL
Save your Well-Known URL from [MCP Server Settings](https://app.descope.com/mcp-servers):
```
`Well-Known URL: https://.../v1/apps/agentic/P.../M.../.well-known/openid-configuration
`
```
###
[​
](#step-2-environment-setup)
Step 2: Environment Setup
Create a `.env` file with your Descope configuration:
```
`DESCOPE\_CONFIG\_URL=https://.../v1/apps/agentic/P.../M.../.well-known/openid-configuration # Your Descope Well-Known URL
SERVER\_URL=http://localhost:3000 # Your server's base URL
`
```
###
[​
](#step-3-fastmcp-configuration)
Step 3: FastMCP Configuration
Create your FastMCP server file and use the DescopeProvider to handle all the OAuth integration automatically:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.descope import DescopeProvider
# The DescopeProvider automatically discovers Descope endpoints
# and configures JWT token validation
auth\_provider = DescopeProvider(
config\_url=https://.../.well-known/openid-configuration, # Your MCP Server .well-known URL
base\_url=SERVER\_URL, # Your server's public URL
)
# Create FastMCP server with auth
mcp = FastMCP(name="My Descope Protected Server", auth=auth\_provider)
`
```
##
[​
](#testing)
Testing
To test your server, you can use the `fastmcp` CLI to run it locally. Assuming you’ve saved the above code to `server.py` (after replacing the environment variables with your actual values!), you can run the following command:
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
For production deployments, use environment variables instead of hardcoding credentials.
###
[​
](#provider-selection)
Provider Selection
Setting this environment variable allows the Descope provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.descope.DescopeProvider` to use
Descope authentication.
###
[​
](#descope-specific-configuration)
Descope-Specific Configuration
These environment variables provide default values for the Descope provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-descopeprovider-config-url)
FASTMCP\_SERVER\_AUTH\_DESCOPEPROVIDER\_CONFIG\_URL
required
Your Well-Known URL from the [Descope Console](https://app.descope.com/mcp-servers)
[​
](#param-fastmcp-server-auth-descopeprovider-base-url)
FASTMCP\_SERVER\_AUTH\_DESCOPEPROVIDER\_BASE\_URL
required
Public URL of your FastMCP server (e.g., `https://your-server.com` or
`http://localhost:8000` for development)
Example `.env` file:
```
`# Use the Descope provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.descope.DescopeProvider
# Descope configuration
FASTMCP\_SERVER\_AUTH\_DESCOPEPROVIDER\_CONFIG\_URL=https://.../v1/apps/agentic/P.../M.../.well-known/openid-configuration
FASTMCP\_SERVER\_AUTH\_DESCOPEPROVIDER\_BASE\_URL=https://your-server.com
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
# Authentication is automatically configured from environment
mcp = FastMCP(name="My Descope Protected Server")
`
```