# Component Inventory -- homelab-core

Complete listing of all plugin components.

## Plugin surfaces

| Surface | Present | Count | Path |
| --- | --- | --- | --- |
| Skills | yes | 18 | `skills/` |
| Agents | yes | 1 | `agents/` |
| Commands | yes | 16 | `commands/` |
| Hooks | placeholder | 0 | `hooks/` (.gitkeep only) |
| Channels | via plugins | -- | Discord, synapse-mcp channels |
| Output styles | placeholder | 0 | `output-styles/` (.gitkeep only) |
| Schedules | no | -- | -- |

## Skills (18 total)

### Core skills

| Skill | Directory | Purpose |
| --- | --- | --- |
| homelab-setup | `skills/homelab-setup/` | Interactive credential setup wizard |
| homelab-health | `skills/homelab-health/` | Service health dashboard with curl checks |

### Media skills

| Skill | Directory | Purpose |
| --- | --- | --- |
| plex | `skills/plex/` | Plex Media Server management |
| radarr | `skills/radarr/` | Radarr movie collection management |
| sonarr | `skills/sonarr/` | Sonarr TV series management |
| prowlarr | `skills/prowlarr/` | Prowlarr indexer management |
| tautulli | `skills/tautulli/` | Tautulli Plex monitoring and analytics |

### Download skills

| Skill | Directory | Purpose |
| --- | --- | --- |
| sabnzbd | `skills/sabnzbd/` | SABnzbd Usenet download management |
| qbittorrent | `skills/qbittorrent/` | qBittorrent torrent download management |

### Infrastructure skills

| Skill | Directory | Purpose |
| --- | --- | --- |
| tailscale | `skills/tailscale/` | Tailscale VPN mesh network management |
| zfs | `skills/zfs/` | ZFS storage pool and dataset management |

### Utility skills

| Skill | Directory | Purpose |
| --- | --- | --- |
| linkding | `skills/linkding/` | Linkding bookmark management |
| memos | `skills/memos/` | Memos note-taking service |
| bytestash | `skills/bytestash/` | ByteStash code snippet management |
| paperless-ngx | `skills/paperless-ngx/` | Paperless-ngx document management |
| radicale | `skills/radicale/` | Radicale CalDAV/CardDAV management |

### Research skills

| Skill | Directory | Purpose |
| --- | --- | --- |
| notebooklm | `skills/notebooklm/` | Google NotebookLM integration |

### Developer tool skills

| Skill | Directory | Purpose |
| --- | --- | --- |
| gh-address-comments | `skills/gh-address-comments/` | GitHub PR review comment resolution |

## Agent

| Agent | File | Purpose |
| --- | --- | --- |
| notebooklm-specialist | `agents/notebooklm-specialist.md` | Deep research via NotebookLM |

## Commands (16)

### Root commands

| Command | File | Description |
| --- | --- | --- |
| `/check` | `commands/check.md` | View latest screenshot |
| `/deploy` | `commands/deploy.md` | Deploy MCP plugin servers |
| `/quick-push` | `commands/quick-push.md` | Git add, commit, version bump, push |
| `/save-to-md` | `commands/save-to-md.md` | Save session documentation |
| `/validate-plan` | `commands/validate-plan.md` | Validate implementation plan |

### Homelab commands

| Command | File | Description |
| --- | --- | --- |
| `/homelab:docker-health` | `commands/homelab/docker-health.md` | Docker container health check |
| `/homelab:disk-space` | `commands/homelab/disk-space.md` | Disk space monitoring |
| `/homelab:system-resources` | `commands/homelab/system-resources.md` | System resource usage |
| `/homelab:zfs-health` | `commands/homelab/zfs-health.md` | ZFS pool health check |

### NotebookLM commands

| Command | File | Description |
| --- | --- | --- |
| `/notebooklm:create` | `commands/notebooklm/create.md` | Create a new notebook |
| `/notebooklm:ask` | `commands/notebooklm/ask.md` | Ask questions in a notebook |
| `/notebooklm:source` | `commands/notebooklm/source.md` | Add sources to a notebook |
| `/notebooklm:generate` | `commands/notebooklm/generate.md` | Generate artifacts |
| `/notebooklm:download` | `commands/notebooklm/download.md` | Download notebook artifacts |
| `/notebooklm:list` | `commands/notebooklm/list.md` | List notebooks |
| `/notebooklm:research` | `commands/notebooklm/research.md` | Deep research workflow |

## Scripts

| Script | Path | Purpose |
| --- | --- | --- |
| install.sh | `scripts/install.sh` | Bash-path entry point |
| load-env.sh | `scripts/load-env.sh` | Credential loading library |
| setup-creds.sh | `scripts/setup-creds.sh` | Create `~/.claude-homelab/.env` |
| setup-symlinks.sh | `scripts/setup-symlinks.sh` | Symlink skills/agents/commands to `~/.claude/` |
| verify.sh | `scripts/verify.sh` | Dual-path verification |
| push-github-secrets.sh | `scripts/push-github-secrets.sh` | Push credentials to GitHub Actions |
| standardize-changelog.sh | `scripts/standardize-changelog.sh` | Standardize CHANGELOG format |

## Plugin manifests

| File | Platform |
| --- | --- |
| `.claude-plugin/plugin.json` | Claude Code |
| `.codex-plugin/plugin.json` | Codex |
| `gemini-extension.json` | Gemini |
| `.claude-plugin/marketplace.json` | Marketplace catalog (27 plugins) |

## CI/CD workflows

| Workflow | Trigger | Purpose |
| --- | --- | --- |
| `update-doc-mirrors.yaml` | Weekly (Monday 08:17 UTC) + manual | Refresh mirrored upstream docs |

## Environment variables

See [CONFIG.md](CONFIG.md) for the full reference. Summary: 60+ variables across 15+ services, grouped by category (media, downloads, infrastructure, utilities, research, MCP servers).
