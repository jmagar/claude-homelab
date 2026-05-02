# Tailscale Troubleshooting Guide

Common issues and their solutions.

## Connection Issues

### Problem: Not Connecting Directly (Using DERP Relay)

**Symptoms:**
```bash
$ tailscale ping my-server
pong from my-server (100.x.x.x) via DERP(nyc) in 45ms
```

**Causes:**
- Both devices behind NAT/firewall
- UDP port 41641 blocked
- Symmetric NAT on one or both sides
- Firewall blocking WireGuard traffic

**Diagnosis:**
```bash
# Check NAT type and connectivity
tailscale netcheck

# Expected output for direct connection:
# * UDP: true
# * IPv4: yes, 1.2.3.4:41641
# * IPv6: no
# * MappingVariesByDestIP: false  # Good (not symmetric NAT)
# * HairPinning: false
```

**Solutions:**

1. **Open UDP port 41641** (if you control the firewall):
   ```bash
   # On Linux (ufw)
   sudo ufw allow 41641/udp

   # On Linux (iptables)
   sudo iptables -A INPUT -p udp --dport 41641 -j ACCEPT

   # On router: Forward UDP 41641 to your device IP
   ```

2. **Disable symmetric NAT** (router setting):
   - Access router admin panel
   - Look for "NAT Type" or "NAT Mode"
   - Change from "Symmetric" to "Port-Restricted Cone" or "Full Cone"

3. **Use Tailscale Subnet Router** (workaround):
   ```bash
   # On a device with better connectivity:
   tailscale up --advertise-routes=192.168.1.0/24

   # Approve in admin console
   # Other devices route through this device
   ```

4. **Accept relay if necessary**:
   - DERP relays are encrypted and secure
   - Latency typically adds 10-50ms
   - Better than no connection

---

### Problem: Device Not Appearing in Tailnet

**Symptoms:**
- `tailscale up` succeeds but device not in status
- Device not visible in admin console

**Diagnosis:**
```bash
# Check local status
tailscale status

# Check connection to control server
tailscale netcheck

# Check logs
journalctl -u tailscaled -n 50
# or
sudo tailscale debug daemon-logs
```

**Solutions:**

1. **Check if device needs authorization**:
   ```bash
   # Via API
   source ~/.claude-homelab/.env
   curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/devices" \
     -H "Authorization: Bearer $TAILSCALE_API_KEY" | \
     jq '.devices[] | select(.authorized == false)'

   # Authorize in admin console or via API
   ```

2. **Verify tailscaled is running**:
   ```bash
   # Check service status
   sudo systemctl status tailscaled

   # Start if stopped
   sudo systemctl start tailscaled

   # Enable on boot
   sudo systemctl enable tailscaled
   ```

3. **Re-authenticate**:
   ```bash
   # Log out and back in
   tailscale logout
   tailscale up
   ```

4. **Check key expiry**:
   ```bash
   tailscale status --json | jq '.Self.KeyExpiry'

   # Refresh auth
   tailscale up
   ```

---

### Problem: Authentication Failures

**Symptoms:**
- `tailscale up` shows login URL but auth fails
- "Failed to authenticate" errors

**Solutions:**

1. **Clear browser cookies and try again**:
   - Open login URL in private/incognito window
   - Complete authentication
   - Return to terminal

2. **Use auth key instead**:
   ```bash
   # Create auth key via API
   source ~/.claude-homelab/.env
   AUTH_KEY=$(curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/keys" \
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
       "expirySeconds": 3600
     }' | jq -r '.key')

   # Use auth key
   tailscale up --authkey=$AUTH_KEY
   ```

3. **Check firewall blocking control server**:
   ```bash
   # Test connectivity to control server
   curl -I https://controlplane.tailscale.com

   # Should return HTTP 200 or 301
   ```

4. **Update Tailscale client**:
   ```bash
   # Ubuntu/Debian
   sudo apt update && sudo apt upgrade tailscale

   # Fedora/RHEL
   sudo dnf upgrade tailscale

   # macOS
   brew upgrade tailscale
   ```

---

## DNS Issues

### Problem: MagicDNS Not Resolving

