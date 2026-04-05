# Repository Structure -- homelab-core

## Directory tree

```
claude-homelab/
├── .claude-plugin/
│   ├── plugin.json              # Claude Code plugin manifest
│   └── marketplace.json         # Marketplace catalog (27 plugins)
├── .codex-plugin/
│   └── plugin.json              # Codex plugin manifest
├── .github/
│   └── workflows/
│       └── update-doc-mirrors.yaml
├── agents/
│   └── notebooklm-specialist.md # NotebookLM research agent
├── commands/
│   ├── check.md                 # /check
│   ├── deploy.md                # /deploy
│   ├── quick-push.md            # /quick-push
│   ├── save-to-md.md            # /save-to-md
│   ├── validate-plan.md         # /validate-plan
│   ├── homelab/                 # /homelab:* commands
│   │   ├── disk-space.md
│   │   ├── docker-health.md
│   │   ├── system-resources.md
│   │   └── zfs-health.md
│   └── notebooklm/             # /notebooklm:* commands
│       ├── ask.md
│       ├── create.md
│       ├── download.md
│       ├── generate.md
│       ├── list.md
│       ├── research.md
│       └── source.md
├── docs/                        # This documentation
│   ├── plugin/
│   ├── repo/
│   ├── stack/
│   ├── references/
│   └── sessions/
├── hooks/                       # Placeholder (.gitkeep)
├── output-styles/               # Placeholder (.gitkeep)
├── scripts/
│   ├── install.sh               # Bash-path entry point
│   ├── load-env.sh              # Credential loading library
│   ├── setup-creds.sh           # Create ~/.claude-homelab/.env
│   ├── setup-symlinks.sh        # Symlink skills/agents/commands
│   ├── verify.sh                # Dual-path verification
│   ├── push-github-secrets.sh   # Push secrets to GitHub Actions
│   └── standardize-changelog.sh # Standardize CHANGELOG format
├── skills/                      # All 18 service skills
│   ├── CLAUDE.md                # Skill development guidelines
│   ├── homelab-setup/
│   ├── homelab-health/
│   ├── plex/
│   ├── radarr/
│   ├── sonarr/
│   ├── prowlarr/
│   ├── tautulli/
│   ├── sabnzbd/
│   ├── qbittorrent/
│   ├── tailscale/
│   ├── zfs/
│   ├── linkding/
│   ├── memos/
│   ├── bytestash/
│   ├── paperless-ngx/
│   ├── radicale/
│   ├── notebooklm/
│   └── gh-address-comments/
├── .env.example                 # Credential template (60+ vars)
├── .gitignore
├── CHANGELOG.md
├── CLAUDE.md                    # Main project instructions
├── AGENTS.md -> CLAUDE.md       # Symlink for Codex discovery
├── GEMINI.md -> CLAUDE.md       # Symlink for Gemini discovery
├── gemini-extension.json        # Gemini extension manifest
├── Justfile                     # Task runner (30+ recipes)
├── LICENSE                      # MIT
├── README.md                    # User-facing documentation
└── SECURITY.md
```

## Root files

| File | Required | Purpose |
| --- | --- | --- |
| `CLAUDE.md` | yes | Project instructions for Claude Code sessions |
| `README.md` | yes | User-facing overview, install, architecture |
| `CHANGELOG.md` | yes | Version history with entries for every bump |
| `.env.example` | yes | Template for credentials (60+ variables, no secrets) |
| `Justfile` | yes | Task runner with 30+ recipes |
| `gemini-extension.json` | yes | Gemini extension manifest |
| `LICENSE` | yes | MIT license |
| `SECURITY.md` | yes | Security policy |
| `AGENTS.md` | symlink | Symlink to CLAUDE.md (Codex discovery) |
| `GEMINI.md` | symlink | Symlink to CLAUDE.md (Gemini discovery) |

## Symlink architecture

### CLAUDE.md mirrors

Every directory with a `CLAUDE.md` also has `AGENTS.md` and `GEMINI.md` symlinks pointing to it. This enables discovery by Codex and Gemini. Managed by `just link-claude-md`.

### Bash-path symlinks (to ~/.claude/)

For bash-path installs, the repo symlinks into `~/.claude/` for Claude Code discovery:

```
~/.claude/
├── agents/
│   └── notebooklm-specialist.md  ->  ~/claude-homelab/agents/notebooklm-specialist.md
├── skills/
│   ├── plex/                     ->  ~/claude-homelab/skills/plex/
│   ├── radarr/                   ->  ~/claude-homelab/skills/radarr/
│   └── ...                          (all 18 skill directories)
└── commands/
    ├── check.md                  ->  ~/claude-homelab/commands/check.md
    ├── deploy.md                 ->  ~/claude-homelab/commands/deploy.md
    ├── homelab/                  ->  ~/claude-homelab/commands/homelab/
    └── notebooklm/               ->  ~/claude-homelab/commands/notebooklm/
```

### Credential installation

```
~/.claude-homelab/
├── .env                          # Credentials (chmod 600, never committed)
└── load-env.sh                   # Copied from scripts/load-env.sh
```

### Managing symlinks

```bash
just symlinks        # Create all symlinks + install load-env.sh + create .env
just link-claude-md  # Refresh AGENTS.md/GEMINI.md symlinks
```

## Plugin manifests

| File | Platform | Key fields |
| --- | --- | --- |
| `.claude-plugin/plugin.json` | Claude Code | name, version, description, author |
| `.claude-plugin/marketplace.json` | Marketplace | 27 plugin entries |
| `.codex-plugin/plugin.json` | Codex | name, version, interface block |
| `gemini-extension.json` | Gemini | name, version, settings array (32 env vars) |

## Source of truth

This repository (`~/claude-homelab`) is the single source of truth for all homelab agents, skills, and commands. Never edit files directly in `~/.claude/` -- always edit in this repo.

## Cross-references

- [RECIPES.md](RECIPES.md) -- Justfile recipes
- [SCRIPTS.md](SCRIPTS.md) -- Scripts reference
- [RULES.md](RULES.md) -- Git workflow and code standards
