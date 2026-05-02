Next Builds
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
> [!CAUTION]These builds are intended for users who like to have a "rolling release" or that are interested in testing new features early. They may contain bugs, incomplete features, or breaking changes.
**> Do not use these builds in production environments.
**
## Overview
Arcane provides "next" builds that contain the latest features and improvements currently under development. These builds are automatically generated from the `main` branch and are available as Docker images.
## Docker Images
Each Image has 3 variants, `next`, `next-static`, and `next-distroless`.
Both the `next` (based on alpine) and the `next-distroless` (based on distroless-static) are built with static binaries. These builds may not contain the required functionality for some external monitoring tools like GPU's etc.
The normal `next` tag is the fully complete build of Arcane and the Agent, all features should be available.
### Arcane Manager (Next)
The main Arcane container image.
Copy
Copy
Copy
### Arcane Agent (Next)
The agent used for remote environment management.
Copy
Copy
Copy
> [!TIP]Each image also has a -shahash variant if you prefer to pin to a specific version of these prerelease builds.
## How to Use
To use the next builds, update your `compose.yaml` file to use the `:next`, `:next-static`, or `:next-distroless` tag instead of `:latest` or your current tag.
### Example Compose File
`services:
arcane:
image: ghcr.io/getarcaneapp/arcane:next
container\_name: arcane
ports:
- '3552:3552'
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- arcane-data:/app/data
environment:
- APP\_URL=http://localhost:3552
- ENCRYPTION\_KEY=your-encryption-key
- JWT\_SECRET=your-jwt-secret
restart: unless-stopped
volumes:
arcane-data:
`
## What's Included?
The `:next`, `:next-static`, and `:next-distroless` builds typically include:
* **Experimental Features**: New functionality that is still being refined.
* **Bug Fixes**: Early access to fixes before they are officially released.
* **Performance Improvements**: Optimizations that are being tested for stability. ## Binary Downloads
Direct binary downloads from the latest next builds.
Next Binaries
ArcaneCLI
## Feedback
If you encounter any issues while using the beta builds, please report them on our [GitHub Issues](https://github.com/getarcaneapp/arcane/issues) page. Your feedback helps us make Arcane better for everyone!