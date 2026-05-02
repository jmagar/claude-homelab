Client Roots - FastMCP
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
* [
Elicitation
](/v2/clients/elicitation)
* [
Logging
](/v2/clients/logging)
* [
Progress
](/v2/clients/progress)
* [
Sampling
](/v2/clients/sampling)
* [
Background Tasks
NEW
](/v2/clients/tasks)
* [
Messages
](/v2/clients/messages)
* [
Roots
](/v2/clients/roots)
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
Roots are a way for clients to inform servers about the resources they have access to. Servers can use this information to adjust behavior or provide more relevant responses.
##
[​
](#setting-static-roots)
Setting Static Roots
Provide a list of roots when creating the client:
Static Roots
Dynamic Roots Callback
```
`from fastmcp import Client
client = Client(
"my\_mcp\_server.py",
roots=["/path/to/root1", "/path/to/root2"]
)
`
```