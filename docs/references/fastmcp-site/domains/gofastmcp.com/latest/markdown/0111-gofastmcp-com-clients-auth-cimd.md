CIMD Authentication - FastMCP
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
* [
OAuth
](/clients/auth/oauth)
* [
CIMD
NEW
](/clients/auth/cimd)
* [
Bearer Auth
](/clients/auth/bearer)
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
CIMD authentication is only relevant for HTTP-based transports and requires a server that advertises CIMD support.
With standard OAuth, your client registers dynamically with every server it connects to, receiving a fresh `client\_id` each time. This works, but the server has no way to verify *who* your client actually is — any client can claim any name during registration.
CIMD (Client ID Metadata Documents) flips this around. You host a small JSON document at an HTTPS URL you control, and that URL becomes your `client\_id`. When your client connects to a server, the server fetches your metadata document and can verify your identity through your domain ownership. Users see a verified domain badge in the consent screen instead of an unverified client name.
##
[​
](#client-usage)
Client Usage
Pass your CIMD document URL to the `client\_metadata\_url` parameter of `OAuth`:
```
`from fastmcp import Client
from fastmcp.client.auth import OAuth
async with Client(
"https://mcp-server.example.com/mcp",
auth=OAuth(
client\_metadata\_url="https://myapp.example.com/oauth/client.json",
),
) as client:
await client.ping()
`
```
When the server supports CIMD, the client uses your metadata URL as its `client\_id` instead of performing Dynamic Client Registration. The server fetches your document, validates it, and proceeds with the standard OAuth authorization flow.
You don’t need to pass `mcp\_url` when using `OAuth` with `Client(auth=...)` — the transport provides the server URL automatically.
##
[​
](#creating-a-cimd-document)
Creating a CIMD Document
A CIMD document is a JSON file that describes your client. The most important field is `client\_id`, which must exactly match the URL where you host the document.
Use the FastMCP CLI to generate one:
```
`fastmcp auth cimd create \\
--name "My Application" \\
--redirect-uri "http://localhost:\*/callback" \\
--client-id "https://myapp.example.com/oauth/client.json"
`
```
This produces:
```
`{
"client\_id": "https://myapp.example.com/oauth/client.json",
"client\_name": "My Application",
"redirect\_uris": ["http://localhost:\*/callback"],
"token\_endpoint\_auth\_method": "none",
"grant\_types": ["authorization\_code"],
"response\_types": ["code"]
}
`
```
If you omit `--client-id`, the CLI generates a placeholder value and reminds you to update it before hosting.
###
[​
](#cli-options)
CLI Options
The `create` command accepts these flags:
|Flag|Description|
|`--name`|Human-readable client name (required)|
|`--redirect-uri`, `-r`|Allowed redirect URIs — can be specified multiple times (required)|
|`--client-id`|The URL where you’ll host this document (sets `client\_id` directly)|
|`--output`, `-o`|Write to a file instead of stdout|
|`--scope`|Space-separated list of scopes the client may request|
|`--client-uri`|URL of the client’s home page|
|`--logo-uri`|URL of the client’s logo image|
|`--no-pretty`|Output compact JSON|
###
[​
](#redirect-uris)
Redirect URIs
The `redirect\_uris` field supports wildcard port matching for localhost. The pattern `http://localhost:\*/callback` matches any port, which is useful for development clients that bind to random available ports (which is what FastMCP’s `OAuth` helper does by default).
##
[​
](#hosting-requirements)
Hosting Requirements
CIMD documents must be hosted at a publicly accessible HTTPS URL with a non-root path:
* **HTTPS required** — HTTP URLs are rejected for security
* **Non-root path** — The URL must have a path component (e.g., `/oauth/client.json`, not just `/`)
* **Public accessibility** — The server must be able to fetch the document over the internet
* **Matching `client\_id`** — The `client\_id` field in the document must exactly match the hosting URL
Common hosting options include static file hosting services like GitHub Pages, Cloudflare Pages, Vercel, or S3 — anywhere you can serve a JSON file over HTTPS.
##
[​
](#validating-your-document)
Validating Your Document
Before deploying, verify your hosted document passes validation:
```
`fastmcp auth cimd validate https://myapp.example.com/oauth/client.json
`
```
The validator fetches the document and checks that:
* The URL is valid (HTTPS, non-root path)
* The document is well-formed JSON conforming to the CIMD schema
* The `client\_id` in the document matches the URL it was fetched from
##
[​
](#how-it-works)
How It Works
When your client connects to a CIMD-enabled server, the flow works like this:
1
[
](#)
Client Presents Metadata URL
Your client sends its `client\_metadata\_url` as the `client\_id` in the OAuth authorization request.
2
[
](#)
Server Recognizes CIMD URL
The server sees that the `client\_id` is an HTTPS URL with a path — the signature of a CIMD client — and skips Dynamic Client Registration.
3
[
](#)
Server Fetches and Validates
The server fetches your JSON document from the URL, validates that `client\_id` matches the URL, and extracts your client metadata (name, redirect URIs, scopes).
4
[
](#)
Authorization Proceeds
The standard OAuth flow continues: browser opens for user consent, authorization code exchange, token issuance. The consent screen shows your verified domain.
The server caches your CIMD document according to HTTP cache headers, so subsequent requests don’t require re-fetching.
##
[​
](#server-configuration)
Server Configuration
CIMD is a server-side feature that your MCP server must support. FastMCP’s OAuth proxy providers (GitHub, Google, Auth0, etc.) support CIMD by default. See the [OAuth Proxy CIMD documentation](/servers/auth/oauth-proxy#cimd-support) for server-side configuration, including private key JWT authentication and security details.