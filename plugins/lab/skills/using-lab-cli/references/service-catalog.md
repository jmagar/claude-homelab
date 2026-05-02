# Service Catalog

Current service status as of the `feat/unifi-dispatch-api-bearer-rmcp` branch.

## Active Services (fully implemented)

| Service | Category | Purpose | Key Actions |
|---------|----------|---------|-------------|
| `extract` | bootstrap | Pull API keys/URLs from existing config files | `scan`, `apply` |
| `radarr` | servarr | Movie collection manager | `movie-list`, `movie-lookup`, `movie-add`, `movie-delete`, `queue-list`, `calendar-list` |
| `prowlarr` | indexer | Indexer manager | `indexer-list`, `indexer-test`, `search` |
| `sabnzbd` | download | Usenet download client | `queue-list`, `queue-pause`, `queue-resume`, `queue-purge`, `history-list` |
| `linkding` | notes | Bookmark manager with tagging | `bookmark-list`, `bookmark-add`, `bookmark-delete`, `tag-list` |
| `bytestash` | notes | Code snippet manager | `snippet-list`, `snippet-get`, `snippet-add`, `snippet-delete` |
| `paperless` | documents | Document management with OCR | `document-search`, `document-list`, `document-get`, `correspondent-list`, `tag-list` |
| `unraid` | network | Server management via GraphQL | `system-status`, `array-status`, `docker-list`, `disk-list` |
| `unifi` | network | UniFi Network Application | `client-list`, `device-list`, `site-list`, `network-list` (69 total actions) |
| `gotify` | notifications | Push notification server | `message-list`, `message-send`, `app-list` |
| `qdrant` | ai | Vector database | `collection-list`, `point-search` |
| `tei` | ai | HF Text Embeddings Inference | `embed`, `rerank` |
| `apprise` | notifications | Universal notification dispatcher | `notify` |

## Stub Services (not yet implemented)

These services are registered in the catalog but have no implemented actions. Attempting to use them will produce an empty action list.

| Service | Category | Purpose |
|---------|----------|---------|
| `sonarr` | servarr | TV series management |
| `plex` | media | Plex media server |
| `tautulli` | media | Plex analytics and monitoring |
| `qbittorrent` | download | Torrent download client |
| `tailscale` | network | WireGuard-based mesh VPN |
| `memos` | notes | Lightweight memo hub |
| `arcane` | network | Docker management UI |
| `overseerr` | media | Media request manager |
| `openai` | ai | OpenAI API |

## Service Count

- Total services: 22
- Active: 13
- Stub: 9
