---
name: using-rmcp
version: "1.4"
description: >-
  This skill covers building, modifying, and debugging MCP (Model Context
  Protocol) servers and clients in Rust using the rmcp crate. It applies when
  the codebase imports `rmcp`; when defining tools, resources, or prompts with
  `#[tool]`, `#[tool_router]`, or `#[prompt_router]`; when choosing or wiring
  transports (stdio, TCP, Unix socket, HTTP Streamable); when implementing
  `ServerHandler` or `ClientHandler`; when sending progress notifications; or
  when a user asks to "add an MCP tool", "create an MCP server", "connect to
  an MCP server", or "implement a handler".
---

# rmcp Development Guide

## Cargo.toml Setup

### Server (stdio — most common)
```toml
[dependencies]
rmcp = { version = "1.4", features = ["server", "transport-io"] }
tokio = { version = "1", features = ["full"] }
serde = { version = "1", features = ["derive"] }
schemars = "1.0"
tracing = "0.1"
tracing-subscriber = { version = "0.3", features = ["env-filter"] }
anyhow = "1"
```

### Client (spawning a child-process server)
```toml
[dependencies]
rmcp = { version = "1.4", features = ["client", "transport-child-process"] }
tokio = { version = "1", features = ["full"] }
anyhow = "1"
```

### Feature flags at a glance

| Feature | What it enables |
|---------|----------------|
| `server` | `ServerHandler` trait, JSON schema generation, macros |
| `client` | `ClientHandler` trait |
| `macros` | `#[tool]`, `#[prompt]` proc-macros (bundled in `server`) |
| `transport-io` | stdio transport (server side) |
| `transport-child-process` | Spawn a subprocess as MCP server (client side) |
| `transport-async-rw` | Generic `AsyncRead`/`AsyncWrite` (TCP, Unix socket) |
| `transport-streamable-http-server` | HTTP + SSE server |
| `transport-streamable-http-client-reqwest` | HTTP + SSE client |
| `transport-worker` | `Worker` trait for custom transport implementations |
| `auth` | OAuth 2.0 |

---

## Minimal Server

```rust
use rmcp::{
    ServiceExt, ServerHandler,
    handler::server::wrapper::Parameters,
    model::{CallToolResult, Content, McpError},
    tool, tool_router,
    transport::stdio,
};
use schemars::JsonSchema;
use serde::Deserialize;

#[derive(Clone)]
struct MyServer;

#[derive(Deserialize, JsonSchema)]
struct AddParams {
    #[schemars(description = "First number")]
    a: i64,
    #[schemars(description = "Second number")]
    b: i64,
}

// #[tool_router(server_handler)] generates the full ServerHandler impl automatically.
// For servers with ONLY tools this is all you need.
#[tool_router(server_handler)]
impl MyServer {
    #[tool(description = "Add two numbers together")]
    fn add(&self, Parameters(p): Parameters<AddParams>) -> String {
        (p.a + p.b).to_string()
    }

    #[tool(description = "Async tool with proper error handling")]
    async fn fetch_data(
        &self,
        Parameters(req): Parameters<FetchParams>,
    ) -> Result<CallToolResult, McpError> {
        // ...
        Ok(CallToolResult::success(vec![Content::text("result")]))
    }
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    // ALWAYS log to stderr when using stdio — stdout carries the MCP protocol.
    tracing_subscriber::fmt()
        .with_env_filter(tracing_subscriber::EnvFilter::from_default_env())
        .with_writer(std::io::stderr)
        .init();

    let service = MyServer.serve(stdio()).await?;
    service.waiting().await?;
    Ok(())
}
```

---

## Tool Definition Patterns

### Accepted return types

| Return type | Behaviour |
|-------------|-----------|
| `String` | Wrapped as a single text content item |
| `impl IntoContents` | Auto-wrapped into a success `CallToolResult` |
| `CallToolResult` | Returned as-is |
| `Result<T, McpError>` | `T: IntoCallToolResult`; `Err` → JSON-RPC error |

### Content constructors
```rust
Content::text("plain text")
Content::text(format!("value = {}", x))
Content::image(base64_bytes, "image/png")
```

### Parameters wrapper
`Parameters<T>` automatically deserialises the incoming JSON arguments into `T` and
generates the JSON Schema for the tool's `input_schema` from `T: JsonSchema`.

```rust
#[derive(Deserialize, JsonSchema)]
struct MyParams {
    #[schemars(description = "A required string")]
    name: String,
    #[schemars(description = "Optional count, defaults to 1")]
    count: Option<u32>,
}

#[tool(description = "...")]
fn my_tool(&self, Parameters(p): Parameters<MyParams>) -> String {
    format!("{} x{}", p.name, p.count.unwrap_or(1))
}
```

