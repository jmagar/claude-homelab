Tailscale Monthly Update: October 2025
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productOctober 31, 2025
# This month at Tailscale: Fall Updates, GitHub Actions, and Tailnet name types
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure—so you can stay on top of what’s new and what’s better.
This month's updates include all the features announced during [Tailscale's Fall Update Week](<https://tailscale.com/fall-update-week-25?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=fall-update-2025 >), an updated GitHub Action, plus other improvements. For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
## [Tailscale GitHub Action v4.0.0](#tailscale-github-action-v400)
[Tailscale's GitHub Action](https://tailscale.com/kb/1276/tailscale-github-action), rewritten in TypeScript, added a number of improvements. It supports a `ping` parameter to verify tailnet connections, can [log out](https://tailscale.com/kb/1080/cli#logout) ephemeral nodes after CI runs, and has improved its logging efficiency.
## [Tailscale Services (beta)](#tailscale-services-beta)
[Tailscale Services](https://tailscale.com/kb/1552/tailscale-services), allows for the creation and management of dedicated applications and services on your tailnet, without tying them to any one device. (Blog)
## [Tailscale Peer Relays (beta)](#tailscale-peer-relays-beta)
[Tailscale Peer Relays](https://tailscale.com/kb/1591/peer-relays) allow for controlling your own UDP-based relays, providing high-performance traffic routing inside hard firewalls and cloud infrastructure. ([Blog](https://tailscale.com/blog/peer-relays-beta))
## [Multiple tailnets (alpha)](#multiple-tailnets-alpha)
Administrators can now create [multiple tailnets](https://tailscale.com/kb/1509/multiple-tailnets) inside one organization, while utilizing a common identity provider and domain, for sandboxing, staging, and other uses. ([Blog](https://tailscale.com/blog/multiple-tailnets-alpha))
## [Workload identity federation (beta)](#workload-identity-federation-beta)
[Workload identity federation](https://tailscale.com/kb/1581/workload-identity-federation) simplifies the creation of agents and workloads in infrastructure and CI/CD environments, utilizing Tailscale identity data instead of managing keys and secrets. ([Blog](https://tailscale.com/blog/workload-identity-beta))
## [Visual policy editor (GA)](#visual-policy-editor-ga)
The [visual policy editor](https://tailscale.com/kb/1550/visual-editor), which allows for creating and editing policies with browser-based controls and search, is now generally available.
## [Tailnet name types](#tailnet-name-types)
Changes have been made to Tailscale's admin console to reflect new naming tools, and better support multiple tailnets.
* **Display name** is an optional field that lets you assign a custom display name to your tailnet that appears in the admin console, client UI, and client CLI, instead of your domain or email address.
* **Tailnet ID **should be used in the `tailnetId` field for Tailscale API path parameters instead of your organization name.
* **Legacy ID** has replaced the Organization field in the console. Organization field will continue to display for existing tailnets but will not display for newly created tailnets.## [Client updates](#client-updates)
We released a series of updates and fixes to improve security and stability across all platforms.
### [Tailscale v1.88.4 to v1.90.5](#tailscale-v1884-to-v1905)
#### [All platforms](#all-platforms)
* A deadlock issue no longer occurs in the client when checking for the network to be available.
* [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) shuts down as expected and without panic.
* Clients can use configured DNS resolvers for all domains even when the client also uses an exit node using the nameserver settings in the **DNS** page of the admin console.
* [Node keys](https://tailscale.com/kb/1010/node-keys) will be renewed seamlessly, so clients will maintain existing connections while re-authenticating.#### [Linux](#linux)
* [Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh) no longer hangs for 10s when connecting to `tsrecorder`. This affected tailnets that use [Tailscale SSH recording](https://tailscale.com/kb/1246/tailscale-ssh-session-recording).
* [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) no longer sporadically panics when a [Trusted Platform Module](https://tailscale.com/kb/1596/secure-node-state-storage) (TPM) device is present.
* [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) starts up as expected in a no router configuration environment.An `iptables` regression on non-amd64/arm64 platforms is resolved, and the client starts as expected.
* Running Tailscale on devices equipped with Trusted Platform Module (TPM) 1.x no longer causes the [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) [daemon](https://tailscale.com/kb/1278/tailscaled) to fail.
* Node key sealing is GA ([generally available](https://tailscale.com/kb/1167/release-stages#general-availability-ga)) and enabled by default. For more information, refer to [Secure node state storage](https://tailscale.com/kb/1596/secure-node-state-storage).#### [Windows](#windows)
* [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) no longer sporadically panics when a [Trusted Platform Module](https://tailscale.com/kb/1596/secure-node-state-storage) (TPM) device is present.
* Node key sealing is GA ([generally available](https://tailscale.com/kb/1167/release-stages#general-availability-ga)) and enabled by default. For more information, refer to [Secure node state storage](https://tailscale.com/kb/1596/secure-node-state-storage).#### [MacOS](#macos)
* The Tailscale dock icon closes as expected when the client is not using the [windowed UI](https://tailscale.com/blog/windowed-macos-ui-beta) ([beta](https://tailscale.com/kb/1167/release-stages#general-availability-beta)).
* The **Hide Dock Icon** checkbox located in **Settings** lets you remove the Tailscale icon from the macOS dock when the client window is closed.
* The [`tailscale drive`](https://tailscale.com/kb/1080/cli#drive) CLI command for sharing [Taildrive](https://tailscale.com/kb/1369/taildrive) directories is no longer available. Use the client GUI for sharing directories instead.
* Node key sealing is GA ([generally available](https://tailscale.com/kb/1167/release-stages#general-availability-ga)) and enabled by default. For more information, refer to [Secure node state storage](https://tailscale.com/kb/1596/secure-node-state-storage).Exit node selection using the macOS Shortcuts app work as expected.
* Accounts displayed using the macOS menu bar Tailscale icon load as expected.
* Client users preference for automatic/recommended exit node selection is remembered as expected.#### [iOS](#ios)
* [Exit node](https://tailscale.com/kb/1103/exit-nodes) selection using the [iOS Shortcuts](https://tailscale.com/kb/1233/mac-ios-shortcuts) app work as expected.
* Client users preference for automatic/recommended exit node selection is remembered as expected.#### [Android](#android)
* Client is able to establish [direct connections](https://tailscale.com/kb/1257/connection-types#direct-connections) as expected.#### [WASM](#wasm)
* The JS/WASM client used by [`tsconnect`](https://pkg.go.dev/tailscale.com/cmd/tsconnect) no longer crashes unexpectedly.#### [FreeBSD](#freebsd)
* [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) starts up as expected in a no router configuration environment.#### [OpenBSD](#openbsd)
* [`tailscaled`](https://tailscale.com/kb/1278/tailscaled) starts up as expected in a no router configuration environment.
All of these fixes and changes are available in the current stable release, 1.90.5
## [Container, Kubernetes, and `tsrecorder` updates](#container-kubernetes-and-tsrecorder-updates)
### [**Container image v1.90.5**](#container-image-v1905)
This version contains no changes except for library updates.
### [**Kubernetes operator v1.90.5**](#kubernetes-operator-v1905)
* [DNSConfig nameserver](https://tailscale.com/kb/1438/kubernetes-operator-cluster-egress#expose-a-tailnet-https-service-to-your-cluster-workloads) supports Pods with IPv6 addresses and will serve AAAA records.
* DNSConfig nameserver supports specifying a replica count for high-availability deployment.
* DNSConfig nameserver supports specifying pod [tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/).
* [ProxyClass](https://tailscale.com/kb/1445/kubernetes-operator-customization) now supports the [`dnsConfig`](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy) and [`dnsPolicy`](https://kubernetes.io/docs/concepts/services-networking/dns-pod-service/#pod-s-dns-policy) fields for refined DNS specifications.
* Reconciler logs are now sent to the Tailscale control plane in addition to the core client logs that are already sent. As before, this can be disabled by setting the [`TS\_NO\_LOGS\_NO\_SUPPORT`](https://tailscale.com/kb/1011/log-mesh-traffic#opting-out-of-client-logging) environment variable to `true` within the operator deployment.### [**tsrecorder v1.90.5**](#tsrecorder-v1905)
* `tsrecorder` is updated with web interface search, filtering and, enhanced design.
* [`kubectl exec`](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_exec/) sessions record as expected.
* Cached recordings on large datasets no longer fail if the caching process exceeds one minute.
* Recordings are no longer stopped when a session exceeds one minute.
Those are the highlights for this month. If you have questions or feedback, [we're here to help](https://tailscale.com/contact/support). Thank you for using Tailscale.
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