Scalekit 🤝 FastMCP - FastMCP
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
New in version `2.13.0`
Install auth stack to your FastMCP server with [Scalekit](https://scalekit.com) using the [Remote OAuth](/v2/servers/auth/remote-oauth) pattern: Scalekit handles user authentication, and the MCP server validates issued tokens.
###
[​
](#prerequisites)
Prerequisites
Before you begin
1. Get a [Scalekit account](https://app.scalekit.com/) and grab your **Environment URL** from *Dashboard \> Settings* .
2. Have your FastMCP server’s base URL ready (can be localhost for development, e.g., `http://localhost:8000/`)
###
[​
](#step-1-configure-mcp-server-in-scalekit-environment)
Step 1: Configure MCP server in Scalekit environment
1
[
](#)
Register MCP server and set environment
In your Scalekit dashboard:
1. Open the **MCP Servers** section, then select **Create new server**
2. Enter server details: a name, a resource identifier, and the desired MCP client authentication settings
3. Save, then copy the **Resource ID** (for example, res\_92015146095)
In your FastMCP project’s `.env`:
```
`SCALEKIT\_ENVIRONMENT\_URL=\<YOUR\_APP\_ENVIRONMENT\_URL\>
SCALEKIT\_RESOURCE\_ID=\<YOUR\_APP\_RESOURCE\_ID\> # res\_926EXAMPLE5878
BASE\_URL=http://localhost:8000/
# Optional: additional scopes tokens must have
# SCALEKIT\_REQUIRED\_SCOPES=read,write
`
```
###
[​
](#step-2-add-auth-to-fastmcp-server)
Step 2: Add auth to FastMCP server
Create your FastMCP server file and use the ScalekitProvider to handle all the OAuth integration automatically:
>
**> Warning:
**> The legacy
`> mcp_url
`> and
`> client_id
`> parameters are deprecated and will be removed in a future release. Use
`> base_url
`> instead of
`> mcp_url
`> and remove
`> client_id
`> from your configuration.
>
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.scalekit import ScalekitProvider
# Discovers Scalekit endpoints and set up JWT token validation
auth\_provider = ScalekitProvider(
environment\_url=SCALEKIT\_ENVIRONMENT\_URL, # Scalekit environment URL
resource\_id=SCALEKIT\_RESOURCE\_ID, # Resource server ID
base\_url=SERVER\_URL, # Public MCP endpoint
required\_scopes=["read"], # Optional scope enforcement
)
# Create FastMCP server with auth
mcp = FastMCP(name="My Scalekit Protected Server", auth=auth\_provider)
@mcp.tool
def auth\_status() -\> dict:
"""Show Scalekit authentication status."""
# Extract user claims from the JWT
return {
"message": "This tool requires authentication via Scalekit",
"authenticated": True,
"provider": "Scalekit"
}
`
```
Set `required\_scopes` when you need tokens to carry specific permissions. Leave it unset to allow any token issued for the resource.
##
[​
](#testing)
Testing
###
[​
](#start-the-mcp-server)
Start the MCP server
```
`uv run python server.py
`
```
Use any MCP client (for example, mcp-inspector, Claude, VS Code, or Windsurf) to connect to the running serve. Verify that authentication succeeds and requests are authorized as expected.
###
[​
](#provider-selection)
Provider selection
Setting this environment variable allows the Scalekit provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.scalekit.ScalekitProvider` to use Scalekit authentication.
###
[​
](#scalekit-specific-configuration)
Scalekit-specific configuration
These environment variables provide default values for the Scalekit provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-scalekitprovider-environment-url)
FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_ENVIRONMENT\_URL
required
Your Scalekit environment URL from the Admin Portal (e.g., `https://your-env.scalekit.com`)
[​
](#param-fastmcp-server-auth-scalekitprovider-resource-id)
FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_RESOURCE\_ID
required
Your Scalekit resource server ID from the MCP Servers section
[​
](#param-fastmcp-server-auth-scalekitprovider-base-url)
FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_BASE\_URL
required
Public URL of your FastMCP server (e.g., `https://your-server.com` or `http://localhost:8000/` for development)
Legacy `FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_MCP\_URL` is still recognized for backward compatibility but will be removed soon-rename it to `...BASE\_URL`.
[​
](#param-fastmcp-server-auth-scalekitprovider-required-scopes)
FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_REQUIRED\_SCOPES
default:"[]"
Comma-, space-, or JSON-separated list of scopes that tokens must include to access your server
Example `.env`:
```
`# Use the Scalekit provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.scalekit.ScalekitProvider
# Scalekit configuration
FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_ENVIRONMENT\_URL=https://your-env.scalekit.com
FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_RESOURCE\_ID=res\_456
FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_BASE\_URL=https://your-server.com/
# FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_REQUIRED\_SCOPES=read,write
# FASTMCP\_SERVER\_AUTH\_SCALEKITPROVIDER\_MCP\_URL=https://your-server.com/ # Deprecated
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
# Authentication is automatically configured from environment
mcp = FastMCP(name="My Scalekit Protected Server")
@mcp.tool
def protected\_action() -\> str:
"""A tool that requires authentication."""
return "Access granted via Scalekit!"
`
```
##
[​
](#capabilities)
Capabilities
Scalekit supports OAuth 2.1 with Dynamic Client Registration for MCP clients and enterprise SSO, and provides built‑in JWT validation and security controls.
**OAuth 2.1/DCR**: clients self‑register, use PKCE, and work with the Remote OAuth pattern without pre‑provisioned credentials.
**Validation and SSO**: tokens are verified (keys, RS256, issuer, audience, expiry), and SAML, OIDC, OAuth 2.0, ADFS, Azure AD, and Google Workspace are supported; use HTTPS in production and review auth logs as needed.
##
[​
](#debugging)
Debugging
Enable detailed logging to troubleshoot authentication issues:
```
`import logging
logging.basicConfig(level=logging.DEBUG)
`
```
###
[​
](#token-inspection)
Token inspection
You can inspect JWT tokens in your tools to understand the user context:
```
`from fastmcp.server.context import request\_ctx
import jwt
@mcp.tool
def inspect\_token() -\> dict:
"""Inspect the current JWT token claims."""
context = request\_ctx.get()
# Extract token from Authorization header
if hasattr(context, 'request') and hasattr(context.request, 'headers'):
auth\_header = context.request.headers.get('authorization', '')
if auth\_header.startswith('Bearer '):
token = auth\_header[7:]
# Decode without verification (already verified by provider)
claims = jwt.decode(token, options={"verify\_signature": False})
return claims
return {"error": "No token found"}
`
```