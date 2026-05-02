Docker configuration parameters · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Docker configuration parameters
Last validated: Mar 23, 2026
Configuration parameters are passed as environment variables in your container definition. These parameters control how a Tailscale container authenticates to your tailnet, manages networking, and exposes services.
You can use parameters to configure authentication methods, enable features like DNS, metrics, and health checks, advertise routes, or forward traffic to other services. Set these variables in your Docker configuration (such as Docker run, Compose, or Kubernetes manifests) to customize how the container joins and operates within your tailnet.
## [TS\_ACCEPT\_DNS](#ts_accept_dns)
Accept [DNS configuration](/docs/reference/dns-in-tailscale) from the Tailscale admin console. Defaults to not accepted. Enable this if you want your container to use [MagicDNS](/docs/features/magicdns) and custom DNS settings from your tailnet. Without this, the container uses Docker's default DNS configuration.
## [TS\_AUDIENCE](#ts_audience)
The audience to use when requesting an ID token from a well-known identity provider for workload identity federation. Use this parameter in environments that support automatic ID token generation, such as GitHub Actions, Google Cloud, or AWS. You must use this with `TS\_CLIENT\_ID`.
You cannot use this parameter with `TS\_CLIENT\_SECRET` or `TS\_ID\_TOKEN`.
## [TS\_AUTH\_ONCE](#ts_auth_once)
Controls login behavior. Set to false by default, which forces login every time the container starts. Set `TS\_AUTH\_ONCE=true` to log in only if the container isn't already authenticated. Use this when you're persisting state and don't want unnecessary re-authentication.
## [TS\_AUTHKEY](#ts_authkey)
Authenticates a container to your tailnet. Create an [authentication key](/docs/features/access-control/auth-keys) in the Tailscale admin console, then paste it here. This is equivalent to what you would pass to [`tailscale login --auth-key=`](/docs/reference/tailscale-cli#login). You can also use an [OAuth client](/docs/features/oauth-clients#register-new-nodes-using-oauth-credentials) secret here, but you must provide the associated tag using `TS\_EXTRA\_ARGS=--advertise-tags=tag:ci`.
To mark a containerized node as ephemeral (automatically removed when disconnected), append `?ephemeral=true` to the auth key or OAuth client secret. Use this for temporary containers or CI/CD environments.
You cannot use this parameter with `TS\_CLIENT\_ID`, `TS\_CLIENT\_SECRET`, `TS\_ID\_TOKEN`, or `TS\_AUDIENCE`.
## [TS\_CLIENT\_ID](#ts_client_id)
The OAuth client ID for authentication. You can use it alone (for example, when an ID token auto-generates in well-known environments like GitHub Actions), with `TS\_CLIENT\_SECRET` for OAuth authentication, with `TS\_ID\_TOKEN` for [workload identity federation](/docs/features/workload-identity-federation), or with `TS\_AUDIENCE` for automatic ID token generation in supported environments.
If the value begins with `file:`, Tailscale treats it as a path to a file containing the client ID.
## [TS\_CLIENT\_SECRET](#ts_client_secret)
The OAuth client secret for generating auth keys. You must use this with `TS\_CLIENT\_ID` for OAuth authentication. If the value begins with `file:`, Tailscale treats it as a path to a file containing the secret. This is more secure than embedding secrets directly in your setup. You cannot use this parameter with `TS\_ID\_TOKEN` or `TS\_AUDIENCE`.
## [TS\_DEST\_IP](#ts_dest_ip)
Proxies all incoming Tailscale traffic to the specified destination IP.
Use this when you want all traffic that reaches your Tailscale container to forward to a specific service. For example, `TS\_DEST\_IP=100.0.0.5` sends all traffic to that IP address.
## [TS\_ENABLE\_HEALTH\_CHECK](#ts_enable_health_check)
This functionality is available in Tailscale 1.78 and later.
Set to true to enable an unauthenticated `/healthz` endpoint at the address you specify with `TS\_LOCAL\_ADDR\_PORT`. The health check returns `200 OK` if the node has at least one tailnet IP address. Otherwise it returns `503`. Use this for container orchestration health checks.
## [TS\_ENABLE\_METRICS](#ts_enable_metrics)
This functionality is available in Tailscale 1.78 and later.
Set to true to enable an unauthenticated `/metrics` endpoint at the address you specify with `TS\_LOCAL\_ADDR\_PORT`. Refer to [client metrics](/docs/reference/tailscale-client-metrics) for more information about the available metrics. This is useful for monitoring your Tailscale container's performance and connection status.
## [TS\_HEALTHCHECK\_ADDR\_PORT](#ts_healthcheck_addr_port)
This functionality is deprecated in Tailscale 1.78 and later. Use `TS\_ENABLE\_HEALTH\_CHECK` instead.
## [TS\_HOSTNAME](#ts_hostname)
Sets a custom hostname for your container on the tailnet. Without this, Docker generates a random hostname. This is equivalent to [`tailscale set --hostname=`](/docs/reference/tailscale-cli#set). For example, `TS\_HOSTNAME=my-dev-database` makes your container accessible at my-dev-database in your tailnet.
## [TS\_ID\_TOKEN](#ts_id_token)
The ID token from the identity provider for [workload identity federation](/docs/features/workload-identity-federation). You must use this with `TS\_CLIENT\_ID`. If the value begins with `file:`, Tailscale treats it as a path to a file containing the token.
You cannot use this parameter with `TS\_CLIENT\_SECRET` or `TS\_AUDIENCE`.
## [TS\_KUBE\_SECRET](#ts_kube_secret)
If you're running in Kubernetes, this is the Kubernetes name where Tailscale stores state. Defaults to `tailscale`. If you don't set `TS\_AUTHKEY`, and `TS\_KUBE\_SECRET` contains a secret with an auth key field, Tailscale uses that key as the auth key.
## [TS\_LOCAL\_ADDR\_PORT](#ts_local_addr_port)
This functionality is available in Tailscale 1.78 and later.
Specifies the `[\<addr\>]:\<port\>` where Tailscale serves local metrics and health check HTTP endpoints if you enable them through `TS\_ENABLE\_METRICS` or `TS\_ENABLE\_HEALTH\_CHECK`. Defaults to `[::]:9002` on all available interfaces.
## [TS\_OUTBOUND\_HTTP\_PROXY\_LISTEN](#ts_outbound_http_proxy_listen)
Sets an address and port for the [HTTP proxy](/docs/concepts/userspace-networking#socks5-vs-http). Tailscale passes this to `tailscaled --outbound-http-proxy-listen=`. For example, `TS\_OUTBOUND\_HTTP\_PROXY\_LISTEN=:8080` creates an HTTP proxy on port `8080`, which is equivalent to `tailscaled --outbound-http-proxy-listen=:8080`.
## [TS\_ROUTES](#ts_routes)
Advertises [subnet routes](/docs/features/subnet-routers) so other devices in your tailnet can reach networks accessible from this container. This is equivalent to [`tailscale set --advertise-routes=`](/docs/reference/tailscale-cli#set). For example, `TS\_ROUTES=192.168.1.0/24` lets other tailnet devices access your local network through this container.
To accept routes advertised by other nodes, use `TS\_EXTRA\_ARGS` to pass in `--accept-routes`.
## [TS\_SERVE\_CONFIG](#ts_serve_config)
Accepts a JSON file to programmatically configure [Tailscale Serve](/docs/reference/tailscale-cli/serve) and [Tailscale Funnel](/docs/reference/tailscale-cli/funnel) functionality. Use [`tailscale serve status --json`](/docs/reference/tailscale-cli/serve) to export your current configuration in the correct format. If you bind mount this file using a Docker volume, you must mount it as a directory (not an individual file) for Tailscale to correctly detect configuration updates.
## [TS\_SOCKET](#ts_socket)
The Unix socket path where the tailscaled LocalAPI socket lives. Defaults to `/var/run/tailscale/tailscaled.sock`. This is equivalent to `tailscaled tailscale --socket=`. You typically don't need to change this unless you have specific socket path requirements.
## [TS\_SOCKS5\_SERVER](#ts_socks5_server)
Sets an address and port for the [SOCKS5 proxy](/docs/concepts/userspace-networking#socks5-vs-http). Tailscale passes this to `tailscaled --socks5-server=`. For example, `TS\_SOCKS5\_SERVER=:1055` creates a SOCKS5 proxy on port `1055`, which is equivalent to `tailscaled --socks5-server=:1055`.
## [TS\_STATE\_DIR](#ts_state_dir)
Specifies where `tailscaled` stores its state. The `TS\_STATE\_DIR` volume ensures the container keeps its identity across restarts. Without it, each restart creates a new node in the admin console. This directory must persist across container restarts or your container will appear as a new node each time. Tailscale passes this to `tailscaled --statedir=`. For example, `TS\_STATE\_DIR=/var/lib/tailscale` stores state in that directory, which you should mount as a volume.
When running on Kubernetes, Tailscale stores state by default in the Kubernetes secret with `name:tailscale`. To store state on local disk instead, set `TS\_KUBE\_SECRET=""` and `TS\_STATE\_DIR=/path/to/storage/dir`.
## [TS\_TAILNET\_TARGET\_FQDN](#ts_tailnet_target_fqdn)
Proxies all incoming non-Tailscale traffic to the specified tailnet FQDN. Functions like `TS\_TAILNET\_TARGET\_IP` but resolves a MagicDNS name instead of using a static IP. Not compatible with `TS\_USERSPACE` mode. Cannot be used together with `TS\_TAILNET\_TARGET\_IP`.
## [TS\_TAILNET\_TARGET\_IP](#ts_tailnet_target_ip)
Proxies all incoming non-Tailscale traffic to the specified destination IP within the tailnet. This sets up the container as an egress proxy, forwarding traffic from outside the tailnet to a Tailscale IP. Not compatible with `TS\_USERSPACE` mode. Cannot be used together with `TS\_TAILNET\_TARGET\_FQDN`.
## [TS\_USERSPACE](#ts_userspace)
Controls whether to use [userspace networking](/docs/concepts/userspace-networking#socks5-vs-http) instead of kernel networking. Enabled by default. This is equivalent to `tailscaled --tun=userspace-networking`.
Userspace networking works everywhere but has lower performance. Set `TS\_USERSPACE=false` to use kernel networking for better speed, but you'll also need to add devices and `cap\_add` sections to setup. Kernel networking provides better performance but requires `/dev/net/tun` and additional capabilities.
## [Extra arguments](#extra-arguments)
The parameters above cover common Tailscale configurations, but Tailscale supports many additional CLI flags. Use the extra arguments parameters below to pass any flags that don't have dedicated parameters. For example, if you want to advertise your container as an exit node or enable SSH, you can pass those flags through `TS\_EXTRA\_ARGS` since they don't have specific `TS\_` parameters.
## [TS\_EXTRA\_ARGS](#ts_extra_args)
Pass other Tailscale CLI flags you want to use with the [`tailscale up`](/docs/reference/tailscale-cli#up) command. For example, `TS\_EXTRA\_ARGS=--advertise-exit-node --ssh`.
## [TS\_TAILSCALED\_EXTRA\_ARGS](#ts_tailscaled_extra_args)
Pass other Tailscale CLI flags you want to use with the [`tailscaled`](/docs/reference/tailscaled#flags-to-tailscaled) command. For example, `TS\_TAILSCALED\_EXTRA\_ARGS=--verbose=2`.
## [Experimental parameters](#experimental-parameters)
`TS\_EXPERIMENTAL` parameters are subject to change and should not be considered as permanently supported.
## [TS\_EXPERIMENTAL\_SERVICE\_AUTO\_ADVERTISEMENT](#ts_experimental_service_auto_advertisement)
This functionality is available in Tailscale v1.96 and later.
For `containerboot` instances not running in Kubernetes, this parameter handles the automatic advertisement of any [Tailscale Services](/docs/features/tailscale-services) defined in the Serve configuration on startup and un-advertises on shutdown.
Defaults to `true` but can be disabled to allow user-specific advertisement configuration.
This addresses a change in default behavior. Previously, service advertisement had to be enabled manually for each container and did not persist across restarts. This parameter can be used to restore previous behavior for scenarios that require it.
```
`TS\_EXPERIMENTAL\_SERVICE\_AUTO\_ADVERTISEMENT=false
`
```
On this page
* [TS\_ACCEPT\_DNS](#ts_accept_dns)
* [TS\_AUDIENCE](#ts_audience)
* [TS\_AUTH\_ONCE](#ts_auth_once)
* [TS\_AUTHKEY](#ts_authkey)
* [TS\_CLIENT\_ID](#ts_client_id)
* [TS\_CLIENT\_SECRET](#ts_client_secret)
* [TS\_DEST\_IP](#ts_dest_ip)
* [TS\_ENABLE\_HEALTH\_CHECK](#ts_enable_health_check)
* [TS\_ENABLE\_METRICS](#ts_enable_metrics)
* [TS\_HEALTHCHECK\_ADDR\_PORT](#ts_healthcheck_addr_port)
* [TS\_HOSTNAME](#ts_hostname)
* [TS\_ID\_TOKEN](#ts_id_token)
* [TS\_KUBE\_SECRET](#ts_kube_secret)
* [TS\_LOCAL\_ADDR\_PORT](#ts_local_addr_port)
* [TS\_OUTBOUND\_HTTP\_PROXY\_LISTEN](#ts_outbound_http_proxy_listen)
* [TS\_ROUTES](#ts_routes)
* [TS\_SERVE\_CONFIG](#ts_serve_config)
* [TS\_SOCKET](#ts_socket)
* [TS\_SOCKS5\_SERVER](#ts_socks5_server)
* [TS\_STATE\_DIR](#ts_state_dir)
* [TS\_TAILNET\_TARGET\_FQDN](#ts_tailnet_target_fqdn)
* [TS\_TAILNET\_TARGET\_IP](#ts_tailnet_target_ip)
* [TS\_USERSPACE](#ts_userspace)
* [Extra arguments](#extra-arguments)
* [TS\_EXTRA\_ARGS](#ts_extra_args)
* [TS\_TAILSCALED\_EXTRA\_ARGS](#ts_tailscaled_extra_args)
* [Experimental parameters](#experimental-parameters)
* [TS\_EXPERIMENTAL\_SERVICE\_AUTO\_ADVERTISEMENT](#ts_experimental_service_auto_advertisement)
Scroll to top