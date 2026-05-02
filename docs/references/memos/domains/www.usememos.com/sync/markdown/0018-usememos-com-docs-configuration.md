Configuration - Memos
[Memos](/)
Search
⌘K
Documentation
[Documentation](/docs)
Getting Started
Deploy
Configuration
[Configuration](/docs/configuration)[Environment Variables](/docs/configuration/environment-variables)[Database](/docs/configuration/database)[Storage](/docs/configuration/storage)[Authentication](/docs/configuration/authentication)[Security](/docs/configuration/security)
Usage
Operations
Development
Integrations
Admin
Troubleshooting
[FAQ](/docs/faq)
[](https://github.com/usememos/memos)
Configuration
# Configuration
Configure server behavior, storage, authentication, and environment variables.
Memos can be configured through command-line flags, `MEMOS\_\*` environment variables, and instance-level settings managed in the UI or API.
## [Common runtime settings](#common-runtime-settings)
|Flag|Environment|Purpose|
|`--port`|`MEMOS\_PORT`|HTTP port|
|`--addr`|`MEMOS\_ADDR`|bind address|
|`--unix-sock`|`MEMOS\_UNIX\_SOCK`|Unix socket path|
|`--data`|`MEMOS\_DATA`|data directory|
|`--driver`|`MEMOS\_DRIVER`|database backend|
|`--dsn`|`MEMOS\_DSN`|database connection string|
|`--instance-url`|`MEMOS\_INSTANCE\_URL`|public instance URL|
|`--demo`|`MEMOS\_DEMO`|demo mode|
## [Configuration layers](#configuration-layers)
* runtime flags and environment variables control server startup
* instance settings control storage, registration, and some auth behavior
* reverse proxy settings affect HTTPS, cookie behavior, and public URL correctness
## [Related topics](#related-topics)
* [Environment Variables](/docs/configuration/environment-variables)
* [Database](/docs/configuration/database)
* [Storage](/docs/configuration/storage)
* [Authentication](/docs/configuration/authentication)
* [Security](/docs/configuration/security)
[
Reverse Proxy
Run Memos behind HTTPS with correct forwarded headers and public URLs.
](/docs/deploy/reverse-proxy)[
Environment Variables
Reference for the most important `MEMOS\_\*` runtime settings.
](/docs/configuration/environment-variables)
### On this page
[Common runtime settings](#common-runtime-settings)[Configuration layers](#configuration-layers)[Related topics](#related-topics)