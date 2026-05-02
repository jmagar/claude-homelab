# rmcp Advanced Server Patterns

## Long-Running Tasks

MCP supports async tasks (v2025-11-05+). A client enqueues a task; the server processes
it in the background and the client polls for status/result.

```rust
use rmcp::model::{
    CallToolRequestParams, CreateTaskResult, GetTaskResult, GetTaskPayloadResult,
    Task, TaskStatus, McpError, RequestContext, RoleServer,
};
use std::collections::HashMap;
use tokio::sync::Mutex;
use uuid::Uuid;

#[derive(Clone, Default)]
struct MyServer {
    tasks: Arc<Mutex<HashMap<String, TaskState>>>,
}

enum TaskState {
    Running,
    Done(String),   // final result as JSON string
    Failed(String), // error message
}

fn now_iso() -> String {
    chrono::Utc::now().to_rfc3339()
}

impl ServerHandler for MyServer {
    async fn enqueue_task(
        &self,
        request: CallToolRequestParams,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<CreateTaskResult, McpError> {
        let id = Uuid::new_v4().to_string();
        let now = now_iso();
        self.tasks.lock().await.insert(id.clone(), TaskState::Running);

        let tasks = self.tasks.clone();
        let task_id = id.clone();
        tokio::spawn(async move {
            tokio::time::sleep(std::time::Duration::from_secs(5)).await;
            tasks.lock().await.insert(task_id, TaskState::Done("result".into()));
        });

        Ok(CreateTaskResult::new(
            Task::new(id, TaskStatus::Working, now.clone(), now),
        ))
    }

    async fn get_task_info(
        &self,
        request: GetTaskInfoParams,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<GetTaskResult, McpError> {
        let tasks = self.tasks.lock().await;
        let status = match tasks.get(&request.task_id) {
            Some(TaskState::Running)     => TaskStatus::Working,
            Some(TaskState::Done(_))     => TaskStatus::Completed,
            Some(TaskState::Failed(_))   => TaskStatus::Failed,
            None => return Err(McpError::invalid_params("Unknown task id", None)),
        };
        let now = now_iso();
        Ok(GetTaskResult {
            task: Task::new(request.task_id.clone(), status, now.clone(), now),
            meta: None,
        })
    }

    async fn get_task_result(
        &self,
        request: GetTaskResultParams,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<GetTaskPayloadResult, McpError> {
        match self.tasks.lock().await.get(&request.task_id) {
            Some(TaskState::Done(v)) => Ok(GetTaskPayloadResult::new(
                serde_json::json!({ "content": [{ "type": "text", "text": v }] })
            )),
            Some(TaskState::Failed(msg)) => Err(McpError::internal_error(msg.clone(), None)),
            _ => Err(McpError::invalid_params("Task not complete or not found", None)),
        }
    }

    async fn cancel_task(
        &self,
        request: CancelTaskParams,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<(), McpError> {
        self.tasks.lock().await.remove(&request.task_id);
        Ok(())
    }
}
```

---

## Custom JSON-RPC Methods

Handle proprietary or extension methods not in the standard MCP spec:

```rust
use rmcp::model::{CustomRequest, CustomResult, CustomNotification};

impl ServerHandler for MyServer {
    async fn on_custom_request(
        &self,
        request: CustomRequest,
        _ctx: RequestContext<RoleServer>,
    ) -> Result<CustomResult, McpError> {
        match request.method.as_str() {
            "custom/ping" => Ok(CustomResult::new(serde_json::json!({ "pong": true }))),
            _ => Err(McpError::method_not_found::<CustomRequest>()),
        }
    }

    async fn on_custom_notification(
        &self,
        notification: CustomNotification,
        _ctx: rmcp::model::NotificationContext<RoleServer>,
    ) {
        tracing::info!(method = %notification.method, "received custom notification");
    }
}
```

---

## Dynamic Tool Registration (Router API)

Use the `Router<S>` type when tools are determined at runtime or injected:

```rust
use rmcp::handler::server::router::Router;

let router = Router::new(MyServer::default())
    .with_tool(my_dynamic_tool_route);

let service = router.serve(rmcp::transport::stdio()).await?;
service.waiting().await?;
```

Implement `IntoToolRoute<S, A>` for custom route types, or use the built-in function-based
routes when the tool list is fixed at compile time.

---

## Overriding `get_info` for Rich Server Metadata

`ServerInfo` is `#[non_exhaustive]` — use the builder API, not a struct literal:

```rust
use rmcp::model::{ServerInfo, Implementation, ServerCapabilities, ToolsCapability};

impl ServerHandler for MyServer {
    fn get_info(&self) -> ServerInfo {
        ServerInfo::new(
            ServerCapabilities {
                tools: Some(ToolsCapability { list_changed: Some(true) }),
                resources: Some(Default::default()),
                prompts: Some(Default::default()),
                ..Default::default()
            },
        )
        .with_server_info(Implementation::from_build_env()) // reads CARGO_PKG_NAME/VERSION
        .with_instructions("This server does X, Y, Z.")
    }
}
```

---

## Sending Notifications from Outside a Handler

Hold a clone of the `Peer` to push notifications proactively:

```rust
let service = MyServer.serve(rmcp::transport::stdio()).await?;
let peer = service.peer().clone();

// Spawn background work that pushes tool-list-changed when tools update
tokio::spawn(async move {
    loop {
        tokio::time::sleep(Duration::from_secs(30)).await;
        peer.notify_tool_list_changed().await.ok();
    }
});

service.waiting().await?;
```

---

## OperationProcessor (Structured Task Lifecycle)

`rmcp::task_manager::OperationProcessor` manages task state machines automatically.
It is useful when you have many concurrent tasks and want consistent status tracking
without the `HashMap` boilerplate. See `examples/servers/src/task_*` in the rmcp
repository for complete, working examples — the trait surface is non-trivial and the
examples are the authoritative reference.

---

## Cancellation Token Integration

`RequestContext<R>` exposes a `CancellationToken` for cooperative cancellation:

```rust
async fn call_tool(
    &self,
    request: CallToolRequestParams,
    ctx: RequestContext<RoleServer>,
) -> Result<CallToolResult, McpError> {
    tokio::select! {
        result = self.do_long_work() => result,
        _ = ctx.ct.cancelled() => {
            Err(McpError::new(
                rmcp::model::ErrorCode::INTERNAL_ERROR,
                "Request cancelled",
                None,
            ))
        }
    }
}
```

---

## Graceful Shutdown

```rust
use tokio_util::sync::CancellationToken;

let ct = CancellationToken::new();
let service = MyServer
    .serve_with_ct(rmcp::transport::stdio(), ct.clone())
    .await?;

// Trigger shutdown from a signal handler or elsewhere
ct.cancel();
service.waiting().await?;
```
