# Changelog

## 0.1.0 — Initial release

- Add birdclaw skill covering 7 core workflows: sync-likes, sync-bookmarks, search-tweets, import-archive, export-mentions, backup-sync, manage-blocklist.
- Add `references/cli-commands.md` with full command, subcommand, and flag reference for all birdclaw operations.
- Add `references/configuration.md` covering `~/.birdclaw/config.json` schema, xurl and bird transport setup, `BIRDCLAW_HOME` override, and `chmod 600` guidance for config.json and launchd env file.
- Add `references/tips-gotchas.md` covering TOS compliance analysis (xurl vs bird), bird cookie expiry silent-failure symptom and fix, per-invocation stderr advisories, macOS launchd scheduled jobs, official X data export import path, and large-sync rate-limit guidance.
