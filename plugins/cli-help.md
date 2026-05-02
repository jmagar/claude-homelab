# Lab CLI Help

Generated from `target/debug/lab --help` recursively after `cargo build --workspace --all-features`.

## `lab`

```text
Pluggable homelab CLI + MCP server. One binary, 21 services, runtime tool selection.

Usage: lab [OPTIONS] <COMMAND>

Commands:
  serve        Start the MCP server (stdio or HTTP transport)
  mcp          Start the MCP server over stdio
  doctor       Audit configured services and report problems
  nodes        Query nodes from the configured controller
  health       Quick reachability check for configured services
  plugins      Open the plugin manager TUI
  audit        Audit service onboarding against the repo contract
  install      Install one or more services into `.mcp.json`
  uninstall    Uninstall services from `.mcp.json`
  init         First-time setup wizard
  help         Print the service + action catalog
  scaffold     Generate a new service onboarding scaffold
  completions  Generate shell completions
  extract      Scan a local or SSH appdata path and extract service credentials
  gateway      Manage proxied upstream MCP gateways
  oauth        Run local OAuth callback relay helpers
  logs         Search fleet logs on the configured master
  marketplace  Claude plugin marketplace manager
  stash        Component versioning and deployment
  radarr       Radarr movie collection manager
  sonarr       Sonarr TV series manager
  prowlarr     Prowlarr indexer manager
  plex         Plex media server
  tautulli     Tautulli Plex analytics
  sabnzbd      `SABnzbd` download client
  qbittorrent  qBittorrent download client
  tailscale    Tailscale VPN network
  linkding     Linkding bookmark manager
  memos        Memos note-taking service
  bytestash    Bytestash snippet manager
  paperless    Paperless-ngx document manager
  arcane       Arcane Docker management UI
  unraid       Unraid server management
  unifi        `UniFi` network management
  overseerr    Overseerr media request manager
  gotify       Gotify push notifications
  openai       `OpenAI` API client
  notebooklm   Google NotebookLM client
  qdrant       Qdrant vector database
  tei          HF Text Embeddings Inference
  apprise      Apprise notification dispatcher
  deploy       Deploy the local lab release binary to SSH targets

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
  -V, --version        Print version
```

## `lab serve`

```text
Start the MCP server (stdio or HTTP transport)

Usage: lab serve [OPTIONS] [COMMAND]

Commands:
  mcp  Run the MCP server over stdio instead of the default HTTP transport

Options:
      --json                   Emit JSON instead of human-readable tables
      --services <SERVICES>    Comma- or space-separated list of services to enable. Empty = all
      --color <COLOR>          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --host <HOST>            Bind host for the HTTP transport
      --port <PORT>            Bind port for the HTTP transport
      --log-level <LOG_LEVEL>  Override the log filter level for this process. Sets `LAB_LOG=lab=<level>,warn` before tracing init. Example: `--log-level debug`
  -h, --help                   Print help
```

## `lab mcp`

```text
Start the MCP server over stdio

Usage: lab mcp [OPTIONS]

Options:
      --json                   Emit JSON instead of human-readable tables
      --services <SERVICES>    Comma- or space-separated list of services to enable. Empty = all
      --color <COLOR>          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --log-level <LOG_LEVEL>  Override the log filter level for this process. Sets `LAB_LOG=lab=<level>,warn` before tracing init. Example: `--log-level debug`
  -h, --help                   Print help
```

## `lab doctor`

```text
Audit configured services and report problems

Usage: lab doctor [OPTIONS] [COMMAND]

Commands:
  auth      Check auth/OAuth configuration (env vars, files, permissions)
  system    Run local system checks (env vars, Docker, disk, toolchain)
  service   Probe a single configured service
  services  Probe all configured services

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab nodes`

```text
Query nodes from the configured controller

Usage: lab nodes [OPTIONS] <COMMAND>

Commands:
  list         List all registered nodes visible from the controller
  get          Get details for a specific node by `node_id`
  update       Build and roll out the local release binary to selected nodes
  enrollments  Manage pending, approved, and denied node enrollments

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab health`

```text
Quick reachability check for configured services

Usage: lab health [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab plugins`

```text
Open the plugin manager TUI

Usage: lab plugins [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab audit`

```text
Audit service onboarding against the repo contract

Usage: lab audit [OPTIONS] <COMMAND>

Commands:
  onboarding  Audit onboarding for one or more services

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab install`

```text
Install one or more services into `.mcp.json`

Usage: lab install [OPTIONS] <SERVICES>...

Arguments:
  <SERVICES>...  Services to install

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab uninstall`

```text
Uninstall services from `.mcp.json`

Usage: lab uninstall [OPTIONS] <SERVICES>...

Arguments:
  <SERVICES>...  Services to uninstall

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab init`

```text
First-time setup wizard

Usage: lab init [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab scaffold`

```text
Generate a new service onboarding scaffold

Usage: lab scaffold [OPTIONS] <COMMAND>

Commands:
  service  Scaffold one service

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab completions`

```text
Generate shell completions

Usage: lab completions [OPTIONS] <SHELL>

Arguments:
  <SHELL>  Target shell [possible values: bash, elvish, fish, powershell, zsh]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab extract`

