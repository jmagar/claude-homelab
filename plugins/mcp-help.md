# Lab MCP Help

Generated from `target/debug/lab --json help`, the shared catalog used by `lab.help` / `lab://catalog`.

## `extract`

Pull API keys and URLs from existing service config files

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `scan` | Scan an appdata path and return discovered service credentials | false | `uri: string`<br>`redact_secrets: bool` | `DiscoveredService[]` |
| `apply` | Scan and write discovered credentials into ~/.lab/.env (with backup) | true | `uri*: string`<br>`services: string[]`<br>`env_path: string` | `WritePlan` |
| `diff` | Show what 'apply' would change vs the current env file (no writes) | false | `uri*: string` | `WritePlan` |

## `gateway`

Manage proxied upstream MCP gateways

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `gateway.list` | List configured gateways | false | - | `ServerView[]` |
| `gateway.tool_search.get` | Read the gateway-wide tool-search settings | false | - | `ToolSearchConfig` |
| `gateway.tool_search.set` | Enable or disable gateway-wide tool-search mode for all exposed upstream tools | true | `enabled*: boolean`<br>`top_k_default: integer`<br>`max_tools: integer` | `ToolSearchConfig` |
| `gateway.server.get` | Get one unified server row by id | false | `id*: string` | `ServerView` |
| `gateway.supported_services` | List metadata-backed Lab services that can be added as virtual servers | false | - | `SupportedServiceView[]` |
| `gateway.virtual_server.enable` | Enable a configured Lab-backed service as a virtual server | true | `id*: string` | `ServerView` |
| `gateway.virtual_server.disable` | Disable a Lab-backed virtual server without removing its config | true | `id*: string` | `ServerView` |
| `gateway.virtual_server.remove` | Remove a Lab-backed virtual server config entry | true | `id*: string` | `ServerView` |
| `gateway.virtual_server.quarantine.list` | List Lab-backed virtual servers quarantined during config migration | false | - | `ServerView[]` |
| `gateway.virtual_server.quarantine.restore` | Restore a quarantined Lab-backed virtual server into the active gateway list | true | `id*: string` | `ServerView` |
| `gateway.virtual_server.set_surface` | Enable or disable one surface on a Lab-backed virtual server | true | `id*: string`<br>`surface*: string`<br>`enabled*: boolean` | `ServerView` |
| `gateway.virtual_server.get_mcp_policy` | Read the MCP action allowlist for a Lab-backed virtual server | false | `id*: string` | `VirtualServerMcpPolicyView` |
| `gateway.virtual_server.set_mcp_policy` | Replace the MCP action allowlist for a Lab-backed virtual server | true | `id*: string`<br>`allowed_actions*: string[]` | `VirtualServerMcpPolicyView` |
| `gateway.service_config.get` | Read canonical config for one Lab-backed service | false | `service*: string` | `ServiceConfigView` |
| `gateway.service_actions` | List compiled action metadata for one Lab-backed service | false | `service*: string` | `ServiceActionView[]` |
| `gateway.service_config.set` | Write canonical config for one Lab-backed service | true | `service*: string`<br>`values*: json` | `ServiceConfigView` |
| `gateway.get` | Get one configured gateway | false | `name*: string` | `GatewayView` |
| `gateway.test` | Test a configured or proposed gateway without saving it | false | `name: string`<br>`spec: json`<br>`allow_stdio: boolean` | `GatewayTestResult` |
| `gateway.add` | Add a gateway and reconcile runtime state | true | `spec*: json`<br>`bearer_token_value: string`<br>`allow_stdio: boolean` | `GatewayView` |
| `gateway.update` | Update a gateway and reconcile runtime state | true | `name*: string`<br>`patch*: json`<br>`bearer_token_value: string`<br>`allow_stdio: boolean` | `GatewayView` |
| `gateway.remove` | Remove a gateway and reconcile runtime state | true | `name*: string` | `GatewayView` |
| `gateway.reload` | Reload gateways from config and reconcile runtime state | true | - | `GatewayCatalogDiff` |
| `gateway.status` | Get current runtime gateway status | false | `name: string` | `GatewayRuntimeView[]` |
| `gateway.discovered_tools` | List discovered upstream tool metadata and exposure state for one gateway | false | `name*: string` | `GatewayToolExposureRowView[]` |
| `gateway.discovered_resources` | List discovered upstream resources for one gateway | false | `name*: string` | `string[]` |
| `gateway.discovered_prompts` | List discovered upstream prompts for one gateway | false | `name*: string` | `string[]` |
| `gateway.oauth.probe` | Probe a URL for OAuth support via RFC 8414 AS metadata discovery. Registers a transient OAuth manager so subsequent authorize calls work. | true | `url*: string` | `ProbeResult` |
| `gateway.oauth.start` | Start the upstream OAuth flow for the shared gateway credential and return the browser authorization URL | false | `upstream*: string`<br>`subject: string` | `BeginAuthorization` |
| `gateway.oauth.status` | Read upstream OAuth status for the shared gateway credential | false | `upstream*: string`<br>`subject: string` | `UpstreamOauthStatusView` |
| `gateway.oauth.clear` | Clear stored upstream OAuth credentials for the shared gateway credential | true | `upstream*: string`<br>`subject: string` | `ok` |
| `gateway.mcp.enable` | Enable an upstream MCP server so new sessions discover and proxy it again | true | `name*: string` | `GatewayView` |
| `gateway.mcp.list` | List upstream MCP runtime state, discovery counts, and likely stale process counts | false | - | `GatewayMcpRuntimeView[]` |
| `gateway.mcp.disable` | Disable an upstream MCP server and optionally clean up running processes | true | `name*: string`<br>`cleanup: boolean`<br>`aggressive: boolean` | `GatewayView + optional cleanup result` |
| `gateway.mcp.cleanup` | Kill or preview running processes associated with one upstream MCP server | true | `name*: string`<br>`aggressive: boolean`<br>`dry_run: boolean` | `GatewayCleanupView` |

## `doctor`

Comprehensive health audit: env vars, system probes, and service reachability

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `system.checks` | Run local system probes: env vars, Docker, disk, ports, config files | false | - | `DoctorReport` |
| `service.probe` | Probe a single named service via its health endpoint | false | `service*: string`<br>`instance: string` | `Finding` |
| `audit.full` | Probe all configured services plus system checks; streams results | false | - | `stream<Finding>` |
| `auth.check` | Check auth/OAuth configuration: env vars, file presence, and Unix file permissions | false | - | `DoctorReport` |

## `logs`

Search and stream local-master runtime logs

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `logs.search` | Search persisted log events with filters | false | `query: json` | `Value` |
| `logs.tail` | Bounded follow-up read from the persisted store | false | `after_ts: integer`<br>`since_event_id: string`<br>`limit: integer` | `Value` |
| `logs.stats` | Return retention metadata and drop counters | false | - | `Value` |
| `logs.stream` | Live push is HTTP SSE only; dispatch returns guidance | false | - | `Value` |

## `device`

Manage fleet device enrollments

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `enrollments.list` | List pending, approved, and denied node enrollments | false | - | `Value` |
| `enrollments.approve` | Approve a pending node enrollment | true | `node_id*: string`<br>`note: string` | `Value` |
| `enrollments.deny` | Deny a pending or approved node enrollment | true | `node_id*: string`<br>`reason: string` | `Value` |

## `marketplace`

Browse Claude Code/Codex marketplaces, MCP Registry servers, ACP agents, and installable components

