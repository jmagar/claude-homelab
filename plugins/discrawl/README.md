# discrawl

> Discord archiver by Peter Steinberger. Bot-token-based, TOS-compliant, local-first.

Wraps the [`discrawl`](https://github.com/steipete/discrawl) CLI for Claude Code — archives Discord guild messages and DMs to a local SQLite database with full-text search, semantic search, activity reports, and Git-backed snapshot sharing.

## Requirements

- Go 1.22+ (to build from source) or Homebrew tap
- A Discord **bot token** (not a user token — selfbots violate Discord ToS)
- Server Members Intent + Message Content Intent enabled in Discord Developer Portal (Privileged — see [configuration.md](skills/discrawl/references/configuration.md))

## Install

```bash
# Homebrew tap (recommended)
brew install steipete/tap/discrawl

# Or build from source
go install github.com/steipete/discrawl@latest
```

## Quick start

```bash
export DISCORD_BOT_TOKEN="your-bot-token-here"
discrawl init                        # discover guilds, write ~/.discrawl/config.toml
discrawl sync --guild <id>           # archive a guild
discrawl search "keyword"            # search archived messages
discrawl status                      # show archive health
```

## Plugin

This plugin is pure CLI — no MCP server. All functionality is via the `discrawl` binary. See `skills/discrawl/SKILL.md` for Claude Code integration patterns.
