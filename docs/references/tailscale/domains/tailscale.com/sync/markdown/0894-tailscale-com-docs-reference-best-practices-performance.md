Performance best practices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Performance best practices
Last validated: Dec 4, 2025
Tailscale continuously seeks ways to improve performance, such as [making significant changes to `wireguard-go`](/blog/throughput-improvements) (the userspace WireGuard implementation that Tailscale uses) and taking advantage of the [transport layer offload engine](https://en.wikipedia.org/wiki/TCP_offload_engine) to push Tailscale to [10Gb/s and beyond](/blog/more-throughput).
In most cases, Tailscale delivers the best possible performance without additional configuration or customization. But there are some situations in which you can use best practices to achieve the highest performance. The following sections offer best practices for getting the most out of Tailscale in various environments, operating systems, and modes of operation ([exit nodes](/docs/features/exit-nodes), [subnet routers](/docs/features/subnet-routers), and the like).
## [Direct connections](#direct-connections)
Tailscale uses [direct and relayed connections](/docs/reference/connection-types), opting for direct connections when possible. Direct connections nearly always result in lower latency and higher throughput.
To increase the likelihood of a direct connection, you can:
* Expose a public IP address for your tailnet devices.
* [Open a firewall port](/docs/reference/faq/firewall-ports) when necessary.
* Use the [device connectivity guide](/docs/reference/device-connectivity) to troubleshoot why a device might be using a relayed connection.
You can also set up one or more [Tailscale Peer Relay servers](/docs/features/peer-relay) in your tailnet. These are devices in your own infrastructure that Tailscale clients can use to connect to each other when a direct connection isn't possible. Peer relay servers are usually faster than DERP relay servers.
## [Operating system recommendations](#operating-system-recommendations)
Use a recent version of your preferred operating system because it typically offers the most recent software and hardware optimizations. For example, using [Linux kernel version 6.2 or later](https://www.kernel.org/category/releases.html) provides the best performance by enabling Tailscale to use the latest kernel features.
### [Linux optimizations for subnet routers and exit nodes](#linux-optimizations-for-subnet-routers-and-exit-nodes)
Tailscale version 1.54 or later used with a Linux 6.2 or later kernel enables UDP throughput improvements using [transport layer offloads](https://www.kernel.org/doc/html/latest/networking/segmentation-offloads.html). If a Linux device is acting as an exit node or subnet router, ensure the following network device configuration is in place for the best results:
```
`NETDEV=$(ip -o route get 8.8.8.8 | cut -f 5 -d " ")
sudo ethtool -K $NETDEV rx-udp-gro-forwarding on rx-gro-list off
`
```
By default, changes made using the `ethtool` don't persistent after a reboot. On Linux distributions using `networkd-dispatcher` (which you can verify with `systemctl is-enabled networkd-dispatcher`), you can run the following commands to create a script that configures these settings on each boot.
```
`printf '#!/bin/sh\\n\\nethtool -K %s rx-udp-gro-forwarding on rx-gro-list off \\n' "$(ip -o route get 8.8.8.8 | cut -f 5 -d " ")" | sudo tee /etc/networkd-dispatcher/routable.d/50-tailscale
sudo chmod 755 /etc/networkd-dispatcher/routable.d/50-tailscale
`
```
Run the following commands to test the script to ensure it runs successfully on your devices:
```
`sudo /etc/networkd-dispatcher/routable.d/50-tailscale
test $? -eq 0 || echo 'An error occurred.'
`
```
## [Machine sizing recommendations](#machine-sizing-recommendations)
For best performance, use the most recent generation of CPU architecture available to you. In general, higher CPU clock speed is more important than more cores.
### [Provider-specific recommendations](#provider-specific-recommendations)
Refer to the following for provider-specific sizing recommendations:
* [Amazon Elastic Compute Cloud (EC2) instance sizing](/docs/reference/reference-architectures/aws#recommended-instance-sizing)
* [Google Compute Engine (GCE) sizing](/docs/reference/reference-architectures/gcp#recommended-instance-sizing)
* [Microsoft Azure virtual machine sizing](/docs/reference/reference-architectures/azure#recommended-vm-sizing)
#### [AWS single-flow bandwidth limitation](#aws-single-flow-bandwidth-limitation)
When running Tailscale on AWS EC2 instances, single-flow network traffic is limited to 5 Gbps when instances are not in the same cluster placement group. This limitation frequently impacts performance testing and high-throughput applications.
To achieve higher single-flow bandwidth, use cluster placement groups to deploy instances in the same cluster placement group within a single Availability Zone.
On this page
* [Direct connections](#direct-connections)
* [Operating system recommendations](#operating-system-recommendations)
* [Linux optimizations for subnet routers and exit nodes](#linux-optimizations-for-subnet-routers-and-exit-nodes)
* [Machine sizing recommendations](#machine-sizing-recommendations)
* [Provider-specific recommendations](#provider-specific-recommendations)
* [AWS single-flow bandwidth limitation](#aws-single-flow-bandwidth-limitation)
Scroll to top