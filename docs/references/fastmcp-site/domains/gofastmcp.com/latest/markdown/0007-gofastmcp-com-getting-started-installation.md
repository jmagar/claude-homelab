Installation - FastMCP
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
##
[​
](#install-fastmcp)
Install FastMCP
We recommend using [uv](https://docs.astral.sh/uv/getting-started/installation/) to install and manage FastMCP.
```
`pip install fastmcp
`
```
Or with uv:
```
`uv add fastmcp
`
```
###
[​
](#optional-dependencies)
Optional Dependencies
FastMCP provides optional extras for specific features. For example, to install the background tasks extra:
```
`pip install "fastmcp[tasks]"
`
```
See [Background Tasks](/servers/tasks) for details on the task system.
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
FastMCP version: 3.0.0
MCP version: 1.25.0
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
](#upgrading)
Upgrading
###
[​
](#from-fastmcp-2-0)
From FastMCP 2.0
See the [Upgrade Guide](/getting-started/upgrading/from-fastmcp-2) for a complete list of breaking changes and migration steps.
###
[​
](#from-the-mcp-sdk)
From the MCP SDK
####
[​
](#from-fastmcp-1-0)
From FastMCP 1.0
If you’re using FastMCP 1.0 via the `mcp` package (meaning you import FastMCP as `from mcp.server.fastmcp import FastMCP`), upgrading is straightforward — for most servers, it’s a single import change. See the [full upgrade guide](/getting-started/upgrading/from-mcp-sdk) for details.
####
[​
](#from-the-low-level-server-api)
From the Low-Level Server API
If you built your server directly on the `mcp` package’s `Server` class — with `list\_tools()`/`call\_tool()` handlers and hand-written JSON Schema — see the [migration guide](/getting-started/upgrading/from-low-level-sdk) for a full walkthrough.
##
[​
](#versioning-policy)
Versioning Policy
FastMCP follows semantic versioning with pragmatic adaptations for the rapidly evolving MCP ecosystem. Breaking changes may occur in minor versions (e.g., 2.3.x to 2.4.0) when necessary to stay current with the MCP Protocol.
For production use, always pin to exact versions:
```
`fastmcp==3.0.0 # Good
fastmcp\>=3.0.0 # Bad - may install breaking changes
`
```
See the full [versioning and release policy](/development/releases#versioning-policy) for details on our public API, deprecation practices, and breaking change philosophy.
##
[​
](#contributing-to-fastmcp)
Contributing to FastMCP
Interested in contributing to FastMCP? See the [Contributing Guide](/development/contributing) for details on:
* Setting up your development environment
* Running tests and pre-commit hooks
* Submitting issues and pull requests
* Code standards and review process