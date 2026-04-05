# homelab-core Documentation

Central documentation index for the `homelab-core` plugin (v1.4.0).

## What is homelab-core

homelab-core is the orchestration hub for a self-hosted homelab. It bundles 18 service skills, 1 agent, 16 slash commands, and a marketplace catalog of 27 plugins spanning media automation, infrastructure monitoring, document management, and developer tooling. It does not run an MCP server itself but coordinates external MCP plugins.

## Documentation map

### Root

| File | Purpose |
| --- | --- |
| [README.md](README.md) | This file -- documentation index |
| [SETUP.md](SETUP.md) | Dual-path installation (plugin marketplace and bash symlinks) |
| [CONFIG.md](CONFIG.md) | Environment variables and credential management |
| [CHECKLIST.md](CHECKLIST.md) | Pre-release quality checklist |
| [GUARDRAILS.md](GUARDRAILS.md) | Security patterns and credential safety |
| [INVENTORY.md](INVENTORY.md) | Complete component inventory |

### plugin/

Plugin surface area documentation -- skills, agents, commands, hooks, and marketplace.

| File | Surface |
| --- | --- |
| [plugin/CLAUDE.md](plugin/CLAUDE.md) | Index for plugin surface docs |
| [plugin/PLUGINS.md](plugin/PLUGINS.md) | Plugin manifest structure and version sync |
| [plugin/AGENTS.md](plugin/AGENTS.md) | Agent definitions (notebooklm-specialist) |
| [plugin/SKILLS.md](plugin/SKILLS.md) | All 18 skill definitions |
| [plugin/COMMANDS.md](plugin/COMMANDS.md) | All 16 slash commands |
| [plugin/HOOKS.md](plugin/HOOKS.md) | Lifecycle hooks |
| [plugin/CHANNELS.md](plugin/CHANNELS.md) | Channel integration (Discord, synapse-mcp) |
| [plugin/OUTPUT-STYLES.md](plugin/OUTPUT-STYLES.md) | Output style definitions |
| [plugin/SCHEDULES.md](plugin/SCHEDULES.md) | Scheduled task patterns |
| [plugin/CONFIG.md](plugin/CONFIG.md) | Plugin settings and userConfig |
| [plugin/MARKETPLACES.md](plugin/MARKETPLACES.md) | Marketplace publishing (27 plugins) |

### repo/

Repository structure, tooling, and conventions.

| File | Purpose |
| --- | --- |
| [repo/CLAUDE.md](repo/CLAUDE.md) | Index for repo docs |
| [repo/REPO.md](repo/REPO.md) | Directory tree and symlink architecture |
| [repo/RECIPES.md](repo/RECIPES.md) | All Justfile recipes |
| [repo/SCRIPTS.md](repo/SCRIPTS.md) | Scripts reference |
| [repo/RULES.md](repo/RULES.md) | Git workflow, versioning, code standards |
| [repo/MEMORY.md](repo/MEMORY.md) | Memory file system |

### stack/

Technology stack and architecture.

| File | Purpose |
| --- | --- |
| [stack/CLAUDE.md](stack/CLAUDE.md) | Index for stack docs |
| [stack/ARCH.md](stack/ARCH.md) | Architecture overview |
| [stack/TECH.md](stack/TECH.md) | Technology choices |
| [stack/PRE-REQS.md](stack/PRE-REQS.md) | Prerequisites |

## Quick links

- Repository: https://github.com/jmagar/claude-homelab
- Main CLAUDE.md: [/CLAUDE.md](../CLAUDE.md)
- Skills development guide: [/skills/CLAUDE.md](../skills/CLAUDE.md)
- Changelog: [/CHANGELOG.md](../CHANGELOG.md)
