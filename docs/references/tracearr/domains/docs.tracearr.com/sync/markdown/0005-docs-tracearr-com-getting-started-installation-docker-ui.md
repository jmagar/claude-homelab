Deploy with a Docker UI | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Getting Started](/getting-started)[Installation](/getting-started/installation)Docker UI
Copy page
# Docker UI
If you manage Docker through a web interface, you can deploy Tracearr by creating a stack — no terminal required. The steps below apply to any tool that supports deploying Docker Compose files, including:
* **[Portainer ](https://www.portainer.io/)**
* **[Dockge ](https://github.com/louislam/dockge)**
* **Dockhand**
* **Komodo**
* **Arcane**
The exact UI labels vary between tools, but the workflow is the same.
## Deploy a Stack[](#deploy-a-stack)
### Create a new stack
Look for a **Stacks**, **Projects**, or **Compose** section in your tool’s sidebar. Click the button to create a new one (usually **Add stack** or **Create**).
Give it a name like `tracearr` — lowercase, no spaces.
### Paste the compose file
Open the [docker-compose.pg18.yml ](https://github.com/connorgallopo/Tracearr/blob/main/docker/examples/docker-compose.pg18.yml) file on GitHub, copy its contents, and paste them into your tool’s compose editor.
### Add your environment variables
Most tools have an environment variables section below the compose editor — or a separate `.env` editor. Add the following:
|Name|Value|
|`JWT\_SECRET`|A 64-character hex string|
|`COOKIE\_SECRET`|A different 64-character hex string|
You’ll need to generate these values first. See [Generating Secrets](/getting-started/installation#generating-secrets-without-the-cli) for how — the online generator is the easiest option if you don’t have a terminal.
You can also add optional variables like `TZ` (e.g. `America/New\_York`), `PORT`, `LOG\_LEVEL`, or `DB\_PASSWORD`.
### Deploy
Click **Deploy**, **Start**, or the equivalent button. Your tool will pull the images and start all three services (Tracearr, TimescaleDB, and Redis).
### Access Tracearr
Once the stack is running, open `http://your-server-ip:3000` in your browser to reach the setup wizard.
## Updating Tracearr[](#updating-tracearr)
To pull a newer version, go to your stack’s editor and look for an option to **re-pull images** or **redeploy**. In Portainer this is the **Re-pull image** toggle on the Editor tab. In Dockge, click **Update**. The exact label varies, but the concept is the same — pull the latest image and recreate the containers. Your volumes and configuration are preserved.
## Things to Know[](#things-to-know)
Most Docker UIs do **not** auto-load `.env` files the way the `docker compose` CLI does. If your compose file references `${VARIABLE}` placeholders, you need to define those variables in your tool’s UI — either through the env vars editor or by uploading a `.env` file. If the variables aren’t defined, they’ll be empty and Tracearr won’t start properly.
Some tools prefix container names with the stack name (e.g. `tracearr-redis-1`). The compose file includes explicit `container\_name` values to override this, so the names should match what you see in the rest of this documentation.
## Next Steps[](#next-steps)
Once Tracearr is running, [connect your first media server](/getting-started/first-server).
Last updated on March 15, 2026
[Docker Compose](/getting-started/installation)[Supervised](/getting-started/installation/supervised)