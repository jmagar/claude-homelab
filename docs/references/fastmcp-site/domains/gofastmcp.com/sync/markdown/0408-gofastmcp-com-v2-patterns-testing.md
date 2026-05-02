Testing your FastMCP Server - FastMCP
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
The best way to ensure a reliable and maintainable FastMCP Server is to test it! The FastMCP Client combined with Pytest provides a simple and powerful way to test your FastMCP servers.
##
[​
](#prerequisites)
Prerequisites
Testing FastMCP servers requires `pytest-asyncio` to handle async test functions and fixtures. Install it as a development dependency:
```
`pip install pytest-asyncio
`
```
We recommend configuring pytest to automatically handle async tests by setting the asyncio mode to `auto` in your `pyproject.toml`:
```
`[tool.pytest.ini\_options]
asyncio\_mode = "auto"
`
```
This eliminates the need to decorate every async test with `@pytest.mark.asyncio`.
##
[​
](#testing-with-pytest-fixtures)
Testing with Pytest Fixtures
Using Pytest Fixtures, you can wrap your FastMCP Server in a Client instance that makes interacting with your server fast and easy. This is especially useful when building your own MCP Servers and enables a tight development loop by allowing you to avoid using a separate tool like MCP Inspector during development:
```
`import pytest
from fastmcp.client import Client
from fastmcp.client.transports import FastMCPTransport
from my\_project.main import mcp
@pytest.fixture
async def main\_mcp\_client():
async with Client(transport=mcp) as mcp\_client:
yield mcp\_client
async def test\_list\_tools(main\_mcp\_client: Client[FastMCPTransport]):
list\_tools = await main\_mcp\_client.list\_tools()
assert len(list\_tools) == 5
`
```
We recommend the [inline-snapshot library](https://github.com/15r10nk/inline-snapshot) for asserting complex data structures coming from your MCP Server. This library allows you to write tests that are easy to read and understand, and are also easy to update when the data structure changes.
```
`from inline\_snapshot import snapshot
async def test\_list\_tools(main\_mcp\_client: Client[FastMCPTransport]):
list\_tools = await main\_mcp\_client.list\_tools()
assert list\_tools == snapshot()
`
```
Simply run `pytest --inline-snapshot=fix,create` to fill in the `snapshot()` with actual data.
For values that change you can leverage the [dirty-equals](https://github.com/samuelcolvin/dirty-equals) library to perform flexible equality assertions on dynamic or non-deterministic values.
Using the pytest `parametrize` decorator, you can easily test your tools with a wide variety of inputs.
```
`import pytest
from my\_project.main import mcp
from fastmcp.client import Client
from fastmcp.client.transports import FastMCPTransport
@pytest.fixture
async def main\_mcp\_client():
async with Client(mcp) as client:
yield client
@pytest.mark.parametrize(
"first\_number, second\_number, expected",
[
(1, 2, 3),
(2, 3, 5),
(3, 4, 7),
],
)
async def test\_add(
first\_number: int,
second\_number: int,
expected: int,
main\_mcp\_client: Client[FastMCPTransport],
):
result = await main\_mcp\_client.call\_tool(
name="add", arguments={"x": first\_number, "y": second\_number}
)
assert result.data is not None
assert isinstance(result.data, int)
assert result.data == expected
`
```
The [FastMCP Repository contains thousands of tests](https://github.com/PrefectHQ/fastmcp/tree/main/tests) for the FastMCP Client and Server. Everything from connecting to remote MCP servers, to testing tools, resources, and prompts is covered, take a look for inspiration!