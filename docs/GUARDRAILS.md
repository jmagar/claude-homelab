# Security Guardrails -- homelab-core

Safety and security patterns enforced across the homelab ecosystem.

## Credential management

### Storage

- All credentials in `~/.claude-homelab/.env` with `chmod 600` permissions
- Never commit `.env` or any file containing secrets
- Use `.env.example` as a tracked template with placeholder values only
- Generate tokens with `openssl rand -hex 32`

### Ignore files

`.gitignore` must include:

```
.env
*.secret
credentials.*
*.pem
*.key
```

### Credential loading pattern

All scripts must use the shared library:

```bash
source "$HOME/.claude-homelab/load-env.sh"
load_env_file || exit 1
validate_env_vars "SERVICE_URL" "SERVICE_API_KEY"
```

Never source `.env` directly. Never hardcode credentials.

### Credential rotation

1. Generate new value (API key, token, password)
2. Update `~/.claude-homelab/.env`
3. Restart affected services: `just restart <plugin>`
4. Verify: `just health`

## Script security

### Strict mode

All bash scripts must start with:

```bash
#!/bin/bash
set -euo pipefail
```

### Variable quoting

Always quote variables to prevent word splitting and glob expansion:

```bash
curl -sf "$SERVICE_URL/health"    # correct
curl -sf $SERVICE_URL/health      # wrong
```

### Input sanitization

- Validate and sanitize all user-supplied parameters
- Use parameterized queries -- never string-interpolate user input into URLs or commands
- Reject unexpected parameter types early

See `docs/references/security-patterns.md` for detailed patterns covering command injection prevention, URL encoding, SQL injection prevention, API key protection, path traversal prevention, and JSON response parsing.

## Network security

### HTTPS in production

- All service URLs should use `https://` in production
- Use valid TLS certificates (Let's Encrypt via SWAG or similar)
- HTTP is acceptable only for local development
- Check certificate expiry: `just certs`

### MCP server authentication

External MCP servers support bearer token authentication for HTTP transport:

- Token sent as `Authorization: Bearer <token>` header
- Disable only behind a trusted reverse proxy (`*_MCP_NO_AUTH=true`)
- Audit security posture: `just mcp-security`

The MCP security audit checks:
- TLS status and certificate expiry
- Unauthenticated access probes
- Bearer token validation
- OAuth discovery metadata
- RFC 9728 protected resource metadata
- Health endpoint accessibility

## Destructive operations

Actions that delete or modify data irreversibly are gated in MCP plugins:

- Tool calls require `confirm=True` parameter
- Server-wide bypass via `ALLOW_DESTRUCTIVE=true` (automated environments only)
- `ALLOW_YOLO=true` is an alias

Never enable destructive bypass in production without understanding the implications.

## Docker security (external MCP plugins)

### Non-root execution

MCP plugin containers run as non-root (UID/GID 1000 by default). Override with `PUID` and `PGID`.

### No baked environment

Docker images must not contain credentials at build time:
- No `ENV SERVICE_API_KEY=...` in Dockerfile
- No `COPY .env` in Dockerfile
- Credentials injected at runtime via `--env-file` or `environment:` in compose

## Logging

- Never log credentials, tokens, or API keys -- not even at DEBUG level
- Mask sensitive headers in request logs
- Rotate logs to prevent disk exhaustion
