---
name: lab-service-onboarding
description: This skill should be used when adding a new service integration to `lab`, finishing a partial one, migrating a dispatch stub to the full directory layout, or wiring any of the standard surfaces — `lab-apis`, dispatch, CLI, MCP, API, health, docs — into the repo's service contract. Trigger phrases include: "add a service", "onboard Foo", "wire up dispatch for Foo", "finish the Foo integration", "migrate the Foo stub", "add Foo to lab".
---

# Lab Service Onboarding

This skill summarizes the current `lab` service contract. The source of truth is:

- `CLAUDE.md`
- `docs/SERVICE_ONBOARDING.md`
- `docs/DISPATCH.md`
- `docs/OBSERVABILITY.md`
- `docs/ERRORS.md`
- `docs/SERIALIZATION.md`

If this skill disagrees with those docs, the docs win.

## Core Rule

Bringing a service online means:

- scaffold the service first with `lab scaffold service`
- audit the onboarding contract with `lab audit onboarding`
- prefer `lab_admin` only for read-only onboarding audit access, and only when `LAB_ADMIN_ENABLED=1`
- `lab-apis` owns the service logic
- `dispatch/<service>/` is the shared semantic layer
- CLI, MCP, and API are thin adapters over dispatch
- health is implemented
- observability is present end to end
- docs are updated
- unit tests pass
- live CLI, MCP, and API smoke tests pass when possible

A service working on only one surface is not done.

For new onboarding work, the expected order is:

1. verify the upstream spec exists in `docs/upstream-api/` (create or refresh it if not)
2. scaffold the service shape with `lab scaffold service`
3. run the onboarding audit with `lab audit onboarding`
4. fix the remaining contract gaps
5. finish with `cargo test --all-features` and the targeted smoke checks

## Build Assumption

This repo is verified as an all-features binary.

- Use `cargo build --all-features`
- Use `cargo nextest run --manifest-path crates/lab/Cargo.toml --all-features`
- Treat partial-feature warnings as diagnostic only until checked again in the all-features build

## Gather First

Before editing code, collect:

- service name
- display name
- upstream spec path in `docs/upstream-api/`
- auth style
- category
- required env vars
- optional env vars
- default port
- multi-instance behavior
- destructive actions

The upstream spec is the contract. If it does not exist, create or refresh it first.

## Required File Layout

### `lab-apis`

```
crates/lab-apis/src/<service>.rs
crates/lab-apis/src/<service>/client.rs
crates/lab-apis/src/<service>/types.rs
crates/lab-apis/src/<service>/error.rs
```

Rules:

- no `mod.rs`
- `client.rs` owns request construction, response parsing, and business logic
- `lab-apis` does not read env or config files
- request/response types live in `types.rs`
- service errors wrap `ApiError`
- implement `ServiceClient` for health checks

### `lab`

```
crates/lab/src/dispatch/<service>.rs
crates/lab/src/dispatch/<service>/catalog.rs
crates/lab/src/dispatch/<service>/client.rs
crates/lab/src/dispatch/<service>/params.rs
crates/lab/src/dispatch/<service>/dispatch.rs
crates/lab/src/cli/<service>.rs
crates/lab/src/mcp/services/<service>.rs
crates/lab/src/api/services/<service>.rs
```

Registry and wiring:

- `crates/lab/src/cli.rs`
- `crates/lab/src/mcp/services.rs` — `pub mod <service>;` module declaration
- `crates/lab/src/mcp/registry.rs` — runtime tool registration
- `crates/lab/src/api/services.rs`
- `crates/lab/src/api/router.rs`
- `crates/lab/src/api/state.rs`
- `crates/lab/src/tui/metadata.rs`

## Dispatch Contract

Every onboarded service uses the directory-first dispatch layout above.

### Entry-point: `dispatch/<service>.rs`

Responsibilities only:

- declare `mod catalog; mod client; mod dispatch; mod params;`
- re-export `ACTIONS`
- re-export `client_from_env`
- re-export `dispatch`
- re-export `dispatch_with_client`
- own unit tests

