# Patterns Reference

Supplementary detail for patterns that are too specific to inline in SKILL.md but too important to omit entirely.

---

## Auth Variant Selection

Every `client.rs` constructor takes an `Auth` variant. Use the table below to pick the right one:

| Service auth style | `Auth` variant |
|--------------------|----------------|
| API key in a request header (e.g. `X-Api-Key`) | `Auth::ApiKey { header: "X-Api-Key".into(), key }` |
| Bearer token in `Authorization` header | `Auth::Bearer { token }` |
| HTTP basic auth (username + password) | `Auth::Basic { username, password }` |
| No auth required (public endpoints, health probes) | `Auth::None` |

**Common mistake:** Using `Auth::Bearer` for a service that expects `Auth::ApiKey` (or vice versa) produces silent 401s that are easy to miss in tests. Always confirm against the upstream API spec or the existing `lab-apis` client constructor.

Example for an API-key service:

```rust
pub fn client_from_env() -> Option<FooClient> {
    let url = env_non_empty("FOO_URL")?;
    let key = env_non_empty("FOO_API_KEY")?;
    FooClient::new(&url, Auth::ApiKey { header: "X-Api-Key".into(), key }).ok()
}
```

---

## Multi-Role Auth

Some services use different credentials for different operation classes (e.g. one token for sending, another for management). Model the multiple roles explicitly rather than creating multiple clients at call sites:

```rust
#[derive(Clone)]
pub struct FooClients {
    health: Arc<FooClient>,           // no auth — health probe only
    write:  Option<Arc<FooClient>>,   // write token
    read:   Option<Arc<FooClient>>,   // read/management token
}

impl FooClients {
    pub fn health(&self) -> &FooClient { &self.health }
    pub fn write(&self) -> Option<&FooClient> { self.write.as_deref() }
    pub fn read(&self) -> Option<&FooClient> { self.read.as_deref() }
}

pub fn clients_from_env() -> Option<FooClients> { ... }
pub fn not_configured_error() -> ToolError { ... }
```

See `crates/lab/src/dispatch/gotify/client.rs` for the reference implementation.

---

## `params.rs` Helper Inventory

Use helpers from `dispatch::helpers` — do not write custom extraction when a helper already exists:

| Helper | Signature | Purpose |
|--------|-----------|---------|
| `require_str` | `(params: &Value, key: &str) -> Result<&str, ToolError>` | Required string param — errors with `missing_param` if absent |
| `optional_str` | `(params: &Value, key: &str) -> Option<&str>` | Optional string param — `None` if absent |
| `require_i64` | `(params: &Value, key: &str) -> Result<i64, ToolError>` | Required integer param |
| `optional_u32` | `(params: &Value, key: &str) -> Result<Option<u32>, ToolError>` | Optional unsigned 32-bit integer |
| `optional_u32_max` | `(params: &Value, key: &str, max: u32) -> Result<Option<u32>, ToolError>` | Optional u32 with upper bound |
| `body_from_params` | `(params: &Value) -> Result<Value, ToolError>` | Serialize a sub-object as a request body |
| `object_without` | `(params: &Value, keys: &[&str]) -> Value` | Clone params with named keys stripped |

Usage example:

```rust
// params.rs
pub fn create_request_from_params(params: &Value) -> Result<CreateRequest, ToolError> {
    let name = require_str(params, "name")?.to_string();
    let priority = optional_u32(params, "priority")?;
    Ok(CreateRequest { name, priority })
}

// dispatch.rs arm — stays thin
"resource.create" => {
    let req = create_request_from_params(&params)?;
    to_json(client.create(req).await?)
}
```

---

## Stub Migration Procedure

Some services exist as stub dispatch files (~28 lines) — a flat `.rs` file that always returns `not_implemented`:

```rust
// dispatch/overseerr.rs — STUB
pub async fn dispatch(_action: &str, _params: Value) -> Result<Value, ToolError> {
    Err(ToolError::Sdk {
        sdk_kind: "not_implemented".into(),
        message: "overseerr dispatch not yet implemented".into(),
    })
}
```

**Migration steps:**

1. Delete the stub `.rs` file
2. Create the `dispatch/<service>/` directory with `catalog.rs`, `client.rs`, `params.rs`, `dispatch.rs`
3. Create the new `dispatch/<service>.rs` entry-point with submodule declarations, re-exports, and unit tests
4. Do **not** attempt to split a single large file after the fact — build directory-first from the start

**Before adding registry entries:** The stub registration in `mcp/registry.rs` and `api/services.rs` may already exist. Check for duplicates before adding new entries.

---

## Dispatch Test Naming Conventions

The three standard dispatch tests must be named:

1. `catalog_includes_<key>_actions` — verifies the catalog compiles and contains expected action names
2. `help_lists_<primary_action>` — smoke-tests the `help` action end to end
3. `dispatch_with_client_<describes_behavior>` — one `wiremock` round-trip proving the happy path works

Example:

```rust
#[test]
fn catalog_includes_foo_actions() {
    let names: Vec<_> = ACTIONS.iter().map(|a| a.name).collect();
    assert!(names.contains(&"resource.list"));
    assert!(names.contains(&"resource.get"));
}

#[tokio::test]
async fn help_lists_resource_list() {
    let result = dispatch("help", json!({})).await.unwrap();
    let text = result["text"].as_str().unwrap();
    assert!(text.contains("resource.list"));
}

#[tokio::test]
async fn dispatch_with_client_lists_resources() {
    let server = MockServer::start().await;
    Mock::given(method("GET")).and(path("/api/resources"))
        .respond_with(ResponseTemplate::new(200).set_body_json(json!([])))
        .mount(&server).await;
    let client = FooClient::new(&server.uri(), Auth::None).unwrap();
    let result = dispatch_with_client(client, "resource.list", json!({})).await;
    assert!(result.is_ok());
}
```

---

## Action Name Stability

Action names are part of the machine-facing public contract. Renaming an action is a spec change — it requires simultaneous updates to:

- `catalog.rs`
- `docs/coverage/<service>.md`
- Any docs that reference the action by name

Do not rename actions casually during iteration.
