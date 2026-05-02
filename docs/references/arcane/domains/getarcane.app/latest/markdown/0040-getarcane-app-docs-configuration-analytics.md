Analytics
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
The analytics heartbeat is a lightweight check-in used to understand *which servers are running* and *which build/version they are on*. It does **not** collect personal data, user data, or project data.
> [!NOTE]The heartbeat endpoint is commonly blocked by ad blockers or privacy tools. If you do not see check-ins, try disabling those tools or allowlisting
`> checkin.getarcane.app
`> .
>
> If you wish to send these analytics and are having an issue, try these steps:
>
* > Temporarily disable ad blockers or privacy extensions.
>
* > Allowlist
`> checkin.getarcane.app
`> (and your Arcane domain if you use a proxy).
>
* > Try a different network or DNS filter to rule out upstream blocking.
>
* > Check the Arcane logs for
`> analytics heartbeat
`> messages.
## What is sent
The heartbeat sends a small JSON payload with **only** the following fields:
`&#123;
"version": "unknown",
"instance\_id": "5bd274b3-7500-74b3-aa06-59308f0a0eb2",
"server\_type": "manager"
&#125;
`
Field meanings:
* `version`: The Arcane build version (e.g., `1.2.3`).
* `instance\_id`: A randomly generated UUID stored in settings. It is not tied to a user identity.
* `server\_type`: Either `manager` or `agent` based on the server's mode. ## What is *not* sent
* No user identifiers
* No IP addresses (beyond normal HTTP transport)
* No project metadata
* No secrets, tokens, or environment variables ## How to verify in logs
A successful heartbeat log looks like this:
`Jan 31 21:10:26.504 INF analytics heartbeat sent successfully jobName=analytics-heartbeat version=unknown instanceID=5bd274b3-7500-74b3-aa06-59308f0a0eb2 serverType=manager heartbeatURL=http://localhost:8080/heartbeat env=development
`
The **sent payload fields** are `version`, `instanceID`, and `serverType`. The other log fields (`jobName`, `heartbeatURL`, `env`) are local context only and are **not** part of the payload.
## Environments and endpoints
* **Production**: `https://checkin.getarcane.app/heartbeat` ## Opting out
Set `ANALYTICS\_DISABLED=true` to disable heartbeat sending entirely.