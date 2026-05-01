# discrawl Tips & Gotchas

## Silent empty archive (most common first-run failure)

**Symptom:** `discrawl sync` runs to completion with no errors, but `discrawl status` shows zero messages, or messages are present but all have null/empty content fields.

**Cause:** Message Content Intent is not approved in the Discord Developer Portal. Discord accepts the sync requests from your bot but returns null content for every message body. The sync itself succeeds — the data is just empty.

**How to detect it:**
```bash
discrawl status                          # shows channel list but 0 messages
discrawl messages --channel general --last 10   # rows present but content is empty
discrawl doctor                          # flags intent issues if detected
```

**Fix:**
1. Go to Discord Developer Portal → your application → Bot → Privileged Gateway Intents
2. Enable **Message Content Intent** (and **Server Members Intent** if member data is also missing)
3. Save Changes
4. Re-run sync

For bots in 100+ member servers, Discord requires a manual intent approval review before the intents take effect. Submit the verification request and wait for approval before running a full backfill.

**Always verify intent approval before starting a full historical sync.** A full sync on a large guild with missing intents wastes significant time and produces an empty archive.

---

## Rate limit handling

discrawl respects Discord's API rate limits automatically. For large guilds, a full historical sync may take hours or days due to rate limit pauses.

- The default concurrency is derived from `GOMAXPROCS`. Lower it in `config.toml` (`concurrency = 4`) if you want a lighter footprint.
- discrawl logs rate-limit waits — this is normal output, not an error.
- Do not run multiple concurrent discrawl processes against the same bot token; Discord rate limits apply per-token.

---

## Resume support

Sync is fully resumable. If a sync is interrupted (Ctrl-C, process killed, network drop), re-running the same `discrawl sync` command resumes from where it stopped.

```bash
# If interrupted, just re-run:
discrawl sync --guild <id> --full
```

No cleanup step needed. Checkpoint state is stored in the database.

---

## Wiretap mode

Wiretap reads message data directly from the Discord Desktop application's local cache (`%APPDATA%/discord` on Windows, `~/Library/Application Support/discord` on macOS, `~/.config/discord` on Linux). It does not use the Discord API and bypasses rate limits entirely.

**Use cases:**
- Archiving DMs (the bot API cannot access DMs)
- Getting messages from channels the bot is not in but the desktop client can see
- Faster initial archive of recent messages

**Requirements:**
- Discord Desktop must be installed and have a recent cache
- Configure `[desktop] path` in `config.toml` if your install is non-standard

**Dry-run before first use:**
```bash
discrawl wiretap --dry-run    # preview what would be imported
discrawl wiretap              # import for real
```

**Continuous watching:**
```bash
discrawl wiretap --watch-every 5m   # poll every 5 minutes
```

---

## DMs are local-only

DM data collected via wiretap is stored under a synthetic guild ID `@me` in the database. This data is **never included in `publish` exports** and is not shared via Git snapshots.

When importing a snapshot via `subscribe`, existing local DM data is preserved and not overwritten.

---

## Large guilds and full backfills

For guilds with millions of messages:

- Use `--full` only when you want complete history; omit it for incremental updates
- Consider `--channels <ids>` to archive specific channels first
- Storage: the SQLite database grows roughly 1–2 KB per message without attachments
- Embeddings add significant additional storage (roughly 6 KB per message for 1536-dim vectors)

---

## Semantic search prerequisites

`discrawl search --mode semantic` requires:
1. `[search.embeddings] enabled = true` in `config.toml`
2. A valid API key for the configured provider
3. At least one sync run with `--with-embeddings`

Without embeddings indexed, semantic and hybrid search modes return no results or fall back silently.

---

## Database location and backups

The default database is at `~/.discrawl/discrawl.db`. It is a standard SQLite file — back it up with:

```bash
sqlite3 ~/.discrawl/discrawl.db ".backup /path/to/backup.db"
```

Or simply copy the file while discrawl is not running.

Run `discrawl sql "VACUUM"` periodically to reclaim space after large deletes.

---

## Git-only consumers (no bot required)

To share an archive with someone who has no Discord bot:

1. Publisher: `discrawl publish --remote git@github.com:org/repo.git --push`
2. Consumer: `discrawl subscribe --remote git@github.com:org/repo.git`
3. Consumer can then use `discrawl search`, `discrawl messages`, and `discrawl status` against the snapshot without a bot token

Set `token_source = "none"` in the subscriber's `config.toml` to suppress token-not-found warnings.

---

## Bot token format

discrawl expects the raw bot token — the string shown in the Discord Developer Portal under Bot → Token. Do not prepend `Bot ` manually; discrawl adds the HTTP `Authorization: Bot <token>` header internally.

**Diagnostic:** If you see `401 Unauthorized` errors, verify:
- The token is complete (not truncated when copying)
- You copied the bot token, not a client secret or application ID
- The token has not been regenerated since you last copied it (regenerating invalidates the old token)
