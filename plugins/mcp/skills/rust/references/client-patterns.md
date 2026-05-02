# rmcp Client Patterns

## Custom ClientHandler

Implement `ClientHandler` when the server needs to call *back* into the client —
sampling (LLM inference), listing roots, elicitation (user input), or receiving
notifications. The default unit `()` client returns method-not-found for every callback.

```rust
use rmcp::{
    ClientHandler, ServiceExt,
    model::*,
    service::{RequestContext, RoleClient},
};

#[derive(Clone)]
struct MyClient {
    // state, llm handle, etc.
}

impl ClientHandler for MyClient {
    fn get_info(&self) -> ClientInfo {
        // ClientInfo::new takes (capabilities, implementation) — two positional args
        ClientInfo::new(
            ClientCapabilities::builder()
                .enable_sampling()  // advertise sampling support
                .enable_roots()
                .build(),
            Implementation {
                name: "my-client".into(),
                version: env!("CARGO_PKG_VERSION").into(),
            },
        )
    }
}

#[tokio::main]
async fn main() -> anyhow::Result<()> {
    let client = MyClient { /* ... */ }
        .serve(rmcp::transport::TokioChildProcess::new(
            tokio::process::Command::new("my-mcp-server"),
        )?)
        .await?;

    // peer() now belongs to MyClient, not ()
    let tools = client.peer().list_tools(None).await?;
    Ok(())
}
```

---

## Sampling (Server-Initiated LLM Calls)

The server sends `create_message` to ask the client to run an LLM inference.
Implement `create_message` on your `ClientHandler`:

```rust
impl ClientHandler for MyClient {
    async fn create_message(
        &self,
        params: CreateMessageRequestParams,
        _ctx: RequestContext<RoleClient>,
    ) -> Result<CreateMessageResult, McpError> {
        tracing::info!(
            num_messages = params.messages.len(),
            max_tokens = params.max_tokens,
            "server requested sampling"
        );

        // Call your LLM (Claude, OpenAI, local model, etc.)
        let response_text = self.call_llm(&params.messages, params.system_prompt.as_deref()).await?;

        Ok(
            CreateMessageResult::new(
                SamplingMessage::assistant_text(response_text),
                "claude-3-5-sonnet".to_string(), // model that was actually used
            )
            .with_stop_reason(CreateMessageResult::STOP_REASON_END_TURN),
        )
    }
}
```

### Key `CreateMessageRequestParams` fields

| Field | Type | Description |
|-------|------|-------------|
| `messages` | `Vec<SamplingMessage>` | Conversation history |
| `system_prompt` | `Option<String>` | System prompt |
| `max_tokens` | `u32` | Token budget |
| `model_preferences` | `Option<ModelPreferences>` | Hints (speed/cost/intelligence) |
| `stop_sequences` | `Option<Vec<String>>` | Stop tokens |
| `temperature` | `Option<f64>` | Sampling temperature |
| `include_context` | `Option<ContextInclusion>` | Whether to inject server context |

### Building `SamplingMessage`
```rust
SamplingMessage::user_text("What is 2 + 2?")
SamplingMessage::assistant_text("4")
// With image — use the Image enum variant directly (no ::image() constructor):
SamplingMessage::new(
    Role::User,  // rmcp::model::Role, not SamplingMessageRole
    SamplingMessageContent::Image(RawImageContent {
        data: base64_data.into(),
        mime_type: "image/png".into(),
        meta: None,
    }),
)
```

---

## List Roots

Roots are filesystem paths the client exposes to the server. Implement `list_roots`
to tell a server which directories it may reference:

```rust
impl ClientHandler for MyClient {
    async fn list_roots(
        &self,
        _ctx: RequestContext<RoleClient>,
    ) -> Result<ListRootsResult, McpError> {
        Ok(ListRootsResult {
            roots: vec![
                Root {
                    uri: "file:///home/user/project".into(),
                    name: Some("My Project".into()),
                },
            ],
        })
    }
}
```

Advertise roots capability in `get_info`:
```rust
ClientCapabilities::builder().enable_roots().build()
```

---

## Elicitation (Server Requests User Input)

Requires feature `elicitation`. Servers may ask users to provide information
(e.g., OAuth URLs to visit, form fields to fill):

