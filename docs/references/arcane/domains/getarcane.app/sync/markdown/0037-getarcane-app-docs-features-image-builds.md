Image Builds
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
Arcane has two ways to build images:
* **Manual builds** in the **Build Workspace** — for one-off or repeatable builds with full control.
* **Project builds** — for Compose services that have a `build:` directive.
This page covers both, plus the provider options (Local Docker vs. Depot).
## Manual builds (Build Workspace)
Open **Builds and Deployments → Builds** (`/images/builds`).
The workspace looks for build contexts in `/builds` inside the container by default. Change the path in **Settings → Build**.
Mount a host folder or named Docker volume to `/builds` in your `compose.yaml`:
* Host path: `/srv/arcane/builds:/builds`
* Named volume: `arcane-builds:/builds`
If you use a named volume, declare it under the top-level `volumes:` section too.
The workspace gives you a file browser for the context, a build form (required + advanced options), a live build output panel, and build history with **Rebuild** support.
## Project builds (Compose)
Open a project page in **Projects**. When Arcane detects services with `build:` in the compose file, you'll see:
* **Build** — build images without deploying.
* **Build & Deploy** — build as part of deployment. ## Build providers
Arcane supports two:
* **Local Docker** — builds on the same machine running Arcane.
* **Depot** — builds remotely via Depot's service. ### How Arcane picks a provider
* The default comes from **Settings → Build**.
* The manual build UI lets you override it per build.
* If Depot credentials aren't configured, Arcane falls back to Local Docker. ### Provider behavior differences
When **Depot** is selected:
* **Push** is forced **on**.
* **Load** is forced **off**.
When **Local Docker** is selected, you control both **Push** and **Load**.
## Configure build settings first
Open **Settings → Build** (`/settings/builds`) and configure:
1. **Builds Directory** — the folder the workspace opens. Use a full absolute path.
2. **Default Build Provider** — Local Docker or Depot.
3. **Build Timeout** — between 60 and 14,400 seconds.
4. **Depot Project ID** (optional).
5. **Depot Token** (optional).
> [!TIP]Leaving the Depot token blank during an update keeps the existing saved token.
## Run a manual build
1. Open the **Build Workspace** at `/images/builds`.
2. In the left panel, choose a context folder.
3. In **Build Configuration**, set **Image Tags** (required).
4. Optional: expand **Advanced** for Dockerfile path, target stage, platforms, args, labels, cache, and runtime tuning.
5. Pick a provider.
6. Choose **Push** and/or **Load** (Depot applies its own limits).
7. Click **Build** and watch the live output.
8. Find finished builds in **Build History**. ## Advanced options by provider
Arcane validates advanced options against the selected provider so you don't send unsupported combinations.
**Local Docker supports:** Network, Isolation, SHM size, Ulimits, Extra hosts, single-platform builds.
Not supported: `cacheTo`, `entitlements`, `privileged`, multi-platform lists.
**Depot supports:** multi-platform builds, `cacheTo`, `entitlements`, `privileged`.
Not supported: Network, Isolation, SHM size, Ulimits, Extra hosts.
## Build history
The **Build History** tab tracks every build with status, provider, creation time, and duration. Open a row to see the full context, tags, Dockerfile/target, options, and output. Use **Rebuild** to load a previous configuration into the form as a starting point.
## Building from a project
On a project page, Arcane detects services with `build:` and shows build actions:
1. Open the project.
2. Click **Build** to build only.
3. Click **Build & Deploy** to build as part of deployment.
> [!NOTE]When you build with
**> Depot
**> or with
**> Push
**> enabled, each service should set an explicit
`> image:
`> name in Compose. Otherwise Arcane would generate local-only tags that aren't valid for pushed or remote workflows.