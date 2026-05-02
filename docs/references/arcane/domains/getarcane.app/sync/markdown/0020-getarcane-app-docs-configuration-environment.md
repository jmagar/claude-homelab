Environment Variables
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
Most settings in Arcane can be changed via the Settings UI. Below are the settings that can be set via environment variables.
## Use External Postgres Database
By default, Arcane stores its data in a local SQLite file. This works well for most setups:
Copy
If you want to use an external Postgres database instead, set the `DATABASE\_URL` environment variable to something like this:
Copy
Replace each placeholder with the real value from your database.
* `\<db\_username\>`: your Postgres username
* `\<db\_password\>`: your Postgres password
* `\<postgres\_url\>`: the server address for Postgres
* `\<postgres\_port\>`: the port Postgres uses
* `\<postgres\_db\_name\>`: the database name to connect to ## Environment Variables
|Variable|Details|
|`ADMIN\_STATIC\_API\_KEY`|
Maps to the AdminStaticAPIKey config field.
Default`—`
|
|`AGENT\_MODE`|
Maps to the AgentMode config field.
Default`false`
|
|`AGENT\_TOKEN`|
Maps to the AgentToken config field.
Default`—`
|
|`ALLOW\_DOWNGRADE`|
Maps to the AllowDowngrade config field.
Default`false`
|
|`ANALYTICS\_DISABLED`|
Maps to the AnalyticsDisabled config field.
Default`false`
|
|`APP\_URL`|
Maps to the AppUrl config field.
Default`http://localhost:3552`
|
|`ARCANE\_BACKUP\_VOLUME\_NAME`|
Maps to the BackupVolumeName config field.
Default`arcane-backups`
|
|`AUTO\_LOGIN\_PASSWORD`|
Maps to the AutoLoginPassword config field.
Default`arcane-admin`
|
|`AUTO\_LOGIN\_USERNAME`|
Auto-login credentials (used only when built with the buildables tag + autologin feature flag).
Default`arcane`
|
|`DATABASE\_URL`|
Maps to the DatabaseURL config field.
Default`file:data/arcane.db?\_pragma=journal\_mode(WAL)&\_pragma=busy\_timeout(2500)&\_txlock=immediate`
|
|`DIR\_PERM`|
Maps to the DirPerm config field.
Default`0755`
|
|`DOCKER\_API\_TIMEOUT`|
Maps to the DockerAPITimeout config field.
Default`0`
|
|`DOCKER\_HOST`|
Maps to the DockerHost config field.
Default`unix:///var/run/docker.sock`
|
|`DOCKER\_IMAGE\_PULL\_TIMEOUT`|
Maps to the DockerImagePullTimeout config field.
Default`0`
|
|`EDGE\_AGENT`|
Maps to the EdgeAgent config field.
Default`false`
|
|`EDGE\_RECONNECT\_INTERVAL`|
seconds
Default`5`
|
|`EDGE\_TRANSPORT`|
Maps to the EdgeTransport config field.
Default`auto`
|
|`ENCRYPTION\_KEY`|
Maps to the EncryptionKey config field.
Default`arcane-dev-key-32-characters!!!`
|
|`ENVIRONMENT`|
Maps to the Environment config field.
Default`production`
|
|`FILE\_PERM`|
Maps to the FilePerm config field.
Default`0644`
|
|`GIT\_OPERATION\_TIMEOUT`|
Maps to the GitOperationTimeout config field.
Default`0`
|
|`GIT\_WORK\_DIR`|
Maps to the GitWorkDir config field.
Default`data/git`
|
|`GPU\_MONITORING\_ENABLED`|
Maps to the GPUMonitoringEnabled config field.
Default`false`
|
|`GPU\_TYPE`|
Maps to the GPUType config field.
Default`auto`
|
|`HTTP\_CLIENT\_TIMEOUT`|
Maps to the HTTPClientTimeout config field.
Default`0`
|
|`JWT\_REFRESH\_EXPIRY`|
Maps to the JWTRefreshExpiry config field.
Default`168h`
|
|`JWT\_SECRET`|
Maps to the JWTSecret config field.
Default`default-jwt-secret-change-me`
|
|`LISTEN`|
Maps to the Listen config field.
Default`—`
|
|`LOG\_JSON`|
Maps to the LogJson config field.
Default`false`
|
|`LOG\_LEVEL`|
Maps to the LogLevel config field.
Default`info`
|
|`MANAGER\_API\_URL`|
Maps to the ManagerApiUrl config field.
Default`—`
|
|`OIDC\_ADMIN\_CLAIM`|
Maps to the OidcAdminClaim config field.
Default`—`
|
|`OIDC\_ADMIN\_VALUE`|
Maps to the OidcAdminValue config field.
Default`—`
|
|`OIDC\_AUTO\_REDIRECT\_TO\_PROVIDER`|
Maps to the OidcAutoRedirectToProvider config field.
Default`false`
|
|`OIDC\_CLIENT\_ID`|
Maps to the OidcClientID config field.
Default`—`
|
|`OIDC\_CLIENT\_SECRET`|
Maps to the OidcClientSecret config field.
Default`—`
|
|`OIDC\_ENABLED`|
Maps to the OidcEnabled config field.
Default`false`
|
|`OIDC\_ISSUER\_URL`|
Maps to the OidcIssuerURL config field.
Default`—`
|
|`OIDC\_PROVIDER\_LOGO\_URL`|
Maps to the OidcProviderLogoUrl config field.
Default`—`
|
|`OIDC\_PROVIDER\_NAME`|
Maps to the OidcProviderName config field.
Default`—`
|
|`OIDC\_SCOPES`|
Maps to the OidcScopes config field.
Default`openid email profile`
|
|`OIDC\_SKIP\_TLS\_VERIFY`|
Maps to the OidcSkipTlsVerify config field.
Default`false`
|
|`PORT`|
Maps to the Port config field.
Default`3552`
|
|`PROJECTS\_DIRECTORY`|
Maps to the ProjectsDirectory config field.
Default`/app/data/projects`
|
|`PROJECT\_SCAN\_MAX\_DEPTH`|
Maps to the ProjectScanMaxDepth config field.
Default`3`
|
|`PROJECT\_SCAN\_SKIP\_DIRS`|
Maps to the ProjectScanSkipDirs config field.
Default`.git,node\_modules,vendor,.venv,venv,\_\_pycache\_\_,.cache,dist,build,target,.next,.nuxt,.svelte-kit`
|
|`PROXY\_REQUEST\_TIMEOUT`|
Maps to the ProxyRequestTimeout config field.
Default`0`
|
|`REGISTRY\_TIMEOUT`|
Maps to the RegistryTimeout config field.
Default`0`
|
|`TLS\_CERT\_FILE`|
Maps to the TLSCertFile config field.
Default`—`
|
|`TLS\_ENABLED`|
Maps to the TLSEnabled config field.
Default`false`
|
|`TLS\_KEY\_FILE`|
Maps to the TLSKeyFile config field.
Default`—`
|
|`TRIVY\_SCAN\_TIMEOUT`|
Maps to the TrivyScanTimeout config field.
Default`0`
|
|`TZ`|
Timezone for cron job scheduling. Uses IANA timezone names (e.g., "America/New\_York", "Europe/London"). "Local" uses the system's local timezone, "UTC" for Coordinated Universal Time.
Default`Local`
|
|`UI\_CONFIGURATION\_DISABLED`|
Maps to the UIConfigurationDisabled config field.
Default`false`
|
|`UPDATE\_CHECK\_DISABLED`|
Maps to the UpdateCheckDisabled config field.
Default`false`
|
> [!NOTE]For proxy configuration, Arcane also supports lowercase aliases for the standard proxy variables (
`> http_proxy
`> ,
`> https_proxy
`> ,
`> no_proxy
`> ).
## Bootstrapping an Admin API Key
If you want a predictable API key for automation, set `ADMIN\_STATIC\_API\_KEY`.
Arcane will reconcile a protected admin API key at startup so your deployment can depend on a known key value without a manual UI step. See the [API Reference](/api-reference) page for usage details and webhook examples.
## Downgrading Arcane
If you start an older version of Arcane with a database from a newer version, Arcane will notice at startup.
Arcane needs internet access during the downgrade because it downloads the older database changes it needs.
By default, Arcane blocks downgrades to help protect your data.
To allow a downgrade:
1. Back up your database first.
2. Set:
Copy
1. Start the older version of Arcane.
2. Arcane will automatically roll the database back to the version required by that release.
3. After the downgrade succeeds, set:
Copy
again.
## Settings Overrides via Environment
If you prefer to configure Arcane via environment variables, below is a list of all configurable variables that can be set if one of the following variables is set:
* `UI\_CONFIGURATION\_DISABLED=true` or
* `AGENT\_MODE=true`
If neither of the above are set, these values are ignored.
|Env Var|Details|
|`AUTO\_HEAL\_INTERVAL`|
Setting`autoHealInterval`
How often to check container health (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. AUTO\_HEAL\_ENABLED=true to have effect at runtime.
|
|`ENVIRONMENT\_HEALTH\_INTERVAL`|
Setting`environmentHealthInterval`
How often to check environment connectivity (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`EVENT\_CLEANUP\_INTERVAL`|
Setting`eventCleanupInterval`
How often to delete old events (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`APPLICATION\_THEME`|
Setting`applicationTheme`
Choose the overall visual theme for the application
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`KEYBOARD\_SHORTCUTS\_ENABLED`|
Setting`keyboardShortcutsEnabled`
Enable keyboard shortcuts for navigation and show shortcut hints in tooltips
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`MOBILE\_NAVIGATION\_MODE`|
Setting`mobileNavigationMode`
Choose between floating or docked navigation on mobile
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`MOBILE\_NAVIGATION\_SHOW\_LABELS`|
Setting`mobileNavigationShowLabels`
Display text labels alongside navigation icons
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`SIDEBAR\_HOVER\_EXPANSION`|
Setting`sidebarHoverExpansion`
Expand sidebar on hover in desktop mode
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTH\_LOCAL\_ENABLED`|
Setting`authLocalEnabled`
Enable local username/password authentication
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTH\_OIDC\_CONFIG`|
Setting`authOidcConfig`
OIDC provider configuration (deprecated - use individual fields)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
Deprecated legacy JSON OIDC configuration. Prefer the discrete OIDC\_\* environment variables.
SensitiveDeprecated
|
|`AUTH\_PASSWORD\_POLICY`|
Setting`authPasswordPolicy`
Set password strength requirements
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTH\_SESSION\_TIMEOUT`|
Setting`authSessionTimeout`
How long user sessions remain active
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`OIDC\_ADMIN\_CLAIM`|
Setting`oidcAdminClaim`
Claim name for admin role mapping
|
|`OIDC\_ADMIN\_VALUE`|
Setting`oidcAdminValue`
Claim value that grants admin access
|
|`OIDC\_AUTHORIZATION\_ENDPOINT`|
Setting`oidcAuthorizationEndpoint`
Override OIDC authorization endpoint
|
|`OIDC\_AUTO\_REDIRECT\_TO\_PROVIDER`|
Setting`oidcAutoRedirectToProvider`
Automatically redirect to OIDC provider on login page
|
|`OIDC\_CLIENT\_ID`|
Setting`oidcClientId`
OIDC provider client ID
|
|`OIDC\_CLIENT\_SECRET`|
Setting`oidcClientSecret`
OIDC provider client secret
Sensitive
|
|`OIDC\_DEVICE\_AUTHORIZATION\_ENDPOINT`|
Setting`oidcDeviceAuthorizationEndpoint`
Override OIDC device authorization endpoint for CLI authentication
|
|`OIDC\_ENABLED`|
Setting`oidcEnabled`
Enable OpenID Connect (OIDC) authentication
|
|`OIDC\_ISSUER\_URL`|
Setting`oidcIssuerUrl`
OIDC provider issuer URL
|
|`OIDC\_JWKS\_ENDPOINT`|
Setting`oidcJwksEndpoint`
Override OIDC JWKS endpoint
|
|`OIDC\_MERGE\_ACCOUNTS`|
Setting`oidcMergeAccounts`
Allow OIDC logins to merge with existing accounts by email
|
|`OIDC\_PROVIDER\_LOGO\_URL`|
Setting`oidcProviderLogoUrl`
Custom logo URL for the OIDC provider
|
|`OIDC\_PROVIDER\_NAME`|
Setting`oidcProviderName`
Custom name for the OIDC provider (e.g., Authentik, Keycloak)
|
|`OIDC\_SCOPES`|
Setting`oidcScopes`
OIDC scopes to request
|
|`OIDC\_SKIP\_TLS\_VERIFY`|
Setting`oidcSkipTlsVerify`
Skip TLS verification for OIDC provider
|
|`OIDC\_TOKEN\_ENDPOINT`|
Setting`oidcTokenEndpoint`
Override OIDC token endpoint
|
|`OIDC\_USERINFO\_ENDPOINT`|
Setting`oidcUserinfoEndpoint`
Override OIDC userinfo endpoint
|
|`BUILDS\_DIRECTORY`|
Setting`buildsDirectory`
Root directory for manual build workspaces
|
|`BUILD\_PROVIDER`|
Setting`buildProvider`
Default build provider (local or depot)
|
|`BUILD\_TIMEOUT`|
Setting`buildTimeout`
Timeout for BuildKit builds in seconds (default: 1800 = 30 minutes)
|
|`DEPOT\_PROJECT\_ID`|
Setting`depotProjectId`
Depot project identifier
|
|`DEPOT\_TOKEN`|
Setting`depotToken`
Depot API token
Sensitive
|
|`ACCENT\_COLOR`|
Setting`accentColor`
Primary accent color for UI
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`BASE\_SERVER\_URL`|
Setting`baseServerUrl`
Set the base URL for the application
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`DEFAULT\_SHELL`|
Setting`defaultShell`
Default shell to use for commands
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`DISK\_USAGE\_PATH`|
Setting`diskUsagePath`
Path used for disk usage calculations
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`ENABLE\_GRAVATAR`|
Setting`enableGravatar`
Enable Gravatar profile pictures for users
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`FOLLOW\_PROJECT\_SYMLINKS`|
Setting`followProjectSymlinks`
Treat symlinked child directories inside the projects directory as Docker Compose projects
|
|`GIT\_SYNC\_MAX\_BINARY\_SIZE\_MB`|
Setting`gitSyncMaxBinarySizeMb`
Maximum size in MB for a single binary file copied during a Git sync. Set 0 to disable the environment cap (default: 10)
|
|`GIT\_SYNC\_MAX\_FILES`|
Setting`gitSyncMaxFiles`
Maximum number of repository files copied during a Git sync. Set 0 to disable the environment cap (default: 500)
|
|`GIT\_SYNC\_MAX\_TOTAL\_SIZE\_MB`|
Setting`gitSyncMaxTotalSizeMb`
Maximum combined size in MB for files copied during a Git sync. Set 0 to disable the environment cap (default: 50)
|
|`OLED\_MODE`|
Setting`oledMode`
Use true-black backgrounds for OLED displays (only active in dark mode)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTO\_HEAL\_ENABLED`|
Setting`autoHealEnabled`
Automatically restart containers that become unhealthy
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTO\_HEAL\_EXCLUDED\_CONTAINERS`|
Setting`autoHealExcludedContainers`
Comma-separated list of containers to exclude from auto-heal
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. AUTO\_HEAL\_ENABLED=true to have effect at runtime.
|
|`AUTO\_HEAL\_MAX\_RESTARTS`|
Setting`autoHealMaxRestarts`
Maximum auto-heal restarts per container within the restart window (default: 5)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. AUTO\_HEAL\_ENABLED=true to have effect at runtime.
|
|`AUTO\_HEAL\_RESTART\_WINDOW`|
Setting`autoHealRestartWindow`
Time window in minutes for counting auto-heal restarts (default: 30)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. AUTO\_HEAL\_ENABLED=true to have effect at runtime.
|
|`AUTO\_INJECT\_ENV`|
Setting`autoInjectEnv`
Automatically inject project .env variables into all containers (default: false)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTO\_UPDATE`|
Setting`autoUpdate`
Automatically update containers when new images are available
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTO\_UPDATE\_EXCLUDED\_CONTAINERS`|
Setting`autoUpdateExcludedContainers`
Comma-separated list of containers to exclude from auto-update
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`AUTO\_UPDATE\_INTERVAL`|
Setting`autoUpdateInterval`
How often to check for automatic updates (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. AUTO\_UPDATE=true to have effect at runtime.
|
|`DEFAULT\_DEPLOY\_PULL\_POLICY`|
Setting`defaultDeployPullPolicy`
Default image pull policy when deploying projects
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`DOCKER\_HOST`|
Setting`dockerHost`
URI for Docker daemon
|
|`GITOPS\_SYNC\_INTERVAL`|
Setting`gitopsSyncInterval`
How often to run GitOps synchronization checks (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`MAX\_IMAGE\_UPLOAD\_SIZE`|
Setting`maxImageUploadSize`
Maximum size in MB for image archive uploads (default: 500)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`POLLING\_ENABLED`|
Setting`pollingEnabled`
Enable automatic checking for image updates
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`POLLING\_INTERVAL`|
Setting`pollingInterval`
How often to check for image updates (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`PROJECTS\_DIRECTORY`|
Setting`projectsDirectory`
Configure where project files are stored
|
|`PRUNE\_BUILD\_CACHE\_MODE`|
Setting`pruneBuildCacheMode`
Select how build cache should be pruned when the scheduled prune job runs
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
|
|`PRUNE\_BUILD\_CACHE\_UNTIL`|
Setting`pruneBuildCacheUntil`
Duration threshold for scheduled build cache prune when mode is olderThan
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true and PRUNE\_BUILD\_CACHE\_MODE=olderThan to have effect at runtime.
|
|`PRUNE\_CONTAINER\_MODE`|
Setting`pruneContainerMode`
Select how containers should be pruned when the scheduled prune job runs
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
|
|`PRUNE\_CONTAINER\_UNTIL`|
Setting`pruneContainerUntil`
Duration threshold for scheduled container prune when mode is olderThan
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true and PRUNE\_CONTAINER\_MODE=olderThan to have effect at runtime.
|
|`PRUNE\_IMAGE\_MODE`|
Setting`pruneImageMode`
Select how images should be pruned when the scheduled prune job runs
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
|
|`PRUNE\_IMAGE\_UNTIL`|
Setting`pruneImageUntil`
Duration threshold for scheduled image prune when mode is olderThan
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true and PRUNE\_IMAGE\_MODE=olderThan to have effect at runtime.
|
|`PRUNE\_NETWORK\_MODE`|
Setting`pruneNetworkMode`
Select how networks should be pruned when the scheduled prune job runs
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
|
|`PRUNE\_NETWORK\_UNTIL`|
Setting`pruneNetworkUntil`
Duration threshold for scheduled network prune when mode is olderThan
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true and PRUNE\_NETWORK\_MODE=olderThan to have effect at runtime.
|
|`PRUNE\_VOLUME\_MODE`|
Setting`pruneVolumeMode`
Select how volumes should be pruned when the scheduled prune job runs
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
|
|`SCHEDULED\_PRUNE\_BUILD\_CACHE`|
Setting`scheduledPruneBuildCache`
Legacy boolean build cache prune flag retained for migration compatibility
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
Legacy boolean prune flag retained for migration compatibility. Prefer PRUNE\_BUILD\_CACHE\_MODE.
Deprecated
|
|`SCHEDULED\_PRUNE\_CONTAINERS`|
Setting`scheduledPruneContainers`
Legacy boolean container prune flag retained for migration compatibility
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
Legacy boolean prune flag retained for migration compatibility. Prefer PRUNE\_CONTAINER\_MODE.
Deprecated
|
|`SCHEDULED\_PRUNE\_ENABLED`|
Setting`scheduledPruneEnabled`
Enable scheduled pruning of unused Docker resources
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`SCHEDULED\_PRUNE\_IMAGES`|
Setting`scheduledPruneImages`
Legacy boolean image prune flag retained for migration compatibility
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
Legacy boolean prune flag retained for migration compatibility. Prefer PRUNE\_IMAGE\_MODE.
Deprecated
|
|`SCHEDULED\_PRUNE\_INTERVAL`|
Setting`scheduledPruneInterval`
How often to run scheduled prunes (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
|
|`SCHEDULED\_PRUNE\_NETWORKS`|
Setting`scheduledPruneNetworks`
Legacy boolean network prune flag retained for migration compatibility
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
Legacy boolean prune flag retained for migration compatibility. Prefer PRUNE\_NETWORK\_MODE.
Deprecated
|
|`SCHEDULED\_PRUNE\_VOLUMES`|
Setting`scheduledPruneVolumes`
Legacy boolean volume prune flag retained for migration compatibility
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. SCHEDULED\_PRUNE\_ENABLED=true to have effect at runtime.
Legacy boolean prune flag retained for migration compatibility. Prefer PRUNE\_VOLUME\_MODE.
Deprecated
|
|`SWARM\_STACK\_SOURCES\_DIRECTORY`|
Setting`swarmStackSourcesDirectory`
Configure where swarm stack source files are stored
|
|`TRIVY\_CONCURRENT\_SCAN\_CONTAINERS`|
Setting`trivyConcurrentScanContainers`
Maximum number of concurrent Trivy scan containers for manual and scheduled scans. Minimum 1
|
|`TRIVY\_CONFIG`|
Setting`trivyConfig`
Trivy configuration file content in YAML format
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`TRIVY\_CPU\_LIMIT`|
Setting`trivyCpuLimit`
Maximum CPU cores for Trivy scan containers (supports decimals, e.g. 1.5). Set 0 to disable CPU limit
|
|`TRIVY\_IGNORE`|
Setting`trivyIgnore`
Trivy ignore file content - one vulnerability ID per line
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`TRIVY\_IMAGE`|
Setting`trivyImage`
Override the Arcane tools image used to run Trivy vulnerability scans
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`TRIVY\_MEMORY\_LIMIT\_MB`|
Setting`trivyMemoryLimitMb`
Maximum memory for Trivy scan containers in MB. Set 0 to disable memory limit
|
|`TRIVY\_NETWORK`|
Setting`trivyNetwork`
Docker network mode/network name used for Trivy scan containers. Leave empty to inherit Arcane's network automatically.
|
|`TRIVY\_PRESERVE\_CACHE\_ON\_VOLUME\_PRUNE`|
Setting`trivyPreserveCacheOnVolumePrune`
Keep the Trivy cache volume when unused volumes are pruned manually or on a schedule
|
|`TRIVY\_PRIVILEGED`|
Setting`trivyPrivileged`
Run Trivy scan containers in privileged mode when required by the host security policy
|
|`TRIVY\_RESOURCE\_LIMITS\_ENABLED`|
Setting`trivyResourceLimitsEnabled`
Enable CPU and memory limits for Trivy scan containers
|
|`TRIVY\_SECURITY\_OPTS`|
Setting`trivySecurityOpts`
Docker security options applied to Trivy scan containers. Use commas or new lines to separate entries (for example: label=disable)
|
|`VULNERABILITY\_SCAN\_ENABLED`|
Setting`vulnerabilityScanEnabled`
Enable scheduled vulnerability scanning of all Docker images
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env.
|
|`VULNERABILITY\_SCAN\_INTERVAL`|
Setting`vulnerabilityScanInterval`
How often to run scheduled vulnerability scans (cron expression)
Requires: AGENT\_MODE=true or UI\_CONFIGURATION\_DISABLED=true to manage this setting via env. VULNERABILITY\_SCAN\_ENABLED=true to have effect at runtime.
|
|`DOCKER\_API\_TIMEOUT`|
Setting`dockerApiTimeout`
Timeout for Docker list operations in seconds (default: 30)
|
|`DOCKER\_IMAGE\_PULL\_TIMEOUT`|
Setting`dockerImagePullTimeout`
Timeout for Docker image pulls in seconds (default: 600 = 10 minutes)
|
|`GIT\_OPERATION\_TIMEOUT`|
Setting`gitOperationTimeout`
Timeout for Git clone/fetch operations in seconds (default: 300 = 5 minutes)
|
|`HTTP\_CLIENT\_TIMEOUT`|
Setting`httpClientTimeout`
Default timeout for HTTP requests in seconds (default: 30)
|
|`PROXY\_REQUEST\_TIMEOUT`|
Setting`proxyRequestTimeout`
Timeout for proxied requests in seconds (default: 60)
|
|`REGISTRY\_TIMEOUT`|
Setting`registryTimeout`
Timeout for container registry operations in seconds (default: 30)
|
|`TRIVY\_SCAN\_TIMEOUT`|
Setting`trivyScanTimeout`
Timeout for Trivy image scans in seconds (default: 900 = 15 minutes)
|