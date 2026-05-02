Reading Resources - FastMCP
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
* [
Tools
](/clients/tools)
* [
Resources
](/clients/resources)
* [
Prompts
](/clients/prompts)
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
New in version `2.0.0`
Use this when you need to read data from server-exposed resources like configuration files, generated content, or external data sources.
Resources are data sources exposed by MCP servers. They can be static files with fixed content, or dynamic templates that generate content based on parameters in the URI.
##
[​
](#reading-resources)
Reading Resources
Read a resource using its URI:
```
`async with client:
content = await client.read\_resource("file:///path/to/README.md")
# content -\> list[TextResourceContents | BlobResourceContents]
# Access text content
if hasattr(content[0], 'text'):
print(content[0].text)
# Access binary content
if hasattr(content[0], 'blob'):
print(f"Binary data: {len(content[0].blob)} bytes")
`
```
Resource templates generate content based on URI parameters. The template defines a pattern like `weather://{{city}}/current`, and you fill in the parameters when reading:
```
`async with client:
# Read from a resource template
weather\_content = await client.read\_resource("weather://london/current")
print(weather\_content[0].text)
`
```
##
[​
](#content-types)
Content Types
Resources return different content types depending on what they expose.
Text resources include configuration files, JSON data, and other human-readable content:
```
`async with client:
content = await client.read\_resource("resource://config/settings.json")
for item in content:
if hasattr(item, 'text'):
print(f"Text content: {item.text}")
print(f"MIME type: {item.mimeType}")
`
```
Binary resources include images, PDFs, and other non-text data:
```
`async with client:
content = await client.read\_resource("resource://images/logo.png")
for item in content:
if hasattr(item, 'blob'):
print(f"Binary content: {len(item.blob)} bytes")
print(f"MIME type: {item.mimeType}")
# Save to file
with open("downloaded\_logo.png", "wb") as f:
f.write(item.blob)
`
```
##
[​
](#multi-server-clients)
Multi-Server Clients
When using multi-server clients, resource URIs are prefixed with the server name:
```
`async with client: # Multi-server client
weather\_icons = await client.read\_resource("weather://weather/icons/sunny")
templates = await client.read\_resource("resource://assistant/templates/list")
`
```
##
[​
](#version-selection)
Version Selection
New in version `3.0.0`
When a server exposes multiple versions of a resource, you can request a specific version:
```
`async with client:
# Read the highest version (default)
content = await client.read\_resource("data://config")
# Read a specific version
content\_v1 = await client.read\_resource("data://config", version="1.0")
`
```
See [Metadata](/servers/versioning#version-discovery) for how to discover available versions.
##
[​
](#raw-protocol-access)
Raw Protocol Access
For complete control, use `read\_resource\_mcp()` which returns the full MCP protocol object:
```
`async with client:
result = await client.read\_resource\_mcp("resource://example")
# result -\> mcp.types.ReadResourceResult
`
```