```text
Scan a local or SSH appdata path and extract service credentials

Usage: lab extract [OPTIONS] [URI]

Arguments:
  [URI]  Appdata path to scan. Local (`/path` or `~/path`) or SSH (`host:/path`)

Options:
      --apply            Write the extracted creds into `~/.lab/.env` (destructive — prompts)
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --diff             Show what would change vs the current `~/.lab/.env`, no writes
  -y, --yes              Skip the destructive-action confirmation prompt
      --dry-run          Don't actually write — just show what would happen with `--apply`
      --force            Overwrite conflicting keys instead of skipping them
      --json             Render as JSON instead of a table
      --env-path <PATH>  Override the env-file path (defaults to `~/.lab/.env`)
  -h, --help             Print help
```

## `lab gateway`

```text
Manage proxied upstream MCP gateways

Usage: lab gateway [OPTIONS] <COMMAND>

Commands:
  list         
  get          
  test         
  add          
  update       
  remove       
  quarantine   
  tool-search  
  reload       
  mcp          

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab oauth`

```text
Run local OAuth callback relay helpers

Usage: lab oauth [OPTIONS] <COMMAND>

Commands:
  relay-local  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab logs`

```text
Search fleet logs on the configured master

Usage: lab logs [OPTIONS] <COMMAND>

Commands:
  search   Search fleet logs for a device from the master control plane
  local    Search or inspect the local-master runtime log store
  forward  Forward this node's syslog to the master log store (peer mode)

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab marketplace`

```text
Claude plugin marketplace manager

Usage: lab marketplace [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. sources.list, plugins.list, plugin.install) [default: help] [possible values: help, schema, sources.list, plugins.list, plugin.get, plugin.artifacts, plugin.workspace, plugin.save, plugin.deploy, plugin.deploy.preview, artifact.fork, artifact.list, artifact.unfork, artifact.reset, artifact.diff, artifact.patch, artifact.update.check, artifact.update.preview, artifact.update.apply, artifact.merge.suggest, artifact.config.set, sources.add, plugin.install, plugin.uninstall, agent.list, agent.get, agent.install, plugin.cherry_pick, agent.uninstall, mcp.config, mcp.list, mcp.get, mcp.versions, mcp.validate, mcp.install, mcp.uninstall, mcp.meta.get, mcp.meta.set, mcp.meta.delete, mcp.sync]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab stash`

```text
Component versioning and deployment

Usage: lab stash [OPTIONS] <ACTION> [KEY=VALUE]...

Arguments:
  <ACTION>        Action to run, e.g. `help`, `components.list`, `component.get` [possible values: help, schema, components.list, component.get, component.create, component.import, component.workspace, component.save, component.revisions, component.export, component.deploy, providers.list, provider.link, provider.push, provider.pull, targets.list, target.add, target.remove]
  [KEY=VALUE]...  Optional `key=value` params for the action

Options:
      --json           Emit JSON instead of human-readable tables
  -y, --yes            Skip confirmation for destructive actions
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --dry-run        Print what would be done without executing
  -h, --help           Print help
```

## `lab radarr`

```text
Radarr movie collection manager

Usage: lab radarr [OPTIONS] [COMMAND]

Commands:
  help                        Return the Radarr action catalog
  system-status               Return Radarr system status and version
  system-health               Return Radarr health check results
  system-disk-space           Return disk space information for all drives
  system-logs                 Return list of available log files
  system-updates              Return available Radarr updates
  movie-list                  List all movies in the Radarr library
  movie-get                   Get a single movie by its Radarr ID
  movie-lookup                Search for movies to add (TMDB / IMDB lookup)
  movie-add                   Add a movie to Radarr for monitoring and download
  movie-delete                Delete a movie from Radarr
  queue-list                  List all items currently in the download queue
  queue-remove                Remove an item from the download queue
  calendar-list               List upcoming movie releases
  command-refresh             Refresh metadata for one movie or all movies
  command-search              Trigger a file search for one or more movies
  command-get                 Get the status of a previously issued command
  history-list                List download history
  blocklist-list              List blocked releases
  release-search              Search indexers for available releases for a movie
  indexer-list                List configured indexers
  indexer-test                Test an indexer connection
  quality-profile-list        List quality profiles
  quality-definition-list     List quality definitions
  root-folder-list            List root folders
  tag-list                    List all tags
  tag-detail-list             List tags with full details
  download-client-list        List configured download clients
  download-client-test        Test a download client connection
  remote-path-mapping-list    List remote path mappings
  config-host                 Get host configuration
  config-naming               Get file naming configuration
  config-ui                   Get UI configuration
  notification-list           List configured notifications
  notification-test           Test a notification connection
  import-list-list            List configured import lists
  import-list-exclusion-list  List import list exclusions
  language-list               List available languages
  metadata-list               List metadata providers
  filesystem-list             Browse the server filesystem

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab sonarr`

```text
Sonarr TV series manager

Usage: lab sonarr [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help, series.list, episode.list) [default: help] [possible values: help, schema, series.list, series.get, series.lookup, series.add, series.delete, episode.list, episode.get, queue.list, queue.delete, history.list, wanted.list, calendar.list, health, system.status, tag.list, tag.create, tag.delete, rootfolder.list, qualityprofile.list, languageprofile.list, series.edit, episode.monitor, wanted.cutoff, release.search, release.grab, history.series, history.failed-retry, blocklist.list, blocklist.delete, episodefile.delete, system.restart, system.backup]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab prowlarr`

