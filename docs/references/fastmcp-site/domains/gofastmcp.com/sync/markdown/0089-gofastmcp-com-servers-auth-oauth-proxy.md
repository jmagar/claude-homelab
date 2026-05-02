OAuth Proxy - FastMCP
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
The OAuth proxy enables FastMCP servers to authenticate with OAuth providers that **don’t support Dynamic Client Registration (DCR)**. This includes virtually all traditional OAuth providers: GitHub, Google, Azure, AWS, Discord, Facebook, and most enterprise identity systems. For providers that do support DCR (like Descope and WorkOS AuthKit), use [`RemoteAuthProvider`](/servers/auth/remote-oauth) instead.
MCP clients expect to register automatically and obtain credentials on the fly, but traditional providers require manual app registration through their developer consoles. The OAuth proxy bridges this gap by presenting a DCR-compliant interface to MCP clients while using your pre-registered credentials with the upstream provider. When a client attempts to register, the proxy returns your fixed credentials. When a client initiates authorization, the proxy handles the complexity of callback forwarding—storing the client’s dynamic callback URL, using its own fixed callback with the provider, then forwarding back to the client after token exchange.
This approach enables any MCP client (whether using random localhost ports or fixed URLs like Claude.ai) to authenticate with any traditional OAuth provider, all while maintaining full OAuth 2.1 and PKCE security.
For providers that support OIDC discovery (Auth0, Google with OIDC
configuration, Azure AD), consider using [`OIDC Proxy`](/servers/auth/oidc-proxy) for automatic configuration. OIDC Proxy
extends the OAuth proxy to automatically discover endpoints from the provider’s
`/.well-known/openid-configuration` URL, simplifying setup.
##
[​
](#implementation)
Implementation
###
[​
](#provider-setup-requirements)
Provider Setup Requirements
Before using the OAuth proxy, you need to register your application with your OAuth provider:
1. **Register your application** in the provider’s developer console (GitHub Settings, Google Cloud Console, Azure Portal, etc.)
2. **Configure the redirect URI** as your FastMCP server URL plus your chosen callback path:
* Default: `https://your-server.com/auth/callback`
* Custom: `https://your-server.com/your/custom/path` (if you set `redirect\_path`)
* Development: `http://localhost:8000/auth/callback`
* **Obtain your credentials**: Client ID and Client Secret
* **Note the OAuth endpoints**: Authorization URL and Token URL (usually found in the provider’s OAuth documentation)
The redirect URI you configure with your provider must exactly match your
FastMCP server’s URL plus the callback path. If you customize `redirect\_path`
in the OAuth proxy, update your provider’s redirect URI accordingly.
###
[​
](#basic-setup)
Basic Setup
Here’s how to implement the OAuth proxy with any provider:
```
`from fastmcp import FastMCP
from fastmcp.server.auth import OAuthProxy
from fastmcp.server.auth.providers.jwt import JWTVerifier
# Configure token verification for your provider
# See the Token Verification guide for provider-specific setups
token\_verifier = JWTVerifier(
jwks\_uri="https://your-provider.com/.well-known/jwks.json",
issuer="https://your-provider.com",
audience="your-app-id"
)
# Create the OAuth proxy
auth = OAuthProxy(
# Provider's OAuth endpoints (from their documentation)
upstream\_authorization\_endpoint="https://provider.com/oauth/authorize",
upstream\_token\_endpoint="https://provider.com/oauth/token",
# Your registered app credentials
upstream\_client\_id="your-client-id",
upstream\_client\_secret="your-client-secret",
# Token validation (see Token Verification guide)
token\_verifier=token\_verifier,
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
## OAuthProxy Parameters
[​
](#param-upstream-authorization-endpoint)
upstream\_authorization\_endpoint
str
required
URL of your OAuth provider’s authorization endpoint (e.g., `https://github.com/login/oauth/authorize`)
[​
](#param-upstream-token-endpoint)
upstream\_token\_endpoint
str
required
URL of your OAuth provider’s token endpoint (e.g.,
`https://github.com/login/oauth/access\_token`)
[​
](#param-upstream-client-id)
upstream\_client\_id
str
required
Client ID from your registered OAuth application
[​
](#param-upstream-client-secret)
upstream\_client\_secret
str | None
Client secret from your registered OAuth application. Optional for PKCE public
clients or when using alternative credentials (e.g., managed identity client
assertions via a subclass). When omitted, `jwt\_signing\_key` must be provided
explicitly since it cannot be derived from the secret.
[​
](#param-token-verifier)
token\_verifier
TokenVerifier
required
A [`TokenVerifier`](/servers/auth/token-verification) instance to validate the
provider’s tokens
[​
](#param-base-url)
base\_url
AnyHttpUrl | str
required
Public URL where OAuth endpoints will be accessible, **including any mount path** (e.g., `https://your-server.com/api`).This URL is used to construct OAuth callback URLs and operational endpoints. When mounting under a path prefix, include that prefix in `base\_url`. Use `issuer\_url` separately to specify where auth server metadata is located (typically at root level).
[​
](#param-redirect-path)
redirect\_path
str
default:"/auth/callback"
Path for OAuth callbacks. Must match the redirect URI configured in your OAuth
application
[​
](#param-upstream-revocation-endpoint)
upstream\_revocation\_endpoint
str | None
Optional URL of provider’s token revocation endpoint
[​
](#param-issuer-url)
issuer\_url
AnyHttpUrl | str | None
Issuer URL for OAuth authorization server metadata (defaults to `base\_url`).When `issuer\_url` has a path component (either explicitly or by defaulting from `base\_url`), FastMCP creates path-aware discovery routes per RFC 8414. For example, if `base\_url` is `http://localhost:8000/api`, the authorization server metadata will be at `/.well-known/oauth-authorization-server/api`.**Default behavior (recommended for most cases):**
```
`auth = GitHubProvider(
base\_url="http://localhost:8000/api", # OAuth endpoints under /api
# issuer\_url defaults to base\_url - path-aware discovery works automatically
)
`
```
**When to set explicitly:**
Set `issuer\_url` to root level only if you want multiple MCP servers to share a single discovery endpoint:
```
`auth = GitHubProvider(
base\_url="http://localhost:8000/api",
issuer\_url="http://localhost:8000" # Shared root-level discovery
)
`
```
See the [HTTP Deployment guide](/deployment/http#mounting-authenticated-servers) for complete mounting examples.
[​
](#param-service-documentation-url)
service\_documentation\_url
AnyHttpUrl | str | None
Optional URL to your service documentation
[​
](#param-forward-pkce)
forward\_pkce
bool
default:"True"
Whether to forward PKCE (Proof Key for Code Exchange) to the upstream OAuth
provider. When enabled and the client uses PKCE, the proxy generates its own
PKCE parameters to send upstream while separately validating the client’s
PKCE. This ensures end-to-end PKCE security at both layers (client-to-proxy
and proxy-to-upstream). - `True` (default): Forward PKCE for providers that
support it (Google, Azure, AWS, GitHub, etc.) - `False`: Disable only if upstream
provider doesn’t support PKCE
[​
](#param-token-endpoint-auth-method)
token\_endpoint\_auth\_method
str | None
Token endpoint authentication method for the upstream OAuth server. Controls
how the proxy authenticates when exchanging authorization codes and refresh
tokens with the upstream provider. - `"client\_secret\_basic"`: Send credentials
in Authorization header (most common) - `"client\_secret\_post"`: Send
credentials in request body (required by some providers) - `"none"`: No
authentication (for public clients) - `None` (default): Uses authlib’s default
(typically `"client\_secret\_basic"`) Set this if your provider requires a
specific authentication method and the default doesn’t work.
[​
](#param-allowed-client-redirect-uris)
allowed\_client\_redirect\_uris
list[str] | None
List of allowed redirect URI patterns for MCP clients. Patterns support
wildcards (e.g., `"http://localhost:\*"`, `"https://\*.example.com/\*"`). -
`None` (default): All redirect URIs allowed (for MCP/DCR compatibility) -
Empty list `[]`: No redirect URIs allowed - Custom list: Only matching
patterns allowed These patterns apply to MCP client loopback redirects, NOT
the upstream OAuth app redirect URI.
[​
](#param-valid-scopes)
valid\_scopes
list[str] | None
List of all possible valid scopes for the OAuth provider. These are advertised
to clients through the `/.well-known` endpoints. Defaults to `required\_scopes`
from your TokenVerifier if not specified.
[​
](#param-extra-authorize-params)
extra\_authorize\_params
dict[str, str] | None
Additional parameters to forward to the upstream authorization endpoint. Useful for provider-specific parameters that aren’t part of the standard OAuth2 flow.For example, Auth0 requires an `audience` parameter to issue JWT tokens:
```
`extra\_authorize\_params={"audience": "https://api.example.com"}
`
```
These parameters are added to every authorization request sent to the upstream provider.
[​
](#param-extra-token-params)
extra\_token\_params
dict[str, str] | None
Additional parameters to forward to the upstream token endpoint during code exchange and token refresh. Useful for provider-specific requirements during token operations.For example, some providers require additional context during token exchange:
```
`extra\_token\_params={"audience": "https://api.example.com"}
`
```
These parameters are included in all token requests to the upstream provider.
[​
](#param-client-storage)
client\_storage
AsyncKeyValue | None
Storage backend for persisting OAuth client registrations and upstream tokens.**Default behavior:**
By default, clients are automatically persisted to an encrypted disk store, allowing them to survive server restarts as long as the filesystem remains accessible. This means MCP clients only need to register once and can reconnect seamlessly. The disk store is encrypted using a key derived from the JWT Signing Key (which is derived from the upstream client secret by default). For client registrations to survive upstream client secret rotation, you should provide a JWT Signing Key or your own client\_storage.For production deployments with multiple servers or cloud deployments, see [Storage Backends](/servers/storage-backends) for available options.
**When providing custom storage**, wrap it in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest:
```
`from key\_value.aio.stores.redis import RedisStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
import os
auth = OAuthProxy(
...,
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
client\_storage=FernetEncryptionWrapper(
key\_value=RedisStore(host="redis.example.com", port=6379),
fernet=Fernet(os.environ["STORAGE\_ENCRYPTION\_KEY"])
)
)
`
```
Without encryption, upstream OAuth tokens are stored in plaintext.
Testing with in-memory storage (unencrypted):
```
`from key\_value.aio.stores.memory import MemoryStore
# Use in-memory storage for testing (clients lost on restart)
auth = OAuthProxy(..., client\_storage=MemoryStore())
`
```
[​
](#param-jwt-signing-key)
jwt\_signing\_key
str | bytes | None
Secret used to sign FastMCP JWT tokens issued to clients. Accepts any string or bytes - will be derived into a proper 32-byte cryptographic key using HKDF.**Default behavior (`None`):**
Derives a 32-byte key using PBKDF2 from the upstream client secret.**For production:**
Provide an explicit secret (e.g., from environment variable) to use a fixed key instead of the key derived from the upstream client secret. This allows you to manage keys securely in cloud environments, allows keys to work across multiple instances, and allows you to rotate keys without losing client registrations.
```
`import os
auth = OAuthProxy(
...,
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"], # Any sufficiently complex string!
client\_storage=RedisStore(...) # Persistent storage
)
`
```
See [HTTP Deployment - OAuth Token Security](/deployment/http#oauth-token-security) for complete production setup.
[​
](#param-require-authorization-consent)
require\_authorization\_consent
bool
default:"True"
Whether to require user consent before authorizing MCP clients. When enabled (default), users see a consent screen that displays which client is requesting access, preventing [confused deputy attacks](https://modelcontextprotocol.io/specification/2025-06-18/basic/security_best_practices#confused-deputy-problem) by ensuring users explicitly approve new clients.**Default behavior (True):**
Users see a consent screen on first authorization. Consent choices are remembered via signed cookies, so users only need to approve each client once. This protects against malicious clients impersonating the user.**Disabling consent (False):**
Authorization proceeds directly to the upstream provider without user confirmation. Only use this for local development or testing environments where the security trade-off is acceptable.
```
`# Development/testing only - skip consent screen
auth = OAuthProxy(
...,
require\_authorization\_consent=False # ⚠️ Security warning: only for local/testing
)
`
```
Disabling consent removes an important security layer. Only disable for local development or testing environments where you fully control all connecting clients.
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
```
`# Disable CSP entirely (let org CSP policies apply)
auth = OAuthProxy(..., consent\_csp\_policy="")
# Use custom CSP policy
auth = OAuthProxy(..., consent\_csp\_policy="default-src 'self'; style-src 'unsafe-inline'")
`
```
###
[​
](#using-built-in-providers)
Using Built-in Providers
FastMCP includes pre-configured providers for common services:
```
`from fastmcp.server.auth.providers.github import GitHubProvider
auth = GitHubProvider(
client\_id="your-github-app-id",
client\_secret="your-github-app-secret",
base\_url="https://your-server.com"
)
mcp = FastMCP(name="My Server", auth=auth)
`
```
Available providers include `GitHubProvider`, `GoogleProvider`, and others. These handle token verification automatically.
###
[​
](#token-verification)
Token Verification
The OAuth proxy requires a compatible `TokenVerifier` to validate tokens from your provider. Different providers use different token formats:
* **JWT tokens** (Google, Azure): Use `JWTVerifier` with the provider’s JWKS endpoint
* **Opaque tokens with RFC 7662 introspection** (Auth0, Okta, WorkOS): Use `IntrospectionTokenVerifier`
* **Opaque tokens (provider-specific)** (GitHub, Discord): Use provider-specific verifiers like `GitHubTokenVerifier`
See the [Token Verification guide](/servers/auth/token-verification) for detailed setup instructions for your provider.
###
[​
](#scope-configuration)
Scope Configuration
OAuth scopes control what permissions your application requests from users. They’re configured through your `TokenVerifier` (required for the OAuth proxy to validate tokens from your provider). Set `required\_scopes` to automatically request the permissions your application needs:
```
`JWTVerifier(..., required\_scopes = ["read:user", "write:data"])
`
```
Dynamic clients created by the proxy will automatically include these scopes in their authorization requests. See the [Token Verification](#token-verification) section below for detailed setup.
###
[​
](#custom-parameters)
Custom Parameters
Some OAuth providers require additional parameters beyond the standard OAuth2 flow. Use `extra\_authorize\_params` and `extra\_token\_params` to pass provider-specific requirements. For example, Auth0 requires an `audience` parameter to issue JWT tokens instead of opaque tokens:
```
`auth = OAuthProxy(
upstream\_authorization\_endpoint="https://your-domain.auth0.com/authorize",
upstream\_token\_endpoint="https://your-domain.auth0.com/oauth/token",
upstream\_client\_id="your-auth0-client-id",
upstream\_client\_secret="your-auth0-client-secret",
# Auth0-specific audience parameter
extra\_authorize\_params={"audience": "https://your-api-identifier.com"},
extra\_token\_params={"audience": "https://your-api-identifier.com"},
token\_verifier=JWTVerifier(
jwks\_uri="https://your-domain.auth0.com/.well-known/jwks.json",
issuer="https://your-domain.auth0.com/",
audience="https://your-api-identifier.com"
),
base\_url="https://your-server.com"
)
`
```
The proxy also automatically forwards RFC 8707 `resource` parameters from MCP clients to upstream providers that support them.
##
[​
](#oauth-flow)
OAuth Flow
The flow diagram above illustrates the complete OAuth proxy pattern. Let’s understand each phase:
###
[​
](#registration-phase)
Registration Phase
When an MCP client calls `/register` with its dynamic callback URL, the proxy responds with your pre-configured upstream credentials. The client stores these credentials believing it has registered a new app. Meanwhile, the proxy records the client’s callback URL for later use.
###
[​
](#authorization-phase)
Authorization Phase
The client initiates OAuth by redirecting to the proxy’s `/authorize` endpoint. The proxy:
1. Stores the client’s transaction with its PKCE challenge
2. Generates its own PKCE parameters for upstream security
3. Shows the user a consent page with the client’s details, redirect URI, and requested scopes
4. If the user approves (or the client was previously approved), sets a consent binding cookie and redirects to the upstream provider using the fixed callback URL
This dual-PKCE approach maintains end-to-end security at both the client-to-proxy and proxy-to-provider layers. The consent step protects against confused deputy attacks by ensuring you explicitly approve each client before it can complete authorization, and the consent binding cookie ensures that only the browser that approved consent can complete the callback.
###
[​
](#callback-phase)
Callback Phase
After user authorization, the provider redirects back to the proxy’s fixed callback URL. The proxy:
1. Verifies the consent binding cookie matches the transaction (rejecting requests from a different browser)
2. Exchanges the authorization code for tokens with the provider
3. Stores these tokens temporarily
4. Generates a new authorization code for the client
5. Redirects to the client’s original dynamic callback URL
###
[​
](#token-exchange-phase)
Token Exchange Phase
Finally, the client exchanges its authorization code with the proxy. The proxy validates the client’s PKCE verifier, then issues its own FastMCP JWT tokens (rather than forwarding the upstream provider’s tokens). See [Token Architecture](#token-architecture) for details on this design.
This entire flow is transparent to the MCP client—it experiences a standard OAuth flow with dynamic registration, unaware that a proxy is managing the complexity behind the scenes.
###
[​
](#token-architecture)
Token Architecture
The OAuth proxy implements a **token factory pattern**: instead of directly forwarding tokens from the upstream OAuth provider, it issues its own JWT tokens to MCP clients. This maintains proper OAuth 2.0 token audience boundaries and enables better security controls.
**How it works:**
When an MCP client completes authorization, the proxy:
1. **Receives upstream tokens** from the OAuth provider (GitHub, Google, etc.)
2. **Encrypts and stores** these tokens using Fernet encryption (AES-128-CBC + HMAC-SHA256)
3. **Issues FastMCP JWT tokens** to the client, signed with HS256
The FastMCP JWT contains minimal claims: issuer, audience, client ID, scopes, expiration, and a unique token identifier (JTI). The JTI acts as a reference linking to the encrypted upstream token.
**Token validation:**
When a client makes an MCP request with its FastMCP token:
1. **FastMCP validates the JWT** signature, expiration, issuer, and audience
2. **Looks up the upstream token** using the JTI from the validated JWT
3. **Decrypts and validates** the upstream token with the provider
This two-tier validation ensures that FastMCP tokens can only be used with this server (via audience validation) while maintaining full upstream token security.
This architecture also prevents [token passthrough](#token-passthrough) — see the [Security](#security) section for details.
**Token expiry alignment:**
FastMCP token lifetimes match the upstream token lifetimes. When the upstream token expires, the FastMCP token also expires, maintaining consistent security boundaries.
**Refresh tokens:**
The proxy issues its own refresh tokens that map to upstream refresh tokens. When a client uses a FastMCP refresh token, the proxy refreshes the upstream token and issues a new FastMCP access token.
###
[​
](#pkce-forwarding)
PKCE Forwarding
The OAuth proxy automatically handles PKCE (Proof Key for Code Exchange) when working with providers that support or require it. The proxy generates its own PKCE parameters to send upstream while separately validating the client’s PKCE, ensuring end-to-end security at both layers.
This is enabled by default via the `forward\_pkce` parameter and works seamlessly with providers like Google, Azure AD, and GitHub. Only disable it for legacy providers that don’t support PKCE:
```
`# Disable PKCE forwarding only if upstream doesn't support it
auth = OAuthProxy(
...,
forward\_pkce=False # Default is True
)
`
```
###
[​
](#redirect-uri-validation)
Redirect URI Validation
While the OAuth proxy accepts all redirect URIs by default (for DCR compatibility), you can restrict which clients can connect by specifying allowed patterns:
```
`# Allow only localhost clients (common for development)
auth = OAuthProxy(
# ... other parameters ...
allowed\_client\_redirect\_uris=[
"http://localhost:\*",
"http://127.0.0.1:\*"
]
)
# Allow specific known clients
auth = OAuthProxy(
# ... other parameters ...
allowed\_client\_redirect\_uris=[
"http://localhost:\*",
"https://claude.ai/api/mcp/auth\_callback",
"https://\*.mycompany.com/auth/\*" # Wildcard patterns supported
]
)
`
```
Check your server logs for “Client registered with redirect\_uri” messages to identify what URLs your clients use.
##
[​
](#cimd-support)
CIMD Support
The OAuth proxy supports **Client ID Metadata Documents (CIMD)**, an alternative to Dynamic Client Registration where clients host a static JSON document at an HTTPS URL. Instead of registering dynamically, clients simply provide their CIMD URL as their `client\_id`, and the server fetches and validates the metadata.
CIMD clients appear in the consent screen with a verified domain badge, giving users confidence about which application is requesting access. This provides stronger identity verification than DCR, where any client can claim any name.
###
[​
](#how-cimd-works)
How CIMD Works
When a client presents an HTTPS URL as its `client\_id` (for example, `https://myapp.example.com/oauth/client.json`), the OAuth proxy recognizes it as a CIMD client and:
1. Fetches the JSON document from that URL
2. Validates that the document’s `client\_id` field matches the URL
3. Extracts client metadata (name, redirect URIs, scopes, etc.)
4. Stores the client persistently alongside DCR clients
5. Shows the verified domain in the consent screen
This flow happens transparently. MCP clients that support CIMD simply provide their metadata URL instead of registering, and the OAuth proxy handles the rest.
###
[​
](#cimd-configuration)
CIMD Configuration
CIMD support is enabled by default for `OAuthProxy`.
## CIMD Parameters
[​
](#param-enable-cimd)
enable\_cimd
bool
default:"True"
Whether to accept CIMD URLs as client identifiers. When enabled, clients can use HTTPS URLs pointing to metadata documents as their `client\_id` instead of registering via DCR.
###
[​
](#private-key-jwt-authentication)
Private Key JWT Authentication
CIMD clients can authenticate using `private\_key\_jwt` instead of the default `none` authentication method. This provides cryptographic proof of client identity by signing JWT assertions with a private key, while the server verifies using the client’s public key from their CIMD document.
To use `private\_key\_jwt`, the CIMD document must include either a `jwks\_uri` (URL to fetch the public key set) or inline `jwks` (the key set directly in the document):
```
`{
"client\_id": "https://myapp.example.com/oauth/client.json",
"client\_name": "My Secure App",
"redirect\_uris": ["http://localhost:\*/callback"],
"token\_endpoint\_auth\_method": "private\_key\_jwt",
"jwks\_uri": "https://myapp.example.com/.well-known/jwks.json"
}
`
```
The OAuth proxy validates JWT assertions according to RFC 7523, checking the signature, issuer, audience, subject claims, and preventing replay attacks via JTI tracking.
###
[​
](#security-considerations)
Security Considerations
CIMD provides several security advantages over DCR:
* **Verified identity**: The domain in the `client\_id` URL is verified by HTTPS, so users know which organization is requesting access
* **No registration required**: Clients don’t need to store or manage dynamically-issued credentials
* **Redirect URI enforcement**: CIMD documents must declare `redirect\_uris`, which are enforced by the proxy (wildcard patterns supported)
* **SSRF protection**: The OAuth proxy blocks fetches to localhost, private IPs, and reserved addresses
* **Replay prevention**: For `private\_key\_jwt` clients, JTI claims are tracked to prevent assertion replay
* **Cache-aware fetching**: CIMD documents are cached according to HTTP cache headers and revalidated when required
CIMD is enabled by default. To disable it entirely (for example, to require all clients to register via DCR), set `enable\_cimd=False` explicitly:
```
`auth = OAuthProxy(
...,
enable\_cimd=False,
)
`
```
##
[​
](#security)
Security
###
[​
](#key-and-storage-management)
Key and Storage Management
The OAuth proxy requires cryptographic keys for JWT signing and storage encryption, plus persistent storage to maintain valid tokens across server restarts.
**Default behavior (appropriate for development only):**
* **Mac/Windows**: FastMCP automatically generates keys and stores them in your system keyring. Storage defaults to disk. Tokens survive server restarts. This is **only** suitable for development and local testing.
* **Linux**: Keys are ephemeral (random salt at startup). Storage defaults to memory. Tokens become invalid on server restart.
**For production:**
Configure the following parameters together: provide a unique `jwt\_signing\_key` (for signing FastMCP JWTs), and a shared `client\_storage` backend (for storing tokens). Both are required for production deployments. Use a network-accessible storage backend like Redis or DynamoDB rather than local disk storage. **Wrap your storage in `FernetEncryptionWrapper` to encrypt sensitive OAuth tokens at rest** (see the `client\_storage` parameter documentation above for examples). The keys accept any secret string and derive proper cryptographic keys using HKDF. See [OAuth Token Security](/deployment/http#oauth-token-security) and [Storage Backends](/servers/storage-backends) for complete production setup.
###
[​
](#confused-deputy-attacks)
Confused Deputy Attacks
A confused deputy attack allows a malicious client to steal your authorization by tricking you into granting it access under your identity.
The OAuth proxy works by bridging DCR clients to traditional auth providers, which means that multiple MCP clients connect through a single upstream OAuth application. An attacker can exploit this shared application by registering a malicious client with their own redirect URI, then sending you an authorization link. When you click it, your browser goes through the OAuth flow—but since you may have already authorized this OAuth app before, the provider might auto-approve the request. The authorization code then gets sent to the attacker’s redirect URI instead of a legitimate client, giving them access under your credentials.
####
[​
](#mitigation)
Mitigation
FastMCP’s OAuth proxy defends against confused deputy attacks with two layers of protection:
**Consent screen.** Before any authorization happens, you see a consent page showing the client’s details, redirect URI, and requested scopes. This gives you the opportunity to review and deny suspicious requests. Once you approve a client, it’s remembered so you don’t see the consent page again for that client. The consent mechanism is implemented with CSRF tokens and cryptographically signed cookies to prevent tampering.
The consent page automatically displays your server’s name, icon, and website URL, if available. These visual identifiers help users confirm they’re authorizing the correct server.
**Browser-session binding.** When you approve consent (or when a previously-approved client auto-approves), the proxy sets a cryptographically signed cookie that binds your browser session to the authorization flow. When the identity provider redirects back to the proxy’s callback, the proxy verifies that this cookie is present and matches the expected transaction. A different browser — such as a victim who was sent the authorization URL by an attacker — won’t have this cookie, and the callback will be rejected with a 403 error. This prevents the attack even when the identity provider skips the consent page for previously-authorized applications.
**Learn more:**
* [MCP Security Best Practices](https://modelcontextprotocol.io/specification/2025-06-18/basic/security_best_practices#confused-deputy-problem) - Official specification guidance
* [Confused Deputy Attacks Explained](https://den.dev/blog/mcp-confused-deputy-api-management/) - Detailed walkthrough by Den Delimarsky
###
[​
](#token-passthrough)
Token Passthrough
[Token passthrough](https://modelcontextprotocol.io/specification/2025-06-18/basic/security_best_practices#token-passthrough) occurs when an intermediary exposes upstream tokens to downstream clients, allowing those clients to impersonate the intermediary or access services they shouldn’t reach.
####
[​
](#client-facing-mitigation)
Client-facing mitigation
The OAuth proxy’s [token factory architecture](#token-architecture) prevents this by design. MCP clients only ever receive FastMCP-issued JWTs — the upstream provider token is never sent to the client. A FastMCP JWT is scoped to your server and cannot be used to access the upstream provider directly, even if intercepted.
####
[​
](#calling-downstream-services)
Calling downstream services
When your MCP server needs to call other APIs on behalf of the authenticated user, avoid forwarding the upstream token directly — this reintroduces the token passthrough problem in the other direction. Instead, use a token exchange flow like [OAuth 2.0 Token Exchange (RFC 8693)](https://datatracker.ietf.org/doc/html/rfc8693) or your provider’s equivalent (such as Azure’s [On-Behalf-Of flow](https://learn.microsoft.com/en-us/entra/identity-platform/v2-oauth2-on-behalf-of-flow)) to obtain a new token scoped to the downstream service.
The upstream token is available in your tool functions via `get\_access\_token()` or the `CurrentAccessToken` dependency, which you can use as the assertion for a token exchange. The exchanged token will be scoped to the specific downstream service and identify your MCP server as the authorized intermediary, maintaining proper audience boundaries throughout the chain.
##
[​
](#production-configuration)
Production Configuration
For production deployments, load sensitive credentials from environment variables:
```
`import os
from fastmcp import FastMCP
from fastmcp.server.auth.providers.github import GitHubProvider
# Load secrets from environment variables
auth = GitHubProvider(
client\_id=os.environ.get("GITHUB\_CLIENT\_ID"),
client\_secret=os.environ.get("GITHUB\_CLIENT\_SECRET"),
base\_url=os.environ.get("BASE\_URL", "https://your-production-server.com")
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