OIDC Single Sign-On
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
## Configure OIDC in the UI
The easiest way to set up OIDC is through Arcane's web interface:
1. Go to **Settings → Security → OIDC Authentication** in Arcane
2. Enter your OIDC provider details
3. Save and test the connection
4. The UI will guide you through any missing or invalid fields
OIDC users are created automatically the first time they sign in. You can disable local login if you want stricter security.
Arcane finds the OIDC endpoints automatically from the issuer URL and its `.well-known/openid-configuration` page. Make sure the issuer URL does not end with a trailing slash.
## Alternative: Environment Variables
You can also configure OIDC using environment variables:
### Primary Configuration
|Variable|Description|Value|
|`OIDC\_ENABLED`|Enable OIDC login|
Default:`false`
|
|`OIDC\_CLIENT\_ID`|Client ID from your OIDC provider|
Default:`—`
Example:`your\_arcane\_client\_id\_from\_provider`
|
|`OIDC\_CLIENT\_SECRET`|Client Secret from provider|
Default:`—`
Example:`your\_super\_secret\_client\_secret\_from\_provider`
|
|`OIDC\_ISSUER\_URL`|Issuer URL of your OIDC provider. No trailing slash.|
Default:`—`
Example:`https://your-provider.com`
|
|`OIDC\_SCOPES`|Scopes to request|
Default:`openid email profile`
|
|`OIDC\_ADMIN\_CLAIM`|Where to find the admin claim in the OIDC token|
Default:`—`
Example:`groups`
|
|`OIDC\_ADMIN\_VALUE`|Values to check in the OIDC\_ADMIN\_CLAIM to give a user admin access. Multiple values can be comma-separated.|
Default:`—`
Example:`\_admin\_group,\_admin\_group2`
|
|`OIDC\_MERGE\_ACCOUNTS`|Link OIDC logins to existing local accounts based on email address|
Default:`false`
|
|`OIDC\_SKIP\_TLS\_VERIFY`|Skip TLS verification for the OIDC provider (use with caution)|
Default:`false`
|
|`OIDC\_AUTO\_REDIRECT\_TO\_PROVIDER`|Automatically redirect users to the OIDC provider on login|
Default:`false`
|
|`OIDC\_PROVIDER\_NAME`|Provider display name shown on the login screen|
Default:`—`
|
|`OIDC\_PROVIDER\_LOGO\_URL`|Provider logo URL shown on the login screen|
Default:`—`
|
### Manual Endpoint Overrides (Advanced)
Use these if your OIDC provider does not support standard discovery via the Issuer URL.
|Variable|Description|Value|
|`OIDC\_AUTHORIZATION\_ENDPOINT`|Override/Manual authorization URL (e.g., https://provider.com/auth)|
Default:`—`
|
|`OIDC\_TOKEN\_ENDPOINT`|Override/Manual token URL (e.g., https://provider.com/token)|
Default:`—`
|
|`OIDC\_USERINFO\_ENDPOINT`|Override/Manual userinfo URL (e.g., https://provider.com/userinfo)|
Default:`—`
|
|`OIDC\_JWKS\_ENDPOINT`|Override/Manual JWKS URL for token verification (e.g., https://provider.com/jwks)|
Default:`—`
|
### Arcane Configuration Values
|Type|Value|Description|
|Redirect URI|`{APP\_URL}/auth/oidc/callback`|The URL to register with your OIDC provider|
## Admin Role Assignment
The `OIDC\_ADMIN\_CLAIM` and `OIDC\_ADMIN\_VALUE` settings let Arcane make certain users admins based on information in their login token.
* **OIDC\_ADMIN\_CLAIM**: the part of the login token to check, such as `groups` or `roles`
* **OIDC\_ADMIN\_VALUE**: the value or values that should grant admin access. Use commas for more than one value, such as `arcane-admins,super-users`
When someone signs in, Arcane checks whether their token contains the matching value. If it does, they become an admin.
> [!IMPORTANT]The claim you want to use, such as
`> groups
`> , must be included in
`> OIDC_SCOPES
`> . For example, if you want group membership to control admin access, make sure your scopes include
`> groups
`> :
`> openid email profile groups
`
## Example Compose Configuration
`services:
arcane:
# ... image, ports, volumes ...
environment:
# ....
- OIDC\_ENABLED=true
- OIDC\_CLIENT\_ID="your\_arcane\_client\_id\_from\_provider"
- OIDC\_CLIENT\_SECRET="your\_super\_secret\_client\_secret\_from\_provider"
- OIDC\_ISSUER\_URL="https://auth.example.com"
- OIDC\_SCOPES=openid email profile groups
- OIDC\_ADMIN\_CLAIM=groups
- OIDC\_ADMIN\_VALUE=\_arcane\_admins
- OIDC\_MERGE\_ACCOUNTS=true
`