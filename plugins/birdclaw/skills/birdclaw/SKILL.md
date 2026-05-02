---
name: birdclaw
description: Local-first X/Twitter archive CLI by Peter Steinberger. This skill should be used when the user mentions birdclaw, syncing Twitter likes or bookmarks, archiving DMs, searching a local Twitter archive, exporting mentions, managing blocks or mutes, or composing posts via CLI. All commands require birdclaw installed and at least one transport configured.
---

# birdclaw

birdclaw is a local-first X/Twitter archive tool. It syncs likes, bookmarks, DMs, mentions, blocks, and mutes to a local SQLite database at `~/.birdclaw/birdclaw.sqlite`. **Transport warning:** two live transports are available. `xurl` wraps the X API v2 and requires a paid Basic tier ($100+/mo since 2023) — it is the only fully compliant option for programmatic access to X data. `bird` is an external cookie-backed CLI that may violate X Terms of Service, risking account suspension; it provides no official API guarantees. For archival compliance, prefer X's official data export at https://x.com/settings/download_your_data. Use `sync` only for personal-archive operations on your own account.

## Install

```bash
brew install steipete/tap/birdclaw      # macOS (recommended)
# or: Node 25.8.1 + pnpm, then: pnpm install -g birdclaw
```

Configure at least one transport, then check status:

```bash
birdclaw auth status --json
```

## 7 core workflows

### `sync-likes` — archive your liked tweets
```bash
birdclaw sync likes --mode auto --limit 200 --json
birdclaw sync likes --mode xurl --refresh --json   # force live fetch via xurl
```

### `sync-bookmarks` — archive saved bookmarks
```bash
birdclaw sync bookmarks --mode auto --limit 500 --json
birdclaw jobs sync-bookmarks --mode auto --all     # full sweep (scheduled-job variant)
```

### `search-tweets` — search local archive
```bash
birdclaw search tweets "query" --json
birdclaw search tweets "query" --liked --since 2024-01-01 --until 2024-12-31 --json
birdclaw search dms "query" --json
```

### `import-archive` — import official X data export
```bash
birdclaw archive find --json                          # locate archive on disk
birdclaw import archive /path/to/twitter-archive.zip --json   # explicit path
birdclaw import archive --json                        # auto-discovery
```

### `export-mentions` — export mentions to JSONL
```bash
birdclaw mentions export --mode auto --json
birdclaw mentions export --unreplied --limit 100 --json
```

### `backup-sync` — sync database to Git backup
```bash
birdclaw backup sync --repo /path/to/backup --remote https://github.com/user/backup.git --json
birdclaw backup validate /path/to/backup --json
birdclaw backup export                                # write deterministic JSONL shards
```

### `manage-blocklist` — manage blocks and mutes
```bash
birdclaw blocks list --account myhandle --json
birdclaw blocks add @handle --account myhandle --json
birdclaw blocks remove @handle --account myhandle --json
birdclaw blocks sync --account myhandle --json        # sync blocks from X
birdclaw mutes list --account myhandle --json
birdclaw mute @handle --account myhandle --json
```

## Additional commands

```bash
birdclaw compose post "text"                         # post a tweet
birdclaw compose reply <tweet_id> "text"             # reply
birdclaw compose dm <dm_id> "text"                   # send DM
birdclaw dms list --json                             # list DM conversations
birdclaw inbox --json                                # AI-ranked mentions + DMs
birdclaw db stats --json                             # database statistics
```

## Storage paths

| Path | Purpose |
|------|---------|
| `~/.birdclaw/birdclaw.sqlite` | Primary archive database |
| `~/.birdclaw/config.json` | Transport and backup config |
| `~/.birdclaw/media/` | Media cache |
| `~/.birdclaw/audit/` | Job audit logs |
| `~/.birdclaw/logs/` | Scheduled job logs |

Override with `BIRDCLAW_HOME=/path/to/dir`.

## Reference docs

- [`references/cli-commands.md`](references/cli-commands.md) — full command and flag reference
- [`references/configuration.md`](references/configuration.md) — config.json schema, transport setup, environment variables
- [`references/tips-gotchas.md`](references/tips-gotchas.md) — TOS analysis, cookie expiry, scheduled jobs, macOS launchd

## When NOT to use this skill

- The user wants a web-based Twitter client or official X app.
- The user needs to access others' public data programmatically at scale — only the paid xurl/X API path is compliant for that use case.
- The user expects MCP tool integration — birdclaw is pure CLI with no MCP server.
