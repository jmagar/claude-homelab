# Tailscale Quick Reference

Common operations for quick copy-paste usage.

## Setup

```bash
# CLI operations (local machine)
# No setup needed - uses local Tailscale daemon

# API operations (tailnet-wide)
# Add to ~/.claude-homelab/.env:
TAILSCALE_API_KEY="tskey-api-xxxxx"
TAILSCALE_TAILNET="-"  # or your organization name

# Scripts automatically load from .env
# For manual commands, source the file:
source ~/.claude-homelab/.env
```

## File Transfer (Taildrop)

### Send Files to Device

```bash
# Send single file
tailscale file cp document.pdf my-phone:

# Send multiple files
tailscale file cp file1.txt file2.jpg server-name:

# Send entire directory (zip first)
tar czf backup.tar.gz /path/to/dir
tailscale file cp backup.tar.gz backup-server:
```

### Receive Files

```bash
# Check for incoming files
tailscale file get

# Receive to specific directory
tailscale file get ~/Downloads

# Wait for incoming file (blocking)
tailscale file get --wait ~/Downloads
```

## Exit Node Management

### List Available Exit Nodes

```bash
# List all exit nodes
tailscale exit-node list

# Get suggested exit node (best performance)
tailscale exit-node suggest
```

### Connect to Exit Node

```bash
# Use specific exit node
tailscale up --exit-node=exit-node-name

# Use by IP
tailscale up --exit-node=100.x.x.x

# Use suggested exit node
tailscale up --exit-node=$(tailscale exit-node suggest)

# Disable exit node
tailscale up --exit-node=""
```

### Advertise as Exit Node

```bash
# Enable this device as exit node
tailscale up --advertise-exit-node

# Authorize in admin console, then verify
tailscale status
```

## SSH via Tailscale

### Connect to Remote Device

```bash
# SSH using MagicDNS hostname
tailscale ssh user@hostname

# SSH using Tailscale IP
tailscale ssh user@100.x.x.x

# SSH with options
tailscale ssh -o StrictHostKeyChecking=no user@hostname
```

### Enable SSH Server

```bash
# Enable SSH on this machine
tailscale up --ssh

# Check SSH status
tailscale status | grep SSH
```

### SSH Without Password (Tailscale Auth)

```bash
# Connect using Tailscale identity
tailscale ssh hostname

# No username needed - uses Tailscale identity
# No password needed - uses WireGuard keys
```

## Serve and Funnel (Expose Services)

### Serve Locally (Within Tailnet)

```bash
# Serve HTTP on port 3000
tailscale serve 3000

# Serve HTTPS from local service
tailscale serve https://localhost:8080

# Serve specific path
tailscale serve --set-path=/api localhost:8080

# Check what's being served
tailscale serve status

# Stop serving
tailscale serve reset
```

### Funnel to Internet (Public Access)

```bash
# Expose port 8080 to internet
tailscale funnel 8080

# Funnel with HTTPS from local service
tailscale funnel https://localhost:3000

# Check funnel status
tailscale funnel status

# Stop funnel
tailscale funnel reset
```

### Serve + Funnel Example

```bash
# Serve to tailnet only
tailscale serve 3000

# Also expose to internet
tailscale funnel 3000

# Verify
tailscale serve status
tailscale funnel status
```

## Device Management

### List Devices (CLI)

```bash
# List all peers
tailscale status

# JSON output for parsing
tailscale status --json | jq '.Peer | to_entries[] | {name: .value.HostName, ip: .value.TailscaleIPs[0], online: .value.Online}'

# Get this machine's IP
tailscale ip -4

# Get all IPs (IPv4 and IPv6)
tailscale ip
```

### Device Authorization (API)

```bash
# Load credentials
source ~/.claude-homelab/.env

# List all devices
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/devices" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | jq '.devices[] | {name, id, authorized, lastSeen}'

# Authorize device
curl -X POST "https://api.tailscale.com/api/v2/device/12345/authorized" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"authorized": true}'

# Remove device
curl -X DELETE "https://api.tailscale.com/api/v2/device/12345" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

### Device Details

```bash
# Get device info by IP
tailscale whois 100.x.x.x

# JSON output
tailscale whois --json 100.x.x.x | jq

# Get specific device (API)
curl -s "https://api.tailscale.com/api/v2/device/12345" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | jq
```

## Auth Key Creation

### Create Auth Key (API)

```bash
# Load credentials
source ~/.claude-homelab/.env

# Create reusable key (multiple devices)
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/keys" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "capabilities": {
      "devices": {
        "create": {
          "reusable": true,
          "ephemeral": false,
          "preauthorized": true,
          "tags": ["tag:server"]
        }
      }
    },
    "expirySeconds": 604800,
    "description": "Server deployment key"
  }' | jq -r '.key'

# Create ephemeral key (device auto-removes)
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/keys" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "capabilities": {
      "devices": {
        "create": {
          "reusable": false,
          "ephemeral": true,
          "preauthorized": true
        }
      }
    },
    "expirySeconds": 3600,
    "description": "Temporary access"
  }' | jq -r '.key'

# Create one-time key (single device)
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/keys" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "capabilities": {
      "devices": {
        "create": {
          "reusable": false,
          "ephemeral": false,
          "preauthorized": true
        }
      }
    },
    "expirySeconds": 86400
  }' | jq -r '.key'
```

### List Auth Keys

```bash
# Load credentials
source ~/.claude-homelab/.env

