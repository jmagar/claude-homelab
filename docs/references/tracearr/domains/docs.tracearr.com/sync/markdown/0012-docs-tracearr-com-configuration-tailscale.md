Tailscale VPN | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Configuration](/configuration)Tailscale VPN
Copy page
# Tailscale VPN
Tracearr includes a built-in Tailscale integration that places your instance directly on your tailnet. This allows you to securely access Tracearr from any device on your Tailscale network — without exposing it to the public internet or setting up port forwarding and reverse proxy rules.
## How It Works[](#how-it-works)
Tracearr runs Tailscale in **userspace networking mode**. Instead of installing Tailscale as a system service with kernel-level networking (which requires elevated privileges), Tracearr manages the `tailscaled` daemon as a child process with all networking handled in userspace.
This means:
* **No `NET\_ADMIN` capability required** — the container runs unprivileged
* **No TUN device needed** — no kernel module dependencies
* **Works anywhere** — any container runtime, cloud platform, or hosting environment
The tradeoff is that this approach has limitations compared to a full Tailscale installation. See [Limitations](#limitations) below.
## Setup[](#setup)
### Prerequisites[](#prerequisites)
* A [Tailscale account ](https://tailscale.com)
* The Tailscale binary must be present in the container image (included in official Tracearr images)
### Enabling Tailscale[](#enabling-tailscale)
### Open Settings
Navigate to **Settings** → **Tailscale** in the Tracearr web interface.
### Set a Hostname
Enter a **hostname** for this device on your tailnet (alphanumeric characters and hyphens only).
### Enable
Click **Enable Tailscale**. The status will change to **Waiting for authorization**.
### Authorize
Click the **Authorize in Tailscale** button to open the Tailscale consent page in your browser. Approve the device and Tracearr will connect to your tailnet automatically.
After the initial authentication, Tracearr persists your Tailscale session state in the database. This means your connection will survive container restarts without needing to re-authenticate — as long as the session hasn’t expired in your Tailscale admin console.
## Architecture[](#architecture)
Understanding the architecture helps explain both the capabilities and limitations of this integration.
### Userspace Networking[](#userspace-networking)
A traditional Tailscale installation creates a TUN device in the kernel and routes traffic at the OS level. This requires `NET\_ADMIN` capability in Docker — a privileged operation that many hosting platforms don’t allow and that increases the security surface of your container.
Tracearr instead uses Tailscale’s **userspace networking** (`--tun=userspace-networking`). In this mode, `tailscaled` handles all networking within the process itself rather than through a kernel device. Tracearr then communicates with the daemon over a local socket.
### Process Management[](#process-management)
Tracearr manages two Tailscale processes:
* **`tailscaled`** — the daemon that maintains the VPN connection
* **`tailscale`** CLI — used for authentication, status checks, and configuration changes
The daemon is monitored with a health check every 30 seconds. If it crashes or becomes unresponsive, Tracearr will automatically attempt to restart it with exponential backoff (up to 5 retries).
### State Persistence[](#state-persistence)
Tailscale’s connection state (machine identity, session keys, etc.) is stored in a temporary directory. Since container filesystems are ephemeral, Tracearr watches this state file and automatically syncs it to the database. On startup, the persisted state is restored — allowing the connection to resume without re-authentication.
If you **reset** Tailscale from the settings page, all persisted state is wiped. You will need to re-authenticate the device, and the old device entry may remain in your Tailscale admin console until you manually remove it.
## Limitations[](#limitations)
Because Tracearr runs Tailscale in userspace mode, there are meaningful differences compared to a full system-level Tailscale installation:
|Capability|Full Install|Tracearr (Userspace)|
|Join a tailnet (incoming connections)|Yes|Yes|
|Outbound connections to tailnet peers|Yes|**No**[1](#outbound-connections)|
|Use exit nodes|Yes|**No**|
|Act as an exit node|Yes|**No**|
|Act as a subnet router|Yes|**No**|
|Kernel-level performance|Yes|**No**|
|Requires NET\_ADMIN|Yes|**No**|
|Requires TUN device|Yes|**No**|
### What You Can Do[](#what-you-can-do)
* **Accept incoming connections** — other devices on your tailnet can reach the Tracearr instance by its Tailscale IP
* **Persist connections across restarts** without re-authenticating
### What You Cannot Do[](#what-you-cannot-do)
* **Make outbound connections over the tailnet** — Userspace networking only supports incoming connections. Tracearr cannot use its Tailscale interface to reach other devices on your tailnet. Tailscale’s userspace mode does provide a SOCKS5 proxy that could enable outbound connections, but this is not currently implemented in Tracearr. 1
* **Use exit nodes** — Routing outbound traffic through an exit node requires kernel-level networking that userspace mode does not have.
* **Act as a subnet router** — Tracearr cannot advertise local routes to your tailnet. Userspace networking doesn’t have the kernel-level access needed to forward packets between networks.
* **Act as an exit node** — For the same reason, Tracearr cannot serve as an exit node for other devices on your tailnet.
* **Match kernel-level throughput** — All network traffic passes through the userspace daemon rather than the kernel’s networking stack. For typical web UI and API traffic this is not noticeable.
### Why Userspace Mode?[](#why-userspace-mode)
The decision to use userspace networking was intentional:
1. **Portability** — Works on any platform without requiring privileged containers. Docker, Podman, Kubernetes, Railway, Fly.io — it all just works.
2. **Security** — `NET\_ADMIN` grants broad control over the container’s networking stack. Avoiding it reduces the blast radius if the container is compromised.
3. **Simplicity** — No host configuration or special Docker flags needed. Enable it from the UI and you’re done.
For Tracearr’s use case — serving a web UI and API to devices on your tailnet — userspace networking is more than sufficient.
Last updated on March 15, 2026
[Rules](/configuration/rules)[Backup & Restore](/configuration/backup)