### Stateful server
Derive `Clone` (required by the macro) and store state in `Arc<…>` fields:

```rust
#[derive(Clone)]
struct MyServer {
    db: Arc<Database>,
}

#[tool_router(server_handler)]
impl MyServer {
    #[tool(description = "Query the database")]
    async fn query(
        &self,
        Parameters(req): Parameters<QueryParams>,
    ) -> Result<CallToolResult, McpError> {
        let rows = self.db.execute(&req.sql).await
            .map_err(|e| McpError::internal_error(e.to_string(), None))?;
        Ok(CallToolResult::success(vec![Content::text(
            serde_json::to_string(&rows).unwrap(),
        )]))
    }
}
```

---

## Server with Tools + Prompts + Resources

When you need more than just tools, use the two-block pattern — `#[tool_router]` and
`#[prompt_router]` each on separate `impl` blocks, then combine with `#[tool_handler]`
and `#[prompt_handler]` on a manual `impl ServerHandler`:

```rust
#[tool_router]
impl MyServer {
    #[tool(description = "A tool")]
    fn my_tool(&self, ...) -> String { ... }
}

#[prompt_router]
impl MyServer {
    #[prompt(description = "A prompt template")]
    fn my_prompt(&self) -> Vec<PromptMessage> { vec![...] }
}

#[tool_handler]
#[prompt_handler]
impl ServerHandler for MyServer {
    fn get_info(&self) -> ServerInfo {
        ServerInfo::new(ServerCapabilities::default())
            .with_server_info(Implementation {
                name: "my-server".into(),
                version: env!("CARGO_PKG_VERSION").into(),
            })
            .with_instructions("Describe what this server does here.")
    }

    async fn list_resources(
        &self,
        _request: Option<PaginatedRequestParams>,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<ListResourcesResult, McpError> {
        Ok(ListResourcesResult {
            resources: vec![RawResource::new("file://readme.txt", "README")
                .no_annotation()
                .into()],
            next_cursor: None,
            meta: None,
        })
    }

    async fn read_resource(
        &self,
        request: ReadResourceRequestParams,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<ReadResourceResult, McpError> {
        match request.uri.as_str() {
            "file://readme.txt" => Ok(ReadResourceResult {
                contents: vec![ResourceContents::text(
                    "Hello from resource",
                    "file://readme.txt",
                )],
                meta: None,
            }),
            _ => Err(McpError::invalid_params("Unknown resource URI", None)),
        }
    }
}
```

See [references/protocol-features.md](references/protocol-features.md) for full prompt macro patterns, resource subscriptions, MCP logging, and the notifications reference table.

---

## Transports

### stdio (default for MCP hosts like Claude Desktop)
```rust
MyServer.serve(rmcp::transport::stdio()).await?;
```

### TCP — multi-client server
```rust
use tokio::net::TcpListener;

let listener = TcpListener::bind("127.0.0.1:8001").await?;
loop {
    let (stream, _addr) = listener.accept().await?;
    tokio::spawn(async move {
        MyServer.serve(stream).await?.waiting().await
    });
}
```

### TCP — client
```rust
use tokio::net::TcpSocket;
let stream = TcpSocket::new_v4()?.connect("127.0.0.1:8001".parse()?).await?;
let client = ().serve(stream).await?;
```

### Unix socket — server / client (same pattern as TCP, different type)
```rust
// Server
let listener = tokio::net::UnixListener::bind("/tmp/mcp.sock")?;
// Client
let stream = tokio::net::UnixStream::connect("/tmp/mcp.sock").await?;
```

See [references/transport-guide.md](references/transport-guide.md) for HTTP Streamable transport and OAuth setup.

---

## Minimal Client

```rust
use rmcp::{ServiceExt, model::{CallToolRequestParams, ReadResourceRequestParams}};
use rmcp::transport::TokioChildProcess;
use tokio::process::Command;

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    // Spawn an MCP server as a child process
    let client = ()
        .serve(TokioChildProcess::new(Command::new("my-mcp-server"))?)
        .await?;

    let peer = client.peer();

    // Discover
    let tools = peer.list_tools(None).await?;
    for tool in &tools.tools {
        println!("tool: {} — {}", tool.name, tool.description.as_deref().unwrap_or(""));
    }

    // Call a tool
    let result = peer
        .call_tool(
            CallToolRequestParams::new("add")
                .with_arguments(rmcp::object!({ "a": 1, "b": 2 })),
        )
        .await?;

    for item in &result.content {
        println!("{:?}", item);
    }

    // Resources
    let resources = peer.list_resources(None).await?;
    let contents = peer.read_resource(
        rmcp::model::ReadResourceRequestParams::new("file://readme.txt")
    ).await?;

    Ok(())
}
```

