# Syslog MCP

[![crates.io](https://img.shields.io/crates/v/syslog-mcp)](https://crates.io/crates/syslog-mcp) [![ghcr.io](https://img.shields.io/badge/ghcr.io-jmagar%2Fsyslog--mcp-blue?logo=docker)](https://github.com/jmagar/syslog-mcp/pkgs/container/syslog-mcp)

Rust syslog receiver and MCP server for homelab log intelligence. Ingests syslog over UDP and TCP, stores it in SQLite with FTS5 full-text indexing, and exposes search, tail, error summary, correlation, and stats tools to MCP clients.

## Overview

```
                    ┌─────────────────────────────────┐
  rsyslog/syslog-ng ─▶  UDP :1514 / TCP :1514          │
  network devices   ─▶  ┌──────────────────────────┐   │
                    │   │  parse → batch writer     │   │
                    │   │  SQLite + FTS5 (WAL mode) │   │
                    │   └──────────────────────────┘   │
  Claude / MCP ◀──── ▶  HTTP :3100/mcp (JSON-RPC)      │
                    └─────────────────────────────────┘
```

The server listens on a single port for both UDP and TCP syslog (default `1514`). All inbound messages are parsed, batched, and written to SQLite with full-text indexing. The MCP HTTP server runs on a separate port (default `3100`) and accepts JSON-RPC 2.0 requests.

---

## Tools

Seven MCP tools are exposed.

### `search_logs`

Full-text search across all syslog messages with optional filters. Uses SQLite FTS5 with porter stemming.

**Parameters**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `query` | string | no | — | FTS5 search query (see [FTS5 query syntax](#fts5-query-syntax)) |
| `hostname` | string | no | — | Exact hostname match. Use `list_hosts` to enumerate. |
| `severity` | string | no | — | One of: `emerg alert crit err warning notice info debug` |
| `app_name` | string | no | — | Application name, e.g. `sshd`, `dockerd`, `kernel` |
| `from` | string | no | — | Start of time range (ISO 8601 / RFC 3339, e.g. `2025-01-15T00:00:00Z`) |
| `to` | string | no | — | End of time range (ISO 8601) |
| `limit` | integer | no | 100 | Max results (hard cap: 1000) |

**Response**

```json
{
  "count": 3,
  "logs": [
    {
      "id": 12345,
      "timestamp": "2025-01-15T14:30:00Z",
      "hostname": "router",
      "facility": "kern",
      "severity": "err",
      "app_name": "kernel",
      "process_id": null,
      "message": "kernel panic: unable to mount root",
      "received_at": "2025-01-15T14:30:01.123Z",
      "source_ip": "10.0.0.1:51234"
    }
  ]
}
```

**Examples**

```
query: "kernel panic"           # implicit AND: both terms must appear
query: "OOM AND killer"        # explicit AND
query: "sshd OR pam"           # boolean OR
query: "failed NOT sudo"       # boolean NOT
query: '"connection refused"'  # exact phrase (bypasses stemming)
query: "error*"                # prefix wildcard
query: "restart*"              # matches restart, restarted, restarting
```

---

### `tail_logs`

Return the N most recent log entries. Equivalent to `tail -f` across all hosts.

**Parameters**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `hostname` | string | no | — | Filter to a specific host |
| `app_name` | string | no | — | Filter to a specific application |
| `n` | integer | no | 50 | Number of recent entries (hard cap: 500) |

**Response**

Same structure as `search_logs`: `{ "count": N, "logs": [...] }`.

---

### `get_errors`

Summarize warnings and errors across all hosts in a time window. Groups by hostname and severity, showing counts. Use this for quick health assessments.

**Parameters**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `from` | string | no | all time | Start of time range (ISO 8601) |
| `to` | string | no | now | End of time range (ISO 8601) |

Severities included: `emerg`, `alert`, `crit`, `err`, `warning`.

**Response**

```json
{
  "summary": [
    { "hostname": "router",  "severity": "err",     "count": 42 },
    { "hostname": "router",  "severity": "warning",  "count": 17 },
    { "hostname": "storage", "severity": "crit",     "count":  3 }
  ]
}
```

---

### `list_hosts`

List all hosts that have sent syslog messages, with first/last seen timestamps and total log counts.

**Parameters:** none

**Response**

```json
{
  "hosts": [
    {
      "hostname": "router",
      "first_seen": "2025-01-01T00:00:00.000Z",
      "last_seen":  "2025-01-15T14:30:00.000Z",
      "log_count":  18432
    }
  ]
}
```

---

### `correlate_events`

Search for related events across multiple hosts within a ±N minute window around a reference timestamp. Useful for debugging cascading failures. Results are grouped by host and ordered by time.

**Parameters**

| Parameter | Type | Required | Default | Description |
|-----------|------|----------|---------|-------------|
| `reference_time` | string | **yes** | — | Center timestamp (ISO 8601, e.g. `2025-01-15T14:30:00Z`) |
| `window_minutes` | integer | no | 5 | Minutes before and after `reference_time` (max 60) |
| `severity_min` | string | no | `warning` | Minimum severity to include. `warning` returns `warning/err/crit/alert/emerg`. `debug` returns everything. |
| `hostname` | string | no | — | Limit correlation to one host |
| `query` | string | no | — | FTS5 query to narrow results |
| `limit` | integer | no | 500 | Max total events (hard cap: 999) |

**Response**

```json
{
  "reference_time": "2025-01-15T14:30:00Z",
  "window_minutes": 5,
  "window_from": "2025-01-15T14:25:00+00:00",
  "window_to":   "2025-01-15T14:35:00+00:00",
  "severity_min": "warning",
  "total_events": 12,
  "truncated": false,
  "hosts_count": 3,
  "hosts": [
    {
      "hostname": "router",
      "event_count": 7,
      "events": [...]
    }
  ]
}
```

**Note on clock skew:** `correlate_events` uses the `timestamp` field from the syslog message, which reflects the sending device's clock. If a device clock is skewed, events may fall outside the correlation window. See [Time synchronization](#time-synchronization).

---

### `get_stats`

Return database statistics including total logs, total hosts, time range covered, logical and physical DB size, free disk, configured thresholds, and current write-block status.

**Parameters:** none

**Response**

```json
{
  "total_logs": 284917,
  "total_hosts": 12,
  "oldest_log": "2024-10-15T00:00:01Z",
  "newest_log": "2025-01-15T14:30:00Z",
  "logical_db_size_mb": "312.45",
  "physical_db_size_mb": "328.00",
  "free_disk_mb": "14200.00",
  "max_db_size_mb": 1024,
  "min_free_disk_mb": 512,
  "write_blocked": false
}
```

`write_blocked: true` means the storage budget is exceeded and new log ingestion is paused. See [Storage budget enforcement](#storage-budget-enforcement).

---

### `syslog_help`

Return markdown documentation for all tools in this toolset.

**Parameters:** none

---

## FTS5 Query Syntax

The `search_logs` and `correlate_events` tools use SQLite FTS5 with porter stemming (`tokenize='porter unicode61'`). Valid query forms:

| Syntax | Example | Matches |
|--------|---------|---------|
| Single term | `panic` | Any message containing "panic" or stemmed variants |
| Porter stemming | `restart` | restart, restarted, restarting, restarts |
| AND (default) | `disk error` or `disk AND error` | Both terms present |
| OR | `sshd OR pam` | Either term present |
| NOT | `failed NOT sudo` | "failed" present, "sudo" absent |
| Phrase | `"connection refused"` | Exact phrase in that order |
| Prefix wildcard | `error*` | Any word starting with "error" |
| Grouped | `(kernel OR oom) AND panic` | Grouped boolean logic |

**Limits:** max 512 characters, max 16 whitespace-separated terms.

**Porter stemming** means `connect`, `connected`, `connecting`, and `connection` all match the query `connect`. Phrase queries (`"..."`) bypass stemming and require exact token order.

---

## Log Schema

Each stored log entry has these fields:

| Field | Type | Description |
|-------|------|-------------|
| `id` | integer | Auto-increment primary key |
| `timestamp` | text | Message timestamp (RFC 3339, UTC). From the syslog message header. |
| `hostname` | text | Hostname from the syslog message (user-controlled, not verified) |
| `facility` | text\|null | Syslog facility name (see facilities below) |
| `severity` | text | Syslog severity level name |
| `app_name` | text\|null | Application/process name from the syslog message |
| `process_id` | text\|null | PID from the syslog message |
| `message` | text | Log message body (FTS5-indexed) |
| `received_at` | text | Server-side receipt timestamp (RFC 3339, UTC). Used for retention. |
| `source_ip` | text | Actual network sender address (`IP:port`). Trustworthy network identity. |

**Important:** `hostname` is taken from the syslog message body, which any LAN device can set to an arbitrary value over UDP. `source_ip` is the only trustworthy network identifier. Retention cutoffs use `received_at` (server clock) so that devices with misconfigured clocks cannot cause premature or indefinite log retention.

### Severity levels

Ordered from most to least severe:

| Level | Numeric | Meaning |
|-------|---------|---------|
| `emerg` | 0 | System is unusable |
| `alert` | 1 | Action must be taken immediately |
| `crit` | 2 | Critical conditions |
| `err` | 3 | Error conditions |
| `warning` | 4 | Warning conditions |
| `notice` | 5 | Normal but significant condition |
| `info` | 6 | Informational messages |
| `debug` | 7 | Debug-level messages |

### Facilities

`kern`, `user`, `mail`, `daemon`, `auth`, `syslog`, `lpr`, `news`, `uucp`, `cron`, `authpriv`, `ftp`, `ntp`, `audit`, `alert`, `clock`, `local0`–`local7`.

---

## Installation

### Claude Code plugin (recommended)

Install as a Claude Code plugin. You will be prompted for:
- **Syslog MCP URL** -- full endpoint URL of your running syslog-mcp server
- **API Token** -- bearer token for authentication (leave empty if auth is disabled)

The plugin connects to a running syslog-mcp instance over HTTP. The server must be deployed separately (Docker or bare metal).

### Docker

```bash
git clone https://github.com/jmagar/syslog-mcp
cd syslog-mcp
cp .env.example .env
# Edit .env — set SYSLOG_MCP_TOKEN at minimum
docker compose up -d
```

The container binds:
- `UDP :1514` and `TCP :1514` for syslog ingestion
- `TCP :3100` for the MCP HTTP API

### Local build

Requires Rust 1.86+.

```bash
cargo build --release
./target/release/syslog-mcp
```

---

## Configuration

Configuration is loaded from three sources in priority order (highest wins):

1. Environment variables
2. `config.toml` (if present)
3. Built-in defaults

### Environment variables

#### MCP server

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SYSLOG_MCP_API_TOKEN` | no | — | Bearer token for `/mcp` and `/sse`. Omit to disable auth. |
| `SYSLOG_MCP_HOST` | no | `0.0.0.0` | Bind host for the MCP HTTP server |
| `SYSLOG_MCP_PORT` | no | `3100` | Bind port for the MCP HTTP server |

#### Syslog listener

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SYSLOG_HOST` | no | `0.0.0.0` | Bind host for UDP + TCP syslog listeners |
| `SYSLOG_PORT` | no | `1514` | Bind port for UDP + TCP syslog listeners |
| `SYSLOG_MAX_MESSAGE_SIZE` | no | `8192` | Max message size in bytes (oversized messages are dropped) |
| `SYSLOG_BATCH_SIZE` | no | `100` | Number of messages per batch write |
| `SYSLOG_FLUSH_INTERVAL` | no | `500` | Batch flush interval in milliseconds |

#### Storage

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SYSLOG_MCP_DB_PATH` | no | `/data/syslog.db` | SQLite database path |
| `SYSLOG_MCP_POOL_SIZE` | no | `4` | SQLite connection pool size |
| `SYSLOG_MCP_RETENTION_DAYS` | no | `90` | Days to retain logs. `0` = keep forever. |
| `SYSLOG_MCP_MAX_DB_SIZE_MB` | no | `1024` | Logical DB size trigger for write-blocking. `0` = disabled. |
| `SYSLOG_MCP_RECOVERY_DB_SIZE_MB` | no | `900` | Cleanup target after DB size trigger. Must be less than max. |
| `SYSLOG_MCP_MIN_FREE_DISK_MB` | no | `512` | Free disk trigger for write-blocking. `0` = disabled. |
| `SYSLOG_MCP_RECOVERY_FREE_DISK_MB` | no | `768` | Cleanup target after free disk trigger. Must be greater than min. |
| `SYSLOG_MCP_CLEANUP_INTERVAL_SECS` | no | `60` | Storage budget enforcement interval. Minimum `5`. |
| `SYSLOG_MCP_CLEANUP_CHUNK_SIZE` | no | `2000` | Rows deleted per enforcement chunk |

#### Container

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SYSLOG_UID` | no | `1000` | Container user ID for data volume ownership |
| `SYSLOG_GID` | no | `1000` | Container group ID for data volume ownership |
| `SYSLOG_MCP_DATA_VOLUME` | no | `syslog-mcp-data` | Docker volume name or bind-mount path |
| `DOCKER_NETWORK` | no | `syslog-mcp` | Docker network name (must exist) |
| `RUST_LOG` | no | `info` | Log level (`trace`, `debug`, `info`, `warn`, `error`) |
| `TZ` | no | `UTC` | Container timezone |

### config.toml

Place `config.toml` next to the binary (or in the working directory). Environment variables override values set here.

```toml
[syslog]
host = "0.0.0.0"
port = 1514
max_message_size = 8192

[storage]
db_path = "/data/syslog.db"
pool_size = 4
retention_days = 90   # 0 = keep forever
wal_mode = true
max_db_size_mb = 1024
recovery_db_size_mb = 900
min_free_disk_mb = 512
recovery_free_disk_mb = 768
cleanup_interval_secs = 60

[mcp]
host = "0.0.0.0"
port = 3100
server_name = "syslog-mcp"
# api_token = "your-secret-token"
```

---

## Syslog Forwarder Setup

The server listens on port `1514` by default. Configure senders to forward to this port. If a device cannot use a non-privileged port, see [Exposing port 514](#exposing-port-514).

### rsyslog

Create `/etc/rsyslog.d/99-remote.conf` on each host:

```conf
# TCP (reliable, recommended for persistent connections)
*.* @@SYSLOG_SERVER:1514

# UDP (lower overhead, no delivery guarantee)
# *.* @SYSLOG_SERVER:1514
```

Restart: `sudo systemctl restart rsyslog`

For hosts running pure journald without rsyslog, first enable forwarding in `/etc/systemd/journald.conf`:

```ini
[Journal]
ForwardToSyslog=yes
```

Then install and configure rsyslog as above.

### syslog-ng

Add to `/etc/syslog-ng/conf.d/remote.conf`:

```conf
destination d_remote_tcp {
    network("SYSLOG_SERVER"
        port(1514)
        transport("tcp")
    );
};

destination d_remote_udp {
    network("SYSLOG_SERVER"
        port(1514)
        transport("udp")
    );
};

log {
    source(s_src);
    destination(d_remote_tcp);
};
```

Restart: `sudo systemctl restart syslog-ng`

### WSL2 (systemd enabled)

Enable systemd in `/etc/wsl.conf`:

```ini
[boot]
systemd=true
```

Install rsyslog and use the rsyslog config above. Use the Tailscale IP of the syslog-mcp host — WSL has its own network namespace and cannot reach the Docker host IP directly.

### UniFi Cloud Gateway

Option A — via SSH:

```bash
ssh admin@<gateway-ip>
# Create /etc/rsyslog.d/remote.conf (persists on newer firmware):
echo "*.* @SYSLOG_SERVER:1514" | sudo tee /etc/rsyslog.d/remote.conf
sudo systemctl restart rsyslog
```

Option B — via UI (survives firmware updates):

Settings → System → Advanced → Remote Syslog Server. Set host and port `1514`.

### Routers and appliances (UDP-only devices)

Set the syslog server address to your `SYSLOG_SERVER` and port to `1514` in the device's syslog settings. Most consumer routers and network appliances expose this under Diagnostics or Logging settings.

### Exposing port 514

Syslog's privileged port 514 requires root or `CAP_NET_BIND_SERVICE`. The recommended approach is to redirect at the host with iptables:

```bash
# Redirect UDP and TCP 514 → 1514 on the host
sudo iptables -t nat -A PREROUTING -p udp --dport 514 -j REDIRECT --to-port 1514
sudo iptables -t nat -A PREROUTING -p tcp --dport 514 -j REDIRECT --to-port 1514

# Persist across reboots (Debian/Ubuntu)
sudo apt install iptables-persistent
sudo netfilter-persistent save
```

On Unraid, map container port `514:1514/udp` and `514:1514/tcp` directly in the Docker template.

### Firewall rules

Open the syslog port on the Docker host firewall:

```bash
# ufw
sudo ufw allow 1514/udp
sudo ufw allow 1514/tcp

# firewalld
sudo firewall-cmd --permanent --add-port=1514/udp
sudo firewall-cmd --permanent --add-port=1514/tcp
sudo firewall-cmd --reload
```

---

## Retention Policy

Logs are retained for `SYSLOG_MCP_RETENTION_DAYS` days (default `90`). Set to `0` to keep logs forever.

The retention job runs on `SYSLOG_MCP_CLEANUP_INTERVAL_SECS` (default 60 seconds). It deletes logs in chunks of 10,000 rows, releasing the write lock between chunks so ingest can proceed. Retention cutoff uses `received_at` (the server-side ingestion timestamp), not the `timestamp` in the message. This prevents devices with misconfigured clocks from causing premature or indefinite retention.

After large deletions, an incremental FTS5 merge runs to reclaim index space without long write-lock durations.

---

## Storage Budget Enforcement

Two independent guards protect against disk exhaustion:

**DB size guard** (`SYSLOG_MCP_MAX_DB_SIZE_MB`, default 1024 MB)

When the logical SQLite DB size exceeds `max_db_size_mb`, the oldest logs are deleted in chunks of `SYSLOG_MCP_CLEANUP_CHUNK_SIZE` rows until the size drops below `recovery_db_size_mb`.

**Free disk guard** (`SYSLOG_MCP_MIN_FREE_DISK_MB`, default 512 MB)

When available disk drops below `min_free_disk_mb`, the oldest logs are deleted until free disk exceeds `recovery_free_disk_mb`.

**Write-blocking behavior**

If enforcement cannot free enough space (e.g. the DB is empty but storage is still over limit), the batch writer enters write-blocked state. New log messages accumulate in an in-memory buffer (channel capacity 10,000 messages). Writes resume automatically when space recovers. The `write_blocked` field in `get_stats` reflects the current state.

Disable either guard by setting its trigger to `0` (also set the recovery target to `0`).

---

## Batch Writer

The batch writer improves throughput by collecting parsed syslog messages into batches before writing to SQLite.

| Variable | Default | Description |
|----------|---------|-------------|
| `SYSLOG_BATCH_SIZE` | `100` | Write when this many messages are queued |
| `SYSLOG_FLUSH_INTERVAL` | `500` ms | Write every N ms even if batch is not full |

Batches are written in a single SQLite transaction. If the DB is busy (locked), the writer retries up to 3 times with exponential backoff (25 ms, 100 ms, 250 ms). Batches that fail insertion are retained in memory and retried on the next flush cycle. If a retained batch grows beyond 1,000 entries, it is discarded to prevent unbounded memory growth.

The internal write channel holds up to 10,000 parsed messages. When the channel is full, backpressure is logged and further UDP/TCP receives block until space is available.

---

## Multi-Host Deployment

Point multiple hosts at the same syslog-mcp instance. Each sender's `hostname` field (from the syslog message) is recorded and indexed. Use `list_hosts` to see all senders. Filter by `hostname` in `search_logs` and `tail_logs`. Use `correlate_events` to find related events across hosts within a time window.

For large fleets, consider:
- Increasing `SYSLOG_MCP_POOL_SIZE` (default 4) for higher read concurrency
- Increasing `SYSLOG_BATCH_SIZE` and `SYSLOG_FLUSH_INTERVAL` to reduce write overhead
- Setting `SYSLOG_MCP_RETENTION_DAYS` to balance history depth against disk cost

---

## Time Synchronization

All timestamps are stored in UTC. `correlate_events` uses the `timestamp` field from the syslog message, which reflects the sending device's clock. Devices with drifted clocks will have their events shifted relative to the correlation window. Run NTP on all senders to minimize skew. `received_at` (the server-side ingestion time) is unaffected by sender clock drift and is used for retention.

---

## HTTPS / Reverse Proxy

Add a SWAG proxy conf to expose the MCP API over TLS:

```nginx
# /config/nginx/proxy-confs/syslog-mcp.subdomain.conf
server {
    listen 443 ssl;
    server_name syslog-mcp.*;

    include /config/nginx/ssl.conf;

    location / {
        include /config/nginx/proxy.conf;
        include /config/nginx/resolver.conf;

        # SSE support
        proxy_set_header Connection '';
        proxy_http_version 1.1;
        chunked_transfer_encoding off;
        proxy_buffering off;
        proxy_cache off;

        set $upstream_app syslog-mcp;
        set $upstream_port 3100;
        set $upstream_proto http;
        proxy_pass $upstream_proto://$upstream_app:$upstream_port;
    }
}
```

---

## Development

```bash
just dev       # cargo run
just check     # cargo check
just lint      # cargo clippy -- -D warnings
just fmt       # cargo fmt
just test      # cargo test
just build     # cargo build
just release   # cargo build --release
```

Docker:

```bash
just up        # docker compose up -d
just logs      # docker compose logs -f
just down      # docker compose down
just restart   # docker compose restart
```

Generate a bearer token:

```bash
just gen-token   # openssl rand -hex 32
```

---

## Verification

After deploying, verify the stack:

```bash
# Health probe (no auth required)
curl -sf http://localhost:3100/health | jq .
# → {"status":"ok"}

# Send a test message from any Linux host
logger -n SYSLOG_SERVER -P 1514 --tcp "test from $(hostname)"

# Tail recent logs via MCP (replace token if auth is enabled)
curl -s -X POST http://localhost:3100/mcp \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "jsonrpc": "2.0",
    "id": 1,
    "method": "tools/call",
    "params": {
      "name": "tail_logs",
      "arguments": {"n": 10}
    }
  }' | jq .

# DB stats
curl -s -X POST http://localhost:3100/mcp \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  -d '{
    "jsonrpc": "2.0",
    "id": 2,
    "method": "tools/call",
    "params": {"name": "get_stats", "arguments": {}}
  }' | jq .result.content[0].text | jq -r . | jq .
```

Run the full test suite:

```bash
just check
just lint
just test
```

---

## Performance

At typical homelab scale (1–20 hosts, thousands of messages per day):

- SQLite with WAL mode handles concurrent reads and writes without contention
- The batch writer sustains thousands of messages per second on commodity hardware
- FTS5 with porter stemming adds minimal overhead over plain SQL queries
- `PRAGMA cache_size=-64000` allocates ~64 MB page cache per connection
- `PRAGMA synchronous=NORMAL` balances durability and throughput
- Connection pool (default 4) satisfies concurrent MCP requests without blocking

For higher ingest rates (IoT, high-traffic network devices):

- Increase `SYSLOG_BATCH_SIZE` (e.g. `500`) to reduce transaction overhead
- Increase `SYSLOG_FLUSH_INTERVAL` (e.g. `1000` ms) to widen batch windows
- Increase `SYSLOG_MCP_POOL_SIZE` (e.g. `8`) for more read concurrency
- Place the database on an SSD or tmpfs-backed volume

---

## MCP Transport

The server implements MCP over HTTP (JSON-RPC 2.0).

- `POST /mcp` — primary transport for tool calls
- `GET /sse` — legacy SSE transport (returns endpoint redirect)
- `GET /health` — unauthenticated health probe

When `SYSLOG_MCP_API_TOKEN` is set, `/mcp` and `/sse` require:

```
Authorization: Bearer <token>
```

`/health` is always unauthenticated (required for Docker health checks and reverse-proxy probes).

---

## Related Files

| File | Description |
|------|-------------|
| `Cargo.toml` | Crate metadata and dependency surface |
| `config.toml` | Default runtime configuration |
| `.env.example` | Canonical environment variable reference |
| `docs/SETUP.md` | Per-device syslog forwarder setup notes |
| `CHANGELOG.md` | Release history |
| `Dockerfile` | Container image definition |
| `docker-compose.yml` | Docker Compose stack |
| `Justfile` | Development command shortcuts |
| `src/main.rs` | Entry point, startup orchestration |
| `src/config.rs` | Configuration loading and validation |
| `src/db.rs` | SQLite schema, FTS5, retention, storage budget |
| `src/syslog.rs` | UDP/TCP listeners, syslog parser, batch writer |
| `src/mcp.rs` | MCP HTTP server, JSON-RPC dispatch, tool implementations |
| `.claude-plugin/plugin.json` | Claude plugin manifest |
| `.codex-plugin/plugin.json` | Codex plugin manifest |
| `gemini-extension.json` | Gemini extension manifest |

---

## Related plugins

| Plugin | Category | Description |
|--------|----------|-------------|
| [homelab-core](https://github.com/jmagar/claude-homelab) | core | Core agents, commands, skills, and setup/health workflows for homelab management. |
| [overseerr-mcp](https://github.com/jmagar/overseerr-mcp) | media | Search movies and TV shows, submit requests, and monitor failed requests via Overseerr. |
| [unraid-mcp](https://github.com/jmagar/unraid-mcp) | infrastructure | Query, monitor, and manage Unraid servers: Docker, VMs, array, parity, and live telemetry. |
| [unifi-mcp](https://github.com/jmagar/unifi-mcp) | infrastructure | Monitor and manage UniFi devices, clients, firewall rules, and network health. |
| [gotify-mcp](https://github.com/jmagar/gotify-mcp) | utilities | Send and manage push notifications via a self-hosted Gotify server. |
| [swag-mcp](https://github.com/jmagar/swag-mcp) | infrastructure | Create, edit, and manage SWAG nginx reverse proxy configurations. |
| [synapse-mcp](https://github.com/jmagar/synapse-mcp) | infrastructure | Docker management (Flux) and SSH remote operations (Scout) across homelab hosts. |
| [arcane-mcp](https://github.com/jmagar/arcane-mcp) | infrastructure | Manage Docker environments, containers, images, volumes, networks, and GitOps via Arcane. |
| [plugin-lab](https://github.com/jmagar/plugin-lab) | dev-tools | Scaffold, review, align, and deploy homelab MCP plugins with agents and canonical templates. |

## License

MIT
