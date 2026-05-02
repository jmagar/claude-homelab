Debug Page - System Info & Maintenance | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Configuration](/configuration)Debug Page
Copy page
# Debug Page
Tracearr includes a debug page at `/debug` for troubleshooting and advanced maintenance. This page is not linked from the main navigation — access it directly at:
```
`http://your-tracearr:3000/debug`
```
## System Information[](#system-information)
The debug page displays real-time system stats:
* **Node.js version**, platform, and architecture
* **Uptime** — how long Tracearr has been running
* **Memory usage** — heap and RSS memory consumption
* **Environment variables** — sanitized view of configuration
## Database Statistics[](#database-statistics)
View database health and size information:
* **Record counts** — sessions, violations, users, servers, rules, library items
* **Database size** — total storage used
* **Table sizes** — breakdown by table and TimescaleDB aggregates
## Logs (Supervised Only)[](#logs-supervised-only)
If running the `supervised` image, the debug page includes a Log Explorer for viewing PostgreSQL, Redis, and application logs directly in the browser.
You can also access logs via CLI:
```
`docker exec tracearr cat /var/log/supervisor/tracearr-error.log`
```
Available log files in `/var/log/supervisor/`:
|Log File|Contents|
|`tracearr.log`|Application stdout|
|`tracearr-error.log`|Application errors|
|`postgres.log`|PostgreSQL stdout|
|`postgres-error.log`|PostgreSQL errors|
|`redis.log`|Redis stdout|
|`redis-error.log`|Redis errors|
|`supervisord.log`|Supervisor process manager|
Set `LOG\_LEVEL=debug` in your environment for verbose application output.
### Standard Docker Logs[](#standard-docker-logs)
If running the standard `latest` image with separate containers, use standard Docker log commands:
```
`docker logs tracearr # Application logs
docker logs tracearr-db # Database logs
docker logs tracearr-redis # Cache logs`
```
### Proxmox VE LXC Logs[](#proxmox-ve-lxc-logs)
If running in a Proxmox VE LXC, use standard systemd journal commands:
```
`journalctl -u tracearr # Application logs
journalctl -u postgresql # Database logs
journalctl -u redis # Cache logs`
```
## Snapshot Management[](#snapshot-management)
View and clean up library snapshots. Useful for removing suspicious or corrupted snapshot data that may affect Library Growth charts.
## Maintenance Actions[](#maintenance-actions)
|Action|Description|
|**Refresh Aggregates**|Manually refresh TimescaleDB continuous aggregates|
|**Clear Stuck Jobs**|Reset jobs that show “already running” but aren’t progressing|
Use **Clear Stuck Jobs** when a maintenance job in Settings → Jobs says “already running” but shows no progress. This clears stale job state from a previous crash.
## Danger Zone[](#danger-zone)
These actions permanently delete data and cannot be undone. Use with caution.
|Action|What it deletes|
|**Clear Violations**|All violation records|
|**Clear Rules**|All detection rules and their violations|
|**Clear Termination Logs**|All stream termination history|
|**Clear Library Cache**|All library metadata and snapshots|
|**Clear Sessions**|All session history, violations, and termination logs|
|**Clear Users**|All non-owner users and their associated data|
|**Clear Servers**|All servers (cascades to users, sessions, violations, library)|
|**Factory Reset**|Everything except your owner account — returns Tracearr to initial setup state|
Last updated on March 15, 2026
[Mobile App](/configuration/mobile)[Upgrading](/upgrading)