Category: `marketplace`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `sources.list` | List configured marketplaces | false | - | `Marketplace[]` |
| `plugins.list` | List plugins across marketplaces. Supports server-side filtering by kind, installed state, and text query. All filter params are optional and additive. | false | `marketplace: string`<br>`kind: string`<br>`installed: bool`<br>`query: string` | `Plugin[]` |
| `plugin.get` | Return a single plugin by id (`name@marketplace`) | false | `id*: string` | `Plugin` |
| `plugin.artifacts` | List artifact files shipped with an installed plugin | false | `id*: string` | `Artifact[]` |
| `plugin.workspace` | Load or create an app-managed editable workspace mirror for a plugin | false | `id*: string` | `PluginWorkspace` |
| `plugin.save` | Save a file into the plugin workspace mirror | false | `id*: string`<br>`path*: string`<br>`content*: string` | `SaveResult` |
| `plugin.deploy` | Deploy the saved plugin workspace to the local Claude Code install target | true | `id*: string` | `DeployResult` |
| `plugin.deploy.preview` | Preview changed, skipped, and removed files before deploying the workspace | false | `id*: string` | `DeployPreviewResult` |
| `artifact.fork` | Fork artifact(s) or an entire plugin into your stash with upstream tracking. | false | `plugin_id*: string`<br>`artifacts: array`<br>`instance: string` | `ForkResult` |
| `artifact.list` | List forked marketplace artifact stashes with drift status. | false | `plugin_id: string`<br>`instance: string` | `ForkedPluginStatus[]` |
| `artifact.unfork` | Remove fork tracking metadata for artifact(s) or a plugin stash. | true | `plugin_id*: string`<br>`artifacts: array`<br>`instance: string`<br>`confirm*: boolean` | `UnforkResult` |
| `artifact.reset` | Reset forked artifact(s) back to their upstream base snapshot. | true | `plugin_id*: string`<br>`artifacts: array`<br>`instance: string`<br>`confirm*: boolean` | `ResetResult` |
| `artifact.diff` | Show diffs between forked artifact content and upstream/base snapshots. | false | `plugin_id*: string`<br>`artifact_path: string`<br>`instance: string` | `ArtifactDiffResult` |
| `artifact.patch` | Apply a patch to one forked artifact in the marketplace stash. | false | `plugin_id*: string`<br>`artifact_path*: string`<br>`patch*: string`<br>`description: string`<br>`instance: string` | `PatchResult` |
| `artifact.update.check` | Check whether a forked plugin artifact stash has an upstream update | false | `plugin_id: string` | `UpdateCheckResult[]` |
| `artifact.update.preview` | Preview artifact update changes and conflicts for a forked plugin stash | false | `plugin_id*: string` | `UpdatePreviewResult` |
| `artifact.update.apply` | Apply a pending upstream artifact update to a forked plugin stash | true | `plugin_id*: string`<br>`strategy: string`<br>`confirm*: boolean` | `ApplyResult` |
| `artifact.merge.suggest` | Request an AI merge suggestion for one conflicted artifact file | false | `plugin_id*: string`<br>`artifact_path*: string` | `MergeSuggestResult` |
| `artifact.config.set` | Update artifact update preferences for a forked plugin stash | false | `plugin_id*: string`<br>`strategy: string`<br>`notify: boolean` | `ConfigSetResult` |
| `sources.add` | Register a new marketplace via `claude plugin marketplace add` | true | `repo: string`<br>`url: string`<br>`autoUpdate: boolean` | `AddResult` |
| `plugin.install` | Install a plugin via `claude plugin install` | true | `id*: string` | `InstallResult` |
| `plugin.uninstall` | Uninstall a plugin via `claude plugin uninstall` | true | `id*: string` | `UninstallResult` |
| `agent.list` | List ACP-compatible agents from the registry CDN | false | - | `Agent[]` |
| `agent.get` | Get details for a single ACP agent by id | false | `id*: string` | `Agent` |
| `agent.install` | Install an ACP agent on one or more devices. Writes a provider entry to `~/.lab/acp-providers.json`. Binary distributions are not yet supported in this build; npx/uvx are config-only. | true | `id*: string`<br>`node_ids*: array`<br>`platform: string`<br>`confirm*: boolean` | `InstallResults` |
| `plugin.cherry_pick` | Install selected components from a plugin to one or more devices | true | `plugin_id*: string`<br>`components*: array`<br>`node_ids*: array`<br>`scope*: string`<br>`project_path: string`<br>`confirm*: boolean` | `CherryPickResults` |
| `agent.uninstall` | Remove an installed ACP agent entry from `~/.lab/acp-providers.json` | true | `id*: string`<br>`confirm*: boolean` | `UninstallResult` |
| `mcp.config` | Return the resolved MCP registry base URL | false | - | `RegistryConfig` |
| `mcp.list` | List MCP servers from the registry with optional search, owner filter, and pagination. This action calls the upstream registry directly (/v1 surface). | false | `search: string`<br>`owner: string`<br>`limit: integer`<br>`cursor: string`<br>`version: string`<br>`updated_since: string`<br>`featured: boolean`<br>`reviewed: boolean`<br>`recommended: boolean`<br>`hidden: boolean`<br>`tag: string` | `ServerListResponse` |
| `mcp.get` | Get details for a single MCP server by its registry name. Calls the upstream registry directly (/v1 surface). | false | `name*: string` | `ServerResponse` |
| `mcp.versions` | List available versions for a named MCP server. Calls the upstream registry directly (/v1 surface). | false | `name*: string` | `ServerListResponse` |
| `mcp.validate` | Validate a ServerJSON document against the registry schema without publishing | false | `server_json*: object` | `ValidationResult` |
| `mcp.install` | Install an MCP server from the registry to Lab gateway upstreams and/or Claude/Codex MCP clients on fleet devices. HTTP servers are added as remote URLs; stdio servers are added as command configs. Required env vars are written to ~/.lab/.env for gateway installs and embedded in the MCP client config for client installs. | true | `name*: string`<br>`gateway_ids: array`<br>`client_targets: array`<br>`bearer_token_env: string`<br>`version: string`<br>`env_values: object`<br>`confirm*: boolean` | `InstallResults` |
| `mcp.uninstall` | Remove a previously installed MCP server gateway upstream by gateway name | true | `gateway_name*: string`<br>`confirm*: boolean` | `GatewayView` |
| `mcp.meta.get` | Get Lab-owned local metadata for a stored registry server version from the local registry mirror. | false | `name*: string`<br>`version: string` | `RegistryLocalMeta` |
| `mcp.meta.set` | Set Lab-owned local metadata for a stored registry server version under `_meta["tv.tootie.lab/registry"]`. | false | `name*: string`<br>`version: string`<br>`metadata*: object`<br>`updated_by: string` | `RegistryLocalMeta` |
| `mcp.meta.delete` | Delete Lab-owned local metadata for a stored registry server version under `_meta["tv.tootie.lab/registry"]`. | false | `name*: string`<br>`version: string` | `RegistryLocalMetaDeleteResult` |
| `mcp.sync` | Trigger an immediate upstream sync of the local registry store. Rate-limited: returns rate_limited if called within 60 seconds of the last sync. | false | - | `SyncResult` |

## `acp`

Agent Client Protocol — session management and provider orchestration

Category: `ai`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `provider.list` | List available providers with health status | false | - | `Value` |
| `provider.get` | Get one provider's health and capabilities | false | `provider*: string` | `Value` |
| `provider.select` | Set the default provider for new sessions | false | `provider*: string` | `Value` |
| `session.list` | List all sessions owned by the caller | false | `principal: string` | `Value` |
| `session.get` | Get one session's summary and state | false | `session_id*: string` | `Value` |
| `session.start` | Create and start a new agent session | false | `provider: string`<br>`title: string`<br>`cwd: string`<br>`principal: string` | `Value` |
| `session.prompt` | Send a prompt to a running session | false | `session_id*: string`<br>`text*: string`<br>`principal*: string`<br>`page_context: object` | `Value` |
| `session.cancel` | Cancel a running session [destructive] | true | `session_id*: string`<br>`principal: string` | `Value` |
| `session.permission.approve` | Approve a pending provider permission request [destructive] | true | `session_id*: string`<br>`request_id*: string`<br>`option_id*: string`<br>`principal: string`<br>`confirm*: boolean` | `Value` |
| `session.permission.reject` | Reject a pending provider permission request | false | `session_id*: string`<br>`request_id*: string`<br>`principal: string` | `Value` |
| `session.close` | Close a session permanently [destructive] | true | `session_id*: string`<br>`principal: string` | `Value` |
| `session.events` | Get stored events for a session. ProviderInfo events of type 'tool_call_metadata' carry an optional '_meta' object relayed transparently from the originating agent; the key is absent (not null) when the agent did not inject it. ToolCallUpdate events carry merged '_meta' (outer wrapper wins over any '_meta' already present in raw_output). | false | `session_id*: string`<br>`since: integer` | `{ "events": AcpEvent[], "count": number }` |
| `session.subscribe_ticket` | Issue a short-lived SSE auth ticket for browser EventSource clients | false | `session_id*: string`<br>`principal: string` | `Value` |

## `stash`

Component versioning and deployment — track, snapshot, and deploy Claude Code artefacts

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `components.list` | List all components in the stash | false | - | `ComponentSummary[]` |
| `component.get` | Get details for a single component | false | `id*: string` | `ComponentDetail` |
| `component.create` | Create a new component in the stash | false | `kind*: string`<br>`name*: string`<br>`label: string` | `ComponentDetail` |
| `component.import` | Import a local path into the stash as a new or updated component [destructive] | true | `id*: string`<br>`source_path*: string`<br>`kind: string` | `ImportResult` |
| `component.workspace` | Get the workspace (local checkout) path for a component | false | `id*: string` | `WorkspacePath` |
| `component.save` | Save (snapshot) the current workspace state for a component | false | `id*: string`<br>`label: string` | `SaveResult` |
| `component.revisions` | List saved revisions for a component | false | `id*: string` | `Revision[]` |
| `component.export` | Export a component to a local path [destructive] | true | `id*: string`<br>`output_path*: string`<br>`include_secrets: boolean`<br>`force: boolean` | `ExportResult` |
| `component.deploy` | Deploy a component to a registered target [destructive] | true | `id*: string`<br>`target_id*: string`<br>`revision_id: string` | `DeployResult` |
| `providers.list` | List registered sync providers | false | - | `Provider[]` |
| `provider.link` | Register a sync provider for a component | false | `id*: string`<br>`kind*: string`<br>`label*: string`<br>`config*: object` | `Provider` |
| `provider.push` | Push the latest component revision to a provider [destructive] | true | `id*: string`<br>`provider_id*: string` | `SyncResult` |
| `provider.pull` | Pull the latest state from a provider into the component [destructive] | true | `id*: string`<br>`provider_id*: string` | `SyncResult` |
| `targets.list` | List registered deploy targets | false | - | `Target[]` |
| `target.add` | Register a new deploy target | false | `name*: string`<br>`kind*: string`<br>`path: string`<br>`gateway_id: string` | `Target` |
| `target.remove` | Remove a registered deploy target [destructive] | true | `id*: string` | `RemoveResult` |

## `radarr`

Movie collection manager for Usenet and BitTorrent

