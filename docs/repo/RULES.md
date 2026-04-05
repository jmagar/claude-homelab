# Coding Rules -- homelab-core

Standards and conventions enforced across the homelab ecosystem.

## Git workflow

### Conventional commits

All commit messages follow [Conventional Commits](https://www.conventionalcommits.org/):

| Prefix | Purpose | Example |
| --- | --- | --- |
| `feat:` | New feature | `feat(radicale): add CalDAV/CardDAV skill` |
| `fix:` | Bug fix | `fix(plex): correct authentication headers` |
| `chore:` | Maintenance | `chore: update dependencies` |
| `refactor:` | Code restructure | `refactor(lib): improve load-env error handling` |
| `test:` | Tests | `test: add integration tests` |
| `docs:` | Documentation | `docs(readme): update skill catalog` |
| `ci:` | CI/CD changes | `ci: add Docker build workflow` |

### Branch strategy

- `main` is production-ready at all times
- Feature branches for development
- PR required before merge to `main`

### Never commit

- `.env` files or any file containing credentials
- API keys, tokens, or passwords
- Large binary files
- Temporary or debug files

## Version bumping

### Bump type rules

| Commit prefix | Bump | Example |
| --- | --- | --- |
| `feat!:` or `BREAKING CHANGE` | Major | `1.2.3` -> `2.0.0` |
| `feat:` or `feat(...):` | Minor | `1.2.3` -> `1.3.0` |
| Everything else | Patch | `1.2.3` -> `1.2.4` |

### Version-bearing files

All files must have the same version. Never bump only one:

| File | Field |
| --- | --- |
| `.claude-plugin/plugin.json` | `"version": "X.Y.Z"` |
| `.codex-plugin/plugin.json` | `"version": "X.Y.Z"` |
| `gemini-extension.json` | `"version": "X.Y.Z"` |
| `README.md` | `Version: X.Y.Z` |
| `CLAUDE.md` | `**Version:** X.Y.Z` |
| `CHANGELOG.md` | New entry under `## [X.Y.Z]` |

### Automation

```bash
just version-sync 1.5.0    # Update all files
just version-check          # Verify sync
```

The `/quick-push` command automates version bumping, CHANGELOG updates, and pushing.

## Code standards

### Bash

```bash
#!/bin/bash
set -euo pipefail          # Strict mode
"$variable"                # Always quote variables
```

- Use functions for reusable code
- `chmod +x` for executable scripts
- Return JSON where appropriate
- Support `--help` flag

### Python

- Type hints on all function signatures
- Google-style docstrings
- f-strings for formatting
- `async`/`await` for I/O operations
- PEP 8 via `ruff format`
- Type checking via `ty`

### Node.js

- ESM modules (`.mjs` extension, `import` syntax)
- No `any` types in TypeScript
- Strict mode enabled
- `async`/`await` for I/O

## Documentation requirements

### Every skill requires

1. `SKILL.md` -- Claude-facing skill definition
2. Reference documentation in `references/` (as appropriate)
3. Environment variables documented in `.env.example`

### SKILL.md structure

- Frontmatter: `name`, `description`, optional `homepage`
- Mandatory invocation block: when to activate
- Commands section: available operations
- Workflows section: multi-step procedures

### Progressive disclosure

- SKILL.md: ~2,000 words (core syntax and workflows)
- References: unlimited (detailed documentation)
- Examples: complete, runnable code

## Security rules

See [GUARDRAILS.md](../GUARDRAILS.md) for the full reference. Key rules:

- Credentials in `.env` only, never in code
- `.env` has `chmod 600` permissions
- All scripts use `load-env.sh` for credentials
- No hardcoded URLs or API keys

## Cross-references

- [GUARDRAILS.md](../GUARDRAILS.md) -- Full security reference
- [RECIPES.md](RECIPES.md) -- Justfile recipes that enforce standards
- [SCRIPTS.md](SCRIPTS.md) -- Script conventions
