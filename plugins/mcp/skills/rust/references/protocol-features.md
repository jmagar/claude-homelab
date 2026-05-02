# rmcp Protocol Features

## Prompts

Prompts are reusable message templates servers expose to LLM clients. They can be
parameterised or static.

### Macro-based definition

```rust
use rmcp::{
    prompt, prompt_handler, prompt_router,
    handler::server::wrapper::Parameters,
    model::{PromptMessage, PromptMessageRole, GetPromptResult},
};
use schemars::JsonSchema;
use serde::Deserialize;

#[derive(Deserialize, JsonSchema)]
struct ReviewArgs {
    #[schemars(description = "Programming language")]
    language: String,
    #[schemars(description = "Code to review")]
    code: String,
}

#[prompt_router]
impl MyServer {
    /// No-argument prompt — returns Vec<PromptMessage> directly
    #[prompt(name = "greeting", description = "Friendly opener")]
    async fn greeting(&self) -> Vec<PromptMessage> {
        vec![
            PromptMessage::new_text(PromptMessageRole::User, "Hello!"),
            PromptMessage::new_text(PromptMessageRole::Assistant, "Hi! How can I help?"),
        ]
    }

    /// Parameterised prompt — takes typed args, returns GetPromptResult for metadata
    #[prompt(name = "code_review", description = "Code review template")]
    async fn code_review(
        &self,
        Parameters(args): Parameters<ReviewArgs>,
    ) -> Result<GetPromptResult, McpError> {
        Ok(
            GetPromptResult::new(vec![
                PromptMessage::new_text(
                    PromptMessageRole::User,
                    format!(
                        "Please review this {} code:\n\n```{}\n{}\n```",
                        args.language, args.language, args.code
                    ),
                ),
            ])
            .with_description(format!("{} code review", args.language)),
        )
    }
}

// Wire into ServerHandler (use alongside #[tool_handler] if also have tools)
#[prompt_handler]
impl ServerHandler for MyServer {}
```

### Prompt return types

| Return type | Behaviour |
|-------------|-----------|
| `Vec<PromptMessage>` | Wrapped in `GetPromptResult` automatically |
| `GetPromptResult` | Returned as-is |
| `Result<GetPromptResult, McpError>` | Error becomes JSON-RPC error |

### PromptMessage constructors

```rust
PromptMessage::new_text(PromptMessageRole::User, "text")
PromptMessage::new_text(PromptMessageRole::Assistant, "response")
// With image (use new_image, not PromptMessageContent::image which doesn't exist):
PromptMessage::new_image(PromptMessageRole::User, base64_data, "image/png")
// With embedded resource:
PromptMessage::new_resource(PromptMessageRole::User, resource_contents)
```

### Storing the router (required for parameterised prompts)

When using `#[prompt_router]`, store the generated router in your struct:

```rust
use rmcp::handler::server::router::prompt::PromptRouter;

#[derive(Clone)]
struct MyServer {
    prompt_router: PromptRouter<MyServer>,
}

impl MyServer {
    fn new() -> Self {
        Self { prompt_router: Self::prompt_router() }
    }
}
```

---

## Resources

Resources expose data (files, DB rows, API responses) for LLM context.

### Static resource list

```rust
use rmcp::model::{
    RawResource, ResourceContents, ListResourcesResult, ReadResourceResult,
    PaginatedRequestParams, ReadResourceRequestParams,
};

impl ServerHandler for MyServer {
    async fn list_resources(
        &self,
        _request: Option<PaginatedRequestParams>,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<ListResourcesResult, McpError> {
        Ok(ListResourcesResult {
            resources: vec![
                RawResource::new("file:///config.json", "Server config")
                    .with_description("Current server configuration")
                    .with_mime_type("application/json")
                    .no_annotation()
                    .into(),
            ],
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
            "file:///config.json" => Ok(ReadResourceResult {
                contents: vec![ResourceContents::text(
                    r#"{"mode":"production"}"#,
                    "file:///config.json",
                )],
                meta: None,
            }),
            _ => Err(McpError::invalid_params("Unknown resource URI", None)),
        }
    }
}
```

### Resource templates (parameterised URIs)

Templates use URI Template syntax (RFC 6570) for dynamic resources:

```rust
use rmcp::model::{RawResourceTemplate, ListResourceTemplatesResult};

async fn list_resource_templates(
    &self,
    _request: Option<PaginatedRequestParams>,
    _ctx: RequestContext<RoleServer>,
) -> Result<ListResourceTemplatesResult, McpError> {
    Ok(ListResourceTemplatesResult {
        resource_templates: vec![
            RawResourceTemplate::new(
                "db://records/{id}",  // URI template
                "Database record",
            )
            .with_description("Look up a record by ID")
            .with_mime_type("application/json")
            .no_annotation()
            .into(),
        ],
        next_cursor: None,
        meta: None,
    })
}
```

Then `read_resource` parses the concrete URI:
```rust
// client calls read_resource("db://records/42")
let id = request.uri.strip_prefix("db://records/").unwrap_or_default();
```

### ResourceContents variants

```rust
ResourceContents::text("content", "file:///path")        // text/plain
ResourceContents::blob(base64_bytes, "file:///img.png")  // binary
```

### Notify clients of resource changes

```rust
// Specific resource updated
ctx.peer.notify_resource_updated(ResourceUpdatedNotificationParam {
    uri: "file:///config.json".into(),
}).await.ok();

// Whole list changed (triggers re-list)
ctx.peer.notify_resource_list_changed().await.ok();
```

---

## MCP Logging

Servers send structured log messages to clients via the MCP protocol. This is separate
from `tracing`/`stdout` logging — it goes over the MCP connection itself.

### Sending log messages from server

```rust
// In any handler where you have access to ctx.peer, or from a stored Peer clone
ctx.peer.notify_logging_message(LoggingMessageNotificationParam::new(
    LoggingLevel::Info,
    serde_json::json!("Processing started"),
))
.await
.ok(); // best-effort

// With a logger name
ctx.peer.notify_logging_message(LoggingMessageNotificationParam {
    level: LoggingLevel::Warning,
    logger: Some("my-server/db".into()),
    data: serde_json::json!({ "query_time_ms": 1500, "rows": 0 }),
    meta: None,
})
.await
.ok();
```

### LoggingLevel variants (least → most severe)

```
Debug, Info, Notice, Warning, Error, Critical, Alert, Emergency
```

### Respecting the client's requested level

Clients call `set_level` to say what minimum level they want. Honour it:

```rust
use std::sync::atomic::{AtomicU8, Ordering};

#[derive(Clone)]
struct MyServer {
    min_log_level: Arc<AtomicU8>, // store as u8 for cheapness
}

impl ServerHandler for MyServer {
    async fn set_level(
        &self,
        request: SetLevelRequestParams,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<(), McpError> {
        self.min_log_level.store(request.level as u8, Ordering::Relaxed);
        Ok(())
    }
}
```

---

## Notifications Reference

### Server → Client notifications (send via `ctx.peer` or stored `Peer`)

| Method | When to use |
|--------|-------------|
| `peer.notify_tool_list_changed()` | Tool set changed dynamically |
| `peer.notify_resource_list_changed()` | Resource list changed |
| `peer.notify_resource_updated(param)` | Specific resource content updated |
| `peer.notify_prompt_list_changed()` | Prompt list changed |
| `peer.notify_logging_message(param)` | Send a log message to client |
| `peer.notify_progress(param)` | Report progress on an in-flight request |
| `peer.notify_cancelled(param)` | Cancel a pending request |

### Client → Server notifications (send via `client.peer()`)

| Method | When to use |
|--------|-------------|
| `peer.notify_roots_list_changed()` | Client roots have changed |
| `peer.notify_cancelled(param)` | Cancel a pending server request |
| `peer.notify_initialized()` | Sent automatically after handshake (do not call manually) |

---

## Subscriptions (Resource Watch)

Clients can subscribe to individual resources for change notifications:

```rust
// Client subscribes
client.peer().subscribe(SubscribeRequestParams {
    uri: "file:///config.json".into(),
    meta: None,
}).await?;

// Server implements subscribe/unsubscribe to track subscribers
impl ServerHandler for MyServer {
    async fn subscribe(
        &self,
        request: SubscribeRequestParams,
        ctx: RequestContext<RoleServer>,
    ) -> Result<(), McpError> {
        self.subscribers.lock().await.insert(request.uri.clone(), ctx.peer.clone());
        Ok(())
    }

    async fn unsubscribe(
        &self,
        request: UnsubscribeRequestParams,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<(), McpError> {
        self.subscribers.lock().await.remove(&request.uri);
        Ok(())
    }
}

// When the resource changes, notify subscribers
if let Some(peer) = self.subscribers.lock().await.get(&uri) {
    peer.notify_resource_updated(ResourceUpdatedNotificationParam {
        uri: uri.clone(),
    }).await.ok();
}
```
