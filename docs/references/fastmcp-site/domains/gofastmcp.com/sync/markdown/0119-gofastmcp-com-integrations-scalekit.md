Scalekit 🤝 FastMCP - FastMCP
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
New in version `2.13.0`
Install auth stack to your FastMCP server with [Scalekit](https://scalekit.com) using the [Remote OAuth](/servers/auth/remote-oauth) pattern: Scalekit handles user authentication, and the MCP server validates issued tokens.
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
##
[​
](#production-configuration)
Production Configuration
For production deployments, load configuration from environment variables:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.scalekit import ScalekitProvider
# Load configuration from environment variables
auth = ScalekitProvider(
environment\_url=os.environ.get("SCALEKIT\_ENVIRONMENT\_URL"),
resource\_id=os.environ.get("SCALEKIT\_RESOURCE\_ID"),
base\_url=os.environ.get("BASE\_URL", "https://your-server.com")
)
mcp = FastMCP(name="My Scalekit Protected Server", auth=auth)
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