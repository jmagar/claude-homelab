# Tailscale Skill

Manage your Tailscale tailnet.

## What It Does

**CLI (local operations):**
- **Status** — check connection status, peers, NAT type
- **Ping** — test connectivity to peers (direct vs relay)
- **File transfer** — send/receive files via Taildrop
- **Serve/Funnel** — expose local services privately or publicly
- **SSH** — connect via Tailscale SSH

**API (tailnet-wide):**
- **Devices** — list all devices, authorize/delete, set tags
- **Auth keys** — create reusable/ephemeral keys for new devices
- **DNS** — manage nameservers, toggle MagicDNS
- **ACLs** — view and validate access control policies

## Setup

### CLI Only (No Config Needed)

The `tailscale` CLI works out of the box for local operations:

```bash
tailscale status
tailscale ping my-server
tailscale file cp document.pdf my-phone:
```

### API Access (for Tailnet-wide Operations)

#### 1. Create an API Key

1. Go to [Tailscale Admin Console](https://login.tailscale.com/admin/settings/keys)
2. Click **Generate API Key**
3. Copy the key (starts with `tskey-api-`)

#### 2. Add to .env File

Add these variables to `~/.claude-homelab/.env`:

```bash
TAILSCALE_API_KEY="<your_tailscale_api_key>"
TAILSCALE_TAILNET="-"
```

The `TAILSCALE_TAILNET` can be:
- `-` (auto-detect from API key)
- Your organization name
- Your email domain

#### 3. Test It

```bash
./scripts/ts-api.sh devices
```

## Usage Examples

### Local CLI operations

```bash
# Status and diagnostics
tailscale status
tailscale netcheck

# Ping a peer
tailscale ping my-server

# Send a file
tailscale file cp myfile.txt my-phone:

# Expose a local service
tailscale serve 3000           # Private (tailnet only)
tailscale funnel 8080          # Public (internet)
```

### API operations

```bash
# List all devices
ts-api.sh devices
ts-api.sh devices --verbose

# Check who's online
ts-api.sh online

# Device details
ts-api.sh device my-server

# Create auth key
ts-api.sh create-key --reusable --tags tag:server --expiry 7d

# List auth keys
ts-api.sh keys

# Authorize/delete device
ts-api.sh authorize <device-id>
ts-api.sh delete <device-id>

# DNS management
ts-api.sh dns
ts-api.sh magic-dns on
```

## Environment Variables

All configuration is managed via `~/.claude-homelab/.env`:

```bash
TAILSCALE_API_KEY="tskey-api-..."
TAILSCALE_TAILNET="-"
```

Scripts automatically load credentials from this file.

## API Reference

Detailed API documentation is available in the `references/` directory:

- **[API Endpoints](./references/api-endpoints.md)** - Complete endpoint reference

## Troubleshooting

**"No API key configured"**
→ Add `TAILSCALE_API_KEY` and `TAILSCALE_TAILNET` to `~/.claude-homelab/.env`

**401 Unauthorized**
→ API key is invalid or expired — generate a new one

**"tailscale: command not found"**  
→ Install Tailscale: https://tailscale.com/download

**Device not found by name**  
→ The script searches by hostname. Use the full device ID if name lookup fails.

## License

MIT
