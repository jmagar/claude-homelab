Using Templates
Get Started
* [Installation](../docs/setup/installation)
* [Podman](../docs/setup/podman)
* [LXC Container Setup](../docs/guides/lxc-container)
* [Migrate to 1.0](../docs/setup/migrate-v1)
* [Next Builds](../docs/setup/next-images)
Security
* [Verify Artifacts](../docs/security/verify-artifacts)
* [Socket Proxy Setup](../docs/setup/socket-proxy)
Configuration
* [Environment Variables](../docs/configuration/environment)
* [Appearance](../docs/configuration/appearance)
* [Notifications](../docs/configuration/notifications)
* [OIDC Single Sign-On](../docs/configuration/sso)
* [Analytics](../docs/configuration/analytics)
Networking
* [HTTP Proxy](../docs/configuration/proxy)
* [Websocket Configuration](../docs/configuration/websockets-reverse-proxies)
* [TLS and HTTP/2](../docs/configuration/tls)
Features
* [Projects](../docs/features/projects)
* [Containers](../docs/features/containers)
* [Images](../docs/features/images)
* [Image Builds](../docs/features/image-builds)
* [Volumes](../docs/features/volumes)
* [Networks](../docs/features/networks)
* [Vulnerability Scans](../docs/features/vulnerability-scans)
* [Remote Environments](../docs/features/environments)
* [Auto Updates](../docs/guides/updates)
* [Custom Metadata](../docs/guides/custom-metadata)
* [Using Templates](../docs/templates)
* [Template Registries](../docs/templates/registries)
* [Docker Swarm](../docs/features/swarm)
Guides
* [Buildables](../docs/guides/buildables)
* [GPU Monitoring Setup](../docs/guides/gpu-setup)
CLI
* [Installation](../docs/cli/install)
* [Configuration](../docs/cli/config)
Development
* [Contributing to Arcane](../docs/dev/contribute)
* [Translating Arcane](../docs/dev/translate)
Community
* [Discord ](https://discord.gg/WyXYpdyV3Z)
# Using Templates
Templates help you quickly deploy common apps and services with Docker Compose. Arcane supports both templates stored on your machine and templates from online registries.
## Quick Start
1. Go to the Compose Projects page and click `Create a New Project`
2. Click the dropdown on the button in the top right and choose `Use Template`
3. Select the template you would like to use
> [!NOTE]Templates are grouped by where they came from, or shown in the
`> Local
`> category if they are stored on your machine.
1. Click `Use Now` to start using the template. ## Template Types
### Local Templates
* Stored on your system in `data/templates` (and copied into the database for faster access)
* Arcane watches that folder and updates the list if you change a template file. ### Remote Templates
* Downloaded from online registries
* Can be used right away or downloaded for offline use ## Using the Template Dialog
When you click **Choose Template**, you'll see:
* **Local Templates:** Ready to use immediately
* **Remote Templates:** two options for each:
* **Use Now:** load the template into your project right away
* **Download:** save the template locally for later use
* Templates with environment files show an **ENV** badge and include ready-made variables. ## Adding Local Templates
1. Open `data/templates` in your Arcane directory
2. Add your Docker Compose files (`.yaml` or `.yml`)
3. Optionally add matching `.env` files for environment variables
4. Templates appear automatically in the template dialog ### Example Structure
`data/templates
├── wordpress/compose.yaml
├── wordpress/.env.example
`
## Community Registry
Don't want to create your own? Use our community registry with ready-made templates:
**Registry URL:** `https://registry.getarcane.app/registry.json`
Add this in **Settings → Templates → Add Registry** to get started instantly with popular applications.