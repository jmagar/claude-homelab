OCI IAM OAuth 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using **OCI IAM OAuth**. Since OCI IAM doesn’t support Dynamic Client Registration, this integration uses the [**OIDC Proxy**](/v2/servers/auth/oidc-proxy) pattern to bridge OCI’s traditional OAuth with MCP’s authentication requirements.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
1. An OCI cloud Account with access to create an Integrated Application in an Identity Domain.
2. Your FastMCP server’s URL (For dev environments, it is [http://localhost:8000](http://localhost:8000). For PROD environments, it could be [https://mcp.${DOMAIN}.com](https://mcp.${DOMAIN}.com))
###
[​
](#step-1-make-sure-client-access-is-enabled-for-jwk’s-url)
Step 1: Make sure client access is enabled for JWK’s URL
1
[
](#)
Navigate to OCI IAM Domain Settings
Login to OCI console ([https://cloud.oracle.com](https://cloud.oracle.com) for OCI commercial cloud).
From “Identity & Security” menu, open Domains page.
On the Domains list page, select the domain that you are using for MCP Authentication.
Open Settings tab.
Click on “Edit Domain Settings” button.
2
[
](#)
Update Domain Setting
Enable “Configure client access” checkbox as shown in the screenshot.
###
[​
](#step-2-create-oauth-client-for-mcp-server-authentication)
Step 2: Create OAuth client for MCP server authentication
Follow the Steps as mentioned below to create an OAuth client.
1
[
](#)
Navigate to OCI IAM Integrated Applications
Login to OCI console ([https://cloud.oracle.com](https://cloud.oracle.com) for OCI commercial cloud).
From “Identity & Security” menu, open Domains page.
On the Domains list page, select the domain in which you want to create MCP server OAuth client. If you need help finding the list page for the domain, see [Listing Identity Domains.](https://docs.oracle.com/en-us/iaas/Content/Identity/domains/to-view-identity-domains.htm#view-identity-domains).
On the details page, select Integrated applications. A list of applications in the domain is displayed.
2
[
](#)
Add an Integrated Application
Select Add application.
In the Add application window, select Confidential Application.
Select Launch workflow.
In the Add application details page, Enter name and description as shown below.
3
[
](#)
Update OAuth Configuration for an Integrated Application
Once the Integrated Application is created, Click on “OAuth configuration” tab.
Click on “Edit OAuth configuration” button.
Configure the application as OAuth client by selecting “Configure this application as a client now” radio button.
Select “Authorization code” grant type. If you are planning to use the same OAuth client application for token exchange, select “Client credentials” grant type as well. In the sample, we will use the same client.
For Authorization grant type, select redirect URL. In most cases, this will be the MCP server URL followed by “/oauth/callback”.
4
[
](#)
Activate the Integrated Application
Click on “Submit” button to update OAuth configuration for the client application.
**Note: You don’t need to do any special configuration to support PKCE for the OAuth client.**
Make sure to Activate the client application.
Note down client ID and client secret for the application. Update .env file and replace FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID and FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET values.
FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID in the env file is the Identity domain URL that you chose for the MCP server.
This is all you need to implement MCP server authentication against OCI IAM. However, you may want to use an authenticated user token to invoke OCI control plane APIs and propagate identity to the OCI control plane instead of using a service user account. In that case, you need to implement token exchange.
###
[​
](#step-3-token-exchange-setup-only-if-mcp-server-needs-to-talk-to-oci-control-plane)
Step 3: Token Exchange Setup (Only if MCP server needs to talk to OCI Control Plane)
Token exchange helps you exchange a logged-in user’s OCI IAM token for an OCI control plane session token, also known as UPST (User Principal Session Token). To learn more about token exchange, refer to my [Workload Identity Federation Blog](https://www.ateam-oracle.com/post/workload-identity-federation)
For token exchange, we need to configure Identity propagation trust. The blog above discusses setting up the trust using REST APIs. However, you can also use OCI CLI. Before using the CLI command below, ensure that you have created a token exchange OAuth client. In most cases, you can use the same OAuth client that you created above. You will use the client ID of the token exchange OAuth client in the CLI command below and replace it with .
You will also need to update the client secret for the token exchange OAuth client in the .env file. It is the FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET parameter. Update FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID and FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID as well for the token exchange OAuth client in the .env file.
```
`oci identity-domains identity-propagation-trust create \\
--schemas '["urn:ietf:params:scim:schemas:oracle:idcs:IdentityPropagationTrust"]' \\
--public-key-endpoint "https://{FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID}.identity.oraclecloud.com/admin/v1/SigningCert/jwk" \\
--name "For Token Exchange" --type "JWT" \\
--issuer "https://identity.oraclecloud.com/" --active true \\
--endpoint "https://{FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID}.identity.oracleclcoud.com" \\
--subject-claim-name "sub" --allow-impersonation false \\
--subject-mapping-attribute "username" \\
--subject-type "User" --client-claim-name "iss" \\
--client-claim-values '["https://identity.oraclecloud.com/"]' \\
--oauth-clients '["{FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID}"]'
`
```
To exchange access token for OCI token and create a signer object, you need to add below code in MCP server. You can then use the signer object to create any OCI control plane client.
```
`
from fastmcp.server.dependencies import get\_access\_token
from fastmcp.utilities.logging import get\_logger
from oci.auth.signers import TokenExchangeSigner
import os
logger = get\_logger(\_\_name\_\_)
# Load configuration from environment
FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID = os.environ["FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID"]
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID = os.environ["FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID"]
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET = os.environ["FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET"]
\_global\_token\_cache = {} #In memory cache for OCI session token signer
def get\_oci\_signer() -\> TokenExchangeSigner:
authntoken = get\_access\_token()
tokenID = authntoken.claims.get("jti")
token = authntoken.token
#Check if the signer exists for the token ID in memory cache
cached\_signer = \_global\_token\_cache.get(tokenID)
logger.debug(f"Global cached signer: {cached\_signer}")
if cached\_signer:
logger.debug(f"Using globally cached signer for token ID: {tokenID}")
return cached\_signer
#If the signer is not yet created for the token then create new OCI signer object
logger.debug(f"Creating new signer for token ID: {tokenID}")
signer = TokenExchangeSigner(
jwt\_or\_func=token,
oci\_domain\_id=FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID.split(".")[0],
client\_id=FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID,
client\_secret=FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET,
)
logger.debug(f"Signer {signer} created for token ID: {tokenID}")
#Cache the signer object in memory cache
\_global\_token\_cache[tokenID] = signer
logger.debug(f"Signer cached for token ID: {tokenID}")
return signer
`
```
##
[​
](#running-mcp-server)
Running MCP server
Once the setup is complete, to run the MCP server, run the below command.
```
`fastmcp run server.py:mcp --transport http --port 8000
`
```
To run MCP client, run the below command.
```
`python3 client.py
`
```
MCP Client sample is as below.
client.py
```
`from fastmcp import Client
import asyncio
async def main():
# The client will automatically handle OCI OAuth flows
async with Client("http://localhost:8000/mcp/", auth="oauth") as client:
# First-time connection will open OCI login in your browser
print("✓ Authenticated with OCI IAM")
tools = await client.list\_tools()
print(f"🔧 Available tools ({len(tools)}):")
for tool in tools:
print(f" - {tool.name}: {tool.description}")
if \_\_name\_\_ == "\_\_main\_\_":
asyncio.run(main())
`
```
When you run the client for the first time:
1. Your browser will open to OCI IAM’s login page
2. Sign in with your OCI account and grant the requested consent
3. After authorization, you’ll be redirected back to the redirect path
4. The client receives the token and can make authenticated requests
##
[​
](#production-configuration)
Production Configuration
New in version `2.13.0`
For production deployments with persistent token management across server restarts, configure `jwt\_signing\_key`, and `client\_storage`:
server.py
```
`
import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.oci import OCIProvider
from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
# Load configuration from environment
FASTMCP\_SERVER\_AUTH\_OCI\_CONFIG\_URL = os.environ["FASTMCP\_SERVER\_AUTH\_OCI\_CONFIG\_URL"]
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID = os.environ["FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID"]
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET = os.environ["FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET"]
# Production setup with encrypted persistent token storage
auth\_provider = OCIProvider(
config\_url=FASTMCP\_SERVER\_AUTH\_OCI\_CONFIG\_URL,
client\_id=FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID,
client\_secret=FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET,
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
mcp = FastMCP(name="Production OCI App", auth=auth\_provider)
`
```
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at Rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/v2/servers/auth/oauth-proxy#configuration-parameters).
The client caches tokens locally, so you won’t need to re-authenticate for subsequent runs unless the token expires or you explicitly clear the cache.
##
[​
](#environment-variables)
Environment Variables
For production deployments, use environment variables instead of hardcoding credentials.
###
[​
](#provider-selection)
Provider Selection
Setting this environment variable allows the OCI provider to be used automatically without explicitly instantiating it in code.
##
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
default:"Not set"
Set to `fastmcp.server.auth.providers.oci.OCIProvider` to use OCI IAM authentication.
###
[​
](#oci-specific-configuration)
OCI-Specific Configuration
These environment variables provide default values for the OCI IAM provider, whether it’s instantiated manually or configured via `FASTMCP\_SERVER\_AUTH`.
##
[​
](#param-fastmcp-server-auth-oci-iam-guid)
FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID
required
Your OCI Application Configuration URL (e.g., `idcs-asdascxasd11......identity.oraclecloud.com`)
[​
](#param-fastmcp-server-auth-oci-config-url)
FASTMCP\_SERVER\_AUTH\_OCI\_CONFIG\_URL
required
Your OCI Application Configuration URL (e.g., `https://{FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID}.identity.oraclecloud.com/.well-known/openid-configuration`)
[​
](#param-fastmcp-server-auth-oci-client-id)
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID
required
Your OCI Application Client ID (e.g., `tv2ObNgaZAWWhhycr7Bz1LU2mxlnsmsB`)
[​
](#param-fastmcp-server-auth-oci-client-secret)
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET
required
Your OCI Application Client Secret (e.g., `idcsssvPYqbjemq...`)
[​
](#param-fastmcp-server-auth-oci-base-url)
FASTMCP\_SERVER\_AUTH\_OCI\_BASE\_URL
required
Public URL where OAuth endpoints will be accessible (includes any mount path)
[​
](#param-fastmcp-server-auth-oci-redirect-path)
FASTMCP\_SERVER\_AUTH\_OCI\_REDIRECT\_PATH
default:"/auth/callback"
Redirect path configured in your OCI IAM Integrated Application
Example `.env` file:
```
`# Use the OCI IAM provider
FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.oci.OCIProvider
# OCI IAM configuration and credentials
FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID=idcs-asaacasd1111.....
FASTMCP\_SERVER\_AUTH\_OCI\_CONFIG\_URL=https://{FASTMCP\_SERVER\_AUTH\_OCI\_IAM\_GUID}.identity.oraclecloud.com/.well-known/openid-configuration
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_ID=\<your-client-id\>
FASTMCP\_SERVER\_AUTH\_OCI\_CLIENT\_SECRET=\<your-client-secret\>
FASTMCP\_SERVER\_AUTH\_OCI\_BASE\_URL=https://your-server.com
`
```
With environment variables set, your server code simplifies to:
server.py
```
`from fastmcp import FastMCP
from fastmcp.server.dependencies import get\_access\_token
# Authentication is automatically configured from environment
mcp = FastMCP(name="OCI Secured App")
@mcp.tool
def whoami() -\> str:
"""The whoami function is to test MCP server without requiring token exchange.
This tool can be used to test successful authentication against OCI IAM.
It will return logged in user's subject (username from IAM domain)."""
token = get\_access\_token()
user = token.claims.get("sub")
return f"You are User: {user}"
`
```