```text
Prowlarr indexer manager

Usage: lab prowlarr [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, indexer.list, indexer.get, indexer.delete, indexer.test, indexer.testall, indexer.categories, history.list, application.list, application.get, application.delete, indexer.edit, indexer.add, indexer.stats, indexer.status, indexer.search, indexer.grab, history.indexer, application.add, system.restart, system.backup, tag.list, system.status, system.health]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab plex`

```text
Plex media server

Usage: lab plex [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, server.info, server.capabilities, library.list, library.get, library.scan, library.refresh, media.search, media.get, session.list, session.terminate, playlist.list, playlist.get, playlist.create, playlist.delete, library.browse, library.empty-trash, metadata.delete, metadata.edit, metadata.refresh, session.history, hubs.continue-watching, butler.list, butler.run, item.scrobble, item.unscrobble, updater.status, health]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab tautulli`

```text
Tautulli Plex analytics

Usage: lab tautulli [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, activity.list, activity.stream, history.list, users.list, users.get, users.watch_time, users.player_stats, libraries.list, libraries.get, libraries.media_info, stats.home, stats.plays_by_date, media.recently-added, media.metadata, media.children, media.export-metadata, user.item-stats, user.delete-history, plays.by-day, plays.by-hour, plays.by-stream-type, plays.by-month, server.pms-update, system.info, system.settings]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab sabnzbd`

```text
`SABnzbd` download client

Usage: lab sabnzbd [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, server.version, queue.list, queue.delete, history.list, history.delete, history.purge, server.stats, server.warnings, queue.pause, queue.resume, queue.speed.limit, queue.addurl, history.retry, history.retry-all, server.fullstatus, category.list, queue.set-complete-action, pp.pause, pp.resume, rss.fetch-now, config.get]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab qbittorrent`

```text
qBittorrent download client

Usage: lab qbittorrent [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, transfer.info, transfer.download.limit, transfer.upload.limit, torrent.list, torrent.properties, torrent.trackers, torrent.pause, torrent.resume, torrent.delete, torrent.recheck, torrent.category.set, torrent.download.limit, torrent.upload.limit, category.list, app.version, app.preferences, log.list, torrent.add, transfer.toggle-speed-limits, torrent.files, torrent.set-file-prio, torrent.set-location, torrent.add-tags, torrent.remove-tags, torrent.reannounce, torrent.set-share-limits, category.create, category.edit, sync.maindata]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab tailscale`

```text
Tailscale VPN network

Usage: lab tailscale [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, device.list, device.get, device.delete, device.authorize, key.list, key.get, key.delete, dns.nameservers, dns.search_paths, dns.split-get, dns.split-set, acl.get, acl.validate, acl.set, device.routes-get, device.routes-set, device.tag, device.expire, user.list, tailnet.settings-get, tailnet.settings-patch, key.create]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab linkding`

```text
Linkding bookmark manager

Usage: lab linkding [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, bookmark.list, bookmark.archived.list, bookmark.get, bookmark.check, bookmark.create, bookmark.update, bookmark.archive, bookmark.unarchive, bookmark.delete, tag.list, tag.get, tag.create, user.profile, bundle.list, bundle.create, bundle.update, bundle.delete, bookmark.assets, bookmark.assets-upload]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab memos`

```text
Memos note-taking service

Usage: lab memos [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, memos.list, memos.get, memos.create, memos.update, memos.delete, tags.list, workspace.profile, user.me, user.list, user.stats, webhook.list, webhook.create, attachment.upload, attachment.delete, memo.comment-list, memo.comment-create, memo.share-list, memo.share-create]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab bytestash`

```text
Bytestash snippet manager

Usage: lab bytestash [OPTIONS] <ACTION> [KEY=VALUE]...

Arguments:
  <ACTION>        Action to run, e.g. `help`, `snippets.list`, `categories.list` [possible values: help, schema, auth.config, auth.register, auth.login, snippets.list, snippets.get, snippets.create, snippets.update, snippets.delete, snippets.public.list, snippets.public.get, snippets.share.create, snippets.share.get, categories.list, users.list, users.toggle-active, users.delete]
  [KEY=VALUE]...  Optional `key=value` params for the action

Options:
      --json           Emit JSON instead of human-readable tables
  -y, --yes            Skip confirmation for destructive actions
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --dry-run        Print what would be done without executing
  -h, --help           Print help
```

## `lab paperless`

```text
Paperless-ngx document manager

Usage: lab paperless [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, documents.list, documents.get, documents.metadata, documents.update, documents.delete, tags.list, tags.get, tags.create, tags.delete, correspondents.list, correspondents.get, correspondents.create, correspondents.delete, document_types.list, document_types.get, document_types.create, document_types.delete, statistics, tasks.list, document.upload, document.bulk-edit, document.download, tag.update, saved-view.list, saved-view.create, custom-field.list, custom-field.create, storage-path.list, storage-path.create]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab arcane`

```text
Arcane Docker management UI

Usage: lab arcane [OPTIONS] [ACTION] [KEY=VALUE]...

Arguments:
  [ACTION]        Action to run, e.g. `help`, `system.health`, `container.list` [default: help] [possible values: help, schema, health, environment.list, environment.get, container.list, container.get, container.start, container.stop, container.restart, container.redeploy, project.list, project.create, project.up, project.down, project.redeploy, volume.list, volume.delete, volume.prune, image.list, image.pull, image.prune, image.update-summary]
  [KEY=VALUE]...  Optional `key=value` params for the action

Options:
      --json           Emit JSON instead of human-readable tables
  -y, --yes            Skip confirmation for destructive actions
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --dry-run        Print what would be done without executing
  -h, --help           Print help
```

