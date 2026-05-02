FastMCP Updates - FastMCP
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
* [
Updates
NEW
](/updates)
* [
Changelog
NEW
](/changelog)
FiltersClear
ReleasesBlog PostsTutorialsAnnouncements
## > Documentation Index
> Fetch the complete documentation index at:
[> https://gofastmcp.com/llms.txt
](https://gofastmcp.com/llms.txt)
> Use this file to discover all available pages before exploring further.
[​
](#fastmcp-3-1-1)
FastMCP 3.1.1
Releases
March 14, 2026
## FastMCP v3.1.1: 'Tis But a Patch
Pins `pydantic-monty\<0.0.8` to fix a breaking change in Monty that affects code mode.
Read the release notes
[​
](#fastmcp-3-1-0)
FastMCP 3.1.0
Releases
March 3, 2026
## FastMCP v3.1.0: Code to Joy
The Code Mode release. Instead of loading the entire tool catalog into context, `CodeMode` gives LLMs meta-tools: search for relevant tools on demand, inspect their schemas, then write Python that chains `call\_tool()` calls in a sandbox. Also ships search transforms, early Prefab Apps integration, `MultiAuth` for composing multiple token verification sources, and PropelAuth support.
Read the release notes
[​
](#fastmcp-3-0-2)
FastMCP 3.0.2
Releases
February 22, 2026
## FastMCP v3.0.2: Threecovery Mode II
Two community-contributed fixes: auth headers from MCP transport no longer leak through to downstream OpenAPI APIs, and background task workers now correctly receive the originating request ID. Plus a new docs example for context-aware tool factories.
Read the release notes
[​
](#fastmcp-3-0-1)
FastMCP 3.0.1
Releases
February 20, 2026
## FastMCP v3.0.1: Three-covery Mode
First patch after 3.0 — mostly smoothing out rough edges discovered in the wild. The big ones: middleware state that wasn’t surviving the trip to tool handlers now does, `Tool.from\_tool()` accepts callables again, OpenAPI schemas with circular references no longer crash discovery, and decorator overloads now return the correct types in function mode.🔐 **OIDC `verify\_id\_token`** — New option for providers that issue opaque access tokens but standard JWT id\_tokens. Verifies identity via the id\_token while using the access\_token for upstream API calls.🐞 **11 bug fixes** — State serialization, future annotations with `Context`/`Depends`, OpenAI handler deprecation warnings, type checker compatibility, and more.
Read the release notes
[​
](#fastmcp-3-0-0)
FastMCP 3.0.0
Releases
February 18, 2026
## FastMCP v3.0.0: Three at Last
FastMCP 3.0 is stable. Two betas, two release candidates, 21 new contributors, and more than 100,000 pre-release installs later — the architecture held up, the upgrade path was smooth, and we’re shipping it.The surface API is largely unchanged — `@mcp.tool()` still works exactly as before. What changed is everything underneath: a provider/transform architecture that makes FastMCP extensible, observable, and composable in ways v2 couldn’t support.🔌 **Build servers from anything** — `FileSystemProvider`, `OpenAPIProvider`, `ProxyProvider`, `SkillsProvider`, and composable transforms that rename, namespace, filter, version, and secure components as they flow to clients.🔐 **Ship to production** — Component versioning, granular authorization with async auth checks, CIMD, Static Client Registration, Azure OBO, OpenTelemetry tracing, and background tasks with distributed Redis notification.💾 **Adapt per session** — Session state persists across requests, and `ctx.enable\_components()` / `ctx.disable\_components()` let servers adapt dynamically per client.⚡ **Develop faster** — `--reload`, standalone decorators, automatic threadpool dispatch, tool timeouts, pagination, and concurrent tool execution.🖥️ **CLI** — `fastmcp list`, `fastmcp call`, `fastmcp discover`, `fastmcp generate-cli`, and `fastmcp install` for Claude Desktop, Cursor, and Goose.
Read the release notes
[​
](#fastmcp-3-0-0rc1)
FastMCP 3.0.0rc1
Releases
February 12, 2026
## FastMCP v3.0.0rc1: RC-ing is Believing
FastMCP 3 RC1 means we believe the API is stable. Beta 2 drew a wave of real-world adoption — production deployments, migration reports, integration testing — and the feedback overwhelmingly confirmed that the architecture works. This release closes gaps that surfaced under load: auth flows that needed to be async, background tasks that needed reliable notification delivery, and APIs still carrying beta-era naming. If nothing unexpected surfaces, this is what 3.0.0 looks like.🚨 **Breaking Changes** — The `ui=` parameter is now `app=` with a unified `AppConfig` class, and 16 `FastMCP()` constructor kwargs have been removed after months of deprecation warnings.🔐 **Auth Improvements** — Async `auth=` checks, Static Client Registration for servers without DCR, and declarative Azure OBO flows via dependency injection.⚡ **Concurrent Sampling** — `context.sample()` can now execute multiple tool calls in parallel with `tool\_concurrency=0`.📡 **Background Task Notifications** — A distributed Redis queue replaces polling for progress updates and elicitation relay.✅ **OpenAPI Output Validation** — `validate\_output=False` disables strict schema checking for imperfect backend APIs.
Read the release notes
[​
](#fastmcp-3-0-0b2)
FastMCP 3.0.0b2
Releases
February 7, 2026
## FastMCP v3.0.0b2: 2 Fast 2 Beta
Beta 2 reflects the huge number of people that kicked the tires on Beta 1. Seven new contributors landed changes, and early migration reports went smoother than expected. Most of Beta 2 is refinement — fixing what people found, filling gaps from real usage, hardening edges — but a few new features landed along the way.🖥️ **Client CLI** — `fastmcp list`, `fastmcp call`, `fastmcp discover`, and `fastmcp generate-cli` turn any MCP server into something you can poke at from a terminal.🔐 **CIMD** (Client ID Metadata Documents) adds an alternative to Dynamic Client Registration for OAuth.📱 **MCP Apps** — Spec-level compliance for the MCP Apps extension with `ui://` resource scheme and typed UI metadata.⏳ **Background Task Context** — `Context` now works transparently in Docket workers with Redis-based coordination.🛡️ **ResponseLimitingMiddleware** caps tool response sizes with UTF-8-safe truncation.🪿 **Goose Integration** — `fastmcp install goose` for one-command server installation into Goose.
Read the release notes
[​
](#fastmcp-3-0-0b1)
FastMCP 3.0.0b1
Releases
January 20, 2026
## FastMCP 3.0.0b1: This Beta Work
FastMCP 3.0 rebuilds the framework around three primitives: components, providers, and transforms. Providers source components dynamically—from decorators, filesystems, OpenAPI specs, remote servers, or anywhere else. Transforms modify components as they flow to clients. The features that required specialized subsystems in v2 now compose naturally from these building blocks.🔌 **Provider Architecture** unifies how components are sourced with `FileSystemProvider`, `SkillsProvider`, `OpenAPIProvider`, and `ProxyProvider`.🔄 **Transforms** add middleware for components—namespace, rename, filter by version, control visibility.📋 **Component Versioning** lets you register multiple versions of the same tool with automatic highest-version selection.💾 **Session-Scoped State** persists across requests, with per-session visibility control.⚡ **DX Improvements** include `--reload` for development, automatic threadpool dispatch, tool timeouts, pagination, and OpenTelemetry tracing.
Read the release notes
[​
](#fastmcp-2-14-6)
FastMCP 2.14.6
Releases
March 27, 2026
## FastMCP 2.14.6: $Ref Dead Redemption
v2.14.4 backported `dereference\_refs()` but never wired it into the tool schema pipeline — `$ref` and `$defs` were still sent to MCP clients. Now fixed: schemas are fully inlined before reaching clients.
Read the release notes
[​
](#fastmcp-2-14-5)
FastMCP 2.14.5
Releases
February 3, 2026
## FastMCP 2.14.5: Sealed Docket
Fixes a memory leak in the memory:// docket broker where cancelled tasks accumulated instead of being cleaned up. Bumps pydocket to ≥0.17.2.
Read the release notes
[​
](#fastmcp-2-14-4)
FastMCP 2.14.4
Releases
January 22, 2026
## FastMCP 2.14.4: Package Deal
Fixes a fresh install bug where the packaging library was missing as a direct dependency, plus backports $ref dereferencing in tool schemas and a task capabilities location fix.
Read the release notes
[​
](#fastmcp-2-14-3)
FastMCP 2.14.3
Releases
January 12, 2026
## FastMCP 2.14.3: Time After Timeout
Sometimes five seconds just isn’t enough. This release fixes an HTTP transport bug that was cutting connections short, along with OAuth and Redis fixes, better ASGI support, and CLI update notifications so you never miss a beat.⏱️ **HTTP transport timeout fix** restores MCP’s 30-second default connect timeout, which was incorrectly defaulting to 5 seconds.🔧 **Infrastructure fixes** including OAuth token storage TTL, Redis key prefixing for ACL isolation, and ContextVar propagation for ASGI-mounted servers with background tasks.
Read the release notes
[​
](#fastmcp-2-14-2)
FastMCP 2.14.2
Releases
December 31, 2025
## FastMCP 2.14.2: Port Authority
A wave of community contributions arrives safely in the 2.x line. Important backports from 3.0 improve OpenAPI 3.1 compatibility, MCP spec compliance for output schemas and elicitation, and correct a subtle base\_url fallback issue.🔧 **OpenAPI 3.1 support** fixes version detection to properly handle 3.1 specs alongside 3.0.📋 **MCP spec compliance** for root-level `$ref` resolution in output schemas and titled enum elicitation schemas.
Read the release notes
[​
](#fastmcp-2-14-1)
FastMCP 2.14.1
Releases
December 15, 2025
## FastMCP 2.14.1: 'Tis a Gift to Be Sample
FastMCP 2.14.1 introduces sampling with tools (SEP-1577), enabling servers to pass tools to `ctx.sample()` for agentic workflows where the LLM can automatically execute tool calls in a loop.🤖 **Sampling with tools** lets servers leverage client LLM capabilities for multi-step agentic workflows. The new `ctx.sample\_step()` method provides single LLM calls with tool inspection, while `result\_type` enables structured outputs via validated Pydantic models.🔧 **AnthropicSamplingHandler** joins the existing OpenAI handler, and both are now promoted from experimental to production-ready status with a unified API.
Read the release notes
[​
](#fastmcp-2-14-0)
FastMCP 2.14.0
Releases
December 11, 2025
## FastMCP 2.14.0: Task and You Shall Receive
FastMCP 2.14 begins adopting the MCP 2025-11-25 specification, introducing protocol-native background tasks that enable long-running operations to report progress without blocking clients.⏳ **Background Tasks (SEP-1686)** let you add `task=True` to any async tool decorator. Powered by [Docket](https://github.com/chrisguidry/docket) for enterprise task scheduling—in-memory backends work out-of-the-box, Redis enables persistence and horizontal scaling.🔧 **OpenAPI Parser Promoted** from experimental to standard with improved performance through single-pass schema processing.📋 **MCP Spec Updates** including SSE polling (SEP-1699), multi-select elicitation (SEP-1330), and tool name validation (SEP-986). Also removes deprecated APIs accumulated across 2.x.
Read the release notes
[​
](#fastmcp-2-13-3)
FastMCP 2.13.3
Releases
December 3, 2025
## FastMCP 2.13.3: Pin-ish Line
Pins `mcp\<1.23` as a precaution due to MCP SDK changes related to the 11/25/25 protocol update that break certain FastMCP patches and workarounds. FastMCP 2.14 introduces proper support for the updated protocol.
Read the release notes
[​
](#fastmcp-2-13-2)
FastMCP 2.13.2
Releases
December 1, 2025
## FastMCP 2.13.2: Refreshing Changes
Polishes the authentication stack with improvements to token refresh, scope handling, and multi-instance deployments.🎮 **Discord OAuth provider** added as a built-in authentication option.🔄 **Token refresh fixes** for Azure and Google providers, plus OAuth proxy improvements for multi-instance deployments.🎨 **Icon support** added to proxy classes for richer UX.
Read the release notes
[​
](#fastmcp-2-13-1)
FastMCP 2.13.1
Releases
November 15, 2025
## FastMCP 2.13.1: Heavy Meta
Introduces meta parameter support for `ToolResult`, enabling tools to return supplementary metadata alongside results for patterns like OpenAI’s Apps SDK.🏷️ **Meta parameters** let tools return supplementary metadata alongside results.🔐 **New auth providers** for OCI and Supabase, plus custom token verifiers with DebugTokenVerifier for development.🔒 **Security fixes** for CVE-2025-61920 and safer Cursor deeplink URL validation on Windows.
Read the release notes
[​
](#fastmcp-2-13-0)
FastMCP 2.13.0
Releases
October 25, 2025
## FastMCP 2.13.0: Cache Me If You Can
FastMCP 2.13 “Cache Me If You Can” represents a fundamental maturation of the framework. After months of community feedback on authentication and state management, this release delivers the infrastructure FastMCP needs to handle production workloads: persistent storage, response caching, and pragmatic OAuth improvements that reflect real-world deployment challenges.💾 **Pluggable storage backends** bring persistent state to FastMCP servers. Built on [py-key-value-aio](https://github.com/strawgate/py-key-value), a new library from FastMCP maintainer Bill Easton ([@strawgate](https://github.com/strawgate)), the storage layer provides encrypted disk storage by default, platform-aware token management, and a simple key-value interface for application state. We’re excited to bring this elegantly designed library into the FastMCP ecosystem - it’s both powerful and remarkably easy to use, including wrappers to add encryption, TTLs, caching, and more to backends ranging from Elasticsearch, Redis, DynamoDB, filesystem, in-memory, and more!🔐 **OAuth maturity** brings months of production learnings into the framework. The new consent screen prevents confused deputy and authorization bypass attacks discovered in earlier versions, while the OAuth proxy now issues its own tokens with automatic key derivation. RFC 7662 token introspection support enables enterprise auth flows, and path prefix mounting enables OAuth-protected servers to integrate into existing web applications. FastMCP now supports out-of-the-box authentication with [WorkOS](https://gofastmcp.com/integrations/workos) and [AuthKit](https://gofastmcp.com/integrations/authkit), [GitHub](https://gofastmcp.com/integrations/github), [Google](https://gofastmcp.com/integrations/google), [Azure](https://gofastmcp.com/integrations/azure) (Entra ID), [AWS Cognito](https://gofastmcp.com/integrations/aws-cognito), [Auth0](https://gofastmcp.com/integrations/auth0), [Descope](https://gofastmcp.com/integrations/descope), [Scalekit](https://gofastmcp.com/integrations/scalekit), [JWTs](https://gofastmcp.com/servers/auth/token-verification#jwt-token-verification), and [RFC 7662 token introspection](https://gofastmcp.com/servers/auth/token-verification#token-introspection-protocol).⚡ **Response Caching Middleware** dramatically improves performance for expensive operations, while **Server lifespans** provide proper initialization and cleanup hooks that run once per server instance instead of per client session.✨ **Developer experience improvements** include Pydantic input validation, icon support, RFC 6570 query parameters for resource templates, improved Context API methods, and async file/directory resources.
Read the release notes
[​
](#fastmcp-2-12-5)
FastMCP 2.12.5
Releases
October 17, 2025
## FastMCP 2.12.5: Safety Pin
Pins MCP SDK version below 1.17 to ensure the `.well-known` payload appears in the expected location when using FastMCP auth providers with composite applications.
Read the release notes
[​
](#fastmcp-2-12-4)
FastMCP 2.12.4
Releases
September 26, 2025
## FastMCP 2.12.4: OIDC What You Did There
FastMCP 2.12.4 adds comprehensive OIDC support and expands authentication options with AWS Cognito and Descope providers. The release also includes improvements to logging middleware, URL handling for nested resources, persistent OAuth client registration storage, and various fixes to the experimental OpenAPI parser.🔐 **OIDC Configuration** brings native support for OpenID Connect, enabling seamless integration with enterprise identity providers.🏢 **Enterprise Authentication** expands with AWS Cognito and Descope providers, broadening the authentication ecosystem.🛠️ **Improved Reliability** through enhanced URL handling, persistent OAuth storage, and numerous parser fixes based on community feedback.
Read the release notes
[​
](#fastmcp-2-12-3)
FastMCP 2.12.3
Releases
September 17, 2025
## FastMCP 2.12.3: Double Time
FastMCP 2.12.3 focuses on performance and developer experience improvements. This release includes optimized auth provider imports that reduce server startup time, enhanced OIDC authentication flows, and automatic inline snapshot creation for testing.
Read the release notes
[​
](#fastmcp-2-12-2)
FastMCP 2.12.2
Releases
September 3, 2025
## FastMCP 2.12.2: Perchance to Stream
Hotfix for streamable-http transport validation in fastmcp.json configuration files, resolving a parsing error when CLI arguments were merged against the configuration spec.
Read the release notes
[​
](#fastmcp-2-12-1)
FastMCP 2.12.1
Releases
September 3, 2025
## FastMCP 2.12.1: OAuth to Joy
FastMCP 2.12.1 strengthens OAuth proxy implementation with improved client storage reliability, PKCE forwarding, configurable token endpoint authentication methods, and expanded scope handling based on extensive community testing.
Read the release notes
[​
](#fastmcp-2-12)
FastMCP 2.12
Releases
August 31, 2025
## FastMCP 2.12: Auth to the Races
FastMCP 2.12 represents one of our most significant releases to date. After extensive testing and iteration with the community, we’re shipping major improvements to authentication, configuration, and MCP feature adoption.🔐 **OAuth Proxy** bridges the gap for providers that don’t support Dynamic Client Registration, enabling authentication with GitHub, Google, WorkOS, and Azure through minimal configuration.📋 **Declarative JSON Configuration** introduces `fastmcp.json` as the single source of truth for server settings, making MCP servers as portable and shareable as container images.🧠 **Sampling API Fallback** tackles adoption challenges by letting servers generate completions server-side when clients don’t support the feature, encouraging innovation while maintaining compatibility.
Read the release notes
[​
](#fastmcp-2-11)
FastMCP 2.11
Releases
August 1, 2025
## FastMCP 2.11: Auth to a Good Start
FastMCP 2.11 brings enterprise-ready authentication and dramatic performance improvements.🔒 **Comprehensive OAuth 2.1 Support** with WorkOS AuthKit integration, Dynamic Client Registration, and support for separate resource and authorization servers.⚡ **Experimental OpenAPI Parser** delivers dramatic performance gains through single-pass schema processing and optimized memory usage (enable with environment variable).💾 **Enhanced State Management** provides persistent state across tool calls with a simple dictionary interface, improving context handling and type annotations.This release emphasizes speed and simplicity while setting the foundation for future enterprise features.
Read the release notes
[​
](#fastmcp-2-10)
FastMCP 2.10
Releases
July 2, 2025
## FastMCP 2.10: Great Spec-tations
FastMCP 2.10 achieves full compliance with the 6/18/2025 MCP specification update, introducing powerful new communication patterns.💬 **Elicitation Support** enables dynamic server-client communication and “human-in-the-loop” workflows, allowing servers to request additional information during execution.📊 **Output Schemas** provide structured outputs for tools, making results more predictable and easier to parse programmatically.🛠️ **Enhanced HTTP Routing** with OpenAPI extensions support and configurable algorithms for more flexible API integration.This release includes a breaking change to `client.call\_tool()` return signatures but significantly expands the interaction capabilities of MCP servers.
Read the release notes
[​
](#fastmcp-2-9)
FastMCP 2.9
ReleasesBlog Posts
June 23, 2025
## FastMCP 2.9: MCP-Native Middleware
FastMCP 2.9 is a major release that, among other things, introduces two important features that push beyond the basic MCP protocol.🤝 *MCP Middleware* brings a flexible middleware system for intercepting and controlling server operations - think authentication, logging, rate limiting, and custom business logic without touching core protocol code.✨ *Server-side type conversion* for prompts solves a major developer pain point: while MCP requires string arguments, your functions can now work with native Python types like lists and dictionaries, with automatic conversion handling the complexity.These features transform FastMCP from a simple protocol implementation into a powerful framework for building sophisticated MCP applications. Combined with the new `File` utility for binary data and improvements to authentication and serialization, this release makes FastMCP significantly more flexible and developer-friendly while maintaining full protocol compliance.
Read more
[​
](#fastmcp-2-8)
FastMCP 2.8
ReleasesBlog Posts
June 11, 2025
## FastMCP 2.8: Transform and Roll Out
FastMCP 2.8 is here, and it’s all about taking control of your tools.This release is packed with new features for curating the perfect LLM experience:🛠️ Tool TransformationThe headline feature lets you wrap any tool—from your own code, a third-party library, or an OpenAPI spec—to create an enhanced, LLM-friendly version. You can rename arguments, rewrite descriptions, and hide parameters without touching the original code.This feature was developed in close partnership with Bill Easton. As Bill brilliantly [put it](https://www.linkedin.com/posts/williamseaston_huge-thanks-to-william-easton-for-providing-activity-7338011349525983232-Mw6T?utm_source=share&amp;utm_medium=member_desktop&amp;rcm=ACoAAAAd6d0B3uL9zpCsq9eYWKi3HIvb8eN_r_Q), “Tool transformation flips Prompt Engineering on its head: stop writing tool-friendly LLM prompts and start providing LLM-friendly tools.”🏷️ Component ControlNow that you’re transforming tools, you need a way to hide the old ones! In FastMCP 2.8 you can programmatically enable/disable any component, and for everyone who’s been asking what FastMCP’s tags are for—they finally have a purpose! You can now use tags to declaratively filter which components are exposed to your clients.🚀 Pragmatic by DefaultLastly, to ensure maximum compatibility with the ecosystem, we’ve made the pragmatic decision to default all OpenAPI routes to Tools, making your entire API immediately accessible to any tool-using agent. When the industry catches up and supports resources, we’ll restore the old default — but no reason you should do extra work before OpenAI, Anthropic, or Google!
Read more
[​
](#fastmcp-2-7)
FastMCP 2.7
Releases
June 6, 2025
## FastMCP 2.7: Pare Programming
FastMCP 2.7 has been released!Most notably, it introduces the highly requested (and Pythonic) “naked” decorator usage:
```
`mcp = FastMCP()
@mcp.tool
def add(a: int, b: int) -\> int:
return a + b
`
```
In addition, decorators now return the objects they create, instead of the decorated function. This is an important usability enhancement.The bulk of the update is focused on improving the FastMCP internals, including a few breaking internal changes to private APIs. A number of functions that have clung on since 1.0 are now deprecated.
Read the release notes
[​
](#fastmcp-2-6)
FastMCP 2.6
ReleasesBlog Posts
June 2, 2025
## FastMCP 2.6: Blast Auth
FastMCP 2.6 is here!This release introduces first-class authentication for MCP servers and clients, including pragmatic Bearer token support and seamless OAuth 2.1 integration. This release aligns with how major AI platforms are adopting MCP today, making it easier than ever to securely connect your tools to real-world AI models. Dive into the update and secure your stack with minimal friction.
Read more
[​
](#vibe-testing)
Vibe-Testing
Blog PostsTutorials
May 21, 2025
## Stop Vibe-Testing Your MCP Server
Your tests are bad and you should feel bad.Stop vibe-testing your MCP server through LLM guesswork. FastMCP 2.0 introduces in-memory testing for fast, deterministic, and fully Pythonic validation of your MCP logic—no network, no subprocesses, no vibes.
Read more
[​
](#10000-stars)
10,000 Stars
Blog Posts
May 8, 2025
## Reflecting on FastMCP at 10k stars 🌟
In just six weeks since its relaunch, FastMCP has surpassed 10,000 GitHub stars—becoming the fastest-growing OSS project in our orbit. What started as a personal itch has become the backbone of Python-based MCP servers, powering a rapidly expanding ecosystem. While the protocol itself evolves, FastMCP continues to lead with clarity, developer experience, and opinionated tooling. Here’s to what’s next.
Read more
[​
](#fastmcp-2-3)
FastMCP 2.3
Blog PostsReleases
May 8, 2025
## Now Streaming: FastMCP 2.3
FastMCP 2.3 introduces full support for Streamable HTTP, a modern alternative to SSE that simplifies MCP deployments over the web. It’s efficient, reliable, and now the default HTTP transport. Just run your server with transport=“http” and connect clients via a standard URL—FastMCP handles the rest. No special setup required. This release makes deploying MCP servers easier and more portable than ever.
Read more
[​
](#proxy-servers)
Proxy Servers
Blog PostsTutorials
April 23, 2025
## MCP Proxy Servers with FastMCP 2.0
Even AI needs a good travel adapter 🔌FastMCP now supports proxying arbitrary MCP servers, letting you run a local FastMCP instance that transparently forwards requests to any remote or third-party server—regardless of transport. This enables transport bridging (e.g., stdio ⇄ SSE), simplified client configuration, and powerful gateway patterns. Proxies are fully composable with other FastMCP servers, letting you mount or import them just like local servers. Use `FastMCP.from\_client()` to wrap any backend in a clean, Pythonic proxy.
Read more
[​
](#fastmcp-2-0)
FastMCP 2.0
ReleasesBlog Posts
April 16, 2025
## Introducing FastMCP 2.0 🚀
This major release reimagines FastMCP as a full ecosystem platform, with powerful new features for composition, integration, and client interaction. You can now compose local and remote servers, proxy arbitrary MCP servers (with transport translation), and generate MCP servers from OpenAPI or FastAPI apps. A new client infrastructure supports advanced workflows like LLM sampling.FastMCP 2.0 builds on the success of v1 with a cleaner, more flexible foundation—try it out today!
Read more
[​
](#official-sdk)
Official SDK
Announcements
December 3, 2024
## FastMCP is joining the official MCP Python SDK!
FastMCP 1.0 will become part of the official MCP Python SDK!
Read the announcement
[​
](#fastmcp-1-0)
FastMCP 1.0
ReleasesBlog Posts
December 1, 2024
## Introducing FastMCP 🚀
Because life’s too short for boilerplate.This is where it all started. FastMCP’s launch post introduced a clean, Pythonic way to build MCP servers without the protocol overhead. Just write functions; FastMCP handles the rest. What began as a weekend project quickly became the foundation of a growing ecosystem.
Read more