**Symptoms:**
```bash
$ ping hostname
ping: hostname: Name or service not known

$ ping hostname.tailnet.ts.net
ping: hostname.tailnet.ts.net: Name or service not known
```

**Diagnosis:**
```bash
# Check if MagicDNS is enabled
tailscale status --json | jq '.MagicDNSSuffix'

# Should return your tailnet domain (e.g., "tailnet-name.ts.net")
# If null, MagicDNS is disabled
```

**Solutions:**

1. **Enable MagicDNS**:
   ```bash
   # Via API
   source ~/.claude-homelab/.env
   curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/dns/preferences" \
     -H "Authorization: Bearer $TAILSCALE_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"magicDNS": true}'

   # Or enable in admin console: DNS → Enable MagicDNS
   ```

2. **Restart tailscaled**:
   ```bash
   sudo systemctl restart tailscaled

   # Wait a few seconds, then test
   ping hostname
   ```

3. **Check DNS configuration**:
   ```bash
   # Linux: Check /etc/resolv.conf
   cat /etc/resolv.conf | grep 100.100.100.100

   # Should see: nameserver 100.100.100.100
   # If not, Tailscale DNS not configured properly
   ```

4. **Force DNS configuration**:
   ```bash
   tailscale up --accept-dns=true
   ```

5. **Use full hostname as fallback**:
   ```bash
   # If short name fails, try full FQDN
   ping hostname.tailnet-name.ts.net

   # Or use IP directly
   tailscale status | grep hostname
   ping 100.x.x.x
   ```

---

### Problem: DNS Resolution Slow

**Symptoms:**
- Hostnames resolve but take 2-5 seconds
- First query slow, subsequent queries fast

**Solutions:**

1. **Add custom nameservers**:
   ```bash
   # Use faster upstream DNS
   source ~/.claude-homelab/.env
   curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/dns/nameservers" \
     -H "Authorization: Bearer $TAILSCALE_API_KEY" \
     -H "Content-Type: application/json" \
     -d '{"dns": ["1.1.1.1", "8.8.8.8"]}'
   ```

2. **Check DERP latency**:
   ```bash
   # High DERP latency affects DNS
   tailscale netcheck | grep latency
   ```

3. **Use local DNS cache**:
   ```bash
   # Install systemd-resolved (if not present)
   sudo apt install systemd-resolved
   sudo systemctl enable --now systemd-resolved
   ```

---

## Exit Node Issues

### Problem: Exit Node Not Working

**Symptoms:**
```bash
$ tailscale up --exit-node=my-exit-node
$ curl ifconfig.me
# Still shows local IP, not exit node IP
```

**Diagnosis:**
```bash
# Check exit node status
tailscale status | grep my-exit-node

# Check routing
ip route | grep 100.64.0.0
```

**Solutions:**

1. **Verify exit node is advertising**:
   ```bash
   # On exit node
   tailscale up --advertise-exit-node

   # Check status
   tailscale status --json | jq '.Self.AllowedIPs'
   # Should include "0.0.0.0/0" and "::/0"
   ```

2. **Approve exit node in admin console**:
   - Go to Machines → Your exit node
   - Click "Edit route settings"
   - Enable "Use as exit node"

3. **Enable IP forwarding on exit node**:
   ```bash
   # Linux
   echo 'net.ipv4.ip_forward = 1' | sudo tee -a /etc/sysctl.conf
   echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
   sudo sysctl -p
   ```

4. **Check NAT/masquerading on exit node**:
   ```bash
   # Add NAT rule if missing
   sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

   # Make persistent (Ubuntu/Debian)
   sudo apt install iptables-persistent
   sudo netfilter-persistent save
   ```

5. **Force exit node selection**:
   ```bash
   # Use device ID instead of name
   tailscale exit-node list
   tailscale up --exit-node=12345
   ```

---

## Serve and Funnel Issues

### Problem: Funnel Not Accessible from Internet

**Symptoms:**
- `tailscale funnel 8080` succeeds
- URL not accessible from external network

**Diagnosis:**
```bash
# Check funnel status
tailscale funnel status

# Test from external network
curl https://your-machine.your-tailnet.ts.net:8080
```

**Solutions:**

1. **Enable HTTPS in admin console**:
   - Go to DNS settings
   - Enable "HTTPS Certificates"
   - Wait 1-2 minutes for certificate provisioning

