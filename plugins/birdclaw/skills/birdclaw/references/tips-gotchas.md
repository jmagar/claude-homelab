# birdclaw Tips & Gotchas

## TOS and compliance analysis

### xurl transport

xurl wraps the X (Twitter) API v2 with OAuth. Using it requires subscribing to the X API Basic tier, which has cost $100+/month since early 2023. This is the **only fully compliant option** for programmatic access to X data — it operates within X's published terms and gives you official rate limits and data guarantees.

For accessing others' public data at scale (search, mentions from third-party accounts), xurl is the correct choice.

### bird transport

`bird` is an external CLI tool that accesses X using browser session cookies rather than OAuth. This approach:

- **May violate X's Terms of Service**, specifically sections governing automated account access and scraping.
- Carries a real **account suspension risk** — X's enforcement is inconsistent but real.
- Offers no API rate-limit guarantees; behavior may break without notice when X changes its web client internals.
- Provides no official support channel if access is revoked.

Use bird transport only for personal-archive operations on your own account where you accept the compliance risk. Do not use it to access other users' data.

### Recommended posture

1. Use X's official data export (https://x.com/settings/download_your_data) for archival compliance — birdclaw can import it via `birdclaw import archive`.
2. Configure xurl for any programmatic access to your own account data that must remain policy-compliant.
3. Use bird transport only for personal convenience with full knowledge of the suspension risk.

---

## bird cookie expiry — silent failure

**Symptom:** `birdclaw sync likes --mode bird --json` returns `{"tweets": []}` or a very small result set with no error message. `birdclaw dms list --json` returns empty. Commands complete with exit code 0.

**Cause:** bird's session cookie has expired. birdclaw receives an empty or error response from bird but may not surface a clear "session expired" message — it can look identical to "no data found."

**Fix:**
1. Re-authenticate in your browser — log in to x.com in the browser that bird reads cookies from.
2. If bird requires explicit cookie refresh, consult bird's own documentation for the re-auth flow.
3. Run `birdclaw auth status --json` to check transport state.
4. Re-run with `--refresh` to bypass cache: `birdclaw sync likes --mode bird --refresh --json`.

**Preventive check:** before running a large sync, test with a small limit first:

```bash
birdclaw sync likes --mode bird --limit 5 --refresh --json
```

If you get results, the session is live. If you get `[]`, refresh auth before proceeding.

---

## Per-invocation bird transport advisories

When using bird transport, birdclaw (or the bird CLI itself) may emit advisory messages on stderr. These are informational — not errors. Treat stderr output from bird-mode commands as expected session status notifications, not failures. Redirect stderr if you are piping JSON output:

```bash
birdclaw sync likes --mode bird --json 2>/dev/null | jq .
```

---

## auth status gives a full transport picture

Always check both transports before a long sync:

```bash
birdclaw auth status --json
```

This tells you which transports are available, authenticated, and ready. If xurl is absent, you cannot use `--mode xurl`. If bird is absent or unhealthy, `--mode auto` will fall back to xurl (or fail if xurl is also unavailable).

---

## macOS-specific features

The following features are macOS-only:

- **launchd scheduled jobs** (`birdclaw jobs install-bookmarks-launchd`) — installs a LaunchAgent plist at `~/Library/LaunchAgents/com.steipete.birdclaw.bookmarks-sync.plist`. This is macOS launchd; not available on Linux or Windows.
- **Local web UI** (`birdclaw serve`) is cross-platform, but the launchd auto-start for it is macOS-only.

birdclaw's core archive operations (sync, search, import, export, backup) run on any platform with Node.js.

---

## launchd scheduled bookmark sync

```bash
# Install the launchd agent for automatic bookmark syncing
birdclaw jobs install-bookmarks-launchd \
  --program /usr/local/bin/birdclaw \
  --env-file ~/.config/bird/env.sh    # optional: sources secrets for bird transport

# Verify it installed
launchctl list | grep birdclaw

# Check logs
tail -f ~/.birdclaw/logs/bookmarks-sync.*.log
cat ~/.birdclaw/audit/bookmarks-sync.jsonl | jq .
```

The plist is installed read-only — do not modify it directly. Re-run `install-bookmarks-launchd` to update it.

The `--env-file` approach keeps secrets out of the plist (which is world-readable). Set the env file to `0600`:

```bash
chmod 600 ~/.config/bird/env.sh
ls -la ~/.config/bird/env.sh   # verify: -rw------- 1 yourname staff ...
```

---

## Import from official X data export

The safest archival path: request your data from X, wait for the download, then import:

```bash
# 1. Download your archive from https://x.com/settings/download_your_data
# 2. Auto-discover and import
birdclaw archive find --json                          # locate the archive
birdclaw import archive --json                        # import with auto-discovery
# or: import explicit path
birdclaw import archive ~/Downloads/twitter-2024.zip --json
# 3. Refresh profile metadata after import
birdclaw import hydrate-profiles --json
```

This path requires no live transport — it is fully local and completely policy-compliant.

---

## Backup integrity

After setting up git backup, validate periodically:

```bash
birdclaw backup validate /path/to/backup --json
```

To restore on a new machine:

```bash
birdclaw backup import /path/to/backup --json
```

---

## Large syncs and rate limits

For a full historical sync across thousands of items, use `--all` with caution:

```bash
birdclaw jobs sync-bookmarks --mode auto --all --max-pages 50
```

`--max-pages` caps how many pages are fetched in a single run — useful for avoiding rate limit hits on xurl. Run it in multiple passes if needed.

For bird transport, heavy scraping is especially risky — keep syncs small and infrequent to reduce ToS exposure.

---

## BIRDCLAW_HOME on external storage

If you want the archive on a different drive:

```bash
export BIRDCLAW_HOME=/Volumes/archive/.birdclaw
birdclaw init
birdclaw sync likes --json
```

Add the export to your shell profile for persistence. All birdclaw operations respect this override.
