# Arcane MCP

[![npm](https://img.shields.io/npm/v/arcane-mcp)](https://www.npmjs.com/package/arcane-mcp) [![ghcr.io](https://img.shields.io/badge/ghcr.io-jmagar%2Farcane--mcp-blue?logo=docker)](https://github.com/jmagar/arcane-mcp/pkgs/container/arcane-mcp)

TypeScript MCP server for the Arcane Docker management API. Exposes a single `arcane` tool that routes all Docker environment, project, container, image, network, volume, system, registry, image-update, vulnerability, and GitOps operations through the Arcane service.

## Overview

Arcane MCP wraps the Arcane REST API behind a Model Context Protocol interface. An AI agent calls the `arcane` tool with an `action` and `subaction`. The server authenticates the request, enforces a confirmation gate on destructive operations, routes to the appropriate backend service, and returns JSON.

The server ships two MCP tools:

| Tool | Purpose |
| --- | --- |
| `arcane` | Unified action/subaction router for all Arcane API operations |
| `arcane_help` | Returns the full action/subaction reference as formatted text |

---

## Tools

### `arcane`

Call this tool with `action`, `subaction`, and optional `envId`, `id`, and `params`.

```json
{
  "action": "container",
  "subaction": "list",
  "envId": "env-abc123"
}
```

#### Parameter rules

| Parameter | Type | Description |
| --- | --- | --- |
| `action` | string (enum) | Resource family: `environment`, `project`, `container`, `image`, `network`, `volume`, `system`, `image-update`, `vulnerability`, `registry`, `gitops` |
| `subaction` | string (enum) | Operation to perform (see per-family tables below) |
| `envId` | string (optional) | Target environment ID. Required by all families except `registry`. For `environment` subactions, `envId` and `id` are interchangeable for single-resource ops. |
| `id` | string (optional) | Resource ID for single-resource operations (get, delete, etc.) |
| `params` | object (optional) | Operation-specific payload. Pass `{ "confirm": true }` to authorize a destructive operation without elicitation. |

#### Destructive operation gate

Any operation in the DESTRUCTIVE set (listed per family below) is blocked unless one of three conditions is met:

1. `ARCANE_MCP_ALLOW_DESTRUCTIVE=true` — all destructive ops auto-confirm, no re-call needed.
2. `ARCANE_MCP_ALLOW_YOLO=true` — skips the interactive elicitation prompt; the tool must still be re-called with `params: { "confirm": true }` to proceed.
3. Default — if the MCP client supports elicitation forms, the server prompts the user interactively. If the client does not support elicitation, the server returns a prompt asking for a re-call with `params: { "confirm": true }`.

---

## Action families

### `environment`

Top-level Docker host connections. `envId` and `id` are interchangeable for single-resource operations.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all environments | |
| `get` | Get an environment by ID | |
| `create` | Create a new environment; pass `params` with `apiUrl`, `apiKey`, and optional `name`, `enabled`, `isEdge` | |
| `update` | Update environment settings; pass `params` with fields to change | |
| `delete` | Permanently delete an environment | **yes** |
| `test` | Test the environment's API connection | |

Example:

```json
{"action": "environment", "subaction": "list"}
{"action": "environment", "subaction": "get", "id": "env-abc123"}
{"action": "environment", "subaction": "create", "params": {"apiUrl": "https://host.example.com", "apiKey": "..."}}
{"action": "environment", "subaction": "delete", "id": "env-abc123", "params": {"confirm": true}}
```

---

### `project`

Docker Compose stacks running inside an environment. Requires `envId`.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all projects in the environment | |
| `get` | Get a project by ID | |
| `create` | Create a project; pass `params` with `name`, `composeContent`, and optional `envContent` | |
| `update` | Update a project; pass `params` with `composeContent`, `envContent`, or `name` | |
| `up` | Start a project (docker compose up) | |
| `down` | Stop a project (docker compose down) | **yes** |
| `restart` | Restart all containers in the project | **yes** |
| `pull` | Pull latest images without restarting | |
| `destroy` | Stop and remove containers, networks, volumes created by the compose file | **yes** |
| `redeploy` | Pull images and recreate the project | **yes** |
| `build` | Build images for the project; pass optional `params` with `services`, `provider`, `push`, `load` | |

Example:

```json
{"action": "project", "subaction": "list", "envId": "env-abc123"}
{"action": "project", "subaction": "up", "envId": "env-abc123", "id": "my-stack"}
{"action": "project", "subaction": "down", "envId": "env-abc123", "id": "my-stack", "params": {"confirm": true}}
{"action": "project", "subaction": "build", "envId": "env-abc123", "id": "my-stack", "params": {"services": ["web"], "push": true}}
```

---

### `container`

Individual Docker containers inside an environment. Requires `envId`.

Note: container logs are not available via the Arcane REST API. Use the Arcane web UI or `docker logs` directly.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all containers | |
| `get` | Get a container by ID | |
| `create` | Create a container; pass `params` with `name`, `image`, and optional `cmd`, `env`, `ports`, `volumes`, `restartPolicy`, `labels`, `memory`, `cpus`, `privileged` | |
| `start` | Start a stopped container | |
| `stop` | Stop a running container | **yes** |
| `restart` | Restart a container | **yes** |
| `update` | Re-pull the container's image and recreate it using its existing config. No params accepted. | |
| `delete` | Remove a container | **yes** |
| `stats` | Get CPU, memory, and network stats for all containers in the environment | |

Example:

```json
{"action": "container", "subaction": "list", "envId": "env-abc123"}
{"action": "container", "subaction": "stats", "envId": "env-abc123"}
{"action": "container", "subaction": "stop", "envId": "env-abc123", "id": "container-id", "params": {"confirm": true}}
{"action": "container", "subaction": "create", "envId": "env-abc123", "params": {"name": "nginx", "image": "nginx:latest", "ports": {"80/tcp": [{"HostPort": "8080"}]}}}
```

---

### `image`

Docker images available in an environment. Requires `envId`.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all images | |
| `get` | Get an image by ID | |
| `pull` | Pull an image; pass `params` with `imageName` and optional `tag` | |
| `delete` | Delete an image by ID | **yes** |
| `prune` | Remove all unused images | **yes** |
| `scan` | Scan an image for vulnerabilities (triggers Trivy scan) | |

Example:

```json
{"action": "image", "subaction": "list", "envId": "env-abc123"}
{"action": "image", "subaction": "pull", "envId": "env-abc123", "params": {"imageName": "nginx", "tag": "latest"}}
{"action": "image", "subaction": "scan", "envId": "env-abc123", "id": "sha256:abc..."}
{"action": "image", "subaction": "prune", "envId": "env-abc123", "params": {"confirm": true}}
```

---

### `network`

Docker networks in an environment. Requires `envId`.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all networks | |
| `get` | Get a network by ID | |
| `create` | Create a network; pass `params` with `name` and `options` (`driver`, `internal`, `enableIPv6`, `labels`) | |
| `delete` | Delete a network by ID | **yes** |
| `prune` | Remove all unused networks | **yes** |

Example:

```json
{"action": "network", "subaction": "list", "envId": "env-abc123"}
{"action": "network", "subaction": "create", "envId": "env-abc123", "params": {"name": "my-net", "options": {"driver": "bridge"}}}
{"action": "network", "subaction": "prune", "envId": "env-abc123", "params": {"confirm": true}}
```

---

### `volume`

Docker volumes in an environment, with full backup and restore support. Requires `envId`.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all volumes | |
| `get` | Get a volume by name | |
| `create` | Create a volume; pass `params` with `name` and optional `driver`, `driverOpts`, `labels` | |
| `delete` | Delete a volume by name | **yes** |
| `prune` | Remove all unused volumes | **yes** |
| `browse` | Browse a volume's directory tree; pass optional `params.path` (relative, no `..` allowed) | |
| `list-backups` | List all backups for a volume; requires `id` (volume name) | |
| `create-backup` | Create a new backup snapshot; requires `id` (volume name) | |
| `delete-backup` | Delete a backup by ID; pass `params.backupId` | **yes** |
| `restore` | Restore a volume to a backup state; requires `id` (volume name) and `params.backupId` | **yes** |
| `restore-files` | Restore specific files from a backup; requires `id`, `params.backupId`, and `params.paths` (string array) | **yes** |

#### Volume backup/restore workflow

1. List available backups: `subaction=list-backups`, `id=<volumeName>`
2. Create a new snapshot: `subaction=create-backup`, `id=<volumeName>`
3. Inspect a backup's contents: use `list-backups` to get the backup ID, then `restore-files` with `params.paths`
4. Full restore: `subaction=restore`, `id=<volumeName>`, `params: { backupId: "...", confirm: true }`
5. Partial restore: `subaction=restore-files`, `id=<volumeName>`, `params: { backupId: "...", paths: ["data/config.json"], confirm: true }`
6. Remove old snapshot: `subaction=delete-backup`, `params: { backupId: "...", confirm: true }`

Example:

```json
{"action": "volume", "subaction": "list-backups", "envId": "env-abc123", "id": "my-data-vol"}
{"action": "volume", "subaction": "create-backup", "envId": "env-abc123", "id": "my-data-vol"}
{"action": "volume", "subaction": "restore", "envId": "env-abc123", "id": "my-data-vol", "params": {"backupId": "bkp-xyz", "confirm": true}}
{"action": "volume", "subaction": "restore-files", "envId": "env-abc123", "id": "my-data-vol", "params": {"backupId": "bkp-xyz", "paths": ["etc/app.conf"], "confirm": true}}
{"action": "volume", "subaction": "browse", "envId": "env-abc123", "id": "my-data-vol", "params": {"path": "etc"}}
```

---

### `system`

Docker daemon-level operations for an environment. Requires `envId`.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `docker-info` | Get Docker daemon info (version, runtime, resources) | |
| `start-all` | Start all projects in the environment | |
| `stop-all` | Stop all projects in the environment | **yes** |
| `prune` | Prune unused Docker resources; pass `params` with boolean flags: `containers`, `images`, `networks`, `volumes`, `buildCache`, `dangling` | **yes** |
| `convert` | Convert a `docker run` command to Docker Compose YAML; pass `params.dockerRunCommand` | |

Example:

```json
{"action": "system", "subaction": "docker-info", "envId": "env-abc123"}
{"action": "system", "subaction": "prune", "envId": "env-abc123", "params": {"containers": true, "images": true, "networks": true, "volumes": false, "buildCache": true, "dangling": true, "confirm": true}}
{"action": "system", "subaction": "convert", "envId": "env-abc123", "params": {"dockerRunCommand": "docker run -d -p 80:80 nginx"}}
```

---

### `image-update`

Check whether images have newer versions available. Requires `envId`. Long-running checks use a 120-second timeout.

| Subaction | Description |
| --- | --- |
| `check-all` | Check all images in the environment for updates; pass optional `params.credentials` for private registries |
| `check` | Check a single image; pass either `id` (Arcane image ID) or `params.imageRef` (e.g. `nginx:latest`) |
| `check-batch` | Check multiple images; pass `params.imageRefs` (string array) and optional `params.credentials` |
| `summary` | Get a summary count: total images, images with updates, digest-only updates, errors |

The `check` subaction resolves the target in this order: `id` (Arcane internal imageId) → `params.imageRef` (image reference string). Passing both is undefined behavior; use one or the other.

Example:

```json
{"action": "image-update", "subaction": "summary", "envId": "env-abc123"}
{"action": "image-update", "subaction": "check", "envId": "env-abc123", "params": {"imageRef": "nginx:latest"}}
{"action": "image-update", "subaction": "check", "envId": "env-abc123", "id": "img-abc123"}
{"action": "image-update", "subaction": "check-batch", "envId": "env-abc123", "params": {"imageRefs": ["nginx:latest", "redis:7"]}}
{"action": "image-update", "subaction": "check-all", "envId": "env-abc123"}
```

---

### `vulnerability`

Image vulnerability scanning powered by Trivy. Requires `envId`.

| Subaction | Description |
| --- | --- |
| `summary` | Get counts by severity (critical, high, medium, low, unknown) across all scanned images |
| `list` | List all vulnerability entries with full CVE detail |
| `scanner-status` | Get the Trivy scanner's current operational status |
| `ignore` | Add a vulnerability to the ignore list; pass `params` with `imageId`, `vulnerabilityId`, `pkgName`, and optional `installedVersion`, `reason` |
| `unignore` | Remove an ignore entry; pass `id` (ignoreId) |
| `list-ignored` | List all active ignore entries |

Example:

```json
{"action": "vulnerability", "subaction": "summary", "envId": "env-abc123"}
{"action": "vulnerability", "subaction": "list", "envId": "env-abc123"}
{"action": "vulnerability", "subaction": "ignore", "envId": "env-abc123", "params": {"imageId": "img-abc", "vulnerabilityId": "CVE-2024-1234", "pkgName": "openssl", "reason": "mitigated"}}
{"action": "vulnerability", "subaction": "unignore", "envId": "env-abc123", "id": "ignore-entry-id"}
```

---

### `registry`

Container registry credentials. Global resource — `envId` is not required and is ignored.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all configured registries | |
| `get` | Get a registry by ID | |
| `create` | Add a registry; pass `params` with `url`, `username`, `token`, and optional `description`, `enabled`, `insecure` | |
| `update` | Update a registry; pass `id` and `params` with fields to change (`url`, `username`, `token`, `description`, `enabled`, `insecure`) | |
| `delete` | Remove a registry | **yes** |
| `test` | Test connectivity to the registry | |

Example:

```json
{"action": "registry", "subaction": "list"}
{"action": "registry", "subaction": "create", "params": {"url": "registry.example.com", "username": "myuser", "token": "...", "enabled": true}}
{"action": "registry", "subaction": "test", "id": "reg-abc123"}
{"action": "registry", "subaction": "delete", "id": "reg-abc123", "params": {"confirm": true}}
```

---

### `gitops`

Git-backed Compose deployment syncs. Requires `envId`.

Warning: `gitops:sync` pulls from a remote repository and applies changes. This is a supply chain risk if the repository is compromised. Always confirm the sync target before proceeding.

| Subaction | Description | Destructive |
| --- | --- | --- |
| `list` | List all GitOps sync configurations | |
| `get` | Get a sync configuration by ID | |
| `create` | Create a sync config; pass `params` with `name`, `repositoryId`, `branch`, `composePath`, and optional `autoSync`, `syncInterval`, `projectName` | |
| `update` | Update a sync config; pass `id` and `params` with fields to change | |
| `delete` | Delete a sync configuration | **yes** |
| `sync` | Trigger an immediate sync from the remote repository | **yes** |
| `status` | Get the sync's last run status, commit, and next scheduled run | |
| `browse` | Browse the repository's file tree; pass optional `params.path` | |

#### GitOps workflow

1. List existing syncs: `subaction=list`
2. Check a sync's state: `subaction=status`, `id=<syncId>`
3. Inspect repository contents: `subaction=browse`, `id=<syncId>`
4. Trigger a sync: `subaction=sync`, `id=<syncId>`, `params: { confirm: true }`

Example:

```json
{"action": "gitops", "subaction": "list", "envId": "env-abc123"}
{"action": "gitops", "subaction": "status", "envId": "env-abc123", "id": "sync-abc123"}
{"action": "gitops", "subaction": "browse", "envId": "env-abc123", "id": "sync-abc123"}
{"action": "gitops", "subaction": "sync", "envId": "env-abc123", "id": "sync-abc123", "params": {"confirm": true}}
{"action": "gitops", "subaction": "create", "envId": "env-abc123", "params": {"name": "prod-stack", "repositoryId": "repo-abc", "branch": "main", "composePath": "stacks/web/docker-compose.yml", "autoSync": true, "syncInterval": 300}}
```

---

## Destructive operations reference

The following 22 operations require confirmation before execution:

| Action | Subaction |
| --- | --- |
| `environment` | `delete` |
| `project` | `down`, `restart`, `destroy`, `redeploy` |
| `container` | `stop`, `restart`, `delete` |
| `image` | `delete`, `prune` |
| `network` | `delete`, `prune` |
| `volume` | `delete`, `prune`, `delete-backup`, `restore`, `restore-files` |
| `system` | `prune`, `stop-all` |
| `registry` | `delete` |
| `gitops` | `delete`, `sync` |

---

## Installation

### Plugin marketplace

```bash
/plugin marketplace add jmagar/claude-homelab
/plugin install arcane-mcp @jmagar-claude-homelab
```

### Local development

```bash
npm install
npm run build
npm start
```

For watch mode:

```bash
just dev
```

### Docker

```bash
just up
just logs
```

---

## Configuration

Copy `.env.example` to `.env` and fill in the required values:

```bash
cp .env.example .env
chmod 600 .env
```

### Environment variables

| Variable | Required | Default | Description |
| --- | --- | --- | --- |
| `ARCANE_API_URL` | yes | — | Base URL of your Arcane instance, e.g. `https://arcane.example.com` |
| `ARCANE_API_KEY` | yes | — | API key from Arcane Settings > API |
| `ARCANE_MCP_TOKEN` | yes | — | Bearer token for MCP server auth. Generate with: `openssl rand -hex 32` |
| `ARCANE_MCP_BIND_PORT` | no | `3000` | Internal container port the server binds to |
| `ARCANE_MCP_PORT` | no | `44332` | Host-side Docker port mapping |
| `ARCANE_MCP_TRANSPORT` | no | `http` | Transport mode: `http` or `stdio` |
| `ARCANE_MCP_AUTH_ENABLED` | no | `true` | Set to `false` to disable Bearer auth (use only behind a trusted proxy) |
| `ARCANE_MCP_ALLOW_YOLO` | no | `false` | `true` skips elicitation prompts; re-call with `params: { confirm: true }` is still required |
| `ARCANE_MCP_ALLOW_DESTRUCTIVE` | no | `false` | `true` auto-confirms all destructive operations. Use only in fully trusted automated environments. |
| `LOG_LEVEL` | no | `info` | Pino log level: `trace`, `debug`, `info`, `warn`, `error` |

#### Safety flag behavior

`ARCANE_MCP_ALLOW_YOLO` and `ARCANE_MCP_ALLOW_DESTRUCTIVE` control the confirmation gate independently:

- Both `false` (default): destructive ops show an elicitation dialog (if the MCP client supports it) or return a prompt to re-call with `params: { confirm: true }`.
- `ALLOW_YOLO=true`: skips the elicitation dialog. The agent must still re-call with `params: { confirm: true }`.
- `ALLOW_DESTRUCTIVE=true`: bypasses the gate entirely. No re-call needed. Use in CI or fully automated pipelines only.

---

## Authentication

All MCP endpoints require a Bearer token unless `ARCANE_MCP_AUTH_ENABLED=false`.

The following paths bypass authentication:

- `GET /health` — health check, always unauthenticated
- `/.well-known/*` — RFC 9728 OAuth discovery endpoint; reserved for future OAuth resource metadata

All other paths, including `/mcp`, require `Authorization: Bearer <ARCANE_MCP_TOKEN>`.

Token comparison uses `timingSafeEqual` to prevent timing attacks.

---

## Session management

The HTTP transport maintains per-session MCP server instances (up to 200 concurrent sessions). Sessions idle for more than 30 minutes are evicted. When the session cap is reached, the least-recently-used idle session is evicted first.

Clients that do not send an `initialize` request are bootstrapped into a pre-initialized session. These clients cannot use elicitation (the confirmation dialog) — they will always receive the "re-call with `params: { confirm: true }`" response for destructive operations.

---

## Development commands

```bash
just dev          # Start with watch-mode TypeScript compilation
just build        # Compile TypeScript to dist/
just typecheck    # Type-check without emitting
just lint         # Run Biome linter
just fmt          # Run Biome formatter
just test         # Run unit tests with Vitest
just up           # Start Docker Compose service
just down         # Stop Docker Compose service
just logs         # Tail container logs
just health       # Check /health endpoint
just setup        # Create .env from .env.example
just gen-token    # Generate a random Bearer token
just clean        # Remove dist/, .cache/, coverage/
```

---

## Verification

After starting the server:

```bash
just typecheck
just lint
just test
just health
```

The health endpoint returns:

```json
{"status": "ok", "service": "arcane-mcp"}
```

---

## Related plugins

| Plugin | Category | Description |
|--------|----------|-------------|
| [homelab-core](https://github.com/jmagar/claude-homelab) | core | Core agents, commands, skills, and setup/health workflows for homelab management. |
| [overseerr-mcp](https://github.com/jmagar/overseerr-mcp) | media | Search movies and TV shows, submit requests, and monitor failed requests via Overseerr. |
| [unraid-mcp](https://github.com/jmagar/unraid-mcp) | infrastructure | Query, monitor, and manage Unraid servers: Docker, VMs, array, parity, and live telemetry. |
| [unifi-mcp](https://github.com/jmagar/unifi-mcp) | infrastructure | Monitor and manage UniFi devices, clients, firewall rules, and network health. |
| [gotify-mcp](https://github.com/jmagar/gotify-mcp) | utilities | Send and manage push notifications via a self-hosted Gotify server. |
| [swag-mcp](https://github.com/jmagar/swag-mcp) | infrastructure | Create, edit, and manage SWAG nginx reverse proxy configurations. |
| [synapse-mcp](https://github.com/jmagar/synapse-mcp) | infrastructure | Docker management (Flux) and SSH remote operations (Scout) across homelab hosts. |
| [syslog-mcp](https://github.com/jmagar/syslog-mcp) | infrastructure | Receive, index, and search syslog streams from all homelab hosts via SQLite FTS5. |
| [plugin-lab](https://github.com/jmagar/plugin-lab) | dev-tools | Scaffold, review, align, and deploy homelab MCP plugins with agents and canonical templates. |

## License

MIT
