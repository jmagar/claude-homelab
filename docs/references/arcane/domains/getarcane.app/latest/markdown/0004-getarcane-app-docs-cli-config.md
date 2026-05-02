Configuration
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
## Config File Location
By default, the configuration is stored at: `\~/.config/arcanecli.yml`
You can find the exact path on your system by running:
Copy
The CLI now uses key-based config updates, so settings are changed with `arcane-cli config set \<key\> \<value\>` instead of the older `--server-url` style flags.
## Example Configuration
Here is what a typical configuration file looks like:
`api\_key: ''
default\_environment: '0'
default\_limit: 20
jwt\_token: ''
log\_level: info
pagination:
default:
limit: 20
resources:
apikeys:
limit: 20
containers:
limit: 20
environments:
limit: 20
events:
limit: 20
images:
limit: 20
networks:
limit: 20
projects:
limit: 20
registries:
limit: 20
templates:
limit: 20
users:
limit: 20
volumes:
limit: 20
refresh\_token: ''
resource\_limits:
apikeys: 20
containers: 20
environments: 20
events: 20
images: 20
networks: 20
projects: 20
registries: 20
templates: 20
users: 20
volumes: 20
server\_url: http://localhost:3552
`
## Getting Started
A quick first run looks like this:
1. Initialize a starter config file:
Copy
1. Update the server URL and API Key:
Copy
Copy
## Authenticate
Choose one of the following authentication methods.
### Option A: Device code
Use this when your Arcane setup supports OIDC and you want to sign in with your external identity provider.
Copy
### Option B: API key
Use this for CI/CD or automation.
Copy
## Useful Global Flags
These flags are available across the CLI:
* `--output text|json` for output mode (`--json` is an alias for `--output json`)
* `--env \<id\>` to override the configured default environment for one command
* `--yes` to auto-confirm destructive prompts
* `--no-color` to disable ANSI color output
* `--request-timeout \<duration\>` to override HTTP timeout per command ## Utilities
Useful helper commands:
*
Copy
*
Copy
## Pagination Config
Set global and per-resource list limits in config:
`pagination:
default:
limit: 25
resources:
containers:
limit: 50
images:
limit: 100
volumes:
limit: 40
networks:
limit: 40
`
CLI precedence is:
1. `--limit`
2. `pagination.resources.\<resource\>.limit`
3. `pagination.default.limit`
4. command built-in default
You can configure limits with:
Copy
Copy
You can also set resource limits directly in the generated config file under `resource\_limits` and `pagination.resources` if you prefer editing YAML by hand.