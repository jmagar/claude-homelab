# SweetLink Configuration Reference

## Configuration file

Place `sweetlink.json` (or `sweetlink.config.json`) in your project root. SweetLink searches upward from the current working directory.

### Full schema

```json
{
  "appLabel": "My App",
  "appUrl": "http://localhost:4100",
  "prodUrl": "https://demo.example.com",
  "daemonUrl": "https://localhost:4455",
  "port": 4100,
  "adminKey": "your-admin-api-key",
  "devBootstrap": {
    "endpoint": "http://localhost:4100/api/dev-login",
    "loginPath": "/login"
  },
  "healthChecks": {
    "paths": ["/api/health"]
  },
  "cookieMappings": [
    {
      "hosts": ["app.example.dev", "*.example.dev"],
      "origins": ["https://app.example.dev"]
    }
  ],
  "smokeRoutes": {
    "defaults": ["/", "/dashboard", "/settings"],
    "presets": {
      "main": ["/", "/dashboard"],
      "settings": ["/settings", "/profile"],
      "billing-only": ["/billing"],
      "pulse-only": ["/pulse"]
    }
  },
  "servers": [],
  "oauthScript": "./scripts/oauth-handler.ts"
}
```

### Field descriptions

| Field | Type | Description |
|-------|------|-------------|
| `appLabel` | string | Friendly display name shown in logs and notifications |
| `appUrl` | string | Development server base URL (default: `http://localhost:3000`) |
| `prodUrl` | string | Production base URL — used by `smoke --env prod` |
| `daemonUrl` | string | Daemon location (default: `https://localhost:4455`) |
| `port` | number | Local dev server port (alternative to setting in `appUrl`) |
| `adminKey` | string | API authentication key for daemon requests |
| `devBootstrap.endpoint` | string | URL hit to bootstrap a dev session (auto-login) |
| `devBootstrap.loginPath` | string | Path to redirect unauthenticated requests to |
| `healthChecks.paths` | string[] | Probe these paths before confirming app readiness |
| `cookieMappings` | object[] | Map hostnames (including wildcards) to origins for cookie harvesting |
| `smokeRoutes.defaults` | string[] | Routes swept by `smoke` with no `--routes` flag |
| `smokeRoutes.presets` | object | Named route sets selectable with `--routes <preset>` |
| `servers` | object[] | Additional server definitions (multi-server setups) |
| `oauthScript` | string | Path to ESM module exporting `authorize(context)` |

---

## Environment variables

Environment variables override `sweetlink.json` values but are overridden by CLI flags.

| Variable | Equivalent config field | Description |
|----------|------------------------|-------------|
| `SWEETLINK_APP_URL` | `appUrl` | Dev application base URL |
| `SWEETLINK_DAEMON_URL` | `daemonUrl` | Daemon location |
| `SWEETLINK_PROD_URL` | `prodUrl` | Production base URL |
| `SWEETLINK_ADMIN_API_KEY` | `adminKey` | Admin API key (production) |
| `SWEETLINK_LOCAL_ADMIN_API_KEY` | `adminKey` | Admin API key (development) |
| `SWEETLINK_APP_LABEL` | `appLabel` | Display name |
| `SWEETLINK_OAUTH_SCRIPT` | `oauthScript` | Path to OAuth handler module |
| `SWEETLINK_PORT` | `port` | Local dev server port |
| `SWEETLINK_URL` | `appUrl` | Alias for app URL (legacy) |

Legacy `SWEETISTICS_*` variables are still accepted for backwards compatibility.

---

## Trust CA setup (one-time per machine)

The daemon requires TLS. SweetLink uses `mkcert` to generate a locally-trusted certificate.

**Prerequisites:**
```bash
brew install mkcert nss    # macOS — installs mkcert and NSS (for Firefox/Chrome trust)
```

**Install the CA:**
```bash
sweetlink trust-ca
```

This registers the mkcert root CA with the macOS system keychain and Chrome's trust store. Only needs to be run once per machine. After running, the daemon certificate at `https://localhost:4455` will be trusted without warnings.

**If you see TLS errors after running trust-ca:** try restarting Chrome and the daemon.

---

## OAuth handler module

The `oauthScript` field (or `--oauth-script` flag) points to an ESM module for custom consent automation. The module must export an `authorize` function:

```typescript
// oauth-handler.ts
export async function authorize(context: {
  origin: string;
  scopes: string[];
  page: Page;          // Playwright Page
}): Promise<boolean> {
  // Return true to approve, false to deny
  // SECURITY: validate origin and scopes before approving
  const allowed = APPROVED_ORIGINS.includes(context.origin);
  const safScopes = context.scopes.every(s => SAFE_SCOPES.includes(s));
  return allowed && safScopes;
}
```

Security guidance: always validate `context.origin` against a pre-approved allowlist and reject `offline_access`, `*.admin`, and `*all*` scopes. See SKILL.md security rules.
