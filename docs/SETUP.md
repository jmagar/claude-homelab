# Setup Guide -- homelab-core

Two installation paths: plugin marketplace (recommended) or bash symlinks.

## Prerequisites

| Tool | Version | Purpose |
| --- | --- | --- |
| Git | 2.40+ | Version control |
| just | latest | Task runner (73 KB Justfile with 30+ recipes) |
| jq | 1.6+ | JSON parsing in scripts |
| curl | any | HTTP connectivity checks |
| openssl | any | Token generation |
| Docker | 24+ | Container deployment for MCP plugins |
| Docker Compose | v2+ | Orchestration for MCP plugins |
| Node.js | 18+ | `npx skills-ref validate` for skill validation |

### Verify

```bash
git --version
just --version
jq --version
curl --version
docker --version
docker compose version
```

## Path 1: Plugin marketplace (recommended)

Install as a Claude Code plugin. Claude Code handles cloning, caching, and discovery automatically.

```bash
/plugin marketplace add jmagar/claude-homelab
/plugin install homelab-core @jmagar-claude-homelab
```

This installs:
- All 18 skills from `skills/`
- The notebooklm-specialist agent
- All slash commands
- Plugin manifests for Claude, Codex, and Gemini

### Configure credentials

After installation, run the interactive setup wizard:

```
/homelab-core:homelab-setup
```

Or manually create the credential file:

```bash
cp ~/.claude/plugins/cache/claude-homelab/homelab-core/*/.env.example ~/.claude-homelab/.env
chmod 600 ~/.claude-homelab/.env
# Edit with your credentials
```

## Path 2: Bash symlinks

Clone the repo and symlink into `~/.claude/` for Claude Code discovery.

### 1. Clone

```bash
git clone https://github.com/jmagar/claude-homelab.git ~/claude-homelab
cd ~/claude-homelab
```

### 2. Run setup

```bash
just symlinks
```

This creates all symlinks and initializes credentials:

```
~/.claude/
  skills/plex/          -> ~/claude-homelab/skills/plex/
  skills/radarr/        -> ~/claude-homelab/skills/radarr/
  ...                      (all 18 skill directories)
  agents/notebooklm-specialist.md -> ~/claude-homelab/agents/notebooklm-specialist.md
  commands/check.md     -> ~/claude-homelab/commands/check.md
  commands/deploy.md    -> ~/claude-homelab/commands/deploy.md
  commands/homelab/     -> ~/claude-homelab/commands/homelab/
  commands/notebooklm/  -> ~/claude-homelab/commands/notebooklm/
  ...

~/.claude-homelab/
  .env                  # Credentials (created from .env.example)
  load-env.sh           # Shared credential loading library
```

### 3. Configure credentials

```bash
vim ~/.claude-homelab/.env
```

Fill in URLs and API keys for your services. See [CONFIG.md](CONFIG.md) for the full variable reference.

### 4. Verify

```bash
just validate
```

This checks:
- `.env` exists and has correct permissions (600)
- All version-bearing files are in sync
- Installed plugins have their env vars configured
- Service connectivity
- MCP server status
- MCP config in Claude settings.json

## Installing external MCP plugins

The marketplace includes 10 external MCP server plugins. Install them individually:

```bash
/plugin install overseerr-mcp @jmagar-claude-homelab
/plugin install unraid-mcp @jmagar-claude-homelab
/plugin install synapse-mcp @jmagar-claude-homelab
```

Each MCP plugin needs its own Docker container running. Deploy all at once:

```bash
just up
```

Or deploy individually:

```bash
just deploy synapse-mcp
```

## Troubleshooting

### ".env file not found"

Run `just symlinks` to create `~/.claude-homelab/.env` from `.env.example`.

### "Permission denied"

```bash
chmod 600 ~/.claude-homelab/.env
chmod +x ~/claude-homelab/scripts/*.sh
```

### Skills not discovered

For plugin path: run `/plugin list` and verify homelab-core appears.
For bash path: check symlinks with `ls -la ~/.claude/skills/`.

### MCP plugin not connecting

```bash
just health          # Check service connectivity
just compose-status  # Check Docker container status
just mcp-servers     # List running MCP servers
```
