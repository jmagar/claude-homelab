# Configuration Reference -- homelab-core

All credentials are stored in `~/.claude-homelab/.env`. This file is created from `.env.example` during setup.

## Environment file

```bash
cp .env.example ~/.claude-homelab/.env
chmod 600 ~/.claude-homelab/.env
```

## Service credentials

### Media

| Variable | Required | Sensitive | Service |
| --- | --- | --- | --- |
| `PLEX_URL` | yes | no | Plex Media Server base URL |
| `PLEX_TOKEN` | yes | yes | Plex authentication token |
| `RADARR_URL` | yes | no | Radarr base URL |
| `RADARR_API_KEY` | yes | yes | Radarr API key |
| `RADARR_DEFAULT_QUALITY_PROFILE` | no | no | Default quality profile ID (default: 1) |
| `SONARR_URL` | yes | no | Sonarr base URL |
| `SONARR_API_KEY` | yes | yes | Sonarr API key |
| `SONARR_DEFAULT_QUALITY_PROFILE` | no | no | Default quality profile ID (default: 1) |
| `PROWLARR_URL` | yes | no | Prowlarr base URL |
| `PROWLARR_API_KEY` | yes | yes | Prowlarr API key |
| `TAUTULLI_URL` | yes | no | Tautulli base URL |
| `TAUTULLI_API_KEY` | yes | yes | Tautulli API key |
| `OVERSEERR_URL` | yes | no | Overseerr base URL |
| `OVERSEERR_API_KEY` | yes | yes | Overseerr API key |

### Downloads

| Variable | Required | Sensitive | Service |
| --- | --- | --- | --- |
| `SABNZBD_URL` | yes | no | SABnzbd base URL |
| `SABNZBD_API_KEY` | yes | yes | SABnzbd API key |
| `QBITTORRENT_URL` | yes | no | qBittorrent base URL |
| `QBITTORRENT_USERNAME` | yes | yes | qBittorrent username |
| `QBITTORRENT_PASSWORD` | yes | yes | qBittorrent password |

### Infrastructure

| Variable | Required | Sensitive | Service |
| --- | --- | --- | --- |
| `UNRAID_SERVER1_NAME` | yes | no | Unraid server display name |
| `UNRAID_SERVER1_URL` | yes | no | Unraid GraphQL endpoint |
| `UNRAID_SERVER1_API_KEY` | yes | yes | Unraid API key |
| `UNRAID_SERVER2_NAME` | no | no | Second Unraid server name |
| `UNRAID_SERVER2_URL` | no | no | Second Unraid GraphQL endpoint |
| `UNRAID_SERVER2_API_KEY` | no | yes | Second Unraid API key |
| `UNIFI_URL` | yes | no | UniFi Controller URL |
| `UNIFI_USERNAME` | yes | yes | UniFi username |
| `UNIFI_PASSWORD` | yes | yes | UniFi password |
| `UNIFI_SITE` | no | no | UniFi site name (default: `default`) |
| `SWAG_HOST` | yes | no | SWAG container host |
| `SWAG_CONTAINER_NAME` | no | no | SWAG container name (default: `swag`) |
| `SWAG_APPDATA_PATH` | no | no | SWAG config path |
| `SWAG_COMPOSE_PATH` | no | no | SWAG compose path |
| `TAILSCALE_API_KEY` | yes | yes | Tailscale API key |
| `TAILSCALE_TAILNET` | yes | no | Tailscale tailnet name or `-` |
| `ZFS_HOST` | yes | no | ZFS host for remote commands |

### Utilities