## `lab unraid`

```text
Unraid server management

Usage: lab unraid [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, system.info, system.metrics, system.array, system.online, docker.list, docker.start, docker.stop, docker.restart, disk.list, vm.list, vm.start, vm.stop, vm.pause, vm.resume, notification.list, notification.create, notification.archive, parity.history, parity.check-start, parity.check-pause, parity.check-cancel, share.list, plugin.list, network.list, ups.devices, ups.config, log.read, flash.status, flash.backup]

Options:
      --instance <INSTANCE>  Optional named instance label
      --json                 Emit JSON instead of human-readable tables
      --color <COLOR>        Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --params <PARAMS>      Action-specific parameters as JSON
  -y, --yes                  Skip confirmation prompt for destructive actions (docker.start/stop/restart)
      --dry-run              Print what would be done without executing
  -h, --help                 Print help
```

## `lab unifi`

```text
`UniFi` network management

Usage: lab unifi [OPTIONS] <ACTION> [KEY=VALUE]...

Arguments:
  <ACTION>        Action to run, e.g. `help`, `sites.list`, `firewall.zones.list` [possible values: help, system.info, sites.list, wans.list, vpn.site-to-site-tunnels.list, vpn.servers.list, radius.profiles.list, device-tags.list, dpi.categories.list, dpi.applications.list, countries.list, wan.get, devices.list, devices.get, devices.stats, pending-devices.list, devices.create, devices.port-action, devices.action, devices.delete, device.update, clients.list, clients.get, clients.action, client.history, client.block, client.unblock, networks.list, networks.get, networks.references, networks.create, networks.update, networks.delete, wifi.broadcasts.list, wifi.broadcasts.get, wifi.broadcasts.create, wifi.broadcasts.update, wifi.broadcasts.delete, wifi.update, hotspot.vouchers.list, hotspot.vouchers.create, hotspot.vouchers.delete, hotspot.vouchers.get, firewall.zones.list, firewall.zones.get, firewall.zones.create, firewall.zones.update, firewall.zones.delete, firewall.policies.list, firewall.policies.get, firewall.policies.create, firewall.policies.update, firewall.policies.patch, firewall.policies.ordering.get, firewall.policies.ordering.set, acl.rules.list, acl.rules.get, acl.rules.create, acl.rules.update, acl.rules.delete, acl.rules.ordering.get, acl.rules.ordering.set, switching.switch-stacks.list, switching.switch-stacks.get, switching.mc-lag-domains.list, switching.mc-lag-domains.get, switching.lags.list, switching.lags.get, port-profile.list, port-profile.create, port-profile.update, dns.policies.list, dns.policies.get, dns.policies.create, dns.policies.update, dns.policies.delete, traffic-matching-lists.list, traffic-matching-lists.get, traffic-matching-lists.create, traffic-matching-lists.update, traffic-matching-lists.delete]
  [KEY=VALUE]...  Optional `key=value` params for the action

Options:
      --instance <INSTANCE>  Optional named instance label
      --json                 Emit JSON instead of human-readable tables
      --color <COLOR>        Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes                  Skip confirmation for destructive actions
      --dry-run              Print what would be done without executing
  -h, --help                 Print help
```

## `lab overseerr`

```text
Overseerr media request manager

Usage: lab overseerr [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, health, status, request.list, request.get, request.create, request.approve, request.decline, request.delete, movie.search, tv.search, movie.get, tv.get, user.list, user.get, issue.list, issue.get, issue.create, issue.comment, request.retry, request.count, issue.update, media.delete, media.update-status, user.requests, user.quota, user.edit, job.run, discover.trending]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab gotify`

```text
Gotify push notifications

Usage: lab gotify [OPTIONS] <ACTION> [KEY=VALUE]...

Arguments:
  <ACTION>        Action to run, e.g. `help`, `message.send`, `app.list` [possible values: help, schema, message.send, message.list, message.delete, message.purge, app.list, app.create, app.delete, client.list, client.create, client.delete, application.update, application.messages, application.messages-delete, client.update, plugin.list, plugin.enable, plugin.disable, plugin.config-get, plugin.config-set, user.list, user.create, user.delete, server.health, server.version]
  [KEY=VALUE]...  Optional `key=value` params for the action

Options:
      --json           Emit JSON instead of human-readable tables
  -y, --yes            Skip confirmation for destructive actions
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --dry-run        Print what would be done without executing
  -h, --help           Print help
```

## `lab openai`

```text
`OpenAI` API client

Usage: lab openai [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, model.list, chat.complete, embed.create, server.health]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help             Print help
```

## `lab notebooklm`

```text
Google NotebookLM client

Usage: lab notebooklm [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, notebook.list, notebook.create, notebook.get, notebook.delete, source.list, source.add_url, server.health]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab qdrant`

```text
Qdrant vector database

Usage: lab qdrant [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, server.health, collections.list, collections.get, collection.create, collection.delete, point.upsert, point.search, point.query, point.scroll, point.count, point.delete, snapshot.create, index.create]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab tei`

