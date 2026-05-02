OAuth Authentication - FastMCP
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
* [
OAuth
NEW
](/v2/clients/auth/oauth)
* [
Bearer Auth
](/v2/clients/auth/bearer)
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
New in version `2.6.0`
OAuth authentication is only relevant for HTTP-based transports and requires user interaction via a web browser.
When your FastMCP client needs to access an MCP server protected by OAuth 2.1, and the process requires user interaction (like logging in and granting consent), you should use the Authorization Code Flow. FastMCP provides the `fastmcp.client.auth.OAuth` helper to simplify this entire process.
This flow is common for user-facing applications where the application acts on behalf of the user.
##
[​
](#client-usage)
Client Usage
###
[​
](#default-configuration)
Default Configuration
The simplest way to use OAuth is to pass the string `"oauth"` to the `auth` parameter of the `Client` or transport instance. FastMCP will automatically configure the client to use OAuth with default settings:
```
`from fastmcp import Client
# Uses default OAuth settings
async with Client("https://your-server.fastmcp.app/mcp", auth="oauth") as client:
await client.ping()
`
```
###
[​
](#oauth-helper)
`OAuth` Helper
To fully configure the OAuth flow, use the `OAuth` helper and pass it to the `auth` parameter of the `Client` or transport instance. `OAuth` manages the complexities of the OAuth 2.1 Authorization Code Grant with PKCE (Proof Key for Code Exchange) for enhanced security, and implements the full `httpx.Auth` interface.
```
`from fastmcp import Client
from fastmcp.client.auth import OAuth
oauth = OAuth(mcp\_url="https://your-server.fastmcp.app/mcp")
async with Client("https://your-server.fastmcp.app/mcp", auth=oauth) as client:
await client.ping()
`
```
####
[​
](#oauth-parameters)
`OAuth` Parameters
* **`mcp\_url`** (`str`): The full URL of the target MCP server endpoint. Used to discover OAuth server metadata
* **`scopes`** (`str | list[str]`, optional): OAuth scopes to request. Can be space-separated string or list of strings
* **`client\_name`** (`str`, optional): Client name for dynamic registration. Defaults to `"FastMCP Client"`
* **`token\_storage`** (`AsyncKeyValue`, optional): Storage backend for persisting OAuth tokens. Defaults to in-memory storage (tokens lost on restart). See [Token Storage](#token-storage) for encrypted storage options
* **`additional\_client\_metadata`** (`dict[str, Any]`, optional): Extra metadata for client registration
* **`callback\_port`** (`int`, optional): Fixed port for OAuth callback server. If not specified, uses a random available port
##
[​
](#oauth-flow)
OAuth Flow
The OAuth flow is triggered when you use a FastMCP `Client` configured to use OAuth.
1
[
](#)
Token Check
The client first checks the configured `token\_storage` backend for existing, valid tokens for the target server. If one is found, it will be used to authenticate the client.
2
[
](#)
OAuth Server Discovery
If no valid tokens exist, the client attempts to discover the OAuth server’s endpoints using a well-known URI (e.g., `/.well-known/oauth-authorization-server`) based on the `mcp\_url`.
3
[
](#)
Dynamic Client Registration
If the OAuth server supports it and the client isn’t already registered (or credentials aren’t cached), the client performs dynamic client registration according to RFC 7591.
4
[
](#)
Local Callback Server
A temporary local HTTP server is started on an available port (or the port specified via `callback\_port`). This server’s address (e.g., `http://127.0.0.1:\<port\>/callback`) acts as the `redirect\_uri` for the OAuth flow.
5
[
](#)
Browser Interaction
The user’s default web browser is automatically opened, directing them to the OAuth server’s authorization endpoint. The user logs in and grants (or denies) the requested `scopes`.
6
[
](#)
Authorization Code & Token Exchange
Upon approval, the OAuth server redirects the user’s browser to the local callback server with an `authorization\_code`. The client captures this code and exchanges it with the OAuth server’s token endpoint for an `access\_token` (and often a `refresh\_token`) using PKCE for security.
7
[
](#)
Token Caching
The obtained tokens are saved to the configured `token\_storage` backend for future use, eliminating the need for repeated browser interactions.
8
[
](#)
Authenticated Requests
The access token is automatically included in the `Authorization` header for requests to the MCP server.
9
[
](#)
Refresh Token
If the access token expires, the client will automatically use the refresh token to get a new access token.
##
[​
](#token-storage)
Token Storage
New in version `2.13.0`
By default, tokens are stored in memory and lost when your application restarts. For persistent storage, pass an `AsyncKeyValue`-compatible storage backend to the `token\_storage` parameter.
**Security Consideration**: Use encrypted storage for production. MCP clients can accumulate OAuth credentials for many servers over time, and a compromised token store could expose access to multiple services.
```
`from fastmcp import Client
from fastmcp.client.auth import OAuth
from key\_value.aio.stores.disk import DiskStore
from key\_value.aio.wrappers.encryption import FernetEncryptionWrapper
from cryptography.fernet import Fernet
import os
# Create encrypted disk storage
encrypted\_storage = FernetEncryptionWrapper(
key\_value=DiskStore(directory="\~/.fastmcp/oauth-tokens"),
fernet=Fernet(os.environ["OAUTH\_STORAGE\_ENCRYPTION\_KEY"])
)
oauth = OAuth(
mcp\_url="https://your-server.fastmcp.app/mcp",
token\_storage=encrypted\_storage
)
async with Client("https://your-server.fastmcp.app/mcp", auth=oauth) as client:
await client.ping()
`
```
You can use any `AsyncKeyValue`-compatible backend from the [key-value library](https://github.com/strawgate/py-key-value) including Redis, DynamoDB, and more. Wrap your storage in `FernetEncryptionWrapper` for encryption.
When selecting a storage backend, review the [py-key-value documentation](https://github.com/strawgate/py-key-value) to understand the maturity level and limitations of your chosen backend. Some backends may be in preview or have constraints that affect production suitability.