### Full Peer API

```rust
// Tools
peer.list_tools(None).await?
peer.call_tool(CallToolRequestParams::new("name").with_arguments(json_obj)).await?

// Resources
peer.list_resources(None).await?
peer.list_resource_templates(None).await?
peer.read_resource(ReadResourceRequestParams::new("uri://...")).await?

// Prompts
peer.list_prompts(None).await?
peer.get_prompt(GetPromptRequestParams::new("name").with_arguments(args)).await?

// Server-to-client notifications (for ClientHandler implementors)
peer.notify_progress(ProgressNotificationParam { ... }).await?
peer.notify_tool_list_changed().await?
peer.notify_resource_updated(ResourceUpdatedNotificationParam { uri: "...".into() }).await?
```

See [references/client-patterns.md](references/client-patterns.md) for custom `ClientHandler`, sampling (LLM callbacks), elicitation, and pagination helpers.

---

## Error Handling

```rust
use rmcp::ErrorData as McpError;  // canonical re-export; rmcp::model::ErrorData is the same type

// Common constructors
McpError::invalid_params("Field 'name' is required", None)
McpError::internal_error("DB connection failed", None)
McpError::method_not_found::<rmcp::model::CallToolRequest>()

// With structured detail payload
McpError::invalid_params(
    "Validation failed",
    Some(serde_json::json!({ "field": "url", "reason": "not a valid URL" })),
)
```

Prefer `Result<CallToolResult, McpError>` as the return type for anything that can fail.
The macro converts `Err(McpError)` into a proper JSON-RPC error response automatically.

---

## Progress Notifications

Progress requires dropping down to a manual `call_tool` impl so you have access to the
`RequestContext`. Use `#[tool_router]` + `#[tool_handler]` rather than
`#[tool_router(server_handler)]`. **Important:** overriding `call_tool` replaces dispatch
for *all* tools — you must manually route to `#[tool]`-annotated methods or handle the
full dispatch yourself:

```rust
use rmcp::model::{
    ProgressNotificationParam, ProgressToken, NumberOrString,
    RequestContext, RoleServer,
};

impl ServerHandler for MyServer {
    async fn call_tool(
        &self,
        request: CallToolRequestParams,
        ctx: RequestContext<RoleServer>,
    ) -> Result<CallToolResult, McpError> {
        for i in 0u32..100 {
            ctx.peer
                .notify_progress(ProgressNotificationParam {
                    progress_token: ProgressToken(NumberOrString::String(
                        request.name.clone(),
                    )),
                    progress: i as f64,
                    total: Some(100.0),
                    message: Some(format!("Step {}/100", i + 1)),
                })
                .await
                .ok(); // notifications are best-effort
            // ... do work ...
        }
        Ok(CallToolResult::success(vec![Content::text("done")]))
    }
}
```

See [references/server-patterns.md](references/server-patterns.md) for long-running tasks, dynamic tool registration, custom JSON-RPC methods, and graceful shutdown.

---

## Key Types Cheat-Sheet

| Type | Where |
|------|-------|
| `ServerHandler` | `rmcp::handler::server::ServerHandler` |
| `ClientHandler` | `rmcp::handler::client::ClientHandler` |
| `ServiceExt` | `rmcp::ServiceExt` (the `.serve()` entry point) |
| `RunningService` | returned by `.serve(transport).await?` |
| `Peer<R>` | `.peer()` on a running service — use to call/notify the other side |
| `RequestContext<R>` | passed to manual handler methods; holds `peer` and cancellation |
| `CallToolResult` | `rmcp::model::CallToolResult` |
| `Content` | `rmcp::model::Content` |
| `McpError` / `ErrorData` | `rmcp::model::ErrorData` |
| `ServerInfo` | `rmcp::model::ServerInfo` |
| `Tool` | `rmcp::model::Tool` |
| `Parameters<T>` | `rmcp::handler::server::wrapper::Parameters` |

## Reference Files

| File | Contents |
|------|----------|
| [references/server-patterns.md](references/server-patterns.md) | Long-running tasks, custom JSON-RPC methods/notifications, dynamic tool registration, graceful shutdown, `OperationProcessor` |
| [references/client-patterns.md](references/client-patterns.md) | Custom `ClientHandler`, sampling (LLM callbacks), `list_roots`, elicitation, handling server notifications, pagination helpers |
| [references/protocol-features.md](references/protocol-features.md) | Prompts (full macro patterns, `PromptMessage` constructors), Resources (static + templates, subscriptions), MCP logging, notifications reference table |
| [references/transport-guide.md](references/transport-guide.md) | HTTP Streamable (server + client), TLS, in-process testing, OAuth, transport selection guide |
