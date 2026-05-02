Authorization - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
##
[​
](#introduction)
Introduction
###
[​
](#purpose-and-scope)
Purpose and Scope
The Model Context Protocol provides authorization capabilities at the transport level,
enabling MCP clients to make requests to restricted MCP servers on behalf of resource
owners. This specification defines the authorization flow for HTTP-based transports.
###
[​
](#protocol-requirements)
Protocol Requirements
Authorization is **OPTIONAL** for MCP implementations. When supported:
* Implementations using an HTTP-based transport **SHOULD** conform to this specification.
* Implementations using an STDIO transport **SHOULD NOT** follow this specification, and
instead retrieve credentials from the environment.
* Implementations using alternative transports **MUST** follow established security best
practices for their protocol.
###
[​
](#standards-compliance)
Standards Compliance
This authorization mechanism is based on established specifications listed below, but
implements a selected subset of their features to ensure security and interoperability
while maintaining simplicity:
* [OAuth 2.1 IETF DRAFT](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-1-12)
* OAuth 2.0 Authorization Server Metadata
([RFC8414](https://datatracker.ietf.org/doc/html/rfc8414))
* OAuth 2.0 Dynamic Client Registration Protocol
([RFC7591](https://datatracker.ietf.org/doc/html/rfc7591))
##
[​
](#authorization-flow)
Authorization Flow
###
[​
](#overview)
Overview
1. MCP auth implementations **MUST** implement OAuth 2.1 with appropriate security
measures for both confidential and public clients.
2. MCP auth implementations **SHOULD** support the OAuth 2.0 Dynamic Client Registration
Protocol ([RFC7591](https://datatracker.ietf.org/doc/html/rfc7591)).
3. MCP servers **SHOULD** and MCP clients **MUST** implement OAuth 2.0 Authorization
Server Metadata ([RFC8414](https://datatracker.ietf.org/doc/html/rfc8414)). Servers
that do not support Authorization Server Metadata **MUST** follow the default URI
schema.
###
[​
](#oauth-grant-types)
OAuth Grant Types
OAuth specifies different flows or grant types, which are different ways of obtaining an
access token. Each of these targets different use cases and scenarios.
MCP servers **SHOULD** support the OAuth grant types that best align with the intended
audience. For instance:
1. Authorization Code: useful when the client is acting on behalf of a (human) end user.
* For instance, an agent calls an MCP tool implemented by a SaaS system.
* Client Credentials: the client is another application (not a human)
* For instance, an agent calls a secure MCP tool to check inventory at a specific
store. No need to impersonate the end user.
###
[​
](#example-authorization-code-grant)
Example: authorization code grant
This demonstrates the OAuth 2.1 flow for the authorization code grant type, used for user
auth.
**NOTE**: The following example assumes the MCP server is also functioning as the
authorization server. However, the authorization server may be deployed as its own
distinct service.
A human user completes the OAuth flow through a web browser, obtaining an access token
that identifies them personally and allows the client to act on their behalf.
When authorization is required and not yet proven by the client, servers **MUST** respond
with *HTTP 401 Unauthorized*.
Clients initiate the
[OAuth 2.1 IETF DRAFT](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-1-12#name-authorization-code-grant)
authorization flow after receiving the *HTTP 401 Unauthorized*.
The following demonstrates the basic OAuth 2.1 for public clients using PKCE.
###
[​
](#server-metadata-discovery)
Server Metadata Discovery
For server capability discovery:
* MCP clients *MUST* follow the OAuth 2.0 Authorization Server Metadata protocol defined
in [RFC8414](https://datatracker.ietf.org/doc/html/rfc8414).
* MCP server *SHOULD* follow the OAuth 2.0 Authorization Server Metadata protocol.
* MCP servers that do not support the OAuth 2.0 Authorization Server Metadata protocol,
*MUST* support fallback URLs.
The discovery flow is illustrated below:
####
[​
](#server-metadata-discovery-headers)
Server Metadata Discovery Headers
MCP clients *SHOULD* include the header `MCP-Protocol-Version: \<protocol-version\>` during
Server Metadata Discovery to allow the MCP server to respond based on the MCP protocol
version.
For example: `MCP-Protocol-Version: 2024-11-05`
####
[​
](#authorization-base-url)
Authorization Base URL
The authorization base URL **MUST** be determined from the MCP server URL by discarding
any existing `path` component. For example:
If the MCP server URL is `https://api.example.com/v1/mcp`, then:
* The authorization base URL is `https://api.example.com`
* The metadata endpoint **MUST** be at
`https://api.example.com/.well-known/oauth-authorization-server`
This ensures authorization endpoints are consistently located at the root level of the
domain hosting the MCP server, regardless of any path components in the MCP server URL.
####
[​
](#fallbacks-for-servers-without-metadata-discovery)
Fallbacks for Servers without Metadata Discovery
For servers that do not implement OAuth 2.0 Authorization Server Metadata, clients
**MUST** use the following default endpoint paths relative to the [authorization base
URL](#authorization-base-url):
|Endpoint|Default Path|Description|
|Authorization Endpoint|/authorize|Used for authorization requests|
|Token Endpoint|/token|Used for token exchange & refresh|
|Registration Endpoint|/register|Used for dynamic client registration|
For example, with an MCP server hosted at `https://api.example.com/v1/mcp`, the default
endpoints would be:
* `https://api.example.com/authorize`
* `https://api.example.com/token`
* `https://api.example.com/register`
Clients **MUST** first attempt to discover endpoints via the metadata document before
falling back to default paths. When using default paths, all other protocol requirements
remain unchanged.
###
[​
](#dynamic-client-registration)
Dynamic Client Registration
MCP clients and servers **SHOULD** support the
[OAuth 2.0 Dynamic Client Registration Protocol](https://datatracker.ietf.org/doc/html/rfc7591)
to allow MCP clients to obtain OAuth client IDs without user interaction. This provides a
standardized way for clients to automatically register with new servers, which is crucial
for MCP because:
* Clients cannot know all possible servers in advance
* Manual registration would create friction for users
* It enables seamless connection to new servers
* Servers can implement their own registration policies
Any MCP servers that *do not* support Dynamic Client Registration need to provide
alternative ways to obtain a client ID (and, if applicable, client secret). For one of
these servers, MCP clients will have to either:
1. Hardcode a client ID (and, if applicable, client secret) specifically for that MCP
server, or
2. Present a UI to users that allows them to enter these details, after registering an
OAuth client themselves (e.g., through a configuration interface hosted by the
server).
###
[​
](#authorization-flow-steps)
Authorization Flow Steps
The complete Authorization flow proceeds as follows:
####
[​
](#decision-flow-overview)
Decision Flow Overview
###
[​
](#access-token-usage)
Access Token Usage
####
[​
](#token-requirements)
Token Requirements
Access token handling **MUST** conform to
[OAuth 2.1 Section 5](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-1-12#section-5)
requirements for resource requests. Specifically:
1. MCP client **MUST** use the Authorization request header field
[Section 5.1.1](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-1-12#section-5.1.1):
```
`Authorization: Bearer \<access-token\>
`
```
Note that authorization **MUST** be included in every HTTP request from client to server,
even if they are part of the same logical session.
1. Access tokens **MUST NOT** be included in the URI query string
Example request:
```
`GET /v1/contexts HTTP/1.1
Host: mcp.example.com
Authorization: Bearer eyJhbGciOiJIUzI1NiIs...
`
```
####
[​
](#token-handling)
Token Handling
Resource servers **MUST** validate access tokens as described in
[Section 5.2](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-1-12#section-5.2).
If validation fails, servers **MUST** respond according to
[Section 5.3](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-v2-1-12#section-5.3)
error handling requirements. Invalid or expired tokens **MUST** receive a HTTP 401
response.
###
[​
](#security-considerations)
Security Considerations
The following security requirements **MUST** be implemented:
1. Clients **MUST** securely store tokens following OAuth 2.0 best practices
2. Servers **SHOULD** enforce token expiration and rotation
3. All authorization endpoints **MUST** be served over HTTPS
4. Servers **MUST** validate redirect URIs to prevent open redirect vulnerabilities
5. Redirect URIs **MUST** be either localhost URLs or HTTPS URLs
###
[​
](#error-handling)
Error Handling
Servers **MUST** return appropriate HTTP status codes for authorization errors:
|Status Code|Description|Usage|
|401|Unauthorized|Authorization required or token invalid|
|403|Forbidden|Invalid scopes or insufficient permissions|
|400|Bad Request|Malformed authorization request|
###
[​
](#implementation-requirements)
Implementation Requirements
1. Implementations **MUST** follow OAuth 2.1 security best practices
2. PKCE is **REQUIRED** for all clients
3. Token rotation **SHOULD** be implemented for enhanced security
4. Token lifetimes **SHOULD** be limited based on security requirements
###
[​
](#third-party-authorization-flow)
Third-Party Authorization Flow
####
[​
](#overview-2)
Overview
MCP servers **MAY** support delegated authorization through third-party authorization
servers. In this flow, the MCP server acts as both an OAuth client (to the third-party
auth server) and an OAuth authorization server (to the MCP client).
####
[​
](#flow-description)
Flow Description
The third-party authorization flow comprises these steps:
1. MCP client initiates standard OAuth flow with MCP server
2. MCP server redirects user to third-party authorization server
3. User authorizes with third-party server
4. Third-party server redirects back to MCP server with authorization code
5. MCP server exchanges code for third-party access token
6. MCP server generates its own access token bound to the third-party session
7. MCP server completes original OAuth flow with MCP client
####
[​
](#session-binding-requirements)
Session Binding Requirements
MCP servers implementing third-party authorization **MUST**:
1. Maintain secure mapping between third-party tokens and issued MCP tokens
2. Validate third-party token status before honoring MCP tokens
3. Implement appropriate token lifecycle management
4. Handle third-party token expiration and renewal
####
[​
](#security-considerations-2)
Security Considerations
When implementing third-party authorization, servers **MUST**:
1. Validate all redirect URIs
2. Securely store third-party credentials
3. Implement appropriate session timeout handling
4. Consider security implications of token chaining
5. Implement proper error handling for third-party auth failures
##
[​
](#best-practices)
Best Practices
####
[​
](#local-clients-as-public-oauth-2-1-clients)
Local clients as Public OAuth 2.1 Clients
We strongly recommend that local clients implement OAuth 2.1 as a public client:
1. Utilizing code challenges (PKCE) for authorization requests to prevent interception
attacks
2. Implementing secure token storage appropriate for the local system
3. Following token refresh best practices to maintain sessions
4. Properly handling token expiration and renewal
####
[​
](#authorization-metadata-discovery)
Authorization Metadata Discovery
We strongly recommend that all clients implement metadata discovery. This reduces the
need for users to provide endpoints manually or clients to fallback to the defined
defaults.
####
[​
](#dynamic-client-registration-2)
Dynamic Client Registration
Since clients do not know the set of MCP servers in advance, we strongly recommend the
implementation of dynamic client registration. This allows applications to automatically
register with the MCP server, and removes the need for users to obtain client ids
manually.