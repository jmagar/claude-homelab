Authentication - FastMCP
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
* [
Overview
](/v2/servers/auth/authentication)
* [
Token Verification
](/v2/servers/auth/token-verification)
* [
Remote OAuth
NEW
](/v2/servers/auth/remote-oauth)
* [
OAuth Proxy
NEW
](/v2/servers/auth/oauth-proxy)
* [
OIDC Proxy
NEW
](/v2/servers/auth/oidc-proxy)
* [
Full OAuth Server
](/v2/servers/auth/full-oauth-server)
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
Authentication in MCP presents unique challenges that differ from traditional web applications. MCP clients need to discover authentication requirements automatically, negotiate OAuth flows without user intervention, and work seamlessly across different identity providers. FastMCP addresses these challenges by providing authentication patterns that integrate with the MCP protocol while remaining simple to implement and deploy.
Authentication applies only to FastMCP’s HTTP-based transports (`http` and `sse`). The STDIO transport inherits security from its local execution environment.
**Authentication is rapidly evolving in MCP.** The specification and best practices are changing quickly. FastMCP aims to provide stable, secure patterns that adapt to these changes while keeping your code simple and maintainable.
##
[​
](#mcp-authentication-challenges)
MCP Authentication Challenges
Traditional web authentication assumes a human user with a browser who can interact with login forms and consent screens. MCP clients are often automated systems that need to authenticate without human intervention. This creates several unique requirements:
**Automatic Discovery**: MCP clients must discover authentication requirements by examining server metadata rather than encountering login redirects.
**Programmatic OAuth**: OAuth flows must work without human interaction, relying on pre-configured credentials or Dynamic Client Registration.
**Token Management**: Clients need to obtain, refresh, and manage tokens automatically across multiple MCP servers.
**Protocol Integration**: Authentication must integrate cleanly with MCP’s transport mechanisms and error handling.
These challenges mean that not all authentication approaches work well with MCP. The patterns that do work fall into three categories based on the level of authentication responsibility your server assumes.
##
[​
](#authentication-responsibility)
Authentication Responsibility
Authentication responsibility exists on a spectrum. Your MCP server can validate tokens created elsewhere, coordinate with external identity providers, or handle the complete authentication lifecycle internally. Each approach involves different trade-offs between simplicity, security, and control.
###
[​
](#token-validation)
Token Validation
Your server validates tokens but delegates their creation to external systems. This approach treats your MCP server as a pure resource server that trusts tokens signed by known issuers.
Token validation works well when you already have authentication infrastructure that can issue structured tokens like JWTs. Your existing API gateway, microservices platform, or enterprise SSO system becomes the source of truth for user identity, while your MCP server focuses on its core functionality.
The key insight is that token validation separates authentication (proving who you are) from authorization (determining what you can do). Your MCP server receives proof of identity in the form of a signed token and makes access decisions based on the claims within that token.
This pattern excels in microservices architectures where multiple services need to validate the same tokens, or when integrating MCP servers into existing systems that already handle user authentication.
###
[​
](#external-identity-providers)
External Identity Providers
Your server coordinates with established identity providers to create seamless authentication experiences for MCP clients. This approach leverages OAuth 2.0 and OpenID Connect protocols to delegate user authentication while maintaining control over authorization decisions.
External identity providers handle the complex aspects of authentication: user credential verification, multi-factor authentication, account recovery, and security monitoring. Your MCP server receives tokens from these trusted providers and validates them using the provider’s public keys.
The MCP protocol’s support for Dynamic Client Registration makes this pattern particularly powerful. MCP clients can automatically discover your authentication requirements and register themselves with your identity provider without manual configuration.
This approach works best for production applications that need enterprise-grade authentication features without the complexity of building them from scratch. It scales well across multiple applications and provides consistent user experiences.
###
[​
](#full-oauth-implementation)
Full OAuth Implementation
Your server implements a complete OAuth 2.0 authorization server, handling everything from user credential verification to token lifecycle management. This approach provides maximum control at the cost of significant complexity.
Full OAuth implementation means building user interfaces for login and consent, implementing secure credential storage, managing token lifecycles, and maintaining ongoing security updates. The complexity extends beyond initial implementation to include threat monitoring, compliance requirements, and keeping pace with evolving security best practices.
This pattern makes sense only when you need complete control over the authentication process, operate in air-gapped environments, or have specialized requirements that external providers cannot meet.
##
[​
](#fastmcp-authentication-providers)
FastMCP Authentication Providers
FastMCP translates these authentication responsibility levels into a variety of concrete classes that handle the complexities of MCP protocol integration. You can build on these classes to handle the complexities of MCP protocol integration.
###
[​
](#tokenverifier)
TokenVerifier
`TokenVerifier` provides pure token validation without OAuth metadata endpoints. This class focuses on the essential task of determining whether a token is valid and extracting authorization information from its claims.
The implementation handles JWT signature verification, expiration checking, and claim extraction. It validates tokens against known issuers and audiences, ensuring that tokens intended for your server are not accepted by other systems.
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.jwt import JWTVerifier
auth = JWTVerifier(
jwks\_uri="https://your-auth-system.com/.well-known/jwks.json",
issuer="https://your-auth-system.com",
audience="your-mcp-server"
)
mcp = FastMCP(name="Protected Server", auth=auth)
`
```
This example configures token validation against a JWT issuer. The `JWTVerifier` will fetch public keys from the JWKS endpoint and validate incoming tokens against those keys. Only tokens with the correct issuer and audience claims will be accepted.
`TokenVerifier` works well when you control both the token issuer and your MCP server, or when integrating with existing JWT-based infrastructure.
→ **Complete guide**: [Token Verification](/v2/servers/auth/token-verification)
###
[​
](#remoteauthprovider)
RemoteAuthProvider
`RemoteAuthProvider` enables authentication with identity providers that **support Dynamic Client Registration (DCR)**, such as Descope and WorkOS AuthKit. With DCR, MCP clients can automatically register themselves with the identity provider and obtain credentials without any manual configuration.
This class combines token validation with OAuth discovery metadata. It extends `TokenVerifier` functionality by adding OAuth 2.0 protected resource endpoints that advertise your authentication requirements. MCP clients examine these endpoints to understand which identity providers you trust and how to obtain valid tokens.
The key requirement is that your identity provider must support DCR - the ability for clients to dynamically register and obtain credentials. This is what enables the seamless, automated authentication flow that MCP requires.
For example, the built-in `AuthKitProvider` uses WorkOS AuthKit, which fully supports DCR:
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.workos import AuthKitProvider
auth = AuthKitProvider(
authkit\_domain="https://your-project.authkit.app",
base\_url="https://your-fastmcp-server.com"
)
mcp = FastMCP(name="Enterprise Server", auth=auth)
`
```
This example uses WorkOS AuthKit as the external identity provider. The `AuthKitProvider` automatically configures token validation against WorkOS and provides the OAuth metadata that MCP clients need for automatic authentication.
`RemoteAuthProvider` is ideal for production applications when your identity provider supports Dynamic Client Registration (DCR). This enables fully automated authentication without manual client configuration.
→ **Complete guide**: [Remote OAuth](/v2/servers/auth/remote-oauth)
###
[​
](#oauthproxy)
OAuthProxy
New in version `2.12.0`
`OAuthProxy` enables authentication with OAuth providers that **don’t support Dynamic Client Registration (DCR)**, such as GitHub, Google, Azure, AWS, and most traditional enterprise identity systems.
When identity providers require manual app registration and fixed credentials, `OAuthProxy` bridges the gap. It presents a DCR-compliant interface to MCP clients (accepting any registration request) while using your pre-registered credentials with the upstream provider. The proxy handles the complexity of callback forwarding, enabling dynamic client callbacks to work with providers that require fixed redirect URIs.
This class solves the fundamental incompatibility between MCP’s expectation of dynamic registration and traditional OAuth providers’ requirement for manual app registration.
For example, the built-in `GitHubProvider` extends `OAuthProxy` to work with GitHub’s OAuth system:
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.github import GitHubProvider
auth = GitHubProvider(
client\_id="Ov23li...", # Your GitHub OAuth App ID
client\_secret="abc123...", # Your GitHub OAuth App Secret
base\_url="https://your-server.com"
)
mcp = FastMCP(name="GitHub-Protected Server", auth=auth)
`
```
This example uses the GitHub provider, which extends `OAuthProxy` with GitHub-specific token validation. The proxy handles the complete OAuth flow while making GitHub’s non-DCR authentication work seamlessly with MCP clients.
`OAuthProxy` is essential when integrating with OAuth providers that don’t support DCR. This includes most established providers like GitHub, Google, and Azure, which require manual app registration through their developer consoles.
→ **Complete guide**: [OAuth Proxy](/v2/servers/auth/oauth-proxy)
###
[​
](#oauthprovider)
OAuthProvider
`OAuthProvider` implements a complete OAuth 2.0 authorization server within your MCP server. This class handles the full authentication lifecycle from user credential verification to token management.
The implementation provides all required OAuth endpoints including authorization, token, and discovery endpoints. It manages client registration, user consent, and token lifecycle while integrating with your user storage and authentication logic.
```
`from fastmcp import FastMCP
from fastmcp.server.auth.providers.oauth import MyOAuthProvider
auth = MyOAuthProvider(
user\_store=your\_user\_database,
client\_store=your\_client\_registry,
# Additional configuration...
)
mcp = FastMCP(name="Auth Server", auth=auth)
`
```
This example shows the basic structure of a custom OAuth provider. The actual implementation requires significant additional configuration for user management, client registration, and security policies.
`OAuthProvider` should be used only when you have specific requirements that external providers cannot meet and the expertise to implement OAuth securely.
→ **Complete guide**: [Full OAuth Server](/v2/servers/auth/full-oauth-server)
##
[​
](#configuration-approaches)
Configuration Approaches
FastMCP supports both programmatic configuration for maximum flexibility and environment-based configuration for deployment simplicity.
###
[​
](#programmatic-configuration)
Programmatic Configuration
Programmatic configuration provides complete control over authentication settings and allows for complex initialization logic. This approach works well during development and when you need to customize authentication behavior based on runtime conditions.
Authentication providers are instantiated directly in your code with their required parameters. This makes dependencies explicit and allows your IDE to provide helpful autocompletion and type checking.
###
[​
](#environment-configuration)
Environment Configuration
New in version `2.12.1`
Environment-based configuration separates authentication settings from application code, enabling the same codebase to work across different deployment environments without modification.
FastMCP automatically detects authentication configuration from environment variables when no explicit `auth` parameter is provided. The configuration system supports all authentication providers and their various options.
####
[​
](#provider-configuration)
Provider Configuration
Authentication providers are configured by specifying the full module path to the provider class:
[​
](#param-fastmcp-server-auth)
FASTMCP\_SERVER\_AUTH
string
The full module path to the authentication provider class. Examples:
* `fastmcp.server.auth.providers.github.GitHubProvider` - GitHub OAuth
* `fastmcp.server.auth.providers.google.GoogleProvider` - Google OAuth
* `fastmcp.server.auth.providers.jwt.JWTVerifier` - JWT token verification
* `fastmcp.server.auth.providers.workos.WorkOSProvider` - WorkOS OAuth
* `fastmcp.server.auth.providers.workos.AuthKitProvider` - WorkOS AuthKit
* `mycompany.auth.CustomProvider` - Your custom provider class
When using providers like GitHub or Google, you’ll need to set provider-specific environment variables:
```
`# GitHub OAuth
export FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.github.GitHubProvider
export FASTMCP\_SERVER\_AUTH\_GITHUB\_CLIENT\_ID="Ov23li..."
export FASTMCP\_SERVER\_AUTH\_GITHUB\_CLIENT\_SECRET="github\_pat\_..."
# Google OAuth
export FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.google.GoogleProvider
export FASTMCP\_SERVER\_AUTH\_GOOGLE\_CLIENT\_ID="123456.apps.googleusercontent.com"
export FASTMCP\_SERVER\_AUTH\_GOOGLE\_CLIENT\_SECRET="GOCSPX-..."
`
```
####
[​
](#provider-specific-configuration)
Provider-Specific Configuration
Each provider has its own configuration options set through environment variables:
```
`# JWT Token Verification
export FASTMCP\_SERVER\_AUTH=fastmcp.server.auth.providers.jwt.JWTVerifier
export FASTMCP\_SERVER\_AUTH\_JWT\_JWKS\_URI="https://auth.example.com/jwks"
export FASTMCP\_SERVER\_AUTH\_JWT\_ISSUER="https://auth.example.com"
export FASTMCP\_SERVER\_AUTH\_JWT\_AUDIENCE="mcp-server"
# Custom Provider
export FASTMCP\_SERVER\_AUTH=mycompany.auth.CustomProvider
# Plus any environment variables your custom provider expects
`
```
With these environment variables set, creating an authenticated FastMCP server requires no additional configuration:
```
`from fastmcp import FastMCP
# Authentication automatically configured from environment
mcp = FastMCP(name="My Server")
`
```
This approach simplifies deployment pipelines and follows twelve-factor app principles for configuration management.
##
[​
](#choosing-your-implementation)
Choosing Your Implementation
The authentication approach you choose depends on your existing infrastructure, security requirements, and operational constraints.
**For OAuth providers without DCR support (GitHub, Google, Azure, AWS, most enterprise systems), use OAuth Proxy.** These providers require manual app registration through their developer consoles. OAuth Proxy bridges the gap by presenting a DCR-compliant interface to MCP clients while using your fixed credentials with the provider. The proxy’s callback forwarding pattern enables dynamic client ports to work with providers that require fixed redirect URIs.
**For identity providers with DCR support (Descope, WorkOS AuthKit, modern auth platforms), use RemoteAuthProvider.** These providers allow clients to dynamically register and obtain credentials without manual configuration. This enables the fully automated authentication flow that MCP is designed for, providing the best user experience and simplest implementation.
**Token validation works well when you already have authentication infrastructure that issues structured tokens.** If your organization already uses JWT-based systems, API gateways, or enterprise SSO that can generate tokens, this approach integrates seamlessly while keeping your MCP server focused on its core functionality. The simplicity comes from leveraging existing investment in authentication infrastructure.
**Full OAuth implementation should be avoided unless you have compelling reasons that external providers cannot address.** Air-gapped environments, specialized compliance requirements, or unique organizational constraints might justify this approach, but it requires significant security expertise and ongoing maintenance commitment. The complexity extends far beyond initial implementation to include threat monitoring, security updates, and keeping pace with evolving attack vectors.
FastMCP’s architecture supports migration between these approaches as your requirements evolve. You can integrate with existing token systems initially and migrate to external identity providers as your application scales, or implement custom solutions when your requirements outgrow standard patterns.