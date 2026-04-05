# Plugin Settings -- homelab-core

Plugin configuration and user-facing settings.

## Configuration layers

| Priority | Source | Managed by |
| --- | --- | --- |
| 1 (highest) | `~/.claude-homelab/.env` | User manually or setup wizard |
| 2 | Gemini `settings` array | User at install time (Gemini only) |
| 3 (lowest) | System environment variables | OS |

## Plugin manifests

homelab-core does not use `userConfig` in its Claude/Codex plugin.json -- credentials are loaded from `~/.claude-homelab/.env` via the `load-env.sh` library instead.

### Gemini settings

The `gemini-extension.json` declares 32 settings that Gemini prompts for at install time:

```json
{
  "settings": [
    { "envVar": "PLEX_URL", "description": "Plex URL", "sensitive": false },
    { "envVar": "PLEX_TOKEN", "description": "Plex Token", "sensitive": true },
    { "envVar": "RADARR_URL", "description": "Radarr URL", "sensitive": false },
    { "envVar": "RADARR_API_KEY", "description": "Radarr API Key", "sensitive": true }
  ]
}
```

Fields marked `sensitive: true` are masked in logs and UI.

## .env conventions

```bash
# Service credentials
PLEX_URL=https://plex.example.com
PLEX_TOKEN=your_plex_token

# MCP server credentials
OVERSEERR_MCP_TOKEN=generated_bearer_token
```

Rules:
- Group variables by service with comment headers
- Required variables first within each group
- No actual secrets in `.env.example` -- use descriptive placeholders
- File permissions: `chmod 600`

## Configuration validation

```bash
# In scripts
source "$HOME/.claude-homelab/load-env.sh"
load_env_file || exit 1
validate_env_vars "PLEX_URL" "PLEX_TOKEN"
```

Via Justfile:

```bash
just validate     # Full validation including env check
just env-diff     # Compare .env.example vs actual .env
just health       # Connectivity check for configured services
```

## Cross-references

- [PLUGINS.md](PLUGINS.md) -- Plugin manifest where settings are declared
- [HOOKS.md](HOOKS.md) -- Hooks that could sync settings
- [CONFIG.md](../CONFIG.md) -- Full environment variable reference
