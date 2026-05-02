Supervised Installation (Unraid / Bare-Metal) | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Getting Started](/getting-started)[Installation](/getting-started/installation)Supervised
Copy page
# Supervised
The supervised image bundles PostgreSQL, Redis, and Tracearr into a single container using supervisord. It was built for environments where running separate database containers isn’t practical.
This image is designed for **Unraid** and other bare-metal Docker hosts. Running it on VMs or nested container environments is unsupported. If you can run separate containers, use the standard [Docker Compose](/getting-started/installation) setup instead — it’s more flexible, uses less memory, and runs a newer version of PostgreSQL.
## Requirements[](#requirements)
* **3GB RAM minimum** — the container runs PostgreSQL, Redis, and Node.js simultaneously. Below 3GB, the container will be killed by the OOM killer (exit code 137).
* **Docker** with Compose V2
## Quick Start[](#quick-start)
```
`# Download the supervised compose file
curl -O https://raw.githubusercontent.com/connorgallopo/Tracearr/main/docker/examples/docker-compose.supervised-example.yml
# Start Tracearr
docker compose -f docker-compose.supervised-example.yml up -d`
```
That’s it. No `.env` file needed — secrets are generated automatically on first boot and persisted across restarts.
Tracearr will be available at `http://localhost:3000`.
You can set optional environment variables like `TZ`, `PORT`, and `LOG\_LEVEL` by uncommenting them in the compose file. See the comments in [docker-compose.supervised-example.yml ](https://github.com/connorgallopo/Tracearr/blob/main/docker/examples/docker-compose.supervised-example.yml) for details.
## How It Differs from Standard[](#how-it-differs-from-standard)
||Standard (Docker Compose)|Supervised|
|**Containers**|3 (Tracearr, TimescaleDB, Redis)|1 (all bundled)|
|**PostgreSQL**|18 (TimescaleDB HA)|15 (TimescaleDB)|
|**Minimum RAM**|\~1GB|3GB|
|**Secrets**|Manual (`.env` file)|Auto-generated on first boot|
|**Volumes**|`timescale\_data`, `redis\_data`|`tracearr\_postgres`, `tracearr\_redis`, `tracearr\_data`|
The supervised image runs PostgreSQL 15, while the standard compose uses PostgreSQL 18. The on-disk binary format is incompatible between major versions — **you cannot switch between these setups and reuse the same data volumes**. If you try, PostgreSQL will refuse to start. Always back up with `pg\_dump` before switching.
## Why Named Volumes Matter Here[](#why-named-volumes-matter-here)
The supervised image runs three processes as three different system users — `postgres`, `redis`, and `tracearr` — each writing to its own data directory. On every startup, the entrypoint script runs `chown` and `chmod` across all three directories to ensure correct ownership before supervisord launches each process. PostgreSQL in particular requires `0700` permissions on its data directory and will refuse to start otherwise.
Named volumes are backed by Docker’s storage driver (typically ext4 or xfs), so these permission fixes work reliably every time. FUSE-based filesystems — like Unraid’s array — may silently fail to apply `chown` or `chmod`, which means PostgreSQL sees the wrong permissions and won’t start. supervisord will restart it in a loop, and the container will never become healthy.
If you need bind mounts, use the standard [Docker Compose](/getting-started/installation) setup instead — it runs each service in its own container with a single user, which is far more forgiving with host filesystem permissions. We don’t recommend bind mounts in any case (see [Why not bind mounts?](/getting-started/installation#why-not-bind-mounts)), but if you must use them, the standard setup is the only one we provide support for.
If you install via the Unraid Community Apps template (which uses bind mounts), make sure the **PostgreSQL Data** path points to a cache-backed location — for example `/mnt/cache/appdata/tracearr/postgres` or `/mnt/appdata/tracearr/postgres` if you have a dedicated appdata share. Paths under `/mnt/user` go through Unraid’s FUSE layer, which adds significant latency to every database read and write. On a typical setup this can make PostgreSQL checkpoints take 50–100x longer than they should, even on NVMe drives.
## Backing Up Your Database[](#backing-up-your-database)
Tracearr has a [built-in Backup & Restore](/configuration/backup) system that creates consistent database snapshots, supports scheduled backups with retention, and handles restoring with automatic rollback. You can manage everything from the web UI under **Settings → Backup**.
You can also create backups via the CLI:
```
`docker exec tracearr node apps/server/scripts/backup.ts`
```
To copy a backup from the Docker volume to your host filesystem:
```
`docker cp tracearr:/data/backup ./tracearr-backups`
```
See [Backup & Restore](/configuration/backup) for full documentation.
For an explanation of why named volumes are used and why copying raw database files isn’t safe, see [Docker Volumes & Backups](/getting-started/installation#docker-volumes--backups) on the Docker Compose page.
## Next Steps[](#next-steps)
Once Tracearr is running, [connect your first media server](/getting-started/first-server).
Last updated on March 15, 2026
[Docker UI](/getting-started/installation/docker-ui)[Kubernetes (Helm)](/getting-started/installation/kubernetes)