```text
HF Text Embeddings Inference

Usage: lab tei [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, server.health, server.info, embed.create, embed.rerank, embed.tokenize, embed.similarity, embed.sparse, embed.openai]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help             Print help
```

## `lab apprise`

```text
Apprise notification dispatcher

Usage: lab apprise [OPTIONS] [ACTION]

Arguments:
  [ACTION]  Action to run (e.g. help) [default: help] [possible values: help, schema, server.health, notify.send, notify.key.send, config.add, config.get, config.delete, config.urls, server.details]

Options:
      --json             Emit JSON instead of human-readable tables
      --params <PARAMS>  Action-specific parameters as JSON
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes              Skip confirmation for destructive actions
      --dry-run          Print what would be done without executing
  -h, --help             Print help
```

## `lab deploy`

```text
Deploy the local lab release binary to SSH targets

Usage: lab deploy [OPTIONS] <COMMAND>

Commands:
  config-list  Show resolved deploy hosts and defaults
  plan         Dry-run: resolve targets, hash local artifact, show what would happen
  run          Destructive: build, transfer, install, restart, verify
  rollback     Destructive: restore the most recent backup on each target
  monitor      Watch SSH hosts and emit JSON events when they go online or offline

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab serve mcp`

```text
Run the MCP server over stdio instead of the default HTTP transport

Usage: lab serve mcp [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --stdio          Confirm that MCP should run over stdio
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab doctor auth`

```text
Check auth/OAuth configuration (env vars, files, permissions)

Usage: lab doctor auth [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab doctor system`

```text
Run local system checks (env vars, Docker, disk, toolchain)

Usage: lab doctor system [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab doctor service`

```text
Probe a single configured service

Usage: lab doctor service [OPTIONS] <NAME>

Arguments:
  <NAME>  Service name (e.g. radarr, sonarr, plex)

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab doctor services`

```text
Probe all configured services

Usage: lab doctor services [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab nodes list`

```text
List all registered nodes visible from the controller

Usage: lab nodes list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab nodes get`

```text
Get details for a specific node by `node_id`

Usage: lab nodes get [OPTIONS] <NODE_ID>

Arguments:
  <NODE_ID>  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab nodes update`

```text
Build and roll out the local release binary to selected nodes

Usage: lab nodes update [OPTIONS] [TARGETS]...

Arguments:
  [TARGETS]...  Explicit node targets to update

Options:
      --all            Update every configured node and, when running on the controller, run the local controller last
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab nodes enrollments`

```text
Manage pending, approved, and denied node enrollments

Usage: lab nodes enrollments [OPTIONS] <COMMAND>

Commands:
  list     List pending, approved, and denied enrollments
  approve  Approve a pending enrollment
  deny     Deny a pending or approved enrollment

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab audit onboarding`

```text
Audit onboarding for one or more services

Usage: lab audit onboarding [OPTIONS] <SERVICES>...

Arguments:
  <SERVICES>...  Services to audit

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab scaffold service`

```text
Scaffold one service

Usage: lab scaffold service [OPTIONS] <SERVICE>

Arguments:
  <SERVICE>
          Service name

Options:
      --json
          Emit JSON instead of human-readable tables

      --kind <KIND>
          Service kind

          Possible values:
          - http:     HTTP service with CLI, MCP, and API adapters
          - non-http: Non-HTTP service that still participates in the onboarding contract
          
          [default: http]

      --color <COLOR>
          Control human-readable CLI styling
          
          [default: auto]
          [possible values: auto, plain, color]

      --dry-run
          Only show the planned file operations

  -y, --yes
          Confirm that scaffold writes are allowed

  -h, --help
          Print help (see a summary with '-h')
```

## `lab gateway list`

```text
Usage: lab gateway list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway get`

```text
Usage: lab gateway get [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway test`

```text
Usage: lab gateway test [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --name <NAME>    
      --allow-stdio    
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway add`

```text
Usage: lab gateway add [OPTIONS] --name <NAME>

Options:
      --json
          Emit JSON instead of human-readable tables
      --name <NAME>
          
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --url <URL>
          
      --command <COMMAND>
          
      --arg <ARGS>
          
      --bearer-token-env <BEARER_TOKEN_ENV>
          
      --proxy-resources
          
      --allow-stdio
          
  -h, --help
          Print help
```

## `lab gateway update`

```text
Usage: lab gateway update [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --json
          Emit JSON instead of human-readable tables
      --new-name <NEW_NAME>
          
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --url <URL>
          
      --command <COMMAND>
          
      --arg <ARGS>
          
      --bearer-token-env <BEARER_TOKEN_ENV>
          
      --proxy-resources <PROXY_RESOURCES>
          [possible values: true, false]
      --allow-stdio
          
  -h, --help
          Print help
```

## `lab gateway remove`

```text
Usage: lab gateway remove [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway quarantine`

```text
Usage: lab gateway quarantine [OPTIONS] <COMMAND>

Commands:
  list     
  restore  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway tool-search`

```text
Usage: lab gateway tool-search [OPTIONS] <COMMAND>

Commands:
  status   
  enable   
  disable  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway reload`

```text
Usage: lab gateway reload [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway mcp`

```text
Usage: lab gateway mcp [OPTIONS] <COMMAND>

Commands:
  auth     
  list     
  enable   
  disable  
  cleanup  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab oauth relay-local`

