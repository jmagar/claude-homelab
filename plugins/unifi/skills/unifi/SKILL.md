---
name: unifi
description: This skill should be used when the user needs to inspect or manage UniFi network infrastructure, including connected clients and devices, network health, firewall rules, WiFi configuration, port forwarding, DPI statistics, rogue APs, speedtest results, network events, or management actions such as blocking clients, restarting APs, or locating devices.
---

# UniFi Skill

Manages UniFi network infrastructure via the `unifi` action-router tool (and `unifi_help` for discovery).

## Mode Detection

**MCP mode** (preferred): Use when `mcp__claude_ai_Unifi__unifi` (or `mcp__unifi-mcp__unifi`) tools are available. The server handles UniFi controller authentication internally — session cookies are managed server-side.

**HTTP fallback mode**: UniFi requires session-based authentication (login → cookie → requests). This is complex to replicate in curl. **Strongly prefer keeping the MCP server running.** For emergencies only, see fallback section below.

**Transport**: Controlled by `UNIFI_MCP_TRANSPORT` env var — `http` (default, port 8001) or `stdio`.

**MCP URL**: `${user_config.unifi_mcp_url}` (default `http://localhost:8001/mcp`)

---

## MCP Mode — Tool Reference

All operations go through two tools:

- **`unifi`** — action router: `{"action": "<action_name>", ...params}`
- **`unifi_help`** — list available actions and their parameters

### Clients

```
unifi  action=get_clients
  connected_only  (optional) true/false — default true
  site_name       (optional) default "default"

unifi  action=block_client
  mac        (required) Client MAC address — DESTRUCTIVE, confirm before use
  site_name  (optional) default "default"

unifi  action=unblock_client
  mac        (required) Client MAC address
  site_name  (optional) default "default"

unifi  action=reconnect_client
  mac        (required) Client MAC address
  site_name  (optional) default "default"

unifi  action=forget_client
  mac        (required) Client MAC address — DESTRUCTIVE, removes from history
  site_name  (optional) default "default"

unifi  action=set_client_name
  mac   (required) Client MAC address
  name  (required) New display name
  site_name  (optional) default "default"

unifi  action=set_client_note
  mac   (required) Client MAC address
  note  (required) Note text
  site_name  (optional) default "default"
```

### Devices

```
unifi  action=get_devices
  site_name  (optional) default "default"

unifi  action=get_device_by_mac
  mac        (required) Device MAC address
  site_name  (optional) default "default"

unifi  action=restart_device
  mac        (required) Device MAC address — DESTRUCTIVE, causes brief outage
  site_name  (optional) default "default"

unifi  action=locate_device
  mac        (required) Device MAC address — flashes LED for identification
  site_name  (optional) default "default"
```

### Network

```
unifi  action=get_sites
  (no parameters)

unifi  action=get_wlan_configs
  site_name  (optional) default "default"

unifi  action=get_network_configs
  site_name  (optional) default "default"

unifi  action=get_port_configs
  site_name  (optional) default "default"

unifi  action=get_port_forwarding_rules
  site_name  (optional) default "default"

unifi  action=get_firewall_rules
  site_name  (optional) default "default"

unifi  action=get_firewall_groups
  site_name  (optional) default "default"

unifi  action=get_static_routes
  site_name  (optional) default "default"
```

### Monitoring

```
unifi  action=get_controller_status
  (no parameters)

unifi  action=get_events
  limit      (optional) default 100
  site_name  (optional) default "default"

unifi  action=get_alarms
  active_only  (optional) default true
  site_name    (optional) default "default"

unifi  action=get_dpi_stats
  by_filter  (optional) "by_app" or "by_cat" — default "by_app"
  site_name  (optional) default "default"

unifi  action=get_rogue_aps
  site_name  (optional) default "default"
  limit      (optional) default 20

unifi  action=get_speedtest_results
  site_name  (optional) default "default"
  limit      (optional) default 20

unifi  action=start_spectrum_scan
  mac        (required) Access point MAC address — long-running operation
  site_name  (optional) default "default"

unifi  action=get_spectrum_scan_state
  mac        (required) Access point MAC address
  site_name  (optional) default "default"

unifi  action=authorize_guest
  mac        (required) Guest client MAC address
  site_name  (optional) default "default"
```

---

## Destructive Operations — Confirmation Required

Always confirm with the user before executing:
- `block_client` — blocks network access for a device
- `forget_client` — removes client from controller history
- `restart_device` — reboots an AP or switch, causes brief outage

---

## Example Workflows

**Check who's connected:**
```
unifi  action=get_clients  connected_only=true
```

**Block a client by MAC:**
```
# Confirm with user first
unifi  action=block_client  mac=aa:bb:cc:dd:ee:ff
```

**Restart an access point:**
```
# Confirm with user first — causes brief outage
unifi  action=restart_device  mac=aa:bb:cc:dd:ee:ff
```

**Check network health / controller status:**
```
unifi  action=get_controller_status
unifi  action=get_alarms  active_only=true
```

**View firewall rules:**
```
unifi  action=get_firewall_rules
unifi  action=get_firewall_groups
```

**Run a speedtest (view results):**
```
unifi  action=get_speedtest_results  limit=5
```

**Discover available actions:**
```
unifi_help
```

---

## HTTP Fallback Mode

UniFi uses session-based auth. For emergency fallback only:

```bash
# Step 1: Login and capture cookie
COOKIE_JAR=$(mktemp)
curl -s -X POST "$CLAUDE_PLUGIN_OPTION_UNIFI_CONTROLLER_URL/api/auth/login" \
  -H "Content-Type: application/json" \
  -k --cookie-jar "$COOKIE_JAR" \
  -d "{\"username\":\"$CLAUDE_PLUGIN_OPTION_UNIFI_USERNAME\",\"password\":\"$CLAUDE_PLUGIN_OPTION_UNIFI_PASSWORD\"}"

# Step 2: Use session for requests
curl -s "$CLAUDE_PLUGIN_OPTION_UNIFI_CONTROLLER_URL/proxy/network/api/s/default/stat/sta" \
  -k --cookie "$COOKIE_JAR"
```

---

## Notes

- `site_name` defaults to `"default"` for most single-site deployments
- `start_spectrum_scan` is long-running — poll `get_spectrum_scan_state` for results
- Controller URL typically ends in `:443` for UDM Pro / Cloud Key Gen2+
- SSL verification is usually disabled for self-signed controller certs (handled server-side)
- Transport mode (`http` vs `stdio`) is set via `UNIFI_MCP_TRANSPORT` env var; default is `http` on port 3003
