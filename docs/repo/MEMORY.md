# Memory Files -- homelab-core

Claude Code memory system for persistent knowledge across sessions.

## What is memory

Memory files are persistent, file-based knowledge that Claude Code retains across conversation sessions. They store project decisions, user preferences, external system pointers, and learned corrections.

## Location

Memory files live in `.claude/memory/` at the project root:

```
.claude/
└── memory/
    ├── MEMORY.md              # Index file (pointer list)
    ├── project_architecture.md
    ├── project_justfile.md
    └── ...
```

## Active memory files

The current memory index includes:

| File | Topic |
| --- | --- |
| `project_plugin_architecture.md` | 27 plugins, flat skills layout, version sync via Justfile |
| `project_justfile.md` | 30 recipes for dev/ops |
| `project_mcp_server_conventions.md` | Required files, Docker patterns, 2-tool pattern |
| `project_mcp_alignment_status.md` | Per-repo audit status |
| `project_mcp_registry_publishing.md` | DNS auth, registry format, per-repo identifiers |
| `project_scripts_pattern.md` | Scripts location, load-env pattern |
| `project_oauth_gateway.md` | OAuth 2.1, RFC 8707, Redis cache |
| `project_swag_mcp_proxy.md` | SWAG nginx proxy patterns |
| `feedback_marketplace.md` | Object source format, version sync gotchas |
| `project_p0_bugs_history.md` | Historical P0 bug fixes |
| `feedback_no_macos_compat.md` | Linux-only target, Bash 4+ is fine |

## Memory types

| Type | Prefix | Purpose |
| --- | --- | --- |
| `user` | `user_` | User-specific info (role, preferences) |
| `feedback` | `feedback_` | Corrections and learned behaviors |
| `project` | `project_` | Project decisions and architecture |
| `reference` | `reference_` | External system pointers |

## When to save

Save memory when encountering:
- Project architecture decisions
- Corrections to previous behavior
- External system pointers (API quirks, service endpoints)
- Non-obvious conventions

## When NOT to save

Do not save:
- Code patterns visible in the codebase
- Git history facts
- Debugging session details
- Information already in CLAUDE.md or documentation

## Memory vs other persistence

| Mechanism | Scope | Lifetime | Use for |
| --- | --- | --- | --- |
| Memory files | Project-wide | Permanent | Decisions, preferences, pointers |
| CLAUDE.md | Project-wide | Permanent | Instructions, conventions, rules |
| Git commits | Project-wide | Permanent | Code history |
| Session context | Single session | Ephemeral | Current task state |

## Cross-references

- [RULES.md](RULES.md) -- Coding rules memory files may reference
- [REPO.md](REPO.md) -- Repository structure where memory lives
