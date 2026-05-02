Auto Updates
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
Arcane can poll your registries on a schedule and update containers (or whole Compose projects) when a new image is published.
## Before you turn it on
* The images you want updated must be hosted in registries Arcane can reach.
* For private registries, store credentials under **Registry Credentials** first.
* The container has to be one Arcane can recreate cleanly — meaning its ports, mounts, env, and labels are visible to Arcane. ## Enable auto updates
1. Go to **Environments → [your environment] → Settings → Docker**.
2. Turn on **Image Polling** and pick a schedule (or enter a custom one).
3. Turn on **Auto Updates**.
4. Set the run interval (in minutes).
5. Save.
> [!NOTE]Very low intervals are clamped to a safer minimum.
## How Arcane decides what to update
Arcane compares image **digests**, not tags. Tags like `latest` and `next` move over time, so digest comparison is the only reliable way to spot a change.
The model is similar to Watchtower's, with adjustments to fit Arcane's update flow — so it should feel familiar if you've used Watchtower.
## Compose-aware updates
When a container belongs to a Compose project, Arcane uses Compose-aware logic instead of treating each service as a standalone container. That means Arcane can:
* group pending updates by project
* pull only the images of services that actually changed
* recreate only those services, leaving the rest running
Manual project redeploys still use the project-level Compose flow (a deliberate `pull` + `up -d` across the whole project).
## Per-container labels
All labels live under the `com.getarcaneapp.arcane.\*` namespace.
### Disable updates for one container
`labels:
- com.getarcaneapp.arcane.updater=false
`
Accepted truthy values: `true`, `1`, `yes`, `on`. Falsy: `false`, `0`, `no`, `off`. Case-insensitive.
You can also flip this from the container's detail page in Arcane. If the container already has an explicit updater label, the label wins and the UI toggle reflects it.
### Restart order
If your container needs other containers restarted first (or needs to restart when a dependency does), set:
`labels:
- com.getarcaneapp.arcane.depends-on=container\_a,container\_b
`
A comma-separated list of **container names**. Arcane also infers some dependencies from Docker wiring like legacy `links` and `network\_mode: container:...`.
### Override the stop signal
`labels:
- com.getarcaneapp.arcane.stop-signal=SIGINT
`
## Compose example
`services:
myapp:
image: ghcr.io/acme/myapp:latest
labels:
- com.getarcaneapp.arcane.updater=true
- com.getarcaneapp.arcane.depends-on=db,redis
- com.getarcaneapp.arcane.stop-signal=SIGTERM
db:
image: postgres:16
redis:
image: redis:7
`
## docker run example
`docker run -d --name myapp --label com.getarcaneapp.arcane.updater=true ghcr.io/acme/myapp:latest
`