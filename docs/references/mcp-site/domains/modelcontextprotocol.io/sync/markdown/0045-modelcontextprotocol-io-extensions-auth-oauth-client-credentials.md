OAuth Client Credentials - Model Context Protocol
## > Documentation Index
> Fetch the complete documentation index at:
[> https://modelcontextprotocol.io/llms.txt
](https://modelcontextprotocol.io/llms.txt)
> Use this file to discover all available pages before exploring further.
The OAuth Client Credentials extension (`io.modelcontextprotocol/oauth-client-credentials`) adds support for the [OAuth 2.0 client credentials flow](https://datatracker.ietf.org/doc/html/rfc6749#section-4.4) to MCP. This enables automated systems to connect to MCP servers without interactive user authorization.
## Specification
Full technical specification for the OAuth Client Credentials extension.
##
[​
](#what-it-is)
What it is
The standard MCP authorization flow requires a user to interactively approve access — a browser opens, the user logs in, and grants permission. That works well for humans, but breaks down when there’s no user present.
The OAuth Client Credentials extension solves this by letting a client authenticate using application-level credentials (a client ID and secret, or a signed JWT assertion) rather than delegated user credentials. The client proves its identity directly to the authorization server, which issues an access token without requiring a browser redirect or user interaction.
##
[​
](#when-to-use-it)
When to use it
Use OAuth Client Credentials when:
* **Background services** need to call MCP tools on a schedule or in response to events, without a user present
* **CI/CD pipelines** invoke MCP servers as part of automated build, test, or deployment workflows
* **Server-to-server integrations** connect two backend systems where there’s no end user involved
* **Daemon processes** or long-running workers need persistent access to MCP resources
If your integration has a human user who should explicitly authorize access, use the standard MCP authorization flow instead.
##
[​
](#how-it-works)
How it works
The extension supports two credential formats:
###
[​
](#jwt-bearer-assertions-recommended)
JWT Bearer Assertions (recommended)
Defined in [RFC 7523](https://datatracker.ietf.org/doc/html/rfc7523), JWT Bearer Assertions let the client sign a token with its private key and present it as proof of identity. The authorization server validates the signature using the client’s registered public key.
The JWT assertion typically includes:
* `iss`: Client ID (the issuer)
* `sub`: Client ID (subject being authenticated)
* `aud`: Authorization server token endpoint URL
* `exp`: Expiration time
* `iat`: Issued-at time
###
[​
](#client-secrets)
Client Secrets
For simpler deployments, the extension also supports the standard client credentials flow using a `client\_id` and `client\_secret`. The client sends its credentials directly to the authorization server’s token endpoint and receives an access token in return.
Client secrets are **long-lived credentials** that grant access without user interaction. If a secret is leaked, an attacker can silently authenticate as your application until the secret is rotated. To reduce risk:
* Store secrets in a secrets manager, never in source code or environment files checked into version control.
* Rotate secrets on a regular schedule and immediately after any suspected compromise.
* Scope credentials to the minimum permissions required.
* Prefer JWT assertions when possible — they are short-lived and do not require transmitting the signing key.
##
[​
](#implementation-guide)
Implementation guide
###
[​
](#for-mcp-clients)
For MCP clients
To use the OAuth Client Credentials extension, your client must:
1
[
](#)
Declare support
Include the extension in the `initialize` request capabilities:
```
`{
"capabilities": {
"extensions": {
"io.modelcontextprotocol/oauth-client-credentials": {}
}
}
}
`
```
2
[
](#)
Obtain an access token
Request a token from the authorization server using the client credentials grant before connecting to the MCP server.
3
[
](#)
Include the token
Pass the token in the `Authorization` header of HTTP requests to the MCP server:
```
`Authorization: Bearer \<access\_token\>
`
```
4
[
](#)
Handle token refresh
Client credentials tokens typically have shorter lifetimes than user-delegated tokens. Implement token refresh logic to obtain a new token before expiry.
###
[​
](#for-mcp-servers)
For MCP servers
To accept client credentials tokens, your server must:
1
[
](#)
Validate the token
On each request, verify the JWT signature and claims against your authorization server’s public keys (usually via a JWKS endpoint).
2
[
](#)
Check scopes
Ensure the token includes the required scopes for the requested operation.
3
[
](#)
Advertise support
Optionally (but recommended for discoverability), include the extension in the `initialize` response:
```
`{
"capabilities": {
"extensions": {
"io.modelcontextprotocol/oauth-client-credentials": {}
}
}
}
`
```
##
[​
](#sdk-examples)
SDK examples
The official MCP SDKs provide built-in support for client credentials authentication. Both handle token acquisition and refresh automatically.
1
[
](#)
Install the SDK
*
TypeScript
*
Python
```
`npm install @modelcontextprotocol/client
`
```
```
`pip install mcp
`
```
2
[
](#)
Create a provider and connect
Choose the credential format that matches your setup:####
[​
](#using-a-client-secret)
Using a client secret
*
TypeScript
*
Python
```
`import {
Client,
ClientCredentialsProvider,
StreamableHTTPClientTransport,
} from "@modelcontextprotocol/client";
const provider = new ClientCredentialsProvider({
clientId: "my-service",
clientSecret: "s3cr3t",
});
const client = new Client(
{ name: "my-service", version: "1.0.0" },
{ capabilities: {} },
);
const transport = new StreamableHTTPClientTransport(
new URL("https://mcp.example.com/mcp"),
{ authProvider: provider },
);
await client.connect(transport);
// Use the client
const tools = await client.listTools();
console.log(
"Available tools:",
tools.tools.map((t) =\> t.name),
);
await transport.close();
`
```
```
`from mcp.client.auth.extensions.client\_credentials import (
ClientCredentialsOAuthProvider,
)
from mcp.client.streamable\_http import streamablehttp\_client
from mcp import ClientSession
provider = ClientCredentialsOAuthProvider(
server\_url="https://mcp.example.com/mcp",
client\_id="my-service",
client\_secret="s3cr3t",
scopes="read write",
)
async with streamablehttp\_client(
"https://mcp.example.com/mcp",
auth\_provider=provider,
) as (read\_stream, write\_stream, \_):
async with ClientSession(read\_stream, write\_stream) as session:
await session.initialize()
# Use the client
tools = await session.list\_tools()
print("Available tools:", [t.name for t in tools.tools])
`
```
####
[​
](#using-a-jwt-private-key)
Using a JWT private key
*
TypeScript
*
Python
```
`import {
Client,
PrivateKeyJwtProvider,
StreamableHTTPClientTransport,
} from "@modelcontextprotocol/client";
const provider = new PrivateKeyJwtProvider({
clientId: "my-service",
privateKey: process.env.CLIENT\_PRIVATE\_KEY\_PEM,
algorithm: "RS256",
});
const client = new Client(
{ name: "my-service", version: "1.0.0" },
{ capabilities: {} },
);
const transport = new StreamableHTTPClientTransport(
new URL("https://mcp.example.com/mcp"),
{ authProvider: provider },
);
await client.connect(transport);
// Use the client
const tools = await client.listTools();
console.log(
"Available tools:",
tools.tools.map((t) =\> t.name),
);
await transport.close();
`
```
```
`from mcp.client.auth.extensions.client\_credentials import (
PrivateKeyJWTOAuthProvider,
SignedJWTParameters,
)
from mcp.client.streamable\_http import streamablehttp\_client
from mcp import ClientSession
# Create a signed JWT assertion provider from key parameters
jwt\_params = SignedJWTParameters(
issuer="my-service",
subject="my-service",
signing\_key=open("private\_key.pem").read(),
signing\_algorithm="RS256",
lifetime\_seconds=300,
)
provider = PrivateKeyJWTOAuthProvider(
server\_url="https://mcp.example.com/mcp",
client\_id="my-service",
assertion\_provider=jwt\_params.create\_assertion\_provider(),
scopes="read write",
)
async with streamablehttp\_client(
"https://mcp.example.com/mcp",
auth\_provider=provider,
) as (read\_stream, write\_stream, \_):
async with ClientSession(read\_stream, write\_stream) as session:
await session.initialize()
# Use the client
tools = await session.list\_tools()
print("Available tools:", [t.name for t in tools.tools])
`
```
##
[​
](#client-support)
Client support
Support for this extension varies by client. Extensions are opt-in and never active by default.
Check the [client matrix](/extensions/client-matrix) for current implementation status across MCP clients.
##
[​
](#related-resources)
Related resources
## ext-auth repository
Source code and reference implementations
## Full specification
Technical specification with normative requirements
## RFC 6749 — Client Credentials Grant
The underlying OAuth 2.0 specification
## RFC 7523 — JWT Bearer Assertions
JWT assertion format specification