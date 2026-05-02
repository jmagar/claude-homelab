Swarm Workloads
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
The Swarm workspace has two views for deploying workloads — **Stacks** for whole applications and **Services** for direct service-level control — plus **Tasks** to see what Swarm is actually scheduling.
## When to use which
* **Stacks** — normal application deployment, grouped service management. Recommended.
* **Services** — direct control over a single Swarm service. For advanced users comfortable with raw specs.
* **Tasks** — runtime placement and state visibility, mostly for troubleshooting. ## Stacks
A stack groups related services together as one application-level deployment. Arcane supports:
* deploying a stack from Compose content
* supplying `.env` content for variable substitution
* editing and redeploying an existing stack
* removing a stack
* viewing the services and tasks that belong to a stack
* starting from a saved template
* converting a `docker run` command to Compose ### How Arcane finds stacks
The **Stacks** page answers a single question: **what stacks does the Swarm manager see right now?**
To do that, Arcane fetches the current Swarm services and groups them by the `com.docker.stack.namespace` label. The list is live — not from a database, not reconstructed from saved Compose files. A stack deployed outside Arcane shows up as soon as the manager can see its services.
### Deploy a stack
1. Open **Swarm → Stacks**.
2. Click **Create Stack**.
3. Enter a stack name.
4. Paste your Compose content.
5. Optional: add `.env` content for variables referenced by the Compose file.
6. Click **Create Stack**.
Useful shortcuts in the stack editor:
* **Use Template** — load a saved Arcane template. See [Templates](/docs/templates).
* **Convert from Docker Run** — paste a `docker run` and let Arcane generate Compose and env content as a starting point. For standalone prep, use the [Compose Generator](/generator).
* **Save as Template** — save the editor content as a reusable template. ### Update or remove a stack
Open the stack from **Swarm → Stacks**, click **Edit**, change the Compose or `.env`, and redeploy. To remove, use the stack detail page or row action and confirm.
### View Source vs. the live stack list
These answer different questions:
* **Stacks** page → what Docker Swarm reports right now.
* **View Source** → the Compose and `.env` files Arcane saved on disk during deploy.
Arcane writes saved sources under the Swarm stack sources directory, by default:
Copy
Files are organized by environment ID and stack name. For example, environment `env\_123` and stack `whoami`:
`/app/data/swarm/sources/env\_123/whoami/compose.yaml
/app/data/swarm/sources/env\_123/whoami/.env
`
The `.env` is optional. A stack deployed outside Arcane appears in the live list but won't have a saved source until Arcane deploys it.
## Services
Use the Services view when you want to work with individual Swarm services instead of full stacks. Arcane supports:
* creating a service
* inspecting service details
* updating the raw service spec
* scaling replicated services
* rolling back to the previous version
* streaming service logs
* inspecting service tasks
* removing a service ### Create a service
1. Open **Swarm → Services**.
2. Click **Create Service**.
3. Fill in the service definition.
4. Submit.
Arcane sends the resulting Swarm service spec straight to the selected environment.
### Inspect, scale, roll back
The service detail page shows overview data, live logs, tasks, environment and label config, ports and networks, virtual IPs, and storage where present.
* **Scale** — for replicated services, enter a replica count and click **Scale**. Global services don't take replica counts.
* **Rollback** — server-side rollback to the previous service version, useful after a failed rollout or bad image update. ## Tasks
The **Tasks** view shows what Swarm is actually scheduling. Use it to:
* confirm where a service is running
* inspect task state and placement
* troubleshoot failed or restarting tasks
* filter by node, service, or stack
Opening **Tasks** from the Nodes page scopes the view to a single node.