Resource Operations - FastMCP
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
* [
Tools
](/v2/clients/tools)
* [
Resources
](/v2/clients/resources)
* [
Prompts
](/v2/clients/prompts)
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
New in version `2.0.0`
Resources are data sources exposed by MCP servers. They can be static files or dynamic templates that generate content based on parameters.
##
[​
](#types-of-resources)
Types of Resources
MCP servers expose two types of resources:
* **Static Resources**: Fixed content accessible via URI (e.g., configuration files, documentation)
* **Resource Templates**: Dynamic resources that accept parameters to generate content (e.g., API endpoints, database queries)
##
[​
](#listing-resources)
Listing Resources
###
[​
](#static-resources)
Static Resources
Use `list\_resources()` to retrieve all static resources available on the server:
```
`async with client:
resources = await client.list\_resources()
# resources -\> list[mcp.types.Resource]
for resource in resources:
print(f"Resource URI: {resource.uri}")
print(f"Name: {resource.name}")
print(f"Description: {resource.description}")
print(f"MIME Type: {resource.mimeType}")
# Access tags and other metadata
if hasattr(resource, '\_meta') and resource.\_meta:
fastmcp\_meta = resource.\_meta.get('\_fastmcp', {})
print(f"Tags: {fastmcp\_meta.get('tags', [])}")
`
```
###
[​
](#resource-templates)
Resource Templates
Use `list\_resource\_templates()` to retrieve available resource templates:
```
`async with client:
templates = await client.list\_resource\_templates()
# templates -\> list[mcp.types.ResourceTemplate]
for template in templates:
print(f"Template URI: {template.uriTemplate}")
print(f"Name: {template.name}")
print(f"Description: {template.description}")
# Access tags and other metadata
if hasattr(template, '\_meta') and template.\_meta:
fastmcp\_meta = template.\_meta.get('\_fastmcp', {})
print(f"Tags: {fastmcp\_meta.get('tags', [])}")
`
```
###
[​
](#filtering-by-tags)
Filtering by Tags
New in version `2.11.0`
You can use the `meta` field to filter resources based on their tags:
```
`async with client:
resources = await client.list\_resources()
# Filter resources by tag
config\_resources = [
resource for resource in resources
if hasattr(resource, '\_meta') and resource.\_meta and
resource.\_meta.get('\_fastmcp', {}) and
'config' in resource.\_meta.get('\_fastmcp', {}).get('tags', [])
]
print(f"Found {len(config\_resources)} config resources")
`
```
The `\_meta` field is part of the standard MCP specification. FastMCP servers include tags and other metadata within a `\_fastmcp` namespace (e.g., `\_meta.\_fastmcp.tags`) to avoid conflicts with user-defined metadata. This behavior can be controlled with the server’s `include\_fastmcp\_meta` setting - when disabled, the `\_fastmcp` namespace won’t be included. Other MCP server implementations may not provide this metadata structure.
##
[​
](#reading-resources)
Reading Resources
###
[​
](#static-resources-2)
Static Resources
Read a static resource using its URI:
```
`async with client:
# Read a static resource
content = await client.read\_resource("file:///path/to/README.md")
# content -\> list[mcp.types.TextResourceContents | mcp.types.BlobResourceContents]
# Access text content
if hasattr(content[0], 'text'):
print(content[0].text)
# Access binary content
if hasattr(content[0], 'blob'):
print(f"Binary data: {len(content[0].blob)} bytes")
`
```
###
[​
](#resource-templates-2)
Resource Templates
Read from a resource template by providing the URI with parameters:
```
`async with client:
# Read a resource generated from a template
# For example, a template like "weather://{{city}}/current"
weather\_content = await client.read\_resource("weather://london/current")
# Access the generated content
print(weather\_content[0].text) # Assuming text JSON response
`
```
##
[​
](#content-types)
Content Types
Resources can return different content types:
###
[​
](#text-resources)
Text Resources
```
`async with client:
content = await client.read\_resource("resource://config/settings.json")
for item in content:
if hasattr(item, 'text'):
print(f"Text content: {item.text}")
print(f"MIME type: {item.mimeType}")
`
```
###
[​
](#binary-resources)
Binary Resources
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
](#working-with-multi-server-clients)
Working with Multi-Server Clients
When using multi-server clients, resource URIs are automatically prefixed with the server name:
```
`async with client: # Multi-server client
# Access resources from different servers
weather\_icons = await client.read\_resource("weather://weather/icons/sunny")
templates = await client.read\_resource("resource://assistant/templates/list")
print(f"Weather icon: {weather\_icons[0].blob}")
print(f"Templates: {templates[0].text}")
`
```
##
[​
](#raw-mcp-protocol-access)
Raw MCP Protocol Access
For access to the complete MCP protocol objects, use the `\*\_mcp` methods:
```
`async with client:
# Raw MCP methods return full protocol objects
resources\_result = await client.list\_resources\_mcp()
# resources\_result -\> mcp.types.ListResourcesResult
templates\_result = await client.list\_resource\_templates\_mcp()
# templates\_result -\> mcp.types.ListResourceTemplatesResult
content\_result = await client.read\_resource\_mcp("resource://example")
# content\_result -\> mcp.types.ReadResourceResult
`
```
##
[​
](#common-resource-uri-patterns)
Common Resource URI Patterns
Different MCP servers may use various URI schemes:
```
`# File system resources
"file:///path/to/file.txt"
# Custom protocol resources
"weather://london/current"
"database://users/123"
# Generic resource protocol
"resource://config/settings"
"resource://templates/email"
`
```
Resource URIs and their formats depend on the specific MCP server implementation. Check the server’s documentation for available resources and their URI patterns.