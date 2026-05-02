Swarm Cluster
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
The **Cluster** page covers the Swarm lifecycle and security settings for the selected environment — initialize, join, leave, unlock, rotate join tokens, and update the live Swarm spec.
## Initialize a Swarm
Use this when the selected environment isn't part of a Swarm yet.
1. Open **Swarm → Cluster**.
2. Click **Initialize**.
3. Optional: set advanced init fields:
Copy
4. Optional: provide an advanced Swarm spec (JSON).
5. Confirm.
After initialization, Arcane refreshes cluster state and exposes the rest of the Swarm workspace for that environment.
## Join an existing Swarm
Use this when the environment should join an existing cluster as a manager or worker.
1. Open **Swarm → Cluster**.
2. Click **Join**.
3. Enter manager addresses, the join token, and any optional listen/advertise addresses.
4. Confirm. ## Leave a cluster
Click **Leave** when a node should no longer be part of the Swarm. You can force the leave when needed. Arcane refreshes environment state after the operation completes.
## Unlock a locked cluster
If manager autolock is enabled and the cluster is locked after a restart:
1. Open **Swarm → Cluster**.
2. Enter the unlock key.
3. Click **Unlock**. ## Manage join tokens and the unlock key
The Cluster page shows and lets you rotate:
* the **worker join token**
* the **manager join token**
* the **manager unlock key**
Treat these like credentials. Rotating a token invalidates the previous value.
## Update the cluster spec
The Cluster page can update the live Swarm spec through the UI. This is for advanced operators who understand the Docker Swarm settings being changed.
## Notes
* Swarm actions apply to the currently selected environment.
* Full cluster management requires a **Swarm manager** environment.
* Administrative actions require admin access in Arcane.