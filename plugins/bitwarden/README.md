# Bitwarden

Bitwarden MCP integration for Claude Code.

## MCP Session Flow

The MCP server needs an unlocked Bitwarden CLI session. This plugin keeps the
session token out of static MCP config by writing it to a runtime-only file:

```bash
/run/user/$(id -u)/bitwarden-mcp/session
```

Unlock for MCP:

```bash
plugins/bitwarden/scripts/session unlock
```

Ensure a usable runtime token, prompting only when the current token is missing
or stale:

```bash
plugins/bitwarden/scripts/session ensure
```

Lock and remove the runtime token:

```bash
plugins/bitwarden/scripts/session lock
```

Check whether the saved session is usable:

```bash
plugins/bitwarden/scripts/session status
```

The MCP entrypoint at `bin/bitwarden-mcp` reads that session file before
starting the pinned `@bitwarden/mcp-server` package.

For local convenience, a shell wrapper can run `scripts/session ensure` before
launching Claude Code.

Install shell wrappers for `claude`, `codex`, and `gemini`:

```bash
plugins/bitwarden/scripts/install-shell-wrappers
```

By default this writes to `~/.zshrc` for zsh or `~/.bashrc` for bash. To target
a custom file:

```bash
plugins/bitwarden/scripts/install-shell-wrappers --rc ~/.oh-my-zsh/custom/aliases.zsh
```

## Commands

This plugin includes three Claude Code commands:

- `/bw-list <items|folders|collections|organizations> [search]`
- `/bw-get <item|username|password|uri|totp|notes|folder> <id-or-search>`
- `/bw-generate [length] [--passphrase] [--words N] [--no-special]`

The commands use the Bitwarden MCP server and check the runtime MCP session
before calling Bitwarden tools.
