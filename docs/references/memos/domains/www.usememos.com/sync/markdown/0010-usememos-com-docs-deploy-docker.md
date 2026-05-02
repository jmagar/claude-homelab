Docker - Memos
[Memos](/)
Search
⌘K
Documentation
[Documentation](/docs)
Getting Started
Deploy
[Deploy](/docs/deploy)[Binary](/docs/deploy/binary)[Docker](/docs/deploy/docker)[Docker Compose](/docs/deploy/docker-compose)[Build From Source](/docs/deploy/development)[Kubernetes](/docs/deploy/kubernetes)[Reverse Proxy](/docs/deploy/reverse-proxy)
Configuration
Usage
Operations
Development
Integrations
Admin
Troubleshooting
[FAQ](/docs/faq)
[](https://github.com/usememos/memos)
Deploy
# Docker
Run Memos in a single Docker container with persistent data.
Docker is the simplest production-style deployment for a single Memos instance.
## [Quick start](#quick-start)
```
`docker run -d \\
--name memos \\
--restart unless-stopped \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
neosmemo/memos:stable`
```
* The container listens on port `5230`.
* Memos stores persistent data in `/var/opt/memos` inside the container.
* The host path `\~/.memos` will contain the SQLite database and local assets.
## [Image tags](#image-tags)
Common tag choices:
* `stable`: safest default for production
* versioned tags such as `0.28.1`: fully pinned deployment
* branch-like tags such as `0.28`: latest patch in that line
* `latest`: development-oriented and less suitable for production
## [Platform support](#platform-support)
The image ships multi-arch manifests and automatically selects the right variant:
* `linux/amd64` — x86\_64 processors
* `linux/arm64` — ARM 64-bit (Apple Silicon, Raspberry Pi 4+)
* `linux/arm/v7` — ARM 32-bit (Raspberry Pi 2/3)
## [Container user](#container-user)
Memos runs as a non-root user inside the container:
* UID `10001`, GID `10001`, username `nonroot`
* The entrypoint script automatically fixes ownership of mounted volumes
If your host volume requires a different UID or GID, override them:
```
`docker run -d \\
--name memos \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
-e MEMOS\_UID=1000 \\
-e MEMOS\_GID=1000 \\
neosmemo/memos:stable`
```
## [Environment variables](#environment-variables)
All `MEMOS\_\*` variables correspond directly to command-line flags. Common ones:
|Variable|Default|Purpose|
|`MEMOS\_PORT`|`8081`|HTTP listen port (image default: `5230`)|
|`MEMOS\_ADDR`|``|Bind address (empty = all interfaces)|
|`MEMOS\_DATA`|`/var/opt/memos`|Data directory|
|`MEMOS\_DRIVER`|`sqlite`|Database backend|
|`MEMOS\_DSN`|auto|Database connection string|
|`MEMOS\_INSTANCE\_URL`|``|Public instance URL|
|`MEMOS\_DEMO`|`false`|Demo mode|
Typical example:
```
`docker run -d \\
--name memos \\
--restart unless-stopped \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
-e MEMOS\_PORT=5230 \\
-e MEMOS\_DRIVER=sqlite \\
-e MEMOS\_INSTANCE\_URL=https://memos.example.com \\
neosmemo/memos:stable`
```
## [External databases](#external-databases)
SQLite is the default and works well for a single-node deployment. If you need MySQL or PostgreSQL, provide:
* `MEMOS\_DRIVER=mysql` or `MEMOS\_DRIVER=postgres`
* `MEMOS\_DSN` with the appropriate connection string
MySQL example:
```
`docker run -d \\
--name memos \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
-e MEMOS\_DRIVER=mysql \\
-e MEMOS\_DSN="user:password@tcp(mysql-host:3306)/memos" \\
neosmemo/memos:stable`
```
PostgreSQL example:
```
`docker run -d \\
--name memos \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
-e MEMOS\_DRIVER=postgres \\
-e MEMOS\_DSN="postgres://user:password@postgres-host:5432/memos?sslmode=disable" \\
neosmemo/memos:stable`
```
When using an external database, the mounted volume is still relevant for local assets and instance data.
## [Secrets with `\_FILE` suffix](#secrets-with-_file-suffix)
The entrypoint script supports `\*\_FILE` variable suffixes so you can pass credentials via Docker secrets instead of plain environment variables:
```
`echo "postgres://user:password@host:5432/memos" | docker secret create memos\_dsn -
docker run -d \\
--name memos \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
-e MEMOS\_DRIVER=postgres \\
-e MEMOS\_DSN\_FILE=/run/secrets/memos\_dsn \\
--secret memos\_dsn \\
neosmemo/memos:stable`
```
This works for any `MEMOS\_\*` variable.
## [Container management](#container-management)
```
`docker logs -f memos
docker stop memos
docker start memos
docker restart memos`
```
## [Upgrades](#upgrades)
```
`docker pull neosmemo/memos:stable
docker stop memos
docker rm memos
docker run -d \\
--name memos \\
--restart unless-stopped \\
-p 5230:5230 \\
-v \~/.memos:/var/opt/memos \\
neosmemo/memos:stable`
```
Because data is stored in the mounted volume, replacing the container is usually safe as long as you keep the same data directory and have backups.
[
Binary
Install and run Memos as a native binary on Linux, macOS, or Windows.
](/docs/deploy/binary)[
Docker Compose
Deploy Memos with Docker Compose for repeatable local or small production setups.
](/docs/deploy/docker-compose)
### On this page
[Quick start](#quick-start)[Image tags](#image-tags)[Platform support](#platform-support)[Container user](#container-user)[Environment variables](#environment-variables)[External databases](#external-databases)[Secrets with `\_FILE` suffix](#secrets-with-_file-suffix)[Container management](#container-management)[Upgrades](#upgrades)