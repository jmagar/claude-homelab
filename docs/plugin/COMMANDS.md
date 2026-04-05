# Slash Commands -- homelab-core

All user-invocable slash commands defined in `commands/`.

## File location

```
commands/
  check.md                      # /check
  deploy.md                     # /deploy
  quick-push.md                 # /quick-push
  save-to-md.md                 # /save-to-md
  validate-plan.md              # /validate-plan
  homelab/
    disk-space.md               # /homelab:disk-space
    docker-health.md            # /homelab:docker-health
    system-resources.md         # /homelab:system-resources
    zfs-health.md               # /homelab:zfs-health
  notebooklm/
    ask.md                      # /notebooklm:ask
    create.md                   # /notebooklm:create
    download.md                 # /notebooklm:download
    generate.md                 # /notebooklm:generate
    list.md                     # /notebooklm:list
    research.md                 # /notebooklm:research
    source.md                   # /notebooklm:source
```

## Naming

| Layout | File | Resulting command |
| --- | --- | --- |
| Single | `commands/check.md` | `/check` |
| Namespaced | `commands/homelab/disk-space.md` | `/homelab:disk-space` |
| Namespaced | `commands/notebooklm/create.md` | `/notebooklm:create` |

The directory name becomes the namespace prefix. The filename (minus `.md`) becomes the command after the colon.

## Frontmatter

```yaml
---
description: Short description shown in autocomplete
argument-hint: <required> [optional]
allowed-tools: Bash(tool:*), Read, Write
---
```

| Field | Required | Description |
| --- | --- | --- |
| `description` | yes | One-line description for autocomplete menu |
| `argument-hint` | no | Hint for expected arguments |
| `allowed-tools` | no | Pre-approved tools (no permission prompts) |

## Variables and dynamic context

| Feature | Syntax | Description |
| --- | --- | --- |
| Arguments | `$ARGUMENTS` | Replaced with user input after the command |
| Dynamic context | `` !`command` `` | Shell output injected before Claude sees the prompt |

## Root commands

### /check

**Description:** View the latest screenshot from ~/Pictures/Screenshots
**Allowed tools:** Read, Bash
**Dynamic context:** Resolves latest screenshot file path

### /deploy

**Description:** Deploy all MCP plugin servers from marketplace.json
**Argument hint:** `[plugin-name]`
**Allowed tools:** Bash

Parses the marketplace to find external plugins, detects docker compose, and runs `docker compose up --build -d` for each. Reports results as a status table.

### /quick-push

**Description:** Git add all, commit with Claude, and push to current/new feature branch
**Allowed tools:** Bash, TodoWrite

Full workflow: orient (check branch), bump version (detect type from commit prefix), update CHANGELOG.md, stage/commit/push, and save session context. Includes version bump rules:
- `feat!:` or `BREAKING CHANGE` -> major
- `feat` or `feat(...)` -> minor
- Everything else -> patch

### /save-to-md

**Description:** Save session documentation with Neo4j memory integration
**Allowed tools:** Write, Bash, mcp__neo4j-memory__*

Documents the entire conversation session as a markdown file. Includes timeline, key findings, technical decisions, files modified, verification evidence, and next steps.

### /validate-plan

**Description:** Validate a technical implementation plan against homelab standards
**Argument hint:** `<plan-file-or-content>`
**Allowed tools:** Read, Bash

Checks for: sensitive data, credential loading pattern, documentation completeness, confirm gates on destructive actions, and standard directory structure.

## Homelab commands

### /homelab:disk-space

Monitors disk space usage across homelab hosts.

### /homelab:docker-health

Checks Docker container health status across the homelab.

### /homelab:system-resources

Reports CPU, memory, and system resource utilization.

### /homelab:zfs-health

Checks ZFS pool status, scrub history, and dataset health.

## NotebookLM commands

### /notebooklm:create

Create a new NotebookLM notebook.

### /notebooklm:ask

Ask questions within a notebook using citation-backed Q&A.

### /notebooklm:source

Add sources (URLs, documents) to a notebook.

### /notebooklm:generate

Generate artifacts (podcasts, summaries, videos) from notebook content.

### /notebooklm:download

Download generated artifacts from a notebook.

### /notebooklm:list

List existing notebooks.

### /notebooklm:research

Run a deep research workflow combining source gathering, Q&A, and artifact generation.

## Symlink setup

For bash-path discovery, symlink commands to `~/.claude/commands/`:

```bash
# Single command
ln -sf ~/claude-homelab/commands/check.md ~/.claude/commands/check.md

# Namespaced commands (symlink the directory)
ln -sf ~/claude-homelab/commands/homelab ~/.claude/commands/homelab
ln -sf ~/claude-homelab/commands/notebooklm ~/.claude/commands/notebooklm
```

Or run `just symlinks` to set up all symlinks automatically.

## Cross-references

- [AGENTS.md](AGENTS.md) -- Agents that commands may delegate to
- [SKILLS.md](SKILLS.md) -- Skills that provide domain knowledge for commands
