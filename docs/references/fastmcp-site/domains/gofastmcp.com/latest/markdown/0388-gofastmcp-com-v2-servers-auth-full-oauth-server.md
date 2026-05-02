Full OAuth Server - FastMCP
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
**This is an extremely advanced pattern that most users should avoid.** Building a secure OAuth 2.1 server requires deep expertise in authentication protocols, cryptography, and security best practices. The complexity extends far beyond initial implementation to include ongoing security monitoring, threat response, and compliance maintenance.**Use [Remote OAuth](/v2/servers/auth/remote-oauth) instead** unless you have compelling requirements that external identity providers cannot meet, such as air-gapped environments or specialized compliance needs.
The Full OAuth Server pattern exists to support the MCP protocol specification’s requirements. Your FastMCP server becomes both an Authorization Server and Resource Server, handling the complete authentication lifecycle from user login to token validation.
This documentation exists for completeness - the vast majority of applications should use external identity providers instead.
##
[​
](#oauthprovider)
OAuthProvider
FastMCP provides the `OAuthProvider` abstract class that implements the OAuth 2.1 specification. To use this pattern, you must subclass `OAuthProvider` and implement all required abstract methods.
`OAuthProvider` handles OAuth endpoints, protocol flows, and security requirements, but delegates all storage, user management, and business logic to your implementation of the abstract methods.
##
[​
](#required-implementation)
Required Implementation
You must implement these abstract methods to create a functioning OAuth server:
###
[​
](#client-management)
Client Management
## Client Management Methods
[​
](#param-get-client)
get\_client
async method
Retrieve client information by ID from your database.
Show Parameters
[​
](#param-client-id)
client\_id
str
Client identifier to look up
Show Returns
[​
](#param-o-auth-client-information-full-none)
OAuthClientInformationFull | None
return type
Client information object or `None` if client not found
[​
](#param-register-client)
register\_client
async method
Store new client registration information in your database.
Show Parameters
[​
](#param-client-info)
client\_info
OAuthClientInformationFull
Complete client registration information to store
Show Returns
[​
](#param-none)
None
return type
No return value
###
[​
](#authorization-flow)
Authorization Flow
## Authorization Flow Methods
[​
](#param-authorize)
authorize
async method
Handle authorization request and return redirect URL. Must implement user authentication and consent collection.
Show Parameters
[​
](#param-client)
client
OAuthClientInformationFull
OAuth client making the authorization request
[​
](#param-params)
params
AuthorizationParams
Authorization request parameters from the client
Show Returns
[​
](#param-str)
str
return type
Redirect URL to send the client to
[​
](#param-load-authorization-code)
load\_authorization\_code
async method
Load authorization code from storage by code string. Return `None` if code is invalid or expired.
Show Parameters
[​
](#param-client-1)
client
OAuthClientInformationFull
OAuth client attempting to use the authorization code
[​
](#param-authorization-code)
authorization\_code
str
Authorization code string to look up
Show Returns
[​
](#param-authorization-code-none)
AuthorizationCode | None
return type
Authorization code object or `None` if not found
###
[​
](#token-management)
Token Management
## Token Management Methods
[​
](#param-exchange-authorization-code)
exchange\_authorization\_code
async method
Exchange authorization code for access and refresh tokens. Must validate code and create new tokens.
Show Parameters
[​
](#param-client-2)
client
OAuthClientInformationFull
OAuth client exchanging the authorization code
[​
](#param-authorization-code-1)
authorization\_code
AuthorizationCode
Valid authorization code object to exchange
Show Returns
[​
](#param-o-auth-token)
OAuthToken
return type
New OAuth token containing access and refresh tokens
[​
](#param-load-refresh-token)
load\_refresh\_token
async method
Load refresh token from storage by token string. Return `None` if token is invalid or expired.
Show Parameters
[​
](#param-client-3)
client
OAuthClientInformationFull
OAuth client attempting to use the refresh token
[​
](#param-refresh-token)
refresh\_token
str
Refresh token string to look up
Show Returns
[​
](#param-refresh-token-none)
RefreshToken | None
return type
Refresh token object or `None` if not found
[​
](#param-exchange-refresh-token)
exchange\_refresh\_token
async method
Exchange refresh token for new access/refresh token pair. Must validate scopes and token.
Show Parameters
[​
](#param-client-4)
client
OAuthClientInformationFull
OAuth client using the refresh token
[​
](#param-refresh-token-1)
refresh\_token
RefreshToken
Valid refresh token object to exchange
[​
](#param-scopes)
scopes
list[str]
Requested scopes for the new access token
Show Returns
[​
](#param-o-auth-token-1)
OAuthToken
return type
New OAuth token with updated access and refresh tokens
[​
](#param-load-access-token)
load\_access\_token
async method
Load an access token by its token string.
Show Parameters
[​
](#param-token)
token
str
The access token to verify
Show Returns
[​
](#param-access-token-none)
AccessToken | None
return type
The access token object, or `None` if the token is invalid
[​
](#param-revoke-token)
revoke\_token
async method
Revoke access or refresh token, marking it as invalid in storage.
Show Parameters
[​
](#param-token-1)
token
AccessToken | RefreshToken
Token object to revoke and mark invalid
Show Returns
[​
](#param-none-1)
None
return type
No return value
[​
](#param-verify-token)
verify\_token
async method
Verify bearer token for incoming requests. Return `AccessToken` if valid, `None` if invalid.
Show Parameters
[​
](#param-token-2)
token
str
Bearer token string from incoming request
Show Returns
[​
](#param-access-token-none-1)
AccessToken | None
return type
Access token object if valid, `None` if invalid or expired
Each method must handle storage, validation, security, and error cases according to the OAuth 2.1 specification. The implementation complexity is substantial and requires expertise in OAuth security considerations.
**Security Notice:** OAuth server implementation involves numerous security considerations including PKCE, state parameters, redirect URI validation, token binding, replay attack prevention, and secure storage requirements. Mistakes can lead to serious security vulnerabilities.