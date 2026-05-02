Bearer Token Authentication - FastMCP
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
Bearer Token authentication is only relevant for HTTP-based transports.
You can configure your FastMCP client to use **bearer authentication** by supplying a valid access token. This is most appropriate for service accounts, long-lived API keys, CI/CD, applications where authentication is managed separately, or other non-interactive authentication methods.
A Bearer token is a JSON Web Token (JWT) that is used to authenticate a request. It is most commonly used in the `Authorization` header of an HTTP request, using the `Bearer` scheme:
```
`Authorization: Bearer \<token\>
`
```
##
[​
](#client-usage)
Client Usage
The most straightforward way to use a pre-existing Bearer token is to provide it as a string to the `auth` parameter of the `fastmcp.Client` or transport instance. FastMCP will automatically format it correctly for the `Authorization` header and bearer scheme.
If you’re using a string token, do not include the `Bearer` prefix. FastMCP will add it for you.
```
`from fastmcp import Client
async with Client(
"https://your-server.fastmcp.app/mcp",
auth="\<your-token\>",
) as client:
await client.ping()
`
```
You can also supply a Bearer token to a transport instance, such as `StreamableHttpTransport` or `SSETransport`:
```
`from fastmcp import Client
from fastmcp.client.transports import StreamableHttpTransport
transport = StreamableHttpTransport(
"http://your-server.fastmcp.app/mcp",
auth="\<your-token\>",
)
async with Client(transport) as client:
await client.ping()
`
```
##
[​
](#bearerauth-helper)
`BearerAuth` Helper
If you prefer to be more explicit and not rely on FastMCP to transform your string token, you can use the `BearerAuth` class yourself, which implements the `httpx.Auth` interface.
```
`from fastmcp import Client
from fastmcp.client.auth import BearerAuth
async with Client(
"https://your-server.fastmcp.app/mcp",
auth=BearerAuth(token="\<your-token\>"),
) as client:
await client.ping()
`
```
##
[​
](#custom-headers)
Custom Headers
If the MCP server expects a custom header or token scheme, you can manually set the client’s `headers` instead of using the `auth` parameter by setting them on your transport:
```
`from fastmcp import Client
from fastmcp.client.transports import StreamableHttpTransport
async with Client(
transport=StreamableHttpTransport(
"https://your-server.fastmcp.app/mcp",
headers={"X-API-Key": "\<your-token\>"},
),
) as client:
await client.ping()
`
```