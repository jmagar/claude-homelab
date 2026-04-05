# Plugin Manifest Reference -- homelab-core

Structure and conventions for plugin manifest files.

## File locations

| Platform | Path | Required |
| --- | --- | --- |
| Claude Code | `.claude-plugin/plugin.json` | yes |
| Codex | `.codex-plugin/plugin.json` | yes |
| Gemini | `gemini-extension.json` | yes |

All manifests must declare the same version. Validate with `just version-check`.

## Claude plugin manifest

`.claude-plugin/plugin.json`:

```json
{
  "name": "homelab-core",
  "description": "Core homelab agents, commands, and setup/health skills...",
  "version": "1.4.0",
  "author": {
    "name": "Jacob Magar",
    "email": "jmagar@users.noreply.github.com"
  },
  "repository": "https://github.com/jmagar/claude-homelab",
  "homepage": "https://github.com/jmagar/claude-homelab",
  "license": "MIT",
  "keywords": ["homelab", "agents", "commands", "skills", "orchestration", "setup", "health"]
}
```

homelab-core does not declare `mcpServers` or `userConfig` -- it is a skills/agents/commands-only plugin. External MCP plugins in the marketplace each have their own `mcpServers` declarations.

## Codex plugin manifest

`.codex-plugin/plugin.json` extends the Claude format with an `interface` block:

```json
{
  "interface": {
    "displayName": "Claude Homelab",
    "shortDescription": "Homelab workflows, setup, and service health",
    "category": "Productivity",
    "capabilities": ["Read", "Write"],
    "defaultPrompt": [
      "Check the health of my homelab services.",
      "Help me configure credentials for a new homelab service."
    ],
    "brandColor": "#2563EB"
  }
}
```

## Gemini extension manifest

`gemini-extension.json` includes a `settings` array declaring env vars that Gemini prompts for:

```json
{
  "settings": [
    { "envVar": "PLEX_URL", "description": "Plex URL", "sensitive": false },
    { "envVar": "PLEX_TOKEN", "description": "Plex Token", "sensitive": true }
  ]
}
```

32 settings are declared, covering all service URLs and API keys.

## Version sync

All manifests must have identical versions. Files to update on every bump:

| File | Field |
| --- | --- |
| `.claude-plugin/plugin.json` | `"version"` |
| `.codex-plugin/plugin.json` | `"version"` |
| `gemini-extension.json` | `"version"` |
| `README.md` | `Version:` line |
| `CLAUDE.md` | `**Version:**` line |
| `CHANGELOG.md` | New entry |

Automate with:

```bash
just version-sync 1.5.0    # Update all files to 1.5.0
just version-check          # Verify all match
```

## Cross-references

- [CONFIG.md](CONFIG.md) -- Plugin settings patterns
- [MARKETPLACES.md](MARKETPLACES.md) -- Marketplace registration
