# Contracts Quick Reference

Condensed reference for the three contracts every service must honor. For the full spec, read the canonical docs in `docs/`.

---

## Error Contract (`docs/ERRORS.md`)

### Stable `kind` values from `lab-apis::core::ApiError`

| kind | meaning |
|------|---------|
| `auth_failed` | 401 / bad credentials |
| `not_found` | 404 |
| `rate_limited` | 429 |
| `validation_failed` | 422 from upstream |
| `network_error` | DNS, TCP, TLS, timeout |
| `server_error` | 5xx from upstream |
| `decode_error` | JSON decode failure |
| `internal_error` | unexpected / unhandled |

### Dispatcher-level kinds (added by dispatch layer)

| kind | when |
|------|------|
| `unknown_action` | action string not in catalog |
| `missing_param` | required param absent |
| `invalid_param` | param present but wrong type/value |
| `unknown_instance` | multi-instance label not recognized |
| `confirmation_required` | destructive action over HTTP without `confirm: true` |

### HTTP status mapping

| kind | status |
|------|--------|
| `auth_failed` | 401 |
| `not_found` | 404 |
| `rate_limited` | 429 |
| `validation_failed` / `missing_param` / `invalid_param` / `confirmation_required` | 422 |
| `unknown_action` / `unknown_instance` | 400 |
| `network_error` / `server_error` | 502 |
| `internal_error` | 500 |

### MCP error envelope

```json
{ "ok": false, "service": "foo", "action": "bar.get", "error": { "kind": "missing_param", "message": "missing parameter: id", "param": "id" } }
```

### HTTP error envelope

```json
{ "kind": "missing_param", "message": "missing parameter: id" }
```

### Placement rules

- `From<ServiceError> for ToolError` → `crates/lab/src/dispatch/error.rs`, feature-gated
- Never in `mcp/services/` or `api/services/`
- `ToolError` must not be constructed inside `lab-apis`

---

## Observability Contract (`docs/OBSERVABILITY.md`)

### Required dispatch event fields (all surfaces)

| field | type | notes |
|-------|------|-------|
| `surface` | `&str` | `"cli"` / `"mcp"` / `"api"` |
| `service` | `&str` | canonical service name |
| `action` | `&str` | dotted action name |
| `elapsed_ms` | `u128` | always |
| `kind` | `&str` | errors only — from `ToolError::kind()` |

HTTP additionally carries `request_id` when available.

### `HttpClient` emits automatically

- `request.start` — before every outbound call
- `request.finish` — on success (adds `status`, `elapsed_ms`)
- `request.error` — on failure (adds `elapsed_ms`, `kind`, `message`)

Every event includes `method`, `path`, `host`.

### Never log

- API keys, tokens, passwords, cookies, auth headers
- Request bodies or query params containing secrets
- The `params` object from dispatch (may contain credentials)

### Log levels

- `INFO` — successful dispatch and request completion
- `WARN` — caller/service errors (auth, not_found, validation, missing_param)
- `ERROR` — unhandled / internal failures

### Health probes

Must include `operation = "health"` in logs to be distinguishable from normal actions.

---

## Dispatch Contract (`docs/DISPATCH.md`)

### Allowed dependency direction

```
cli    → dispatch → lab-apis
mcp    → dispatch → lab-apis
api    → dispatch → lab-apis
```

**Forbidden:**
- `cli → mcp`
- `api → mcp`
- Any surface calling `lab-apis` directly

### What dispatch owns

- Operation catalog (`catalog.rs`)
- Param validation (`params.rs`)
- Client/instance resolution (`client.rs`)
- SDK calls (`dispatch.rs`)
- Surface-neutral results (`Result<Value, ToolError>`)
- `From<ServiceError> for ToolError` (`error.rs`)

### What dispatch does NOT own

- `clap` parsing
- MCP envelopes / tool registration
- HTTP status codes / axum response types
- Table rendering

### Return type

```rust
Result<serde_json::Value, ToolError>
```

### Catalog ownership

`catalog.rs` is the single source. MCP, CLI, and API re-export or reference `ACTIONS`. Never copy the array — two lists drift and elicitation silently skips newly-added destructive actions.

### Multi-instance pattern

When a service supports multiple instances:
- Default: read `<SERVICE>_URL` / `<SERVICE>_TOKEN`
- Named: read `<SERVICE>_<LABEL>_URL` / `<SERVICE>_<LABEL>_TOKEN`
- Unknown label → `ToolError::UnknownInstance { valid: vec![...] }`

---

## Testing Contract (`docs/TESTING.md`)

### TDD rule

Write the failing test **before** the implementation. This is mandatory, not optional.

### Minimum test coverage per layer

```
lab-apis/         → wiremock-based unit tests (CI-safe)
dispatch/         → no HTTP, test action matching + param validation
mcp/services/     → catalog shape, destructive flags, envelope
api/services/     → status codes, JSON shape
cli/              → arg parsing, --json output shape
```

### Commands

```bash
just test                  # full workspace (cargo-nextest)
cargo test -p lab-apis     # SDK only
cargo test -p lab          # dispatch + adapters
just lint                  # clippy -D warnings + fmt check
```

### Live verification (when possible)

- At least one successful read-only path against a real instance
- At least one failing path with expected stable `kind`
- Evidence that the path is traceable in logs
