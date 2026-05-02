# Gotify MCP

<!-- mcp-name: tv.tootie/gotify-mcp -->

[![PyPI](https://img.shields.io/pypi/v/gotify-mcp)](https://pypi.org/project/gotify-mcp/) [![ghcr.io](https://img.shields.io/badge/ghcr.io-jmagar%2Fgotify--mcp-blue?logo=docker)](https://github.com/jmagar/gotify-mcp/pkgs/container/gotify-mcp)

MCP server for self-hosted Gotify. Exposes a unified `gotify` action router and a `gotify_help` companion tool for sending notifications and managing Gotify messages, applications, clients, and account metadata.

## Overview

Two MCP tools are exposed:

| Tool | Purpose |
| --- | --- |
| `gotify` | Unified action router for all Gotify operations |
| `gotify_help` | Returns markdown documentation for all actions and parameters |

The server supports HTTP (default) and stdio transports. HTTP transport requires bearer authentication via `GOTIFY_MCP_TOKEN`.

## What this repository ships

- `gotify_mcp/server.py`: FastMCP server, action router, and BearerAuth middleware
- `gotify_mcp/services/gotify.py`: Async HTTP client for the Gotify REST API
- `skills/gotify/SKILL.md`: Client-facing skill documentation
- `docs/gotify-api.json`: Bundled upstream Gotify API reference
- `.claude-plugin/plugin.json`, `.codex-plugin/plugin.json`, `gemini-extension.json`: Client manifests
- `docker-compose.yml`, `Dockerfile`, `entrypoint.sh`: Container deployment
- `scripts/`: Smoke tests and contract checks

## Tools

### `gotify`

Single entry point for all Gotify operations. Select the operation with the `action` parameter.

```python
gotify(action="send_message", app_token="AbCdEf", message="Build finished", priority=5)
```

### `gotify_help`

Returns the full action reference as Markdown. Call this to discover available actions.

```python
gotify_help()
```

## Actions

### `send_message`

Send a push notification. Requires an `app_token` — this is the per-application token, not the client token.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `app_token` | string | yes | — | Application token from Gotify UI (Settings > Apps) |
| `message` | string | yes | — | Notification body. Supports Markdown when `extras` sets `contentType`. |
| `title` | string | no | — | Notification title |
| `priority` | integer | no | app default | Priority 0–10. See Priority Levels below. |
| `extras` | dict | no | — | Extended metadata. See Extras Structure below. |

Response fields:

| Field | Type | Description |
| --- | --- | --- |
| `id` | integer | Assigned message ID |
| `appid` | integer | Application ID that sent the message |
| `message` | string | Message body |
| `title` | string | Message title |
| `priority` | integer | Effective priority |
| `date` | string | ISO 8601 timestamp |
| `extras` | dict | Extras as submitted |

Example:

```python
gotify(action="send_message",
       app_token="AbCdEf",
       title="Deployment done",
       message="## Summary\n- All steps complete\n- Ready for review",
       priority=7,
       extras={"client::display": {"contentType": "text/markdown"}})
```

### `list_messages`

List messages with pagination and optional filtering.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `app_id` | integer | no | — | Filter to messages from one application |
| `offset` | integer | no | `0` | Cursor offset (message ID) — items before this ID are skipped |
| `limit` | integer | no | `50` | Maximum number of messages to return |
| `sort_by` | string | no | `"id"` | Field to sort by. Valid values: `id`, `date`, `priority` |
| `sort_order` | string | no | `"desc"` | `"asc"` or `"desc"` |
| `query` | string | no | `""` | Case-insensitive substring filter applied to title and message body |

Response fields:

| Field | Type | Description |
| --- | --- | --- |
| `items` | array | Array of message objects (same shape as `send_message` response) |
| `total` | integer | Total messages before pagination |
| `limit` | integer | Limit used |
| `offset` | integer | Offset used |
| `has_more` | boolean | Whether more pages exist |

Note: Gotify uses cursor-style pagination internally. The `offset` parameter maps to the `since` query parameter (a message ID), not a row count.

Example:

```python
gotify(action="list_messages", limit=20, sort_order="desc")
gotify(action="list_messages", app_id=3, query="error", limit=10)
```

### `delete_message`

Delete a single message by ID. Destructive — requires `confirm=True`.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `message_id` | integer | yes | — | ID of the message to delete |
| `confirm` | boolean | yes | `False` | Must be `True` to proceed |

Example:

```python
gotify(action="delete_message", message_id=42, confirm=True)
```

### `delete_all_messages`

Delete all messages across all applications. Destructive — requires `confirm=True`.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `confirm` | boolean | yes | `False` | Must be `True` to proceed |

Example:

```python
gotify(action="delete_all_messages", confirm=True)
```

### `list_applications`

List all applications registered on the Gotify server.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `offset` | integer | no | `0` | Number of items to skip |
| `limit` | integer | no | `50` | Maximum items to return |
| `query` | string | no | `""` | Case-insensitive substring filter on application name |

Response fields:

| Field | Type | Description |
| --- | --- | --- |
| `items` | array | Array of application objects |
| `total` | integer | Total applications before pagination |
| `limit` | integer | Limit used |
| `offset` | integer | Offset used |
| `has_more` | boolean | Whether more pages exist |

Each application object contains:

| Field | Type | Description |
| --- | --- | --- |
| `id` | integer | Application ID |
| `token` | string | Application token (use for `send_message`) |
| `name` | string | Application name |
| `description` | string | Application description |
| `defaultPriority` | integer | Default message priority |
| `image` | string | Path to application image |
| `internal` | boolean | Whether this is an internal application |

Example:

```python
gotify(action="list_applications")
gotify(action="list_applications", query="homelab")
```

### `create_application`

Create a new Gotify application.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `name` | string | yes | — | Application name |
| `description` | string | no | — | Application description |
| `default_priority` | integer | no | — | Default priority for messages from this app (0–10) |

Returns the created application object.

Example:

```python
gotify(action="create_application",
       name="homelab-alerts",
       description="Claude Code homelab notifications",
       default_priority=5)
```

### `update_application`

Update an existing application. Provide at least one of `name`, `description`, or `default_priority`.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `app_id` | integer | yes | — | ID of the application to update |
| `name` | string | no | — | New application name |
| `description` | string | no | — | New description |
| `default_priority` | integer | no | — | New default priority (0–10) |

Returns the updated application object.

Example:

```python
gotify(action="update_application", app_id=3, name="homelab-alerts-v2", default_priority=7)
```

### `delete_application`

Delete an application and all its messages. Destructive — requires `confirm=True`.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `app_id` | integer | yes | — | ID of the application to delete |
| `confirm` | boolean | yes | `False` | Must be `True` to proceed |

Example:

```python
gotify(action="delete_application", app_id=3, confirm=True)
```

### `list_clients`

List all registered Gotify clients. Requires `GOTIFY_CLIENT_TOKEN`.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `offset` | integer | no | `0` | Number of items to skip |
| `limit` | integer | no | `50` | Maximum items to return |
| `query` | string | no | `""` | Case-insensitive substring filter on client name |

Response has the same pagination shape as `list_applications`. Each client object contains `id`, `token`, and `name`.

Example:

```python
gotify(action="list_clients")
```

### `create_client`

Create a new Gotify client. Returns the client object including its token.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `name` | string | yes | — | Client name |

Example:

```python
gotify(action="create_client", name="my-phone")
```

### `delete_client`

Delete a Gotify client. Destructive — requires `confirm=True`.

| Parameter | Type | Required | Default | Description |
| --- | --- | --- | --- | --- |
| `client_id` | integer | yes | — | ID of the client to delete |
| `confirm` | boolean | yes | `False` | Must be `True` to proceed |

Example:

```python
gotify(action="delete_client", client_id=5, confirm=True)
```

### `health`

Check the Gotify server health status. No additional parameters.

Returns a JSON object with health fields from the upstream Gotify `/health` endpoint. Note: this MCP tool call requires bearer authentication. The raw HTTP `/health` endpoint on the MCP server is unauthenticated.

Example:

```python
gotify(action="health")
```

### `version`

Get the Gotify server version. No additional parameters. No authentication required on the upstream call.

Example:

```python
gotify(action="version")
```

### `current_user`

Get the current authenticated user's account information. Requires `GOTIFY_CLIENT_TOKEN`.

No additional parameters. Returns the user object with `id`, `name`, and `admin` fields.

Example:

```python
gotify(action="current_user")
```

## Token Types

Gotify uses two separate token types. Using the wrong type will produce a 401 error.

| Token | Source | Used for |
| --- | --- | --- |
| **App token** | Gotify UI: Settings > Apps > Create Application | `send_message` only — passed per call as `app_token` |
| **Client token** | Gotify UI: Settings > Clients > Create Client | All management actions: list/delete messages, list/create/delete apps and clients, current_user |

The MCP server reads `GOTIFY_CLIENT_TOKEN` from the environment and uses it automatically for management actions. You never pass it explicitly to the tool.

The `app_token` for `send_message` is always passed explicitly per call — it is not read from the server environment.

## Priority Levels

The `priority` field is an integer from 0 to 10. Gotify clients interpret priority ranges as follows:

| Range | Level | Recommended use |
| --- | --- | --- |
| 0–3 | Low | Informational, FYI messages |
| 4–7 | Normal | Task updates, completions, standard alerts |
| 8–10 | High | Blocked states, errors, urgent alerts |

If `priority` is omitted from `send_message`, the application's `defaultPriority` is used. If the application has no default, Gotify falls back to 0.

## Extras Structure

The `extras` field in `send_message` is a free-form dict passed to the Gotify API. The most common use is enabling Markdown rendering:

```python
extras={"client::display": {"contentType": "text/markdown"}}
```

Other known namespaces from the upstream Gotify extras specification:

| Key | Value type | Description |
| --- | --- | --- |
| `client::display` | dict | Display hints for Gotify clients |
| `client::display.contentType` | string | `"text/plain"` (default) or `"text/markdown"` |
| `client::notification` | dict | Platform-specific notification overrides |

Any key/value pairs are accepted — the server passes them through as-is.

## Destructive Operations

Four actions are gated behind a confirmation check:

- `delete_message`
- `delete_all_messages`
- `delete_application`
- `delete_client`

Without `confirm=True`, the server returns:

```json
{"error": "Destructive operation. Pass confirm=True to proceed."}
```

To bypass the gate server-wide, set either environment variable:

```
ALLOW_DESTRUCTIVE=true   # skip confirm check
ALLOW_YOLO=true          # identical effect
```

These env vars are intended for automated environments where interactive confirmation is not possible.

## Pagination

List actions (`list_messages`, `list_applications`, `list_clients`) share a common pagination interface:

| Parameter | Type | Default | Notes |
| --- | --- | --- | --- |
| `offset` | integer | `0` | Items to skip. For `list_messages`, maps to the `since` cursor (a message ID). For `list_applications` and `list_clients`, applied client-side as a row offset. |
| `limit` | integer | `50` | Maximum items per page |
| `sort_by` | string | `"id"` | `list_messages` only. Field to sort by: `id`, `date`, `priority`. Not applied for apps or clients. |
| `sort_order` | string | `"desc"` | `list_messages` only. `"asc"` or `"desc"`. |
| `query` | string | `""` | Substring filter. Matches title and body for messages; name for apps and clients. Case-insensitive. |

All list responses include `total`, `limit`, `offset`, and `has_more` alongside the `items` array.

## Error Handling

All errors return a JSON object with these fields:

| Field | Type | Description |
| --- | --- | --- |
| `error` | string | Short error identifier |
| `errorCode` | integer | HTTP status code or 500 for network errors |
| `errorDescription` | string | Human-readable explanation |

Common errors:

| error | errorCode | Cause |
| --- | --- | --- |
| `Unauthorized` | 401 | Wrong or missing token type for the operation |
| `HTTP 403` | 403 | Token valid but operation not permitted for this user |
| `HTTP 404` | 404 | Message, application, or client ID does not exist |
| `NoUpdateFields` | 400 | `update_application` called with no fields to update |
| `RequestError` | 500 | Network failure reaching the Gotify server |
| `No token provided` | 401 | Neither `app_token` nor `GOTIFY_CLIENT_TOKEN` is set |

Responses are truncated at 512 KB. Truncated responses include `... [truncated]` at the end.

## Installation

### Claude Code plugin (recommended)

Install as a Claude Code plugin. You will be prompted for:
- **Gotify Server URL** — base URL of your Gotify instance
- **Gotify App Token** — for sending messages (from Gotify UI: Settings > Apps)
- **Gotify Client Token** — for management operations (from Gotify UI: Settings > Clients)

The plugin uses stdio transport with `${userConfig.*}` interpolation — no `.env` file needed.

### Docker Compose

```bash
cp .env.example .env
chmod 600 .env
# Edit .env with your credentials
docker compose up -d
```

### Local development

```bash
uv sync --dev
uv run gotify-mcp-server
```

## Configuration

Two deployment paths are supported:

| Path | Transport | Credentials | Auth |
|------|-----------|-------------|------|
| **Plugin (stdio)** | stdio | `userConfig` in plugin settings | None |
| **Docker (HTTP)** | http | `.env` file | Bearer token |

See [docs/CONFIG.md](docs/CONFIG.md) for the full environment variable reference.

### Docker URL rewriting

When running inside Docker, `localhost` and `127.0.0.1` in `GOTIFY_URL` are automatically rewritten to `host.docker.internal` so the container can reach a host-side Gotify server.

## Usage examples

### Send a plain text notification

```python
gotify(action="send_message",
       app_token="AbCdEf",
       title="Build finished",
       message="All tests passed.",
       priority=5)
```

### Send a Markdown notification

```python
gotify(action="send_message",
       app_token="AbCdEf",
       title="Deploy complete",
       message="## Status\n- All steps done\n- Ready for review",
       priority=7,
       extras={"client::display": {"contentType": "text/markdown"}})
```

### Page through messages

```python
# First page
gotify(action="list_messages", limit=25, offset=0)

# Next page (use the ID of the last message as offset)
gotify(action="list_messages", limit=25, offset=99)
```

### Filter messages by text

```python
gotify(action="list_messages", query="error", limit=20)
```

### Filter messages from one application

```python
gotify(action="list_messages", app_id=3, limit=50)
```

### Manage applications

```python
# List all applications
gotify(action="list_applications")

# Create
gotify(action="create_application",
       name="homelab-alerts",
       description="Automated notifications",
       default_priority=5)

# Update
gotify(action="update_application", app_id=3, default_priority=7)

# Delete (destructive)
gotify(action="delete_application", app_id=3, confirm=True)
```

### Manage clients

```python
# List all clients
gotify(action="list_clients")

# Create
gotify(action="create_client", name="my-phone")

# Delete (destructive)
gotify(action="delete_client", client_id=5, confirm=True)
```

### Server info

```python
gotify(action="health")
gotify(action="version")
gotify(action="current_user")
```

## HTTP fallback

When MCP tools are unavailable, use direct HTTP calls. App tokens go to `/message`, client tokens go to management endpoints.

```bash
# Send a notification
curl -s -X POST "$GOTIFY_URL/message" \
  -H "X-Gotify-Key: $GOTIFY_APP_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"title":"Done","message":"All steps complete","priority":7}'

# List messages
curl -s "$GOTIFY_URL/message" \
  -H "X-Gotify-Key: $GOTIFY_CLIENT_TOKEN"

# List applications
curl -s "$GOTIFY_URL/application" \
  -H "X-Gotify-Key: $GOTIFY_CLIENT_TOKEN"

# Health (no auth)
curl -s "$GOTIFY_URL/health"
```

## Development

### Setup

```bash
just setup
```

This copies `.env.example` to `.env` (if not already present) and installs all dependencies.

### Commands

```bash
just dev          # Run the server locally (uv run python -m gotify_mcp.server)
just lint         # Run ruff check
just fmt          # Run ruff format
just typecheck    # Run ty check
just test         # Run pytest
just build        # Build Docker image
just up           # Start via docker compose
just down         # Stop docker compose
just restart      # Restart docker compose
just logs         # Follow docker compose logs
just health       # curl http://localhost:9158/health
just test-live    # Run live integration tests (requires running server)
just gen-token    # Generate a random bearer token
just clean        # Remove build artifacts
```

## Verification

Run before committing:

```bash
just lint
just typecheck
just test
```

Live verification (requires a running server and Gotify instance):

```bash
just test-live
```

## Server health endpoint

The MCP server exposes an unauthenticated HTTP health endpoint:

```
GET http://localhost:9158/health
```

This proxies through to the Gotify server's `/health` and returns:

```json
{"status": "ok", "gotify": {...}}
```

Or on failure:

```json
{"status": "error", "reason": "..."}
```

## Logs

The server writes rotating logs to `logs/gotify_mcp.log` (max 5 MB, 3 backups). Log level is controlled by `GOTIFY_LOG_LEVEL`.

## Related plugins

| Plugin | Category | Description |
|--------|----------|-------------|
| [homelab-core](https://github.com/jmagar/claude-homelab) | core | Core agents, commands, skills, and setup/health workflows for homelab management. |
| [overseerr-mcp](https://github.com/jmagar/overseerr-mcp) | media | Search movies and TV shows, submit requests, and monitor failed requests via Overseerr. |
| [unraid-mcp](https://github.com/jmagar/unraid-mcp) | infrastructure | Query, monitor, and manage Unraid servers: Docker, VMs, array, parity, and live telemetry. |
| [unifi-mcp](https://github.com/jmagar/unifi-mcp) | infrastructure | Monitor and manage UniFi devices, clients, firewall rules, and network health. |
| [swag-mcp](https://github.com/jmagar/swag-mcp) | infrastructure | Create, edit, and manage SWAG nginx reverse proxy configurations. |
| [synapse-mcp](https://github.com/jmagar/synapse-mcp) | infrastructure | Docker management (Flux) and SSH remote operations (Scout) across homelab hosts. |
| [arcane-mcp](https://github.com/jmagar/arcane-mcp) | infrastructure | Manage Docker environments, containers, images, volumes, networks, and GitOps via Arcane. |
| [syslog-mcp](https://github.com/jmagar/syslog-mcp) | infrastructure | Receive, index, and search syslog streams from all homelab hosts via SQLite FTS5. |
| [plugin-lab](https://github.com/jmagar/plugin-lab) | dev-tools | Scaffold, review, align, and deploy homelab MCP plugins with agents and canonical templates. |

## License

MIT
