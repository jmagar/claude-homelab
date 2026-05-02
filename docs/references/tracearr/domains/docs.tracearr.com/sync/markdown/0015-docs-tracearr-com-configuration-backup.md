Backup & Restore | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Configuration](/configuration)Backup & Restore
Copy page
# Backup & Restore
Backup & Restore is currently in **beta**. It has been tested internally but needs broader testing with real-world data. Please report any issues you encounter.
Tracearr includes a full backup and restore system. Backups are `pg\_dump` custom-format dumps packaged as zip files with metadata. You can create backups manually, download them for safekeeping, upload previously downloaded backups, schedule automatic backups, and restore from any backup with live progress tracking.
Backup & Restore is found in **Settings → Backup**.
## Creating a Backup[](#creating-a-backup)
### Via the Web UI[](#via-the-web-ui)
Click the **Create Backup** button in Settings → Backup. The backup will be created in the background and appear in the backup history table once complete. From there you can download, delete, or restore any backup.
### Via the CLI[](#via-the-cli)
Tracearr ships with a standalone backup script that can be run outside the web UI. This is useful for cron jobs, pre-upgrade scripts, or CI pipelines.
```
`docker exec tracearr node apps/server/scripts/backup.ts`
```
Pass `--json` for machine-readable output, useful for cron jobs or wrapper scripts:
```
`docker exec tracearr node apps/server/scripts/backup.ts --json`
```
The CLI script creates the backup in the configured backup directory (see [BACKUP\_DIR](#backup-directory) below) and exits.
## Uploading a Backup[](#uploading-a-backup)
You can upload a previously downloaded Tracearr backup zip file via the **Upload** button in Settings → Backup. The file is validated on upload — it must be a valid Tracearr backup zip with the expected structure and metadata.
## Scheduled Backups[](#scheduled-backups)
Tracearr supports automated backups on a schedule, configured directly in the web UI under Settings → Backup.
Available schedule types:
|Schedule|Description|
|**Daily**|Runs once per day at the configured time|
|**Weekly**|Runs once per week on the configured day and time|
|**Monthly**|Runs once per month on the configured day and time|
You can also configure a **retention count** — the number of scheduled backups to keep. Older backups are automatically cleaned up after each scheduled run.
## Restoring from a Backup[](#restoring-from-a-backup)
Restoring a backup replaces your entire database. All current data will be overwritten. A rollback point is created automatically before the restore begins. If the restore fails, Tracearr will attempt to roll back to this point.
Restoring a large database can be memory intensive. Ensure your container has adequate memory allocated before starting a restore. For large databases, we recommend at least **4GB** of memory.
Click the **Restore** button next to any backup in the history table. Tracearr will:
### Create a restore point
A backup of your current database is created as a rollback point before any changes are made. If this step fails, the restore is aborted and no changes are made.
### Shut down services
Tracearr enters maintenance mode and stops all background services (poller, SSE, queues, Redis subscribers).
### Restore the database
The database is restored from the backup, Redis keys are purged (sessions, caches, locks, jobs), and Tailscale ephemeral state is cleaned up. If the restore fails at this step or any subsequent step, Tracearr will automatically attempt to roll back using the restore point from step 1.
### Run migrations
Database migrations are applied to the restored data and all existing sessions are invalidated, requiring users to re-login.
### Rebuild aggregates
TimescaleDB hypertables and continuous aggregates are rebuilt.
### Restart services
The recovery loop detects healthy connections and re-initializes all services, transitioning back to normal operation. The restore point is removed after a successful restore.
The maintenance page shows live restore progress with phase indicators, and the page automatically reloads when the restore completes.
### Superuser Requirement[](#superuser-requirement)
Restoring a backup requires the database user to have **superuser** privileges. This is needed for TimescaleDB’s `timescaledb\_pre\_restore()` and `timescaledb\_post\_restore()` functions.
* The standard Docker Compose setup already configures the database user as superuser.
* The **supervised** image grants superuser automatically.
* If you are using an external database, ensure the Tracearr user has superuser privileges, or the restore option will be disabled with a message in the UI.
## Backup Directory[](#backup-directory)
Backups are stored in `/data/backup` inside the container by default. To persist backups on the host, mount this path as a bind mount in your Docker Compose file:
```
`volumes:
- /path/to/backups:/data/backup`
```
This is the recommended approach for most users — it keeps backups accessible on the host without changing any Tracearr configuration.
### Permissions[](#permissions)
Tracearr runs as **UID 1001** inside the container. If you use a Docker bind mount for the backup volume, ensure the host directory is owned by this user:
```
`sudo chown -R 1001 /path/to/backups`
```
### `BACKUP\_DIR` Environment Variable[](#backup_dir-environment-variable)
The `BACKUP\_DIR` environment variable changes the path Tracearr uses for backups **inside the container**. Most users do not need to set this. It is only useful if you need Tracearr to write backups to a different path within the container.
```
`BACKUP\_DIR=/custom/path/to/backups`
```
If you set `BACKUP\_DIR`, make sure your Docker volume or bind mount targets the same path. For example, if you set `BACKUP\_DIR=/backups`, your compose mount should be `/path/on/host:/backups`.
Last updated on March 15, 2026
[Tailscale VPN](/configuration/tailscale)[Mobile App](/configuration/mobile)