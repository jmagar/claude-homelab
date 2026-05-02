---
name: discrawl
description: Discord archiver CLI by Peter Steinberger. This skill should be used when the user mentions discrawl, archiving Discord messages, searching Discord history locally, syncing a Discord guild to SQLite, Discord full-text or semantic search, wiretap mode, or publishing a Discord archive snapshot. Bot-token-based (TOS-compliant). Do NOT use for user-token or selfbot workflows.
---

# discrawl

**discrawl** archives Discord guilds and DMs to a local SQLite database with full-text search, semantic search, and Git-backed snapshot sharing. Go binary, local-first, no cloud calls for core features.

## Terms of Service and privacy

**Use bot tokens only.** discrawl is designed for Discord bot tokens. Using a user token (selfbot) violates Discord's Terms of Service and may result in account termination. Do not assist users attempting selfbot workflows.

**How to tell the difference:** A bot token is issued in the Discord Developer Portal under Bot → Token. User tokens are obtained by inspecting browser sessions — never use those with discrawl. discrawl handles the `Bot ` prefix that Discord's API requires internally; you only supply the raw token.

**DM privacy on publish:** Direct messages are stored under a synthetic guild ID `@me` and are **never exported** by `publish`. Snapshot imports via `subscribe` also preserve any existing local DM data without overwriting it. DMs stay on your machine.

**Embeddings need a separate API key.** Semantic search requires an OpenAI or Ollama API key configured under `[search.embeddings]` — it is disabled by default.

## Privileged Gateway Intents

Server Members Intent and Message Content Intent are **Privileged** — they require manual approval. Without them, `sync` runs without errors but archives zero message bodies (null content fields). See [configuration.md](references/configuration.md) for the approval walkthrough.

## 8 core actions

### `init` — set up config and discover guilds

```bash
discrawl init
discrawl init --guild <id>   # skip interactive guild discovery
```

Creates `~/.discrawl/config.toml` and lists guilds the bot can see.

### `sync` — archive a guild

```bash
discrawl sync --guild <id>
discrawl sync --guild <id> --full         # complete historical backfill
discrawl sync --all                       # all discovered guilds
discrawl sync --guild <id> --with-embeddings  # queue vectors too
```

Sync is resumable — interrupted runs pick up where they left off.

### `search` — query archived messages

```bash
discrawl search "keyword"
discrawl search "term" --mode fts|semantic|hybrid
discrawl search "term" --guild <id> --channel general --author alice
discrawl search "term" --dm               # search DMs only
discrawl search "term" --json             # machine-readable output
```

### `messages` — list message slices

```bash
discrawl messages --channel general --last 50
discrawl messages --channel general --days 7
discrawl messages --author alice --since 2025-01-01T00:00:00Z
discrawl messages --dm                    # shorthand for --guild @me
```

### `dms` — manage wiretap DM conversations

```bash
discrawl dms --list                       # list DM threads
discrawl dms --with alice                 # view thread
discrawl dms --search "query"             # search DMs
```

DM data is sourced from the Desktop cache via wiretap — bot API access to DMs requires the user to also run the client.

### `publish` — export archive as Git snapshot

```bash
discrawl publish --remote git@github.com:org/repo.git --push
discrawl publish --remote <url> --push --with-embeddings
```

DMs are excluded automatically. The snapshot is a Git repository containing channel history.

### `subscribe` — import a Git snapshot

```bash
discrawl subscribe --remote <url>
discrawl subscribe --remote <url> --no-auto-update
```

Used to restore an archive on a new machine or share read-only access. Existing local DM data is preserved on import.

### Semantic vectors — enable and use semantic search

```bash
discrawl sync --guild <id> --with-embeddings   # queue embeddings during sync
discrawl search "topic" --mode semantic         # search using vector similarity
```

Requires `[search.embeddings]` configured with an API key. Defaults to OpenAI `text-embedding-3-small`. Use `--mode hybrid` to combine full-text and semantic ranking.

## doctor and status

```bash
discrawl doctor     # validate config, auth, DB, and intents
discrawl status     # archive health and message counts per channel
```

Run `doctor` after initial setup to confirm bot token and intents are working before a full sync.

## Configuration

Settings live in `~/.discrawl/config.toml`. Set the bot token via `DISCORD_BOT_TOKEN` environment variable before first run. Full schema, keyring storage options, and Privileged Intent approval steps: [configuration.md](references/configuration.md).

## Full reference

- [cli-commands.md](references/cli-commands.md) — all 17+ commands and flags
- [configuration.md](references/configuration.md) — config.toml schema, bot token, intents
- [tips-gotchas.md](references/tips-gotchas.md) — silent empty archive, rate limits, wiretap, resume
