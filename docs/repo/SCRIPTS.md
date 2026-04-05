# Scripts Reference -- homelab-core

Scripts in `scripts/` for installation, setup, and maintenance.

## Script inventory

| Script | Purpose |
| --- | --- |
| `install.sh` | Bash-path entry point -- clones repo, runs setup |
| `load-env.sh` | Credential loading library (sourced, not executed) |
| `setup-creds.sh` | Creates `~/.claude-homelab/.env` from `.env.example` |
| `setup-symlinks.sh` | Symlinks skills/agents/commands to `~/.claude/` |
| `verify.sh` | Dual-path verification (exits 0 if clean) |
| `push-github-secrets.sh` | Push MCP credentials to GitHub Actions secrets |
| `standardize-changelog.sh` | Standardize CHANGELOG.md format |

## load-env.sh

The shared credential loading library. Installed to `~/.claude-homelab/load-env.sh`. Must be sourced, not executed directly.

### Functions

#### load_env_file

Loads `~/.claude-homelab/.env` (or an explicit override path) into the shell environment.

```bash
source "$HOME/.claude-homelab/load-env.sh"
load_env_file                        # loads default path
load_env_file /custom/path/.env      # loads custom path
```

Returns 1 if the file does not exist.

#### validate_env_vars

Validates that required environment variables are set and non-empty.

```bash
validate_env_vars "PLEX_URL" "PLEX_TOKEN"
```

Returns 1 and prints error listing missing variables.

#### load_service_credentials

Combined load + validate for a service.

```bash
load_service_credentials "plex" "PLEX_URL" "PLEX_TOKEN"
```

If the variables are not already set, loads .env first.

## install.sh

Entry point for bash-path installation:

```bash
curl -sSL https://raw.githubusercontent.com/jmagar/claude-homelab/main/scripts/install.sh | bash
```

## setup-symlinks.sh

Creates all required symlinks:
- Skills directories -> `~/.claude/skills/`
- Agent files -> `~/.claude/agents/`
- Command files and directories -> `~/.claude/commands/`
- Copies `load-env.sh` -> `~/.claude-homelab/`
- Creates `.env` from `.env.example` if missing

Equivalent to `just symlinks`.

## verify.sh

Checks that both installation paths are healthy. Exits 0 if everything is in order.

## push-github-secrets.sh

Reads MCP credentials from `~/.claude-homelab/.env` and pushes them to GitHub Actions secrets using `gh secret set`. Used for CI/CD pipelines that need MCP server credentials.

```bash
bash scripts/push-github-secrets.sh              # push to all repos
bash scripts/push-github-secrets.sh synapse-mcp   # push to specific repo
```

## Script conventions

### Shebang and strict mode

```bash
#!/bin/bash
set -euo pipefail
```

### Variable quoting

Always quote variables:

```bash
curl -sf "$SERVICE_URL/health"
```

### Path resolution

For maintenance scripts, resolve relative to the script location:

```bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(dirname "$SCRIPT_DIR")"
```

### Exit codes

| Code | Meaning |
| --- | --- |
| `0` | Success |
| `1` | Failure |
| `2` | Usage error / missing arguments |

## Cross-references

- [RECIPES.md](RECIPES.md) -- Justfile recipes that call these scripts
- [RULES.md](RULES.md) -- Code standards for scripts
- [GUARDRAILS.md](../GUARDRAILS.md) -- Security patterns for credential handling
