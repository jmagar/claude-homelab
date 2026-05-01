# birdclaw

> Local-first X/Twitter archive CLI by Peter Steinberger.

Wraps the [`birdclaw`](https://github.com/steipete/birdclaw) CLI for Claude Code — syncs likes, bookmarks, DMs, and mentions to a local SQLite database, with search, export, backup, and moderation management.

## Transport warning

birdclaw supports two live transports. Choose carefully:

- **xurl** — wraps the X API v2 (OAuth). Requires the X API Basic tier ($100+/mo). Fully compliant for programmatic data access.
- **bird** — delegates to an external cookie-backed CLI. Free, but may violate X Terms of Service with account suspension risk.

For compliance-first archival, use X's official data export at https://x.com/settings/download_your_data and import it with `birdclaw import archive`.

## Requirements

- Node.js 25.8.1+ and pnpm (for source builds), or Homebrew (macOS)
- At least one transport: xurl (X API access) or bird (external CLI, user-provided)
- macOS for scheduled job features (launchd); core archive ops are cross-platform

## Install

```bash
# macOS (recommended)
brew install steipete/tap/birdclaw

# Any platform with Node 25.8.1+ and pnpm
pnpm install -g birdclaw
```

## Quick start

```bash
birdclaw init                            # initialize local state
birdclaw auth status --json             # check transport availability

birdclaw sync likes --mode auto --json  # sync likes (uses xurl or bird)
birdclaw sync bookmarks --mode auto --json
birdclaw search tweets "query" --json   # search local archive
```

## Plugin

This plugin is pure CLI — no MCP server. All functionality is via the `birdclaw` binary. See `skills/birdclaw/SKILL.md` for Claude Code integration patterns.
