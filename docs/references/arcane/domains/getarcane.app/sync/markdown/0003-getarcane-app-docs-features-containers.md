Containers
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
The **Containers** page lists every container on your Docker host and lets you start, stop, inspect, and remove them. Use it for one-off containers; for grouped services, see [Projects](/docs/features/projects).
Containers page in Arcane. ## Browse containers
Open **Containers** in the sidebar. The table shows name, ID, image, and status for every container on the host.
If you have a lot of published ports, the table collapses long port lists behind a `+N` expander. The view options menu can also hide exposed-only ports so you only see published host mappings.
## Create a container
1. Click **Create Container**.
2. Fill in name and image. The other fields (ports, volumes, environment variables, restart policy, and so on) are optional.
3. Click **Create**. ## Start, stop, restart, redeploy
Each container row has action buttons:
* **Start** / **Stop** / **Restart** — change the running state.
* **Redeploy** — pull the latest image and recreate the container with the same name, mounts, labels, networks, and restart policy. Use this to update a single container in place. ## Inspect a container
Click a container's name or its **Inspect** button to open the detail view. Tabs cover configuration, network settings, mounts, and logs.
### Compose tab
If the container belongs to an Arcane-managed Compose project, the detail view also shows a **Compose** tab with the source compose file:
* the root compose file when the service is defined there
* an included compose file when the service comes from a Compose `include`
For Git-synced projects, this tab is read-only.
### Auto-update toggle
The **Overview** tab has an **Auto Update** toggle for opting a single container in or out of Arcane's updater. If the container already has an explicit `com.getarcaneapp.arcane.updater` label, that label wins.
## View logs
Open a container's detail view and switch to the **Logs** tab. The viewer:
* detects JSON and logfmt logs and renders them as structured rows
* groups multiline messages so a stack trace stays together
* shows small CPU and memory monitors alongside the log stream ## Remove a container
1. Click the trash icon on the container row.
2. Confirm.
> [!NOTE]A container has to be stopped before you can remove it, unless you check the
**> Force
**> option.