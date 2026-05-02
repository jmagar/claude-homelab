Migrate to 1.0
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
### Before you start
* Start with a fresh database. Databases from before 1.0 cannot be upgraded in place, so you will need to set up your settings, users, and templates again.
* See the new [Configuration](/docs/configuration/environment) page to make sure the right environment variables are set. #### Overview of the major breaking changes:
* Arcane now uses port `3552` by default instead of `3000`.
* OIDC setup now finds its settings automatically from `.well-known/openid-configuration`; see [SSO setup](/docs/configuration/sso).
* Agents have been replaced with remote environments.
* Image Maturity has been removed and replaced with a simpler “update available” indicator on the Images page.
* Compose Projects (Stacks) no longer need to be imported. Arcane reads from the mounted projects folder directly. The database still stores some information, but the projects folder is what Arcane uses as the main source. ### Get started with Arcane 1.0
Below is an example compose file with the updated variables. Pin to a specific release tag (e.g. 1.0.0) instead of latest.
`services:
arcane:
image: ghcr.io/getarcaneapp/arcane:v1
container\_name: arcane
volumes:
- /var/run/docker.sock:/var/run/docker.sock
- arcane-data:/app/data
- /your/projects:/app/data/projects
# Mount your existing projects into the default folder.
environment:
- APP\_URL=http://localhost:3552
- PUID=1000
- PGID=1000
- ENCRYPTION\_KEY=xxxxxxxxxxxxxxxxxxxxxx
- JWT\_SECRET=xxxxxxxxxxxxxxxxxxxxxx
ports:
- '3552:3552'
restart: unless-stopped
volumes:
arcane-data:
`
You can also use the [Compose Generator](/generator) to create a 1.0 configuration.
Open [[http://localhost:3552](http://localhost:3552)](http://localhost:3552) in your browser to