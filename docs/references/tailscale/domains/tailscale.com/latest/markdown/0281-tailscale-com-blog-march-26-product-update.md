Tailscale Monthly Update: March 2026
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMarch 27, 2026
# This month at Tailscale for March 2026
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure—so you can stay on top of what’s new and what’s better.
Here's a rundown of what's changed in Tailscale's software since our [last blog update in late January 2026](https://tailscale.com/blog/january-26-product-update). There are changes to clients, integrations for new Tailscale features, and other updates. For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
## [Changes](#changes)
### [Tailscale Winter Update changes](#tailscale-winter-update-changes)
Tailscale added a number of new features [during Winter Update Week](https://tailscale.com/winter-update-week-26) in late Feburary 2026, including:
* [Aperture by Tailscale](https://tailscale.com/blog/aperture-partners-update?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026), an AI gateway that makes distributing AI access, and visualizing AI usage, much easier.
* [Tailscale Peer Relays](https://tailscale.com/blog/peer-relays-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026), [Tailscale Services](https://tailscale.com/blog/services-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026), and [workload identity federation](https://tailscale.com/blog/workload-identity-ga?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026) became generally available
* Kubernetes API proxy audit logging, actor identifiers in network flow logs, and identity-enriched SSH log logs on Linux [are now available](https://tailscale.com/blog/auditable-infrastructure-access?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)
* Device posture integrations for [Fleet](https://tailscale.com/blog/fleet-device-posture-integration?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026) and [Huntress](https://tailscale.com/blog/huntress-device-posture-integration?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026) are available.
* Log streaming support is extended to [Google Cloud Storage (GCS)](https://tailscale.com/blog/gcs-log-streaming?utm_source=lp&amp;utm_medium=content&amp;utm_campaign=tailscale-winter-update-2026)### [Windowed UI on macOS](#windowed-ui-on-macos)
Starting with version 1.96.2, the [macOS client now includes a windowed interface](https://tailscale.com/blog/macos-notch-escape), providing easier access to useful tools, network data, and tools like Taildrop and Tailscale ping.
## [Client updates](#client-updates)
### [v1.96.4](#v1964)
These notable changes are inclusive of all updates from versions 1.94.1 to 1.96.4. For detailed notes on each release, [see our changelog](https://tailscale.com/changelog).
#### [All platforms](#all-platforms)
* **Fixed: **Ping view is Tailscale Peer Relay aware (all platforms)
* **Changed: **Tailscale Services virtual IPs are now automatically accepted by clients across all platforms regardless of the status of the `--accept-routes` feature.
* **Changed: **Tailscale Peer Relays deliver improved throughput through monotonic time comparison optimizations and reduced lock contention.
* **Changed: **The `tailscale lock status -json` command returns tailnet key authority (TKA) data in a stable format.
* **New: **`--audience` flag added to `tailscale up` command to support auto generation of ID tokens for workload identity.
* **New: **Identity tokens are automatically generated for workload identities.
* **New: **`tailscaled\_peer\_relay\_forwarded\_packets\_total` and `tailscaled\_peer\_relay\_forwarded\_bytes\_total` client metrics are available for Tailscale Peer Relays.
* **New: **`tailscaled\_home\_derp\_region\_id` client metrics are available.
* **Fixed: **Memory leak caused by high network map response rates is resolved.
* **Changed: **For 1.96.x, Go is updated from version 1.25 to 1.26.`tailscale dns query|status` command supports `--json` flag to return JSON output.
* **New: **[`tailscale wait [flags]`](https://tailscale.com/docs/reference/tailscale-cli#wait) command waits for Tailscale resources to become available for binding.
* **New: **[`tailscale ip`](https://tailscale.com/docs/reference/tailscale-cli#ip) command supports `--assert=\<specific-ip-address\>` flag to assert that one or more of the node's IP addresses matches the specified IP address.
* **New: **[`tailscale version —track`](https://tailscale.com/docs/reference/tailscale-cli#version) and [`tailscale update --track`](https://tailscale.com/docs/reference/tailscale-cli#update) support `release-candidate` flag to check for and update to [release candidate builds](https://tailscale.com/docs/reference/tailscale-client-versions#release-candidate-track).
* **Fixed: **The `AuthKey` system policy applies only when a user is not in a logged in state.
* **Fixed: **UPnP routes as expected during long lived port mapping sessions scenarios, including hard NAT.### [Linux](#linux)
* An issue on forks of Linux caused by fallback-on-ENOSYS logic is resolved.
* An issue that could cause a segmentation violation during startup on MIPS devices is resolved.
* **New: **Launch the `systray` application on startup using autostart file with the `tailscale configure systray --enable-startup=freedesktop` command.
* **Changed: **Scaling of [Tailscale Peer Relays](https://tailscale.com/docs/features/peer-relay) UDP sockets is gated by container-aware GOMAXPROCS defaults.
* **Fixed: **Firewall rules created on Linux platforms correctly mark their traffic, avoiding [reverse path filtering](https://tailscale.com/docs/reference/reference-architectures/gcp#linux-vms-using-exit-nodes) dropping connections and producing health warnings and risk prompts.
* **Fixed: **OpenWrt versions 25.12.0 or later using apk as a package manager supports Tailscale updates.
* **New: **Custom DERP servers support Google Cloud Platform (GCP) Certificate Manager.
* **New: **[Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh) authentication, when successful, results in `LOGIN` audit messages being sent to the kernel audit subsystem.
* **Changed: **[Tailscale Peer Relay](https://tailscale.com/kb/1591/peer-relays) throughput is improved when the `SO\_REUSEPORT` socket option is supported on multi-core systems.
* **Fixed: **[Tailscale Peer Relay](https://tailscale.com/kb/1591/peer-relays) server handshake transmission is guarded against routing loops over Tailscale.
* **Fixed: **MagicDNS always resolves when using `resolve.conf` without a DNS manager.### [macOS](#macos)
* **New: **`AuthBrowser.macos` system policy sets a preferred browser for opening automatic authentication URLs.
* **New: **[`HideDockIcon`](https://tailscale.com/kb/1315/mdm-keys#hide-the-macos-dock-icon-after-all-windows-close) system policy determines if the Tailscale Dock icon persists after all Tailscale windows close.
* **New: **Install and automatically update to [release candidate](https://tailscale.com/kb/1168/versions#release-candidate-track) versions of the client in the **About** section, **Release Channel** drop-down.
* **Fixed: **DNS related health warnings no longer display when [Tailscale DNS](https://tailscale.com/kb/1054/dns) is disabled.
* **Fixed: **`tssentinelId` command injection vulnerability has been removed. This fix addresses a security vulnerability described in [TS-2026-001](https://tailscale.com/security-bulletins#ts-2026-001).
* **Fixed: **Ping view is [Tailscale Peer Relay](https://tailscale.com/kb/1591/peer-relays) aware.Windowed UI mode for macOS is generally available.
* **New: **Double click an account in the **Accounts** section to switch to that account.
* **New: **A progress dialog indicates Tailscale is waiting on the browser to complete reauthentication.
* **Fixed: **The [open source variant](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS) of Tailscale on macOS sets the [`node:osVersion`](https://tailscale.com/docs/features/device-posture#device-posture-attributes) attribute.
* **Fixed: **The [Taildrop](https://tailscale.com/docs/features/taildrop) [Send File](https://tailscale.com/docs/features/mac-ios-shortcuts#send-file) action and shortcut do not transmit empty files on macOS Tahoe (version 26) or later.
* **Fixed: **Tailscale data directories for the [macOS standalone version](https://tailscale.com/docs/concepts/macos-variants#standalone-variant) are excluded from Time Machine backups.
* **Fixed: **An issue that required a machine reboot after installing a Tailscale update is resolved.### [Windows](#windows)
* **Fixed: **[DNS](https://tailscale.com/docs/reference/dns-in-tailscale) resolution issue caused by NRPT rule formatting is resolved.### [iOS](#ios)
* **Changed: **iOS bug report ID displays in its entirety instead of being truncated.
* **Fixed: **The Taildrop Send File action and shortcut do not transmit empty files on iOS version 26 or later.### [Android](#android)
* **Fixed: **An issue causing a deadlock when disconnecting from a tailnet is resolved.### [tvOS](#tvos)
* **New: Use Tailscale Subnets** toggle is added in **Subnet Routing Settings**.### [Synology](#synology)
* **Fixed: **An issue on forks of Synology Linux cause by fallback-on-ENOSYS logic is resolved.### [Workload identiy federation](#workload-identiy-federation)
* **New: **[Workload identity federation](https://tailscale.com/kb/1581/workload-identity-federation) supports provider-native identity token authentication for [GitOps for Tailscale with GitHub Actions](https://tailscale.com/kb/1306/gitops-acls-github) and [GitOps for Tailscale with GitLab CI](https://tailscale.com/kb/1254/gitops-acls-gitlab).
* **New: **[Token exchange error](https://tailscale.com/kb/1581/workload-identity-federation#debugging-token-exchange-errors) details for a federated identity can be found in the **Trust credentials** page of the admin console.## [Container, Kubernetes, and `tsrecorder` updates](#container-kubernetes-and-tsrecorder-updates)
### [**Container image v1.94.1**](#container-image-v1941)
* **New: **[OAuth and workload identity federation](https://tailscale.com/docs/features/containers/docker#ts_client_id) support has been added for containers.### [**Kubernetes operator v1.94.2**](#kubernetes-operator-v1942)
* **Fixed: **Configuring a single invalid Tailscale FQDN for an egress will no longer cause the egress to crash. It will instead log the error and continuing serving traffic.
* **New: **The Egress proxy can now send traffic to Tailscale service VIPs.
* **New: **Use [Kubenetes API server proxy audit logging](https://tailscale.com/docs/features/kubernetes-operator/how-to/session-recording) [(beta)](https://tailscale.com/docs/reference/tailscale-release-stages#beta) to record Kubernetes API events on your cluster, in addition to or instead of entire recordings, that pass through your [Kubernetes Operator API server proxy](https://tailscale.com/docs/reference/kubernetes-operator-api-request-event-recording).
* **Fixed: **In high availability (HA) mode, the write replica no longer serves stale TLS certificates after renewal.
* **Fixed: **Setting container resources for the Tailscale container will no longer result in an invalid value error for “1Mi.”### [** tsrecorder v1.94.1**](#tsrecorder-v1941)
This version contains no changes except for library updates.
Those are the highlights for recent weeks. If you have questions or feedback, [we're here to help](https://tailscale.com/contact/support). Thank you for using Tailscale.
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