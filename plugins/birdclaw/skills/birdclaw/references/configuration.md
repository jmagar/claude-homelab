# birdclaw Configuration Reference

## Config file

birdclaw reads `~/.birdclaw/config.json`. Create it manually or let `birdclaw init` generate a skeleton.

```json
{
  "actions": {
    "transport": "auto"
  },
  "mentions": {
    "dataSource": "bird",
    "birdCommand": "/usr/local/bin/bird"
  },
  "backup": {
    "repoPath": "/path/to/local/backup",
    "remote": "https://github.com/youruser/backup.git",
    "autoSync": true,
    "staleAfterSeconds": 900
  }
}
```

Recommended permissions:

```bash
chmod 600 ~/.birdclaw/config.json
```

`config.json` contains the `birdCommand` path and backup remote URL. Restrict it to owner-read/write to prevent other local users from learning those paths.

## Transport selection

birdclaw supports two live transports:

| Transport | How it works | Cost | Compliance |
|-----------|-------------|------|------------|
| `xurl` | Wraps the X API v2 via OAuth | X API Basic tier required ($100+/mo since 2023) | Fully compliant for programmatic data access |
| `bird` | Delegates to an external `bird` CLI that uses browser session cookies | Free | Gray zone — may violate X ToS; account suspension risk |

**`auto` mode** (the default): for reads, tries `xurl` first then falls back to `bird`. For writes, tries `bird` first then falls back to `xurl`. Override per-command with `--mode bird|xurl|auto` or `--transport bird|xurl|auto`.

Set a permanent default in config:

```json
{
  "actions": {
    "transport": "xurl"
  }
}
```

## Configuring xurl

xurl is a separate CLI tool wrapping the X API v2. Install it independently and ensure it is authenticated before using birdclaw with `--mode xurl`. birdclaw delegates to the `xurl` binary on your PATH — no additional config key is required.

Verify xurl is reachable:

```bash
birdclaw auth status --json
```

## Configuring bird

`bird` is an external CLI tool (not bundled with birdclaw) that provides cookie-backed access to X. Obtain and build it separately. Configure birdclaw to find it:

```json
{
  "mentions": {
    "dataSource": "bird",
    "birdCommand": "/path/to/bird"
  }
}
```

**Cookie storage:** bird manages its own session cookie storage outside `~/.birdclaw/`. birdclaw never reads those cookies directly — it invokes the `bird` binary and receives output. Consult the bird tool's own documentation for its cookie file location and how to refresh authentication. The bird session cookie file is managed by the `bird` binary outside `~/.birdclaw/`. Consult bird's documentation for its cookie file path and set `chmod 600` on it to prevent other local users from reading it.

**launchd env file:** when running birdclaw under macOS launchd (scheduled jobs), if bird relies on browser cookies or environment variables unavailable to the launch agent, write an env file:

```bash
# ~/.config/bird/env.sh — example; adjust to your bird setup
export BIRD_COOKIE_PATH=/Users/yourname/.config/bird/session
```

Set strict permissions:

```bash
chmod 600 ~/.config/bird/env.sh
```

Pass it to the installer:

```bash
birdclaw jobs install-bookmarks-launchd \
  --program /usr/local/bin/birdclaw \
  --env-file ~/.config/bird/env.sh
```

The launchd plist never stores secrets — the env file is sourced at runtime.

## Environment variables

| Variable | Description |
|----------|-------------|
| `BIRDCLAW_HOME` | Override `~/.birdclaw` storage root |
| `BIRDCLAW_BACKUP_AUTO_SYNC=0` | Disable auto-sync for a single process invocation |

Example:

```bash
BIRDCLAW_HOME=/Volumes/external/.birdclaw birdclaw sync likes --json
```

## Storage paths

| Path | Purpose |
|------|---------|
| `~/.birdclaw/birdclaw.sqlite` | Primary archive database |
| `~/.birdclaw/config.json` | User configuration (recommend `chmod 600`) |
| `~/.birdclaw/media/` | Cached media files |
| `~/.birdclaw/media/thumbs/avatars/` | Avatar thumbnail cache |
| `~/.birdclaw/audit/bookmarks-sync.jsonl` | Job audit log |
| `~/.birdclaw/logs/bookmarks-sync.*.log` | Scheduled job logs |

All paths are relative to `BIRDCLAW_HOME` when that variable is set.

## Backup configuration

```json
{
  "backup": {
    "repoPath": "/Users/yourname/Projects/birdclaw-backup",
    "remote": "https://github.com/yourname/birdclaw-backup.git",
    "autoSync": true,
    "staleAfterSeconds": 900
  }
}
```

`autoSync: true` syncs after every write operation. `staleAfterSeconds` controls when the backup is considered out of date.
