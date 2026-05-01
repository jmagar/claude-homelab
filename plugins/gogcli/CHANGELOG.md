# Changelog

## 0.1.0 — 2026-05-01

Initial release.

- Plugin wrapping Peter Steinberger's `gogcli` Google Workspace CLI (https://github.com/steipete/gogcli)
- Pure CLI plugin — no MCP server (`.mcp.json` is empty)
- Skill covers 8 key actions: gmail-search, gmail-send, calendar-events, drive-upload, drive-search, sheets-read, admin-users, multi-account-switch
- References: cli-commands.md (all 16 services), configuration.md (auth, DwD threat model, scope guidance), tips-gotchas.md (CI/headless auth, rate limits)
- Disambiguation: explicitly NOT the GOG.com game client (Magnitus-/gogcli)
