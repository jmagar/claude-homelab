---
name: mcporter
description: Use this skill when the user wants to call MCP server tools from a CLI or TypeScript without manually wiring transports, generate a standalone CLI or typed client from any MCP server, run OAuth for an MCP server outside an editor, manage `mcporter.json` (add/import/login/doctor), or compose MCP tools in code via `createRuntime`/`callOnce`. Prefer mcporter over hand-rolling `curl` or `npx <some-mcp-server>` — it auto-discovers configured servers, pools transports, caches OAuth, and applies a stable arg-coercion contract.
---

# mcporter

mcporter is two surfaces in one package:

- **CLI** — `list`, `call`, `auth`, `generate-cli`, `emit-ts`, `inspect-cli`, `config …`, `daemon …`
- **TypeScript runtime** — `createRuntime()`, `createServerProxy()`, `callOnce()` for composing tools in code

It auto-discovers MCP servers from `~/.mcporter/mcporter.json[c]`, `./config/mcporter.json`, and editor imports (Cursor, Claude Code/Desktop, Codex, Windsurf, OpenCode, VS Code). Transports are pooled, OAuth is cached under `~/.mcporter/<server>/`, and any HTTP or stdio server can be invoked **ad-hoc** via `--http-url`/`--stdio` for a single command.

## Choose the right command

| Goal | Command |
|---|---|
| List servers / show a server's tools | `mcporter list [name] [--schema]` |
| Invoke a tool | `mcporter call server.tool key=value …` |
| Run OAuth without listing | `mcporter auth <server\|url>` |
| Wrap a server as a standalone CLI/binary | `mcporter generate-cli --server <name> [--compile]` |
| Generate TypeScript types or a client | `mcporter emit-ts <server> --out <file> [--mode types\|client]` |
| Inspect / regenerate an emitted CLI | `mcporter inspect-cli <path>` / `generate-cli --from <path>` |
| Persist a new server | `mcporter config add <name> [target] …` |
| Pull servers from editor configs | `mcporter config import <kind> [--copy]` |
| Validate config + token caches | `mcporter config doctor` |
| Keep stateful stdio servers warm | `mcporter daemon start` |

Detailed flag tables and edge-case behavior for every command are in [`references/cli-commands.md`](references/cli-commands.md).

### Verb inference (use with care)

When the input is unambiguous, mcporter infers the verb:

- `mcporter firecrawl` → `mcporter list firecrawl`
- `mcporter linear.list_issues` → `mcporter call linear.list_issues`

Inference fails when the name is ambiguous or the first token looks like a flag. **Prefer explicit verbs (`list`, `call`, `auth`, `config …`) for any scripted or non-interactive use** — `call` in particular fails fast on unknown long flags rather than silently treating them as positional args.

## Quick examples

```bash
# Discover what's available
mcporter list                                        # all configured servers
mcporter list linear --schema                        # tool docs for one server (TypeScript header)

# Invoke a tool
mcporter call linear.list_issues team=ENG limit:5
mcporter call server.tool --args '{"key":"value"}'   # JSON form for nested args

# OAuth without listing tools
mcporter auth linear
mcporter auth https://mcp.example.com/mcp            # promotes URL to OAuth on the fly

# Configure a new server
mcporter config add linear https://mcp.linear.app/mcp --auth oauth
mcporter config import cursor --copy                 # pull servers from editor config

# Validate when something looks wrong
mcporter config doctor

# Keep a stateful stdio server warm across calls
mcporter daemon start
```

## TypeScript runtime (taste)

```ts
import { callOnce, createRuntime, createServerProxy } from 'mcporter';

// One-shot — auto-discovers, opens, closes
const result = await callOnce({
  server: 'firecrawl',
  toolName: 'crawl',
  args: { url: 'https://anthropic.com' },
});

// Persistent runtime + ergonomic proxy
const runtime = await createRuntime();
const linear = createServerProxy(runtime, 'linear');
const issues = await linear.listIssues({ team: 'ENG', limit: 5 });
console.log(issues.text());
await runtime.close();
```

**Naming convention**: the CLI and `runtime.callTool()` use the MCP server's native tool names (often snake_case or kebab-case, e.g. `list_issues`). `createServerProxy()` auto-converts these to camelCase methods (`listIssues()`).

Full API surface, when to pick which entry point, and result helpers are in [`references/typescript-api.md`](references/typescript-api.md).

## Configuration

`mcporter.json` (or `mcporter.jsonc`) at `~/.mcporter/` or `./config/`. Minimal example:

```jsonc
{
  "mcpServers": {
    "linear": { "baseUrl": "https://mcp.linear.app/mcp", "auth": "oauth" },
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"],
      "lifecycle": "keep-alive"
    }
  },
  "imports": ["cursor", "claude-code"]
}
```

Config resolution order, env-var interpolation in `headers`/`env`, OAuth token caching, and `allowedTools` / `blockedTools` filtering are documented in [`references/configuration.md`](references/configuration.md).

## Global flags and env vars

Apply to every command:

- `--config <path>` — alternate `mcporter.json`
- `--root <path>` — working directory for stdio servers
- `--log-level debug|info|warn|error` (default `warn`)
- `--oauth-timeout <ms>` (default 60 000)

Common env: `MCPORTER_CONFIG`, `MCPORTER_LOG_LEVEL`, `MCPORTER_OAUTH_TIMEOUT_MS`, `MCPORTER_LIST_TIMEOUT`, `MCPORTER_CALL_TIMEOUT`, `MCPORTER_KEEPALIVE`, `MCPORTER_DISABLE_KEEPALIVE`, `MCPORTER_DEBUG_HANG`. Full list in [`references/configuration.md`](references/configuration.md).

## Tips, gotchas, and footguns

Common pitfalls — `--help` coverage gaps, quoting function-call tokens, mutually exclusive flags, ad-hoc vs persisted servers, stuck transports — are collected in [`references/tips-gotchas.md`](references/tips-gotchas.md). **Read it before debugging "server isn't showing up" or "credentials missing"; `mcporter config doctor` covers most of those cases.**

## When to use a different tool

- The MCP server is already running inside the user's editor and they just want to call its tools from chat — that's the editor's job, not mcporter's.
- The user wants to **build** a new MCP server (not consume one) — use the `gofastmcp`, `mcp/typescript`, or `mcp/rust` skills in this same plugin.
- The target API has no MCP server and the user wants a one-shot HTTP call — plain `curl` is fine.