Typical shape:

```rust
mod catalog;
mod client;
mod dispatch;
mod params;

pub use catalog::ACTIONS;
#[allow(unused_imports)]
pub use client::{client_from_env, not_configured_error};
#[allow(unused_imports)]
pub use dispatch::{dispatch, dispatch_with_client};
```

The `#[allow(unused_imports)]` annotations are required. Not every compilation path (e.g. a narrow feature slice) exercises all re-exports, and clippy will fail the build without this annotation.

### `dispatch.rs`

Must expose both:

- `dispatch(action, params)` for CLI and MCP
- `dispatch_with_client(client, action, params)` for API

`dispatch(...)` must handle:

- `help`
- `schema`
- unknown action errors

`dispatch_with_client(...)` owns the service action routing.

### `catalog.rs`

`ACTIONS` is the single source of truth.

Important:

- include `help`
- include `schema`
- mark destructive actions accurately

### `client.rs`

Owns:

- env reads via `dispatch::helpers::env_non_empty`
- auth construction
- instance resolution
- client construction
- `not_configured_error()`

Expose:

- `client_from_env()`
- `require_client()`
- `not_configured_error()`

The API handler must use `not_configured_error()` instead of duplicating an error string.

**Choosing the right `Auth` variant** — see `references/patterns.md` for the full table. Common mapping:

| Service auth style | `Auth` variant |
|--------------------|----------------|
| API key in a request header (e.g. `X-Api-Key`) | `Auth::ApiKey { header: "X-Api-Key".into(), key }` |
| Bearer token in `Authorization` header | `Auth::Bearer { token }` |
| HTTP basic auth | `Auth::Basic { username, password }` |
| No auth (public endpoints, health probes) | `Auth::None` |

Using `Auth::Bearer` for a service that expects `Auth::ApiKey` (or vice versa) produces silent 401s that are easy to miss in tests. Confirm against the upstream API spec.

### `params.rs`

All coercion from `serde_json::Value` to typed SDK requests lives here.

Do not inline multi-step param coercion in `dispatch.rs`.

Use the helpers from `dispatch::helpers` — do not write custom extraction when a helper already exists:

| Helper | Purpose |
|--------|---------|
| `require_str(params, "key")` | Required string param — errors if absent |
| `optional_str(params, "key")` | Optional string param — `None` if absent |
| `require_i64(params, "key")` | Required integer param |
| `optional_u32(params, "key")` | Optional unsigned 32-bit integer |
| `optional_u32_max(params, "key", max)` | Optional u32 with upper bound |
| `body_from_params(params)` | Serialize a sub-object as a request body |
| `object_without(params, &["key"])` | Clone params with named keys stripped |

## Adapter Contract

### CLI

CLI shims are thin:

- parse args with `clap`
- call `dispatch::<service>::dispatch()`
- format via the shared output layer
- do not call `lab-apis` directly

### MCP

The MCP adapter is a forwarder:

```rust
pub use crate::dispatch::<service>::ACTIONS;

pub async fn dispatch(action: &str, params: Value) -> Result<Value, ToolError> {
    crate::dispatch::<service>::dispatch(action, params).await
}
```

No business logic in `mcp/services/<service>.rs`.

### API

The API handler is a thin adapter over `handle_action(...)`.

It must:

- pull the prebuilt client from `AppState`
- call `handle_action("<service>", "api", request_id, req, ACTIONS, ...)`
- use `not_configured_error()` when the client is absent
- call `dispatch_with_client(...)`

The API surface label is `surface = "api"`.

Do not invent alternate wrappers or call `require_client()` in API handlers.

## Error Contract

- `lab-apis` uses `ApiError`
- service errors wrap `ApiError`
- `From<ServiceError> for ToolError` lives only in `crates/lab/src/dispatch/error.rs`, feature-gated
- use the `impl_tool_error_from!` macro defined there — do not write the impl by hand:

```rust
// In crates/lab/src/dispatch/error.rs:
#[cfg(feature = "foo")]
impl_tool_error_from!(lab_apis::foo::FooError);
```