| Variable | Required | Sensitive | Service |
| --- | --- | --- | --- |
| `GOTIFY_URL` | yes | no | Gotify base URL |
| `GOTIFY_TOKEN` | yes | yes | Gotify application token |
| `LINKDING_URL` | yes | no | Linkding base URL |
| `LINKDING_API_KEY` | yes | yes | Linkding API key |
| `MEMOS_URL` | yes | no | Memos base URL |
| `MEMOS_API_TOKEN` | yes | yes | Memos API token |
| `BYTESTASH_URL` | yes | no | ByteStash base URL |
| `BYTESTASH_API_KEY` | yes | yes | ByteStash API key |
| `PAPERLESS_URL` | yes | no | Paperless-ngx base URL |
| `PAPERLESS_API_TOKEN` | yes | yes | Paperless-ngx API token |
| `RADICALE_URL` | yes | no | Radicale base URL |
| `RADICALE_USERNAME` | yes | yes | Radicale username |
| `RADICALE_PASSWORD` | yes | yes | Radicale password |

### Research

| Variable | Required | Sensitive | Service |
| --- | --- | --- | --- |
| `NOTEBOOKLM_COOKIE` | yes | yes | NotebookLM session cookie |
| `NOTEBOOKLM_AUTH_JSON` | yes | yes | NotebookLM auth JSON |
| `NOTEBOOKLM_LOG_LEVEL` | no | no | Log level (default: INFO) |

### Developer tools

| Variable | Required | Sensitive | Service |
| --- | --- | --- | --- |
| `GITHUB_TOKEN` | yes | yes | GitHub personal access token |
| `GLANCES_URL` | no | no | Glances monitoring URL |
| `GLANCES_USERNAME` | no | yes | Glances username |
| `GLANCES_PASSWORD` | no | yes | Glances password |

## MCP server credentials

External MCP plugins require additional variables for their servers.

### Common MCP variables

Each MCP plugin follows the pattern `<PREFIX>_MCP_*`:

| Variable pattern | Purpose |
| --- | --- |
| `*_MCP_TOKEN` | Bearer token for MCP HTTP auth |
| `*_MCP_HOST` | Network interface to bind (default: `0.0.0.0`) |
| `*_MCP_PORT` | HTTP server port |
| `*_MCP_TRANSPORT` | Transport mode: `http`, `streamable-http`, or `stdio` |
| `*_MCP_NO_AUTH` | Disable bearer auth (only behind trusted proxy) |

### MCP port assignments

| Plugin | Port | Token variable |
| --- | --- | --- |
| overseerr-mcp | 9151 | `OVERSEERR_MCP_TOKEN` |
| unraid-mcp | 6970 | `UNRAID_MCP_BEARER_TOKEN` |
| unifi-mcp | 8001 | `UNIFI_MCP_TOKEN` |
| gotify-mcp | 9158 | `GOTIFY_MCP_TOKEN` |
| swag-mcp | 8012 | `SWAG_MCP_TOKEN` |
| synapse-mcp | 8014 | `SYNAPSE_MCP_TOKEN` |
| arcane-mcp | 44332 | `ARCANE_MCP_TOKEN` |
| syslog-mcp | 3100 | `SYSLOG_MCP_TOKEN` |
| axon | 8016 | `AXON_MCP_TOKEN` |

### Shared runtime variables

| Variable | Default | Purpose |
| --- | --- | --- |
| `ALLOW_DESTRUCTIVE` | `false` | Skip confirm gate on destructive MCP actions |
| `ALLOW_YOLO` | `false` | Alias for `ALLOW_DESTRUCTIVE` |
| `DOCKER_NETWORK` | (empty) | External Docker network name |
| `LOG_LEVEL` | `info` | Default log level for MCP servers |

## Credential loading library

All scripts load credentials via the shared library:

```bash
source "$HOME/.claude-homelab/load-env.sh"
load_env_file || exit 1
validate_env_vars "SERVICE_URL" "SERVICE_API_KEY"
```

Functions:
- `load_env_file [path]` -- loads `~/.claude-homelab/.env` (or override path)
- `validate_env_vars "VAR1" "VAR2"` -- checks variables exist and are non-empty
- `load_service_credentials "name" "URL_VAR" "KEY_VAR"` -- load and validate in one call

## Checking configuration

```bash
just validate     # Full validation including connectivity
just env-diff     # Compare .env.example with actual .env
just health       # Quick service connectivity check
```
