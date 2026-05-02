Tool Search - FastMCP
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
* [
Overview
NEW
](/servers/transforms/transforms)
* [
Namespace
NEW
](/servers/transforms/namespace)
* [
Tool Transformation
NEW
](/servers/transforms/tool-transformation)
* [
Visibility
NEW
](/servers/visibility)
* [
Code Mode
NEW
](/servers/transforms/code-mode)
* [
Tool Search
NEW
](/servers/transforms/tool-search)
* [
Resources as Tools
NEW
](/servers/transforms/resources-as-tools)
* [
Prompts as Tools
NEW
](/servers/transforms/prompts-as-tools)
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
New in version `3.1.0`
When a server exposes hundreds or thousands of tools, sending the full catalog to an LLM wastes tokens and degrades tool selection accuracy. Search transforms solve this by replacing the tool listing with a search interface — the LLM discovers tools on demand instead of receiving everything upfront.
##
[​
](#how-it-works)
How It Works
When you add a search transform, `list\_tools()` returns just two synthetic tools instead of the full catalog:
* **`search\_tools`** finds tools matching a query and returns their full definitions
* **`call\_tool`** executes a discovered tool by name
The original tools are still callable. They’re hidden from the listing but remain fully functional — the search transform controls *discovery*, not *access*.
Both synthetic tools search across tool names, descriptions, parameter names, and parameter descriptions. A search for `"email"` would match a tool named `send\_email`, a tool with “email” in its description, or a tool with an `email\_address` parameter.
Search results are returned in the same JSON format as `list\_tools`, including the full input schema, so the LLM can construct valid calls immediately without a second round-trip.
##
[​
](#search-strategies)
Search Strategies
FastMCP provides two search transforms. They share the same interface — two synthetic tools, same configuration options — but differ in how they match queries to tools.
###
[​
](#regex-search)
Regex Search
`RegexSearchTransform` matches tools against a regex pattern using case-insensitive `re.search`. It has zero overhead and no index to build, making it a good default when the LLM knows roughly what it’s looking for.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms.search import RegexSearchTransform
mcp = FastMCP("My Server", transforms=[RegexSearchTransform()])
@mcp.tool
def search\_database(query: str, limit: int = 10) -\> list[dict]:
"""Search the database for records matching the query."""
...
@mcp.tool
def delete\_record(record\_id: str) -\> bool:
"""Delete a record from the database by its ID."""
...
@mcp.tool
def send\_email(to: str, subject: str, body: str) -\> bool:
"""Send an email to the given recipient."""
...
`
```
The LLM’s `search\_tools` call takes a `pattern` parameter — a regex string:
```
`# Exact substring match
result = await client.call\_tool("search\_tools", {"pattern": "database"})
# Returns: search\_database, delete\_record
# Regex pattern
result = await client.call\_tool("search\_tools", {"pattern": "send.\*email|notify"})
# Returns: send\_email
`
```
Results are returned in catalog order. If the pattern is invalid regex, the search returns an empty list rather than raising an error.
###
[​
](#bm25-search)
BM25 Search
`BM25SearchTransform` ranks tools by relevance using the [BM25 Okapi](https://en.wikipedia.org/wiki/Okapi_BM25) algorithm. It’s better for natural language queries because it scores each tool based on term frequency and document rarity, returning results ranked by relevance rather than filtering by match/no-match.
```
`from fastmcp import FastMCP
from fastmcp.server.transforms.search import BM25SearchTransform
mcp = FastMCP("My Server", transforms=[BM25SearchTransform()])
# ... define tools ...
`
```
The LLM’s `search\_tools` call takes a `query` parameter — natural language:
```
`result = await client.call\_tool("search\_tools", {
"query": "tools for deleting things from the database"
})
# Returns: delete\_record ranked first, search\_database second
`
```
BM25 builds an in-memory index from the searchable text of all tools. The index is created lazily on the first search and automatically rebuilt whenever the tool catalog changes — for example, when tools are added, removed, or have their descriptions updated. The staleness check is based on a hash of all searchable text, so description changes are detected even when tool names stay the same.
###
[​
](#which-to-choose)
Which to Choose
Use **regex** when your LLM is good at constructing targeted patterns and you want deterministic, predictable results. Regex is also simpler to debug — you can see exactly what pattern was sent.
Use **BM25** when your LLM tends to describe what it needs in natural language, or when your tool catalog has nuanced descriptions where relevance ranking adds value. BM25 handles partial matches and synonyms better because it scores on individual terms rather than requiring a single pattern to match.
##
[​
](#configuration)
Configuration
Both search transforms accept the same configuration options.
###
[​
](#limiting-results)
Limiting Results
By default, search returns at most 5 tools. Adjust `max\_results` based on your catalog size and how much context you want the LLM to receive per search:
```
`mcp.add\_transform(RegexSearchTransform(max\_results=10))
mcp.add\_transform(BM25SearchTransform(max\_results=3))
`
```
With regex, results stop as soon as the limit is reached (first N matches in catalog order). With BM25, all tools are scored and the top N by relevance are returned.
###
[​
](#pinning-tools)
Pinning Tools
Some tools should always be visible regardless of search. Use `always\_visible` to pin them in the listing alongside the synthetic tools:
```
`mcp.add\_transform(RegexSearchTransform(
always\_visible=["help", "status"],
))
# list\_tools returns: help, status, search\_tools, call\_tool
`
```
Pinned tools appear directly in `list\_tools` so the LLM can call them without searching. They’re excluded from search results to avoid duplication.
###
[​
](#custom-tool-names)
Custom Tool Names
The default names `search\_tools` and `call\_tool` can be changed to avoid conflicts with real tools:
```
`mcp.add\_transform(RegexSearchTransform(
search\_tool\_name="find\_tools",
call\_tool\_name="run\_tool",
))
`
```
##
[​
](#the-call_tool-proxy)
The `call\_tool` Proxy
The `call\_tool` proxy forwards calls to the real tool. When a client calls `call\_tool(name="search\_database", arguments={...})`, the proxy resolves `search\_database` through the server’s normal tool pipeline — including transforms and middleware — and executes it.
The proxy rejects attempts to call the synthetic tools themselves. `call\_tool(name="call\_tool")` raises an error rather than recursing.
Tools discovered through search can also be called directly via `client.call\_tool("search\_database", {...})` without going through the proxy. The proxy exists for LLMs that only know about the tools returned by `list\_tools` and need a way to invoke discovered tools through a tool they can see.
##
[​
](#auth-and-visibility)
Auth and Visibility
Search results respect the full authorization pipeline. Tools filtered by middleware, visibility transforms, or component-level auth checks won’t appear in search results.
The search tool queries `list\_tools()` through the complete pipeline at search time, so the same filtering that controls what a client sees in the listing also controls what they can discover through search.
```
`from fastmcp.server.transforms import Visibility
from fastmcp.server.transforms.search import RegexSearchTransform
mcp = FastMCP("My Server")
# ... define tools ...
# Disable admin tools globally
mcp.add\_transform(Visibility(False, tags={"admin"}))
# Add search — admin tools won't appear in results
mcp.add\_transform(RegexSearchTransform())
`
```
Session-level visibility changes (via `ctx.disable\_components()`) are also reflected immediately in search results.