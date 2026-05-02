Deployment | Apprise Documentation
[Skip to content](#_top)
If Apprise helps you, please consider supporting the project: [GitHub Sponsors](https://github.com/sponsors/caronc) or [PayPal](https://www.paypal.com/donate/?hosted_button_id=CR6YF7KLQWQ5E).
# Deployment
The **Apprise API** is designed to run as a containerized service.
This page explains **how to deploy and operate it**, not how to use the API endpoints.
If you are looking to:
* send notifications, see **API Usage**
* integrate with the CLI or Python library, see **Integration**
* understand keys, storage, or locking, see **Configuration**
## Deployment Model
[Section titled “Deployment Model”](#deployment-model)
Apprise API is a **stateless-first** service with **optional persistent state**.
* Stateless usage sends notifications directly without saving configuration.
* Stateful usage persists configuration under a `{KEY}` for reuse.
* The built-in web interface is optional and provided for convenience only.
The service is safe to run:
* locally
* behind a reverse proxy
* in Docker or Docker Compose
* in Kubernetes, including hardened and rootless environments
## Quick Start
[Section titled “Quick Start”](#quick-start)
Choose one deployment method below to get Apprise API running quickly.
* [ Docker ](#tab-panel-3)
* [ Docker Compose ](#tab-panel-4)
* [ Kubernetes ](#tab-panel-5)
Terminal window
```
`
docker run --name apprise \\
-p 8000:8000 \\
-v ./config:/config \\
-v ./attach:/attach \\
-e APPRISE\_STATEFUL\_MODE=simple \\
-e APPRISE\_WORKER\_COUNT=1 \\
-e APPRISE\_ADMIN=y \\
-d caronc/apprise:latest
`
```
The following will set the same container up but leverage health check monitoring:
Terminal window
```
`
docker run --name apprise \\
-p 8000:8000 \\
-v ./config:/config \\
-v ./attach:/attach \\
-e APPRISE\_STATEFUL\_MODE=simple \\
-e APPRISE\_WORKER\_COUNT=1 \\
-e APPRISE\_ADMIN=y \\
--health-cmd='curl -fsS http://127.0.0.1:8000/status \>/dev/null || exit 1' \\
--health-interval=30s \\
--health-timeout=5s \\
--health-retries=3 \\
--health-start-period=20s \\
-d caronc/apprise:latest
`
```
Once deployed, the API and optional web interface are available at:
```
`
http://localhost:8000/
`
```
## Persistent Storage
[Section titled “Persistent Storage”](#persistent-storage)
Apprise API supports persistent storage for:
* saved configurations
* cached authentication metadata
* uploaded attachments
The container expects the following writable paths:
|Path|Purpose|
|`/config`|Saved configurations and internal state|
|`/attach`|Uploaded attachments|
|`/plugin`|Optional custom plugins|
|`/tmp`|Runtime files (sockets, buffers, temp data)|
For most deployments, mounting **only `/config` and `/attach`** is sufficient.
## Hardened Deployments
[Section titled “Hardened Deployments”](#hardened-deployments)
For public or multi-tenant environments, Apprise API supports hardened execution.
Example hardened container configuration:
```
`
services:
apprise:
image: caronc/apprise:latest
container\_name: apprise
user: "1000:1000"
read\_only: true
cap\_drop:
- ALL
security\_opt:
- no-new-privileges:true
ports:
- "8000:8000"
environment:
APPRISE\_STATEFUL\_MODE: simple
APPRISE\_WORKER\_COUNT: 1
APPRISE\_ADMIN: "y"
volumes:
- ./config:/config
- ./attach:/attach
tmpfs:
- /tmp
`
```
Important Notes:
* `/tmp` must remain writable
* No files are written under `/var/log`
* All logs are written to stdout and stderr
### Kubernetes Hardening Notes
[Section titled “Kubernetes Hardening Notes”](#kubernetes-hardening-notes)
If you deploy in Kubernetes, see **Quick Start -\> Kubernetes -\> Hardened (rootless + read-only)** for a ready-to-apply example that:
* runs as a non-root user
* drops all Linux capabilities
* disables privilege escalation
* uses a read only root filesystem
* mounts `/tmp` as an in-memory `emptyDir`
## Health checks
[Section titled “Health checks”](#health-checks)
Apprise API exposes a health endpoint:
```
`
GET /status
`
```
* Returns HTTP `200` when healthy
* Returns HTTP `417` if a blocking issue is detected
Example:
Terminal window
```
`
curl http://localhost:8000/status
`
```
This endpoint is suitable for:
* Docker health checks
* Kubernetes liveness probes
* external monitoring systems
## Reverse Proxies and Base Paths
[Section titled “Reverse Proxies and Base Paths”](#reverse-proxies-and-base-paths)
If Apprise API is hosted behind a reverse proxy or served under a subpath, set `APPRISE\_BASE\_URL` to accommodate this.
Example:
Terminal window
```
`
APPRISE\_BASE\_URL=/apprise
`
```
This ensures:
* correct URL generation
* correct web UI routing
* correct OpenAPI links
## Authentication and access control
[Section titled “Authentication and access control”](#authentication-and-access-control)
Apprise API does **not** implement authentication internally.
This is by design.
Recommended approaches:
* place the API behind a reverse proxy
* use HTTP basic authentication
* restrict access at the network or ingress level
Nginx override files may be injected into the container to enforce access control.
A Kubernetes example that uses a `Secret` (basic auth `.htpasswd`) and a `ConfigMap` (nginx `location-override.conf`) is available under **Quick Start -\> Kubernetes -\> Full example**.
## Logging and Observability
[Section titled “Logging and Observability”](#logging-and-observability)
* All logs are emitted to stdout and stderr
* No log files are written to disk
* Prometheus metrics are available at `/metrics`
## Development Deployments
[Section titled “Development Deployments”](#development-deployments)
For local development, the repository includes Docker Compose overrides that:
* mount the local source tree
* reload UI and template changes without rebuilding
* expose the API on port `8000`
This mode is intended for development only and is **not recommended for production**.
## Next Steps
[Section titled “Next Steps”](#next-steps)
Once deployed, you can:
* save configuration keys using the web UI or API
* send notifications using `/notify` or `/notify/{KEY}`
* integrate external systems using HTTP or the Apprise CLI
Questions or Feedback?
#### Documentation
Notice a typo or an error?
[
Report it
](https://github.com/caronc/apprise-docs/issues/)
or
[
contribute a fix
](https://github.com/caronc/apprise-docs)
.
#### Technical Issues
Having trouble with the code? Open an issue on GitHub:
* [
Apprise Core & CLI
](https://github.com/caronc/apprise/issues/)
* [
Apprise API
](https://github.com/caronc/apprise-api/issues/)
Made with love from Canada