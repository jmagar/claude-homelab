Installation Guide - Docker Compose Setup | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Getting Started](/getting-started)InstallationDocker Compose
Copy page
# Docker Compose
The recommended way to run Tracearr. This sets up three containers — Tracearr, TimescaleDB, and Redis — using our [ready-to-use compose file ](https://github.com/connorgallopo/Tracearr/blob/main/docker/examples/docker-compose.pg18.yml).
## Quick Start[](#quick-start)
Linux/macOSWindows (PowerShell)
### Linux/macOS
```
`# Download the recommended compose file
curl -O https://raw.githubusercontent.com/connorgallopo/Tracearr/main/docker/examples/docker-compose.pg18.yml
# Generate required secrets
echo "JWT\_SECRET=$(openssl rand -hex 32)" \> .env
echo "COOKIE\_SECRET=$(openssl rand -hex 32)" \>\> .env
# Start Tracearr
docker compose -f docker-compose.pg18.yml up -d`
```
Tracearr will be available at `http://localhost:3000`.
See the comments in the compose file for optional environment variables like `TZ`, `PORT`, `LOG\_LEVEL`, and `DB\_PASSWORD`.
## Generating Secrets Without the CLI[](#generating-secrets-without-the-cli)
If you ran the Quick Start commands above, your secrets are already generated and saved in your `.env` file. You can skip this section.
Tracearr requires two secrets: `JWT\_SECRET` and `COOKIE\_SECRET`. Both need to be 64-character hexadecimal strings (a 256-bit key). These are used internally for signing authentication tokens and encrypting session cookies — they just need to be long, random, and unique to your installation.
If you’re deploying through a [Docker UI](/getting-started/installation/docker-ui) or another tool where you need to provide the secrets yourself, here’s how to generate them.
### Terminal[](#terminal)
Linux/macOSWindows (PowerShell)
### Linux/macOS
```
`openssl rand -hex 32`
```
Run the command twice — once for `JWT\_SECRET` and once for `COOKIE\_SECRET`. Copy each output into your environment variable configuration.
### Online generator[](#online-generator)
If you don’t have terminal access, you can use [randomkeygen.com/random-string ](https://randomkeygen.com/random-string):
1. Set **Length** to **64 Characters**
2. Set **Character Set** to **Hexadecimal (0-9, a-f)**
3. Click **Generate**
4. Copy the result
Do this twice — you need one value for `JWT\_SECRET` and a different one for `COOKIE\_SECRET`. Don’t reuse the same value for both.
Treat these values like passwords. Don’t share them, don’t commit them to Git, and don’t post them in support channels. If you think your secrets have been exposed, generate new ones and restart Tracearr — all existing sessions will be invalidated and users will need to log in again.
## Docker Volumes & Backups[](#docker-volumes--backups)
You’ll notice the compose file uses **named Docker volumes** (like `timescale\_data` and `redis\_data`) rather than bind mounts (like `./data:/var/lib/postgresql/data`). This is deliberate, and it matters more than you might expect.
### Why not bind mounts?[](#why-not-bind-mounts)
PostgreSQL requires its data directory to be owned by the `postgres` user with `0700` permissions (owner-only read/write/execute). If the permissions are wrong, PostgreSQL refuses to start. This is a security measure, not a quirk.
With bind mounts, the directory lives on your host filesystem, and ownership depends on how your host maps UIDs. If the UID of the `postgres` user inside the container doesn’t match the owner of the directory on the host, you get a permissions mismatch and a database that won’t boot. This is especially common on systems with FUSE-based filesystems (like Unraid’s array), where permission mapping can be unreliable.
Named volumes sidestep this entirely. Docker manages the volume’s filesystem directly, so ownership and permissions are set correctly when the container first creates them — no manual setup needed.
There’s also a performance angle. Named volumes use Docker’s storage driver, which on Linux typically means native filesystem access. Bind mounts through FUSE-based filesystems (common on NAS platforms) add an abstraction layer that introduces latency — not ideal for a database doing thousands of small reads and writes per second.
### Backing up your database[](#backing-up-your-database)
This is the most common reason people reach for bind mounts — they want to see the database files on the host so they can copy them with their existing backup tool. It’s a reasonable instinct, but it’s the wrong approach for PostgreSQL.
**PostgreSQL data files are not safe to copy while the database is running.** PostgreSQL uses a Write-Ahead Log (WAL) system where changes are written to the WAL before they’re applied to the actual data files. At any given moment, the on-disk data files are in an inconsistent state — committed changes may only exist in memory (in “dirty pages” within shared buffers) and haven’t been flushed to disk yet. If you copy those files while PostgreSQL is running, you get a snapshot where some tables reflect recent transactions and others don’t. That backup looks fine sitting on disk, but it may fail or produce corrupt data when you try to restore it.
TimescaleDB makes this problem worse. Each hypertable chunk is stored as a separate PostgreSQL table with its own data files, indexes, and internal catalog entries. A single hypertable can have hundreds of chunks. If the catalog metadata and the data files are captured at different points in time (which is almost guaranteed during a file copy), you end up with an irrecoverable inconsistency.
Even if you stop the database first, it has to be a **clean** shutdown. If PostgreSQL is killed (OOM, Docker timeout, power loss), the data files are left in a crash state and require WAL replay to recover. A file-level backup of a dirty shutdown is not a valid backup.
Tracearr has a [built-in Backup & Restore](/configuration/backup) system that handles all of this for you — creating consistent `pg\_dump` snapshots, scheduling automatic backups, and restoring with full rollback support. You can create and download backups from the web UI, or use the CLI for automation:
```
`# Create a backup via CLI
docker exec tracearr node apps/server/scripts/backup.ts`
```
If you want to copy a backup from the Docker volume to your host filesystem:
```
`# Copy the entire backup directory from the volume to your host
docker cp tracearr:/data/backup ./tracearr-backups`
```
See [Backup & Restore](/configuration/backup) for full documentation on manual backups, scheduled backups, uploads, and restoring.
Named volumes work out of the box and keep your permissions correct. For backups, use Tracearr’s [built-in backup system](/configuration/backup) — don’t copy raw database files. Bind mounts give you visible files on the host, but those files aren’t safe to copy while PostgreSQL is running and aren’t portable across major versions.
## Next Steps[](#next-steps)
Once Tracearr is running, [connect your first media server](/getting-started/first-server).
Last updated on March 15, 2026
[Overview](/getting-started)[Docker UI](/getting-started/installation/docker-ui)