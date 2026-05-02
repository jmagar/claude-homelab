Tracearr Documentation[Skip to Content](#nextra-skip-nav)
CTRL K
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
Introduction
Copy page
# Tracearr
**Real-time monitoring for Plex, Jellyfin, and Emby. One dashboard for all your servers.**
Tracearr is a free, open-source monitoring platform that gives you complete visibility into your media servers. Track streams in real-time, analyze playback patterns, and detect account sharing — all from a single interface.
## Why Tracearr?[](#why-tracearr)
If you run multiple media servers, you’ve probably dealt with this: Tautulli only works with Plex. Jellystat only works with Jellyfin and Emby. Multiple servers means multiple dashboards.
**Tracearr handles all three.** One install, one interface.
||Tautulli|Jellystat|Tracearr|
|Plex support|✓||✓|
|Jellyfin support||✓|✓|
|Emby support||✓|✓|
|Multi-server dashboard|||✓|
|Account sharing detection|||✓|
|Impossible travel alerts|||✓|
|Trust scoring|||✓|
|Import from Tautulli|—||✓|
|Import from Jellystat||—|✓|
## Key Features[](#key-features)
### Real-Time Monitoring[](#real-time-monitoring)
* **Live Session Tracking** — See every active stream instantly with WebSocket updates
* **Multi-Server Dashboard** — Plex, Jellyfin, and Emby unified in one view
* **Interactive World Map** — Visualize where streams originate globally
* **Server Resources** — Monitor CPU, memory, and transcoder load
### Account Sharing Detection[](#account-sharing-detection)
Six rule types to catch suspicious activity:
* **Impossible Travel** — NYC then London 30 minutes later? Flagged.
* **Simultaneous Locations** — Same account streaming from two cities at once
* **Device Velocity** — Too many unique IPs in a short time window
* **Concurrent Streams** — Set per-user stream limits
* **Geo Restrictions** — Block streaming from specific countries
* **Account Inactivity** — Get notified when accounts go dormant
### Analytics & Insights[](#analytics--insights)
* **Watch History** — Complete session history with device and location data
* **Stream Analytics** — Transcode vs direct play, bandwidth, codec breakdowns
* **Library Analytics** — Storage predictions, duplicate detection, engagement metrics
* **Trust Scores** — Automated scoring based on user behavior
### Alerts & Integrations[](#alerts--integrations)
* **Discord Webhooks** — Instant notifications when rules trigger
* **Custom Notifications** — Apprise support for 80+ notification services
* **Public API** — REST API with Swagger UI for third-party integrations
* **Data Import** — Migrate from Tautulli or Jellystat without losing history
## Get Started[](#get-started)
Tracearr runs as a Docker container and requires TimescaleDB and Redis. The recommended setup takes about 5 minutes.
**Ready to install?** Head to the [Installation Guide](/getting-started/installation) to get Tracearr up and running.
**Already have Tracearr?** Check out [Configuration](/configuration) to customize your setup, or browse the [FAQ](/faq) for troubleshooting tips.
## Community[](#community)
* **GitHub** — [github.com/connorgallopo/tracearr ](https://github.com/connorgallopo/tracearr)
* **Discord** — [Join the community ](https://discord.gg/a7n3sFd2Yw)
* **Issues** — [Report bugs or request features ](https://github.com/connorgallopo/tracearr/issues)
Tracearr is licensed under [AGPL-3.0 ](https://github.com/connorgallopo/Tracearr/blob/main/LICENSE) — free and open source.
Last updated on March 15, 2026
[Overview](/getting-started)