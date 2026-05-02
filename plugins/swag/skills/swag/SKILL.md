---
name: swag
description: This skill should be used when the user says "add proxy config", "create reverse proxy", "SWAG config", "nginx proxy", "expose service", "proxy configuration", "subdomain config", "subfolder config", "configure SWAG", "list proxy configs", "view proxy config", "edit proxy config", "remove proxy config", "check proxy health", "SWAG logs", "add domain", "configure SSL", "proxy a service", or mentions SWAG, reverse proxy, nginx configuration, or making a service accessible via domain.
---

# SWAG Skill

## Mode Detection

**MCP mode** (preferred): Use when `mcp__swag-mcp__swag` tool is available. The server manages nginx proxy configuration files directly (local or remote via SSH).

**HTTP fallback**: No meaningful curl equivalent — SWAG config management requires direct filesystem access. If MCP server is unavailable, surface the issue to the user and suggest restarting it.

**MCP URL**: `${user_config.swag_mcp_url}`

---

## MCP Mode — Tool Reference

Single tool: `mcp__swag-mcp__swag` with an `action` parameter.

### List configurations

```
mcp__swag-mcp__swag
  action: "list"
```

Returns all proxy configurations with their status (enabled/disabled).

### Create configuration

```
mcp__swag-mcp__swag
  action:       "create"
  server_name:  (required) Service name, e.g. "jellyfin", "sonarr"
  type:         (required) "subdomain" or "subfolder"
  upstream_url: (required) Backend URL, e.g. "http://192.168.1.10:8096"
  auth_method:  (optional) "authelia", "authentik", "basic", "none" — default from server config
  enable_quic:  (optional) true/false
```

### View configuration

```
mcp__swag-mcp__swag
  action:      "view"
  server_name: (required) Service name
```

### Edit configuration

```
mcp__swag-mcp__swag
  action:      "edit"
  server_name: (required) Service name
  changes:     (required) Description of changes to apply
```

### Update upstream

```
mcp__swag-mcp__swag
  action:       "update"
  server_name:  (required) Service name
  upstream_url: (required) New backend URL
```

### Remove configuration

```
mcp__swag-mcp__swag
  action:      "remove"
  server_name: (required) Service name
```

**DESTRUCTIVE** — removes the nginx config file. Always confirm with user before executing.

### View logs

```
mcp__swag-mcp__swag
  action:   "logs"
  log_type: (optional) "access", "error", "fail2ban", "letsencrypt" — default "error"
```

### Manage backups

```
mcp__swag-mcp__swag
  action: "backups"
```

Lists available configuration backups.

### Health check

```
mcp__swag-mcp__swag
  action:      "health_check"
  server_name: (optional) Check specific service — omit for all
```

Probes whether proxied services are accessible.

---

## Typical Workflows

### Expose a new service
1. `action: "list"` — confirm no existing config for the service
2. `action: "create"` — create the config with upstream URL and auth method
3. `action: "health_check"` — verify the service is accessible

### Update a service's backend
1. `action: "view"` — confirm current config
2. `action: "update"` — set new upstream URL
3. `action: "health_check"` — verify

### Diagnose issues
1. `action: "health_check"` — check what's failing
2. `action: "logs"` — review error/access logs

---

## Destructive Operations

Always confirm before:
- `action: "remove"` — permanently deletes the proxy config
- `action: "edit"` — modifies existing config (non-reversible without backup)

---

## Proxy Confs Path

The server manages configs at the path configured via `SWAG_MCP_PROXY_CONFS_PATH` or the SSH URI in `SWAG_MCP_PROXY_CONFS_URI`. These are set via userConfig and synced to `.env` at SessionStart — no manual configuration needed.

---

## Notes

- `subdomain` configs require a wildcard DNS entry or per-subdomain record pointing to SWAG
- `subfolder` configs proxy via path prefix (e.g. `https://domain.com/sonarr/`)
- Auth methods: `authelia` and `authentik` require those services to be running and configured
- QUIC/HTTP3 requires ports 443/UDP to be open in addition to 443/TCP
