Custom Metadata
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
You can give projects and services a custom icon and a list of external links — for example a docs URL, a homepage, or a repo. Project-level metadata goes in the compose file's `x-arcane` block; service-level icons go on the service via a label.
## Project-level metadata
Add an `x-arcane` block at the top level of your `compose.yaml`:
`x-arcane:
icon: https://example.com/project-icon.png
urls:
- https://docs.example.com
- https://github.com/example/repo
services:
# ...
`
* `icon` (or `icons`) — image URL for the project.
* `urls` — extra links shown next to the project (docs, homepage, etc.). ## Service-level icons
Set an icon for an individual service via a label:
`x-arcane:
icon: https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/nginx.png
urls:
- https://google.com
services:
nginx:
image: nginx:alpine
container\_name: nginx\_service
# ...
labels:
- com.getarcaneapp.arcane.icon=https://cdn.jsdelivr.net/gh/homarr-labs/dashboard-icons/png/nginx.png
`
The label only changes the container's icon. The top-level `x-arcane` block only changes the project's icon. They're independent.