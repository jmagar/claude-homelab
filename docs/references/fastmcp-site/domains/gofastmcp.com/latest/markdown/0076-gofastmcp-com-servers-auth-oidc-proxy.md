OIDC Proxy - FastMCP
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
Authentication
* [
Overview
](/servers/auth/authentication)
* [
Token Verification
](/servers/auth/token-verification)
* [
Remote OAuth
](/servers/auth/remote-oauth)
* [
OAuth Proxy
](/servers/auth/oauth-proxy)
* [
OIDC Proxy
](/servers/auth/oidc-proxy)
* [
Full OAuth Server
](/servers/auth/full-oauth-server)
* [
Multiple Auth Sources
](/servers/auth/multi-auth)
* [
Authorization
NEW
](/servers/authorization)
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
The OIDC proxy enables FastMCP servers to authenticate with OIDC providers that **don’t support Dynamic Client Registration (DCR)** out of the box. This includes OAuth providers like: Auth0, Google, Azure, AWS, etc. For providers that do support DCR (like WorkOS AuthKit), use [`RemoteAuthProvider`](/servers/auth/remote-oauth) instead.
The OIDC proxy is built upon [`OAuthProxy`](/servers/auth/oauth-proxy) so it has all the same functionality under the covers.
##
[​
](#implementation)
Implementation
###
[​
](#provider-setup-requirements)
Provider Setup Requirements
Before using the OIDC proxy, you need to register your application with your OAuth provider:
1. **Register your application** in the provider’s developer console (Auth0 Applications, Google Cloud Console, Azure Portal, etc.)
2. **Configure the redirect URI** as your FastMCP server URL plus your chosen callback path:
* Default: `https://your-server.com/auth/callback`
* Custom: `https://your-server.com/your/custom/path` (if you set `redirect\_path`)
* Development: `http://localhost:8000/auth/callback`
* **Obtain your credentials**: Client ID and Client Secret
The redirect URI you configure with your provider must exactly match your
FastMCP server’s URL plus the callback path. If you customize `redirect\_path`
in the OIDC proxy, update your provider’s redirect URI accordingly.
###
[​
](#basic-setup)
Basic Setup
Here’s how to implement the OIDC proxy with any provider:
```
`from fastmcp import FastMCP
from fastmcp.server.auth.oidc\_proxy import OIDCProxy
# Create the OIDC proxy
auth = OIDCProxy(
# Provider's configuration URL
config\_url="https://provider.com/.well-known/openid-configuration",
# Your registered app credentials
client\_id="your-client-id",
client\_secret="your-client-secret",
# Your FastMCP server's public URL
base\_url="https://your-server.com",
# Optional: customize the callback path (default is "/auth/callback")
# redirect\_path="/custom/callback",
)
mcp = FastMCP(name="My Server", auth=auth)
`
```
###
[​
](#configuration-parameters)
Configuration Parameters
## OIDCProxy Parameters
[​
](#param-config-url)
config\_url
str
required
URL of your OAuth provider’s OIDC configuration
[​
](#param-client-id)
client\_id
str
required
Client ID from your registered OAuth application
[​
](#param-client-secret)
client\_secret
str | None
Client secret from your registered OAuth application. Optional for PKCE public
clients. When omitted, `jwt\_signing\_key` must be provided.
[​
](#param-base-url)
base\_url
AnyHttpUrl | str
required
Public URL of your FastMCP server (e.g., `https://your-server.com`)
[​
](#param-strict)
strict
bool | None
Strict flag for configuration validation. When True, requires all OIDC
mandatory fields.
[​
](#param-audience)
audience
str | None
Audience parameter for OIDC providers that require it (e.g., Auth0). This is
typically your API identifier.
[​
](#param-timeout-seconds)
timeout\_seconds
int | None
default:"10"
HTTP request timeout in seconds for fetching OIDC configuration
[​
](#param-token-verifier)
token\_verifier
TokenVerifier | None
Custom token verifier for validating tokens. When provided, FastMCP uses your custom verifier instead of creating a default `JWTVerifier`.Cannot be used with `algorithm` or `required\_scopes` parameters - configure these on your verifier instead. The verifier’s `required\_scopes` are automatically loaded and advertised.
[​
](#param-algorithm)
algorithm
str | None
JWT algorithm to use for token verification (e.g., “RS256”). If not specified,
uses the provider’s default. Only used when `token\_verifier` is not provided.
[​
](#param-required-scopes)
required\_scopes
list[str] | None
List of OAuth scopes for token validation. These are automatically
included in authorization requests. Only used when `token\_verifier` is not provided.
[​
](#param-redirect-path)
redirect\_path
str
default:"/auth/callback"
Path for OAuth callbacks. Must match the redirect URI configured in your OAuth
application
[​
](#param-allowed-client-redirect-uris)
allowed\_client\_redirect\_uris
list[str] | None
List of allowed redirect URI patterns for MCP clients. Patterns support wildcards (e.g., `"http://localhost:\*"`, `"https://\*.example.com/\*"`).
* `None` (default): All redirect URIs allowed (for MCP/DCR compatibility)
* Empty list `[]`: No redirect URIs allowed
* Custom list: Only matching patterns allowed
These patterns apply to MCP client loopback redirects, NOT the upstream OAuth app redirect URI.
[​
](#param-token-endpoint-auth-method)
token\_endpoint\_auth\_method
str | None
Token endpoint authentication method for the upstream OAuth server. Controls how the proxy authenticates when exchanging authorization codes and refresh tokens with the upstream provider.
* `"client\_secret\_basic"`: Send credentials in Authorization header (most common)
* `"client\_secret\_post"`: Send credentials in request body (required by some providers)
* `"none"`: No authentication (for public clients)
* `None` (default): Uses authlib’s default (typically `"client\_secret\_basic"`)
Set this if your provider requires a specific authentication method and the default doesn’t work.
[​
](#param-jwt-signing-key)
jwt\_signing\_key
str | bytes | None
Secret used to sign FastMCP JWT tokens issued to clients. Accepts any string or bytes - will be derived into a proper 32-byte cryptographic key using HKDF.**Default behavior (`None`):**
* **Mac/Windows**: Auto-managed via system keyring. Keys are generated once and persisted, surviving server restarts with zero configuration. Keys are automatically derived from server attributes, so this approach, while convenient, is **only** suitable for development and local testing. For production, you must provide an explicit secret.
* **Linux**: Ephemeral (random salt at startup). Tokens become invalid on server restart, triggering client re-authentication.
**For production:**
Provide an explicit secret (e.g., from environment variable) to use a fixed key instead of the auto-generated one.
[​
](#param-client-storage)
client\_storage
AsyncKeyValue | None
Storage backend for persisting OAuth client registrations and upstream tokens.**Default behavior:**
* **Mac/Windows**: Encrypted DiskStore in your platform’s data directory (derived from `platformdirs`)
* **Linux**: MemoryStore (ephemeral - clients lost on restart)
By default on Mac/Windows, clients are automatically persisted to encrypted disk storage, allowing them to survive server restarts as long as the filesystem remains accessible. This means MCP clients only need to register once and can reconnect seamlessly. On Linux where keyring isn’t available, ephemeral storage is used to match the ephemeral key strategy.For production deployments with multiple servers or cloud deployments, use a network-accessible storage backend rather than local disk storage. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest.** See [Storage Backends](/servers/storage-backends) for available options.Testing with in-memory storage (unencrypted):
```
`from key\_value.aio.stores.memory import MemoryStore
# Use in-memory storage for testing (clients lost on restart)
auth = OIDCProxy(..., client\_storage=MemoryStore())
`
```
Production with encrypted Redis storage:
```
`from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
import os
auth = OIDCProxy(
...,
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
client\_storage=FernetEncryptionWrapper(
key\_value=RedisStore(host="redis.example.com", port=6379),
fernet=Fernet(os.environ["STORAGE\_ENCRYPTION\_KEY"])
)
)
`
```
[​
](#param-require-authorization-consent)
require\_authorization\_consent
bool
default:"True"
Whether to require user consent before authorizing MCP clients. When enabled (default), users see a consent screen that displays which client is requesting access. See [OAuthProxy documentation](/servers/auth/oauth-proxy#confused-deputy-attacks) for details on confused deputy attack protection.
[​
](#param-consent-csp-policy)
consent\_csp\_policy
str | None
default:"None"
Content Security Policy for the consent page.
* `None` (default): Uses the built-in CSP policy with appropriate directives for form submission
* Empty string `""`: Disables CSP entirely (no meta tag rendered)
* Custom string: Uses the provided value as the CSP policy
This is useful for organizations that have their own CSP policies and need to override or disable FastMCP’s built-in CSP directives.
###
[​
](#using-built-in-providers)
Using Built-in Providers
FastMCP includes pre-configured OIDC providers for common services:
```
`from fastmcp.server.auth.providers.auth0 import Auth0Provider
auth = Auth0Provider(
config\_url="https://.../.well-known/openid-configuration",
client\_id="your-auth0-client-id",
client\_secret="your-auth0-client-secret",
audience="https://...",
base\_url="https://localhost:8000"
)
mcp = FastMCP(name="My Server", auth=auth)
`
```
Available providers include `Auth0Provider` at present.
###
[​
](#scope-configuration)
Scope Configuration
OAuth scopes are configured with `required\_scopes` to automatically request the permissions your application needs.
Dynamic clients created by the proxy will automatically include these scopes in their authorization requests.
##
[​
](#cimd-support)
CIMD Support
The OIDC proxy inherits full CIMD (Client ID Metadata Document) support from `OAuthProxy`. Clients can use HTTPS URLs as their `client\_id` instead of registering dynamically, and the proxy will fetch and validate their metadata document.
See the [OAuth Proxy CIMD documentation](/servers/auth/oauth-proxy#cimd-support) for complete details on how CIMD works, including private key JWT authentication and security considerations.
The CIMD-related parameters available on `OIDCProxy` are:
## CIMD Parameters
[​
](#param-enable-cimd)
enable\_cimd
bool
default:"True"
Whether to accept CIMD URLs as client identifiers.
##
[​
](#production-configuration)
Production Configuration
For production deployments, load sensitive credentials from environment variables:
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.auth0 import Auth0Provider
# Load secrets from environment variables
auth = Auth0Provider(
config\_url=os.environ.get("AUTH0\_CONFIG\_URL"),
client\_id=os.environ.get("AUTH0\_CLIENT\_ID"),
client\_secret=os.environ.get("AUTH0\_CLIENT\_SECRET"),
audience=os.environ.get("AUTH0\_AUDIENCE"),
base\_url=os.environ.get("BASE\_URL", "https://localhost:8000")
)
mcp = FastMCP(name="My Server", auth=auth)
@mcp.tool
def protected\_tool(data: str) -\> str:
"""This tool is now protected by OAuth."""
return f"Processed: {data}"
if \_\_name\_\_ == "\_\_main\_\_":
mcp.run(transport="http", port=8000)
`
```
This keeps secrets out of your codebase while maintaining explicit configuration.