# Claude Homelab - Development Guidelines

Comprehensive Claude Code skills, agents, and commands for homelab service management.

## Glossary

- **Skill**: A Claude Code plugin providing commands and scripts for a specific service (e.g., Plex, Radarr)
- **Agent**: A specialized AI agent for complex workflows (e.g., `notebooklm-specialist`)
- **Command**: A slash command invocable in Claude Code (e.g., `/firecrawl:scrape`, `/homelab:docker-health`)
- **Script**: Executable code in skill `scripts/` directories that performs API calls or system operations
- **Reference**: Detailed documentation in skill `references/` directories (API endpoints, troubleshooting, etc.)
- **Symlink**: Symbolic link connecting this repo to `~/.claude/` for Claude Code discovery
- **SKILL.md**: Claude-facing skill definition with commands, workflows, and examples
- **README.md**: User-facing documentation for setting up and using a skill
- **.env**: Environment file containing credentials (gitignored, NEVER commit)
- **.env.example**: Template credential file (tracked in git, NO secrets)

## Repository Overview

This repository provides production-ready integrations for self-hosted homelab services via a dual-path install:
- **Plugin path** (`/plugin marketplace add jmagar/claude-homelab`) — Claude Code native plugin system
- **Bash path** (`curl -sSL .../install.sh | bash`) — symlinks into `~/.claude/`

- **homelab-core plugin** — agents, commands, prompts, setup wizard, health dashboard (repo root IS the plugin)
- **Service skills** (`skills/`) — 16 service integrations + 2 homelab-core skills (18 total); each skill directory is independently usable
- **Shared library** (`scripts/load-env.sh`) — credential loading, installed to `~/.claude-homelab/`

## Repository Structure

```
claude-homelab/
├── README.md                        # User-facing documentation (comprehensive)
├── CLAUDE.md                        # This file - development guidelines
├── .env.example                     # Credential template (tracked, no secrets)
├── .claude-plugin/
│   ├── marketplace.json             # Plugin catalog (32 plugins)
│   └── plugin.json                  # homelab-core manifest (root IS the plugin)
│
├── agents/                          # homelab-core agents
│   └── notebooklm-specialist.md
│
├── commands/                        # homelab-core slash commands (.md definitions)
│   ├── check.md                     # /check
│   ├── deploy.md                    # /deploy
│   ├── quick-push.md                # /quick-push
│   ├── save-to-md.md                # /save-to-md
│   ├── validate-plan.md             # /validate-plan
│   ├── homelab/                     # /homelab:system-resources, docker-health, disk-space, zfs-health
│   └── notebooklm/                  # /notebooklm:create, ask, source, generate, download, list, research
│
├── prompts/                         # Command prompt definitions (.toml sidecars)
│   ├── check.toml                   # Prompt body for /check
│   ├── deploy.toml                  # Prompt body for /deploy
│   ├── quick-push.toml              # Prompt body for /quick-push
│   ├── save-to-md.toml              # Prompt body for /save-to-md
│   ├── validate-plan.toml           # Prompt body for /validate-plan
│   └── homelab/                     # Prompt bodies for /homelab:* commands
│       ├── disk-space.toml
│       ├── docker-health.toml
│       ├── system-resources.toml
│       └── zfs-health.toml
│
├── docs/references/                 # Shared reference documentation
│   └── security-patterns.md         # Reusable security patterns for scripts
│
├── skills/                          # All service skills (16 services + 2 homelab-core)
│   ├── CLAUDE.md                    # Skill development guidelines
│   ├── homelab-setup/SKILL.md       # /homelab-core:setup — interactive credential wizard
│   ├── homelab-health/
│   │   ├── SKILL.md                 # /homelab-core:health — service health dashboard
│   │   └── scripts/check-health.sh  # Curl-checks all services, outputs JSON
│   └── [service]/                   # e.g., plex/, radarr/, sonarr/, ...
│       ├── SKILL.md                 # Skill definition
│       ├── scripts/                 # Bash/Python/Node API scripts
│       └── references/              # API docs, quick-reference, troubleshooting
│
└── scripts/                         # Install and maintenance scripts
    ├── install.sh                   # Bash path entry point
    ├── setup-creds.sh               # Creates ~/.claude-homelab/.env (both paths)
    ├── setup-symlinks.sh            # Bash path: symlinks skills/ → ~/.claude/skills/
    └── verify.sh                    # Dual-path verification (exits 0 if clean)
```

