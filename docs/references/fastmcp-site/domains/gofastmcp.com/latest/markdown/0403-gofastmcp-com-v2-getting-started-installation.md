Installation - FastMCP
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
##
[​
](#install-fastmcp)
Install FastMCP
We recommend using [uv](https://docs.astral.sh/uv/getting-started/installation/) to install and manage FastMCP.
If you plan to use FastMCP in your project, you can add it as a dependency with:
```
`uv add fastmcp
`
```
Alternatively, you can install it directly with `pip` or `uv pip`:
uv
pip
```
`uv pip install fastmcp
`
```
**FastMCP 3.0** is in development and may include breaking changes. To avoid unexpected issues, pin your dependency to v2: `fastmcp\<3`
###
[​
](#verify-installation)
Verify Installation
To verify that FastMCP is installed correctly, you can run the following command:
```
`fastmcp version
`
```
You should see output like the following:
```
`$ fastmcp version
FastMCP version: 2.11.3
MCP version: 1.12.4
Python version: 3.12.2
Platform: macOS-15.3.1-arm64-arm-64bit
FastMCP root path: \~/Developer/fastmcp
`
```
###
[​
](#dependency-licensing)
Dependency Licensing
FastMCP depends on Cyclopts for CLI functionality. Cyclopts v4 includes docutils as a transitive dependency, which has complex licensing that may trigger compliance reviews in some organizations.If this is a concern, you can install Cyclopts v5 alpha which removes this dependency:
```
`pip install "cyclopts\>=5.0.0a1"
`
```
Alternatively, wait for the stable v5 release. See [this issue](https://github.com/BrianPugh/cyclopts/issues/672) for details.
##
[​
](#upgrading-from-the-official-mcp-sdk)
Upgrading from the Official MCP SDK
Upgrading from the official MCP SDK’s FastMCP 1.0 to FastMCP 2.0 is generally straightforward. The core server API is highly compatible, and in many cases, changing your import statement from `from mcp.server.fastmcp import FastMCP` to `from fastmcp import FastMCP` will be sufficient.
```
`# Before
# from mcp.server.fastmcp import FastMCP
# After
from fastmcp import FastMCP
mcp = FastMCP("My MCP Server")
`
```
Prior to `fastmcp==2.3.0` and `mcp==1.8.0`, the 2.x API always mirrored the official 1.0 API. However, as the projects diverge, this can not be guaranteed. You may see deprecation warnings if you attempt to use 1.0 APIs in FastMCP 2.x. Please refer to this documentation for details on new capabilities.
##
[​
](#versioning-policy)
Versioning Policy
FastMCP follows semantic versioning with pragmatic adaptations for the rapidly evolving MCP ecosystem. Breaking changes may occur in minor versions (e.g., 2.3.x to 2.4.0) when necessary to stay current with the MCP Protocol.
For production use, always pin to exact versions:
```
`fastmcp==2.11.0 # Good
fastmcp\>=2.11.0 # Bad - will install breaking changes
`
```
See the full [versioning and release policy](/v2/development/releases#versioning-policy) for details on our public API, deprecation practices, and breaking change philosophy.
##
[​
](#contributing-to-fastmcp)
Contributing to FastMCP
Interested in contributing to FastMCP? See the [Contributing Guide](/v2/development/contributing) for details on:
* Setting up your development environment
* Running tests and pre-commit hooks
* Submitting issues and pull requests
* Code standards and review process