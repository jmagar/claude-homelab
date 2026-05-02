AuthKit 🤝 FastMCP - FastMCP
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
New in version `2.11.0`
This guide shows you how to secure your FastMCP server using WorkOS’s **AuthKit**, a complete authentication and user management solution. This integration uses the [**Remote OAuth**](/servers/auth/remote-oauth) pattern, where AuthKit handles user login and your FastMCP server validates the tokens.
AuthKit does not currently support [RFC 8707](https://www.rfc-editor.org/rfc/rfc8707.html) resource indicators, so FastMCP cannot validate that tokens were issued for the specific resource server. If you need resource-specific audience validation, consider using [WorkOSProvider](/integrations/workos) (OAuth proxy pattern) instead.
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
AuthKit defaults DCR clients to `client\_secret\_basic` for token exchange, which conflicts with how some MCP clients send credentials. To avoid token exchange errors, register as a public client by setting `token\_endpoint\_auth\_method` to `"none"`:
client.py
```
`from fastmcp import Client
from fastmcp.client.auth import OAuth
import asyncio
auth = OAuth(additional\_client\_metadata={"token\_endpoint\_auth\_method": "none"})
async def main():
async with Client("http://localhost:8000/mcp", auth=auth) as client:
assert await client.ping()
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
##
[​
](#production-configuration)
Production Configuration
For production deployments, load sensitive configuration from environment variables:
server.py
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.workos import AuthKitProvider
# Load configuration from environment variables
auth = AuthKitProvider(
authkit\_domain=os.environ.get("AUTHKIT\_DOMAIN"),
base\_url=os.environ.get("BASE\_URL", "https://your-server.com")
)
mcp = FastMCP(name="AuthKit Secured App", auth=auth)
`
```