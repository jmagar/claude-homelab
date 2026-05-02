# Tailscale API Reference

**API Version:** v2
**Base URL:** `https://api.tailscale.com/api/v2`
**Authentication:** Bearer token (API key)
**Last Updated:** 2026-02-01

## Authentication

Tailscale uses Bearer token authentication. You can generate API keys from the Tailscale admin console under Settings → Keys.

```bash
-H "Authorization: Bearer $TAILSCALE_API_KEY"
```

API keys can have different scopes:
- Read-only: View tailnet information
- Read-write: Modify tailnet configuration
- Device-specific: Limited to specific devices

## Quick Start

Add credentials to `~/.claude-homelab/.env`:

```bash
TAILSCALE_API_KEY="tskey-api-xxxxx"
TAILSCALE_TAILNET="-"  # or use your tailnet name
```

Scripts automatically load these variables. For manual curl commands:

```bash
# Load from .env
source ~/.claude-homelab/.env

# Test connection - list devices
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILSCALE_TAILNET/devices" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" | jq
```

## Endpoints by Category

### Devices

#### GET /tailnet/{tailnet}/devices

List all devices in the tailnet.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" for default |

**Example Request:**
```bash
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILNET/devices" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

**Example Response:**
```json
{
  "devices": [
    {
      "addresses": ["100.64.0.1"],
      "authorized": true,
      "hostname": "my-device",
      "id": "12345",
      "name": "my-device.tailnet.ts.net",
      "nodeId": "n123abc",
      "os": "linux",
      "user": "user@example.com",
      "lastSeen": "2026-02-01T10:00:00Z",
      "created": "2025-01-01T00:00:00Z",
      "expires": "2026-07-01T00:00:00Z",
      "keyExpiryDisabled": false,
      "updateAvailable": false
    }
  ]
}
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized (invalid API key)
- `403`: Forbidden (insufficient permissions)
- `404`: Tailnet not found

---

#### GET /device/{deviceId}

Get details for a specific device.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| deviceId (path) | string | Yes | Device ID (from devices list) |

**Example Request:**
```bash
curl -s "https://api.tailscale.com/api/v2/device/12345" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized
- `404`: Device not found

---

#### POST /device/{deviceId}/authorized

Authorize or deauthorize a device.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| deviceId (path) | string | Yes | Device ID |
| authorized (body) | boolean | Yes | true to authorize, false to deauthorize |

**Example Request:**
```bash
curl -X POST "https://api.tailscale.com/api/v2/device/12345/authorized" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"authorized": true}'
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized
- `404`: Device not found

---

#### DELETE /device/{deviceId}

Remove a device from the tailnet.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| deviceId (path) | string | Yes | Device ID to remove |

**Example Request:**
```bash
curl -X DELETE "https://api.tailscale.com/api/v2/device/12345" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

**Response Codes:**
- `200`: Device deleted
- `401`: Unauthorized
- `404`: Device not found

---

### API Keys

#### GET /tailnet/{tailnet}/keys

List all API keys for the tailnet.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |

**Example Request:**
```bash
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILNET/keys" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

**Example Response:**
```json
{
  "keys": [
    {
      "id": "k123",
      "description": "CI/CD key",
      "created": "2025-01-01T00:00:00Z",
      "expires": "2026-01-01T00:00:00Z",
      "capabilities": {
        "devices": {
          "create": {
            "reusable": false,
            "ephemeral": false,
            "preauthorized": true
          }
        }
      }
    }
  ]
}
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized
- `403`: Forbidden

---

#### POST /tailnet/{tailnet}/keys

Create a new API key.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |
| capabilities (body) | object | Yes | Key capabilities |
| expirySeconds (body) | integer | No | Key expiry in seconds |
| description (body) | string | No | Human-readable description |

**Example Request:**
```bash
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILNET/keys" \
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
    "expirySeconds": 31536000,
    "description": "New automation key"
  }'
