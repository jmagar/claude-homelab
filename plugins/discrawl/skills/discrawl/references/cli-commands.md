# discrawl CLI Command Reference

Binary: `discrawl`

Install: `brew install steipete/tap/discrawl` or `go install github.com/steipete/discrawl@latest`

Global flags (apply to all commands):

| Flag | Description |
|------|-------------|
| `--config <path>` | Override config file location (default: `~/.discrawl/config.toml`) |
| `--json` | JSON output format |

---

## Setup commands

### init

Create local config and discover accessible guilds.

```
discrawl init [flags]
```

| Flag | Description |
|------|-------------|
| `--guild <id>` | Specify a guild ID directly (skips interactive discovery) |
| `--db <path>` | Custom database path |

Creates `~/.discrawl/config.toml` on first run. Lists guilds the bot can access. Run this once before any sync.

### doctor

Validate config, auth, and database health.

```
discrawl doctor
```

No flags. Checks: config file parseable, bot token present and authenticated, Privileged Intents approved, database accessible. **Run this after initial setup to confirm intents are approved before a full sync.**

---

## Sync commands

### sync

Archive messages from Discord into the local SQLite database.

```
discrawl sync [flags]
```

| Flag | Description |
|------|-------------|
| `--guild <id>` | Target a specific guild |
| `--guilds <ids>` | Multiple guild IDs (used with `--concurrency`) |
| `--all` | Fan out across all discovered guilds |
| `--full` | Complete historical backfill from earliest message |
| `--all-channels` | Broad incremental sweep across all channels |
| `--skip-members` | Skip member list crawling |
| `--latest-only` | Archive new messages only (no backfill) |
| `--channels <ids>` | Target specific channel IDs |
| `--since <timestamp>` | RFC3339 timestamp filter (e.g. `2025-01-01T00:00:00Z`) |
| `--source both\|discord\|wiretap` | Archive source selection (default: `both`) |
| `--with-embeddings` | Queue messages for vector generation after sync |

Sync is **resumable** — interrupted runs pick up where they left off via checkpoint state. Safe to re-run.

### tail

Run a live Discord Gateway connection with periodic repair syncs.

```
discrawl tail [flags]
```

| Flag | Description |
|------|-------------|
| `--guild <id>` | Target guild |
| `--repair-every <duration>` | Repair interval (e.g. `6h`, `30m`) |

### wiretap

Import messages from the Discord Desktop app's local cache (no bot API calls required for DMs).

```
discrawl wiretap [flags]
```

| Flag | Description |
|------|-------------|
| `--path <dir>` | Custom Discord Desktop cache location |
| `--dry-run` | Preview messages found without storing |
| `--watch-every <duration>` | Polling interval for continuous watching |
| `--max-file-bytes <num>` | File size limit (default: 64 MiB) |

---

## Query commands

### search

Full-text, semantic, or hybrid search over archived messages.

```
discrawl search "<query>" [flags]
```

| Flag | Description |
|------|-------------|
| `--mode fts\|semantic\|hybrid` | Search algorithm (default: `fts`) |
| `--guild <id>` | Scope to a specific guild |
| `--channel <name\|id>` | Filter by channel name or ID |
| `--author <name>` | Filter by author name |
| `--limit <num>` | Number of results to return |
| `--dm` | Search DMs only (shorthand for `--guild @me`) |
| `--include-empty` | Include rows with null message content |

Semantic and hybrid modes require embeddings to be built (`[search.embeddings]` configured and `--with-embeddings` sync run).

### messages

List message slices from archived channels.

```
discrawl messages [flags]
```

| Flag | Description |
|------|-------------|
| `--channel <name\|id\|#name>` | Channel selection |
| `--author <name>` | Author filter |
| `--since <timestamp>` | Time range start (RFC3339) |
| `--hours <num>` | "Now minus N hours" shorthand |
| `--days <num>` | "Now minus N days" shorthand |
| `--last <num>` | Newest N messages |
| `--all` | Remove default safety result limit |
| `--sync` | Run a blocking sync before querying |
| `--dm` | Shorthand for `--guild @me` |
| `--include-empty` | Include content-free rows |

