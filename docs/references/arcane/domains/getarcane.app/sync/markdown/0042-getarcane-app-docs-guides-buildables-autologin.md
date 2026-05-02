Autologin
Get Started
* [Installation](../../../docs/setup/installation)
* [Podman](../../../docs/setup/podman)
* [LXC Container Setup](../../../docs/guides/lxc-container)
* [Migrate to 1.0](../../../docs/setup/migrate-v1)
* [Next Builds](../../../docs/setup/next-images)
Security
* [Verify Artifacts](../../../docs/security/verify-artifacts)
* [Socket Proxy Setup](../../../docs/setup/socket-proxy)
Configuration
* [Environment Variables](../../../docs/configuration/environment)
* [Appearance](../../../docs/configuration/appearance)
* [Notifications](../../../docs/configuration/notifications)
* [OIDC Single Sign-On](../../../docs/configuration/sso)
* [Analytics](../../../docs/configuration/analytics)
Networking
* [HTTP Proxy](../../../docs/configuration/proxy)
* [Websocket Configuration](../../../docs/configuration/websockets-reverse-proxies)
* [TLS and HTTP/2](../../../docs/configuration/tls)
Features
* [Projects](../../../docs/features/projects)
* [Containers](../../../docs/features/containers)
* [Images](../../../docs/features/images)
* [Image Builds](../../../docs/features/image-builds)
* [Volumes](../../../docs/features/volumes)
* [Networks](../../../docs/features/networks)
* [Vulnerability Scans](../../../docs/features/vulnerability-scans)
* [Remote Environments](../../../docs/features/environments)
* [Auto Updates](../../../docs/guides/updates)
* [Custom Metadata](../../../docs/guides/custom-metadata)
* [Using Templates](../../../docs/templates)
* [Template Registries](../../../docs/templates/registries)
* [Docker Swarm](../../../docs/features/swarm)
Guides
* [Buildables](../../../docs/guides/buildables)
* [GPU Monitoring Setup](../../../docs/guides/gpu-setup)
CLI
* [Installation](../../../docs/cli/install)
* [Configuration](../../../docs/cli/config)
Development
* [Contributing to Arcane](../../../docs/dev/contribute)
* [Translating Arcane](../../../docs/dev/translate)
Community
* [Discord ](https://discord.gg/WyXYpdyV3Z)
The **autologin** buildable allows Arcane to automatically sign in using credentials you provide at runtime. This is useful for local development, CI, or demo environments where you want to skip the login screen.
> [!CAUTION]Autologin is intended for controlled environments only.
**> Do not use this in production
**> or any public-facing deployment.
## Requirements
* Build with the `buildables` tag.
* Enable the `autologin` feature in `buildables.EnabledFeatures`.
* Provide credentials at runtime via environment variables.
If you haven't enabled buildables yet, see the main [Buildables guide](/docs/guides/buildables).
## Runtime configuration
Set the following environment variables at runtime:
Copy
Copy
## Behavior
When enabled, Arcane will attempt to authenticate using the provided credentials during startup and skip the login screen when successful.