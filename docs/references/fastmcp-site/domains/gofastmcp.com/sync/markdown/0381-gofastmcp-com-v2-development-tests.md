Tests - FastMCP
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
Good tests are the foundation of reliable software. In FastMCP, we treat tests as first-class documentation that demonstrates how features work while protecting against regressions. Every new capability needs comprehensive tests that demonstrate correctness.
##
[​
](#fastmcp-tests)
FastMCP Tests
###
[​
](#running-tests)
Running Tests
```
`# Run all tests
uv run pytest
# Run specific test file
uv run pytest tests/server/test\_auth.py
# Run with coverage
uv run pytest --cov=fastmcp
# Skip integration tests for faster runs
uv run pytest -m "not integration"
# Skip tests that spawn processes
uv run pytest -m "not integration and not client\_process"
`
```
Tests should complete in under 1 second unless marked as integration tests. This speed encourages running them frequently, catching issues early.
###
[​
](#test-organization)
Test Organization
Our test organization mirrors the `src/` directory structure, creating a predictable mapping between code and tests. When you’re working on `src/fastmcp/server/auth.py`, you’ll find its tests in `tests/server/test\_auth.py`. In rare cases tests are split further - for example, the OpenAPI tests are so comprehensive they’re split across multiple files.
###
[​
](#test-markers)
Test Markers
We use pytest markers to categorize tests that require special resources or take longer to run:
```
`@pytest.mark.integration
async def test\_github\_api\_integration():
"""Test GitHub API integration with real service."""
token = os.getenv("FASTMCP\_GITHUB\_TOKEN")
if not token:
pytest.skip("FASTMCP\_GITHUB\_TOKEN not available")
# Test against real GitHub API
client = GitHubClient(token)
repos = await client.list\_repos("prefecthq")
assert "fastmcp" in [repo.name for repo in repos]
@pytest.mark.client\_process
async def test\_stdio\_transport():
"""Test STDIO transport with separate process."""
# This spawns a subprocess
async with Client("python examples/simple\_echo.py") as client:
result = await client.call\_tool("echo", {"message": "test"})
assert result.content[0].text == "test"
`
```
##
[​
](#writing-tests)
Writing Tests
###
[​
](#test-requirements)
Test Requirements
Following these practices creates maintainable, debuggable test suites that serve as both documentation and regression protection.
####
[​
](#single-behavior-per-test)
Single Behavior Per Test
Each test should verify exactly one behavior. When it fails, you need to know immediately what broke. A test that checks five things gives you five potential failure points to investigate. A test that checks one thing points directly to the problem.
Good: Atomic Test
Bad: Multi-Behavior Test
```
`async def test\_tool\_registration():
"""Test that tools are properly registered with the server."""
mcp = FastMCP("test-server")
@mcp.tool
def add(a: int, b: int) -\> int:
return a + b
tools = mcp.list\_tools()
assert len(tools) == 1
assert tools[0].name == "add"
`
```
####
[​
](#self-contained-setup)
Self-Contained Setup
Every test must create its own setup. Tests should be runnable in any order, in parallel, or in isolation. When a test fails, you should be able to run just that test to reproduce the issue.
Good: Self-Contained
Bad: Test Dependencies
```
`async def test\_tool\_execution\_with\_error():
"""Test that tool errors are properly handled."""
mcp = FastMCP("test-server")
@mcp.tool
def divide(a: int, b: int) -\> float:
if b == 0:
raise ValueError("Cannot divide by zero")
return a / b
async with Client(mcp) as client:
with pytest.raises(Exception):
await client.call\_tool("divide", {"a": 10, "b": 0})
`
```
####
[​
](#clear-intent)
Clear Intent
Test names and assertions should make the verified behavior obvious. A developer reading your test should understand what feature it validates and how that feature should behave.
```
`async def test\_authenticated\_tool\_requires\_valid\_token():
"""Test that authenticated users can access protected tools."""
mcp = FastMCP("test-server")
mcp.auth = BearerTokenProvider({"secret-token": "test-user"})
@mcp.tool
def protected\_action() -\> str:
return "success"
async with Client(mcp, auth=BearerAuth("secret-token")) as client:
result = await client.call\_tool("protected\_action", {})
assert result.content[0].text == "success"
`
```
####
[​
](#using-fixtures)
Using Fixtures
Use fixtures to create reusable data, server configurations, or other resources for your tests. Note that you should **not** open FastMCP clients in your fixtures as it can create hard-to-diagnose issues with event loops.
```
`import pytest
from fastmcp import FastMCP, Client
@pytest.fixture
def weather\_server():
server = FastMCP("WeatherServer")
@server.tool
def get\_temperature(city: str) -\> dict:
temps = {"NYC": 72, "LA": 85, "Chicago": 68}
return {"city": city, "temp": temps.get(city, 70)}
return server
async def test\_temperature\_tool(weather\_server):
async with Client(weather\_server) as client:
result = await client.call\_tool("get\_temperature", {"city": "LA"})
assert result.data == {"city": "LA", "temp": 85}
`
```
####
[​
](#effective-assertions)
Effective Assertions
Assertions should be specific and provide context on failure. When a test fails during CI, the assertion message should tell you exactly what went wrong.
```
`# Basic assertion - minimal context on failure
assert result.status == "success"
# Better - explains what was expected
assert result.status == "success", f"Expected successful operation, got {result.status}: {result.error}"
`
```
Try not to have too many assertions in a single test unless you truly need to check various aspects of the same behavior. In general, assertions of different behaviors should be in separate tests.
####
[​
](#inline-snapshots)
Inline Snapshots
FastMCP uses `inline-snapshot` for testing complex data structures. On first run of `pytest --inline-snapshot=create` with an empty `snapshot()`, pytest will auto-populate the expected value. To update snapshots after intentional changes, run `pytest --inline-snapshot=fix`. This is particularly useful for testing JSON schemas and API responses.
```
`from inline\_snapshot import snapshot
async def test\_tool\_schema\_generation():
"""Test that tool schemas are generated correctly."""
mcp = FastMCP("test-server")
@mcp.tool
def calculate\_tax(amount: float, rate: float = 0.1) -\> dict:
"""Calculate tax on an amount."""
return {"amount": amount, "tax": amount \* rate, "total": amount \* (1 + rate)}
tools = mcp.list\_tools()
schema = tools[0].inputSchema
# First run: snapshot() is empty, gets auto-populated
# Subsequent runs: compares against stored snapshot
assert schema == snapshot({
"type": "object",
"properties": {
"amount": {"type": "number"},
"rate": {"type": "number", "default": 0.1}
},
"required": ["amount"]
})
`
```
###
[​
](#in-memory-testing)
In-Memory Testing
FastMCP uses in-memory transport for testing, where servers and clients communicate directly. The majority of functionality can be tested in a deterministic fashion this way. We use more complex setups only when testing transports themselves.
The in-memory transport runs the real MCP protocol implementation without network overhead. Instead of deploying your server or managing network connections, you pass your server instance directly to the client. Everything runs in the same Python process - you can set breakpoints anywhere and step through with your debugger.
```
`from fastmcp import FastMCP, Client
# Create your server
server = FastMCP("WeatherServer")
@server.tool
def get\_temperature(city: str) -\> dict:
"""Get current temperature for a city"""
temps = {"NYC": 72, "LA": 85, "Chicago": 68}
return {"city": city, "temp": temps.get(city, 70)}
async def test\_weather\_operations():
# Pass server directly - no deployment needed
async with Client(server) as client:
result = await client.call\_tool("get\_temperature", {"city": "NYC"})
assert result.data == {"city": "NYC", "temp": 72}
`
```
This pattern makes tests deterministic and fast - typically completing in milliseconds rather than seconds.
###
[​
](#mocking-external-dependencies)
Mocking External Dependencies
FastMCP servers are standard Python objects, so you can mock external dependencies using your preferred approach:
```
`from unittest.mock import AsyncMock
async def test\_database\_tool():
server = FastMCP("DataServer")
# Mock the database
mock\_db = AsyncMock()
mock\_db.fetch\_users.return\_value = [
{"id": 1, "name": "Alice"},
{"id": 2, "name": "Bob"}
]
@server.tool
async def list\_users() -\> list:
return await mock\_db.fetch\_users()
async with Client(server) as client:
result = await client.call\_tool("list\_users", {})
assert len(result.data) == 2
assert result.data[0]["name"] == "Alice"
mock\_db.fetch\_users.assert\_called\_once()
`
```
###
[​
](#testing-network-transports)
Testing Network Transports
While in-memory testing covers most unit testing needs, you’ll occasionally need to test actual network transports like HTTP or SSE. FastMCP provides two approaches: in-process async servers (preferred), and separate subprocess servers (for special cases).
####
[​
](#in-process-network-testing-preferred)
In-Process Network Testing (Preferred)
New in version `2.13.0`
For most network transport tests, use `run\_server\_async` as an async context manager. This runs the server as a task in the same process, providing fast, deterministic tests with full debugger support:
```
`import pytest
from fastmcp import FastMCP, Client
from fastmcp.client.transports import StreamableHttpTransport
from fastmcp.utilities.tests import run\_server\_async
def create\_test\_server() -\> FastMCP:
"""Create a test server instance."""
server = FastMCP("TestServer")
@server.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
return server
@pytest.fixture
async def http\_server() -\> str:
"""Start server in-process for testing."""
server = create\_test\_server()
async with run\_server\_async(server) as url:
yield url
async def test\_http\_transport(http\_server: str):
"""Test actual HTTP transport behavior."""
async with Client(
transport=StreamableHttpTransport(http\_server)
) as client:
result = await client.ping()
assert result is True
greeting = await client.call\_tool("greet", {"name": "World"})
assert greeting.data == "Hello, World!"
`
```
The `run\_server\_async` context manager automatically handles server lifecycle and cleanup. This approach is faster than subprocess-based testing and provides better error messages.
####
[​
](#subprocess-testing-special-cases)
Subprocess Testing (Special Cases)
For tests that require complete process isolation (like STDIO transport or testing subprocess behavior), use `run\_server\_in\_process`:
```
`import pytest
from fastmcp.utilities.tests import run\_server\_in\_process
from fastmcp import FastMCP, Client
from fastmcp.client.transports import StreamableHttpTransport
def run\_server(host: str, port: int) -\> None:
"""Function to run in subprocess."""
server = FastMCP("TestServer")
@server.tool
def greet(name: str) -\> str:
return f"Hello, {name}!"
server.run(host=host, port=port)
@pytest.fixture
async def http\_server():
"""Fixture that runs server in subprocess."""
with run\_server\_in\_process(run\_server, transport="http") as url:
yield f"{url}/mcp"
async def test\_http\_transport(http\_server: str):
"""Test actual HTTP transport behavior."""
async with Client(
transport=StreamableHttpTransport(http\_server)
) as client:
result = await client.ping()
assert result is True
`
```
The `run\_server\_in\_process` utility handles server lifecycle, port allocation, and cleanup automatically. Use this only when subprocess isolation is truly necessary, as it’s slower and harder to debug than in-process testing. FastMCP uses the `client\_process` marker to isolate these tests in CI.
###
[​
](#documentation-testing)
Documentation Testing
Documentation requires the same validation as code. The `just docs` command launches a local Mintlify server that renders your documentation exactly as users will see it:
```
`# Start local documentation server with hot reload
just docs
# Or run Mintlify directly
mintlify dev
`
```
The local server watches for changes and automatically refreshes. This preview catches formatting issues and helps you see documentation as users will experience it.