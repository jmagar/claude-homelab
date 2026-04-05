# Output Style Definitions -- homelab-core

Custom formatting for agent and tool responses.

## Current status

The `output-styles/` directory contains only a `.gitkeep` placeholder. No output styles are currently defined. This document describes the patterns available for future use.

## Purpose

Output styles control how Claude Code formats responses from plugin tools and agents. They enable compact, consistent, and domain-appropriate output.

## File location

```
output-styles/
  compact-table.md
  dashboard.md
```

Output styles are Markdown files that define formatting templates.

## Potential styles for homelab-core

| Style | When to apply | Format |
| --- | --- | --- |
| Health dashboard | `just health` or `/homelab:docker-health` results | Grouped sections with status indicators |
| Service table | Skill list or marketplace catalog display | Aligned columns with category grouping |
| Compact status | Service connectivity checks | Status emoji + service name + latency |
| Error report | Failed operations | Error, context, suggested fix |

## Defining a style

```markdown
---
name: health-dashboard
description: Compact dashboard for service health checks
---

Format health check responses as:

| Service | Status | Latency | Details |
| --- | --- | --- | --- |
| [name] | OK/DEGRADED/DOWN | [ms] | [note] |

Rules:
- Sort by status (failures first)
- Use status indicators: OK, WARN, FAIL
- Include timestamp at the bottom
```

## Cross-references

- [AGENTS.md](AGENTS.md) -- Agents that could apply output styles
- [COMMANDS.md](COMMANDS.md) -- Commands that could reference output styles