Category: `servarr`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `system.status` | Return Radarr system status and version | false | - | `SystemStatus` |
| `system.health` | Return Radarr health check results | false | - | `HealthCheck[]` |
| `system.disk-space` | Return disk space information for all drives | false | - | `DiskSpace[]` |
| `system.logs` | Return list of available log files | false | - | `LogFile[]` |
| `system.updates` | Return available Radarr updates | false | - | `UpdateInfo[]` |
| `system.restart` | Restart the Radarr application | true | - | `void` |
| `system.backup` | List available Radarr backup files | false | - | `BackupFile[]` |
| `system.task` | List all scheduled background tasks | false | - | `Task[]` |
| `system.task-execute` | Execute a named scheduled task immediately | true | `name*: string` | `Command` |
| `movie.list` | List all movies in the Radarr library | false | - | `Movie[]` |
| `movie.get` | Get a single movie by its Radarr ID | false | `id*: i64` | `Movie` |
| `movie.lookup` | Search for movies to add (TMDB / IMDB lookup) | false | `query*: string` | `MovieLookup[]` |
| `movie.add` | Add a movie to Radarr for monitoring and download | false | `tmdb_id*: i64`<br>`title*: string`<br>`quality_profile_id*: i64`<br>`root_folder_path*: string`<br>`monitored: bool`<br>`year: i32` | `Movie` |
| `movie.edit` | Update an existing movie resource (PUT full resource) | false | `id*: i64`<br>`body*: object` | `Movie` |
| `movie.delete` | Delete a movie from Radarr | true | `id*: i64`<br>`delete_files: bool` | `void` |
| `queue.list` | List all items currently in the download queue | false | - | `QueueItem[]` |
| `queue.remove` | Remove an item from the download queue | true | `id*: i64`<br>`remove_from_client: bool`<br>`blocklist: bool` | `void` |
| `calendar.list` | List upcoming movie releases | false | `start: string`<br>`end: string` | `CalendarEntry[]` |
| `command.refresh` | Refresh metadata for one movie or all movies | false | `movie_id: i64` | `Command` |
| `command.search` | Trigger a file search for specified movies | false | `movie_ids*: i64[]` | `Command` |
| `command.get` | Get the status of a previously issued command | false | `id*: i64` | `Command` |
| `history.list` | List download history | false | `page: u32`<br>`page_size: u32` | `HistoryPage` |
| `history.movie` | List history records for a specific movie | false | `id*: i64` | `HistoryRecord[]` |
| `history.failed-retry` | Mark a history record as failed and trigger a retry search | false | `id*: i64` | `void` |
| `blocklist.list` | List blocked releases | false | - | `BlocklistItem[]` |
| `blocklist.delete` | Delete a specific blocklist entry | true | `id*: i64` | `void` |
| `release.search` | Search indexers for available releases for a movie | false | `movie_id*: i64` | `Release[]` |
| `release.grab` | Grab (download) a release returned from release.search | false | `release*: object` | `Release` |
| `indexer.list` | List configured indexers | false | - | `Indexer[]` |
| `indexer.test` | Test an indexer connection | false | `id*: i64` | `void` |
| `quality-profile.list` | List quality profiles | false | - | `QualityProfile[]` |
| `quality-definition.list` | List quality definitions | false | - | `QualityDefinition[]` |
| `root-folder.list` | List root folders | false | - | `RootFolder[]` |
| `tag.list` | List all tags | false | - | `Tag[]` |
| `tag.detail-list` | List tags with details (linked movies, etc.) | false | - | `TagDetail[]` |
| `download-client.list` | List configured download clients | false | - | `DownloadClient[]` |
| `download-client.test` | Test a download client connection | false | `id*: i64` | `void` |
| `remote-path-mapping.list` | List remote path mappings | false | - | `RemotePathMapping[]` |
| `config.host` | Get host configuration | false | - | `HostConfig` |
| `config.naming` | Get file naming configuration | false | - | `NamingConfig` |
| `config.ui` | Get UI configuration | false | - | `UiConfig` |
| `notification.list` | List configured notifications | false | - | `Notification[]` |
| `notification.test` | Test a notification connection | false | `id*: i64` | `void` |
| `import-list.list` | List configured import lists | false | - | `ImportList[]` |
| `import-list.exclusion-list` | List import list exclusions | false | - | `ImportListExclusion[]` |
| `language.list` | List available languages | false | - | `Language[]` |
| `metadata.list` | List metadata providers | false | - | `Metadata[]` |
| `filesystem.list` | Browse the server filesystem | false | `path*: string` | `FilesystemListing` |
| `wanted.missing` | List monitored movies that are missing from the library | false | `page: u32`<br>`page_size: u32` | `WantedPage` |
| `wanted.cutoff` | List monitored movies that do not meet the quality cutoff | false | `page: u32`<br>`page_size: u32` | `WantedPage` |
| `customformat.list` | List all custom formats defined in Radarr | false | - | `CustomFormat[]` |

## `sonarr`

TV series management for the Servarr stack

Category: `servarr`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `series.list` | List all TV series in the Sonarr library | false | - | `Series[]` |
| `series.get` | Get a single series by Sonarr ID | false | `id*: i64` | `Series` |
| `series.lookup` | Search for series to add (TVDB lookup / search term) | false | `query*: string` | `SeriesLookup[]` |
| `series.add` | Add a TV series to Sonarr for monitoring and download | false | `tvdb_id*: i64`<br>`title*: string`<br>`quality_profile_id*: i64`<br>`language_profile_id*: i64`<br>`root_folder_path*: string`<br>`monitored: bool`<br>`series_type: string` | `Series` |
| `series.delete` | Delete a series from Sonarr | true | `id*: i64`<br>`delete_files: bool` | `void` |
| `episode.list` | List all episodes for a series | false | `series_id*: i64` | `Episode[]` |
| `episode.get` | Get a single episode by ID | false | `id*: i64` | `Episode` |
| `queue.list` | List the download queue | false | `page: u32`<br>`page_size: u32`<br>`series_id: i64` | `QueuePage` |
| `queue.delete` | Remove an item from the download queue | true | `id*: i64`<br>`blocklist: bool` | `void` |
| `history.list` | List download history | false | `page: u32`<br>`page_size: u32`<br>`series_id: i64`<br>`episode_id: i64` | `HistoryPage` |
| `wanted.list` | List wanted/missing episodes | false | `page: u32`<br>`page_size: u32` | `WantedPage` |
| `calendar.list` | List upcoming episode air dates | false | `start: string`<br>`end: string`<br>`unmonitored: bool` | `Episode[]` |
| `health` | Return Sonarr health check results | false | - | `HealthCheck[]` |
| `system.status` | Return Sonarr system status and version | false | - | `SystemStatus` |
| `tag.list` | List all tags | false | - | `Tag[]` |
| `tag.create` | Create a new tag | false | `label*: string` | `Tag` |
| `tag.delete` | Delete a tag by ID | true | `id*: i64` | `void` |
| `rootfolder.list` | List all root folders | false | - | `RootFolder[]` |
| `qualityprofile.list` | List all quality profiles | false | - | `QualityProfile[]` |
| `languageprofile.list` | List all language profiles | false | - | `LanguageProfile[]` |
| `series.edit` | Update an existing series with a full series resource body | false | `id*: i64`<br>`body*: object` | `Series` |
| `episode.monitor` | Set monitored state for one or more episodes | false | `episode_ids*: i64[]`<br>`monitored*: bool` | `object` |
| `wanted.cutoff` | List episodes that have not met their cutoff quality | false | `page: u32`<br>`page_size: u32` | `WantedPage` |
| `release.search` | Search for available releases for a series or season | false | `series_id: i64`<br>`season_number: i32` | `Release[]` |
| `release.grab` | Grab a release by GUID and send to download client | false | `guid*: string` | `object` |
| `history.series` | List history records for a specific series | false | `series_id*: i64` | `HistoryRecord[]` |
| `history.failed-retry` | Retry a failed download by history ID | false | `id*: i64` | `void` |
| `blocklist.list` | List all blocklisted releases | false | - | `BlocklistPage` |
| `blocklist.delete` | Remove a release from the blocklist by ID | true | `id*: i64` | `void` |
| `episodefile.delete` | Delete an episode file from disk by ID | true | `id*: i64` | `void` |
| `system.restart` | Restart the Sonarr application | true | - | `void` |
| `system.backup` | List available system backup files | false | - | `Backup[]` |

## `prowlarr`

Indexer manager for the Servarr stack

Category: `indexer`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `indexer.list` | List all configured indexers | false | - | `Value` |
| `indexer.get` | Get a single indexer by ID | false | `id*: integer` | `Value` |
| `indexer.delete` | Delete an indexer by ID | true | `id*: integer` | `void` |
| `indexer.test` | Test a single indexer by ID (fetches the indexer then POSTs to test endpoint) | false | `id*: integer` | `Value` |
| `indexer.testall` | Test all configured indexers | false | - | `Value` |
| `indexer.categories` | List all indexer categories | false | - | `Value` |
| `history.list` | Get history with optional filters | false | `page: integer`<br>`page_size: integer`<br>`sort_key: string`<br>`sort_dir: string`<br>`indexer_id: integer` | `Value` |
| `application.list` | List configured applications (download clients connected to Prowlarr) | false | - | `Value` |
| `application.get` | Get a single application by ID | false | `id*: integer` | `Value` |
| `application.delete` | Delete an application by ID | true | `id*: integer` | `void` |
| `indexer.edit` | Update an existing indexer by ID (PUT /api/v1/indexer/{id}) | false | `id*: integer`<br>`body*: object` | `Value` |
| `indexer.add` | Create a new indexer (POST /api/v1/indexer) | false | `body*: object` | `Value` |
| `indexer.stats` | Get indexer statistics (GET /api/v1/indexerstats) | false | - | `Value` |
| `indexer.status` | Get indexers with errors (GET /api/v1/indexerstatus) | false | - | `Value` |
| `indexer.search` | Search across indexers (GET /api/v1/search) | false | `query*: string`<br>`indexer_ids: array[integer]`<br>`categories: array[integer]`<br>`search_type: string` | `Value` |
| `indexer.grab` | Grab a release by GUID and send to download client (POST /api/v1/search) | false | `guid*: string` | `Value` |
| `history.indexer` | Get history for a specific indexer (GET /api/v1/history?indexerId={id}) | false | `id*: integer` | `Value` |
| `application.add` | Create a new application (POST /api/v1/applications) | false | `body*: object` | `Value` |
| `system.restart` | Restart the Prowlarr server (POST /api/v1/system/restart) | true | - | `void` |
| `system.backup` | Get system backups (GET /api/v1/system/backup) | false | - | `Value` |
| `tag.list` | List all tags (GET /api/v1/tag) | false | - | `Value` |
| `system.status` | Get system status (version, branch, OS, etc.) | false | - | `Value` |
| `system.health` | Get system health alerts | false | - | `Value` |

## `plex`

Plex Media Server — library browsing, session management, and playlists

