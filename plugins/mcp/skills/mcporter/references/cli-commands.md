# mcporter CLI — command reference

Detailed flag tables and behavior for every CLI subcommand. Read after the SKILL.md decision table when you need exact flag semantics.

## `list`

```bash
mcporter list                                    # all configured servers
mcporter list linear --schema                    # tool docs for one server
mcporter list linear --all-parameters            # show optional params too
mcporter list https://mcp.example.com/mcp        # ad-hoc by URL
mcporter list --http-url https://localhost:3333/mcp --schema
mcporter list --stdio "bun run ./local-server.ts" --env TOKEN=xyz
mcporter list --json                             # machine-readable summary
```

`--schema` for a single server prints a **TypeScript header** — function signatures with JSDoc you can copy/paste into a `call` invocation. Example output for one tool:

```ts
/**
 * List issues on a Linear team.
 */
export interface ListIssuesArgs {
  /** Team filter (e.g. "ENG", "PRODUCT"). */
  team: string;
  /** Maximum results. Default 10. */
  limit?: number;
}

declare function list_issues(args: ListIssuesArgs): Promise<string>;
```

Optional parameters are hidden unless `--all-parameters` is set; mcporter prints a notice when it's truncating.

## `call`

Selectors:

- `server.tool` — configured server + tool name
- `https://host/mcp.tool` — full HTTP URL with `.tool` suffix (auto-registers ad-hoc)
- `--server <name> --tool <name>` — explicit overrides

Argument shapes (mix as needed):

```bash
mcporter call linear.list_issues team=ENG limit:5
mcporter call "linear.create_issue(title: \"Bug\", team: \"ENG\")"
mcporter call linear.list_issues --args '{"team":"ENG","limit":5}'
mcporter call server.tool -- --raw-value          # `--` stops flag parsing
```

Coercion controls:

- Default: `key=value` and positional values are auto-coerced (numbers, booleans, null, JSON).
- `--raw-strings` — keep numeric-looking values as strings.
- `--no-coerce` — disable all coercion (everything stays a string).
- Schema-declared `string` fields stay strings even when the value looks numeric (since 0.9.0).

Output / runtime:

- `--output text|markdown|json|raw` — formatting.
- `--save-images <dir>` — persist returned image content blocks to disk.
- `--tail-log` — stream the last 20 lines of any log files referenced in the response.
- `--timeout <ms>` — override per-call timeout.

Auto-correct: typo'd tool names trigger a "Did you mean …?" hint; tiny edit-distance typos are auto-corrected with a dimmed notice.

## `auth`

```bash
mcporter auth linear                             # run OAuth, no tool listing
mcporter auth linear --reset                     # clear cached creds first
mcporter auth https://mcp.example.com/mcp        # promotes URL to OAuth on the fly
mcporter auth --stdio "npx -y chrome-devtools-mcp@latest"
mcporter auth linear --json                      # JSON envelope on failure
```

`mcporter auth <url>` accepts the same ad-hoc flags as `list`/`call`. Hosted MCPs that require browser login (Supabase, Vercel, Notion, etc.) are auto-detected and promoted to OAuth without editing config.

## Ad-hoc server flags (shared by `list`, `call`, `auth`)

| Flag | Purpose |
|---|---|
| `--http-url <url>` | Register an HTTP server for this run |
| `--allow-http` | Permit `http://` (not just `https://`) |
| `--stdio <command>` | Launch a stdio MCP server (inherits current shell env) |
| `--stdio-arg <value>` | Append an arg to the stdio command (repeatable) |
| `--env KEY=value` | Override env vars for stdio (repeatable) |
| `--cwd <path>` | Working directory for stdio |
| `--name <value>` | Override display name |
| `--description <text>` | Override description |
| `--persist <path>` | Write the ad-hoc definition into an `mcporter.json` |
| `--yes` | Skip confirmation when persisting |

## `generate-cli` — emit a standalone CLI

Pick exactly one input source: `--server <name>`, `--command <ref>` (HTTP URL or stdio command — protocol optional, e.g. `shadcn.io/api/mcp`), or `--from <existing-cli>` to regenerate from embedded metadata. A bare positional arg is auto-routed (URL → command, name → server).

```bash
mcporter generate-cli --server linear --output ./linear-cli
mcporter generate-cli --command https://host/mcp --bundle --bundler rolldown
mcporter generate-cli "npx -y chrome-devtools-mcp@latest" --runtime bun --compile
mcporter generate-cli linear --bundle dist/linear.js --include-tools list_issues,create_issue
mcporter generate-cli --from dist/linear.js --dry-run
```

Flags:

- `--server` | `--command` | `--from` — input source (mutually exclusive).
- `--name <id>` / `--description <text>` — override identity in the generated CLI.
- `--output <path>` — output directory or template file path.
- `--bundle [path]` — emit a single-file bundle.
- `--bundler rolldown|bun` — pick the bundler. Defaults match the runtime.
- `--runtime node|bun` — generated-code runtime. **Bun required for `--compile`.**
- `--compile [path]` — emit a Bun-compiled native binary.
- `--minify` / `--no-minify` — toggle bundler minification.
- `--include-tools <csv>` / `--exclude-tools <csv>` — tool allow/deny lists (mutually exclusive; flags are repeatable and merge).
- `--dry-run` — print the plan without writing.
- `--timeout <ms>` — discovery timeout (default 30 000).

Every artifact embeds regeneration metadata (generator version, resolved server definition, invocation flags). Use `inspect-cli` to read it and `generate-cli --from` to replay.

## `inspect-cli` — read regen metadata

```bash
mcporter inspect-cli ./my-cli
mcporter inspect-cli ./my-cli --json
```

## `emit-ts` — typed TypeScript

```bash
mcporter emit-ts linear --out types/linear-tools.d.ts            # types only
mcporter emit-ts linear --mode client --out clients/linear.ts    # types + helper wrapper
mcporter emit-ts linear --include-optional --out types/linear.d.ts
mcporter emit-ts linear --json --out … > summary.json            # script-friendly summary
```

`<server>` accepts the same forms as `generate-cli` (name, URL, scheme-less host, `host.tool` selector). `--mode client` produces both a `.d.ts` and a `.ts` helper wrapping `createRuntime`/`createServerProxy`.

## `config` — manage `mcporter.json`

```bash
mcporter config list                             # local entries (TTY adds import summary)
mcporter config list --source import cursor      # only imports, filtered
mcporter config get linear --json
mcporter config remove linear
mcporter config login linear --reset             # alias for `mcporter auth`
mcporter config logout linear                    # clear cached credentials
mcporter config doctor                           # validate every known config + token cache
```

### `config add` — persist a server

Pick exactly one transport: `--url` (HTTP), `--command`/`--stdio` (stdio), or `--transport <http|sse|stdio>` to be explicit.

```bash
mcporter config add linear https://mcp.linear.app/mcp
mcporter config add my-svc --url https://my.host/mcp --header "X-Auth=$TOKEN"
mcporter config add cursor --command "npx -y cursor" --arg --stdio
mcporter config add notion https://mcp.notion.com/mcp --auth oauth
```

Useful flags: `--arg <value>` (repeatable; `--` forwards remaining tokens as stdio args), `--env KEY=value`, `--header KEY=value`, `--token-cache-dir <path>`, `--client-name <name>`, `--oauth-redirect-url <url>`, `--auth oauth`, `--copy-from import:<name>`, `--persist <path>`, `--scope home|project` (default `project`), `--dry-run`.

### `config import` — pull from editor configs

```bash
mcporter config import cursor                    # preview
mcporter config import cursor --copy             # write into local config
mcporter config import claude --filter notion --copy
mcporter config import cursor --path ~/.cursor/mcp.json
```

`<kind>` is one of `cursor`, `claude`, `claude-desktop`, `codex`, `windsurf`, `opencode`, `vscode`. Fuzzy matching is used across `config get/remove/logout` — typos auto-correct with a dimmed notice.

## `daemon` — keep-alive servers

Stateful stdio servers (`chrome-devtools`, `mobile-mcp`) auto-start the daemon on first call so tabs/device sessions survive between runs.

```bash
mcporter daemon start                            # detect keep-alive servers and spawn
mcporter daemon status                           # show which servers are active
mcporter daemon restart                          # bounce after config/env changes
mcporter daemon stop
```

Other servers stay ephemeral by default. Opt them in by adding `"lifecycle": "keep-alive"` to the server entry (or set `MCPORTER_KEEPALIVE=name`); opt out with `"lifecycle": "ephemeral"` (or `MCPORTER_DISABLE_KEEPALIVE=name`).

The daemon **only manages named servers** from config/imports. Ad-hoc `--stdio`/`--http-url` targets stay per-process; `--persist` them first if you want them daemon-managed.

Logging:

- `--log` — write to `~/.mcporter/daemon/daemon-<hash>.log`.
- `--log-file <path>` — custom log path.
- `--log-servers <csv>` — only log activity for the listed servers (implies `--log`).
- `--foreground` — run in the current process (debug only).
- Per-server: `"logging": { "daemon": { "enabled": true } }`.