## Marketplace Repos

The `claude-homelab` marketplace (`.claude-plugin/marketplace.json`) encompasses 11 repositories — 1 core mono-repo plus 10 external plugin repos:

| # | Plugin | Repo | Local Path | Category |
|---|--------|------|------------|----------|
| 1 | **homelab-core** | [jmagar/claude-homelab](https://github.com/jmagar/claude-homelab) | `~/claude-homelab` (this repo) | core |
| 2 | **overseerr-mcp** | [jmagar/overseerr-mcp](https://github.com/jmagar/overseerr-mcp) | `~/workspace/overseerr-mcp` | media |
| 3 | **unraid-mcp** | [jmagar/unraid-mcp](https://github.com/jmagar/unraid-mcp) | `~/workspace/unraid-mcp` | infrastructure |
| 4 | **unifi-mcp** | [jmagar/unifi-mcp](https://github.com/jmagar/unifi-mcp) | `~/workspace/unifi-mcp` | infrastructure |
| 5 | **gotify-mcp** | [jmagar/gotify-mcp](https://github.com/jmagar/gotify-mcp) | `~/workspace/gotify-mcp` | utilities |
| 6 | **swag-mcp** | [jmagar/swag-mcp](https://github.com/jmagar/swag-mcp) | `~/workspace/swag-mcp` | infrastructure |
| 7 | **synapse-mcp** | [jmagar/synapse-mcp](https://github.com/jmagar/synapse-mcp) | `~/workspace/synapse-mcp` | infrastructure |
| 8 | **arcane-mcp** | [jmagar/arcane-mcp](https://github.com/jmagar/arcane-mcp) | `~/workspace/arcane-mcp` | infrastructure |
| 9 | **syslog-mcp** | [jmagar/syslog-mcp](https://github.com/jmagar/syslog-mcp) | `~/workspace/syslog-mcp` | infrastructure |
| 10 | **plugin-lab** | [jmagar/plugin-lab](https://github.com/jmagar/plugin-lab) | `~/workspace/plugin-lab` | dev-tools |

The remaining 16 marketplace entries (bytestash, gh-address-comments, linkding, memos, notebooklm, paperless-ngx, plex, prowlarr, qbittorrent, radarr, radicale, sabnzbd, sonarr, tailscale, tautulli, zfs) are **bundled skill-only** plugins sourced from `./skills/*` within this repo. They graduate to their own external repo when they gain additional plugin surface area (agents, commands, MCP servers, etc.).

## Source of Truth

**This repository (`~/claude-homelab`) is the single source of truth for all homelab agents, skills, and commands.**

All definitions live here and are symlinked into `~/.claude/` for Claude Code discovery. Never edit files directly in `~/.claude/` — always edit in this repo.

### Symlink Architecture

Bash path only — plugin path uses `~/.claude/plugins/cache/`, no symlinks.

```
~/.claude/
├── agents/
│   └── notebooklm-specialist.md → ~/claude-homelab/agents/notebooklm-specialist.md
├── skills/
│   ├── plex/                    → ~/claude-homelab/skills/plex/
│   ├── radarr/                  → ~/claude-homelab/skills/radarr/
│   └── ...                      (all 18 skill directories)
└── commands/
    ├── check.md                 → ~/claude-homelab/commands/check.md
    ├── deploy.md                → ~/claude-homelab/commands/deploy.md
    ├── quick-push.md            → ~/claude-homelab/commands/quick-push.md
    ├── save-to-md.md            → ~/claude-homelab/commands/save-to-md.md
    ├── validate-plan.md         → ~/claude-homelab/commands/validate-plan.md
    ├── homelab/                 → ~/claude-homelab/commands/homelab/
    └── notebooklm/              → ~/claude-homelab/commands/notebooklm/

~/.claude-homelab/
├── .env                         # Credentials (chmod 600, never committed)
└── load-env.sh                  # Copied from scripts/load-env.sh
```

### How Slash Commands Work

Slash commands are created by placing `.md` files in `~/.claude/commands/`. Claude Code discovers them automatically:

- **Single command:** `commands/proxy.md` → `/proxy`
- **Namespaced commands:** `commands/firecrawl/scrape.md` → `/firecrawl:scrape`

The **directory name** becomes the namespace prefix, the **file name** becomes the command after the colon.

### Command File Format

```yaml
---
description: Short description shown in autocomplete
argument-hint: <required> [optional]
allowed-tools: Bash(tool:*), mcp__plugin_name__tool
---

Task instruction using $ARGUMENTS

## Instructions
Steps for Claude to follow when this command is invoked.
```

Key fields:
- **`description`** — shown in autocomplete menu
- **`argument-hint`** — hint for expected arguments
- **`allowed-tools`** — pre-approved tools (no permission prompts)
- **`$ARGUMENTS`** — replaced with user input after the command
- **`!`command``** — dynamic context injection (runs shell command, injects output)

### Prompt Definitions (prompts/)

Command prompt bodies live in `prompts/` as `.toml` files, separate from the `.md` command definitions in `commands/`. This separation keeps command metadata (frontmatter, description) distinct from the prompt content.

**Format:**
```toml
name = "command-name"
description = "Short description"
prompt = """
Prompt body with instructions, dynamic context injection, etc.
"""
```

The `prompts/` directory mirrors the `commands/` structure:
- `prompts/check.toml` — prompt body for `/check`
- `prompts/homelab/docker-health.toml` — prompt body for `/homelab:docker-health`

### Adding New Symlinks

Service skills live in `skills/`. When adding a new service skill:

```bash
# New service skill (directory symlink)
ln -sf ~/claude-homelab/skills/new-service ~/.claude/skills/new-service

# New agent (file symlink)
ln -sf ~/claude-homelab/agents/new-agent.md ~/.claude/agents/new-agent.md

# New command - single file
ln -sf ~/claude-homelab/commands/new-cmd.md ~/.claude/commands/new-cmd.md

# New command - namespaced directory
ln -sf ~/claude-homelab/commands/service-name ~/.claude/commands/service-name
```

### Automated Symlink Setup

Run the setup script to create all required symlinks automatically:

```bash
# Create all symlinks
./scripts/setup-symlinks.sh

# Verify everything is in place
./scripts/verify.sh
```

The setup script:
- Creates `~/.claude/` directories if missing
- Symlinks all `skills/*/` → `~/.claude/skills/`
- Symlinks all `agents/*.md` → `~/.claude/agents/`
- Symlinks all `commands/` files/dirs → `~/.claude/commands/`
- Copies `scripts/load-env.sh` → `~/.claude-homelab/load-env.sh`
- Creates `~/.claude-homelab/.env` from `.env.example` if missing
- Skips existing valid symlinks, never overwrites `.env`

## Core Principles

### 1. Credential Management

**All credentials are stored in `~/.claude-homelab/.env` (copied from `.env.example` at install).**

**Security requirements:**
- ✅ `.env` is gitignored (NEVER commit credentials)
- ✅ Set permissions: `chmod 600 .env`
- ✅ NEVER log credentials (even in debug mode)
- ✅ Use `.env.example` as a template (tracked in git)
- ❌ NO JSON config files with credentials
- ❌ NO hardcoded credentials in scripts

**Pattern for all scripts:**
```bash
# Bash scripts
source "$REPO_ROOT/scripts/load-env.sh"
load_env_file || exit 1
validate_env_vars "SERVICE_URL" "SERVICE_API_KEY"

# Python scripts
from pathlib import Path
env_path = Path.home() / "claude-homelab" / ".env"
# Parse and load variables
```

**Environment variable naming:**
```bash
# Single instance services
SERVICE_URL="https://service.example.com"
SERVICE_API_KEY="your-api-key"

# Multi-instance services
SERVICE1_URL="https://server1.example.com"
SERVICE1_API_KEY="key1"
SERVICE2_URL="https://server2.example.com"
SERVICE2_API_KEY="key2"
```

**.env.example Template:**

The installer copies `.env.example` to `~/.claude-homelab/.env`. See `.env.example` for the full template covering all service integrations grouped by category.

**Security Checklist:**
- [ ] `~/.claude-homelab/.env` has `chmod 600` permissions
- [ ] No credentials in code, docs, or commit history
- [ ] `.env.example` has placeholder values only

### 2. Shared Library (scripts/load-env.sh)

The `scripts/load-env.sh` library provides centralized environment loading:

```bash
# Loads ~/.claude-homelab/.env by default (or an explicit override)
load_env_file [/optional/path/to/.env]

# Validate required variables exist
validate_env_vars "VAR1" "VAR2" "VAR3"

# Load and validate service credentials
load_service_credentials "service-name" "URL_VAR" "API_KEY_VAR"
```

**All skills and scripts MUST use this library for credentials.**

### 3. Directory Organization

**Skill vs plugin boundary**

- A directory under `skills/` does not automatically become a standalone plugin.
- Skill-only integrations remain bundled with `homelab-core`.
- Do not add a bundled in-repo skill directly to `marketplace.json` as its own plugin entry.
- A service integration becomes a standalone plugin only when it gains additional bundled plugin surface area, such as:
  - agents
  - commands
  - hooks
  - MCP servers
  - output styles
  - channels
  - companion skills
- At that point, it should move to its own repository and be referenced from the Claude and Codex marketplace manifests as an external repo-sourced plugin.

**Service skills** — In `skills/`, one directory per service:
- Each service at `skills/<name>/` with `SKILL.md`, `scripts/`, and `references/`
- homelab-core's own skills (`setup/`, `health/`) also live here
- All service-specific skills belong here (16 services + 2 core = 18 total)

**Agents** — Specialized AI agents in `agents/`:
- Markdown files defining agent behavior
- Used by orchestration systems
- Named `*-specialist.md` or `*-orchestrator.md`

**Commands** - Reusable commands in `commands/`:
- Markdown files defining command patterns
- Can be invoked via Claude Code
- Document common workflows

**Shared Code** - Common utilities in `scripts/`:
- `load-env.sh` — credential loading library
- Check scripts — Docker security, env baking, ignore files, outdated deps

### 4. Git Workflow

**Branch strategy:**
- `main` - Production-ready code
- Feature branches for new skills/agents
- PR required before merge

**Commit conventions:**
```bash
# Format: <type>(<scope>): <description> (vX.Y.Z)
feat(radicale): add CalDAV/CardDAV skill (v1.0.0)
fix(plex): correct authentication headers (v1.2.1)
docs(readme): update skill catalog
refactor(lib): improve load-env error handling
```

**Never commit:**
- `.env` files (gitignored)
- Credentials or API keys
- Large binary files
- Temporary/debug files

### 5. Code Standards

**Bash scripts:**
- `set -euo pipefail` (strict mode)
- Quote all variables: `"$var"`
- Use functions for reusable code
- Include shebangs: `#!/bin/bash`
- Executable permissions: `chmod +x`
- Return JSON where appropriate

**Python scripts:**
- Type hints on all functions
- Google-style docstrings
- Use f-strings for formatting
- Async/await for I/O operations
- PEP 8 style guide

**Node.js scripts:**
- ESM modules (`.mjs` extension)
- `import` syntax (NOT `require`)
- Async/await for I/O
- No `any` types in TypeScript
- Strict mode enabled

### 6. Documentation Standards

**Every skill requires:**
1. `SKILL.md` - Claude Code skill definition
2. `README.md` - User-facing documentation
3. Reference documentation (choose based on skill type):
   - `references/api-endpoints.md` - For REST API services (Plex, Overseerr, etc.)
   - `references/command-reference.md` - For CLI tools (ZFS, git, docker, etc.)
   - `references/library-reference.md` - For libraries/SDKs
   - `references/config-reference.md` - For configuration schemas, options, and defaults
4. `references/quick-reference.md` - Quick examples
5. `references/troubleshooting.md` - Common issues

**Progressive disclosure:**
- SKILL.md: ~2,000 words (core syntax and workflows)
- References: Unlimited (detailed documentation)
- Examples: Complete, runnable code
- Scripts: Executable, not documentation

See `skills/CLAUDE.md` for detailed skill development guidelines.

## Development Workflows

### Adding a New Skill

1. **Use the skill creator:**
   ```
   /plugin-dev:create-plugin
   ```

2. **Create skill directory:**
   ```bash
   mkdir -p skills/service-name/{scripts,references,examples}
   ```

3. **Follow the skill template:**
   - Copy structure from existing skill
   - Update SKILL.md frontmatter (`name`, `description`, plus any validator-supported optional fields)
   - Add mandatory skill invocation section
   - Document all commands with examples
   - Include workflow decision trees

4. **Implement scripts:**
   - Use `scripts/load-env.sh` for credentials
   - Return JSON output
   - Include error handling
   - Support `--help` flag

5. **Create documentation:**
   - SKILL.md (Claude-facing)
   - README.md (user-facing)
   - references/ (detailed docs)

6. **Test thoroughly:**
   - Run scripts manually
   - Verify JSON output
   - Test error conditions
   - Check credential loading

7. **Update repository docs:**
   - Add skill to README.md catalog
   - Update skills/CLAUDE.md if needed

### Adding a New Agent

1. **Create agent definition:**
   ```bash
   touch agents/new-specialist.md
   ```

2. **Define agent behavior:**
   - Purpose and capabilities
   - Available tools
   - Workflow patterns
   - Integration points

3. **Document usage:**
   - When to invoke the agent
   - Input/output format
   - Example workflows

### Adding a New Command

Commands become slash commands in Claude Code via symlinks to `~/.claude/commands/`.

**Single command** (`/command-name`):
```bash
# Create in repo
touch commands/new-command.md
# Symlink to ~/.claude
ln -sf ~/claude-homelab/commands/new-command.md ~/.claude/commands/new-command.md
```

**Namespaced commands** (`/service:action`):
```bash
# Create directory in repo
mkdir -p commands/service-name
touch commands/service-name/action.md
# Symlink directory to ~/.claude
ln -sf ~/claude-homelab/commands/service-name ~/.claude/commands/service-name
```

**Command file format:**
```yaml
---
description: Short description for autocomplete
argument-hint: <required> [optional]
allowed-tools: Bash(tool:*), mcp__plugin__tool
---

Task: $ARGUMENTS

## Instructions
Steps for Claude to follow.
```

Key fields:
- `description` — shown in autocomplete
- `argument-hint` — expected arguments hint
- `allowed-tools` — pre-approved tools (no permission prompts)
- `$ARGUMENTS` — replaced with user input
- `` !`command` `` — dynamic context injection (shell output)

## Common Patterns

### Error Handling

```bash
# Bash - defensive error handling
if ! result=$(command 2>&1); then
    log_error "Command failed: $result"
    return 1
fi

# Timeout protection
if ! output=$(timeout 30 command 2>&1); then
    log_warn "Command timed out"
    return 0
fi
```

### JSON Output

```bash
# Bash - consistent JSON structure
cat <<EOF
{
  "success": true,
  "data": {
    "id": 123,
    "name": "Example"
  },
  "timestamp": "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
}
EOF
```

### Logging

```bash
# Use structured logging
log_info "Operation started"
log_warn "Potential issue detected"
log_error "Operation failed"
log_success "Operation completed"
```

### Security Patterns

See `docs/references/security-patterns.md` for detailed patterns covering input sanitization, command injection prevention, URL encoding, SQL injection prevention, API key protection, path traversal prevention, and JSON response parsing.

## Testing

### Manual Testing

```bash
# Test credential loading
./scripts/test-script.sh

# Validate JSON output
./scripts/script.sh | jq .

# Test error conditions
SERVICE_URL="" ./scripts/script.sh  # Should fail gracefully
```

### Integration Testing

```bash
# Test full workflow
./scripts/search.sh "query"
./scripts/create.sh --title "Test"
./scripts/delete.sh 123
```

## Troubleshooting

### Common Issues

**".env file not found"**
- Run `scripts/setup-symlinks.sh` to create `~/.claude-homelab/.env` from `.env.example`
- Or manually: `cp .env.example ~/.claude-homelab/.env && chmod 600 ~/.claude-homelab/.env`

**"Permission denied"**
- Make scripts executable: `chmod +x scripts/*.sh`
- Check .env permissions: `chmod 600 ~/.claude-homelab/.env`

**"Command not found"**
- Install required dependencies (jq, curl, etc.)
- Check PATH includes script directory

**"Invalid JSON"**
- Validate with: `jq . < output.json`
- Check for unescaped quotes in strings

### Debug Mode

```bash
# Enable debug logging
DEBUG=1 ./scripts/script.sh

# Trace script execution
bash -x ./scripts/script.sh
```

## Security Best Practices

1. **Never commit credentials**
   - Always use `.env` file
   - Double-check before committing
   - Use `.env.example` as template

2. **Secure permissions**
   - `.env`: `chmod 600` (owner read/write only)
   - Scripts: `chmod +x` (executable)

3. **HTTPS in production**
   - Update service URLs from HTTP to HTTPS
   - Use valid SSL certificates

4. **Rotate credentials regularly**
   - Update `.env` file
   - Test all affected skills

5. **Review skill permissions**
   - Read-only vs read-write
   - Destructive operations require confirmation

## Version Control

### Semantic Versioning

Plugin and release artifacts use semantic versioning (MAJOR.MINOR.PATCH). Do not add a `version`
field to `SKILL.md` frontmatter unless the active skill schema explicitly supports it.

- **MAJOR** (x.0.0): Breaking changes, removed features
- **MINOR** (1.x.0): New features, enhancements (backward compatible)
- **PATCH** (1.0.x): Bug fixes, documentation updates

### Version Bump Examples

```yaml
# Adding new feature in plugin/package manifests
version: 1.1.0 → 1.2.0  # MINOR bump

# Fixing bug in plugin/package manifests
version: 1.1.0 → 1.1.1  # PATCH bump

# Breaking API change in plugin/package manifests
version: 1.2.0 → 2.0.0  # MAJOR bump
```

## Links and Resources

- **Repository:** https://github.com/jmagar/claude-homelab
- **Claude Code:** https://claude.ai/code
- **Skills Development:** See `skills/CLAUDE.md`
- **README:** See `README.md`

---

**Version:** 1.3.0
**Last Updated:** 2026-04-03
**Changelog:**
- Fixed stale agent count (4 → 1), skill count (22 → 18), plugin count (23 → 27)
- Removed phantom agents (agentic-orchestrator, exa-specialist, firecrawl-specialist)
- Added /deploy command and prompts/ directory to structure
- Extracted .toml prompt sidecars to prompts/ directory
- Moved security patterns to docs/references/security-patterns.md
- Replaced inline .env template with pointer to .env.example
- Fixed .env location contradiction
- Removed Table of Contents (use search instead)

<!-- BEGIN BEADS INTEGRATION v:1 profile:minimal hash:ca08a54f -->
## Issue Tracking & Session Protocol

Uses `bd` (beads) for all task tracking — do NOT use TodoWrite, TaskCreate, or markdown TODO lists. Session close protocol (git push, bd dolt push) is injected by the startup hook — run `bd prime` for full context.
<!-- END BEADS INTEGRATION -->


## Version Bumping

**Every feature branch push MUST bump the version in ALL version-bearing files.**

Bump type is determined by the commit message prefix:
- `feat!:` or `BREAKING CHANGE` → **major** (X+1.0.0)
- `feat` or `feat(...)` → **minor** (X.Y+1.0)
- Everything else (`fix`, `chore`, `refactor`, `test`, `docs`, etc.) → **patch** (X.Y.Z+1)

**Files to update (if they exist in this repo):**
- `Cargo.toml` — `version = "X.Y.Z"` in `[package]`
- `package.json` — `"version": "X.Y.Z"`
- `pyproject.toml` — `version = "X.Y.Z"` in `[project]`
- `.claude-plugin/plugin.json` — `"version": "X.Y.Z"`
- `.codex-plugin/plugin.json` — `"version": "X.Y.Z"`
- `gemini-extension.json` — `"version": "X.Y.Z"`
- `README.md` — version badge or header
- `CHANGELOG.md` — new entry under the bumped version

All files MUST have the same version. Never bump only one file.
CHANGELOG.md must have an entry for every version bump.
