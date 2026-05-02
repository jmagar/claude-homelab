OCI IAM OAuth 🤝 FastMCP - FastMCP
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
This guide shows you how to secure your FastMCP server using **OCI IAM OAuth**. Since OCI IAM doesn’t support Dynamic Client Registration, this integration uses the [**OIDC Proxy**](/servers/auth/oidc-proxy) pattern to bridge OCI’s traditional OAuth with MCP’s authentication requirements.
##
[​
](#configuration)
Configuration
###
[​
](#prerequisites)
Prerequisites
1. An OCI cloud Account with access to create an Integrated Application in an Identity Domain.
2. Your FastMCP server’s URL (For dev environments, it is [http://localhost:8000](http://localhost:8000). For PROD environments, it could be [https://mcp.yourdomain.com](https://mcp.yourdomain.com))
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
Note down client ID and client secret for the application. You’ll use these values when configuring the OCIProvider in your code.
This is all you need to implement MCP server authentication against OCI IAM. However, you may want to use an authenticated user token to invoke OCI control plane APIs and propagate identity to the OCI control plane instead of using a service user account. In that case, you need to implement token exchange.
###
[​
](#step-3-token-exchange-setup-only-if-mcp-server-needs-to-talk-to-oci-control-plane)
Step 3: Token Exchange Setup (Only if MCP server needs to talk to OCI Control Plane)
Token exchange helps you exchange a logged-in user’s OCI IAM token for an OCI control plane session token, also known as UPST (User Principal Session Token). To learn more about token exchange, refer to my [Workload Identity Federation Blog](https://www.ateam-oracle.com/post/workload-identity-federation)
For token exchange, we need to configure Identity propagation trust. The blog above discusses setting up the trust using REST APIs. However, you can also use OCI CLI. Before using the CLI command below, ensure that you have created a token exchange OAuth client. In most cases, you can use the same OAuth client that you created above. Replace `\<IAM\_GUID\>` and `\<CLIENT\_ID\>` in the CLI command below with your actual values.
```
`oci identity-domains identity-propagation-trust create \\
--schemas '["urn:ietf:params:scim:schemas:oracle:idcs:IdentityPropagationTrust"]' \\
--public-key-endpoint "https://\<IAM\_GUID\>.identity.oraclecloud.com/admin/v1/SigningCert/jwk" \\
--name "For Token Exchange" --type "JWT" \\
--issuer "https://identity.oraclecloud.com/" --active true \\
--endpoint "https://\<IAM\_GUID\>.identity.oraclecloud.com" \\
--subject-claim-name "sub" --allow-impersonation false \\
--subject-mapping-attribute "username" \\
--subject-type "User" --client-claim-name "iss" \\
--client-claim-values '["https://identity.oraclecloud.com/"]' \\
--oauth-clients '["\<CLIENT\_ID\>"]'
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
OCI\_IAM\_GUID = os.environ.get("OCI\_IAM\_GUID")
OCI\_CLIENT\_ID = os.environ.get("OCI\_CLIENT\_ID")
OCI\_CLIENT\_SECRET = os.environ.get("OCI\_CLIENT\_SECRET")
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
oci\_domain\_id=OCI\_IAM\_GUID.split(".")[0] if OCI\_IAM\_GUID else "",
client\_id=OCI\_CLIENT\_ID,
client\_secret=OCI\_CLIENT\_SECRET,
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
# Production setup with encrypted persistent token storage
auth\_provider = OCIProvider(
config\_url=os.environ.get("OCI\_CONFIG\_URL"),
client\_id=os.environ.get("OCI\_CLIENT\_ID"),
client\_secret=os.environ.get("OCI\_CLIENT\_SECRET"),
base\_url=os.environ.get("BASE\_URL", "https://your-production-domain.com"),
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
Parameters (`jwt\_signing\_key` and `client\_storage`) work together to ensure tokens and client registrations survive server restarts. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at Rest** - without it, tokens are stored in plaintext. Store secrets in environment variables and use a persistent storage backend like Redis for distributed deployments.For complete details on these parameters, see the [OAuth Proxy documentation](/servers/auth/oauth-proxy#configuration-parameters).
The client caches tokens locally, so you won’t need to re-authenticate for subsequent runs unless the token expires or you explicitly clear the cache.