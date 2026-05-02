# SWAG MCP

<!-- mcp-name: tv.tootie/swag-mcp -->

[![PyPI](https://img.shields.io/pypi/v/swag-mcp)](https://pypi.org/project/swag-mcp/) [![ghcr.io](https://img.shields.io/badge/ghcr.io-jmagar%2Fswag--mcp-blue?logo=docker)](https://github.com/jmagar/swag-mcp/pkgs/container/swag-mcp)

MCP server for managing SWAG reverse-proxy configuration files, backups, logs, and health checks. Uses a single `swag` action router backed by local filesystem or SSH-accessible SWAG config storage.

## Overview

SWAG MCP generates and manages nginx subdomain proxy configurations for [SWAG (Secure Web Application Gateway)](https://github.com/linuxserver/docker-swag). Every generated config includes MCP-compatible security headers unconditionally, making configs suitable for both standard web services and MCP/AI services.

## What this repository ships

- `swag_mcp/`: server, config, middleware, models, services, tools, and templates
- `config/`: local config and test assets
- `docs/`: template notes, test commands, and design records
- `.claude-plugin/`, `.codex-plugin/`, `gemini-extension.json`: client manifests
- `docker-compose.yaml`, `Dockerfile`, `entrypoint.sh`: container deployment

## MCP surface

### Tool

| Tool | Purpose |
| --- | --- |
| `swag` | Unified action router for config, logs, backups, and health checks |

### Actions

| Action | Purpose | Required params |
| --- | --- | --- |
| `list` | List config files | none |
| `create` | Create a new reverse-proxy config | `config_name`, `server_name`, `upstream_app`, `upstream_port` |
| `view` | View config contents | `config_name` |
| `edit` | Replace config contents | `config_name`, `new_content` |
| `update` | Update a specific field | `config_name`, `update_field`, `update_value` |
| `remove` | Remove a config | `config_name` |
| `logs` | Read SWAG logs | none |
| `backups` | List or clean up backup files | `backup_action` |
| `health_check` | Probe a service endpoint | `domain` |

### Resources

| URI | Type | Description |
| --- | --- | --- |
| `swag://` | Directory | All active `.conf` files (excluding `.sample`) |
| `swag://configs/live` | Stream | Real-time config change events |
| `swag://health/stream` | Stream | Real-time health status for monitored services |
| `swag://logs/stream` | Stream | Live nginx error log tail |

## Installation

### Plugin (recommended)

Install as a Claude Code plugin. You will be prompted for:

- **SWAG Proxy Configs Path** -- local path to proxy-confs directory
- **SWAG Proxy Configs URI** -- SSH URI for remote access (key-auth only)

One of the two is required.

```bash
/plugin marketplace add jmagar/claude-homelab
/plugin install swag-mcp @jmagar-claude-homelab
```

The plugin uses stdio transport by default. A `swag-mcp-remote` entry is also available in `.mcp.json` for users who run swag-mcp as a remote Docker service.

### Docker Compose

```bash
cp .env.example .env
chmod 600 .env
# Edit .env with your paths and token
docker compose up -d
```

The container always runs on internal port 8000. Set `SWAG_MCP_PORT` to control the host port.

### Local development

```bash
just setup       # copies .env.example and runs uv sync
just dev         # starts the server
```

## Configuration

Two deployment paths are supported:

| Path | Transport | Credentials | Auth |
|------|-----------|-------------|------|
| **Plugin (stdio)** | stdio | `userConfig` in plugin settings | None |
| **Plugin (mcp-remote)** | HTTP gateway | Manual config | Bearer token |
| **Docker (HTTP)** | http | `.env` file | Bearer token |

See [docs/CONFIG.md](docs/CONFIG.md) for full variable reference. All variables use the `SWAG_MCP_` prefix.

### Core

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_PROXY_CONFS_PATH` | no | `/swag/nginx/proxy-confs` | Local path to SWAG proxy confs directory |
| `SWAG_MCP_PROXY_CONFS_URI` | no | `` | Overrides `PROXY_CONFS_PATH` when set. Accepts a local path or SSH URI. |
| `SWAG_MCP_SWAG_LOG_BASE_PATH` | no | `/swag/log` | Base path for SWAG log files (local or remote) |
| `SWAG_MCP_TEMPLATE_PATH` | no | `templates` | Path to Jinja2 templates directory |

### Server

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_HOST` | no | `127.0.0.1` | Bind address for the MCP server |
| `SWAG_MCP_PORT` | no | `8000` | Host-side port (Docker only; container always uses 8000) |
| `SWAG_MCP_TOKEN` | no | `` | Bearer token. Note: the server itself does not enforce it — secure at the proxy/network layer |
| `SWAG_MCP_NO_AUTH` | no | `false` | Set `true` to suppress the "no token" warning |

### Defaults

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_DEFAULT_AUTH_METHOD` | no | `authelia` | Auth method used when `create` omits `auth_method` |
| `SWAG_MCP_DEFAULT_QUIC_ENABLED` | no | `false` | QUIC default for new configs |

### Backups

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_BACKUP_RETENTION_DAYS` | no | `30` | Days to keep backup files. Cleanup runs at startup and on `backups action=cleanup`. |

### Logging

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_LOG_LEVEL` | no | `INFO` | `DEBUG` / `INFO` / `WARNING` / `ERROR` / `CRITICAL` |
| `SWAG_MCP_LOG_DIRECTORY` | no | `/app/.swag-mcp/logs` | Directory for rotating log files |
| `SWAG_MCP_LOG_FILE_ENABLED` | no | `true` | Write logs to files in addition to stdout |
| `SWAG_MCP_LOG_FILE_MAX_BYTES` | no | `10485760` | Max log file size before rotation (10 MB) |
| `SWAG_MCP_ENABLE_STRUCTURED_LOGGING` | no | `false` | Emit JSON structured logs |
| `SWAG_MCP_LOG_PAYLOADS` | no | `false` | Include request/response bodies in logs |
| `SWAG_MCP_LOG_PAYLOAD_MAX_LENGTH` | no | `1000` | Max payload length when `LOG_PAYLOADS=true` |

### Performance

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_SLOW_OPERATION_THRESHOLD_MS` | no | `1000` | Log a warning when any operation exceeds this threshold |
| `SWAG_MCP_ENABLE_RETRY_MIDDLEWARE` | no | `true` | Automatically retry failed operations |
| `SWAG_MCP_MAX_RETRIES` | no | `3` | Max retry attempts |

### Health checks

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_HEALTH_CHECK_INSECURE` | no | `false` | Skip SSL verification for health probes. Not recommended for production. |

### Rate limiting

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `SWAG_MCP_RATE_LIMIT_ENABLED` | no | `false` | Enable the rate-limiting middleware |
| `SWAG_MCP_RATE_LIMIT_RPS` | no | `10.0` | Sustained requests per second |
| `SWAG_MCP_RATE_LIMIT_BURST` | no | `20` | Burst capacity above the RPS limit |

## Authentication methods

Pass `auth_method` to `create` to control which SWAG auth snippet the config includes. The default is set by `SWAG_MCP_DEFAULT_AUTH_METHOD`.

| Method | When to use |
| --- | --- |
| `none` | Public services, or services behind an external SSO not managed by SWAG |
| `basic` | Simple HTTP basic auth. Credentials managed by SWAG. |
| `ldap` | LDAP/Active Directory authentication via SWAG's built-in LDAP support |
| `authelia` | Self-hosted SSO with 2FA. Most common for homelab services. |
| `authentik` | Self-hosted identity provider with rich policy engine |
| `tinyauth` | Lightweight single-user auth for internal tools |
| `oauth` | OAuth 2.1 gateway (`mcp-oauth`). Use for MCP/AI services that handle their own auth flow. |

`none` exposes the service without authentication. Only use it if access is restricted at the network or proxy layer.

## Template system

All configs are generated from a single Jinja2 template: `templates/mcp.subdomain.conf.j2`. Only subdomain-style configs are supported (`service.domain.tld`).

### Template variables

| Variable | Type | Required | Description |
| --- | --- | --- | --- |
| `service_name` | string | yes | Derived from `config_name` (e.g., `jellyfin`) |
| `server_name` | string | yes | Domain name (e.g., `media.example.com`) |
| `upstream_app` | string | yes | Container name or IP for the main service |
| `upstream_port` | integer | yes | Port the main service listens on |
| `upstream_proto` | string | yes | `http` or `https` |
| `mcp_upstream_app` | string | no | Container name or IP for the MCP endpoint. Defaults to `upstream_app`. |
| `mcp_upstream_port` | integer | no | Port for the MCP endpoint. Defaults to `upstream_port`. |
| `mcp_upstream_proto` | string | no | Protocol for the MCP endpoint. Defaults to `upstream_proto`. |
| `auth_method` | string | yes | One of the auth methods listed above |
| `enable_quic` | boolean | yes | Add `listen 443 quic` listeners and `Alt-Svc` header |

### MCP security headers

These headers are included unconditionally in every generated config, regardless of auth method:

| Header | Value | Purpose |
| --- | --- | --- |
| `X-MCP-Version` | `2025-11-25` | Advertises the MCP protocol version |
| `Referrer-Policy` | `strict-origin-when-cross-origin` | Limits referrer leakage |

DNS rebinding protection is also applied unconditionally. The `origin_valid` variable is set to `1` only for empty origins, `https://$server_name`, localhost variants, and `*.anthropic.com` / `*.claude.ai` origins. Requests to `/mcp` with an invalid origin receive a `403` JSON error.

## Split routing

Split routing sends the main application traffic to one upstream and MCP traffic to a different upstream. Use it when your MCP/AI service runs on a separate container or host (e.g., a GPU server).

Without split routing, both `/` and `/mcp` proxy to the same `upstream_app:upstream_port`.

With split routing:
- `/` and `/health` → `upstream_app:upstream_port`
- `/mcp` and `/session` → `mcp_upstream_app:mcp_upstream_port`

### Example: Jellyfin with a separate AI backend

```
action=create
config_name=jellyfin.subdomain.conf
server_name=jellyfin.example.com
upstream_app=jellyfin
upstream_port=8096
upstream_proto=http
mcp_upstream_app=ai-gpu-server
mcp_upstream_port=8080
mcp_upstream_proto=http
auth_method=authelia
```

This generates:
- `location /` → `http://jellyfin:8096` (protected by Authelia)
- `location /mcp` → `http://ai-gpu-server:8080` (protected by OAuth verify)
- `location /health` → `http://jellyfin:8096` (no auth, for health probes)

If `mcp_upstream_app` is omitted, all three locations proxy to `jellyfin:8096`.

## SSH / remote configuration

Set `SWAG_MCP_PROXY_CONFS_URI` to manage configs on a remote SWAG host over SSH.

Supported URI formats:

```
# Default key, default port 22
SWAG_MCP_PROXY_CONFS_URI=swag-server:/mnt/appdata/swag/nginx/proxy-confs

# Explicit user
SWAG_MCP_PROXY_CONFS_URI=admin@swag-server:/mnt/appdata/swag/nginx/proxy-confs

# Explicit user and port
SWAG_MCP_PROXY_CONFS_URI=admin@swag-server:2222:/mnt/appdata/swag/nginx/proxy-confs
```

Requirements:
- SSH key-based (passwordless) access to the remote host
- Mount `~/.ssh` into the container (see `docker-compose.yaml`)
- `SWAG_MCP_SWAG_LOG_BASE_PATH` should point to the log base path on the same remote host

When `SWAG_MCP_PROXY_CONFS_URI` is set it takes precedence over `SWAG_MCP_PROXY_CONFS_PATH`.

## Usage examples

### List

```
swag action=list
swag action=list list_filter=active
swag action=list list_filter=samples query=plex offset=0 limit=20
```

`list_filter` accepts `all` (default), `active` (`.conf` files only), or `samples` (`.conf.sample` files only).

### Create

```
swag action=create
     config_name=jellyfin.subdomain.conf
     server_name=jellyfin.example.com
     upstream_app=jellyfin
     upstream_port=8096
```

After creation, a health check runs automatically against `server_name`.

### View

```
swag action=view config_name=jellyfin.subdomain.conf
```

### Edit

Replaces the full file content:

```
swag action=edit
     config_name=jellyfin.subdomain.conf
     new_content="..."
     create_backup=true
```

### Update

Updates a single field in place:

```
swag action=update config_name=jellyfin.subdomain.conf update_field=port update_value=8097
swag action=update config_name=jellyfin.subdomain.conf update_field=upstream update_value=jellyfin-new
swag action=update config_name=jellyfin.subdomain.conf update_field=app update_value=jellyfin:8097
swag action=update config_name=jellyfin.subdomain.conf update_field=add_mcp update_value=/mcp
```

`update_field` options:

| Value | `update_value` format | Effect |
| --- | --- | --- |
| `port` | port number | Updates `upstream_port` |
| `upstream` | container name | Updates `upstream_app` |
| `app` | `app:port` | Updates both `upstream_app` and `upstream_port` |
| `add_mcp` | path (e.g., `/mcp`) | Injects an MCP location block into the config |

After an update, a health check runs automatically.

### Remove

```
swag action=remove config_name=jellyfin.subdomain.conf
swag action=remove config_name=jellyfin.subdomain.conf create_backup=false
```

### Logs

```
swag action=logs log_type=nginx-error lines=100
swag action=logs log_type=nginx-access lines=50
swag action=logs log_type=fail2ban lines=200
```

#### Log types and format

| `log_type` | Source file | Format |
| --- | --- | --- |
| `nginx-access` | `$SWAG_LOG_BASE_PATH/nginx/access.log` | Combined nginx access log: IP, timestamp, method, path, status, bytes, referrer, user-agent |
| `nginx-error` | `$SWAG_LOG_BASE_PATH/nginx/error.log` | Nginx error format: timestamp, level, PID, message |
| `fail2ban` | `$SWAG_LOG_BASE_PATH/fail2ban/fail2ban.log` | fail2ban log: timestamp, level, jail name, action, IP |
| `letsencrypt` | `$SWAG_LOG_BASE_PATH/letsencrypt/letsencrypt.log` | Certbot output: certificate request, renewal, errors |
| `renewal` | `$SWAG_LOG_BASE_PATH/letsencrypt/renewal.log` | Periodic renewal cron output |

`lines` accepts 1–1000 (default 50).

### Backups

```
swag action=backups backup_action=list
swag action=backups backup_action=cleanup retention_days=7
swag action=backups backup_action=cleanup retention_days=0
```

`backup_action=cleanup` removes backup files older than `retention_days`. Pass `retention_days=0` to use the server default (`SWAG_MCP_BACKUP_RETENTION_DAYS`).

Backup files are named `<original>.backup.<timestamp>`. They are created automatically before any `edit`, `update`, or `remove` operation when `create_backup=true` (the default).

Cleanup also runs at server startup. The startup cleanup uses `SWAG_MCP_BACKUP_RETENTION_DAYS`.

### Health check

```
swag action=health_check domain=jellyfin.example.com
swag action=health_check domain=jellyfin.example.com timeout=10 follow_redirects=false
```

#### Response fields

| Field | Type | Description |
| --- | --- | --- |
| `success` | boolean | `true` if the probe reached the service. 2xx is always success; 406 on `/mcp` is treated as success (MCP endpoint exists but requires POST); any non-404 response is also treated as success. |
| `domain` | string | Domain that was checked |
| `status_code` | integer or null | HTTP status code returned |
| `response_time_ms` | integer or null | Round-trip time in milliseconds |
| `error` | string or null | Error message if the probe failed |

`timeout` accepts 1–300 seconds (default 30). The server adds a 10-second buffer on top of `timeout` for its own wait.

SSL certificate verification can be disabled globally with `SWAG_MCP_HEALTH_CHECK_INSECURE=true`.

## Development commands

```bash
just setup        # copy .env.example and install dependencies
just dev          # start the server with uv
just lint         # ruff check
just fmt          # ruff format
just typecheck    # ty check
just test         # pytest
just build        # docker build
just up           # docker compose up -d
just down         # docker compose down
just logs         # docker compose logs -f
just health       # curl http://localhost:8082/health | jq
just gen-token    # generate a random bearer token
```

## Verification

```bash
just lint
just typecheck
just test
```

Check the server health endpoint:

```bash
just health
# {"status": "healthy", "service": "swag-mcp", "version": "1.0.1"}
```

The `/health` endpoint is also used by the Docker `HEALTHCHECK` directive. It always returns:

| Field | Value |
| --- | --- |
| `status` | `"healthy"` |
| `service` | `"swag-mcp"` |
| `version` | Package version from `importlib.metadata` |

## Related plugins

| Plugin | Category | Description |
|--------|----------|-------------|
| [homelab-core](https://github.com/jmagar/claude-homelab) | core | Core agents, commands, skills, and setup/health workflows for homelab management. |
| [overseerr-mcp](https://github.com/jmagar/overseerr-mcp) | media | Search movies and TV shows, submit requests, and monitor failed requests via Overseerr. |
| [unraid-mcp](https://github.com/jmagar/unraid-mcp) | infrastructure | Query, monitor, and manage Unraid servers: Docker, VMs, array, parity, and live telemetry. |
| [unifi-mcp](https://github.com/jmagar/unifi-mcp) | infrastructure | Monitor and manage UniFi devices, clients, firewall rules, and network health. |
| [gotify-mcp](https://github.com/jmagar/gotify-mcp) | utilities | Send and manage push notifications via a self-hosted Gotify server. |
| [synapse-mcp](https://github.com/jmagar/synapse-mcp) | infrastructure | Docker management (Flux) and SSH remote operations (Scout) across homelab hosts. |
| [arcane-mcp](https://github.com/jmagar/arcane-mcp) | infrastructure | Manage Docker environments, containers, images, volumes, networks, and GitOps via Arcane. |
| [syslog-mcp](https://github.com/jmagar/syslog-mcp) | infrastructure | Receive, index, and search syslog streams from all homelab hosts via SQLite FTS5. |
| [plugin-lab](https://github.com/jmagar/plugin-lab) | dev-tools | Scaffold, review, align, and deploy homelab MCP plugins with agents and canonical templates. |

## License

MIT
