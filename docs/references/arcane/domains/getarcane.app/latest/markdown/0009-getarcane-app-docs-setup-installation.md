Installation
Get Started
* [Installation](../../docs/setup/installation)
* [Podman](../../docs/setup/podman)
* [LXC Container Setup](../../docs/guides/lxc-container)
* [Migrate to 1.0](../../docs/setup/migrate-v1)
* [Next Builds](../../docs/setup/next-images)
Security
* [Verify Artifacts](../../docs/security/verify-artifacts)
* [Socket Proxy Setup](../../docs/setup/socket-proxy)
Configuration
* [Environment Variables](../../docs/configuration/environment)
* [Appearance](../../docs/configuration/appearance)
* [Notifications](../../docs/configuration/notifications)
* [OIDC Single Sign-On](../../docs/configuration/sso)
* [Analytics](../../docs/configuration/analytics)
Networking
* [HTTP Proxy](../../docs/configuration/proxy)
* [Websocket Configuration](../../docs/configuration/websockets-reverse-proxies)
* [TLS and HTTP/2](../../docs/configuration/tls)
Features
* [Projects](../../docs/features/projects)
* [Containers](../../docs/features/containers)
* [Images](../../docs/features/images)
* [Image Builds](../../docs/features/image-builds)
* [Volumes](../../docs/features/volumes)
* [Networks](../../docs/features/networks)
* [Vulnerability Scans](../../docs/features/vulnerability-scans)
* [Remote Environments](../../docs/features/environments)
* [Auto Updates](../../docs/guides/updates)
* [Custom Metadata](../../docs/guides/custom-metadata)
* [Using Templates](../../docs/templates)
* [Template Registries](../../docs/templates/registries)
* [Docker Swarm](../../docs/features/swarm)
Guides
* [Buildables](../../docs/guides/buildables)
* [GPU Monitoring Setup](../../docs/guides/gpu-setup)
CLI
* [Installation](../../docs/cli/install)
* [Configuration](../../docs/cli/config)
Development
* [Contributing to Arcane](../../docs/dev/contribute)
* [Translating Arcane](../../docs/dev/translate)
Community
* [Discord ](https://discord.gg/WyXYpdyV3Z)
> [!NOTE] This guide walks you through a full Arcane installation.If you want to use Arcane with a remote server, see
[> the remote environments guide
](/docs/features/environments)> . If you want extra protection for Docker access, see the
[> Socket Proxy Setup
](/docs/setup/socket-proxy)> guide.
## Docker Compose (Recommended)
If you'd rather set things up yourself, or if you're on a different platform, use Docker Compose:
## 1. Create `compose.yaml`:
`services:
arcane:
image: ghcr.io/getarcaneapp/arcane:latest
container\_name: arcane
ports:
- '3552:3552'
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- arcane-data:/app/data
- /host/path/to/projects:/app/data/projects
environment:
- APP\_URL=http://localhost:3552
- PUID=1000
- PGID=1000
- ENCRYPTION\_KEY=xxxxxxxxxxxxxxxxxxxxxx
- JWT\_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxx
restart: unless-stopped
volumes:
arcane-data:
`
> [!NOTE]The
`> ENCRYPTION_KEY
`> must be 32 bytes long (raw, base64, or hex).
>
`> # You can use OpenSSL in your terminal to generate the secrets> echo " - ENCRYPTION_KEY=$(openssl rand -hex 32)"echo " - JWT_SECRET=$(openssl rand -hex 32)"
`
>
> [!TIP]You can also add extra folders in your
`> compose.yaml
`> if you want Arcane to keep build files or backups in a specific place:
>
* `> /builds
`> : used by the
**> Build Workspace
**> for Dockerfiles and build contexts.
* > Host path example:
`> /srv/arcane/builds:/builds
`>
* > Docker volume example:
`> arcane-builds:/builds
`>
* `> /backups
`> : used to store exported volume backups somewhere predictable.
* > Host path example:
`> /srv/arcane/backups:/backups
`>
* > Docker volume example:
`> arcane-backups:/backups
`>
> If you use named Docker volumes, remember to declare them under the top-level
`> volumes:
`> section too.
## 2. Understand the folders Arcane uses:
***/var/run/docker.sock***: Gives Arcane access to Docker.
***arcane-data***: Arcane's data folder, which stores things like the database and project data.
***/builds***: Optional folder for build files used by the Build Workspace. You can map a host folder or a Docker volume here.
***/backups***: Optional folder for exported backups. Use this if you want backups stored somewhere you can easily find them.
> [!IMPORTANT]> To manage an existing Compose project, the project folder path must match inside and outside the container.All paths must be absolute, for example
`> /opt/docker
`> instead of
`> opt/docker
`> .
>
> For example, if your projects are at
`> /opt/docker
`> on the host:
>
* > Mount:
`> /opt/docker:/opt/docker
`> (not
`> /opt/docker:/app/data/projects
`> )
>
* > Set the projects directory in Arcane to
`> /opt/docker
`> or set
`> PROJECTS_DIRECTORY=/opt/docker
`> in the environment for this to take effect immediately on startup of Arcane.
>
> This helps Arcane and Docker agree on where your files live, so paths like
`> ./config
`> work the way you expect.
## 3. Generate your secrets
You can generate the required secrets either with the Arcane CLI in a temporary container or with your computer's `openssl` command.
Via Docker Container:
Copy
If you already have the Arcane CLI installed:
Copy
## 4. Start Arcane
`docker compose up -d
`
## 5. Open Arcane
Open [localhost:3552](http://localhost:3552) in your browser and follow the setup steps. The first time you sign in, you'll be asked to change the default admin password. Use these default credentials:
Username:
Copy
Password:
Copy
## 6. Using a custom domain or reverse proxy?
> [!NOTE]Arcane uses WebSockets to stay connected in real time. If you're putting Arcane behind a reverse proxy or custom domain, make sure WebSocket support is enabled.
>
> See the
[> WebSocket Configuration Guide
](/docs/configuration/websockets-reverse-proxies)> for setup steps for Nginx, Apache, and other reverse proxies.
## 7. Behind an outbound HTTP proxy?
If Arcane needs to reach the internet through a proxy, for example to download templates or check for updates, see the [HTTP Proxy Configuration Guide](/docs/configuration/proxy).
## Convenience Script
If you're using Linux, you can run our installer to set up Arcane and Docker for you.
Copy
To uninstall:
### Safe uninstall, recommended
This version asks before removing Arcane data, the Arcane user/group, or Docker.
Copy
### Full cleanup, use with caution
> [!WARNING]> This removes Arcane, its data, the Arcane user/group, and Docker packages.Only use this if you really want Docker removed from the machine too.
Copy
## Next (Preview) Builds
Want to try the latest features before they are officially released? See the [Next Builds](/docs/setup/next-images) guide for the `:next` and `:next-distroless` images.