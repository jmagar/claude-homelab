GPU Monitoring Setup
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
> [!IMPORTANT]This guide assumes GPU drivers are already installed and configured on your host system. Refer to the respective vendor documentation for driver installation.
## NVIDIA GPU Setup
Configure Arcane with NVIDIA GPU support in your `compose.yaml`:
`services:
arcane:
image: ghcr.io/getarcaneapp/arcane:latest
container\_name: arcane
ports:
- '3552:3552'
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- arcane-data:/app/data
environment:
- APP\_URL=http://localhost:3552
- PUID=1000
- PGID=1000
- ENCRYPTION\_KEY=xxxxxxxxxxxxxxxxxxxxxx
- JWT\_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxx
- NVIDIA\_VISIBLE\_DEVICES=all
- GPU\_MONITORING\_ENABLED=true
- GPU\_TYPE=nvidia
deploy:
resources:
reservations:
devices:
- driver: nvidia
count: all
capabilities: [gpu]
restart: unless-stopped
volumes:
arcane-data:
`
## AMD GPU Setup
Configure Arcane with AMD GPU support in your `compose.yaml`:
`services:
arcane:
image: ghcr.io/getarcaneapp/arcane:latest
container\_name: arcane
ports:
- '3552:3552'
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- arcane-data:/app/data
environment:
- APP\_URL=http://localhost:3552
- PUID=1000
- PGID=1000
- ENCRYPTION\_KEY=xxxxxxxxxxxxxxxxxxxxxx
- JWT\_SECRET=xxxxxxxxxxxxxxxxxxxxxxxxxx
- GPU\_MONITORING\_ENABLED=true
- GPU\_TYPE=amd
devices:
- /dev/dri:/dev/dri
restart: unless-stopped
volumes:
arcane-data:
`