---
name: arcane
description: This skill should be used when the user asks to manage Docker containers,
  images, volumes, networks, stacks, environments, or mentions Arcane, Docker management,
  container operations, image updates, or GitOps workflows.
---

# Arcane Skill

## Mode Detection

**MCP mode** (preferred): Use when `mcp__arcane-mcp__arcane` tool is available.

**HTTP fallback**: Use when MCP tools are unavailable. Credentials are available in Bash
subprocesses as `$CLAUDE_PLUGIN_OPTION_ARCANE_API_URL` and `$CLAUDE_PLUGIN_OPTION_ARCANE_API_KEY`.
Do NOT attempt `${user_config.arcane_api_key}` in curl — sensitive values only work
as `$CLAUDE_PLUGIN_OPTION_*` in Bash subprocesses.

**MCP URL**: `${user_config.arcane_mcp_url}`

---

## MCP Mode — Tool Reference

Single tool: `mcp__arcane-mcp__arcane` with `action` + optional `subaction` parameters.

### Container operations

```
mcp__arcane-mcp__arcane
  action:    "container"
  subaction: "list" | "get" | "create" | "start" | "stop" | "restart" | "delete" | "stats"
  envId:     (required for most subactions) Environment ID
  id:        (required for get, start, stop, restart, delete, stats) Container ID or name
```

> **Note:** `container:logs` is not available via the Arcane REST API. Use the Arcane web UI or
> Docker CLI (`docker logs <container>`) to retrieve container logs.

### Image operations

```
mcp__arcane-mcp__arcane
  action:    "image"
  subaction: "list" | "get" | "pull" | "delete" | "prune" | "scan"
  envId:     (required for most subactions) Environment ID
  id:        (required for get, delete, scan) Image ID or name
```

### Volume operations

```
mcp__arcane-mcp__arcane
  action:    "volume"
  subaction: "list" | "get" | "create" | "delete" | "prune"
  envId:     (required for most subactions) Environment ID
  id:        (required for get, delete) Volume name
  name:      (required for create) Volume name
```

### Network operations

```
mcp__arcane-mcp__arcane
  action:    "network"
  subaction: "list" | "get" | "create" | "delete" | "prune"
  envId:     (required for most subactions) Environment ID
  id:        (required for get, delete) Network ID or name
  name:      (required for create) Network name
```

### Project / Compose operations

```
mcp__arcane-mcp__arcane
  action:    "project"
  subaction: "list" | "get" | "create" | "update" | "up" | "down" | "restart" | "pull" | "destroy" | "redeploy"
  envId:     (required for most subactions) Environment ID
  id:        (required for get, update, up, down, restart, pull, destroy, redeploy) Project ID or name
```

### Environment operations

```
mcp__arcane-mcp__arcane
  action:    "environment"
  subaction: "list" | "get" | "create" | "update" | "delete" | "test"
  id:        (required for get, update, delete, test) Environment ID
  envId:     (alternative for id) Environment ID
  name:      (required for create) Environment name
```

### System operations

```
mcp__arcane-mcp__arcane
  action:    "system"
  subaction: "info" | "version" | "ping"
```

### Destructive operations — DESTRUCTIVE

The following subactions require confirmation. Will prompt interactively when possible,
or require re-call with `params: { confirm: true }`:

- `container:delete` — Delete a container
- `container:restart` — Restart a container
- `container:stop` — Stop a container
- `environment:delete` — Remove an environment
- `image:delete` — Remove an image
- `image:prune` — Prune unused images
- `volume:delete` — Remove a volume and its data
- `volume:prune` — Prune unused volumes
- `network:delete` — Remove a network
- `network:prune` — Prune unused networks
- `project:down` — Stop and remove a project's containers
- `project:destroy` — Destroy a project
- `project:restart` — Restart a project
- `project:redeploy` — Redeploy a project

```
mcp__arcane-mcp__arcane
  action:    "container"
  subaction: "delete"
  envId:     (required) Environment ID
  id:        (required) Container ID or name
  params:    { confirm: true }
```

Always confirm with user before executing destructive operations.

---

## HTTP Fallback Mode

```bash
# List containers
curl -s "$CLAUDE_PLUGIN_OPTION_ARCANE_API_URL/api/containers" \
  -H "X-API-Key: $CLAUDE_PLUGIN_OPTION_ARCANE_API_KEY" | jq .

# Get container details
curl -s "$CLAUDE_PLUGIN_OPTION_ARCANE_API_URL/api/containers/$CONTAINER_ID" \
  -H "X-API-Key: $CLAUDE_PLUGIN_OPTION_ARCANE_API_KEY" | jq .

# Start a container
curl -s -X POST "$CLAUDE_PLUGIN_OPTION_ARCANE_API_URL/api/containers/$CONTAINER_ID/start" \
  -H "X-API-Key: $CLAUDE_PLUGIN_OPTION_ARCANE_API_KEY" | jq .
```

---

## Environment Variables

| Variable | Purpose |
|---|---|
| `ARCANE_MCP_TOKEN` | Bearer token for MCP server authentication |
| `ARCANE_API_URL` | Base URL of the Arcane service |
| `ARCANE_API_KEY` | API key for Arcane service authentication |
| `ARCANE_MCP_PORT` | Docker host-side port mapping (default: 44332) |
| `ARCANE_MCP_ALLOW_YOLO` | Skip elicitation prompts for destructive ops |
| `ARCANE_MCP_ALLOW_DESTRUCTIVE` | Auto-confirm all destructive ops |