Category: `media`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `server.info` | Get Plex Media Server identity and configuration | false | - | `Value` |
| `server.capabilities` | Get server media provider capabilities | false | - | `Value` |
| `library.list` | List all library sections (Movies, TV Shows, Music, etc.) | false | - | `Value` |
| `library.get` | Get metadata for a specific library section | false | `section_id*: string` | `Value` |
| `library.scan` | Trigger a scan of a library section for new content | false | `section_id*: string` | `Value` |
| `library.refresh` | Force a metadata refresh for a library section (re-downloads all metadata) | true | `section_id*: string` | `Value` |
| `media.search` | Search for media items across libraries | false | `query*: string`<br>`limit: integer`<br>`section_id: string` | `Value` |
| `media.get` | Get metadata for a specific media item by rating key | false | `rating_key*: string` | `Value` |
| `session.list` | List all active playback sessions | false | - | `Value` |
| `session.terminate` | Terminate an active playback session | true | `session_id*: string`<br>`reason: string` | `Value` |
| `playlist.list` | List all playlists | false | - | `Value` |
| `playlist.get` | Get a specific playlist by rating key | false | `playlist_id*: string` | `Value` |
| `playlist.create` | Create a new playlist | true | `title*: string`<br>`playlist_type*: string`<br>`uri: string` | `Value` |
| `playlist.delete` | Delete a playlist by rating key | true | `playlist_id*: string` | `void` |
| `library.browse` | List all content in a library section | false | `section_id*: integer`<br>`type: string`<br>`sort: string` | `Value` |
| `library.empty-trash` | Permanently remove deleted items from a library section | true | `section_id*: integer` | `void` |
| `metadata.delete` | Delete a metadata item by rating key | true | `rating_key*: string` | `void` |
| `metadata.edit` | Edit metadata fields for an item (pass flat JSON object of key-value pairs) | false | `rating_key*: string`<br>`fields*: object` | `Value` |
| `metadata.refresh` | Re-download metadata from agents for a specific item | false | `rating_key*: string` | `void` |
| `session.history` | Get recently played items (session history) | false | `account_id: integer`<br>`limit: integer` | `Value` |
| `hubs.continue-watching` | Get Continue Watching hub items | false | - | `Value` |
| `butler.list` | List all butler tasks and their current status | false | - | `Value` |
| `butler.run` | Trigger a specific butler task by name (e.g. `BackupDatabase`) | false | `task_name*: string` | `void` |
| `item.scrobble` | Mark a media item as played | false | `rating_key*: string` | `void` |
| `item.unscrobble` | Mark a media item as unplayed | false | `rating_key*: string` | `void` |
| `updater.status` | Get the current Plex Media Server update status | false | - | `Value` |
| `health` | Check server reachability and authentication | false | - | `Value` |

## `tautulli`

Plex Media Server analytics — activity, history, statistics, and user management

Category: `media`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `activity.list` | Get current Plex activity (all active streaming sessions) | false | - | `Value` |
| `activity.stream` | Get details for a single active session by session key | false | `session_key*: string` | `Value` |
| `history.list` | Get play history with optional filters | false | `page: integer`<br>`page_size: integer`<br>`order_dir: string`<br>`media_type: string`<br>`user_id: integer`<br>`section_id: integer`<br>`rating_key: integer` | `Value` |
| `users.list` | List all Tautulli users | false | - | `Value` |
| `users.get` | Get user details by user ID | false | `user_id*: integer` | `Value` |
| `users.watch_time` | Get watch time statistics for a user | false | `user_id*: integer` | `Value` |
| `users.player_stats` | Get player statistics for a user | false | `user_id*: integer` | `Value` |
| `libraries.list` | List all Plex libraries tracked by Tautulli | false | - | `Value` |
| `libraries.get` | Get library details by section ID | false | `section_id*: integer` | `Value` |
| `libraries.media_info` | Get media info listing for a library | false | `section_id*: integer` | `Value` |
| `stats.home` | Get home stats (most played, most active users, recently added) | false | `time_range: integer`<br>`stats_count: integer` | `Value` |
| `stats.plays_by_date` | Get play count statistics grouped by date | false | `time_range: integer`<br>`y_axis: string` | `Value` |
| `media.recently-added` | Get recently added media items | false | `count: integer`<br>`section_id: string` | `Value` |
| `media.metadata` | Get metadata for a media item by rating key | false | `rating_key*: string` | `Value` |
| `media.children` | Get children metadata for a media item by rating key | false | `rating_key*: string` | `Value` |
| `media.export-metadata` | Export metadata for a media item | false | `rating_key*: string`<br>`media_type*: string` | `Value` |
| `user.item-stats` | Get user statistics for a media item by rating key | false | `rating_key*: string`<br>`media_type: string` | `Value` |
| `user.delete-history` | Delete all play history for a user (permanent) | true | `user_id*: integer` | `Value` |
| `plays.by-day` | Get play count grouped by day of week | false | `time_range: integer` | `Value` |
| `plays.by-hour` | Get play count grouped by hour of day | false | `time_range: integer` | `Value` |
| `plays.by-stream-type` | Get play count grouped by stream type (transcode vs direct play) | false | `time_range: integer` | `Value` |
| `plays.by-month` | Get play count grouped by month | false | `time_range: integer` | `Value` |
| `server.pms-update` | Check for Plex Media Server updates | false | - | `Value` |
| `system.info` | Get Tautulli server info and status | false | - | `Value` |
| `system.settings` | Get Tautulli settings | false | - | `Value` |

## `sabnzbd`

Usenet download client

Category: `download`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `server.version` | Return SABnzbd version string | false | - | `string` |
| `queue.list` | List items in the download queue with status and progress | false | - | `QueueResponse` |
| `queue.delete` | Delete an item from the download queue | true | `nzo_id*: string` | `bool` |
| `history.list` | List download history | false | `limit: integer` | `HistoryResponse` |
| `history.delete` | Delete a single history item | true | `nzo_id*: string` | `bool` |
| `history.purge` | Purge all completed history items | true | - | `bool` |
| `server.stats` | Return download statistics (total/month/week/day) | false | - | `ServerStats` |
| `server.warnings` | List SABnzbd warnings | false | - | `string[]` |
| `queue.pause` | Pause the download queue | false | - | `bool` |
| `queue.resume` | Resume the download queue | false | - | `bool` |
| `queue.speed.limit` | Set the download speed limit in KB/s (0 = unlimited) | false | `kbps*: integer` | `bool` |
| `queue.addurl` | Add a URL (NZB, magnet, or direct link) to the download queue | false | `url*: string`<br>`cat: string`<br>`priority: string` | `object` |
| `history.retry` | Retry a single failed history item by NZO ID | false | `nzo_id*: string` | `bool` |
| `history.retry-all` | Retry all failed history items | false | - | `bool` |
| `server.fullstatus` | Return detailed server status including connection info and queue details | false | - | `object` |
| `category.list` | List configured download categories | false | - | `object` |
| `queue.set-complete-action` | Set the action to perform when the queue completes (e.g. shutdown, hibernate, sleep) | false | `action*: string` | `bool` |
| `pp.pause` | Pause post-processing | false | - | `bool` |
| `pp.resume` | Resume post-processing | false | - | `bool` |
| `rss.fetch-now` | Trigger an immediate RSS feed fetch | false | - | `object` |
| `config.get` | Get the full SABnzbd configuration (sensitive fields redacted) | false | - | `object` |

## `qbittorrent`

BitTorrent download client

Category: `download`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Show the schema for a specific action | false | `action*: string` | `ActionSpec` |
| `transfer.info` | Get global transfer info (speeds, limits, DHT nodes, connection status) | false | - | `TransferInfo` |
| `transfer.download.limit` | Set global download speed limit in bytes/s (0 = unlimited) | false | `limit*: integer` | `{}` |
| `transfer.upload.limit` | Set global upload speed limit in bytes/s (0 = unlimited) | false | `limit*: integer` | `{}` |
| `torrent.list` | List torrents, optionally filtered by state or category | false | `filter: string`<br>`category: string`<br>`limit: integer` | `Torrent[]` |
| `torrent.properties` | Get detailed properties of a torrent by hash | false | `hash*: string` | `TorrentProperties` |
| `torrent.trackers` | Get tracker list for a torrent by hash | false | `hash*: string` | `Tracker[]` |
| `torrent.pause` | Pause one or more torrents (pipe-separated hashes, or 'all') | false | `hashes*: string` | `{}` |
| `torrent.resume` | Resume one or more torrents (pipe-separated hashes, or 'all') | false | `hashes*: string` | `{}` |
| `torrent.delete` | Delete one or more torrents and optionally their data | true | `hashes*: string`<br>`delete_files: bool` | `{}` |
| `torrent.recheck` | Force re-hash verification of one or more torrents | false | `hashes*: string` | `{}` |
| `torrent.category.set` | Set the category for one or more torrents | false | `hashes*: string`<br>`category*: string` | `{}` |
| `torrent.download.limit` | Set per-torrent download limit in bytes/s (0 = unlimited) | false | `hashes*: string`<br>`limit*: integer` | `{}` |
| `torrent.upload.limit` | Set per-torrent upload limit in bytes/s (0 = unlimited) | false | `hashes*: string`<br>`limit*: integer` | `{}` |
| `category.list` | List all torrent categories | false | - | `Category[]` |
| `app.version` | Get the qBittorrent application version | false | - | `string` |
| `app.preferences` | Get application preferences (save path, rate limits, slot limits) | false | - | `Preferences` |
| `log.list` | Get application log entries | false | `last_known_id: integer` | `LogEntry[]` |
| `torrent.add` | Add one or more torrents by URL (magnet links or HTTP URLs, newline-separated) | false | `urls*: string`<br>`savepath: string`<br>`category: string`<br>`tags: string` | `{}` |
| `transfer.toggle-speed-limits` | Toggle alternative speed limits mode on/off | false | - | `{}` |
| `torrent.files` | Get the file list for a torrent by hash | false | `hash*: string` | `TorrentFile[]` |
| `torrent.set-file-prio` | Set the download priority for a specific file within a torrent | false | `hash*: string`<br>`id*: string`<br>`priority*: integer` | `{}` |
| `torrent.set-location` | Move one or more torrents to a new save location | false | `hashes*: string`<br>`location*: string` | `{}` |
| `torrent.add-tags` | Add tags to one or more torrents | false | `hashes*: string`<br>`tags*: string` | `{}` |
| `torrent.remove-tags` | Remove tags from one or more torrents (empty tags string removes all tags) | false | `hashes*: string`<br>`tags*: string` | `{}` |
| `torrent.reannounce` | Force re-announce one or more torrents to all their trackers | false | `hashes*: string` | `{}` |
| `torrent.set-share-limits` | Set ratio and seeding time share limits for one or more torrents | false | `hashes*: string`<br>`ratio_limit*: number`<br>`seeding_time_limit*: integer`<br>`inactive_seeding_time_limit*: integer` | `{}` |
| `category.create` | Create a new torrent category | false | `category*: string`<br>`savepath: string` | `{}` |
| `category.edit` | Edit an existing torrent category's save path | false | `category*: string`<br>`savepath*: string` | `{}` |
| `sync.maindata` | Get sync maindata (full state or incremental delta). Callers must store and pass back the rid from the previous response for incremental delta updates. | false | `rid: integer` | `SyncMaindata` |

