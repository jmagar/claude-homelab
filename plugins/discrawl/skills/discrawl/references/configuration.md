# discrawl Configuration Reference

## Config file

discrawl reads `~/.discrawl/config.toml` by default. Override with `--config <path>` or the `DISCRAWL_CONFIG` environment variable.

Run `discrawl init` to generate the file on first use.

---

## Full config.toml schema

```toml
version = 1
default_guild_id = ""          # Guild ID used when --guild is omitted
guild_ids = []                  # All guilds to discover/sync
db_path = "~/.discrawl/discrawl.db"
cache_dir = "~/.discrawl/cache"
log_dir = "~/.discrawl/logs"

[discord]
token_source = "env"            # "env" | "keyring" | "none" (Git-only setup)
token_env = "DISCORD_BOT_TOKEN" # Env var name to read the token from
token_keyring_service = "discrawl"
token_keyring_account = "discord_bot_token"

[sync]
source = "both"                 # "both" | "discord" | "wiretap"
concurrency = 16
repair_every = "6h"
full_history = true
attachment_text = true

[desktop]
path = "~/.config/discord"      # Linux default
# macOS: "~/Library/Application Support/discord"
max_file_bytes = 67108864       # 64 MiB wiretap file size limit

[search]
default_mode = "fts"            # "fts" | "semantic" | "hybrid"

[search.embeddings]
enabled = false
provider = "openai"             # "openai" | "ollama"
model = "text-embedding-3-small"
api_key_env = "OPENAI_API_KEY"
batch_size = 64

[share]
remote = ""                     # Git remote URL for publish/subscribe
repo_path = "~/.discrawl/share"
branch = "main"
auto_update = true
stale_after = "15m"
```

---

## Environment variables

| Variable | Description |
|----------|-------------|
| `DISCORD_BOT_TOKEN` | Bot authentication token (checked first by default) |
| `DISCRAWL_CONFIG` | Override config file path |
| `DISCRAWL_NO_AUTO_UPDATE=1` | Disable Git snapshot auto-fetch |
| `OPENAI_API_KEY` | Required when `[search.embeddings] provider = "openai"` |
| `GOMAXPROCS` | Affects default concurrency calculation |

---

## Bot token setup

discrawl requires a **bot token** — not a user token. Selfbots (user tokens used with third-party tools) violate Discord's Terms of Service. For common token format errors and 401 diagnostics, see [Token troubleshooting](../tips-gotchas.md#bot-token-format).

### Create a Discord bot

1. Go to [Discord Developer Portal](https://discord.com/developers/applications)
2. Click **New Application**, give it a name
3. In the left sidebar, click **Bot**
4. Click **Reset Token** → copy the token
5. Enable the Privileged Gateway Intents (see below)
6. In the left sidebar, click **OAuth2 → URL Generator**
7. Under Scopes, select `bot`
8. Under Bot Permissions, select: **View Channels**, **Read Message History**
9. Copy the generated URL, open it, and invite the bot to your server

### Set the token

#### Option 1: OS Keyring (recommended — most secure)

The keyring never exposes the token to the process environment or shell history.

```bash
# macOS
security add-generic-password -U -s discrawl -a discord_bot_token -w "your-token-here"

# Linux (requires libsecret)
printf %s "your-token-here" | secret-tool store \
  --label="discrawl Discord bot token" \
  service discrawl username discord_bot_token

# Windows
cmdkey /generic:discrawl:discord_bot_token /user:discord_bot_token /pass:your-token-here
```

Then set `token_source = "keyring"` in `config.toml`.

#### Option 2: Config file (moderate security)

Store the token directly in `~/.discrawl/config.toml` under `[discord]`:

```toml
[discord]
token_source = "env"
token_env = "DISCORD_BOT_TOKEN"
```

Ensure the file has restrictive permissions: `chmod 600 ~/.discrawl/config.toml`.

#### Option 3: Environment variable (development only)

> **Development only.** Do not set this permanently in `.bashrc` or `.zshrc` — shell-exported
> variables are readable via `/proc/<pid>/environ`, appear in process listings, and inherit
> into all child processes. Never use in shared or CI environments without scoping the variable
> to a single invocation:
>
> ```bash
> DISCORD_BOT_TOKEN="your-token-here" discrawl sync
> ```

If you must export for a shell session:

```bash
export DISCORD_BOT_TOKEN="your-token-here"
```

---

## Privileged Gateway Intents

**This step is mandatory** for archiving message content and member lists. Skipping it causes sync to run silently with empty results — no error is shown.

### What are Privileged Intents?

Discord classifies two intents as Privileged:
- **Server Members Intent** — required to list guild members
- **Message Content Intent** — required to read message bodies

For bots in servers with fewer than 100 members, these can be enabled without additional approval. For bots in servers with 100 or more members, Discord requires a manual review before the intents are granted.

### How to enable Privileged Intents

1. Go to [Discord Developer Portal](https://discord.com/developers/applications)
2. Select your application
3. In the left sidebar, click **Bot**
4. Scroll down to **Privileged Gateway Intents**
5. Toggle on **Server Members Intent**
6. Toggle on **Message Content Intent**
7. Click **Save Changes**

**For bots in 100+ member servers:** Discord will show a warning that manual verification is required. Click the link to submit a verification request, describe your archiving use case, and wait for Discord's approval before running a full sync.

### Verifying intents are active

Run `discrawl doctor` after setup:

```bash
discrawl doctor
```

If intents are not approved, doctor will flag the issue. You can also attempt a small sync and check `discrawl status` — if message counts are zero or all message bodies are null, intents are not active.

---

## Semantic search (embeddings)

Embeddings are disabled by default. To enable:

1. Get an OpenAI API key from [platform.openai.com](https://platform.openai.com)
2. Set `OPENAI_API_KEY` in your environment
3. In `config.toml`, set:
   ```toml
   [search.embeddings]
   enabled = true
   provider = "openai"
   model = "text-embedding-3-small"
   api_key_env = "OPENAI_API_KEY"
   ```
4. Re-sync with `--with-embeddings`:
   ```bash
   discrawl sync --guild <id> --with-embeddings
   ```

For local embedding generation without API calls, set `provider = "ollama"` and ensure an Ollama instance is running.

---

## Git-only setup (no bot token)

To use `subscribe` to read a published snapshot without running a bot, set:

```toml
[discord]
token_source = "none"
```

Then use `discrawl subscribe --remote <url>` to import a snapshot. Search and query commands work against the imported data. Sync commands are unavailable without a token.