2. **Check port is allowed**:
   ```bash
   # Funnel requires specific ports: 443, 8443, 10000
   # Change your service port or use one of these

   tailscale funnel 443  # Standard HTTPS
   tailscale funnel 8443
   tailscale funnel 10000
   ```

3. **Verify service is listening**:
   ```bash
   # Check if your service is actually running
   sudo netstat -tlnp | grep :8080
   # or
   sudo ss -tlnp | grep :8080

   # Test locally first
   curl http://localhost:8080
   ```

4. **Use serve for internal testing first**:
   ```bash
   # Test with serve (tailnet-only)
   tailscale serve 8080

   # Verify from another device on tailnet
   curl https://your-machine.your-tailnet.ts.net:8080

   # If serve works, funnel should work
   tailscale funnel 8080
   ```

5. **Check TLS certificate**:
   ```bash
   # Get certificate info
   echo | openssl s_client -connect your-machine.your-tailnet.ts.net:443 -servername your-machine.your-tailnet.ts.net 2>/dev/null | openssl x509 -noout -text

   # Should show valid certificate from Let's Encrypt
   ```

---

### Problem: Serve Not Working Within Tailnet

**Symptoms:**
- `tailscale serve 3000` succeeds
- Other tailnet devices can't connect

**Solutions:**

1. **Use HTTPS not HTTP**:
   ```bash
   # Always use HTTPS for serve
   curl https://hostname:3000
   # Not: curl http://hostname:3000
   ```

2. **Check service binding**:
   ```bash
   # Service must listen on localhost or 0.0.0.0
   # Not just 127.0.0.1 or specific interface

   # Good:
   python -m http.server 3000 --bind 0.0.0.0

   # Also good:
   python -m http.server 3000  # defaults to 0.0.0.0
   ```

3. **Verify serve configuration**:
   ```bash
   tailscale serve status

   # Should show:
   # https://hostname:3000 -> http://localhost:3000
   ```

4. **Reset and reconfigure**:
   ```bash
   tailscale serve reset
   tailscale serve 3000
   tailscale serve status
   ```

---

## File Transfer (Taildrop) Issues

### Problem: File Transfer Fails

**Symptoms:**
```bash
$ tailscale file cp file.txt device:
file cp: device not found
```

**Solutions:**

1. **Use exact hostname**:
   ```bash
   # Get exact hostname from status
   tailscale status | grep device

   # Use exact name
   tailscale file cp file.txt exact-device-name:
   ```

2. **Check receiving device is online**:
   ```bash
   tailscale ping device
   ```

3. **Verify Taildrop is enabled**:
   ```bash
   # Taildrop enabled by default, but check ACLs
   # In admin console: Access Controls → autoApprovers
   ```

4. **Check disk space on receiver**:
   ```bash
   # On receiving device
   df -h ~
   ```

5. **Receive files manually**:
   ```bash
   # On receiving device
   tailscale file get ~/Downloads
   ```

---

### Problem: Can't Receive Files

**Symptoms:**
- Files sent successfully
- `tailscale file get` shows nothing

**Solutions:**

1. **Wait for transfer to complete**:
   ```bash
   # Use --wait to block until file arrives
   tailscale file get --wait ~/Downloads
   ```

2. **Check Taildrop directory**:
   ```bash
   # Default location varies by OS
   # Linux: ~/Downloads/Tailscale
   # macOS: ~/Downloads
   # Windows: %USERPROFILE%\Downloads

   ls -la ~/Downloads/
   ```

3. **Check file permissions**:
   ```bash
   # Ensure download directory is writable
   mkdir -p ~/Downloads
   chmod 755 ~/Downloads
   ```

---

## SSH Issues

### Problem: Tailscale SSH Not Working

**Symptoms:**
```bash
$ tailscale ssh user@hostname
ssh: connect to host hostname port 22: Connection refused
```

**Solutions:**

1. **Enable SSH on target device**:
   ```bash
   # On target device
   tailscale up --ssh

   # Verify
   tailscale status --json | jq '.Self.HostName, .Self.SSHHostKeys'
   ```

2. **Use correct username**:
   ```bash
   # Try without username (uses Tailscale identity)
   tailscale ssh hostname

   # Or specify user
   tailscale ssh user@hostname
   ```

