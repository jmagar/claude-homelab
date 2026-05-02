# ByteStash Troubleshooting

Common issues and fixes for `skills/bytestash/scripts/bytestash-api.sh`.

## DNS/Connectivity Errors

### Symptom
`curl: (6) Could not resolve host: bytestash.example.com`

### Checks
```bash
nslookup bytestash.example.com
curl -I https://bytestash.example.com
```

### Fixes
- Verify DNS/VPN/Tailscale connectivity to the host.
- Confirm `BYTESTASH_URL` in `.env` points to a reachable address.
- If using an internal domain, test with the service IP directly.

## Authentication Failures

### Symptom
`HTTP 401` or `HTTP 403`

### Checks
```bash
grep '^BYTESTASH_' ~/.claude-homelab/.env
```

### Fixes
- Regenerate API key in ByteStash Settings -> API Keys.
- Replace `BYTESTASH_API_KEY` in `.env`.
- Ensure no extra spaces or quote mismatches in `.env`.

## Empty or Invalid JSON Output

### Symptom
- `jq` parse errors
- blank output for list/get/search

### Checks
```bash
./scripts/bytestash-api.sh list
echo $?
```

### Fixes
- Run command without `jq` first to inspect raw API output.
- Check upstream reverse proxy/auth middleware response pages.
- Validate ByteStash service health in browser.

## Share API Issues

### Symptom
`share`, `shares`, `unshare`, or `view-share` fails with auth errors.

### Cause
Some ByteStash deployments require JWT auth for share endpoints instead of API keys.

### Fixes
- Confirm your instance share endpoint auth mode in `/api-docs`.
- If JWT-only, use web UI for share management or extend the script with login/JWT flow.

## Permission and Script Execution Errors

### Symptom
`Permission denied` when running script.

### Fix
```bash
chmod +x ~/claude-homelab/skills/bytestash/scripts/bytestash-api.sh
```