```rust
impl ClientHandler for MyClient {
    async fn create_elicitation(
        &self,
        params: CreateElicitationRequestParams,
        _ctx: RequestContext<RoleClient>,
    ) -> Result<CreateElicitationResult, McpError> {
        match params {
            CreateElicitationRequestParams::UrlElicitationParams { url, message, .. } => {
                // Open URL in browser for user to complete (e.g., OAuth flow)
                println!("Please visit: {url}");
                println!("Reason: {message}");
                // Return accepted; server will send completion notification when done
                Ok(CreateElicitationResult::new(ElicitationAction::Accept))
            }
            CreateElicitationRequestParams::FormElicitationParams { message, requested_schema, .. } => {
                // Show form to user using requested_schema to build UI
                println!("Input required: {message}");
                // Return declined if you can't handle it
                Ok(CreateElicitationResult::new(ElicitationAction::Decline))
            }
        }
    }
}
```

The default implementation **declines all elicitation requests** — override it only
when your client has a UI to present to the user.

---

## Handling Server Notifications

Override these methods on `ClientHandler` to react to server-pushed events:

```rust
use rmcp::service::NotificationContext;  // NOT rmcp::model::NotificationContext

impl ClientHandler for MyClient {
    // Server's tool list changed — re-fetch if you cache tools
    async fn on_tool_list_changed(
        &self,
        _ctx: NotificationContext<RoleClient>,
    ) {
        tracing::info!("tool list changed — re-fetching");
    }

    // A specific resource was updated
    async fn on_resource_updated(
        &self,
        params: ResourceUpdatedNotificationParam,
        _ctx: NotificationContext<RoleClient>,
    ) {
        tracing::info!(uri = %params.uri, "resource updated");
    }

    // Resource list changed — re-fetch if you cache resources
    async fn on_resource_list_changed(
        &self,
        _ctx: NotificationContext<RoleClient>,
    ) { }

    // Prompt list changed
    async fn on_prompt_list_changed(
        &self,
        _ctx: NotificationContext<RoleClient>,
    ) { }

    // Server log message (MCP protocol logging)
    async fn on_logging_message(
        &self,
        params: LoggingMessageNotificationParam,
        _ctx: NotificationContext<RoleClient>,
    ) {
        match params.level {
            LoggingLevel::Error => tracing::error!(logger=%params.logger.unwrap_or_default(), "{:?}", params.data),
            LoggingLevel::Warning => tracing::warn!("{:?}", params.data),
            _ => tracing::debug!("{:?}", params.data),
        }
    }

    // Operation cancelled
    async fn on_cancelled(
        &self,
        params: CancelledNotificationParam,
        _ctx: NotificationContext<RoleClient>,
    ) {
        tracing::warn!(request_id = ?params.request_id, "request cancelled by server");
    }
}
```

---

## Pagination Helpers

When listing tools/resources/prompts on large servers, use `list_all_*` to
auto-paginate:

```rust
// list_all_* lives on Peer<RoleClient>, not on RunningService
let all_tools = client.peer().list_all_tools().await?;
let all_resources = client.peer().list_all_resources().await?;
let all_prompts = client.peer().list_all_prompts().await?;
```

Or manually page using `PaginatedRequestParams`:
```rust
use rmcp::model::PaginatedRequestParams;

let mut cursor: Option<String> = None;
loop {
    let page = client.peer()
        .list_tools(cursor.map(|c| PaginatedRequestParams { cursor: Some(c), meta: None }))
        .await?;
    // process page.tools
    match page.next_cursor {
        Some(c) => cursor = Some(c),
        None => break,
    }
}
```

---

## Requesting a Log Level from the Server

After connecting, tell the server what logging level you want to receive:

```rust
client.peer().set_level(SetLevelRequestParams {
    level: LoggingLevel::Info,
    meta: None,
}).await?;
```

---

## Peer Notification API (Client → Server)

Clients can also push notifications to the server:

```rust
// Tell server roots have changed (triggers re-list)
client.peer().notify_roots_list_changed().await?;

// Cancel a pending request
client.peer().notify_cancelled(CancelledNotificationParam {
    request_id: NumberOrString::Number(42),
    reason: Some("user cancelled".into()),
}).await?;
```