- do not place conversion impls in CLI, MCP, or API modules

Stable shared kinds come from `ApiError::kind()`.

## Observability Contract

Dispatch must emit structured logs for:

- CLI
- MCP
- API

Required dispatch fields:

- `surface`
- `service`
- `action`
- `elapsed_ms`
- `kind` on error

API also includes `request_id`.

`HttpClient` must emit:

- `request.start`
- `request.finish`
- `request.error`

Health probes must log `operation = "health"`.

Never log params, secrets, headers, tokens, cookies, or secret env values.

## Docs Contract

Always update:

- `docs/coverage/<service>.md`

Update these when applicable:

- `docs/README.md`
- `docs/CONFIG.md`
- `docs/SERVICES.md`
- `docs/MCP.md`
- `docs/CLI.md`
- shared contract docs if the shared behavior changes

## Required Tests

**Test order is mandatory:** write the failing test before the implementation. This is not optional — see `references/contracts.md`.

### SDK tests

Use `wiremock` for:

- one success path
- one error/transport path

### Dispatch unit tests

Every service entry-point should have at least these three tests, named by convention:

1. `catalog_includes_<key>_actions` — verifies the catalog compiles and contains the expected action names
2. `help_lists_<primary_action>` — smoke-tests the `help` action end to end
3. `dispatch_with_client_<describes_behavior>` — one `wiremock` round-trip proving the happy path works

Also cover:

- failing-path test such as unknown action

### Adapter tests

When touched, cover:

- MCP success/error envelope behavior
- API success/error behavior

## Required Live Verification

For HTTP-backed services, a service is not done until all three surfaces have been smoke-tested live when possible:

- CLI
- MCP via `mcporter`
- API via `curl`

Also verify:

- `lab health`
- request logs

Use `cargo nextest run --manifest-path crates/lab/Cargo.toml --all-features` as the standard test runner.

## Migrating a Stub

Some services exist as stub dispatch files (~28 lines) — a flat `.rs` file that always returns `not_implemented`. When migrating to a full implementation:

1. Delete the stub `.rs` file
2. Create the `dispatch/<service>/` directory with `catalog.rs`, `client.rs`, `params.rs`, `dispatch.rs`
3. Create the new `dispatch/<service>.rs` entry-point with submodule declarations, re-exports, and unit tests
4. Do **not** attempt to split from a single large file after the fact — build directory-first from the start

The stub registration in `mcp/registry.rs` and `api/services.rs` may already exist. **Check before adding duplicate entries.**

## Common Failure Modes

- putting business logic in CLI, MCP, or API files
- omitting `help` / `schema` from `ACTIONS`
- forgetting `not_configured_error()`
- API handler calling `require_client()` instead of using `AppState`
- env reads outside `dispatch/<service>/client.rs`
- `From<ServiceError> for ToolError` added anywhere except `dispatch/error.rs` (use `impl_tool_error_from!` macro)
- skipping live CLI/MCP/API smoke checks
- deleting shared helpers because they look unused in a narrow feature slice
- adding `pub mod <service>` to `api/services.rs` but not to `mcp/services.rs` (or vice versa)
- building a stub migration as one large file instead of directory-first from the start
- writing `From<ServiceError> for ToolError` by hand instead of using the `impl_tool_error_from!` macro

## Practical Workflow

Use this order:

1. verify or add the upstream spec in `docs/upstream-api/`
2. scaffold the service shape with `lab scaffold service`
3. run the onboarding audit with `lab audit onboarding`
4. create `lab-apis` files
5. implement client methods
6. implement observability and health
7. add feature gates
8. create dispatch module
9. wire CLI
10. wire MCP
11. wire API
12. register everywhere
13. update docs
14. run unit tests
15. run live CLI, MCP, API, and health verification

## When Updating This Skill

If `docs/SERVICE_ONBOARDING.md` changes, re-check this skill against:

- dispatch file layout
- API handler shape
- `not_configured_error()` usage
- required tests
- required live verification
- docs update list
- all-features verification guidance
