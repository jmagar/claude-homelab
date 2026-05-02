Docker Compose - Memos
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
# Docker Compose
Deploy Memos with Docker Compose for repeatable local or small production setups.
Docker Compose is a good default when you want a checked-in deployment file, predictable restarts, and easier upgrades than a one-off `docker run` command.
## [Basic setup](#basic-setup)
```
`services:
memos:
image: neosmemo/memos:stable
container\_name: memos
restart: unless-stopped
ports:
- "5230:5230"
volumes:
- ./data:/var/opt/memos
environment:
MEMOS\_PORT: 5230
MEMOS\_DRIVER: sqlite
MEMOS\_INSTANCE\_URL: https://memos.example.com`
```
Run it with:
```
`docker compose up -d`
```
## [Why Compose is often better than raw Docker](#why-compose-is-often-better-than-raw-docker)
* declarative configuration you can review in git
* easier upgrades and restarts
* cleaner environment variable management
* straightforward volume and network definitions
## [Common operational commands](#common-operational-commands)
```
`docker compose logs -f
docker compose down
docker compose pull
docker compose up -d`
```
## [Production notes](#production-notes)
* keep your data directory on persistent storage
* place Memos behind a reverse proxy for HTTPS
* set `MEMOS\_INSTANCE\_URL` to the public URL
* back up both the database and any local assets if you do not use database-backed attachment storage
## [When to add more services](#when-to-add-more-services)
Compose becomes more useful when you also want:
* a reverse proxy container
* a dedicated MySQL or PostgreSQL container for local evaluation
* explicit secret and environment file handling
[
Docker
Run Memos in a single Docker container with persistent data.
](/docs/deploy/docker)[
Build From Source
Build Memos locally for development, testing, and custom deployments.
](/docs/deploy/development)
### On this page
[Basic setup](#basic-setup)[Why Compose is often better than raw Docker](#why-compose-is-often-better-than-raw-docker)[Common operational commands](#common-operational-commands)[Production notes](#production-notes)[When to add more services](#when-to-add-more-services)