# Get all keys
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/keys" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | jq '.keys[] | {id, description, created, expires}'
```

### Delete Auth Key

```bash
# Load credentials
source ~/.claude-homelab/.env

curl -X DELETE "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/keys/k123" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

### Use Auth Key

```bash
# Join tailnet with auth key
tailscale up --authkey=tskey-auth-xxxxx

# With additional options
tailscale up --authkey=tskey-auth-xxxxx --advertise-exit-node --ssh
```

## Network Diagnostics

### Connectivity Testing

```bash
# Ping peer (shows direct vs relay)
tailscale ping hostname

# Ping with details
tailscale ping --verbose hostname

# Network check (NAT type, DERP servers)
tailscale netcheck

# JSON output
tailscale netcheck --format=json | jq
```

### Connection Status

```bash
# Check connection quality
tailscale status --peers

# Check for DERP relay usage
tailscale status | grep relay

# Check for direct connections
tailscale status | grep direct
```

## DNS Management

### MagicDNS Control (API)

```bash
# Load credentials
source ~/.claude-homelab/.env

# Get DNS configuration
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/dns/preferences" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | jq

# Enable MagicDNS
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/dns/preferences" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"magicDNS": true}'

# Set custom nameservers
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/dns/nameservers" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"dns": ["1.1.1.1", "8.8.8.8"]}'
```

### DNS Resolution

```bash
# Resolve using MagicDNS
nslookup hostname.tailnet-name.ts.net

# Test MagicDNS
dig hostname.tailnet-name.ts.net

# Get DNS config
tailscale status --json | jq '.MagicDNSSuffix'
```

## Workflows

### Workflow: Deploy New Server with Auth Key

1. **Create auth key:**
   ```bash
   # Load credentials
   source ~/.claude-homelab/.env

   AUTH_KEY=$(curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/keys" \
     -H "Authorization: Bearer $TAILSCALE_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{
       "capabilities": {
         "devices": {
           "create": {
             "reusable": true,
             "ephemeral": false,
             "preauthorized": true,
             "tags": ["tag:server"]
           }
         }
       },
       "expirySeconds": 604800
     }' | jq -r '.key')
   echo "Auth key: $AUTH_KEY"
   ```

2. **On new server:**
   ```bash
   # Install Tailscale
   curl -fsSL https://tailscale.com/install.sh | sh

   # Join with auth key
   tailscale up --authkey=$AUTH_KEY --ssh --advertise-tags=tag:server
   ```

3. **Verify connection:**
   ```bash
   tailscale status
   ```

### Workflow: Send Files to Multiple Devices

```bash
# List of devices
DEVICES=("phone" "laptop" "tablet")

# Send to all
for device in "${DEVICES[@]}"; do
  echo "Sending to $device..."
  tailscale file cp backup.tar.gz "$device:"
done
```

### Workflow: Route All Traffic Through Exit Node

```bash
# Find best exit node
EXIT_NODE=$(tailscale exit-node suggest)

# Connect
tailscale up --exit-node=$EXIT_NODE

# Verify public IP changed
curl ifconfig.me

# Check connection
tailscale status | grep "$EXIT_NODE"

# Disconnect
tailscale up --exit-node=""
```

### Workflow: Expose Local Dev Server to Internet

```bash
# Start your dev server (e.g., on port 3000)
npm run dev &

# Expose to internet with HTTPS
tailscale funnel 3000

# Get public URL
tailscale funnel status | grep https

# Share URL with others
# https://your-machine.your-tailnet.ts.net:3000

# Stop when done
tailscale funnel reset
```

### Workflow: Check Who's Online Now

```bash
# List online devices (CLI)
tailscale status | grep -v offline

# List online devices (API)
source ~/.claude-homelab/.env
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/devices" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | \
  jq '.devices[] | select(.lastSeen != null) | select((now - (.lastSeen | fromdateiso8601)) < 300) | {name, lastSeen}'
```

### Workflow: Audit Device Access

```bash
# Load credentials
source ~/.claude-homelab/.env

# List all devices with details
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/devices" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | \
  jq '.devices[] | {
    name,
    user,
    os,
    lastSeen,
    created,
    authorized,
    keyExpiryDisabled
  }'

# Find unauthorized devices
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/devices" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | \
  jq '.devices[] | select(.authorized == false) | {name, id, user}'
```

## Scripting Tips

### Check If Device Is Online

```bash
check_device_online() {
  local device=$1
  tailscale ping "$device" --c 1 --timeout 5s &>/dev/null
  return $?
}

if check_device_online "my-server"; then
  echo "Device is online"
else
  echo "Device is offline"
fi
```

### Get Device IP from Hostname

```bash
get_device_ip() {
  local hostname=$1
  tailscale status --json | jq -r ".Peer | to_entries[] | select(.value.HostName == \"$hostname\") | .value.TailscaleIPs[0]"
}

IP=$(get_device_ip "my-server")
echo "Server IP: $IP"
```

### Auto-Approve All Pending Devices

```bash
# Load credentials
source ~/.claude-homelab/.env

# Get all unauthorized devices
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/devices" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | \
  jq -r '.devices[] | select(.authorized == false) | .id' | \
  while read device_id; do
    echo "Authorizing device: $device_id"
    curl -X POST "https://api.tailscale.com/api/v2/device/$device_id/authorized" \
      -H "Authorization: Bearer $TAILSCALE_API_KEY" \
      -H "Content-Type: application/json" \
      -d '{"authorized": true}'
  done
```
