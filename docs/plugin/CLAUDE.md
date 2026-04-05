# Plugin Surface Documentation -- homelab-core

Index for the `plugin/` documentation subdirectory. These docs cover every Claude Code plugin surface area available to homelab-core.

## File index

| File | Surface | Description |
| --- | --- | --- |
| [PLUGINS.md](PLUGINS.md) | Manifests | `plugin.json` structure, required/optional fields, version sync |
| [AGENTS.md](AGENTS.md) | Agents | notebooklm-specialist agent definition and patterns |
| [SKILLS.md](SKILLS.md) | Skills | All 18 skill definitions with categories and structure |
| [COMMANDS.md](COMMANDS.md) | Commands | All 16 slash commands with syntax and examples |
| [HOOKS.md](HOOKS.md) | Hooks | Lifecycle hooks (placeholder -- hooks/ directory has .gitkeep only) |
| [CHANNELS.md](CHANNELS.md) | Channels | Discord and synapse-mcp channel integration |
| [OUTPUT-STYLES.md](OUTPUT-STYLES.md) | Output Styles | Custom formatting (placeholder -- output-styles/ has .gitkeep only) |
| [SCHEDULES.md](SCHEDULES.md) | Schedules | Cron-based recurring agent execution patterns |
| [CONFIG.md](CONFIG.md) | Settings | Plugin configuration, userConfig, and Gemini settings |
| [MARKETPLACES.md](MARKETPLACES.md) | Marketplaces | All 27 plugins in the Claude/Codex marketplace catalog |

## How plugin surfaces compose

homelab-core is a multi-surface plugin that bundles skills, agents, and commands. Unlike MCP server plugins, it does not expose MCP tools directly -- it orchestrates external MCP plugins.

```
plugin.json (required)        Declares homelab-core to Claude Code
  +-- skills/                  18 service integration skills
  +-- agents/                  1 specialist agent (notebooklm)
  +-- commands/                16 slash commands
  +-- hooks/                   Placeholder (future lifecycle hooks)
  +-- output-styles/           Placeholder (future custom formatting)
```

## Cross-references

- [CONFIG.md](../CONFIG.md) -- Environment variables and `.env` conventions
- [GUARDRAILS.md](../GUARDRAILS.md) -- Security patterns enforced across all surfaces
- [INVENTORY.md](../INVENTORY.md) -- Complete component inventory
