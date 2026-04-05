# Prerequisites -- homelab-core

Required tools and versions before developing or deploying.

## Required tools

| Tool | Version | Install | Purpose |
| --- | --- | --- | --- |
| Git | 2.40+ | System package manager | Version control |
| Bash | 4+ | System (Linux ships this) | Script execution |
| just | latest | `cargo install just` | Task runner |
| curl | any | System package manager | HTTP requests and health checks |
| jq | 1.6+ | System package manager | JSON parsing |
| openssl | any | System package manager | Token generation and TLS inspection |

### Verify

```bash
git --version        # git version 2.40+
bash --version       # GNU bash 4+
just --version       # just X.Y.Z
curl --version       # curl X.Y.Z
jq --version         # jq-1.6+
openssl version      # OpenSSL X.Y.Z
```

## For MCP plugin deployment

| Tool | Version | Install | Purpose |
| --- | --- | --- | --- |
| Docker | 24+ | [docs.docker.com](https://docs.docker.com/get-docker/) | Container builds |
| Docker Compose | v2+ | Bundled with Docker | Service orchestration |

### Verify

```bash
docker --version           # Docker version 24+
docker compose version     # Docker Compose version v2+
```

## For skill validation

| Tool | Version | Install | Purpose |
| --- | --- | --- | --- |
| Node.js | 18+ | [nodejs.org](https://nodejs.org/) | `npx skills-ref validate` |

### Verify

```bash
node --version       # v18+
npx skills-ref --version
```

## For linting

| Tool | Version | Install | Purpose |
| --- | --- | --- | --- |
| shellcheck | latest | System package manager | Shell script linting |
| ruff | latest | `uv tool install ruff` | Python lint + format |
| ty | latest | `uv tool install ty` | Python type checking |

### Verify

```bash
shellcheck --version
ruff --version
ty --version
```

## Optional tools

| Tool | Purpose | Install |
| --- | --- | --- |
| `gh` | GitHub CLI for PRs and secrets | [cli.github.com](https://cli.github.com/) |
| `ss` | Socket statistics (port checks) | System (iproute2) |
| `bc` | Calculator (resource display) | System package manager |

## Platform

homelab-core targets **Linux only**. No macOS compatibility shims are needed. Bash 4+ features (associative arrays, `mapfile`, etc.) are used throughout.

## Quick start

```bash
git clone https://github.com/jmagar/claude-homelab.git ~/claude-homelab
cd ~/claude-homelab
just symlinks        # Setup all symlinks and credentials
just validate        # Verify everything works
```

## Cross-references

- [SETUP.md](../SETUP.md) -- Step-by-step setup guide
- [TECH.md](TECH.md) -- Technology stack details
- [RECIPES.md](../repo/RECIPES.md) -- Justfile recipes