## `tailscale`

WireGuard-based mesh VPN — list devices, manage auth keys, query DNS settings

Category: `network`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `device.list` | List all devices in the tailnet | false | - | `DeviceList` |
| `device.get` | Get details for a specific device by ID | false | `device_id*: string` | `Device` |
| `device.delete` | Remove a device from the tailnet | true | `device_id*: string` | `void` |
| `device.authorize` | Authorize or de-authorize a device | false | `device_id*: string`<br>`authorized*: bool` | `void` |
| `key.list` | List all auth keys for the tailnet | false | - | `KeyList` |
| `key.get` | Get details for a specific auth key | false | `key_id*: string` | `AuthKey` |
| `key.delete` | Delete an auth key | true | `key_id*: string` | `void` |
| `dns.nameservers` | Get DNS nameservers configured for the tailnet | false | - | `DnsNameservers` |
| `dns.search_paths` | Get DNS search paths configured for the tailnet | false | - | `DnsSearchPaths` |
| `dns.split-get` | Get the split DNS configuration for the tailnet | false | - | `object` |
| `dns.split-set` | Replace the split DNS configuration for the tailnet | false | `config*: object` | `object` |
| `acl.get` | Get the current ACL policy file for the tailnet | false | - | `object` |
| `acl.validate` | Validate an ACL policy file without applying it | false | `policy*: object` | `object` |
| `acl.set` | Set the ACL policy file for the tailnet (validates first) | false | `policy*: object` | `object` |
| `device.routes-get` | Get advertised and accepted routes for a device | false | `device_id*: string` | `object` |
| `device.routes-set` | Set the subnet routes for a device | false | `device_id*: string`<br>`routes*: array` | `object` |
| `device.tag` | Set tags on a device (replaces existing tags) | false | `device_id*: string`<br>`tags*: array` | `void` |
| `device.expire` | Expire the key for a device, forcing re-authentication | true | `device_id*: string` | `void` |
| `user.list` | List all users in the tailnet | false | - | `object` |
| `tailnet.settings-get` | Get tailnet-level settings | false | - | `object` |
| `tailnet.settings-patch` | Patch tailnet-level settings | false | `settings*: object` | `object` |
| `key.create` | Create a new auth key for the tailnet | false | `capabilities*: object` | `object` |

## `linkding`

Self-hosted bookmark manager with tagging and search

Category: `notes`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `bookmark.list` | List bookmarks with optional search and pagination | false | `q: string`<br>`limit: integer`<br>`offset: integer` | `Value` |
| `bookmark.archived.list` | List archived bookmarks with optional search and pagination | false | `q: string`<br>`limit: integer`<br>`offset: integer` | `Value` |
| `bookmark.get` | Retrieve a single bookmark by ID | false | `id*: integer` | `Value` |
| `bookmark.check` | Check whether a URL is already bookmarked | false | `url*: string` | `Value` |
| `bookmark.create` | Create a new bookmark | false | `url*: string`<br>`title: string`<br>`description: string`<br>`notes: string`<br>`is_archived: bool`<br>`unread: bool`<br>`shared: bool`<br>`tag_names: json`<br>`payload: json` | `Value` |
| `bookmark.update` | Partially update a bookmark (PATCH — only provided fields are changed) | false | `id*: integer`<br>`url: string`<br>`title: string`<br>`description: string`<br>`notes: string`<br>`unread: bool`<br>`shared: bool`<br>`tag_names: json`<br>`payload: json` | `Value` |
| `bookmark.archive` | Archive a bookmark | false | `id*: integer` | `Value` |
| `bookmark.unarchive` | Unarchive a bookmark | false | `id*: integer` | `Value` |
| `bookmark.delete` | Delete a bookmark by ID | true | `id*: integer` | `void` |
| `tag.list` | List all tags | false | - | `Value` |
| `tag.get` | Retrieve a single tag by ID | false | `id*: integer` | `Value` |
| `tag.create` | Create a new tag (linkding has no tag-delete API — tags are permanent) | false | `name*: string`<br>`payload: json` | `Value` |
| `user.profile` | Retrieve user profile and preferences | false | - | `Value` |
| `bundle.list` | List all bundles (saved searches) | false | - | `Value` |
| `bundle.create` | Create a new bundle (saved search) | false | `name*: string`<br>`search_query*: string`<br>`description: string` | `Bundle` |
| `bundle.update` | Partially update a bundle (PATCH — only provided fields are changed) | false | `id*: integer`<br>`payload*: json` | `Bundle` |
| `bundle.delete` | Delete a bundle by ID | true | `id*: integer` | `void` |
| `bookmark.assets` | List assets attached to a bookmark (snapshots, PDFs) | false | `id*: integer` | `Vec<BookmarkAsset>` |
| `bookmark.assets-upload` | Upload an asset file for a bookmark via multipart/form-data | false | `id*: integer`<br>`file_name*: string`<br>`file_base64*: string` | `BookmarkAsset` |

## `memos`

Lightweight self-hosted memo hub for short-form notes and journals

Category: `notes`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `memos.list` | List memos, optionally filtered by creator, tag, or paginated | false | `creator: string`<br>`tag: string`<br>`page_size: integer`<br>`page_token: string` | `Value` |
| `memos.get` | Get a single memo by resource name (e.g. "memos/123") | false | `name*: string` | `Value` |
| `memos.create` | Create a new memo | false | `content*: string`<br>`visibility: string` | `Value` |
| `memos.update` | Update a memo by resource name (PATCH — only provided fields are changed) | false | `name*: string`<br>`content: string`<br>`visibility: string` | `Value` |
| `memos.delete` | Delete a memo by resource name | true | `name*: string` | `void` |
| `tags.list` | List all tags | false | - | `Value` |
| `workspace.profile` | Get workspace profile (name, version, owner) | false | - | `Value` |
| `user.me` | Get the authenticated user's profile | false | - | `Value` |
| `user.list` | List all users (admin only; returns auth_failed for non-admins) | false | - | `Value` |
| `user.stats` | Get memo statistics for a user by resource name (e.g. "users/1" or "users/me") | false | `user*: string` | `Value` |
| `webhook.list` | List webhooks for a user by resource name | false | `user*: string` | `Value` |
| `webhook.create` | Create a webhook for a user | false | `user*: string`<br>`url*: string`<br>`name*: string` | `Value` |
| `attachment.upload` | Upload a file attachment via multipart/form-data (base64-encoded bytes) | false | `filename*: string`<br>`data_base64*: string`<br>`mime_type*: string` | `Value` |
| `attachment.delete` | Delete an attachment by resource name | true | `name*: string` | `void` |
| `memo.comment-list` | List comments on a memo | false | `name*: string` | `Value` |
| `memo.comment-create` | Create a comment on a memo | false | `name*: string`<br>`content*: string` | `Value` |
| `memo.share-list` | List share links for a memo | false | `name*: string` | `Value` |
| `memo.share-create` | Create a share link for a memo | false | `name*: string` | `Value` |

## `bytestash`

Self-hosted code snippet manager

Category: `notes`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `auth.config` | Get auth provider configuration | false | - | `Value` |
| `auth.register` | Register a new user | true | `username*: string`<br>`password*: string`<br>`payload: json` | `Value` |
| `auth.login` | Log in and receive a JWT | false | `username*: string`<br>`password*: string`<br>`payload: json` | `Value` |
| `snippets.list` | List the caller's snippets | false | - | `Value` |
| `snippets.get` | Get one snippet | false | `id*: string` | `Value` |
| `snippets.create` | Create a snippet | true | `title*: string`<br>`description: string`<br>`language: string`<br>`fragments: json`<br>`categories: json`<br>`payload: json` | `Value` |
| `snippets.update` | Update a snippet | true | `id*: string`<br>`title: string`<br>`description: string`<br>`language: string`<br>`fragments: json`<br>`categories: json`<br>`payload: json` | `Value` |
| `snippets.delete` | Delete a snippet | true | `id*: string` | `void` |
| `snippets.public.list` | List public snippets | false | - | `Value` |
| `snippets.public.get` | Get one public snippet | false | `id*: string` | `Value` |
| `snippets.share.create` | Create a share link for a snippet | true | `snippetId*: string`<br>`requiresAuth: bool`<br>`expiresIn: integer`<br>`payload: json` | `Value` |
| `snippets.share.get` | Get a shared snippet | false | `share_id*: string` | `Value` |
| `categories.list` | List snippet metadata including all categories in use | false | - | `Value` |
| `users.list` | List users | false | - | `Value` |
| `users.toggle-active` | Toggle a user's active status (admin only) | true | `id*: string` | `Value` |
| `users.delete` | Delete a user | true | `id*: string` | `void` |

## `paperless`

Self-hosted document management system with OCR and full-text search

