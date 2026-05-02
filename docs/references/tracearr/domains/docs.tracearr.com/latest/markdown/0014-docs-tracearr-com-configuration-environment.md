Environment Variables Reference | Tracearr Docs[Skip to Content](#nextra-skip-nav)
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
[Configuration](/configuration)Environment Variables
Copy page
# Environment Variables
Tracearr uses environment variables for core configuration.
## Required Variables[](#required-variables)
|Variable|Description|Example|
|`DATABASE\_URL`|PostgreSQL/TimescaleDB connection string|`postgres://user:pass@host:5432/tracearr`|
|`REDIS\_URL`|Redis connection string|`redis://localhost:6379`|
## Optional Variables[](#optional-variables)
|Variable|Description|Default|
|`PORT`|HTTP server port|`3000`|
|`NODE\_ENV`|Environment mode|`production`|
|`LOG\_LEVEL`|Logging verbosity|`info`|
|`SESSION\_SECRET`|Session encryption key|(generated)|
|`TZ`|Timezone|`UTC`|
|`CORS\_ORIGIN`|Allowed CORS origin for API requests|`\*`|
|`REDIS\_PREFIX`|Redis key prefix for namespacing|no prefix|
|`CLAIM\_CODE`|Claim code for first time setup|none|
|`BASE\_PATH`|Base path when served under a subpath|none|
|`DNS\_CACHE\_MAX\_TTL`|DNS cache maximum TTL in seconds|disabled|
|`GZIP\_ENABLED`|Enable server-side gzip compression|`false`|
|`BACKUP\_DIR`|Directory for storing database backups|`/data/backup`|
## Database Configuration[](#database-configuration)
Tracearr requires TimescaleDB (PostgreSQL with the TimescaleDB extension) for time-series data storage.
```
`DATABASE\_URL=postgres://tracearr:password@localhost:5432/tracearr`
```
## Redis Configuration[](#redis-configuration)
Redis is used for caching and background job queues.
```
`REDIS\_URL=redis://localhost:6379`
```
For Redis with authentication:
```
`REDIS\_URL=redis://:password@localhost:6379`
```
To enable Redis key prefixing:
Redis key prefixes must end with a delimiter (we recommend a colon ”:”) to ensure proper namespacing and avoid key collisions in shared Redis instances.
```
`REDIS\_PREFIX=myprefix:`
```
## Claim Code[](#claim-code)
The `CLAIM\_CODE` environment variable is used to protect the initial setup page.
This is recommended when Tracearr is exposed to the public internet.
When set, the claim code will be printed to the log on startup.
Before you can access the setup page, you must enter the claim code.
## Base Path[](#base-path)
Set `BASE\_PATH` when you want Tracearr to be served under a subpath.
This ensures all routes, assets, and links are prefixed correctly.
```
`BASE\_PATH=/tracearr`
```
You only need to set this if Tracearr is accessed through a reverse proxy under a subpath (e.g. `https://example.com/tracearr`). If Tracearr is served at the root, this can be left unset.
## DNS Cache[](#dns-cache)
Set `DNS\_CACHE\_MAX\_TTL` to enable DNS caching for outgoing requests.
This can improve performance by reducing the number of DNS lookups for frequently accessed hosts.
DNS caching is disabled if `DNS\_CACHE\_MAX\_TTL` is not set.
```
`DNS\_CACHE\_MAX\_TTL=3600`
```
Tracearr will respect the TTL provided by the DNS server, but will not cache entries longer than the value set in `DNS\_CACHE\_MAX\_TTL`.
Error responses (e.g. DNS resolution failures) are not cached to ensure that transient issues do not persist longer than necessary.
## Gzip Compression[](#gzip-compression)
Set `GZIP\_ENABLED=true` to enable server-side gzip compression for HTTP responses.
This compresses static assets and API responses, reducing bandwidth usage.
```
`GZIP\_ENABLED=true`
```
Most deployments sit behind a reverse proxy (e.g. Nginx, Caddy, Traefik) that already handles compression. Only enable this if Tracearr is serving traffic directly without a compressing proxy in front of it.
Enabling gzip will slightly increase CPU usage on the server.
## Backup Directory[](#backup-directory)
Set `BACKUP\_DIR` to customize where Tracearr stores database backups. The default location is `/data/backup` inside the container.
```
`BACKUP\_DIR=/custom/path/to/backups`
```
When using Docker, the default `/data/backup` path is already configured as a volume. If you change this, ensure the directory exists and is writable, and mount it as a volume if needed.
See [Backup & Restore](/configuration/backup) for full documentation.
Last updated on March 15, 2026
[Overview](/configuration)[Rules](/configuration/rules)