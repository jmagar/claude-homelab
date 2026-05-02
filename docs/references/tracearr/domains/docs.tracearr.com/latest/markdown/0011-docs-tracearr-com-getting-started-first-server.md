Connect a Server - Plex, Jellyfin & Emby Setup | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Getting Started](/getting-started)Connect a Server
Copy page
# Connect a Server
After installing Tracearr, you’ll connect your first media server during the initial setup.
## Initial Setup[](#initial-setup)
When you first access Tracearr, you’ll be prompted to sign in or create an account.
### Plex (Recommended)[](#plex-recommended)
1. Click **Sign in with Plex**
2. A popup opens — sign in with your Plex account
3. Tracearr discovers your Plex servers automatically
4. Select the server you want to monitor
5. You’re done — Tracearr begins tracking sessions
Plex servers must be owned by (or shared with admin access to) the Plex account you sign in with.
### Jellyfin[](#jellyfin)
1. Click **Create Account** and set up a local Tracearr account
2. After account creation, go to **Settings** → **Servers**
3. Click **Add Server** and select **Jellyfin**
4. Enter your server details:
* **Server URL** — e.g., `http://192.168.1.100:8096`
* **Server Name** — A friendly name for the server
* **API Key** — From Jellyfin Dashboard → API Keys
* Click **Connect**
### Emby[](#emby)
1. Click **Create Account** and set up a local Tracearr account
2. After account creation, go to **Settings** → **Servers**
3. Click **Add Server** and select **Emby**
4. Enter your server details:
* **Server URL** — e.g., `http://192.168.1.100:8096`
* **Server Name** — A friendly name for the server
* **API Key** — From Emby Server → API Keys
* Click **Connect**
## Adding More Servers[](#adding-more-servers)
You can monitor multiple servers from a single Tracearr instance. Go to **Settings** → **Servers** to add more.
### Adding Plex Servers[](#adding-plex-servers)
Plex servers are tied to Plex accounts. To add servers from a different Plex account:
1. Go to **Settings** → **Servers**
2. Scroll to **Linked Plex Accounts**
3. Click **Link Account** and sign in with the additional Plex account
4. Return to **Add Server** → **Plex** and select from the newly linked account’s servers
### Adding Jellyfin/Emby Servers[](#adding-jellyfinemby-servers)
Click **Add Server**, select the server type, and enter the URL and API key. You’ll need administrator access to generate an API key.
## Getting API Keys[](#getting-api-keys)
### Jellyfin[](#jellyfin-1)
1. Open Jellyfin and go to **Dashboard** → **API Keys**
2. Click the **+** button to create a new key
3. Give it a name (e.g., “Tracearr”)
4. Copy the generated key
### Emby[](#emby-1)
1. Open Emby and go to **Dashboard** → **API Keys**
2. Click **New API Key**
3. Give it a name (e.g., “Tracearr”)
4. Copy the generated key
## Next Steps[](#next-steps)
Once connected, Tracearr will begin tracking sessions and collecting analytics. Check out the [Configuration](/configuration) guide to customize alerts, sharing detection rules, and more.
Last updated on March 15, 2026
[Railway (Cloud)](/getting-started/installation/railway)[Import Data](/getting-started/import)