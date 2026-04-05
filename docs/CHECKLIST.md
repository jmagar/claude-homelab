# Plugin Checklist -- homelab-core

Pre-release and quality checklist for the homelab-core plugin.

## Version and metadata

- [ ] All version-bearing files in sync: `.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`, `gemini-extension.json`, `README.md`, `CLAUDE.md`
- [ ] `CHANGELOG.md` has an entry for the new version
- [ ] Run `just version-check` -- no drift detected

## Configuration

- [ ] `.env.example` documents every environment variable used by skills and scripts
- [ ] `.env.example` has no actual secrets -- only placeholders
- [ ] `.env` is in `.gitignore`
- [ ] `~/.claude-homelab/.env` has `chmod 600` permissions

## Documentation

- [ ] `CLAUDE.md` is current and matches repo structure
- [ ] `README.md` has up-to-date skill catalog and architecture docs
- [ ] All 18 skills have `SKILL.md` with correct frontmatter
- [ ] Setup instructions work from a clean clone (`just symlinks`)
- [ ] `docs/` documentation matches current state

## Skills

- [ ] All skills pass validation: `just validate-skills`
- [ ] Each SKILL.md has: frontmatter (name, description), mandatory invocation block, commands section
- [ ] Each skill with scripts uses `load-env.sh` for credentials
- [ ] Reference docs exist in `references/` for skills that need them

## Commands

- [ ] All command `.md` files have frontmatter (description, allowed-tools)
- [ ] Namespaced commands follow directory convention (`commands/homelab/*.md`)
- [ ] Dynamic context injection (`` !`command` ``) works for commands that use it

## Agents

- [ ] Agent frontmatter includes: name, description, tools, memory
- [ ] Agent reads relevant SKILL.md before acting

## Security

- [ ] No credentials in code, docs, or git history
- [ ] `.gitignore` includes `.env`, `*.secret`, credentials files
- [ ] Scripts use `load-env.sh` for credential loading
- [ ] No hardcoded URLs or API keys in any script

## Symlinks

- [ ] `just symlinks` creates all links without errors
- [ ] All 18 skill directories symlinked to `~/.claude/skills/`
- [ ] Agent files symlinked to `~/.claude/agents/`
- [ ] Command files and directories symlinked to `~/.claude/commands/`
- [ ] `load-env.sh` copied to `~/.claude-homelab/`

## Marketplace

- [ ] `.claude-plugin/marketplace.json` lists all 27 plugins
- [ ] External plugins use object source format: `{"source": "github", "repo": "owner/repo"}`
- [ ] Bundled plugins use string source format: `"./skills/<name>"`
- [ ] All categories are valid: core, media, infrastructure, utilities, downloads, dev-tools, research

## Justfile

- [ ] `just validate` passes
- [ ] `just health` reports connectivity for configured services
- [ ] `just lint` passes (shellcheck, ruff, skills-ref)
- [ ] `just version-check` shows no drift

## CI/CD

- [ ] `update-doc-mirrors.yaml` workflow is current
- [ ] GitHub Actions secrets are pushed: `just push-secrets`
