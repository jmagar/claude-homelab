# mcporter configuration reference

Everything about `mcporter.json`, resolution order, env-var interpolation, OAuth caching, tool filtering, and global env vars.

## File format

`mcporter.json` (or `mcporter.jsonc` — JSONC supports `//`, `/* */`, and trailing commas):

```jsonc
{
  "mcpServers": {
    "context7": {
      "description": "Context7 docs MCP",
      "baseUrl": "https://mcp.context7.com/mcp",
      "headers": { "Authorization": "$env:CONTEXT7_API_KEY" }
    },
    "chrome-devtools": {
      "command": "npx",
      "args": ["-y", "chrome-devtools-mcp@latest"],
      "env": { "npm_config_loglevel": "error" },
      "lifecycle": "keep-alive"
    },
    "slack-readonly": {
      "baseUrl": "https://example.com/slack/mcp",
      "allowedTools": ["channels_list", "conversations_history"]
    },
    "filesystem-safe": {
      "command": "npx -y @modelcontextprotocol/server-filesystem ~/Downloads",
      "blockedTools": ["write_file", "delete_file", "move_file"]
    },
    "notion": {
      "baseUrl": "https://mcp.notion.com/mcp",
      "auth": "oauth"
    }
  },
  "imports": ["cursor", "claude-code", "claude-desktop", "codex", "windsurf", "opencode", "vscode"]
}
```

What mcporter handles automatically:

- **Interpolation in `headers` and `env`**: `${VAR}`, `${VAR:-fallback}`, `$env:VAR`.
- **OAuth token cache** under `~/.mcporter/<server>/` unless overridden by `tokenCacheDir`.
- **Stdio cwd** inherits the directory of the file that declared the server.
- **Imports precedence** matches the array order; default if omitted is the full list above.

## Tool filtering — `allowedTools` vs `blockedTools`

- `allowedTools`: allowlist. Only listed tools appear in `list` and can be `call`-ed. Empty array blocks everything.
- `blockedTools`: blocklist. Listed tools are hidden and rejected.
- Use exact tool names. Pick **one mode per server** — they don't combine.

## Config resolution order

mcporter reads exactly one primary config per run, in this order:

1. `--config <path>` (or programmatic `configPath`)
2. `MCPORTER_CONFIG` env var
3. `<root>/config/mcporter.json` in the current project
4. `~/.mcporter/mcporter.json` or `~/.mcporter/mcporter.jsonc`

`mcporter config …` mutations write back to whichever file resolution selected. To target a system-wide config explicitly:

```bash
mcporter config --config ~/.mcporter/mcporter.json add global-server https://api.example.com/mcp
```

## Global flags

Apply to every command:

- `--config <path>` — alternate `mcporter.json`.
- `--root <path>` — working directory for stdio servers.
- `--log-level debug|info|warn|error` — default `warn`.
- `--oauth-timeout <ms>` — browser OAuth wait (default 60 000).

## Environment variables

- `MCPORTER_CONFIG` — override config path everywhere.
- `MCPORTER_LOG_LEVEL` — same as `--log-level`.
- `MCPORTER_OAUTH_TIMEOUT_MS` (alias `MCPORTER_OAUTH_TIMEOUT`) — same as `--oauth-timeout`.
- `MCPORTER_LIST_TIMEOUT` / `MCPORTER_CALL_TIMEOUT` — per-command timeouts (default 30 s).
- `MCPORTER_KEEPALIVE=<name>` — force a server into keep-alive mode without editing config.
- `MCPORTER_DISABLE_KEEPALIVE=<name>` — force a server to ephemeral.
- `MCPORTER_DEBUG_HANG=1` — verbose handle diagnostics for stuck transports.
