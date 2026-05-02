Upgrading Tracearr | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
Upgrading
Copy page
# Upgrading
Tracearr uses the `latest` Docker image tag by default, so upgrading is straightforward — pull the new image and recreate the container.
TimescaleDB and Redis are persisted in a volume, so your database and configuration will be preserved during the upgrade process.
## Docker Compose[](#docker-compose)
This guide assumes you followed the [Quick Start](/getting-started/installation#quick-start) instructions to set up Tracearr with Docker Compose.
From the directory containing your `docker-compose.pg18.yml` file, run:
```
`docker compose -f docker-compose.pg18.yml pull tracearr
docker compose -f docker-compose.pg18.yml up -d`
```
This will:
1. Download the latest Tracearr image
2. Recreate the container with the new image
3. Preserve your database and configuration
If you are using a different compose file, make sure to update the commands accordingly.
## Docker UI[](#docker-ui)
If you deployed Tracearr through a Docker UI like Portainer, Dockge, or TrueNAS’s built-in Custom App feature, look for an option to **re-pull images** or **redeploy** your stack. The exact label varies by tool — see the [Docker UI updating guide](/getting-started/installation/docker-ui#updating-tracearr) for details.
## Supervised[](#supervised)
From the directory containing your `docker-compose.supervised-example.yml` file, run:
```
`docker compose -f docker-compose.supervised-example.yml pull tracearr
docker compose -f docker-compose.supervised-example.yml up -d`
```
## Railway[](#railway)
Railway supports both automatic and manual updates. See the [Railway updating guide](/getting-started/installation/railway#updating-tracearr) for how to configure auto-updates or manually trigger an upgrade from the dashboard.
## Proxmox VE[](#proxmox-ve)
If you installed Tracearr using the [Proxmox VE community helper script ](https://community-scripts.github.io/ProxmoxVE/scripts?id=tracearr), you can update by logging into the Tracearr LXC container console and running:
```
`update`
```
This command is created automatically during installation. It pulls the latest version of the update script from the community-scripts repository, checks for a newer release, and applies the update.
You can also update all community-script containers at once from the Proxmox host shell using the [update-apps ](https://community-scripts.github.io/ProxmoxVE/scripts?id=update-apps) tool.
## Unraid[](#unraid)
In the Unraid web UI, go to the **Docker** tab, find Tracearr, and click **Check for Updates** or **Update**. Unraid will pull the latest image and recreate the container.
## Cleaning Up Old Images[](#cleaning-up-old-images)
After upgrading, you can remove unused images to free up disk space:
```
`docker image prune`
```
Make sure to review the images being removed before confirming, as this will delete all dangling images.
Last updated on March 15, 2026
[Debug Page](/configuration/debug)[FAQ](/faq)