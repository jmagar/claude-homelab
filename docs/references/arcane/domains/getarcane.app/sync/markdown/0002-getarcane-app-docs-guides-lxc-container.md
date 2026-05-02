LXC Container Setup
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
Running Arcane inside an LXC container (such as on Proxmox) requires additional configuration to access host system metrics. This guide covers how to properly mount the necessary filesystems for full functionality.
## Prerequisites
* LXC container with Docker installed
* Privileged or properly configured unprivileged container
* Access to the LXC host configuration ## LXC Host Configuration
Before configuring Arcane, ensure your LXC container has the necessary permissions. On your Proxmox host or LXC manager, you may need to enable nesting and adjust features:
`# Enable nesting for Docker support
lxc.include = /usr/share/lxc/config/nesting.conf
# For unprivileged containers, you may need:
features: nesting=1
`
## Arcane Configuration
To enable full system metrics visibility inside an LXC container, mount the `cgroup` and `proc` filesystems from the LXC host into the Arcane container.
### Basic Setup
Configure your `compose.yaml` with the required volume mounts:
`services:
arcane:
image: ghcr.io/getarcaneapp/arcane:latest
container\_name: arcane
ports:
- '3552:3552'
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- arcane-data:/app/data
# Mount cgroup for system metrics (read-only)
- /sys/fs/cgroup:/sys/fs/cgroup:ro
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
## Agent Configuration
For Arcane agents running inside LXC containers, you'll need additional configuration to access process information from the host.
### Agent Setup with Host PID
Configure your agent's `compose.yaml` with host PID namespace and proc mount:
`services:
arcane-agent:
image: ghcr.io/getarcaneapp/arcane-agent:latest
container\_name: arcane-agent
# Use host PID namespace for process visibility
pid: host
volumes:
- /var/run/docker.sock:/var/run/docker.sock
# Mount proc for process metrics
- /proc:/proc
environment:
- ARCANE\_SERVER\_URL=http://your-arcane-server:3552
- AGENT\_TOKEN=your-agent-token
restart: unless-stopped
`