```text
Usage: lab oauth relay-local [OPTIONS] --port <PORT> <--machine <MACHINE>|--forward-base <FORWARD_BASE>>

Options:
      --json                         Emit JSON instead of human-readable tables
      --machine <MACHINE>            
      --color <COLOR>                Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --forward-base <FORWARD_BASE>  
      --port <PORT>                  
  -h, --help                         Print help
```

## `lab logs search`

```text
Search fleet logs for a device from the master control plane

Usage: lab logs search [OPTIONS] <DEVICE> <QUERY>

Arguments:
  <DEVICE>  
  <QUERY>   

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab logs local`

```text
Search or inspect the local-master runtime log store

Usage: lab logs local [OPTIONS] <COMMAND>

Commands:
  search  Search the persistent local log store
  tail    Read a bounded follow-up window from the persistent local log store
  stats   Inspect local retention and drop counters
  stream  Live push is HTTP SSE only in v1; this command fails with guidance

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab logs forward`

```text
Forward this node's syslog to the master log store (peer mode)

Usage: lab logs forward [OPTIONS]

Options:
      --json                         Emit JSON instead of human-readable tables
      --master-url <MASTER_URL>      Override the master base URL (default: LAB_MASTER_URL) [env: LAB_MASTER_URL=]
      --color <COLOR>                Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --master-token <MASTER_TOKEN>  Override the bearer token (default: LAB_MASTER_TOKEN or LAB_MCP_HTTP_TOKEN) [env: LAB_MASTER_TOKEN=]
      --node-id <NODE_ID>            Node ID to stamp on every forwarded event (default: LAB_NODE_ID or hostname) [env: LAB_NODE_ID=]
      --batch-size <BATCH_SIZE>      How many events to batch per request (default 200) [default: 200]
      --syslog-only                  Skip journald and read directly from /var/log/syslog
  -h, --help                         Print help
```

## `lab radarr system-status`

```text
Return Radarr system status and version

Usage: lab radarr system-status [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr system-health`

```text
Return Radarr health check results

Usage: lab radarr system-health [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr system-disk-space`

```text
Return disk space information for all drives

Usage: lab radarr system-disk-space [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr system-logs`

```text
Return list of available log files

Usage: lab radarr system-logs [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr system-updates`

```text
Return available Radarr updates

Usage: lab radarr system-updates [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr movie-list`

```text
List all movies in the Radarr library

Usage: lab radarr movie-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr movie-get`

```text
Get a single movie by its Radarr ID

Usage: lab radarr movie-get [OPTIONS] <ID>

Arguments:
  <ID>  Radarr movie ID

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr movie-lookup`

```text
Search for movies to add (TMDB / IMDB lookup)

Usage: lab radarr movie-lookup [OPTIONS] <QUERY>

Arguments:
  <QUERY>  Search term, TMDB ID (tmdb:12345), or IMDB ID (imdb:tt1234567)

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr movie-add`

```text
Add a movie to Radarr for monitoring and download

Usage: lab radarr movie-add [OPTIONS] --tmdb-id <TMDB_ID> --title <TITLE> --quality-profile-id <QUALITY_PROFILE_ID> --root-folder-path <ROOT_FOLDER_PATH>

Options:
      --json
          Emit JSON instead of human-readable tables
      --tmdb-id <TMDB_ID>
          TMDB ID of the movie
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --title <TITLE>
          Movie title
      --quality-profile-id <QUALITY_PROFILE_ID>
          Quality profile ID (use quality-profile-list to find IDs)
      --root-folder-path <ROOT_FOLDER_PATH>
          Root folder path (use root-folder-list to find paths)
      --monitored
          Monitor movie for download (default true)
      --year <YEAR>
          Release year (default 0; use movie-lookup to retrieve from TMDB) [default: 0]
  -h, --help
          Print help
```

## `lab radarr movie-delete`

```text
Delete a movie from Radarr

Usage: lab radarr movie-delete [OPTIONS] <ID>

Arguments:
  <ID>  Radarr movie ID

Options:
      --delete-files   Also delete files from disk
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes            Skip confirmation prompt
  -h, --help           Print help
```

## `lab radarr queue-list`

```text
List all items currently in the download queue

Usage: lab radarr queue-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr queue-remove`

```text
Remove an item from the download queue

Usage: lab radarr queue-remove [OPTIONS] <ID>

Arguments:
  <ID>  Queue item ID

Options:
      --json                Emit JSON instead of human-readable tables
      --remove-from-client  Remove from download client too (default true)
      --blocklist           Add release to blocklist
      --color <COLOR>       Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -y, --yes                 Skip confirmation prompt
  -h, --help                Print help
```

## `lab radarr calendar-list`

```text
List upcoming movie releases

Usage: lab radarr calendar-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --start <START>  Start date ISO 8601 (default today)
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --end <END>      End date ISO 8601 (default 7 days from now)
  -h, --help           Print help
```

## `lab radarr command-refresh`

```text
Refresh metadata for one movie or all movies

Usage: lab radarr command-refresh [OPTIONS]

Options:
      --json                 Emit JSON instead of human-readable tables
      --movie-id <MOVIE_ID>  Movie ID to refresh (omit to refresh all)
      --color <COLOR>        Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help                 Print help
```

## `lab radarr command-search`

