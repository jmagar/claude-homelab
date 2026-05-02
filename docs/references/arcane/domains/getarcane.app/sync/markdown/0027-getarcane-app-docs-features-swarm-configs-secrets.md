Swarm Configs and Secrets
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
* [Cluster](../../docs/features/swarm-cluster)
* [Workloads](../../docs/features/swarm-workloads)
* [Nodes & Agents](../../docs/features/swarm-nodes-agents)
* [Configs & Secrets](../../docs/features/swarm-configs-secrets)
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
Swarm **configs** and **secrets** let you ship runtime data to services and stacks without baking it into your images. Both are versioned: treat them as inputs to a workload, not as mutable live files.
## Configs vs. secrets
|Use a **config** for|Use a **secret** for|
|application config files|API tokens|
|feature flags|passwords|
|non-sensitive env defaults|private keys|
||registry credentials|
If a value is sensitive, use a secret. Otherwise a config is fine.
## Create a config
1. Open **Swarm → Configs**.
2. Enter a name.
3. Enter the config content.
4. Click **Create Config**.
Delete configs from the same page when they're no longer used.
## Create a secret
1. Open **Swarm → Secrets**.
2. Enter a name.
3. Enter the secret value.
4. Click **Create Secret**.
Delete secrets from the same page when they're no longer used.
## Operational notes
* Configs and secrets are versioned. To change one, create a replacement and update the workload that consumes it — don't mutate the existing object.
* Join tokens and the manager unlock key are **not** Swarm secrets. They're cluster-level credentials, managed on the Cluster page.