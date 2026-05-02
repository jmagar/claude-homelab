Getting Started with Tracearr | Tracearr Docs[Skip to Content](#nextra-skip-nav)
CTRL K
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
Getting StartedOverview
Copy page
# Getting Started
This guide will help you install Tracearr and connect your first media server.
## Requirements[](#requirements)
* A running **Plex**, **Jellyfin**, or **Emby** media server
* API access to your media server (API key or token)
* **Docker** installed (for self-hosted deployments)
## Choose Your Install Method[](#choose-your-install-method)
|Method|Best for|
|[Docker Compose](/getting-started/installation)|Terminal users running `docker compose` on the command line|
|[Docker UI](/getting-started/installation/docker-ui)|Portainer, Dockge, or similar web-based Docker management tools|
|[Supervised](/getting-started/installation/supervised)|Unraid and other bare-metal hosts where separate containers aren’t practical|
|[Kubernetes](/getting-started/installation/kubernetes)|Helm-based deployments on any Kubernetes cluster|
|[Railway](/getting-started/installation/railway)|Cloud hosting with no server to manage|
Not sure? **Docker Compose** is the recommended default. If you manage Docker through a browser, pick **Docker UI**. If you’re on Unraid, check the **Community Apps** tab first — Tracearr is available there as a one-click install.
## Community Integrations[](#community-integrations)
Tracearr is also available on these platforms through community-maintained scripts and catalogs:
* **[Unraid Community Apps ](https://unraid.net/community/apps)** — Search for “Tracearr” in the Apps tab
* **[Proxmox VE ](https://community-scripts.github.io/ProxmoxVE/scripts?id=tracearr)** — Community helper script for LXC containers
The Tracearr listing in the TrueNAS app catalog is not maintained by the Tracearr developer. The catalog maintainers have modified dependencies and configuration without understanding Tracearr’s architecture, which has caused issues for users. We do not recommend installing Tracearr through the TrueNAS app catalog.
TrueNAS SCALE (24.10+) supports Docker Compose natively. You can deploy Tracearr using the [Docker UI](/getting-started/installation/docker-ui) guide — either through TrueNAS’s built-in Custom App feature or by installing Portainer or Dockge from the TrueNAS app catalog.
## After Installation[](#after-installation)
1. [Connect your first media server](/getting-started/first-server)
2. [Import data from Tautulli or Jellystat](/getting-started/import) (optional)
Last updated on March 15, 2026
[Introduction](/)[Docker Compose](/getting-started/installation)