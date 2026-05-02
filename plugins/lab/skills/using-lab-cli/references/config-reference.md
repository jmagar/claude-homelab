# Configuration Reference

Config lives in `~/.lab/.env`. Loaded at startup by `crates/lab/src/config.rs`.

## Env Var Naming Convention

```
{SERVICE}_URL           # base URL (required for service to be active)
{SERVICE}_API_KEY       # API key auth
{SERVICE}_TOKEN         # Bearer token auth
{SERVICE}_USERNAME      # Basic auth username
{SERVICE}_PASSWORD      # Basic auth password
```

`SERVICE` is uppercase: `RADARR`, `LINKDING`, `UNRAID`, etc.

## Multi-Instance Services

Add a label between the service name and the suffix:

```
# Default instance
UNRAID_URL=http://tower.local
UNRAID_API_KEY=...

# Named instance "node2"
UNRAID_NODE2_URL=http://tower2.local
UNRAID_NODE2_API_KEY=...
```

CLI: `lab unraid system-status --instance node2`
MCP: `{ "action": "system.status", "params": { "instance": "node2" } }`

Unknown instance labels return a structured error listing valid labels.

## Per-Service Env Vars

| Service | Required | Optional |
|---------|----------|---------|
| `radarr` | `RADARR_URL`, `RADARR_API_KEY` | — |
| `prowlarr` | `PROWLARR_URL`, `PROWLARR_API_KEY` | — |
| `sabnzbd` | `SABNZBD_URL`, `SABNZBD_API_KEY` | — |
| `linkding` | `LINKDING_URL`, `LINKDING_TOKEN` | — |
| `bytestash` | `BYTESTASH_URL`, `BYTESTASH_TOKEN` | — |
| `paperless` | `PAPERLESS_URL`, `PAPERLESS_TOKEN` | — |
| `unraid` | `UNRAID_URL`, `UNRAID_API_KEY` | multi-instance labels |
| `unifi` | `UNIFI_URL`, `UNIFI_USERNAME`, `UNIFI_PASSWORD` | — |
| `gotify` | `GOTIFY_URL`, `GOTIFY_TOKEN` | — |
| `qdrant` | `QDRANT_URL` | `QDRANT_API_KEY` |
| `tei` | `TEI_URL` | — |
| `apprise` | `APPRISE_URL` | — |

## Logging

```
LAB_LOG=lab=info,lab_apis=warn    # tracing filter directive (default)
LAB_LOG_FORMAT=json               # emit newline-delimited JSON (for prod/CI)
```

## extract.apply Behavior

`lab extract apply --yes` writes credentials to `~/.lab/.env`:

- Backs up the file before writing
- Deduplicates by key, preserves order and comments
- Default conflict policy: skip-and-warn (existing keys are not overwritten)
- `--force`: overwrite existing keys on conflict
- Write is atomic (temp file + rename)