```text
Trigger a file search for one or more movies

Usage: lab radarr command-search [OPTIONS] [MOVIE_IDS]...

Arguments:
  [MOVIE_IDS]...  Radarr movie IDs to search (space-separated)

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr command-get`

```text
Get the status of a previously issued command

Usage: lab radarr command-get [OPTIONS] <ID>

Arguments:
  <ID>  Command ID

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr history-list`

```text
List download history

Usage: lab radarr history-list [OPTIONS]

Options:
      --json                   Emit JSON instead of human-readable tables
      --page <PAGE>            Page number (default 1) [default: 1]
      --color <COLOR>          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --page-size <PAGE_SIZE>  Items per page (default 10) [default: 10]
  -h, --help                   Print help
```

## `lab radarr blocklist-list`

```text
List blocked releases

Usage: lab radarr blocklist-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr release-search`

```text
Search indexers for available releases for a movie

Usage: lab radarr release-search [OPTIONS] <MOVIE_ID>

Arguments:
  <MOVIE_ID>  Radarr movie ID

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr indexer-list`

```text
List configured indexers

Usage: lab radarr indexer-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr indexer-test`

```text
Test an indexer connection

Usage: lab radarr indexer-test [OPTIONS] <ID>

Arguments:
  <ID>  Indexer ID

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr quality-profile-list`

```text
List quality profiles

Usage: lab radarr quality-profile-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr quality-definition-list`

```text
List quality definitions

Usage: lab radarr quality-definition-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr root-folder-list`

```text
List root folders

Usage: lab radarr root-folder-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr tag-list`

```text
List all tags

Usage: lab radarr tag-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr tag-detail-list`

```text
List tags with full details

Usage: lab radarr tag-detail-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr download-client-list`

```text
List configured download clients

Usage: lab radarr download-client-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr download-client-test`

```text
Test a download client connection

Usage: lab radarr download-client-test [OPTIONS] <ID>

Arguments:
  <ID>  Download client ID

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr remote-path-mapping-list`

```text
List remote path mappings

Usage: lab radarr remote-path-mapping-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr config-host`

```text
Get host configuration

Usage: lab radarr config-host [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr config-naming`

```text
Get file naming configuration

Usage: lab radarr config-naming [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr config-ui`

```text
Get UI configuration

Usage: lab radarr config-ui [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr notification-list`

```text
List configured notifications

Usage: lab radarr notification-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr notification-test`

```text
Test a notification connection

Usage: lab radarr notification-test [OPTIONS] <ID>

Arguments:
  <ID>  Notification ID

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr import-list-list`

```text
List configured import lists

Usage: lab radarr import-list-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr import-list-exclusion-list`

```text
List import list exclusions

Usage: lab radarr import-list-exclusion-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr language-list`

```text
List available languages

Usage: lab radarr language-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr metadata-list`

```text
List metadata providers

Usage: lab radarr metadata-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab radarr filesystem-list`

```text
Browse the server filesystem

Usage: lab radarr filesystem-list [OPTIONS] <PATH>

Arguments:
  <PATH>  Directory path to browse

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab deploy config-list`

```text
Show resolved deploy hosts and defaults

Usage: lab deploy config-list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab deploy plan`

```text
Dry-run: resolve targets, hash local artifact, show what would happen

Usage: lab deploy plan [OPTIONS] <TARGETS>...

Arguments:
  <TARGETS>...  SSH aliases to include in the plan

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab deploy run`

```text
Destructive: build, transfer, install, restart, verify

Usage: lab deploy run [OPTIONS] <TARGETS>...

Arguments:
  <TARGETS>...  SSH aliases to deploy to

Options:
      --json                         Emit JSON instead of human-readable tables
  -y, --yes                          Confirm the destructive operation (required non-interactively) [aliases: --no-confirm]
      --color <COLOR>                Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --dry-run                      Dry-run: plan only, do not transfer or install anything
      --max-parallel <MAX_PARALLEL>  Maximum number of hosts to work on concurrently
      --fail-fast                    Abort remaining hosts on the first failure
  -h, --help                         Print help
```

## `lab deploy rollback`

```text
Destructive: restore the most recent backup on each target

Usage: lab deploy rollback [OPTIONS] <TARGETS>...

Arguments:
  <TARGETS>...  SSH aliases to roll back

Options:
      --json           Emit JSON instead of human-readable tables
  -y, --yes            Confirm the destructive operation [aliases: --no-confirm]
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --dry-run        Dry-run: plan only, do not roll back
  -h, --help           Print help
```

## `lab deploy monitor`

```text
Watch SSH hosts and emit JSON events when they go online or offline.

Emits one newline-delimited JSON line per state change to stdout. Suitable for use with the Claude Code Monitor tool.

Usage: lab deploy monitor [OPTIONS] <TARGETS>...

Arguments:
  <TARGETS>...
          SSH aliases to watch (must exist in deploy config)

Options:
      --interval <INTERVAL>
          Poll interval in seconds
          
          [default: 30]

      --json
          Emit JSON instead of human-readable tables

      --color <COLOR>
          Control human-readable CLI styling
          
          [default: auto]
          [possible values: auto, plain, color]

      --timeout <TIMEOUT>
          TCP probe timeout in seconds
          
          [default: 3]

  -h, --help
          Print help (see a summary with '-h')
```

## `lab nodes enrollments list`

