Tailscale Monthly Update: September 2025
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productSeptember 26, 2025
# This month at Tailscale: Exit node policies, UI betas, and Taildrive fixes
We continuously ship updates to make your network more reliable, manageable, and secure. Each month, we highlight some of the most impactful changes across clients, admin tools, integrations, and infrastructure—so you can stay on top of what’s new and what’s better.
This month's updates include changes to exit node policies, Taildrive fixes, a preview of a windowed UI for macOS, and more. For instructions on how to update to the latest version, visit our [update guide](https://tailscale.com/kb/1067/update).
## [macOS windowed UI mode (beta)](#macos-windowed-ui-mode-beta)
A new interface for Tailscale's macOS desktop client now offers a full window, providing node search, features like TailDrop and ping, and other improvements. To test, go to the [**Settings**](https://login.tailscale.com/admin/settings/general) page of the admin console and toggle **Redesigned macOS Client UI**. Once enabled, all macOS clients display the new interface.
## [DERP server IP changes](#derp-server-ip-changes)
The IPv4 and IPv6 addresses for Tailscale's DERP servers in Sydney, Tokyo, Singapore, and São Paulo have recently changed. If you use custom firewall settings relying on these addresses, refer to our [DERP map](https://login.tailscale.com/derpmap/default) for information (no action is required, otherwise).
## [Client updates](#client-updates)
### [**Tailscale v1.88.1 and 1.88.2**](#tailscale-v1881-and-1882)
We released a series of updates and fixes to improve security and stability across all platforms.
#### [All platforms](#all-platforms)
* [Tailscale CLI](https://tailscale.com/kb/1080/cli) prompts users to confirm with `y/n` before proceeding with impactful actions.
* Go is updated to version 1.25.1.
* Fixed: Tailscale SSH works as expected when using an IP address instead of a hostname and MagicDNS is disabled.
* Fixed: [Taildrive](https://tailscale.com/kb/1369/taildrive) folder sharing works correctly even when the `su` command is not present on the Linux or other Unix-like host.
* Fixed: Taildrive files remain consistently accessible.#### [Linux](#linux)
* The [system tray application](https://tailscale.com/kb/1597/linux-systray) for Linux desktops can be enabled to display some of the GUI options available in other Tailscale clients, including [fast user switching](https://tailscale.com/kb/1225/fast-user-switching) and [exit node](https://tailscale.com/kb/1408/quick-guide-exit-nodes) selection.#### [Windows](#windows)
* The existing [`ExitNodeID=auto:any`](https://tailscale.com/kb/1315/mdm-keys#force-an-exit-node-to-always-be-used) system policy supports the new `ExitNode.AllowOverride` policy option that lets users select a different exit node while still requiring exit node usage. (Also on macOS).#### [macOS](#macos)
* macOS 12 is the minimum supported version.
* [`advertiseExitNode`](https://tailscale.com/kb/1315/mdm-keys#advertise-exit-node) system policy is available on macOS.
* Fixed: UI improvements for iOS 26 and macOS 26 compatibility.
* Fixed: Automatic recommended exit node selection.#### [iOS](#ios)
* UI improvements for iOS 26 and macOS 26 compatibility.#### [QNAP](#qnap)
* New [QNAP](https://tailscale.com/kb/1273/qnap) builds are available again. At the time of this release, you can manually download the update from our [packages site](https://pkgs.tailscale.com/stable/#qpkgs). After a period of time, the update will also be available in [QNAP App Center](https://www.qnap.com/en/app-center).
All of these fixes and changes are available in the current stable release, 1.88.2.
## [Container, Kubernetes, and `tsrecorder` updates](#container-kubernetes-and-tsrecorder-updates)
The 1.88.2 release for containers, Kubernetes, and `tsrecorder` contained library updates and other changes and fixes.
### [**Container image v1.88.2**](#container-image-v1882)
* Fixed: [Kubernetes sidecars](https://tailscale.com/kb/1185/kubernetes#sample-sidecar) no longer error on first run if their state [Secret](https://kubernetes.io/docs/concepts/configuration/secret/) doesn't exist.### [**Kubernetes operator v1.88.2**](#kubernetes-operator-v1882)
New features and fixes were added to the [Kubernetes operator](https://tailscale.com/kb/1236/kubernetes-operator), including:
* [ProxyClass](https://tailscale.com/kb/1445/kubernetes-operator-customization) resources supports setting a `priorityClassName` for created Pods.
* Connector resources can specify multiple replicas for [highly available subnet routers](https://tailscale.com/kb/1115/high-availability#subnet-router-high-availability), [app connectors](https://tailscale.com/kb/1115/high-availability#app-connector-high-availability), and [exit nodes](https://tailscale.com/kb/1103/exit-nodes).
* Fixed: [DNSConfig](https://tailscale.com/kb/1438/kubernetes-operator-cluster-egress#expose-a-tailnet-https-service-to-your-cluster-workloads) resource works as expected for egress ProxyGroups.
* Fixed: [Multi-cluster ingress](https://tailscale.com/kb/1541/kubernetes-operator-multi-cluster-ingress) devices no longer display an erroneous "Invalid certificate" message in the [**Machines**](https://login.tailscale.com/admin/machines) page of the admin console.### [**tsrecorder v1.86.2**](#tsrecorder-v1862)
* Library updates only
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