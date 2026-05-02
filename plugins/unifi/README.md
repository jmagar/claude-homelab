# UniFi MCP

<!-- mcp-name: tv.tootie/unifi-mcp -->

[![PyPI](https://img.shields.io/pypi/v/unifi-mcp)](https://pypi.org/project/unifi-mcp/) [![ghcr.io](https://img.shields.io/badge/ghcr.io-jmagar%2Funifi--mcp-blue?logo=docker)](https://github.com/jmagar/unifi-mcp/pkgs/container/unifi-mcp)

FastMCP server for local UniFi controller management. Exposes a single `unifi` action router and a `unifi_help` reference tool covering devices, clients, network configuration, and controller monitoring.

## Overview

The server connects to a self-hosted UniFi controller (including UDM Pro) and proxies all operations through a single MCP tool. A unified action parameter replaces 31 individual tools while preserving every capability. Destructive operations require explicit confirmation. Bearer token auth protects the HTTP endpoint in production.

## What this repository ships

- `unifi_mcp/`: server, client, config, formatters, models, services, resources, and tools
- `skills/unifi/`: client-facing skill
- `docs/`: API notes, action-pattern rationale, testing notes
- `.claude-plugin/`, `.codex-plugin/`, `gemini-extension.json`: client manifests
- `docker-compose.yaml`, `Dockerfile`: container deployment
- `tests/`: unit, resource, and integration tests

## Tools

### `unifi`

Single action router for all UniFi operations.

**Parameters**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `action` | string | yes | — | Action to perform (see below) |
| `site_name` | string | no | `"default"` | UniFi site name. Ignored by `get_sites`, `get_controller_status`, `get_user_info` |
| `mac` | string | no | `null` | Device or client MAC address (any format: `aa:bb:cc`, `AA-BB-CC`, `aabb.cc`) |
| `limit` | int | no | varies | Maximum results to return |
| `connected_only` | bool | no | `true` | `get_clients`: return only currently connected clients |
| `active_only` | bool | no | `true` | `get_alarms`: return only unarchived alarms |
| `by_filter` | string | no | `"by_app"` | `get_dpi_stats`: `"by_app"` or `"by_cat"` |
| `name` | string | no | `null` | `set_client_name`: new display name (empty string removes it) |
| `note` | string | no | `null` | `set_client_note`: note text (empty string removes it) |
| `minutes` | int | no | `480` | `authorize_guest`: access duration in minutes |
| `up_bandwidth` | int | no | `null` | `authorize_guest`: upload limit in Kbps |
| `down_bandwidth` | int | no | `null` | `authorize_guest`: download limit in Kbps |
| `quota` | int | no | `null` | `authorize_guest`: data quota in MB |
| `confirm` | bool | no | `null` | Set to `true` to confirm destructive operations |

### `unifi_help`

Returns full markdown reference for all actions and parameters. No parameters needed.

---

## Action Groups

### Device Management

| Action | MAC Required | Description |
|--------|-------------|-------------|
| `get_devices` | no | List all devices on a site with status, model, IP, and uptime |
| `get_device_by_mac` | yes | Get full details for one device by MAC |
| `restart_device` | yes | **Destructive** — reboot the device |
| `locate_device` | yes | Activate the locate LED on the device |

**`get_devices` response fields per device:** `name`, `model`, `type` (Access Point / Gateway / Switch), `status` (Online / Offline), `ip`, `mac`, `uptime`, `version`

**`restart_device` example:**

```
unifi action=restart_device mac=aa:bb:cc:dd:ee:ff confirm=true
```

---

### Client Management

| Action | MAC Required | Description |
|--------|-------------|-------------|
| `get_clients` | no | List clients. `connected_only=true` (default) filters offline entries |
| `reconnect_client` | yes | **Destructive** — force a client to reconnect (kick-sta) |
| `block_client` | yes | **Destructive** — block a client from network access |
| `unblock_client` | yes | Re-allow a previously blocked client |
| `forget_client` | yes | **Destructive** — remove all historical data for a client (GDPR) |
| `set_client_name` | yes | Set or update the display alias for a client |
| `set_client_note` | yes | Set or update the note for a client |

**`set_client_name` / `set_client_note`**: Both resolve the client by MAC against the controller user list (`/list/user`), then POST to `/upd/user/{id}`. Pass an empty string (`name=""`) to remove the value.

**Workflow — block a client:**

```
# Step 1: find the MAC
unifi action=get_clients connected_only=true

# Step 2: block it
unifi action=block_client mac=aa:bb:cc:dd:ee:ff confirm=true

# Step 3: verify
unifi action=get_clients connected_only=false
```

---

### Network Configuration

| Action | Description |
|--------|-------------|
| `get_sites` | List all sites on the controller with health info |
| `get_wlan_configs` | WLAN profiles: SSID, security, VLAN, guest flag, band steering |
| `get_network_configs` | Network/VLAN configs: subnet, DHCP range, purpose, guest flag |
| `get_port_configs` | Switch port profiles: native VLAN, tagged VLANs, PoE mode, port security |
| `get_port_forwarding_rules` | Port forwarding rules: protocol, external port, internal IP/port |
| `get_firewall_rules` | Firewall rules: action, protocol, source/destination, ruleset, index |
| `get_firewall_groups` | Firewall groups: type, member IPs or MACs, member count |
| `get_static_routes` | Static routes: destination network, gateway (nexthop), distance, interface |

All network configuration actions accept `site_name`. `get_sites` does not use `site_name`.

---

### Monitoring

| Action | Key Parameters | Description |
|--------|---------------|-------------|
| `get_controller_status` | — | Controller version and up/down status |
| `get_events` | `limit` (default 100), `site_name` | Recent controller events sorted newest-first. On UDM Pro tries the v2 API (`/proxy/network/v2/api/site/{site}/events`) then falls back to `/stat/event`. Returns an informative error if the firmware has removed the legacy endpoint. |
| `get_alarms` | `active_only` (default true), `site_name` | Active or all alarms. Severity comes from `catname`. |
| `get_dpi_stats` | `by_filter` (default `"by_app"`), `site_name` | Deep Packet Inspection usage by application or category. Bandwidth values are in **bytes** (raw) in the structured response; the text summary formats them as human-readable (KB / MB / GB). |
| `get_rogue_aps` | `limit` (default 20, max 50), `site_name` | Detected foreign APs sorted by signal strength. Threat level: High > -60 dBm, Medium > -80 dBm, Low otherwise. |
| `start_spectrum_scan` | `mac` (AP), `site_name` | Trigger an RF spectrum scan on an access point. |
| `get_spectrum_scan_state` | `mac` (AP), `site_name` | Poll scan state and results for an AP. |
| `authorize_guest` | `mac`, `minutes`, `up_bandwidth`, `down_bandwidth`, `quota`, `site_name` | Grant a guest client timed network access. `up_bandwidth` / `down_bandwidth` are in **Kbps**. `quota` is in **MB** (converted to bytes before sending). Default duration is 480 minutes (8 hours). |
| `get_speedtest_results` | `limit` (default 20), `site_name` | Historical speed tests from the last 30 days. Download/upload fields are in **Mbps**; latency and jitter in **ms**. |
| `get_ips_events` | `limit` (default 50), `site_name` | IPS/IDS threat events from the last 7 days: source/destination IP, protocol, signature, category, severity, action. |

**Workflow — authorize a guest with bandwidth cap:**

```
unifi action=authorize_guest mac=aa:bb:cc:dd:ee:ff minutes=120 down_bandwidth=5000 up_bandwidth=2000 quota=500
```

**Workflow — view DPI stats by category:**

```
unifi action=get_dpi_stats by_filter=by_cat site_name=default
```

---

### Identity

| Action | Description |
|--------|-------------|
| `get_user_info` | Return the MCP OAuth token claims (email, name, picture, expiry) |

`get_user_info` requires MCP OAuth (e.g. Google provider). UniFi controller credentials are separate. Returns an error if OAuth is not configured.

---

## Destructive Operation Policy

Four actions require confirmation before executing:

| Action | What it does |
|--------|-------------|
| `restart_device` | Reboots the device — causes brief network outage |
| `block_client` | Denies network access to the client |
| `reconnect_client` | Forces disconnect/reconnect (kick-sta) |
| `forget_client` | Permanently removes all historical data for the client |

Confirmation is checked in this order. The first matching rule wins:

1. **`UNIFI_MCP_ALLOW_DESTRUCTIVE=true`** — all destructive actions run without prompting (CI / automation)
2. **`UNIFI_MCP_ALLOW_YOLO=true`** — same bypass, broader semantics (skips all elicitation prompts)
3. **`confirm=true` parameter** — per-call confirmation in the tool invocation

If none of the above apply, the tool returns `error: confirmation_required` with instructions to add `confirm=true`.

---

## Installation

### Marketplace

```bash
/plugin marketplace add jmagar/claude-homelab
/plugin install unifi-mcp @jmagar-claude-homelab
```

### Local development

```bash
uv sync
uv run python -m unifi_mcp.main
```

Console script entrypoints:

```bash
uv run unifi-mcp
uv run unifi-local-mcp
```

### Docker

```bash
just up
just logs
```

---

## Configuration

Copy `.env.example` to `.env` and fill in the values:

```bash
cp .env.example .env
```

### Environment variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `UNIFI_URL` | yes | — | Controller URL, e.g. `https://192.168.1.1:443`. No trailing slash. `UNIFI_CONTROLLER_URL` accepted as legacy fallback. |
| `UNIFI_USERNAME` | yes | — | Controller admin username |
| `UNIFI_PASSWORD` | yes | — | Controller admin password |
| `UNIFI_IS_UDM_PRO` | no | `true` | Set to `true` for UDM Pro / UniFi OS controllers. Changes the API base path and auth flow (see below). |
| `UNIFI_VERIFY_SSL` | no | `false` | Set to `true` to verify TLS certificates. Most self-hosted controllers use self-signed certs; leave `false` unless you have a valid cert. |
| `UNIFI_MCP_HOST` | no | `0.0.0.0` | Server bind address |
| `UNIFI_MCP_PORT` | no | `8001` | Server port. `UNIFI_LOCAL_MCP_PORT` is a legacy fallback. |
| `UNIFI_MCP_TRANSPORT` | no | `http` | `"http"` or `"stdio"` |
| `UNIFI_MCP_TOKEN` | no* | — | Bearer token for HTTP auth. Generate with `openssl rand -hex 32`. *Required unless `UNIFI_MCP_NO_AUTH=true`. |
| `UNIFI_MCP_NO_AUTH` | no | `false` | Disable Bearer auth (use only behind a trusted reverse proxy) |
| `UNIFI_MCP_LOG_LEVEL` | no | `INFO` | Log verbosity: `DEBUG`, `INFO`, `WARNING`, `ERROR` |
| `UNIFI_MCP_LOG_FILE` | no | `/tmp/unifi-mcp.log` | Log file path. File is cleared when it reaches 10 MB. |
| `UNIFI_MCP_ALLOW_DESTRUCTIVE` | no | `false` | Skip confirmation for all destructive actions |
| `UNIFI_MCP_ALLOW_YOLO` | no | `false` | Skip all elicitation prompts including destructive confirmation |
| `PUID` / `PGID` | no | `1000` / `1000` | UID/GID for Docker container process |
| `DOCKER_NETWORK` | no | `jakenet` | Docker network name |

### UDM Pro vs traditional controller (`UNIFI_IS_UDM_PRO`)

| | UDM Pro (`true`) | Traditional (`false`) |
|---|---|---|
| API base path | `/proxy/network/api` | `/api` |
| Login endpoint | `/api/auth/login` | `{api_base}/login` |
| CSRF token | Extracted from JWT `TOKEN` cookie and sent as `X-CSRF-Token` | Not required |
| Events API | Tries v2 (`/proxy/network/v2/api/site/{site}/events`) first | Legacy `/stat/event` only |

### `UNIFI_VERIFY_SSL=false`

Self-hosted controllers typically use self-signed TLS certificates. Setting `UNIFI_VERIFY_SSL=false` disables certificate validation so the client can connect without a CA bundle. This is the safe choice for internal-network deployments. If your controller has a certificate issued by a public CA (e.g. via Let's Encrypt), set this to `true`.

### Multi-site support

Every action that is site-scoped accepts a `site_name` parameter (default: `"default"`). Use `get_sites` to list available site names. Pass the `name` field (not the description) as `site_name`.

```
unifi action=get_sites
# returns: name="default", name="branch-office", ...

unifi action=get_devices site_name=branch-office
```

---

## Usage examples

### List all connected clients

```
unifi action=get_clients connected_only=true
```

### Get a device by MAC

```
unifi action=get_device_by_mac mac=aa:bb:cc:dd:ee:ff
```

### Block a client

```
unifi action=block_client mac=aa:bb:cc:dd:ee:ff confirm=true
```

### Unblock a client

```
unifi action=unblock_client mac=aa:bb:cc:dd:ee:ff
```

### Label a client

```
unifi action=set_client_name mac=aa:bb:cc:dd:ee:ff name="Living Room TV"
unifi action=set_client_note mac=aa:bb:cc:dd:ee:ff note="Guest device, 2026-04"
```

### Authorize a guest (2 hours, 5 Mbps down, 500 MB cap)

```
unifi action=authorize_guest mac=aa:bb:cc:dd:ee:ff minutes=120 down_bandwidth=5000 quota=500
```

### View DPI stats

```
unifi action=get_dpi_stats by_filter=by_app site_name=default
```

### Check IPS threat events

```
unifi action=get_ips_events limit=20 site_name=default
```

### Check controller status

```
unifi action=get_controller_status
```

### View recent speed tests

```
unifi action=get_speedtest_results limit=5
```

### Get inline help

```
unifi_help
```

---

## Development

### Commands

```bash
just dev          # Start server with auto-reload
just lint         # Lint with ruff
just fmt          # Format with ruff
just typecheck    # Type-check with ty
just check        # lint + typecheck
just build        # Editable install (uv pip install -e .)
just test         # Run unit tests
just test-live    # Health check against running server
just up           # docker compose up -d
just down         # docker compose down
just logs         # Tail container logs
just health       # curl /health endpoint
just gen-token    # Generate a secure random token
just check-contract  # Lint skill/server contract
just clean        # Remove build artifacts and caches
```

### Generate a bearer token

```bash
just gen-token
# or
openssl rand -hex 32
```

---

## Verification

```bash
just lint
just typecheck
just test
```

For a running-server check:

```bash
just health
just test-live
```

---

## Related plugins

| Plugin | Category | Description |
|--------|----------|-------------|
| [homelab-core](https://github.com/jmagar/claude-homelab) | core | Core agents, commands, skills, and setup/health workflows for homelab management. |
| [overseerr-mcp](https://github.com/jmagar/overseerr-mcp) | media | Search movies and TV shows, submit requests, and monitor failed requests via Overseerr. |
| [unraid-mcp](https://github.com/jmagar/unraid-mcp) | infrastructure | Query, monitor, and manage Unraid servers: Docker, VMs, array, parity, and live telemetry. |
| [gotify-mcp](https://github.com/jmagar/gotify-mcp) | utilities | Send and manage push notifications via a self-hosted Gotify server. |
| [swag-mcp](https://github.com/jmagar/swag-mcp) | infrastructure | Create, edit, and manage SWAG nginx reverse proxy configurations. |
| [synapse-mcp](https://github.com/jmagar/synapse-mcp) | infrastructure | Docker management (Flux) and SSH remote operations (Scout) across homelab hosts. |
| [arcane-mcp](https://github.com/jmagar/arcane-mcp) | infrastructure | Manage Docker environments, containers, images, volumes, networks, and GitOps via Arcane. |
| [syslog-mcp](https://github.com/jmagar/syslog-mcp) | infrastructure | Receive, index, and search syslog streams from all homelab hosts via SQLite FTS5. |
| [plugin-lab](https://github.com/jmagar/plugin-lab) | dev-tools | Scaffold, review, align, and deploy homelab MCP plugins with agents and canonical templates. |

## License

MIT
