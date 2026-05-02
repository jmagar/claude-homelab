Docker Swarm
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
The **Swarm** workspace manages Docker Swarm for the currently selected environment — cluster lifecycle, application deployments, node management, and Swarm-native configs and secrets.
> [!NOTE]If you're connecting Arcane to another Docker host for the first time, set that up via
[> Remote Environments
](/docs/features/environments)> first. Swarm features in Arcane are environment-specific: every action applies to whichever environment is selected.
## Where the data comes from
Arcane reads cluster data directly from the Swarm manager:
* Nodes, services, tasks, configs, and secrets come from Docker's Swarm APIs.
* Stacks are reconstructed from the current services, grouped by the `com.docker.stack.namespace` label.
That means the Stacks list is **live** — not built from a database, and not reconstructed from saved Compose files. A stack created outside Arcane shows up as long as the manager can see its services.
For node-level coverage, Arcane also supports per-node agents. They handle node identity verification and per-node operations; they don't merge every node's local resources into one cluster-wide inventory.
## Permissions and modes
* The selected environment must be running Docker in Swarm mode.
* Full cluster management is for **Swarm manager** environments. On a worker, you'll see read-only views.
* Administrative actions (create, update, scale, delete, rotate tokens, unlock the cluster) require admin access in Arcane. ## What's in the workspace
|Page|What it covers|
|[Cluster](/docs/features/swarm-cluster)|Initialize a Swarm, join, leave, unlock, rotate join tokens, update cluster spec.|
|[Workloads](/docs/features/swarm-workloads)|Stacks, services, tasks, scaling, rollbacks, logs.|
|[Nodes & Agents](/docs/features/swarm-nodes-agents)|Node operations, agent coverage, deployment flow, troubleshooting.|
|[Configs & Secrets](/docs/features/swarm-configs-secrets)|Create and delete configs vs. secrets, and when to use each.|
## Suggested workflow
1. Pick the environment.
2. Open **Swarm → Cluster** and confirm the environment is in the expected Swarm.
3. Check **Nodes** — managers, workers, and availability.
4. Deploy Arcane node agents to the nodes you want covered.
5. Create the **Configs** and **Secrets** your app needs.
6. Deploy from **Stacks**.
7. Use **Services** and **Tasks** to inspect rollout health and logs.
8. Scale, roll back, redeploy, or remove as needed. ## Troubleshooting
**The Swarm section doesn't appear.** The selected environment isn't in Swarm mode. Arcane only shows the workspace when the environment reports an active Swarm state.
**A node agent stays in `pending`.** Arcane generated the deploy command but the agent hasn't connected. Check that:
* the command was run on the intended node
* the manager URL is reachable from that node
* the token is still current
**A node agent shows `mismatched`.** An agent connected, but the reported node identity doesn't match the row you deployed it for. Regenerate the API key and redeploy on the right node.
**Services or stacks visible, but per-node coverage is incomplete.** Expected if some nodes don't have Arcane agents connected. Cluster-level resources come from the Swarm manager; per-node coverage is tracked separately.