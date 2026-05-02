OpenTelemetry - FastMCP
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
* [
Background Tasks
NEW
](/servers/tasks)
* [
Composition
](/servers/composition)
* [
Dependencies
NEW
](/servers/dependency-injection)
* [
Elicitation
](/servers/elicitation)
* [
Icons
](/servers/icons)
* [
Lifespan
NEW
](/servers/lifespan)
* [
Logging
](/servers/logging)
* [
Middleware
](/servers/middleware)
* [
Pagination
NEW
](/servers/pagination)
* [
Progress
](/servers/progress)
* [
Sampling
](/servers/sampling)
* [
Storage Backends
NEW
](/servers/storage-backends)
* [
Telemetry
NEW
](/servers/telemetry)
* [
Testing
](/servers/testing)
* [
Versioning
NEW
](/servers/versioning)
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
FastMCP includes native OpenTelemetry instrumentation for observability. Traces are automatically generated for tool, prompt, resource, and resource template operations, providing visibility into server behavior, request handling, and provider delegation chains.
##
[​
](#how-it-works)
How It Works
FastMCP uses the OpenTelemetry API for instrumentation. This means:
* **Zero configuration required** - Instrumentation is always active
* **No overhead when unused** - Without an SDK, all operations are no-ops
* **Bring your own SDK** - You control collection, export, and sampling
* **Works with any OTEL backend** - Jaeger, Zipkin, Datadog, New Relic, etc.
##
[​
](#enabling-telemetry)
Enabling Telemetry
The easiest way to export traces is using `opentelemetry-instrument`, which configures the SDK automatically:
```
`pip install opentelemetry-distro opentelemetry-exporter-otlp
opentelemetry-bootstrap -a install
`
```
Then run your server with tracing enabled:
```
`opentelemetry-instrument \\
--service\_name my-fastmcp-server \\
--exporter\_otlp\_endpoint http://localhost:4317 \\
fastmcp run server.py
`
```
Or configure via environment variables:
```
`export OTEL\_SERVICE\_NAME=my-fastmcp-server
export OTEL\_EXPORTER\_OTLP\_ENDPOINT=http://localhost:4317
opentelemetry-instrument fastmcp run server.py
`
```
This works with any OTLP-compatible backend (Jaeger, Zipkin, Grafana Tempo, Datadog, etc.) and requires no changes to your FastMCP code.
## OpenTelemetry Python Documentation
Learn more about the OpenTelemetry Python SDK, auto-instrumentation, and available exporters.
##
[​
](#tracing)
Tracing
FastMCP creates spans for all MCP operations, providing end-to-end visibility into request handling.
###
[​
](#server-spans)
Server Spans
The server creates spans for each operation using [MCP semantic conventions](https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/):
|Span Name|Description|
|`tools/call {name}`|Tool execution (e.g., `tools/call get\_weather`)|
|`resources/read {uri}`|Resource read (e.g., `resources/read config://database`)|
|`prompts/get {name}`|Prompt render (e.g., `prompts/get greeting`)|
For mounted servers, an additional `delegate {name}` span shows the delegation to the child server.
###
[​
](#client-spans)
Client Spans
The FastMCP client creates spans for outgoing requests with the same naming pattern (`tools/call {name}`, `resources/read {uri}`, `prompts/get {name}`).
###
[​
](#span-hierarchy)
Span Hierarchy
Spans form a hierarchy showing the request flow. For mounted servers:
```
`tools/call weather\_forecast (CLIENT)
└── tools/call weather\_forecast (SERVER, provider=FastMCPProvider)
└── delegate get\_weather (INTERNAL)
└── tools/call get\_weather (SERVER, provider=LocalProvider)
`
```
For proxy providers connecting to remote servers:
```
`tools/call remote\_search (CLIENT)
└── tools/call remote\_search (SERVER, provider=ProxyProvider)
└── [remote server spans via trace context propagation]
`
```
##
[​
](#programmatic-configuration)
Programmatic Configuration
For more control, configure the SDK in your Python code before importing FastMCP:
```
`from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import BatchSpanProcessor
from opentelemetry.exporter.otlp.proto.grpc.trace\_exporter import OTLPSpanExporter
# Configure the SDK with OTLP exporter
provider = TracerProvider()
processor = BatchSpanProcessor(OTLPSpanExporter(endpoint="http://localhost:4317"))
provider.add\_span\_processor(processor)
trace.set\_tracer\_provider(provider)
# Now import and use FastMCP - traces will be exported automatically
from fastmcp import FastMCP
mcp = FastMCP("my-server")
@mcp.tool()
def greet(name: str) -\> str:
return f"Hello, {name}!"
`
```
The SDK must be configured **before** importing FastMCP to ensure the tracer provider is set when FastMCP initializes.
###
[​
](#local-development)
Local Development
For quick local trace visualization, [otel-desktop-viewer](https://github.com/CtrlSpice/otel-desktop-viewer) is a lightweight single-binary tool:
```
`# macOS
brew install nico-barbas/brew/otel-desktop-viewer
# Or download from GitHub releases
`
```
Run it alongside your server:
```
`# Terminal 1: Start the viewer (UI at http://localhost:8000, OTLP on :4317)
otel-desktop-viewer
# Terminal 2: Run your server with tracing
opentelemetry-instrument fastmcp run server.py
`
```
For more features, use [Jaeger](https://www.jaegertracing.io/):
```
`docker run -d --name jaeger \\
-p 16686:16686 \\
-p 4317:4317 \\
jaegertracing/all-in-one:latest
`
```
Then view traces at [http://localhost:16686](http://localhost:16686)
##
[​
](#custom-spans)
Custom Spans
You can add your own spans using the FastMCP tracer:
```
`from fastmcp import FastMCP
from fastmcp.telemetry import get\_tracer
mcp = FastMCP("custom-spans")
@mcp.tool()
async def complex\_operation(input: str) -\> str:
tracer = get\_tracer()
with tracer.start\_as\_current\_span("parse\_input") as span:
span.set\_attribute("input.length", len(input))
parsed = parse(input)
with tracer.start\_as\_current\_span("process\_data") as span:
span.set\_attribute("data.count", len(parsed))
result = process(parsed)
return result
`
```
##
[​
](#error-handling)
Error Handling
When errors occur, spans are automatically marked with error status and the exception is recorded:
```
`@mcp.tool()
def risky\_operation() -\> str:
raise ValueError("Something went wrong")
# The span will have:
# - status = ERROR
# - exception event with stack trace
`
```
##
[​
](#attributes-reference)
Attributes Reference
###
[​
](#rpc-semantic-conventions)
RPC Semantic Conventions
Standard [RPC semantic conventions](https://opentelemetry.io/docs/specs/semconv/rpc/rpc-spans/):
|Attribute|Value|
|`rpc.system`|`"mcp"`|
|`rpc.service`|Server name|
|`rpc.method`|MCP protocol method|
###
[​
](#mcp-semantic-conventions)
MCP Semantic Conventions
FastMCP implements the [OpenTelemetry MCP semantic conventions](https://opentelemetry.io/docs/specs/semconv/gen-ai/mcp/):
|Attribute|Description|
|`mcp.method.name`|The MCP method being called (`tools/call`, `resources/read`, `prompts/get`)|
|`mcp.session.id`|Session identifier for the MCP connection|
|`mcp.resource.uri`|The resource URI (for resource operations)|
###
[​
](#auth-attributes)
Auth Attributes
Standard [identity attributes](https://opentelemetry.io/docs/specs/semconv/attributes-registry/enduser/):
|Attribute|Description|
|`enduser.id`|Client ID from access token (when authenticated)|
|`enduser.scope`|Space-separated OAuth scopes (when authenticated)|
###
[​
](#fastmcp-custom-attributes)
FastMCP Custom Attributes
All custom attributes use the `fastmcp.` prefix for features unique to FastMCP:
|Attribute|Description|
|`fastmcp.server.name`|Server name|
|`fastmcp.component.type`|`tool`, `resource`, `prompt`, or `resource\_template`|
|`fastmcp.component.key`|Full component identifier (e.g., `tool:greet`)|
|`fastmcp.provider.type`|Provider class (`LocalProvider`, `FastMCPProvider`, `ProxyProvider`)|
Provider-specific attributes for delegation context:
|Attribute|Description|
|`fastmcp.delegate.original\_name`|Original tool/prompt name before namespacing|
|`fastmcp.delegate.original\_uri`|Original resource URI before namespacing|
|`fastmcp.proxy.backend\_name`|Remote server tool/prompt name|
|`fastmcp.proxy.backend\_uri`|Remote server resource URI|
##
[​
](#testing-with-telemetry)
Testing with Telemetry
For testing, use the in-memory exporter:
```
`import pytest
from collections.abc import Generator
from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider
from opentelemetry.sdk.trace.export import SimpleSpanProcessor
from opentelemetry.sdk.trace.export.in\_memory\_span\_exporter import InMemorySpanExporter
from fastmcp import FastMCP
@pytest.fixture
def trace\_exporter() -\> Generator[InMemorySpanExporter, None, None]:
exporter = InMemorySpanExporter()
provider = TracerProvider()
provider.add\_span\_processor(SimpleSpanProcessor(exporter))
original\_provider = trace.get\_tracer\_provider()
trace.set\_tracer\_provider(provider)
yield exporter
exporter.clear()
trace.set\_tracer\_provider(original\_provider)
async def test\_tool\_creates\_span(trace\_exporter: InMemorySpanExporter) -\> None:
mcp = FastMCP("test")
@mcp.tool()
def hello() -\> str:
return "world"
await mcp.call\_tool("hello", {})
spans = trace\_exporter.get\_finished\_spans()
assert any(s.name == "tools/call hello" for s in spans)
`
```