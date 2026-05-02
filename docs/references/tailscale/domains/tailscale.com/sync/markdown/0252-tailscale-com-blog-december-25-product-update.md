Tailscale Monthly Update: December 2025
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productDecember 19, 2025
# This month at Tailscale for December 2025
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure—so you can stay on top of what’s new and what’s better.
Here's a rundown of what's changed in Tailscale's software lately. There are fixes, changes, updates to some of the latest features ([announced during Fall Update Week](https://tailscale.com/blog/fall-update-week-25-wrap)), and more. For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
*Note: This month's post will cover November and most of December 2025, owing to awkward back-to-back U.S. holiday timing.*
## [Changes](#changes)
### [IP changes to Tailscale's logging infrastructure](#ip-changes-to-tailscales-logging-infrastructure)
The domain `log.tailscale.com` resolves to static IP address ranges registered and managed by Tailscale. If IP-based rules are required for your firewall, use the IPv4 range `199.165.136.0/24` and the IPv6 range `2606:B740:1::/48.`
For more on configuring firewall rules (which most setups do not require), see our [documentation on firewall ports](https://tailscale.com/kb/1082/firewall-ports).
## [Client updates](#client-updates)
We released a series of updates and fixes to improve security and stability across all platforms. This summary covers versions 1.90.6 through 1.92.3.
### [Tailscale v1.92.3](#tailscale-v1923)
#### [All platforms](#all-platforms)
* Routes no longer stall and fail to apply when updated repeatedly in a short period of time
* Panic issue related to Peer Relays resolved
* Deadlock issue no longer occurs when handling Peer Relays endpoint allocation requests
* Memory leak in Peer Relays is resolved
* `tailscaled` no longer deadlocks during event bursts
* The client no longer hangs after wake up when [port mapping](https://tailscale.com/kb/1411/device-connectivity#port-mapping) is in use and interfaces are slow to become available
* [Tailscale Funnel](https://tailscale.com/kb/1223/funnel) and [Tailscale Serve](https://tailscale.com/kb/1312/serve) support the PROXY protocol
* [Tailscale Peer Relays](https://tailscale.com/kb/1591/peer-relays) can use static endpoints using the [`tailscale set`](https://tailscale.com/kb/1080/cli#set) command with the `--relay-server-static-endpoints` flag.
* Tailscale Services can be configured to use a remote target as a service destination
* Nodes can authenticate using [workload identity federation](https://tailscale.com/kb/1581/workload-identity-federation) with the [`tailscale up`](https://tailscale.com/kb/1241/tailscale-up) command flags `--client-id` and `--id-token`
* Network flow logs automatically record node information about itself and peers it communicates with.
* [Tailnet Lock](https://tailscale.com/kb/1226/tailnet-lock) command [`tailscale lock log --json`](https://tailscale.com/kb/1243/tailscale-lock#lock-log) response returns [Authority Update Messages](https://tailscale.com/kb/1230/tailnet-lock-whitepaper#authority-update-messages-aums) (AUMs) in a more stable format
* Tailscale Peer Relay endpoint advertisements include more candidate `IP:port` pairs
* Tailscale Peer Relays support multiple, forward bind packets per handshake generation, which improves path selection and chances of completing a handshake
* App connector routes no longer stall and fail to apply when updated repeatedly in a short period of time
* [WireGuard](https://tailscale.com/kb/1035/wireguard) configuration that occurs automatically in the client, no longer results in a panic#### [macOS](#macos)
* Connectivity issue related to sleep and wake is resolved
* [Taildrop](https://tailscale.com/kb/1106/taildrop) works as expected using the macOS **Share** option
* Redundant label text for VoiceOver is removed from the exit node picker
* [Tailscale system extension](https://tailscale.com/kb/1340/macos-sysext) no longer fails to install during an upgrade#### [Linux](#linux)
* Nodes without the [`tailscaled --statedir`](https://tailscale.com/kb/1278/tailscaled#flags-to-tailscaled) flag or the [`TS\_STATE\_DIR`](https://tailscale.com/kb/1282/docker#ts_state_dir) environment variable no longer fail to enforce signing checks in tailnets with [Tailnet Lock](https://tailscale.com/kb/1226/tailnet-lock) enabled. This fix addresses a security vulnerability described in [TS-2025-008](https://tailscale.com/security-bulletins#ts-2025-008).#### [iOS](#ios)
* [Taildrop](https://tailscale.com/kb/1106/taildrop) supported nodes are shown in Device Details
* Redundant label text for VoiceOver is removed from the exit node picker#### [Android](#android)
* [DNS](https://tailscale.com/kb/1054/dns) continues working when switching from cellular to Wi-Fi connections
* An issue in [custom control servers](https://tailscale.com/kb/1507/custom-control-server) (Headscale) that could result in connectivity problems is resolved.## [Container, Kubernetes, and `tsrecorder` updates](#container-kubernetes-and-tsrecorder-updates)
These summaries cover versions 1.90.6 through 1.92.4. There are library updates, in addition to these fixes and changes.
### [**Container image v1.92.4**](#container-image-v1924)
* Nodes without the [`tailscaled --statedir`](https://tailscale.com/kb/1278/tailscaled#flags-to-tailscaled) flag or the [`TS\_STATE\_DIR`](https://tailscale.com/kb/1282/docker#ts_state_dir) environment variable no longer fail to enforce signing checks in tailnets with [Tailnet Lock](https://tailscale.com/kb/1226/tailnet-lock) enabled. This fix addresses a security vulnerability described in [TS-2025-008](https://tailscale.com/security-bulletins#ts-2025-008).
* [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) no longer deadlocks during event bursts
* The client no longer hangs after wake up when [port mapping](https://tailscale.com/kb/1411/device-connectivity#port-mapping) is in use and interfaces are slow to become available
* `iptables` can be used on hosts that don't support `nftables`, as expected
* Ensure errors for background certificate renewal failures are logged.### [**Kubernetes operator v1.92.4**](#kubernetes-operator-v1924)
* The operator supports [workload identity federation](https://tailscale.com/kb/1236/kubernetes-operator#installation-with-workload-identity-federation) for authenticating to a tailnet using provider-native identity tokens
* `tailscale.com/http-redirect` annotation can be applied to Ingress resources for enabling HTTP to HTTPS redirects
* The operator defaults to using the stable image for nameservers deployed using the `DNSConfig` resource
* Recorder resources can specify a replica count for highly available deployments. Using multiple replicas requires using an S3 storage backend
* ArgoCD compatibility is improved. You can use both boolean and string values when setting the `apiServerProxyConfig.mode` and `apiServerProxyConfig.allowImpersonation` values.
* The operator correctly reconciles managed Ingresses sharing the same namespace as other unmanaged Ingresses
* `ProxyGroup` backed ingresses no longer get stuck during deletion if they use a Tailscale Service that had been deleted### [** tsrecorder v1.92.4**](#tsrecorder-v1924)
* `tsrecorder` can use a file containing an [auth key](https://tailscale.com/kb/1085/auth-keys) for authentication using the `TS\_AUTHKEY\_FILE` environment variable
Those are the highlights for the last two months. If you have questions or feedback, [we're here to help](https://tailscale.com/contact/support). Thank you for using Tailscale.
Share
Author
Kevin Purdy
Author
Kevin Purdy
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)