Category: `documents`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `documents.list` | List documents with optional filters | false | `query: string`<br>`page: integer`<br>`page_size: integer`<br>`ordering: string`<br>`correspondent: integer`<br>`document_type: integer`<br>`tags__id__all: string` | `Value` |
| `documents.get` | Get a single document by ID | false | `id*: integer` | `Value` |
| `documents.metadata` | Get full metadata for a document | false | `id*: integer` | `Value` |
| `documents.update` | Partially update a document (PATCH) | true | `id*: integer`<br>`title: string`<br>`correspondent: integer`<br>`document_type: integer`<br>`tags: json`<br>`payload: json` | `Value` |
| `documents.delete` | Delete a document permanently | true | `id*: integer` | `void` |
| `tags.list` | List all tags | false | - | `Value` |
| `tags.get` | Get a tag by ID | false | `id*: integer` | `Value` |
| `tags.create` | Create a tag | true | `name*: string`<br>`colour: string`<br>`is_inbox_tag: bool`<br>`payload: json` | `Value` |
| `tags.delete` | Delete a tag | true | `id*: integer` | `void` |
| `correspondents.list` | List all correspondents | false | - | `Value` |
| `correspondents.get` | Get a correspondent by ID | false | `id*: integer` | `Value` |
| `correspondents.create` | Create a correspondent | true | `name*: string`<br>`payload: json` | `Value` |
| `correspondents.delete` | Delete a correspondent | true | `id*: integer` | `void` |
| `document_types.list` | List all document types | false | - | `Value` |
| `document_types.get` | Get a document type by ID | false | `id*: integer` | `Value` |
| `document_types.create` | Create a document type | true | `name*: string`<br>`payload: json` | `Value` |
| `document_types.delete` | Delete a document type | true | `id*: integer` | `void` |
| `statistics` | Get instance statistics (total documents, inbox count, etc.) | false | - | `Value` |
| `tasks.list` | List async task status | false | - | `Value` |
| `document.upload` | Upload a document via multipart/form-data | false | `file_base64*: string`<br>`filename*: string`<br>`title: string`<br>`correspondent: integer`<br>`document_type: integer`<br>`tags: json` | `Value` |
| `document.bulk-edit` | Perform a bulk operation on multiple documents (delete, set_correspondent, set_document_type, add_tag, remove_tag, etc.) | true | `documents*: json`<br>`method*: string`<br>`parameters: json` | `Value` |
| `document.download` | Download a document and return base64-encoded content | false | `id*: integer`<br>`original: bool` | `Value` |
| `tag.update` | Partially update a tag (PATCH) | false | `id*: integer`<br>`name: string`<br>`colour: string`<br>`match: string` | `Value` |
| `saved-view.list` | List all saved views | false | - | `Value` |
| `saved-view.create` | Create a saved view | false | `payload*: json` | `Value` |
| `custom-field.list` | List all custom fields | false | - | `Value` |
| `custom-field.create` | Create a custom field | false | `name*: string`<br>`data_type*: string` | `Value` |
| `storage-path.list` | List all storage paths | false | - | `Value` |
| `storage-path.create` | Create a storage path | false | `payload*: json` | `Value` |

## `arcane`

Docker management UI — environments, containers, images, and volumes

Category: `network`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `health` | Check Arcane API health | false | - | `HealthResponse` |
| `environment.list` | List all registered Docker environments | false | - | `Environment[]` |
| `environment.get` | Get details for a specific environment by ID | false | `id*: string` | `Environment` |
| `container.list` | List all containers in an environment | false | `env_id*: string` | `Container[]` |
| `container.get` | Get details for a specific container | false | `env_id*: string`<br>`container_id*: string` | `Container` |
| `container.start` | Start a stopped container | false | `env_id*: string`<br>`container_id*: string` | `ContainerActionResult` |
| `container.stop` | Stop a running container | false | `env_id*: string`<br>`container_id*: string` | `ContainerActionResult` |
| `container.restart` | Restart a container | false | `env_id*: string`<br>`container_id*: string` | `ContainerActionResult` |
| `container.redeploy` | Redeploy a container (pull latest image and recreate) | true | `env_id*: string`<br>`container_id*: string` | `ContainerActionResult` |
| `project.list` | List all Compose/Docker projects in an environment | false | `env_id*: string` | `Project[]` |
| `project.create` | Create a new project in an environment | false | `env_id*: string`<br>`body*: object` | `Project` |
| `project.up` | Bring a project up (docker compose up) | false | `env_id*: string`<br>`project_id*: string` | `ProjectActionResult` |
| `project.down` | Bring a project down (docker compose down) | true | `env_id*: string`<br>`project_id*: string` | `ProjectActionResult` |
| `project.redeploy` | Redeploy a project (pull latest images and recreate) | false | `env_id*: string`<br>`project_id*: string` | `ProjectActionResult` |
| `volume.list` | List all Docker volumes in an environment | false | `env_id*: string` | `Volume[]` |
| `volume.delete` | Delete a Docker volume by name | true | `env_id*: string`<br>`volume_name*: string` | `void` |
| `volume.prune` | Prune all unused Docker volumes in an environment | true | `env_id*: string` | `PruneResult` |
| `image.list` | List all Docker images in an environment | false | `env_id*: string` | `Image[]` |
| `image.pull` | Pull a Docker image in an environment | false | `env_id*: string`<br>`image*: string` | `ImagePullResult` |
| `image.prune` | Prune unused Docker images in an environment | true | `env_id*: string` | `ImagePruneResult` |
| `image.update-summary` | Get a summary of available image updates in an environment | false | `env_id*: string` | `ImageUpdateSummary` |

## `unraid`

Unraid server GraphQL API — system info, metrics, array status, Docker, and disk management

Category: `network`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `system.info` | Return detailed system information (OS, CPU, versions) | false | - | `SystemInfo` |
| `system.metrics` | Return current CPU and memory utilisation metrics | false | - | `SystemMetrics` |
| `system.array` | Return array state and disk list (data, parity, cache) | false | - | `ArrayStatus` |
| `system.online` | Return whether the Unraid server reports itself as online | false | - | `object: { online: bool }` |
| `docker.list` | List all Docker containers | false | - | `Vec<DockerContainer>` |
| `docker.start` | Start a Docker container | true | `id*: string` | `void` |
| `docker.stop` | Stop a Docker container | true | `id*: string` | `void` |
| `docker.restart` | Restart a Docker container (stop then start) | true | `id*: string` | `void` |
| `disk.list` | List physical disks attached to the server | false | - | `Vec<DiskInfo>` |
| `vm.list` | List all virtual machines | false | - | `Vec<VmInfo>` |
| `vm.start` | Start a virtual machine | true | `id*: string` | `{ ok: true, id: string }` |
| `vm.stop` | Stop a virtual machine (may corrupt unsaved VM work) | true | `id*: string` | `{ ok: true, id: string }` |
| `vm.pause` | Pause a running virtual machine | true | `id*: string` | `{ ok: true, id: string }` |
| `vm.resume` | Resume a paused virtual machine | false | `id*: string` | `{ ok: true, id: string }` |
| `notification.list` | List all server notifications | false | - | `Vec<NotificationInfo>` |
| `notification.create` | Create a new server notification | false | `title*: string`<br>`description: string`<br>`importance: string`<br>`type: string` | `{ ok: true }` |
| `notification.archive` | Archive a notification by ID | true | `id*: string` | `{ ok: true, id: string }` |
| `parity.history` | Return parity check history | false | - | `Vec<ParityHistoryEntry>` |
| `parity.check-start` | Start a parity check | false | `correcting: bool` | `{ ok: true }` |
| `parity.check-pause` | Pause a running parity check | false | - | `{ ok: true }` |
| `parity.check-cancel` | Cancel a running parity check (destructive — invalidates partial parity data) | true | - | `{ ok: true }` |
| `share.list` | List all user shares | false | - | `Vec<Share>` |
| `plugin.list` | List installed Unraid plugins | false | - | `Vec<Plugin>` |
| `network.list` | Return network interface information | false | - | `NetworkInfo` |
| `ups.devices` | List UPS devices attached to the server | false | - | `Vec<UpsDevice>` |
| `ups.config` | Return UPS configuration | false | - | `UpsConfig` |
| `log.read` | Read lines from a log file on the server | false | `path*: string`<br>`lines: integer` | `{ content: string }` |
| `flash.status` | Return flash drive status | false | - | `FlashStatus` |
| `flash.backup` | Initiate a flash drive backup (overwrites existing backup) | true | - | `{ ok: true }` |

## `unifi`

UniFi Network Application local API

