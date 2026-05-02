---
name: syslog
description: This skill should be used when the user asks to "search logs", "check errors", "tail logs", "show recent logs", "find log entries", "correlate events", "list hosts", "log stats", "syslog", "check homelab logs", or mentions system logs, syslog, log analysis, or log intelligence across homelab hosts.
---

# Syslog Skill

Rust-based syslog receiver and MCP server for homelab log intelligence. Receives RFC 3164/5424 syslog from all homelab hosts, stores in SQLite with FTS5 full-text search, exposes 6 MCP tools for AI-driven log analysis.

## Tools

This skill exposes 6 direct MCP tools via the `mcp__claude_ai_Syslog__*` namespace.

**Always prefer MCP mode** (`mcp__claude_ai_Syslog__*` tool calls). Fall back to HTTP only when MCP tools are unavailable.

**MCP URL**: `${user_config.syslog_mcp_url}`

---

## Tool Reference

### `search_logs` — Full-text log search

Full-text search across all syslog messages using SQLite FTS5 with porter stemming.

**Parameters:**

| param | type | description |
|-------|------|-------------|
| `query` | string | FTS5 query (AND, OR, NOT, phrase, prefix*) |
| `hostname` | string | Filter by hostname (exact match) |
| `severity` | string | One of: emerg, alert, crit, err, warning, notice, info, debug |
| `app_name` | string | Filter by application (e.g. sshd, dockerd, kernel) |
| `from` | string | Start time (ISO 8601, e.g. 2025-01-15T00:00:00Z) |
| `to` | string | End time (ISO 8601) |
| `limit` | integer | Max results (default 100, max 1000) |

**Examples:**

```python
# Simple keyword search
mcp__claude_ai_Syslog__search_logs(query="kernel panic")

# Boolean operators
mcp__claude_ai_Syslog__search_logs(query="OOM AND killer", limit=50)

# Phrase search (note: use quotes for phrases, NOT hyphens — hyphen is FTS5 NOT)
mcp__claude_ai_Syslog__search_logs(query='"authentication failure"')

# Filtered by host and severity
mcp__claude_ai_Syslog__search_logs(query="error", hostname="unraid", severity="err")

# Time-bounded search
mcp__claude_ai_Syslog__search_logs(
    query="connection refused",
    from="2025-01-15T00:00:00Z",
    to="2025-01-15T23:59:59Z"
)

# Prefix search
mcp__claude_ai_Syslog__search_logs(query="docker*")
```

**FTS5 syntax notes:**
- `AND`, `OR`, `NOT` — boolean operators (uppercase)
- `"phrase here"` — phrase match
- `term*` — prefix match
- **Hyphen `-` is the NOT operator** — to search hyphenated terms use phrase: `"smoke-test"` not `smoke-test`
- Invalid FTS5 syntax returns a db error

---

### `tail_logs` — Recent log entries

Get the N most recent log entries across all hosts, like `tail -f` but multi-host.

**Parameters:**

| param | type | description |
|-------|------|-------------|
| `hostname` | string | Filter to a specific host |
| `app_name` | string | Filter to a specific application |
| `n` | integer | Number of entries (default 50, max 500) |

**Examples:**

```python
# Last 20 entries across all hosts
mcp__claude_ai_Syslog__tail_logs(n=20)

# Last 50 from a specific host
mcp__claude_ai_Syslog__tail_logs(hostname="unraid", n=50)

# Last 30 from a specific app
mcp__claude_ai_Syslog__tail_logs(app_name="dockerd", n=30)
```

---

### `get_errors` — Error and warning summary

Error/warning summary grouped by hostname and severity level with counts. Best for quick health assessments.

**Parameters:**

| param | type | description |
|-------|------|-------------|
| `from` | string | Start time (ISO 8601). Defaults to all time. |
| `to` | string | End time (ISO 8601). Defaults to now. |

**Examples:**

```python
# All errors ever
mcp__claude_ai_Syslog__get_errors()

# Errors in the last hour
mcp__claude_ai_Syslog__get_errors(
    from="2025-01-15T13:00:00Z",
    to="2025-01-15T14:00:00Z"
)
```

**Response shape:**
```json
{
  "summary": [
    {"hostname": "unraid", "severity": "err", "count": 42},
    {"hostname": "unraid", "severity": "crit", "count": 3}
  ]
}
```

---

### `list_hosts` — All known hosts

List all hosts that have sent syslog messages, with first/last seen timestamps and total log counts.

**Examples:**

```python
mcp__claude_ai_Syslog__list_hosts()
```

**Response shape:**
```json
{
  "hosts": [
    {
      "hostname": "unraid",
      "log_count": 145230,
      "first_seen": "2024-10-01T00:00:00Z",
      "last_seen": "2025-01-15T14:30:00Z"
    }
  ]
}
```

---

### `correlate_events` — Cross-host event correlation

Find related events across all hosts within a time window around a reference timestamp. Ideal for debugging cascading failures — shows what happened on every host around the time of an incident.

**Parameters:**

