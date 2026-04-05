# Hook Configuration -- homelab-core

Lifecycle hooks that run automatically during Claude Code sessions.

## Current status

The `hooks/` directory contains only a `.gitkeep` placeholder. No hooks are currently active in homelab-core. This document describes the hook patterns available for future use.

## Hook directory structure

```
hooks/
  hooks.json                   # Hook declarations
  scripts/
    sync-env.sh                # Sync userConfig to .env
    fix-env-perms.sh           # Enforce chmod 600 on .env
    ensure-ignore-files.sh     # Keep .gitignore aligned
```

## Hook events

| Event | When it fires | Typical use |
| --- | --- | --- |
| `SessionStart` | Claude Code session begins | Sync credentials, validate environment |
| `PreToolUse` | Before a tool executes | Block dangerous operations, inject context |
| `PostToolUse` | After a tool executes | Fix permissions, enforce invariants |

## hooks.json structure

```json
{
  "description": "Sync credentials and enforce security",
  "hooks": {
    "SessionStart": [
      {
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/hooks/scripts/sync-env.sh",
            "timeout": 10
          }
        ]
      }
    ],
    "PostToolUse": [
      {
        "matcher": "Write|Edit|Bash",
        "hooks": [
          {
            "type": "command",
            "command": "${CLAUDE_PLUGIN_ROOT}/hooks/scripts/fix-env-perms.sh",
            "timeout": 5
          }
        ]
      }
    ]
  }
}
```

## Hook object fields

| Field | Required | Type | Description |
| --- | --- | --- | --- |
| `type` | yes | string | Always `"command"` |
| `command` | yes | string | Shell command or script path |
| `timeout` | no | number | Seconds before the hook is killed (default: 10) |

## Matcher syntax

The `matcher` field filters which tool invocations trigger the hooks:

| Matcher | Triggers on |
| --- | --- |
| `Write\|Edit\|Bash` | File creation, modification, or shell commands |
| `Bash` | Shell commands only |
| `mcp__plugin__tool` | Specific MCP tool call |

## Path variables

| Variable | Expands to |
| --- | --- |
| `${CLAUDE_PLUGIN_ROOT}` | Absolute path to the plugin's root directory |

## Potential hooks for homelab-core

Future hooks could include:
- **SessionStart:** Validate `~/.claude-homelab/.env` exists and has correct permissions
- **PostToolUse:** Re-check env permissions after file writes
- **PreToolUse:** Block writes to `.env` files in git-tracked directories

## Cross-references

- [CONFIG.md](CONFIG.md) -- Settings that hooks would sync
- [PLUGINS.md](PLUGINS.md) -- Plugin manifest structure
- [GUARDRAILS.md](../GUARDRAILS.md) -- Security patterns hooks enforce