```text
List pending, approved, and denied enrollments

Usage: lab nodes enrollments list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab nodes enrollments approve`

```text
Approve a pending enrollment

Usage: lab nodes enrollments approve [OPTIONS] <NODE_ID>

Arguments:
  <NODE_ID>  

Options:
      --json           Emit JSON instead of human-readable tables
      --note <NOTE>    
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab nodes enrollments deny`

```text
Deny a pending or approved enrollment

Usage: lab nodes enrollments deny [OPTIONS] <NODE_ID>

Arguments:
  <NODE_ID>  

Options:
      --json             Emit JSON instead of human-readable tables
      --reason <REASON>  
      --color <COLOR>    Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help             Print help
```

## `lab gateway quarantine list`

```text
Usage: lab gateway quarantine list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway quarantine restore`

```text
Usage: lab gateway quarantine restore [OPTIONS] <ID>

Arguments:
  <ID>  

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway tool-search status`

```text
Usage: lab gateway tool-search status [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway tool-search enable`

```text
Usage: lab gateway tool-search enable [OPTIONS]

Options:
      --json                           Emit JSON instead of human-readable tables
      --top-k-default <TOP_K_DEFAULT>  
      --color <COLOR>                  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --max-tools <MAX_TOOLS>          
  -h, --help                           Print help
```

## `lab gateway tool-search disable`

```text
Usage: lab gateway tool-search disable [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway mcp auth`

```text
Usage: lab gateway mcp auth [OPTIONS] <COMMAND>

Commands:
  start   
  open    
  status  
  clear   

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway mcp list`

```text
Usage: lab gateway mcp list [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway mcp enable`

```text
Usage: lab gateway mcp enable [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --allow-stdio    
      --json           Emit JSON instead of human-readable tables
      --cleanup        
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --aggressive     
  -h, --help           Print help
```

## `lab gateway mcp disable`

```text
Usage: lab gateway mcp disable [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --allow-stdio    
      --json           Emit JSON instead of human-readable tables
      --cleanup        
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --aggressive     
  -h, --help           Print help
```

## `lab gateway mcp cleanup`

```text
Usage: lab gateway mcp cleanup [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --aggressive     
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --dry-run        
  -h, --help           Print help
```

## `lab logs local search`

```text
Search the persistent local log store

Usage: lab logs local search [OPTIONS]

Options:
      --json
          Emit JSON instead of human-readable tables
      --text <TEXT>
          
      --after-ts <AFTER_TS>
          
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --before-ts <BEFORE_TS>
          
      --level <LEVELS>
          [possible values: trace, debug, info, warn, error]
      --subsystem <SUBSYSTEMS>
          [possible values: gateway, mcp_server, mcp_client, api, web, oauth_relay, auth_webui, auth_mcp, auth_upstream, core_runtime, syslog]
      --surface <SURFACES>
          [possible values: cli, mcp, api, web, core_runtime]
      --action <ACTION>
          
      --request-id <REQUEST_ID>
          
      --session-id <SESSION_ID>
          
      --correlation-id <CORRELATION_ID>
          
      --limit <LIMIT>
          
  -h, --help
          Print help
```

## `lab logs local tail`

```text
Read a bounded follow-up window from the persistent local log store

Usage: lab logs local tail [OPTIONS]

Options:
      --after-ts <AFTER_TS>
          
      --json
          Emit JSON instead of human-readable tables
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --since-event-id <SINCE_EVENT_ID>
          
      --limit <LIMIT>
          
  -h, --help
          Print help
```

## `lab logs local stats`

```text
Inspect local retention and drop counters

Usage: lab logs local stats [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab logs local stream`

```text
Live push is HTTP SSE only in v1; this command fails with guidance

Usage: lab logs local stream [OPTIONS]

Options:
      --json           Emit JSON instead of human-readable tables
      --color <COLOR>  Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
  -h, --help           Print help
```

## `lab gateway mcp auth start`

```text
Usage: lab gateway mcp auth start [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --json
          Emit JSON instead of human-readable tables
      --subject <SUBJECT>
          
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --open
          
      --wait
          
      --wait-timeout-secs <WAIT_TIMEOUT_SECS>
          [default: 120]
  -h, --help
          Print help
```

## `lab gateway mcp auth open`

```text
Usage: lab gateway mcp auth open [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --json
          Emit JSON instead of human-readable tables
      --subject <SUBJECT>
          
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --open
          
      --wait
          
      --wait-timeout-secs <WAIT_TIMEOUT_SECS>
          [default: 120]
  -h, --help
          Print help
```

## `lab gateway mcp auth status`

```text
Usage: lab gateway mcp auth status [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --json
          Emit JSON instead of human-readable tables
      --subject <SUBJECT>
          
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --open
          
      --wait
          
      --wait-timeout-secs <WAIT_TIMEOUT_SECS>
          [default: 120]
  -h, --help
          Print help
```

## `lab gateway mcp auth clear`

```text
Usage: lab gateway mcp auth clear [OPTIONS] <NAME>

Arguments:
  <NAME>  

Options:
      --json
          Emit JSON instead of human-readable tables
      --subject <SUBJECT>
          
      --color <COLOR>
          Control human-readable CLI styling [default: auto] [possible values: auto, plain, color]
      --open
          
      --wait
          
      --wait-timeout-secs <WAIT_TIMEOUT_SECS>
          [default: 120]
  -h, --help
          Print help
```