3. **Check ACLs allow SSH**:
   ```bash
   # Get ACL
   source ~/.claude-homelab/.env
   curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/acl" \
     -H "Authorization: Bearer $TAILSCALE_API_KEY" | jq

   # Should have SSH rules, e.g.:
   # "ssh": [
   #   {
   #     "action": "accept",
   #     "src": ["autogroup:members"],
   #     "dst": ["autogroup:self"],
   #     "users": ["autogroup:nonroot"]
   #   }
   # ]
   ```

4. **Fall back to standard SSH**:
   ```bash
   # Use regular SSH over Tailscale IP
   ssh user@100.x.x.x
   ```

---

## Performance Issues

### Problem: Slow Transfer Speeds

**Diagnosis:**
```bash
# Check connection type
tailscale ping hostname
# Shows "direct" or "via DERP"

# Test bandwidth
# (requires iperf3 on both devices)
# On server:
iperf3 -s

# On client:
iperf3 -c 100.x.x.x
```

**Solutions:**

1. **Establish direct connection** (see "Not Connecting Directly" above)

2. **Check for packet loss**:
   ```bash
   tailscale ping -c 100 hostname
   # Look for packet loss percentage
   ```

3. **Try different DERP region**:
   ```bash
   # Check available regions
   tailscale netcheck

   # Currently no way to force specific DERP
   # But can disable specific regions via ACL
   ```

4. **Update Tailscale**:
   ```bash
   # Newer versions have performance improvements
   sudo apt update && sudo apt upgrade tailscale
   ```

---

## General Debugging

### Enable Debug Logging

```bash
# Linux (systemd)
sudo systemctl edit tailscaled
# Add:
# [Service]
# Environment="TS_DEBUG_LOG=1"

sudo systemctl restart tailscaled

# View logs
journalctl -u tailscaled -f

# macOS
sudo tailscaled --debug=true

# Windows (PowerShell as admin)
tailscaled --debug=true
```

### Collect Diagnostic Info

```bash
# Network diagnostics
tailscale netcheck

# Status with all details
tailscale status --json | jq

# Recent logs
journalctl -u tailscaled -n 100

# DERP map
curl -s https://controlplane.tailscale.com/derpmap/default | jq

# Device info
tailscale whois $(tailscale ip -4)
```

### Reset Tailscale

```bash
# Nuclear option - removes all state
sudo systemctl stop tailscaled
sudo rm -rf /var/lib/tailscale/
sudo systemctl start tailscaled
tailscale up
```

### Contact Support

When filing support tickets, include:

```bash
# Run this and attach output
{
  echo "=== Tailscale Status ==="
  tailscale status --json

  echo "=== Network Check ==="
  tailscale netcheck

  echo "=== System Info ==="
  uname -a

  echo "=== Tailscale Version ==="
  tailscale version

  echo "=== Recent Logs ==="
  journalctl -u tailscaled -n 50
} > tailscale-debug.txt
```

## Common Error Messages

### "connection refused"

**Meaning:** Service not listening on target port

**Fix:** Check service is running and listening:
```bash
sudo netstat -tlnp | grep :PORT
```

### "no such host"

**Meaning:** MagicDNS not working or hostname wrong

**Fix:** Use IP address or enable MagicDNS:
```bash
tailscale up --accept-dns=true
```

### "tailscaled not running"

**Meaning:** Tailscale daemon not started

**Fix:**
```bash
sudo systemctl start tailscaled
sudo systemctl enable tailscaled
```

### "key has expired"

**Meaning:** Auth key or device key expired

**Fix:**
```bash
# Re-authenticate
tailscale up

# Or disable key expiry in admin console
```

### "permission denied"

**Meaning:** ACL blocking access

**Fix:** Update ACLs in admin console to allow access

### "rate limited"

**Meaning:** Too many API requests

**Fix:** Wait 60 seconds, add retry logic with backoff:
```bash
# Bash retry with exponential backoff
for i in {1..5}; do
  if curl -s "https://api.tailscale.com/api/v2/..." -H "Authorization: Bearer $TAILSCALE_API_KEY"; then
    break
  fi
  sleep $((2 ** i))
done
```