```

**Response Codes:**
- `201`: Key created
- `400`: Bad request (invalid capabilities)
- `401`: Unauthorized

---

#### DELETE /api/v2/tailnet/{tailnet}/keys/{keyId}

Delete an API key.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |
| keyId (path) | string | Yes | Key ID to delete |

**Example Request:**
```bash
curl -X DELETE "https://api.tailscale.com/api/v2/tailnet/$TAILNET/keys/k123" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

**Response Codes:**
- `200`: Key deleted
- `401`: Unauthorized
- `404`: Key not found

---

### ACLs

#### GET /tailnet/{tailnet}/acl

Get the current ACL policy.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |

**Example Request:**
```bash
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILNET/acl" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

**Example Response:**
```json
{
  "acls": [
    {
      "action": "accept",
      "src": ["group:admin"],
      "dst": ["*:*"]
    }
  ],
  "groups": {
    "group:admin": ["user@example.com"]
  }
}
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized
- `403`: Forbidden

---

#### POST /tailnet/{tailnet}/acl

Update the ACL policy.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |
| acls (body) | array | Yes | ACL rules |
| groups (body) | object | No | Group definitions |
| hosts (body) | object | No | Host definitions |

**Example Request:**
```bash
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILNET/acl" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "acls": [
      {
        "action": "accept",
        "src": ["group:admin"],
        "dst": ["*:*"]
      }
    ],
    "groups": {
      "group:admin": ["user@example.com"]
    }
  }'
```

**Response Codes:**
- `200`: ACL updated
- `400`: Invalid ACL syntax
- `401`: Unauthorized
- `403`: Forbidden

---

#### POST /tailnet/{tailnet}/acl/validate

Validate ACL policy without applying it.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |
| acls (body) | array | Yes | ACL rules to validate |

**Example Request:**
```bash
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILNET/acl/validate" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "acls": [
      {
        "action": "accept",
        "src": ["*"],
        "dst": ["*:*"]
      }
    ]
  }'
```

**Response Codes:**
- `200`: Valid ACL
- `400`: Invalid ACL (response contains errors)
- `401`: Unauthorized

---

### DNS

#### GET /tailnet/{tailnet}/dns/nameservers

Get custom DNS nameservers.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |

**Example Request:**
```bash
curl -s "https://api.tailscale.com/api/v2/tailnet/$TAILNET/dns/nameservers" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY"
```

**Response Codes:**
- `200`: Success
- `401`: Unauthorized

---

#### POST /tailnet/{tailnet}/dns/nameservers

Set custom DNS nameservers.

**Parameters:**
| Name | Type | Required | Description |
|------|------|----------|-------------|
| tailnet (path) | string | Yes | Tailnet name or "-" |
| dns (body) | array | Yes | List of DNS nameserver IPs |

**Example Request:**
```bash
curl -X POST "https://api.tailscale.com/api/v2/tailnet/$TAILNET/dns/nameservers" \
  -H "Authorization: Bearer $TAILSCALE_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"dns": ["1.1.1.1", "8.8.8.8"]}'
```

**Response Codes:**
- `200`: Nameservers updated
- `400`: Invalid IP addresses
- `401`: Unauthorized

---

## Rate Limiting

The Tailscale API implements rate limiting:
- **Default:** 100 requests per minute per API key
- **Burst:** Up to 200 requests in short bursts

Rate limit headers in responses:
- `X-RateLimit-Limit`: Requests allowed per minute
- `X-RateLimit-Remaining`: Remaining requests
- `X-RateLimit-Reset`: Unix timestamp when limit resets

When rate limited:
- **Status Code:** 429 Too Many Requests
- **Response:** `{"message": "rate limit exceeded"}`

---

## Version History

| API Version | Doc Version | Date | Changes |
|-------------|-------------|------|---------|
| v2 | 1.0.0 | 2026-02-01 | Initial documentation |

## Additional Resources

- [Official API Documentation](https://tailscale.com/api)
- [Tailscale GitHub](https://github.com/tailscale/tailscale)
- [ACL Syntax Reference](https://tailscale.com/kb/1018/acls)
- [API Key Management](https://tailscale.com/kb/1101/api)