| param | type | description |
|-------|------|-------------|
| `reference_time` | string | **Required.** Center timestamp (ISO 8601) |
| `window_minutes` | integer | Minutes before/after reference (default 5, max 60) |
| `severity_min` | string | Minimum severity: emerg/alert/crit/err/warning/notice/info/debug (default warning) |
| `hostname` | string | Limit to a specific host |
| `query` | string | Optional FTS5 query to narrow results |
| `limit` | integer | Max total events (default 500, max 999) |

**Examples:**

```python
# What happened across all hosts around an incident time?
mcp__claude_ai_Syslog__correlate_events(
    reference_time="2025-01-15T14:30:00Z",
    window_minutes=10
)

# Wider window, only critical+
mcp__claude_ai_Syslog__correlate_events(
    reference_time="2025-01-15T14:30:00Z",
    window_minutes=30,
    severity_min="crit"
)

# Narrow to specific host and keyword
mcp__claude_ai_Syslog__correlate_events(
    reference_time="2025-01-15T14:30:00Z",
    window_minutes=5,
    hostname="unraid",
    query="OOM"
)
```

**Response shape:**
```json
{
  "reference_time": "2025-01-15T14:30:00Z",
  "window_minutes": 10,
  "total_events": 23,
  "truncated": false,
  "hosts_count": 3,
  "hosts": [
    {
      "hostname": "unraid",
      "event_count": 12,
      "events": [...]
    }
  ]
}
```

**Note:** `limit` is silently capped at 999 because the implementation fetches `limit+1` rows to detect truncation.

---

### `get_stats` — Database statistics

DB stats: total logs, total hosts, time range covered, logical/physical DB size, free disk, configured thresholds, and write-block status.

**Examples:**

```python
mcp__claude_ai_Syslog__get_stats()
```

**Response fields:** `total_logs`, `total_hosts`, `oldest_log`, `newest_log`, `logical_db_size_mb`, `physical_db_size_mb`, `free_disk_mb`, `write_blocked`, and configured threshold values.

---

## HTTP Fallback Mode

Use when MCP tools are unavailable. The MCP URL and token are available as `CLAUDE_PLUGIN_OPTION_*` in Bash subprocesses.

### Health check (no auth)

```bash
curl -s "$CLAUDE_PLUGIN_OPTION_SYSLOG_MCP_URL/health"
```

### Tail logs

```bash
curl -s -X POST "$CLAUDE_PLUGIN_OPTION_SYSLOG_MCP_URL/mcp" \
  -H "Authorization: Bearer $CLAUDE_PLUGIN_OPTION_SYSLOG_MCP_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":1,"method":"tools/call","params":{"name":"tail_logs","arguments":{"n":20}}}'
```

### Search logs

```bash
curl -s -X POST "$CLAUDE_PLUGIN_OPTION_SYSLOG_MCP_URL/mcp" \
  -H "Authorization: Bearer $CLAUDE_PLUGIN_OPTION_SYSLOG_MCP_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":2,"method":"tools/call","params":{"name":"search_logs","arguments":{"query":"error","limit":20}}}'
```

### Get stats

```bash
curl -s -X POST "$CLAUDE_PLUGIN_OPTION_SYSLOG_MCP_URL/mcp" \
  -H "Authorization: Bearer $CLAUDE_PLUGIN_OPTION_SYSLOG_MCP_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"jsonrpc":"2.0","id":3,"method":"tools/call","params":{"name":"get_stats","arguments":{}}}'
```

---

## Ports

| Port | Protocol | Purpose |
|------|----------|---------|
| 1514 | UDP + TCP | Syslog receiver |
| 3100 | TCP | MCP HTTP endpoint (`POST /mcp`, `GET /health`, `GET /sse`) |

Note: Port 1514 avoids needing `CAP_NET_BIND_SERVICE` (not 514). Use iptables PREROUTING to redirect 514->1514 for devices that can't be reconfigured.

---

## Severity Levels

| Level | Numeric | Description |
|-------|---------|-------------|
| emerg | 0 | System unusable |
| alert | 1 | Immediate action required |
| crit | 2 | Critical condition |
| err | 3 | Error condition |
| warning | 4 | Warning condition |
| notice | 5 | Normal but significant |
| info | 6 | Informational |
| debug | 7 | Debug messages |

`get_errors` returns only: emerg, alert, crit, err, warning.
`correlate_events` default `severity_min` is `warning` — returns warning through emerg.

---

## Log Intelligence Workflows

### Quick homelab health check

```python
# 1. Get error summary
mcp__claude_ai_Syslog__get_errors()

# 2. Drill into a specific host
mcp__claude_ai_Syslog__tail_logs(hostname="unraid", n=50)

# 3. Search for specifics
mcp__claude_ai_Syslog__search_logs(query='OOM OR "out of memory"', hostname="unraid")
```

### Incident investigation

```python
# 1. Find the incident window
mcp__claude_ai_Syslog__search_logs(query='panic OR crash OR "segmentation fault"', limit=10)

# 2. Correlate across all hosts at that time
mcp__claude_ai_Syslog__correlate_events(
    reference_time="<timestamp from step 1>",
    window_minutes=15,
    severity_min="warning"
)

# 3. Check what hosts were active
mcp__claude_ai_Syslog__list_hosts()
```

### Storage health

```python
mcp__claude_ai_Syslog__get_stats()
# Check: write_blocked, logical_db_size_mb vs threshold, free_disk_mb vs threshold
```