Category: `network`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `system.info` | Return application version and runtime metadata | false | - | `ApplicationInfo` |
| `sites.list` | List local `UniFi` sites | false | - | `Page` |
| `wans.list` | List WAN interfaces for one site | false | `site_id*: string` | `Page` |
| `vpn.site-to-site-tunnels.list` | List site-to-site VPN tunnels | false | `site_id*: string` | `Page` |
| `vpn.servers.list` | List VPN servers for one site | false | `site_id*: string` | `Page` |
| `radius.profiles.list` | List RADIUS profiles for one site | false | `site_id*: string` | `Page` |
| `device-tags.list` | List device tags for one site | false | `site_id*: string` | `Page` |
| `dpi.categories.list` | List DPI categories | false | - | `Page` |
| `dpi.applications.list` | List DPI applications | false | - | `Page` |
| `countries.list` | List supported countries | false | - | `Page` |
| `wan.get` | Inspect one WAN interface for one site | false | `site_id*: string`<br>`wan_id*: string` | `Wan` |
| `devices.list` | List adopted devices for one site | false | `site_id*: string` | `Page` |
| `devices.get` | Inspect one adopted device | false | `site_id*: string`<br>`device_id*: string` | `Device` |
| `devices.stats` | Get latest statistics for one adopted device | false | `site_id*: string`<br>`device_id*: string` | `DeviceStats` |
| `pending-devices.list` | List devices pending adoption | false | - | `Page` |
| `devices.create` | Adopt a device into a site | true | `site_id*: string`<br>`mac_address*: string`<br>`ignore_device_limit: boolean` | `Device` |
| `devices.port-action` | Perform an action on one port of a device | true | `site_id*: string`<br>`device_id*: string`<br>`port_idx*: integer`<br>`action*: string` | `Value` |
| `devices.action` | Perform an action on a device (restart, etc.) | true | `site_id*: string`<br>`device_id*: string`<br>`action*: string` | `Value` |
| `devices.delete` | Remove (forget) an adopted device | true | `site_id*: string`<br>`device_id*: string` | `Confirmation` |
| `device.update` | Update configuration for one adopted device | true | `site_id*: string`<br>`device_id*: string` | `Device` |
| `clients.list` | List active clients for one site | false | `site_id*: string` | `Page` |
| `clients.get` | Inspect one client | false | `site_id*: string`<br>`client_id*: string` | `Client` |
| `clients.action` | Perform an action on a client (block, reconnect, etc.) | true | `site_id*: string`<br>`client_id*: string`<br>`action*: string` | `Value` |
| `client.history` | Retrieve connection history for one client by MAC address | false | `site_id*: string`<br>`client_mac*: string` | `Page` |
| `client.block` | Block a client by MAC address (cuts network access) | true | `site_id*: string`<br>`client_mac*: string` | `Confirmation` |
| `client.unblock` | Unblock a previously blocked client by MAC address | false | `site_id*: string`<br>`client_mac*: string` | `Confirmation` |
| `networks.list` | List networks for one site | false | `site_id*: string` | `Page` |
| `networks.get` | Inspect one network | false | `site_id*: string`<br>`network_id*: string` | `Network` |
| `networks.references` | List references to a network (VLANs, Wi-Fi, etc.) | false | `site_id*: string`<br>`network_id*: string` | `References` |
| `networks.create` | Create a network | true | `site_id*: string` | `Network` |
| `networks.update` | Update a network | true | `site_id*: string`<br>`network_id*: string` | `Network` |
| `networks.delete` | Delete a network | true | `site_id*: string`<br>`network_id*: string` | `Confirmation` |
| `wifi.broadcasts.list` | List Wi-Fi broadcasts (SSIDs) for one site | false | `site_id*: string` | `Page` |
| `wifi.broadcasts.get` | Inspect one Wi-Fi broadcast | false | `site_id*: string`<br>`wifi_broadcast_id*: string` | `WifiBroadcast` |
| `wifi.broadcasts.create` | Create a Wi-Fi broadcast | true | `site_id*: string` | `WifiBroadcast` |
| `wifi.broadcasts.update` | Update a Wi-Fi broadcast | true | `site_id*: string`<br>`wifi_broadcast_id*: string` | `WifiBroadcast` |
| `wifi.broadcasts.delete` | Delete a Wi-Fi broadcast | true | `site_id*: string`<br>`wifi_broadcast_id*: string` | `Confirmation` |
| `wifi.update` | Update Wi-Fi configuration for one site | true | `site_id*: string`<br>`wifi_id*: string` | `Value` |
| `hotspot.vouchers.list` | List hotspot vouchers for one site | false | `site_id*: string` | `Page` |
| `hotspot.vouchers.create` | Create a hotspot voucher | true | `site_id*: string` | `Voucher` |
| `hotspot.vouchers.delete` | Delete hotspot vouchers (with optional filter) | true | `site_id*: string`<br>`filter: string` | `Confirmation` |
| `hotspot.vouchers.get` | Inspect one hotspot voucher | false | `site_id*: string`<br>`voucher_id*: string` | `Voucher` |
| `firewall.zones.list` | List firewall zones for one site | false | `site_id*: string` | `Page` |
| `firewall.zones.get` | Inspect one firewall zone | false | `site_id*: string`<br>`firewall_zone_id*: string` | `FirewallZone` |
| `firewall.zones.create` | Create a firewall zone | true | `site_id*: string` | `FirewallZone` |
| `firewall.zones.update` | Update a firewall zone | true | `site_id*: string`<br>`firewall_zone_id*: string` | `FirewallZone` |
| `firewall.zones.delete` | Delete a firewall zone | true | `site_id*: string`<br>`firewall_zone_id*: string` | `Confirmation` |
| `firewall.policies.list` | List firewall policies for one site | false | `site_id*: string` | `Page` |
| `firewall.policies.get` | Inspect one firewall policy | false | `site_id*: string`<br>`firewall_policy_id*: string` | `FirewallPolicy` |
| `firewall.policies.create` | Create a firewall policy | true | `site_id*: string` | `FirewallPolicy` |
| `firewall.policies.update` | Replace a firewall policy | true | `site_id*: string`<br>`firewall_policy_id*: string` | `FirewallPolicy` |
| `firewall.policies.patch` | Partially update a firewall policy | true | `site_id*: string`<br>`firewall_policy_id*: string` | `FirewallPolicy` |
| `firewall.policies.ordering.get` | Get firewall policy ordering | false | `site_id*: string` | `Ordering` |
| `firewall.policies.ordering.set` | Set firewall policy ordering | true | `site_id*: string` | `Ordering` |
| `acl.rules.list` | List ACL rules for one site | false | `site_id*: string` | `Page` |
| `acl.rules.get` | Inspect one ACL rule | false | `site_id*: string`<br>`acl_rule_id*: string` | `AclRule` |
| `acl.rules.create` | Create an ACL rule | true | `site_id*: string` | `AclRule` |
| `acl.rules.update` | Update an ACL rule | true | `site_id*: string`<br>`acl_rule_id*: string` | `AclRule` |
| `acl.rules.delete` | Delete an ACL rule | true | `site_id*: string`<br>`acl_rule_id*: string` | `Confirmation` |
| `acl.rules.ordering.get` | Get ACL rule ordering | false | `site_id*: string` | `Ordering` |
| `acl.rules.ordering.set` | Set ACL rule ordering | true | `site_id*: string` | `Ordering` |
| `switching.switch-stacks.list` | List switch stacks for one site | false | `site_id*: string` | `Page` |
| `switching.switch-stacks.get` | Inspect one switch stack | false | `site_id*: string`<br>`switch_stack_id*: string` | `SwitchStack` |
| `switching.mc-lag-domains.list` | List MC-LAG domains for one site | false | `site_id*: string` | `Page` |
| `switching.mc-lag-domains.get` | Inspect one MC-LAG domain | false | `site_id*: string`<br>`mc_lag_domain_id*: string` | `McLagDomain` |
| `switching.lags.list` | List LAGs for one site | false | `site_id*: string` | `Page` |
| `switching.lags.get` | Inspect one LAG | false | `site_id*: string`<br>`lag_id*: string` | `Lag` |
| `port-profile.list` | List port profiles for one site | false | `site_id*: string` | `Page` |
| `port-profile.create` | Create a port profile for one site | true | `site_id*: string` | `PortProfile` |
| `port-profile.update` | Update an existing port profile | true | `site_id*: string`<br>`port_profile_id*: string` | `PortProfile` |
| `dns.policies.list` | List DNS policies for one site | false | `site_id*: string` | `Page` |
| `dns.policies.get` | Inspect one DNS policy | false | `site_id*: string`<br>`dns_policy_id*: string` | `DnsPolicy` |
| `dns.policies.create` | Create a DNS policy | true | `site_id*: string` | `DnsPolicy` |
| `dns.policies.update` | Update a DNS policy | true | `site_id*: string`<br>`dns_policy_id*: string` | `DnsPolicy` |
| `dns.policies.delete` | Delete a DNS policy | true | `site_id*: string`<br>`dns_policy_id*: string` | `Confirmation` |
| `traffic-matching-lists.list` | List traffic matching lists for one site | false | `site_id*: string` | `Page` |
| `traffic-matching-lists.get` | Inspect one traffic matching list | false | `site_id*: string`<br>`traffic_matching_list_id*: string` | `TrafficMatchingList` |
| `traffic-matching-lists.create` | Create a traffic matching list | true | `site_id*: string` | `TrafficMatchingList` |
| `traffic-matching-lists.update` | Update a traffic matching list | true | `site_id*: string`<br>`traffic_matching_list_id*: string` | `TrafficMatchingList` |
| `traffic-matching-lists.delete` | Delete a traffic matching list | true | `site_id*: string`<br>`traffic_matching_list_id*: string` | `Confirmation` |

## `overseerr`

Request and approval frontend for Plex, Sonarr, and Radarr

Category: `media`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `health` | Probe Overseerr reachability and auth (lightweight ping) | false | - | `HealthStatus` |
| `status` | Get current Overseerr status (version, update info) | false | - | `OverseerrStatus` |
| `request.list` | List media requests with optional filters and pagination | false | `take: integer`<br>`skip: integer`<br>`filter: string`<br>`sort: string`<br>`requested_by: integer` | `RequestList` |
| `request.get` | Get a single request by ID | false | `id*: integer` | `MediaRequest` |
| `request.create` | Create a new media request for a movie or TV show | false | `media_type*: string`<br>`media_id*: integer`<br>`seasons: string`<br>`is4k: bool` | `MediaRequest` |
| `request.approve` | Approve a pending media request | false | `id*: integer` | `MediaRequest` |
| `request.decline` | Decline a pending media request | false | `id*: integer` | `MediaRequest` |
| `request.delete` | Delete a request permanently | true | `id*: integer` | `void` |
| `movie.search` | Search for movies by title or keywords | false | `query*: string`<br>`page: integer` | `SearchResponse` |
| `tv.search` | Search for TV shows by title or keywords | false | `query*: string`<br>`page: integer` | `SearchResponse` |
| `movie.get` | Get detailed information for a movie by TMDB ID | false | `tmdb_id*: integer` | `MovieDetail` |
| `tv.get` | Get detailed information for a TV show by TMDB ID | false | `tmdb_id*: integer` | `TvDetail` |
| `user.list` | List all Overseerr users with pagination | false | `take: integer`<br>`skip: integer` | `UserList` |
| `user.get` | Get a single user by ID | false | `id*: integer` | `User` |
| `issue.list` | List issues with optional filters and pagination | false | `take: integer`<br>`skip: integer`<br>`filter: string`<br>`sort: string` | `IssueList` |
| `issue.get` | Get a single issue by ID | false | `id*: integer` | `Issue` |
| `issue.create` | Create a new issue report for a media item | false | `issue_type*: integer`<br>`message*: string`<br>`media_id*: integer`<br>`problem_season: integer`<br>`problem_episode: integer` | `Issue` |
| `issue.comment` | Add a comment to an existing issue | false | `id*: integer`<br>`message*: string` | `IssueComment` |
| `request.retry` | Retry a failed media request | false | `id*: integer` | `MediaRequest` |
| `request.count` | Get request counts broken down by status | false | - | `RequestCount` |
| `issue.update` | Update the status of an issue (resolved or open) | false | `id*: integer`<br>`status*: string` | `Issue` |
| `media.delete` | Delete a media item permanently by Overseerr media ID | true | `id*: integer` | `void` |
| `media.update-status` | Update the status of a media item | false | `id*: integer`<br>`status*: string` | `void` |
| `user.requests` | List media requests belonging to a user | false | `id*: integer` | `RequestList` |
| `user.quota` | Get the quota information for a user | false | `id*: integer` | `UserQuota` |
| `user.edit` | Update a user by ID with a JSON body of fields to change | false | `id*: integer`<br>`body*: object` | `User` |
| `job.run` | Trigger a background job by its job ID string | false | `id*: string` | `JobResult` |
| `discover.trending` | Get trending media from the Overseerr discover endpoint | false | - | `DiscoverResponse` |

