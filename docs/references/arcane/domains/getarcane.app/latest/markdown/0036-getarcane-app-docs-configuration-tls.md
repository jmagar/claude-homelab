TLS and HTTP/2
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
This guide explains how to run Arcane securely over HTTPS, either behind a reverse proxy or by letting Arcane handle TLS directly.
> [!NOTE]If you use a reverse proxy, make sure WebSockets are configured correctly. See the
[> WebSocket Configuration
](/docs/configuration/websockets-reverse-proxies)> guide.
## Overview
Arcane supports two common HTTPS setups:
1. **Reverse proxy (recommended)** — Nginx, Caddy, Traefik, or a load balancer handles HTTPS in front of Arcane
2. **Direct TLS in Arcane** — Arcane serves HTTPS and HTTP/2 using your certificate files ## Before you start
If you plan to use direct TLS in Arcane, you will need:
* access to your Arcane `.env` file or container environment settings
* a domain name such as `arcane.example.com`
* a valid TLS certificate file
* a matching private key file
If your reverse proxy already provides HTTPS, you usually do **not** need to configure certificate files in Arcane itself.
## Option A: HTTPS handled by a reverse proxy
Use this when Arcane sits behind Nginx, Caddy, Traefik, or a cloud proxy.
### Recommended settings
Copy
Copy
Optional:
Copy
### What this gives you
* HTTPS for end users
* simpler Arcane configuration
* easier certificate management
* the most common deployment model ## Option B: Direct Arcane HTTPS + HTTP/2
Use this when Arcane itself should terminate TLS.
### 1) Configure environment values
Set the following values in your `.env` file or container environment:
Copy
Copy
Copy
Copy
Optional network settings:
Copy
Copy
Notes:
* `PORT` can be changed if needed
* leave `LISTEN` empty to bind on all interfaces ### 2) Restart Arcane
After saving the configuration, restart Arcane so the new TLS settings are applied.
### 3) Confirm it is working
Open your Arcane URL in a browser:
* the site should load over `https://`
* your browser should show a valid secure connection ## Important notes
* If `TLS\_ENABLED=true`, Arcane requires **both** of these files:
* `TLS\_CERT\_FILE`
* `TLS\_KEY\_FILE`
* If either file is missing or invalid, Arcane will not start correctly
* **h2c** (unencrypted HTTP/2) is meant for internal or non-public use
* For public access, use HTTPS
* Arcane uses port `3552` by default unless you change `PORT` ## Which option should I use?
For most users, choose **Option A** and terminate HTTPS at a reverse proxy.
Choose **Option B** only when Arcane itself must serve TLS directly.