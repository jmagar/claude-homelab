Multiple Auth Sources - FastMCP
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
New in version `3.1.0`
Production servers often need to accept tokens from multiple authentication sources. An interactive application might authenticate through an OAuth proxy, while a backend service sends machine-to-machine JWT tokens directly. `MultiAuth` composes these sources into a single `auth` provider so every valid token is accepted regardless of where it was issued.
##
[​
](#understanding-multiauth)
Understanding MultiAuth
`MultiAuth` wraps an optional auth server (like `OAuthProxy`) together with one or more token verifiers (like `JWTVerifier`). When a request arrives with a bearer token, `MultiAuth` tries each source in order and accepts the first successful verification.
The auth server, if provided, is tried first. It owns all OAuth routes and metadata — the verifiers contribute only token verification logic. This keeps the MCP discovery surface clean: one set of routes, one set of metadata, multiple verification paths.
```
`from fastmcp import FastMCP
from fastmcp.server.auth import MultiAuth, OAuthProxy
from fastmcp.server.auth.providers.jwt import JWTVerifier
auth = MultiAuth(
server=OAuthProxy(
issuer\_url="https://login.example.com/...",
client\_id="my-app",
client\_secret="secret",
base\_url="https://my-server.com",
),
verifiers=[
JWTVerifier(
jwks\_uri="https://internal-issuer.example.com/.well-known/jwks.json",
issuer="https://internal-issuer.example.com",
audience="my-mcp-server",
),
],
)
mcp = FastMCP("My Server", auth=auth)
`
```
Interactive MCP clients authenticate through the OAuth proxy as usual. Backend services skip OAuth entirely and send a JWT signed by the internal issuer. Both paths are validated, and the first match wins.
##
[​
](#verification-order)
Verification Order
`MultiAuth` checks sources in a deterministic order:
1. **Server** (if provided) — the full auth provider’s `verify\_token` runs first
2. **Verifiers** — each `TokenVerifier` is tried in list order
The first source that returns a valid `AccessToken` wins. If every source returns `None`, the request receives a 401 response.
This ordering means the server acts as the “primary” authentication path, with verifiers as fallbacks for tokens the server doesn’t recognize.
##
[​
](#verifiers-only)
Verifiers Only
You don’t always need a full OAuth server. If your server only needs to accept tokens from multiple issuers, pass verifiers without a server:
```
`from fastmcp import FastMCP
from fastmcp.server.auth import MultiAuth
from fastmcp.server.auth.providers.jwt import JWTVerifier, StaticTokenVerifier
auth = MultiAuth(
verifiers=[
JWTVerifier(
jwks\_uri="https://issuer-a.example.com/.well-known/jwks.json",
issuer="https://issuer-a.example.com",
audience="my-server",
),
JWTVerifier(
jwks\_uri="https://issuer-b.example.com/.well-known/jwks.json",
issuer="https://issuer-b.example.com",
audience="my-server",
),
],
)
mcp = FastMCP("Multi-Issuer Server", auth=auth)
`
```
Without a server, no OAuth routes or metadata are served. This is appropriate for internal systems where clients already know how to obtain tokens.
##
[​
](#api-reference)
API Reference
###
[​
](#multiauth)
MultiAuth
|Parameter|Type|Description|
|`server`|`AuthProvider | None`|Optional auth provider that owns routes and OAuth metadata. Also tried first for token verification.|
|`verifiers`|`list[TokenVerifier] | TokenVerifier`|One or more token verifiers tried after the server.|
|`base\_url`|`str | None`|Override the base URL. Defaults to the server’s `base\_url`.|
|`required\_scopes`|`list[str] | None`|Override required scopes. Defaults to the server’s scopes.|