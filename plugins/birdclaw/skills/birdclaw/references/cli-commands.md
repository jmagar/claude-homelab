# birdclaw CLI Command Reference

## Global flags

| Flag | Description |
|------|-------------|
| `--json` | Output JSON (most commands support this) |
| `--refresh` | Force live fetch, bypass cache |
| `--limit <n>` | Limit result count |
| `--max-pages <n>` | Cap pagination scans |
| `--all` | Retrieve all available pages |
| `--mode <transport>` | Select transport: `auto`, `bird`, or `xurl` |
| `--transport <mode>` | Override transport for write operations |
| `--cache-ttl <seconds>` | Tune cache freshness threshold |
| `--account <name>` | Target account (moderation commands) |

## Init and auth

```bash
birdclaw init                             # initialize local state
birdclaw auth status --json              # check transport availability and auth state
```

## Database

```bash
birdclaw db stats --json                 # show archive statistics
```

## Sync — live data fetch

All sync commands accept `--mode auto|bird|xurl`, `--limit <n>`, `--refresh`, `--json`.

```bash
birdclaw sync likes                      # sync liked tweets
birdclaw sync likes --mode xurl --limit 500 --refresh --json

birdclaw sync bookmarks                  # sync bookmarked tweets
birdclaw sync bookmarks --mode auto --all --json

birdclaw dms sync                        # sync DM conversations
birdclaw dms sync --limit 100 --refresh --json
```

## Search — local archive queries

```bash
birdclaw search tweets "<query>" --json
birdclaw search tweets "<query>" --liked --bookmarked --json
birdclaw search tweets "<query>" --since 2024-01-01 --until 2024-12-31 --json
birdclaw search tweets "<query>" --originals-only --hide-low-quality --json
birdclaw search dms "<query>" --json
```

**Search filter flags:**

| Flag | Description |
|------|-------------|
| `--liked` | Filter to liked tweets only |
| `--bookmarked` | Filter to bookmarked tweets only |
| `--since <YYYY-MM-DD>` | Start date |
| `--until <YYYY-MM-DD>` | End date |
| `--originals-only` | Exclude retweets |
| `--hide-low-quality` | Filter low-quality results |
| `--unreplied` | Unanswered only (mentions/DMs) |

## Archive import

```bash
birdclaw archive find --json             # locate Twitter data exports on disk
birdclaw import archive --json           # auto-discover and import
birdclaw import archive /path/to/archive.zip --json   # import explicit path
birdclaw import hydrate-profiles --json  # refresh stale profile metadata
```

## Mentions

```bash
birdclaw mentions export --mode auto --json
birdclaw mentions export --unreplied --limit 50 --json
birdclaw mentions export --min-followers 100 --sort influence --json
```

## Inbox (AI-ranked)

```bash
birdclaw inbox --json
birdclaw inbox --kind dms --json
birdclaw inbox --limit 20 --score --hide-low-signal --json
```

## DMs

```bash
birdclaw dms list --json
birdclaw dms list --unreplied --limit 50 --json
birdclaw dms list --min-followers 100 --min-influence-score 50 --json
```

## Compose

```bash
birdclaw compose post "tweet text"
birdclaw compose reply <tweet_id> "reply text"
birdclaw compose dm <dm_id> "message text"
```

## Blocks

```bash
birdclaw blocks list --account <name> --json
birdclaw blocks sync --account <name> --json    # pull current blocklist from X
birdclaw blocks add @handle --account <name> --json
birdclaw blocks remove @handle --account <name> --json
birdclaw blocks record @handle --account <name> --json   # record locally without API call
birdclaw blocks import <file> --account <name> --json
birdclaw ban @handle --account <name> --transport auto --json
birdclaw unban @handle --account <name> --transport auto --json
```

## Mutes

```bash
birdclaw mutes list --account <name> --json
birdclaw mute @handle --account <name> --transport auto --json
birdclaw mutes record @handle --account <name> --json
birdclaw unmute @handle --account <name> --transport auto --json
```

## Profiles analysis

```bash
birdclaw profiles replies @handle --limit 50 --json    # scan tweets for AI detection
```

## Backup

```bash
birdclaw backup sync --repo /path/to/backup --remote https://github.com/user/backup.git --json
birdclaw backup import /path/to/backup --json
birdclaw backup export                                  # write deterministic JSONL shards
birdclaw backup validate /path/to/backup --json
```

## Scheduled jobs (macOS launchd)

```bash
birdclaw jobs sync-bookmarks --mode auto --all --limit 500 --json
birdclaw jobs install-bookmarks-launchd --program /path/to/birdclaw --env-file /path/to/env.sh
```

`--env-file` sources a `0600` shell env file inside the launchd agent, keeping credentials out of the plist. See [`tips-gotchas.md`](tips-gotchas.md) for the full launchd setup.

## Web UI

```bash
birdclaw serve                           # start local web app on localhost:3000
```
