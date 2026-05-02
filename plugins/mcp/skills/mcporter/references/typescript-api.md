# mcporter TypeScript runtime API

Three entry points for composing MCP tools in code: `callOnce()`, `createRuntime()`, `createServerProxy()`.

## Naming convention (read first)

The MCP spec lets servers expose tool names in any case — most use snake_case (`list_issues`) or kebab-case (`resolve-library-id`). Keep this in mind:

- **CLI** and `runtime.callTool(server, toolName, …)` use the **server's native tool name** verbatim.
- **`createServerProxy(runtime, name)`** auto-converts those names to **camelCase methods** (`listIssues()`, `resolveLibraryId()`) for ergonomic call sites.

So `mcporter call linear.list_issues …` and `linear.listIssues(…)` invoke the same tool — they just differ in how the name is written.

## API surface

```ts
import { callOnce, createRuntime, createServerProxy } from 'mcporter';

// One-shot call (auto-discovers, opens, closes)
const result = await callOnce({
  server: 'firecrawl',
  toolName: 'crawl',
  args: { url: 'https://anthropic.com' },
});

// Persistent runtime (pools transports, refreshes OAuth)
const runtime = await createRuntime();
const tools = await runtime.listTools('context7');
const docs = await runtime.callTool('context7', 'resolve-library-id', {
  args: { libraryName: 'react' },
});

// Ergonomic proxy with camelCase methods
const linear = createServerProxy(runtime, 'linear');
const issues = await linear.listIssues({ team: 'ENG', limit: 5 });
console.log(issues.text());      // .text() / .markdown() / .json() / .images() / .content() / .raw

await runtime.close();
```

## When to use which

- **`callOnce()`** — manual scripts, one-off tool hooks, no need for connection reuse. Cheapest cognitively; pays full transport cost on every call.
- **`createRuntime()`** — repeated calls, need explicit timeouts/log streaming/connection pooling. Always call `.close()` when done.
- **`createServerProxy(runtime, name)`** — kebab/snake-case tool names become camelCase methods, JSON-schema defaults are auto-applied, required args validated, results wrapped in a `CallResult`. Use this in TypeScript code that calls one server repeatedly.

## CallResult helpers

`callOnce()` and proxy methods return a `CallResult` with content-type-aware accessors:

- `.text()` — plain-text concatenation of text content blocks.
- `.markdown()` — markdown rendering when present.
- `.json()` — parsed JSON if the tool returned JSON content.
- `.images()` — array of image content blocks (use with `--save-images` on the CLI side).
- `.content()` — full structured content array.
- `.raw` — the raw MCP response object.

`runtime.callTool()` returns the raw response by default; wrap it through the proxy if you want the helpers.
