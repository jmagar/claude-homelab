# Justfile Recipes -- homelab-core

The Justfile contains 30+ recipes organized by category. Run `just --list` to see all available recipes.

## Validation

| Recipe | Command | Purpose |
| --- | --- | --- |
| `validate` | `just validate` | Comprehensive validation: env, versions, plugins, connectivity, MCP servers, MCP config |
| `version-check` | `just version-check` | Check all version-bearing files for drift |
| `version-sync` | `just version-sync 1.5.0` | Sync all files to a given version |
| `validate-skills` | `just validate-skills` | Validate all skills across all marketplace plugins |
| `validate-skill` | `just validate-skill plex` | Validate a single skill (local or external) |

## Plugin catalog

| Recipe | Command | Purpose |
| --- | --- | --- |
| `plugins` | `just plugins` | List all 27 marketplace plugins with repo and local path |

## Testing

| Recipe | Command | Purpose |
| --- | --- | --- |
| `test` | `just test` | Run all tests (unit + live) |
| `test-unit` | `just test-unit [name]` | Unit tests (pytest, vitest, cargo test) |
| `test-live` | `just test-live [name]` | Live/smoke integration tests |

## MCP security

| Recipe | Command | Purpose |
| --- | --- | --- |
| `mcp-security` | `just mcp-security` | Full security audit: TLS, auth probes, OAuth, certs |
| `push-secrets` | `just push-secrets [repo]` | Push .env secrets to GitHub Actions |

## Docker Compose operations

| Recipe | Command | Purpose |
| --- | --- | --- |
| `up` | `just up [name]` | `docker compose up -d` for a plugin or all |
| `down` | `just down [name]` | `docker compose down` for a plugin or all |
| `build` | `just build [name]` | `docker compose build` for a plugin or all |
| `restart` | `just restart [name]` | `docker compose restart` for a plugin or all |
| `compose-status` | `just compose-status` | Show compose status for all external plugins |
| `deploy` | `just deploy <name>` | Build + up in one shot |
| `update` | `just update [name]` | Git pull + rebuild + restart |

## MCP server logs

| Recipe | Command | Purpose |
| --- | --- | --- |
| `mcp-servers` | `just mcp-servers` | List running MCP servers (Docker + local processes) |
| `mcp-logs` | `just mcp-logs <name> [lines]` | Show logs for a specific MCP server |
| `mcp-logs-all` | `just mcp-logs-all [lines]` | Show logs for all running MCP servers |

## Symlinks

| Recipe | Command | Purpose |
| --- | --- | --- |
| `link-claude-md` | `just link-claude-md` | Ensure AGENTS.md/GEMINI.md symlink to CLAUDE.md |
| `symlinks` | `just symlinks` | Full symlink setup (skills, agents, commands, load-env) |

## Development workflow

| Recipe | Command | Purpose |
| --- | --- | --- |
| `git-status` | `just git-status` | Git status across all workspace repos |

## Operations

| Recipe | Command | Purpose |
| --- | --- | --- |
| `health` | `just health` | Quick connectivity check for all configured services + MCP |
| `certs` | `just certs` | TLS certificate expiry dashboard |
| `outdated` | `just outdated` | Check for outdated dependencies across external repos |

## Hygiene

| Recipe | Command | Purpose |
| --- | --- | --- |
| `lint` | `just lint` | Full lint: external repos, Python (ruff+ty), shell (shellcheck), skills, PR comments, monoliths |
| `monoliths` | `just monoliths [threshold]` | Find code files over a line threshold (default: 500) |
| `env-diff` | `just env-diff` | Compare .env.example with actual .env |

## Observability

| Recipe | Command | Purpose |
| --- | --- | --- |
| `status` | `just status` | One-screen dashboard: versions + compose + health + MCP |
| `ports` | `just ports` | List all host:port bindings for MCP containers |
| `resources` | `just resources` | Show CPU/memory usage for MCP containers |

## Recipe arguments

Many recipes accept a `name` argument:
- `"all"` (default) -- operate on all external plugins
- A plugin name (e.g., `synapse-mcp`) -- operate on that plugin only

```bash
just up                    # Start all MCP plugins
just up synapse-mcp        # Start only synapse-mcp
just build arcane-mcp      # Build only arcane-mcp
just test-unit overseerr-mcp  # Unit tests for overseerr-mcp only
```

## Validation detail

The `validate` recipe performs 6 check categories:

1. **Environment** -- .env exists, permissions, variable count
2. **Versions** -- all version-bearing files in sync
3. **Installed Plugins** -- env vars set for each installed marketplace plugin
4. **Connectivity** -- curl check against each service URL
5. **MCP Servers** -- Docker + local process detection
6. **MCP Config** -- Claude settings.json, .mcp.json files, Codex/Gemini manifests

## Lint detail

The `lint` recipe runs 6 check categories:

1. **External Plugins** -- `lint-plugin.sh` in each external repo
2. **Python** -- ruff lint, ruff format, ty type check
3. **Shell** -- shellcheck on all `.sh` files
4. **Skills** -- `npx skills-ref validate` on all skill directories
5. **PR Review Comments** -- unresolved threads in open PRs
6. **Monolith Detector** -- files over 500 LOC

## Cross-references

- [SCRIPTS.md](SCRIPTS.md) -- Scripts called by recipes
- [RULES.md](RULES.md) -- Conventions that recipes enforce
