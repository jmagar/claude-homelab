Remote Environments
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
A **Remote Environment** is a Docker host outside the Arcane Manager that you want to manage from the same UI. You create the environment in Arcane, copy the generated agent settings, and run the **Arcane Agent** on the remote host. The Agent needs Docker access — typically via `/var/run/docker.sock`.
Remote environments page in Arcane. ## Connection mode
Pick one when you create the environment:
* **Direct** — the Manager connects to the Agent on TCP `3553`. Requires the Agent host to accept that inbound port.
* **Edge** — the Agent connects outbound to the Manager. No inbound port required on the remote host. Use this when the remote is behind NAT or a firewall. ## Transport mode
Connection mode is *who connects to whom*. Transport mode is *how the live channel behaves*:
* **`EDGE\_TRANSPORT=auto`** — keep a continuous tunnel open. Arcane uses gRPC where possible and falls back to WebSocket.
* **`EDGE\_TRANSPORT=poll`** — check in periodically instead of holding a tunnel open. The first action on an idle environment can take a moment while the connection wakes up.
Generated agent snippets default to `EDGE\_TRANSPORT=poll`.
## Status meanings
In poll mode, you'll see:
* **Online** — a tunnel is active right now.
* **Standby** — the Agent is checking in successfully and waiting for demand. This is healthy.
* **Pending** — the environment is created but not paired or fully connected yet.
* **Offline / Error** — the Manager can't currently use this environment. ## Requirements
* Arcane Manager running and reachable from the Agent host.
* Docker installed on the Agent host with permission to mount `/var/run/docker.sock`.
* The environment must be created in Arcane *before* you start the Agent.
* For **Direct** mode: the Manager must reach the Agent on port `3553`.
* For **Edge** mode: the Agent must reach the Manager from inside its network. ## Add a Direct environment
1. Open **Environments → Add Environment**.
2. Enter a name.
3. Enter the Agent API URL — for example `http://my-agent:3553` or `https://10.1.1.5:3553`.
4. Create the environment.
5. Copy the generated `docker run` or Docker Compose snippet.
6. Run it on the remote host.
Example Compose:
`services:
arcane-agent:
image: ghcr.io/getarcaneapp/arcane-headless:latest
container\_name: arcane-agent
ports:
- '3553:3553'
environment:
- AGENT\_MODE=true
- EDGE\_TRANSPORT=poll
- AGENT\_TOKEN=arc\_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
- MANAGER\_API\_URL=http://10.1.1.4:3552
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- agent-data:/app/data
restart: unless-stopped
volumes:
agent-data: &#123;&#125;
`
Start it:
`docker compose up -d
`
## Add an Edge environment
1. Open **Environments → Add Environment**.
2. Switch to the **Edge** tab.
3. Enter a name and click **Generate Agent Configuration**.
4. Copy the generated snippet and run it on the remote host.
Example Compose:
`services:
arcane-edge-agent:
image: ghcr.io/getarcaneapp/arcane-headless:latest
container\_name: arcane-edge-agent
environment:
- EDGE\_AGENT=true
- EDGE\_TRANSPORT=poll
- AGENT\_TOKEN=arc\_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
- MANAGER\_API\_URL=http://10.1.1.4:3552
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- agent-data:/app/data
restart: unless-stopped
volumes:
agent-data: &#123;&#125;
`
## Update an environment
1. Open **Environments**.
2. Select the environment.
3. Change the settings you need.
4. Save. ## Standalone binary
You can run the Agent as a binary instead of a container.
1. Download the latest release for your platform.
2. Place the binary on the target host.
3. Create a `.env` file.
> [!NOTE]
`> GIN_MODE=release
`> is required when running the binary — it's not injected automatically the way it is in the container image.
Direct Agent `.env` example:
`GIN\_MODE=release
AGENT\_MODE=true
EDGE\_TRANSPORT=poll
AGENT\_TOKEN=arc\_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
MANAGER\_API\_URL=http://10.1.1.4:3552
ENVIRONMENT=production
PORT=3553
LISTEN=127.0.0.1
`
Edge Agent `.env` example:
`GIN\_MODE=release
EDGE\_AGENT=true
EDGE\_TRANSPORT=poll
AGENT\_TOKEN=arc\_XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
MANAGER\_API\_URL=http://10.1.1.4:3552
ENVIRONMENT=production
`
`LISTEN` controls which interface the Agent binds to. Leave it empty to bind all interfaces.
Start the Agent:
Copy
Or pass everything inline:
Copy