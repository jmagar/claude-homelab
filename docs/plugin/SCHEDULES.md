# Scheduled Tasks -- homelab-core

Automated recurring agent execution on a cron schedule.

## Current status

homelab-core does not define schedules in its plugin manifest. Schedules can be created via the `/schedule` skill at runtime.

## Purpose

Schedules allow running agents on a recurring basis. Common use cases for homelab-core:

| Schedule | Cron | Purpose |
| --- | --- | --- |
| Health check | `*/5 * * * *` | Verify all configured services are responsive |
| Cert expiry | `0 0 * * 1` | Check TLS certificate expiry across services |
| MCP audit | `0 2 * * *` | Run MCP security audit |
| Version check | `0 0 1 * *` | Check for version drift across manifests |

## Creating schedules

Use the `/schedule` skill:

```
/schedule create "homelab-health" --cron "*/5 * * * *" --prompt "Run just health and report any services that are down"
/schedule list
/schedule enable homelab-health
/schedule disable homelab-health
```

## Schedule definition

```json
{
  "name": "homelab-health",
  "schedule": "*/5 * * * *",
  "prompt": "Check homelab service health and report any issues",
  "enabled": true
}
```

| Field | Required | Description |
| --- | --- | --- |
| `name` | yes | Unique schedule identifier |
| `schedule` | yes | Cron expression |
| `agent` | no | Agent to invoke (omit for default) |
| `prompt` | yes | Instruction passed to the agent |
| `enabled` | no | Toggle without deleting (default: `true`) |

## Common cron patterns

| Pattern | Frequency |
| --- | --- |
| `*/5 * * * *` | Every 5 minutes |
| `0 * * * *` | Every hour |
| `0 */6 * * *` | Every 6 hours |
| `0 0 * * *` | Daily at midnight |
| `0 0 * * 1` | Weekly on Monday |

## Cross-references

- [AGENTS.md](AGENTS.md) -- Agents invoked by schedules
- [CHANNELS.md](CHANNELS.md) -- Channels used for schedule alerts
