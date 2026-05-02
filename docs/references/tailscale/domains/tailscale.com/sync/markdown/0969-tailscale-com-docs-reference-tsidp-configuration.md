tsidp configuration · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# tsidp configuration
Last validated: Mar 10, 2026
The following content describes the various configuration settings for [`tsidp`](/docs/features/tsidp).
## [tsidp configuration flags](#tsidp-configuration-flags)
You can pass in the following configuration flags to `tsidp`:
* `-dir \<path\>` (string): Directory path to save [`tsnet`](/docs/features/tsnet) and `tsidp` state. We recommend you set `-dir` to a specific path. Defaults to `""` (an empty string).
* `-hostname \<hostname\>` (string): Hostname to use for the `tsidp` instance on your tailnet. This defines the `\<hostname\>` portion of the `tsidp` instance's full DNS name, `\<hostname\>.\<your-tailnet\>.ts.net`. Defaults to `idp`.
* `-port \<port\>` (number): Port to listen on. Defaults to `443`.
* `-local-port \<port\>`: Local port to listen on, `localhost:\<port\>`. Useful for testing. Defaults to `disabled`.
* `-use-local-tailscaled` (boolean): Whether to use local [`tailscaled`](/docs/reference/tailscaled) instead of `tsnet`. Defaults to `false`.
* `-funnel`: Whether to use [Tailscale Funnel](/docs/features/tailscale-funnel) to make `tsidp` available on the public internet so it works with Software as a Service (SaaS) products. Defaults to `disabled`.
* `-enable-sts`: Whether to enable OAuth token exchange using the [RFC 8693](https://www.rfc-editor.org/rfc/rfc8693.html) OAuth 2.0 Token Exchange protocol. Defaults to `disabled`.
* `-log \<level\>` (string): The logging level. Can be one of: `debug`, `info`, `warn`, `error`. Defaults to `info`.
* `-debug-all-requests` (boolean): Print all requests and responses. Useful during development. Defaults to `disabled`.
* `-debug-tsnet` (string): Enable debug level logging with `tsnet` connections. Useful during development. Defaults to `disabled`.
## [tsidp CLI environment variables](#tsidp-cli-environment-variables)
The `tsidp` binary is configured through the [`tsidp` configuration flags](#tsidp-configuration-flags). However, there are several environment variables that configure the libraries that `tsidp` uses to connect to the tailnet.
### [Required](#required)
#### [TAILSCALE\_USE\_WIP\_CODE](#tailscale_use_wip_code)
Whether to use work in progress (WIP) code. Required while `tsidp` is in development, that is, until version 1.0.0 is released. Must be set to `1`.
```
`TAILSCALE\_USE\_WIP\_CODE=1
`
```
### [Optional](#optional)
The following environment variables are used when `tsidp` does not have any state information set by the `-dir \<path\>` flag.
`tsidp` requires persistent state storage to function properly in production. Without a persistent path specified by the `-dir` flag, the `tsidp` instance will re-register with Tailscale on every restart, lose dynamic OIDC client registrations, and invalidate user sessions. Serverless environments without persistent storage are not recommended for production use.
#### [TS\_AUTHKEY](#ts_authkey)
Key for registering a `tsidp` instance as a new device in your tailnet. This can be an [auth key](/docs/features/access-control/auth-keys) or an [OAuth client](/docs/features/oauth-clients) secret. If omitted, a Tailscale login URL will be printed for manual login.
```
`TS\_AUTHKEY=\<key\>
`
```
#### [TS\_ADVERTISE\_TAGS](#ts_advertise_tags)
Comma-separated set of [tags](/docs/features/tags) to advertise for the `tsidp` instance. For example: `"tag:tsidp,tag:server"`. Optional, but required when using OAuth client secrets.
```
`TS\_ADVERTISE\_TAGS=\<tags\>
`
```
#### [TSNET\_FORCE\_LOGIN](#tsnet_force_login)
Whether to force re-login of the `tsidp` node. Useful during development.
```
`TSNET\_FORCE\_LOGIN=1
`
```
## [Docker environment variables](#docker-environment-variables)
The `tsidp` Docker image exposes the CLI flags through environment variables. If an environment variable is omitted, `tsidp` uses the default values set by the [`tsidp` configuration flags](#tsidp-configuration-flags).
`TS\_STATE\_DIR` and `TS\_HOSTNAME` are legacy environment variable names. These will be replaced by `TSIDP\_STATE\_DIR` and `TSIDP\_HOSTNAME` in the future.
### [TS\_STATE\_DIR](#ts_state_dir)
Directory path to save `tsnet` and `tsidp` state.
If not set, `tsidp` uses the `-dir` CLI flag.
```
`TS\_STATE\_DIR=\<path\>
`
```
In the future, `TSIDP\_STATE\_DIR` will replace `TS\_STATE\_DIR`.
### [TS\_HOSTNAME](#ts_hostname)
Hostname to use for the `tsidp` instance on your tailnet. This defines the `\<hostname\>` portion of the `tsidp` instance's full DNS name, `\<hostname\>.\<your-tailnet\>.ts.net`.
If not set, `tsidp` uses the `-hostname` CLI flag.
```
`TS\_HOSTNAME=\<hostname\>
`
```
In the future, `TSIDP\_HOSTNAME` will replace `TS\_HOSTNAME`.
### [TSIDP\_PORT](#tsidp_port)
Port to listen on.
If not set, `tsidp` uses the `-port` CLI flag.
```
`TSIDP\_PORT=\<port\>
`
```
### [TSIDP\_LOCAL\_PORT](#tsidp_local_port)
Local port, `localhost:\<port\>`, to listen on. Useful for development and testing.
If not set, `tsidp` uses the `-local-port` CLI flag.
```
`TSIDP\_LOCAL\_PORT=\<port\>
`
```
### [TSIDP\_USE\_FUNNEL](#tsidp_use_funnel)
Whether to use [Tailscale Funnel](/docs/features/tailscale-funnel) to make `tsidp` available on the public internet so it works with Software as a Service (SaaS) products.
If not set, `tsidp` uses the `-funnel` CLI flag.
```
`TSIDP\_USE\_FUNNEL=1
`
```
### [TSIDP\_ENABLE\_STS](#tsidp_enable_sts)
Whether to enable OAuth token exchange using the [RFC 8693](https://www.rfc-editor.org/rfc/rfc8693.html) OAuth 2.0 Token Exchange protocol.
If not set, `tsidp` uses the `-enable-sts` CLI flag.
```
`TSIDP\_ENABLE\_STS=1
`
```
### [TSIDP\_LOG](#tsidp_log)
The logging level. Can be one of: `debug`, `info`, `warn`, `error`.
If not set, `tsidp` uses the `-log` CLI flag.
```
`TSIDP\_LOG=\<level\>
`
```
### [TSIDP\_DEBUG\_TSNET](#tsidp_debug_tsnet)
Enable debug level logging with `tsnet` connection. Useful during development.
If not set, `tsidp` uses the `-debug-tsnet` CLI flag.
```
`TSIDP\_DEBUG\_TSNET=1
`
```
### [TSIDP\_DEBUG\_ALL\_REQUESTS](#tsidp_debug_all_requests)
Print all requests and responses. Useful during development.
If not set, `tsidp` uses the `-debug-all-requests` CLI flag.
```
`TSIDP\_DEBUG\_ALL\_REQUESTS=1
`
```
### [TS\_AUTHKEY](#ts_authkey-1)
Key for registering a `tsidp` instance as a new device in your tailnet. This can be an [auth key](/docs/features/access-control/auth-keys) or an [OAuth client](/docs/features/oauth-clients) secret. If omitted, a Tailscale login URL will be printed for manual login.
There is no corresponding `tsidp` CLI flag.
```
`TS\_AUTHKEY=\<auth-key\>
`
```
### [TS\_ADVERTISE\_TAGS](#ts_advertise_tags-1)
Comma-separated set of [tags](/docs/features/tags) to advertise for the `tsidp` instance. For example: `"tag:tsidp,tag:server"`. Optional, but required when using OAuth client secrets.
There is no corresponding `tsidp` CLI flag.
```
`TS\_ADVERTISE\_TAGS=\<tags\>
`
```
On this page
* [tsidp configuration flags](#tsidp-configuration-flags)
* [tsidp CLI environment variables](#tsidp-cli-environment-variables)
* [Required](#required)
* [TAILSCALE\_USE\_WIP\_CODE](#tailscale_use_wip_code)
* [Optional](#optional)
* [TS\_AUTHKEY](#ts_authkey)
* [TS\_ADVERTISE\_TAGS](#ts_advertise_tags)
* [TSNET\_FORCE\_LOGIN](#tsnet_force_login)
* [Docker environment variables](#docker-environment-variables)
* [TS\_STATE\_DIR](#ts_state_dir)
* [TS\_HOSTNAME](#ts_hostname)
* [TSIDP\_PORT](#tsidp_port)
* [TSIDP\_LOCAL\_PORT](#tsidp_local_port)
* [TSIDP\_USE\_FUNNEL](#tsidp_use_funnel)
* [TSIDP\_ENABLE\_STS](#tsidp_enable_sts)
* [TSIDP\_LOG](#tsidp_log)
* [TSIDP\_DEBUG\_TSNET](#tsidp_debug_tsnet)
* [TSIDP\_DEBUG\_ALL\_REQUESTS](#tsidp_debug_all_requests)
* [TS\_AUTHKEY](#ts_authkey-1)
* [TS\_ADVERTISE\_TAGS](#ts_advertise_tags-1)
Scroll to top