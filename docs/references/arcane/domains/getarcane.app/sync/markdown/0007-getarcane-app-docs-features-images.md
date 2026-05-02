Images
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
The **Images** page lists every Docker image on the selected host and lets you pull, inspect, prune, and remove them. Arcane also flags images that have a newer release available.
Images page in Arcane. ## Browse images
Open **Images** in the sidebar. The table shows tag, ID, size, and creation date for each image.
## Pull an image
1. Click **Pull Image**.
2. Enter the image reference, e.g. `redis:latest`.
3. Click **Pull**. The image appears in the list once the download finishes. ## Inspect an image
Click the image's name, ID, or **Inspect** button to see its full details — tags, configuration, history, and labels.
## Remove an image
1. Click the trash icon on the image row.
2. Confirm.
> [!NOTE]An image in use by any container can't be removed.
## Prune unused images
1. Click **Prune Images**.
2. Pick what to remove:
* **Dangling only** — images without tags.
* **All unused** — anything no container is using.
* Confirm. ## Update detection
Arcane flags two kinds of updates:
* **Update badge** — a newer release is available for the image's tag.
* **Digest badge** — the tag is unchanged but the published digest has moved (common with `latest` or `next`). Hover the badge to see the new digest and date; click it to pull the updated digest.
Arcane checks for updates on page load and when you click the **Refresh** icon in the toolbar.
### Updates not appearing?
* Confirm Arcane can reach your registry — check network connectivity and stored credentials.
* Click **Check Updates** to force a re-scan. ## Private registries
Arcane uses your saved registry credentials when pulling and when checking for updates.
1. In the sidebar under **Customization**, open **Container Registries**.
2. Add the registry host, username, and password or token.
3. Save.
When an image reference includes a private hostname, Arcane matches it to the saved entry. You can store multiple credentials; Arcane picks the right one based on the image's host.
### Amazon ECR
ECR is a first-class registry type. When adding an ECR registry, provide:
* AWS access key ID
* AWS secret access key
* AWS region
Arcane exchanges those for a temporary ECR authorization token, caches it, and refreshes it as needed — no manual long-lived Docker token required.