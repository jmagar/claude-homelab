# Changelog

## Unreleased

- Add Bitwarden MCP wrapper that reads a runtime-only session file and launches
  the pinned `@bitwarden/mcp-server@2026.2.0` package directly.
- Add `scripts/session` helper for `unlock`, `lock`, `status`, and `path`
  workflows.
- Add `scripts/session ensure` for CLI wrappers that should prompt only when
  the saved MCP session is missing or stale.
- Add `scripts/install-shell-wrappers` to install managed `claude`, `codex`,
  and `gemini` launch wrappers.
- Add Bitwarden skill instructions for MCP session handling.
- Add `/bw-list`, `/bw-get`, and `/bw-generate` Claude Code command definitions.
