Auth Utilities - FastMCP
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
New in version `3.0.0`
The `fastmcp auth` commands help with CIMD (Client ID Metadata Document) management — part of MCP’s OAuth authentication flow. A CIMD is a JSON document you host at an HTTPS URL to identify your client application to MCP servers.
##
[​
](#creating-a-cimd)
Creating a CIMD
`fastmcp auth cimd create` generates a CIMD document:
```
`fastmcp auth cimd create \\
--name "My App" \\
--redirect-uri "http://localhost:\*/callback"
`
```
```
`{
"client\_id": "https://your-domain.com/oauth/client.json",
"client\_name": "My App",
"redirect\_uris": ["http://localhost:\*/callback"],
"token\_endpoint\_auth\_method": "none"
}
`
```
The generated document includes a placeholder `client\_id` — update it to match the URL where you’ll host the document before deploying.
###
[​
](#options)
Options
|Option|Flag|Description|
|Name|`--name`|**Required.** Human-readable client name|
|Redirect URI|`--redirect-uri`|**Required.** Allowed redirect URIs (repeatable)|
|Client URI|`--client-uri`|Client’s home page URL|
|Logo URI|`--logo-uri`|Client’s logo URL|
|Scope|`--scope`|Space-separated list of scopes|
|Output|`--output`, `-o`|Save to file (default: stdout)|
|Pretty|`--pretty`|Pretty-print JSON (default: true)|
###
[​
](#example)
Example
```
`fastmcp auth cimd create \\
--name "My Production App" \\
--redirect-uri "http://localhost:\*/callback" \\
--redirect-uri "https://myapp.example.com/callback" \\
--client-uri "https://myapp.example.com" \\
--scope "read write" \\
--output client.json
`
```
##
[​
](#validating-a-cimd)
Validating a CIMD
`fastmcp auth cimd validate` fetches a hosted CIMD and verifies it conforms to the spec:
```
`fastmcp auth cimd validate https://myapp.example.com/oauth/client.json
`
```
The validator checks that the URL is valid (HTTPS, non-root path), the document is valid JSON, the `client\_id` matches the URL, and no shared-secret auth methods are used.
On success:
```
`→ Fetching https://myapp.example.com/oauth/client.json...
✓ Valid CIMD document
Document details:
client\_id: https://myapp.example.com/oauth/client.json
client\_name: My App
token\_endpoint\_auth\_method: none
redirect\_uris:
• http://localhost:\*/callback
`
```
|Option|Flag|Description|
|Timeout|`--timeout`, `-t`|HTTP request timeout in seconds (default: 10)|