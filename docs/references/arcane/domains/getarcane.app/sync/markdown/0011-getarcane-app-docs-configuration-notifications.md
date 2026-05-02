Notifications
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
Arcane uses [Shoutrrr](https://github.com/nicholas-fedor/shoutrrr) for notifications. If Shoutrrr supports a provider, Arcane can usually support it too.
## Notification event types
Arcane can send notifications for these events:
* **Image Update Detected** — when Arcane finds a newer version of an image
* **Container Updated** — when a container has been updated or restarted successfully
* **System Prune Report** — when a scheduled prune finishes and Arcane sends a summary
* **Vulnerability Found (Fix Available)** — when a scan finds a vulnerability with a fixed version available
* **Auto-Heal Restart** — when Arcane automatically restarts an unhealthy container ## Supported providers
Arcane includes the most common Shoutrrr providers and can grow with them over time. Common options include Discord, email (SMTP), Slack, Telegram, Matrix, Gotify, Pushover, Ntfy, Microsoft Teams, and more.
You do **not** need a separate setup guide for every provider. In Arcane, you simply pick the provider you want, fill in the fields it asks for, and choose which events should trigger it.
## How setup works
1. Go to **Settings → Notifications** in the Arcane UI
2. Choose a provider
3. Fill in the settings for that provider
4. Pick the events you want to receive
5. Use the **Test** button to make sure everything works
The exact fields change depending on the provider you choose. For example, some providers use a webhook URL, while others use SMTP or a token.
## Event selection
You can turn events on or off for each provider separately. That makes it easy to:
* Send quick alerts to chat apps
* Send record-keeping updates by email
* Use different providers for different kinds of alerts ## Testing notifications
After setting up a provider, click the **Test** button in the Arcane UI.
If the test fails, check:
* that the provider details are correct
* that the destination service still exists and is reachable
* that Arcane logs do not show a more specific error ## Missing a provider?
If a provider is not listed in Arcane but **is supported by** [Shoutrrr](https://github.com/nicholas-fedor/shoutrrr), we can add it.