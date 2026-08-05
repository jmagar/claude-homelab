# Pre-Release Checklist

Complete all items before tagging a release or merging a feature branch.

## Version and metadata

- [ ] All version-bearing files in sync (same version string everywhere):
  - `.claude-plugin/plugin.json`
  - `.codex-plugin/plugin.json` (if present)
  - `gemini-extension.json` (if present)
  - `package.json` (if present)
  - `Cargo.toml` (if present)
  - `pyproject.toml` (if present)
- [ ] `CHANGELOG.md` has an entry for the new version
- [ ] README version badge is correct (if present)
- [ ] Marketplace entry version in `.claude-plugin/marketplace.json` matches (for external plugins)

## Bump type determination

Commit prefix determines bump type:

| Prefix | Bump | Example |
| --- | --- | --- |
| `feat!:` or `BREAKING CHANGE` | major (X+1.0.0) | Removing a skill, changing env var names |
| `feat` or `feat(...)` | minor (X.Y+1.0) | New skill, new command, new MCP tool |
| Everything else | patch (X.Y.Z+1) | Bug fix, docs, refactor, test |

## Configuration

- [ ] `.env.example` documents every environment variable used by skills and scripts
- [ ] `.env.example` contains only placeholder values -- no real secrets
- [ ] `.env` is listed in `.gitignore`
- [ ] `.env` is listed in `.dockerignore` (for MCP server repos)
- [ ] `docs/CONFIG.md` is updated if new env vars were added

## Documentation

- [ ] `CLAUDE.md` is current and matches the repository structure
- [ ] `README.md` has up-to-date skill catalog and marketplace listing
- [ ] New skills have `SKILL.md` with correct frontmatter (`name`, `description`)
- [ ] New skills have reference documentation in `references/`
- [ ] New commands have `.md` definition in `commands/` and `.toml` prompt in `prompts/`
- [ ] Setup instructions work from a clean clone (tested both install paths)

## Security

- [ ] No credentials in code, documentation, or git history
- [ ] `.gitignore` includes `.env`, `*.secret`, `credentials.*`, `*.pem`, `*.key`
- [ ] `.dockerignore` includes `.env`, `.git/`, `.claude-plugin/`, `.omc/`, `.lavra/`, `.beads/`, `.cache/`
- [ ] Scripts use `load-env.sh` for credential loading (not direct env reads)
- [ ] No `ENV` directives with secrets in Dockerfiles
- [ ] No `COPY .env` in Dockerfiles
- [ ] Destructive MCP actions gated behind `confirm=True`
- [ ] `/health` endpoint is unauthenticated; all other MCP endpoints require bearer auth
- [ ] MCP containers run as non-root (UID 1000)

## Skill quality

- [ ] `SKILL.md` has mandatory invocation section with examples
- [ ] Scripts start with `set -euo pipefail`
- [ ] Scripts return JSON output where appropriate
- [ ] Scripts handle errors gracefully with meaningful messages
- [ ] Scripts support `--help` flag
- [ ] Scripts are executable (`chmod +x`)

## Symlinks and discovery

- [ ] `scripts/setup-symlinks.sh` handles the new skill/command/agent
- [ ] Symlinks verified: `scripts/verify.sh` exits 0
- [ ] Plugin manifest includes new components (`.claude-plugin/plugin.json`)
- [ ] Marketplace entry exists for new standalone plugins (`.claude-plugin/marketplace.json`)

## Build and test

- [ ] All scripts execute without errors on a clean environment
- [ ] `scripts/verify.sh` exits 0 with no errors
- [ ] Docker images build successfully (for MCP server repos): `just build`
- [ ] Docker healthcheck passes: `just health` or `curl localhost:<port>/health`
- [ ] CI pipeline passes: lint, typecheck, test
- [ ] Pre-commit hooks configured and passing

## Deployment (MCP server repos)

- [ ] `docker-compose.yml` uses correct image tag and port
- [ ] `entrypoint.sh` is executable and handles env rewriting
- [ ] SWAG/reverse-proxy config tested (if applicable)
- [ ] Server registered in MCP registry (if publishing)
- [ ] DNS verification complete for `tv.nashost/<name>` (if applicable)

## Post-merge

- [ ] Verify plugin installs cleanly: `/plugin marketplace add jmagar/claude-homelab`
- [ ] Verify bash path installs cleanly: run `scripts/install.sh`
- [ ] Run `/homelab-core:health` to confirm service connectivity
- [ ] Tag release if version was bumped