## `gotify`

Self-hosted push notification server

Category: `notifications`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `message.send` | Send a push notification to all subscribers of this app token | false | `message*: string`<br>`title: string`<br>`priority: integer` | `Message` |
| `message.list` | List messages (newest first) | false | `limit: integer` | `PagedMessages` |
| `message.delete` | Delete a single message by id | true | `id*: integer` | `void` |
| `message.purge` | Delete ALL messages on the server | true | - | `void` |
| `app.list` | List all applications (sending channels) | false | - | `Application[]` |
| `app.create` | Create an application and return its token | false | `name*: string`<br>`description: string` | `Application` |
| `app.delete` | Delete an application and all its messages | true | `id*: integer` | `void` |
| `client.list` | List all clients (receiving subscribers) | false | - | `Client[]` |
| `client.create` | Create a client and return its token | false | `name*: string` | `Client` |
| `client.delete` | Delete a client | true | `id*: integer` | `void` |
| `application.update` | Update an application's name or description | false | `id*: integer`<br>`name*: string`<br>`description: string` | `Application` |
| `application.messages` | List all messages for a specific application | false | `id*: integer`<br>`limit: integer` | `PagedMessages` |
| `application.messages-delete` | Delete ALL messages for a specific application | true | `id*: integer` | `void` |
| `client.update` | Update a client's name | false | `id*: integer`<br>`name*: string` | `Client` |
| `plugin.list` | List all server plugins | false | - | `Plugin[]` |
| `plugin.enable` | Enable a plugin | false | `id*: integer` | `void` |
| `plugin.disable` | Disable a plugin | false | `id*: integer` | `void` |
| `plugin.config-get` | Get plugin configuration as YAML text | false | `id*: integer` | `{config: string}` |
| `plugin.config-set` | Set plugin configuration from a YAML string | false | `id*: integer`<br>`config*: string` | `void` |
| `user.list` | List all users (admin only) | false | - | `User[]` |
| `user.create` | Create a user (admin only) | false | `name*: string`<br>`pass*: string`<br>`admin: bool` | `User` |
| `user.delete` | Delete a user (admin only) | true | `id*: integer` | `void` |
| `server.health` | Get server health status (no auth required) | false | - | `Health` |
| `server.version` | Get server version information | false | - | `ServerVersion` |

## `openai`

OpenAI API (chat, embeddings, models, images, audio)

Category: `ai`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `model.list` | List available models | false | - | `Model[]` |
| `chat.complete` | Create a chat completion | false | `model*: string`<br>`messages*: json`<br>`temperature: number`<br>`max_tokens: integer` | `ChatCompletionResponse` |
| `embed.create` | Create embeddings for one or more input strings | false | `model*: string`<br>`input: string`<br>`inputs: json`<br>`dimensions: integer` | `EmbeddingsResponse` |
| `server.health` | Check whether the OpenAI API (or compatible server) is reachable | false | - | `void` |

## `notebooklm`

Google NotebookLM notebooks, sources, and research artifacts

Category: `ai`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `notebook.list` | List NotebookLM notebooks | false | - | `Notebook[]` |
| `notebook.create` | Create a NotebookLM notebook | false | `title*: string` | `Notebook` |
| `notebook.get` | Get NotebookLM notebook details | false | `notebook_id*: string` | `Notebook` |
| `notebook.delete` | Delete a NotebookLM notebook | true | `notebook_id*: string` | `DeleteResult` |
| `source.list` | List sources in a NotebookLM notebook | false | `notebook_id*: string` | `Source[]` |
| `source.add_url` | Add a URL source to a NotebookLM notebook | false | `notebook_id*: string`<br>`url*: string` | `Source` |
| `server.health` | Check whether NotebookLM is reachable and authenticated | false | - | `Health` |

## `qdrant`

Vector database for similarity search and RAG

Category: `ai`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `server.health` | Check whether the Qdrant server is healthy | false | - | `void` |
| `collections.list` | List collection names | false | - | `CollectionDescription[]` |
| `collections.get` | Get raw metadata for one collection | false | `name*: string` | `Value` |
| `collection.create` | Create a new collection with vector configuration (PUT /collections/{name}) | false | `name*: string`<br>`size*: integer`<br>`distance*: string` | `Value` |
| `collection.delete` | Delete a collection and all its data (DELETE /collections/{name}) | true | `name*: string` | `void` |
| `point.upsert` | Upsert points into a collection (PUT /collections/{name}/points). Large batches auto-chunked at 500 points/chunk. Pass returned rid on subsequent calls. | false | `collection*: string`<br>`points*: array` | `Value` |
| `point.search` | Search for nearest neighbours (POST /collections/{name}/points/search) | false | `collection*: string`<br>`vector*: array`<br>`limit*: integer`<br>`filter: object`<br>`with_payload: bool`<br>`score_threshold: number` | `Value` |
| `point.query` | Universal query endpoint (POST /collections/{name}/points/query). Accepts any Qdrant query body. | false | `collection*: string`<br>`query*: object` | `Value` |
| `point.scroll` | Scroll through points in a collection (POST /collections/{name}/points/scroll) | false | `collection*: string`<br>`scroll: object` | `Value` |
| `point.count` | Count points matching an optional filter (POST /collections/{name}/points/count) | false | `collection*: string`<br>`filter: object` | `Value` |
| `point.delete` | Delete points by ids or filter (POST /collections/{name}/points/delete) | true | `collection*: string`<br>`points: array`<br>`filter: object` | `Value` |
| `snapshot.create` | Create a collection snapshot (POST /collections/{name}/snapshots) | false | `collection*: string` | `SnapshotInfo` |
| `index.create` | Create a payload field index (PUT /collections/{name}/index) | false | `collection*: string`<br>`field_name*: string`<br>`field_schema*: object` | `Value` |

## `tei`

Hugging Face TEI server — embeddings, rerankers, sequence classification

Category: `ai`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `server.health` | Check whether the TEI server is healthy | false | - | `void` |
| `server.info` | Get served model and runtime metadata | false | - | `Info` |
| `embed.create` | Generate embeddings for one or more input strings | false | `input: string`<br>`inputs: json`<br>`normalize: bool`<br>`truncate: bool`<br>`payload: json` | `number[][]` |
| `embed.rerank` | Rerank texts against a query (POST /rerank). Max 100 texts per call — split larger batches across multiple requests. | false | `query*: string`<br>`texts*: json`<br>`truncate: bool`<br>`raw_scores: bool` | `RerankHit[]` |
| `embed.tokenize` | Tokenize one or more input strings (POST /tokenize). Returns token-id sequences. | false | `inputs*: json`<br>`add_special_tokens: bool` | `u32[][]` |
| `embed.similarity` | Compute pairwise similarity scores for sentence pairs (POST /similarity). Inputs must be an array of [string, string] pairs. | false | `inputs*: json` | `f32[]` |
| `embed.sparse` | Generate sparse (SPLADE-style) embeddings for one or more inputs (POST /embed_sparse). | false | `inputs*: json`<br>`truncate: bool` | `SparseToken[][]` |
| `embed.openai` | Generate embeddings via the OpenAI-compatible endpoint (POST /v1/embeddings). Body and response are passed through as raw JSON. | false | `body*: json` | `json` |

## `apprise`

Universal notification dispatcher (100+ services behind one URL scheme)

Category: `notifications`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | Show this action catalog | false | - | `Catalog` |
| `schema` | Return the parameter schema for a named action | false | `action*: string` | `Schema` |
| `server.health` | Check whether the Apprise API is healthy | false | - | `HealthStatus` |
| `notify.send` | Send a stateless notification to the supplied URLs | false | `body: string`<br>`urls: json`<br>`title: string`<br>`type: string`<br>`format: string`<br>`tag: string`<br>`payload: json` | `void` |
| `notify.key.send` | Send a notification using a stored config key | false | `key*: string`<br>`body: string`<br>`title: string`<br>`type: string`<br>`format: string`<br>`tag: string`<br>`payload: json` | `void` |
| `config.add` | Persist a YAML/text Apprise config blob under a named key | false | `key*: string`<br>`config*: string`<br>`format: string` | `void` |
| `config.get` | Retrieve the stored config blob for a named key | false | `key*: string` | `{config: string}` |
| `config.delete` | Delete the stored config for a named key | true | `key*: string` | `void` |
| `config.urls` | List the notification URLs stored under a named key | false | `key*: string` | `Vec<{url: string, tags: Vec<string>}>` |
| `server.details` | Retrieve server details listing all loaded Apprise plugins | false | - | `json` |

## `deploy`

Build-and-push the lab release binary to SSH targets with integrity verification

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `help` | List deploy actions | false | - | `Catalog` |
| `schema` | Per-action JSON schema | false | `action*: string` | `Schema` |
| `config.list` | Lists the current deploy configuration. Note: configuration is loaded once at startup — restart the lab process to pick up changes to ~/.ssh/config or deploy preferences. | false | - | `ConfigListing` |
| `plan` | Dry-run: resolve targets, hash local artifact, show what would happen | false | `targets*: string[]` | `DeployPlan` |
| `run` | Build, transfer, install, restart, verify on targets (destructive) | true | `targets*: string[]`<br>`confirm*: boolean`<br>`max_parallel: integer`<br>`fail_fast: boolean` | `DeployRunSummary` |
| `rollback` | Restore the most recent timestamped backup on the specified targets (destructive) | true | `targets*: string[]`<br>`confirm*: boolean` | `DeployRunSummary` |

## `fs`

Workspace filesystem browser (read-only, deny-listed)

Category: `bootstrap`  Status: `available`

| Action | Description | Destructive | Params | Returns |
|---|---|---:|---|---|
| `fs.list` | List immediate entries of a directory inside the configured workspace root | false | `path: string` | `{entries: [{name, path, kind, size, modified, accessible}], truncated: bool}` |

