Upgrade Guide - FastMCP
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
This guide provides migration instructions for breaking changes and major updates when upgrading between FastMCP versions.
##
[​
](#v2-14-0)
v2.14.0
###
[​
](#openapi-parser-promotion)
OpenAPI Parser Promotion
The experimental OpenAPI parser is now the standard implementation. The legacy parser has been removed.
**If you were using the legacy parser:** No code changes required. The new parser is a drop-in replacement with improved architecture.
**If you were using the experimental parser:** Update your imports from the experimental module to the standard location:
Before
After
```
`from fastmcp.experimental.server.openapi import FastMCPOpenAPI, RouteMap, MCPType
`
```
The experimental imports will continue working temporarily but will show deprecation warnings. The `FASTMCP\_EXPERIMENTAL\_ENABLE\_NEW\_OPENAPI\_PARSER` environment variable is no longer needed and can be removed.
###
[​
](#deprecated-features-removed)
Deprecated Features Removed
The following deprecated features have been removed in v2.14.0:
**BearerAuthProvider** (deprecated in v2.11):
Before
After
```
`from fastmcp.server.auth.providers.bearer import BearerAuthProvider
`
```
**Context.get\_http\_request()** (deprecated in v2.2.11):
Before
After
```
`request = context.get\_http\_request()
`
```
**Top-level Image import** (deprecated in v2.8.1):
Before
After
```
`from fastmcp import Image
`
```
**FastMCP dependencies parameter** (deprecated in v2.11.4):
Before
After
```
`mcp = FastMCP("server", dependencies=["requests", "pandas"])
`
```
**Legacy resource prefix format**: The `resource\_prefix\_format` parameter and “protocol” format have been removed. Only the “path” format is supported (this was already the default).
**FastMCPProxy client parameter**:
Before
After
```
`proxy = FastMCPProxy(client=my\_client)
`
```
**output\_schema=False**:
Before
After
```
`@mcp.tool(output\_schema=False)
def my\_tool() -\> str:
return "result"
`
```
##
[​
](#v2-13-0)
v2.13.0
###
[​
](#oauth-token-key-management)
OAuth Token Key Management
The OAuth proxy now issues its own JWT tokens to clients instead of forwarding upstream provider tokens. This improves security by maintaining proper token audience boundaries.
**What changed:**
The OAuth proxy now implements a token factory pattern - it receives tokens from your OAuth provider (GitHub, Google, etc.), encrypts and stores them, then issues its own FastMCP JWT tokens to clients. This requires cryptographic keys for JWT signing and token encryption.
**Default behavior (development):**
By default, FastMCP automatically manages keys based on your platform:
* **Mac/Windows**: Keys are auto-managed via system keyring, surviving server restarts with zero configuration. Suitable **only** for development and local testing.
* **Linux**: Keys are ephemeral (random salt at startup, regenerated on each restart).
This works fine for development and testing where re-authentication after restart is acceptable.
**For production:**
Production deployments must provide explicit keys and use persistent storage. Add these three things:
```
`auth = GitHubProvider(
client\_id=os.environ["GITHUB\_CLIENT\_ID"],
client\_secret=os.environ["GITHUB\_CLIENT\_SECRET"],
base\_url="https://your-server.com",
# Explicit keys (required for production)
jwt\_signing\_key=os.environ["JWT\_SIGNING\_KEY"],
# Persistent network storage (required for production)
client\_storage=RedisStore(host="redis.example.com", port=6379)
)
`
```
**More information:**
* [OAuth Token Security](/v2/deployment/http#oauth-token-security) - Complete production setup guide
* [Key and Storage Management](/v2/servers/auth/oauth-proxy#key-and-storage-management) - Detailed explanation of defaults and production requirements
* [OAuth Proxy Parameters](/v2/servers/auth/oauth-proxy#configuration-parameters) - Parameter documentation