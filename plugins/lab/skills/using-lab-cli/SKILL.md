---
name: using-lab-cli
description: This skill should be used when the user wants to run lab CLI commands, operate any homelab service through the lab binary (Radarr, Sonarr, UniFi, Unraid, Linkding, Paperless, Gotify, SABnzbd, Qdrant, Prowlarr, Bytestash, Apprise, TEI), manage the lab MCP server (lab serve, lab install, lab uninstall), configure credentials in ~/.lab/.env, scan for credentials with lab extract, check service health with lab doctor, scaffold a new service with lab scaffold, or perform any action dispatch against a homelab service using the action + params pattern.
---

# Using the `lab` CLI

`lab` is a pluggable homelab CLI + MCP server. One binary, 21 services, runtime MCP tool selection.

## Quick Start

```bash
lab help               # Full service + action catalog
lab doctor             # Audit all configured services (health, auth, reachability)
lab health             # Quick reachability check
lab <service> --help   # Per-service subcommands
lab --json <command>   # Machine-readable output for any command
```

## Top-Level Commands

| Command | Purpose |
|---------|---------|
| `lab serve` | Start MCP server (stdio or HTTP transport) |
| `lab doctor` | Full health audit: env vars, reachability, auth, version |
| `lab health` | Quick reachability check for all configured services |
| `lab plugins` | Open plugin manager TUI |
| `lab audit onboarding` | Audit service onboarding against repo contract |
| `lab install <service>` | Install service into `.mcp.json` |
| `lab uninstall <service>` | Remove service from `.mcp.json` |
| `lab init` | First-time setup wizard |
| `lab help` | Service + action catalog |
| `lab scaffold service <name>` | Generate new service onboarding scaffold |
| `lab completions` | Generate shell completions |

## Available Services

For current service status, see [references/service-catalog.md](references/service-catalog.md).

**Active services** (fully implemented): `extract`, `radarr`, `prowlarr`, `sabnzbd`, `linkding`, `bytestash`, `paperless`, `unraid`, `unifi`, `gotify`, `qdrant`, `tei`, `apprise`

**Stub services** (not yet implemented): `sonarr`, `plex`, `tautulli`, `qbittorrent`, `tailscale`, `memos`, `arcane`, `overseerr`, `openai`

If asked to use a stub service, inform the user it is not yet implemented and suggest `lab doctor` to see what is actually configured.

## CLI vs MCP Naming

**CLI subcommands use kebab-case**: `movie-list`, `movie-lookup`, `bookmark-list`

**MCP action strings use `resource.verb` dot notation**: `movie.search`, `movie.add`, `bookmark.list`

They map to the same underlying operations — the surface determines the form.

## Common Patterns

### Querying a service

```bash
lab radarr movie-list
lab radarr movie-lookup --query "The Matrix"
lab radarr calendar-list --json

lab unifi client-list
lab unraid system-status

lab linkding bookmark-list --tag homelab
lab paperless document-search --query invoice
```

### Destructive operations require `--yes`

```bash
lab radarr movie-delete --id 42 --yes
lab sabnzbd queue-purge --yes
lab extract apply --yes          # writes to ~/.lab/.env (backs up first)
```

`extract apply` merges found credentials into `~/.lab/.env`. It backs up the file before writing. Use `--force` to overwrite on key conflicts instead of the default skip-and-warn.

### Multi-instance services

Some services support multiple instances (e.g. multiple Unraid nodes). Select via `--instance`:

```bash
lab unraid system-status --instance node2
```

Instances are configured in `~/.lab/.env` with a label prefix:
```
UNRAID_URL=http://tower.local
UNRAID_NODE2_URL=http://tower2.local
```

### JSON output

```bash
lab radarr movie-list --json | jq '.[].title'
lab doctor --json          # CI-friendly audit
```

## Scaffolding a New Service

When onboarding a new service, always scaffold first and audit second:

```bash
lab scaffold service <name>    # generates module stubs in the correct locations
lab audit onboarding           # checks all services against the repo contract
```

`scaffold` produces the required files (`client.rs`, `types.rs`, `error.rs`, module declaration, CLI shim, MCP dispatch) in the right crate locations. `audit onboarding` verifies the scaffold matches the contract before wiring it into the build.

## Configuration

Config lives in `~/.lab/.env`. For full env-var reference, see [references/config-reference.md](references/config-reference.md).

Each service uses:

```
{SERVICE}_URL=http://...
{SERVICE}_API_KEY=...        # API key auth
{SERVICE}_TOKEN=...          # Bearer token auth
{SERVICE}_USERNAME=...       # Basic auth
{SERVICE}_PASSWORD=...
```

**Bootstrap from existing configs:**

```bash
lab extract scan              # Find credentials in local config files
lab extract scan --ssh user@host  # Scan remote host
lab extract apply --yes       # Write found credentials to ~/.lab/.env
```

## MCP Server Mode

```bash
lab serve                     # stdio (for Claude Desktop, claude.ai)
lab serve --http              # HTTP with bearer auth
lab install radarr            # Add radarr tool to .mcp.json
lab install --all             # Install all available services
```

Each service exposes one MCP tool with `action` + `params` dispatch:

```json
{ "action": "movie.search", "params": { "query": "The Matrix" } }
{ "action": "help" }
{ "action": "schema", "params": { "action": "movie.add" } }
```

## Dev Commands (inside the lab repository)

```bash
just build      # cargo build --workspace --all-features
just test       # cargo nextest run
just lint       # clippy + fmt check
just check      # cargo check --workspace
just run        # cargo run --all-features -- <args>
```

## Troubleshooting

- **Service not found**: set `{SERVICE}_URL` in `~/.lab/.env`, then run `lab doctor`
- **Auth errors**: set `{SERVICE}_API_KEY` or `{SERVICE}_TOKEN` for the service
- **Stub service**: not yet implemented — inform the user and run `lab doctor` to show what is configured
- **All services**: run `lab doctor` for a comprehensive health report; exit code reflects worst severity