### dms

Manage and browse wiretap DM conversations.

```
discrawl dms [flags]
```

| Flag | Description |
|------|-------------|
| `--with <user\|id>` | View a specific DM thread |
| `--search <query>` | Search within DM messages |
| `--list` | List mode (use with `--with`) |
| `--last <num>` | Newest N messages |
| `--all` | Remove result limit |

DM data is sourced from the local Desktop cache (wiretap). Bot API cannot access DMs.

### members

Directory and profile search for guild members.

```
discrawl members <subcommand> [flags]
```

| Subcommand | Description |
|------------|-------------|
| `list` | Show all archived members |
| `show <id\|query>` | Display member details (`--messages <num>` to include recent messages) |
| `search <query>` | Match against member names and profile fields |

### mentions

List structured user/role mentions.

```
discrawl mentions [flags]
```

| Flag | Description |
|------|-------------|
| `--channel <name>` | Channel filter |
| `--target <id\|name>` | User or role target |
| `--type user\|role` | Mention type filter |
| `--days <num>` | Time range |
| `--limit <num>` | Result count |

### channels

List and inspect channels.

```
discrawl channels <subcommand>
```

| Subcommand | Description |
|------------|-------------|
| `list` | Show all archived channels |
| `show <id>` | Display channel details |

### sql

Execute a read-only SQL query against the archive database.

```
discrawl sql "<query>"
discrawl sql -        # read query from stdin
```

### status

Show archive statistics: message counts, channel coverage, last sync time.

```
discrawl status
```

---

## Share commands

### publish

Export the local SQLite archive as a Git-backed snapshot repository.

```
discrawl publish [flags]
```

| Flag | Description |
|------|-------------|
| `--remote <url>` | Git repository URL |
| `--push` | Commit and push changes after export |
| `--readme <path>` | Update a README with archive stats |
| `--with-embeddings` | Include vector embedding data |

**DMs are excluded by default.** Wiretap DM data (guild ID `@me`) is never exported by publish. This behavior is not overridable.

### subscribe

Import a Git snapshot (supports Git-only setup without a bot token).

```
discrawl subscribe [flags]
```

| Flag | Description |
|------|-------------|
| `--remote <url>` | Git repository URL |
| `--stale-after <duration>` | Freshness threshold for auto-update |
| `--no-auto-update` | Disable automatic snapshot fetch |
| `--with-embeddings` | Restore vector embedding data |

Existing local DM data is preserved and not overwritten by import.

### update

Manually pull and import the latest snapshot.

```
discrawl update [flags]
```

| Flag | Description |
|------|-------------|
| `--with-embeddings` | Restore vectors |

---

## Enrichment commands

### embed (via sync flag)

Vector embedding generation is triggered during sync via `--with-embeddings`:

```bash
discrawl sync --guild <id> --with-embeddings
```

Requires `[search.embeddings]` configured in `config.toml` with a provider and API key.

---

## Report commands

### report

Generate a markdown activity report.

```
discrawl report [flags]
```

| Flag | Description |
|------|-------------|
| `--readme <path>` | Update a README file with stats |

### digest

Summarize per-channel activity over a time window.

```
discrawl digest [flags]
```

| Flag | Description |
|------|-------------|
| `--since <duration\|Nd>` | Lookback window (e.g. `7d`, `24h`) |
| `--guild <id>` | Scope to guild |
| `--channel <name\|id>` | Single channel |
| `--top-n <num>` | Number of most active leaders to show |

### analytics

Activity grouping queries.

```
discrawl analytics <subcommand> [flags]
```

| Subcommand | Flags | Description |
|------------|-------|-------------|
| `quiet` | `--since <duration>`, `--guild <id>` | Inactive channels report |
| `trends` | `--weeks <num>`, `--channel <name\|id>` | Weekly message count trends |
