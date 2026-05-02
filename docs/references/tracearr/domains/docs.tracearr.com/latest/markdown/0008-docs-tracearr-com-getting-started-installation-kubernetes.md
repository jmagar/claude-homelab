Kubernetes (Helm) | Tracearr Docs[Skip to Content](#nextra-skip-nav)
CTRL K
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
* [Introduction](/)
* Getting Started
* [Overview](/getting-started)
* Installation
* [Docker Compose](/getting-started/installation)
* [Docker UI](/getting-started/installation/docker-ui)
* [Supervised](/getting-started/installation/supervised)
* [Kubernetes (Helm)](/getting-started/installation/kubernetes)
* [Railway (Cloud)](/getting-started/installation/railway)
* [Connect a Server](/getting-started/first-server)
* [Import Data](/getting-started/import)
* Configuration
* [Overview](/configuration)
* [Environment Variables](/configuration/environment)
* [Rules](/configuration/rules)
* [Tailscale VPN](/configuration/tailscale)
* [Backup & Restore](/configuration/backup)
* [Mobile App](/configuration/mobile)
* [Debug Page](/configuration/debug)
* [Upgrading](/upgrading)
* [FAQ](/faq)
Light
[Getting Started](/getting-started)[Installation](/getting-started/installation)Kubernetes (Helm)
Copy page
# Kubernetes
The Helm chart deploys the same three services as Docker Compose — Tracearr, TimescaleDB (PostgreSQL 18), and Redis — as native Kubernetes resources. StatefulSets handle the databases, a Deployment runs the app, and secrets are auto-generated on first install.
The chart lives at [`docker/helm/tracearr`](https://github.com/connorgallopo/Tracearr/tree/main/docker/helm/tracearr) in the main repo.
## Quick Start[](#quick-start)
```
`# Clone the repo (or just the helm directory)
git clone https://github.com/connorgallopo/Tracearr.git
cd Tracearr/docker/helm
# Install into a dedicated namespace
helm install tracearr ./tracearr --namespace tracearr --create-namespace`
```
Tracearr will start once TimescaleDB and Redis are ready. Init containers handle the wait automatically.
```
`# Watch pods come up
kubectl get pods -n tracearr -w
# Port-forward to access the UI
kubectl port-forward svc/tracearr 3000:3000 -n tracearr`
```
Then open `http://localhost:3000`.
JWT and cookie secrets are auto-generated on first install and preserved across upgrades. To retrieve them:
```
`kubectl get secret tracearr -n tracearr -o jsonpath='{.data.JWT\_SECRET}' | base64 -d
kubectl get secret tracearr -n tracearr -o jsonpath='{.data.COOKIE\_SECRET}' | base64 -d`
```
Back these up if you plan to reinstall — losing them invalidates all user sessions.
## Ingress[](#ingress)
To expose Tracearr outside the cluster, enable the ingress in your values override:
```
`ingress:
enabled: true
className: nginx # or traefik, etc.
annotations:
nginx.ingress.kubernetes.io/proxy-read-timeout: "3600"
nginx.ingress.kubernetes.io/proxy-send-timeout: "3600"
nginx.ingress.kubernetes.io/proxy-http-version: "1.1"
cert-manager.io/cluster-issuer: letsencrypt-prod
hosts:
- host: tracearr.example.com
paths:
- path: /
pathType: Prefix
tls:
- secretName: tracearr-tls
hosts:
- tracearr.example.com`
```
Tracearr uses WebSocket (Socket.io) for real-time updates to the dashboard and mobile app, and SSE for Plex session streaming. Your ingress controller must support HTTP connection upgrades, and timeouts need to be long enough for persistent connections. The `proxy-read-timeout` and `proxy-send-timeout` annotations above are required for nginx — without them, connections will be killed after 60 seconds and real-time features won’t work.
Traefik handles WebSocket upgrades by default, but you may still need to increase idle timeouts depending on your configuration.
## Using an External Database[](#using-an-external-database)
If you already run TimescaleDB or PostgreSQL with the TimescaleDB extension, you can skip the bundled StatefulSet:
```
`timescale:
enabled: false
externalDatabase:
host: your-db-host.example.com
port: 5432
user: tracearr
database: tracearr
secrets:
dbPassword: "your-database-password"`
```
Your database must have the `timescaledb`, `timescaledb\_toolkit`, and `pg\_trgm` extensions enabled.
## Using an External Redis[](#using-an-external-redis)
Works with Redis, Valkey, KeyDB, or any Redis-compatible server:
```
`redis:
enabled: false
externalRedis:
url: "redis://your-redis:6379"`
```
Tracearr uses BullMQ for background job processing. BullMQ requires `maxmemory-policy noeviction` on Redis — if your Redis instance is configured to evict keys under memory pressure, job queues will silently corrupt. The bundled Redis is pre-configured with the correct policy.
## Configuration Reference[](#configuration-reference)
### Tracearr[](#tracearr)
|Value|Default|Description|
|`tracearr.image.tag`|Chart appVersion|Image tag|
|`tracearr.replicaCount`|`1`|Must be 1 (singleton poller)|
|`tracearr.env.TZ`|`UTC`|Timezone|
|`tracearr.env.LOG\_LEVEL`|`info`|`debug`, `info`, `warn`, `error`|
|`tracearr.env.CORS\_ORIGIN`|`\*`|Set to your domain in production|
|`tracearr.resources.limits.memory`|`1Gi`|App memory limit|
|`tracearr.backups.enabled`|`true`|PVC for database backups|
|`tracearr.backups.size`|`10Gi`|Backup volume size|
|`tracearr.imageCache.enabled`|`true`|PVC for media artwork cache|
|`tracearr.imageCache.size`|`5Gi`|Image cache volume size|
### Secrets[](#secrets)
|Value|Default|Description|
|`secrets.autoGenerate`|`true`|Generate JWT/cookie secrets if empty|
|`secrets.jwtSecret`|`""`|Provide your own JWT secret|
|`secrets.cookieSecret`|`""`|Provide your own cookie secret|
|`secrets.dbPassword`|`tracearr`|Database password|
|`secrets.existingSecret`|`""`|Use a pre-existing Kubernetes Secret|
### TimescaleDB[](#timescaledb)
|Value|Default|Description|
|`timescale.enabled`|`true`|Deploy bundled TimescaleDB|
|`timescale.image.tag`|`pg18.1-ts2.25.0`|Pinned TimescaleDB HA image|
|`timescale.persistence.size`|`50Gi`|Database volume size|
|`timescale.resources.limits.memory`|`4Gi`|DB memory limit|
|`timescale.shmSize`|`512Mi`|Shared memory for PostgreSQL|
### Redis[](#redis)
|Value|Default|Description|
|`redis.enabled`|`true`|Deploy bundled Redis|
|`redis.image.tag`|`8-alpine`|Redis image tag|
|`redis.persistence.size`|`2Gi`|Redis AOF volume size|
|`redis.resources.limits.memory`|`512Mi`|Redis memory limit|
### Network Policy[](#network-policy)
|Value|Default|Description|
|`networkPolicy.enabled`|`false`|Restrict traffic between pods|
When enabled, the network policy locks down TimescaleDB and Redis to only accept connections from the Tracearr pod, and restricts Tracearr’s egress to DNS, its databases, and outbound TCP (for media server polling, push notifications, and GeoIP lookups).
## Upgrading[](#upgrading)
```
`helm upgrade tracearr ./tracearr --namespace tracearr`
```
Secrets are preserved automatically — the chart checks for an existing secret before generating new values. Changing `dbPassword` after initial deployment requires updating the password inside PostgreSQL as well (`ALTER USER tracearr PASSWORD '...'`).
## Next Steps[](#next-steps)
Once Tracearr is running, [connect your first media server](/getting-started/first-server).
Last updated on March 15, 2026
[Supervised](/getting-started/installation/supervised)[Railway (Cloud)](/getting-started/installation/railway)