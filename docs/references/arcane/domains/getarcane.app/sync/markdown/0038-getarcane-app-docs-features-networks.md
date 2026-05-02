Networks
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
The **Networks** page lists every Docker network on the selected host and lets you create, inspect, and remove them. Two extra views — **Ports** and **Topology** — give you a host-wide picture of what's published and how containers are wired up.
Networks page in Arcane. ## Browse networks
Open **Networks** in the sidebar. The table shows name, driver, and subnet for each network.
## Create a network
1. Click **Create Network**.
2. Enter a name.
3. Optional: pick a driver (`bridge`, `overlay`, etc.) and configure subnet, gateway, and other advanced options.
4. Click **Create**. ## Inspect a network
Click a network's name to see its ID, driver, subnet, gateway, and the containers attached to it.
## Remove a network
1. Open the row's dropdown and click the trash icon.
2. Confirm.
> [!NOTE]Networks in use by containers can't be removed, and Docker's defaults (
`> bridge
`> ,
`> host
`> ,
`> none
`> ) can never be removed.
## Ports view
Open the **Ports** view from the Networks area to answer questions like:
* which ports are published to the host
* which containers expose ports without publishing them
* which `host:port` combinations are already taken
The table supports search, sorting, and pagination across the whole environment.
## Topology view
The **Topology** view renders an interactive graph of:
* Docker networks
* containers attached to them
* the relationships between them
Useful when you want a quick visual overview of bridge, overlay, or shared application networks.
For background on Docker networking concepts, see the [official Docker documentation](https://docs.docker.com/network/).