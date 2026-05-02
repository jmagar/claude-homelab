# rmcp Transport Guide

## HTTP Streamable Server

Requires feature `transport-streamable-http-server`.

```toml
rmcp = { version = "1.4", features = [
    "server",
    "transport-streamable-http-server",
] }
axum = "0.8"
tower-http = { version = "0.6", features = ["cors"] }
```

```rust
use rmcp::transport::streamable_http_server::{
    StreamableHttpService, session::local::LocalSessionManager,
};
use axum::Router;

// StreamableHttpService implements axum's Service — wrap it in a Router
let session_manager = LocalSessionManager::default();
let mcp_service = StreamableHttpService::new(
    || Ok(MyServer),   // factory: called once per session
    session_manager,
    Default::default(),
);

let app = Router::new()
    .nest_service("/mcp", mcp_service);

let listener = tokio::net::TcpListener::bind("0.0.0.0:3000").await?;
axum::serve(listener, app).await?;
```

### CORS (for browser clients)
```rust
use tower_http::cors::{CorsLayer, Any};

let app = Router::new()
    .nest_service("/mcp", mcp_service)
    .layer(CorsLayer::new().allow_origin(Any).allow_methods(Any).allow_headers(Any));
```

---

## HTTP Streamable Client (reqwest)

Requires feature `transport-streamable-http-client-reqwest`.

```rust
use rmcp::transport::streamable_http_client::StreamableHttpClientTransport;

let transport = StreamableHttpClientTransport::from_uri("http://localhost:3000/mcp");
let client = ().serve(transport).await?;
```

### Over Unix socket
Requires feature `transport-streamable-http-client-unix-socket`.

```rust
use rmcp::transport::streamable_http_client_unix_socket::StreamableHttpUnixSocketTransport;

let transport = StreamableHttpUnixSocketTransport::new(
    "/tmp/mcp.sock",
    "http://localhost/mcp",
);
let client = ().serve(transport).await?;
```

---

## Generic AsyncRead + AsyncWrite

Any type implementing both `AsyncRead + AsyncWrite` can be used directly as a transport.
This covers `TcpStream`, `UnixStream`, `tokio_rustls::TlsStream`, etc.

```rust
// TLS server example
use tokio_rustls::TlsAcceptor;

let acceptor: TlsAcceptor = /* ... */;
let (tcp_stream, _addr) = listener.accept().await?;
let tls_stream = acceptor.accept(tcp_stream).await?;
MyServer.serve(tls_stream).await?;
```

---

## In-Process Transport (Testing)

For testing without I/O, pair two `tokio::io::duplex` halves — each side gets an
`AsyncRead + AsyncWrite` that the other side drives:

```rust
use tokio::io::duplex;

let (client_io, server_io) = duplex(65536);
let server_handle = tokio::spawn(MyServer.serve(server_io));
let client = ().serve(client_io).await?;

// use client.peer() to call tools, then clean up
client.cancel().await?;
server_handle.await??;
```

The `transport-worker` feature exposes the lower-level `Worker` trait for building
custom transports with a managed run-loop. Use `duplex` for simple in-process pairing.

---

## OAuth 2.0 (auth feature)

Requires feature `auth` (and optionally `auth-client-credentials-jwt`).

The `auth` module provides middleware and helpers for:
- Protected resource metadata
- Authorization server metadata
- Token introspection / validation

For client-credentials flow with JWT signing:
```toml
rmcp = { version = "1.4", features = ["auth", "auth-client-credentials-jwt"] }
```

Refer to `examples/clients/src/oauth_client.rs` in the rmcp repository for a full
end-to-end example.

---

## Choosing a Transport

| Scenario | Recommended transport |
|----------|----------------------|
| Claude Desktop / MCP host | `stdio()` |
| Local inter-process | Unix socket or Worker (in-process) |
| Network / microservice | TCP stream or HTTP Streamable |
| Browser / web client | HTTP Streamable with CORS |
| Testing | Worker (in-process, no I/O) |
| Authenticated API gateway | HTTP Streamable + `auth` feature |
