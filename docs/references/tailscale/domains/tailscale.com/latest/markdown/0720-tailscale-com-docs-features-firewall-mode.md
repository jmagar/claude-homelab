Firewall mode in tailscaled · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Firewall mode in tailscaled
Last validated: Dec 29, 2025
Firewall mode for [tailscaled](/docs/reference/tailscaled) refers to a router's selection among two firewall utilities,
`iptables` and `nftables`, to manipulate firewalls (using [netfilter](/docs/reference/netfilter-modes)). This applies to Linux devices only. Up until Tailscale v1.48.0, Tailscale relied only on `iptables` to set firewall rules. As `nftables` is increasingly popular for its performance benefits, we added support to use `nftables` to manage Tailscale's firewall rules from the `nftables` Netlink API.
Our way of manipulating firewall rules through `iptables` is by using the `iptables` binary. When Tailscale is running in `iptables` firewall mode, there must be a compatible `iptables` binary in the system `PATH`. On the other hand, we manipulate `nftables` through the `nftables` Netlink API, so it doesn't depend on the `nft` binary.
The use of `nftables` doesn't work in Tailscale when the Netlink API is disabled for [userspace networking mode](/docs/concepts/userspace-networking), which is not a common scenario.
## [How to set the firewall mode](#how-to-set-the-firewall-mode)
Using the `TS\_DEBUG\_FIREWALL\_MODE` environment variable to set the firewall mode is a temporary measure. Its use is subject to change and should not be considered as permanently supported.
Tailscale has a work-in-progress feature to detect whether the host system is currently using `iptables` or `nftables`
so that it will also use the same firewall interface. It is possible to opt-in to this detection by setting the `TS\_DEBUG\_FIREWALL\_MODE`
environment variable to `auto`. It is also possible to explicitly test the specific firewall modes by setting `TS\_DEBUG\_FIREWALL\_MODE`
to one of the values below.
|Value|Description|
|`auto`|A [heuristic](#heuristic) is used to decide between `iptables` and `nftables`.|
|`iptables`|`iptables` is used.|
|`nftables`|`nftables` is used.|
|No value set|The default of `iptables` is used.|
When using the `TS\_DEBUG\_FIREWALL\_MODE` environment variable, set it in `/etc/default/tailscaled`.
## [Firewall mode heuristic](#firewall-mode-heuristic)
When `TS\_DEBUG\_FIREWALL\_MODE` is set to `auto`, Tailscale will detect the firewall mode that other software on the system
is already using. Tailscale will prefer `nftables` over `iptables` in the event that both are in use at the same time.
When neither the `iptables` binary nor the `nftables` Netlink API are available, Tailscale will fall back to a degraded
operation that may result in reduced performance or increased CPU usage. Packet filtering for traffic in and out of
Tailscale is always performed by packet filtering internal to Tailscale itself, so this configuration does not affect the
security of a Tailscale node or tailnet.
## [Examples](#examples)
To set `iptables` as the firewall mode (this is the default if you don't set `TS\_DEBUG\_FIREWALL\_MODE`):
```
`TS\_DEBUG\_FIREWALL\_MODE=iptables
`
```
To set `nftables` as the firewall mode:
```
`TS\_DEBUG\_FIREWALL\_MODE=nftables
`
```
To let Tailscale use the [heuristic](#heuristic) to set the firewall mode:
```
`TS\_DEBUG\_FIREWALL\_MODE=auto
`
```
## [How to verify it's working](#how-to-verify-its-working)
If you are running Tailscale outside of a container, you can verify the firewall mode by viewing the
`tailscaled` log output via `journalctl`:
```
`journalctl -ru tailscaled
`
```
If you are running Tailscale inside a container, the way to view logs depends on the containerization
technology being used.
The log should have three lines that start with `router:`, with the first line showing the rule count.
The second line shows the reason a firewall mode was chosen, and the third line shows the firewall
mode currently in effect.
The log looks like the following when the `TS\_DEBUG\_FIREWALL\_MODE` environment variable specifies
`nftables`:
```
`router: router: nftables rule count: 0, iptables rule count: 0
router: router: envknob TS\_DEBUG\_FIREWALL\_MODE=nftables set
router: router: using nftables
`
```
Similar output is shown when the `TS\_DEBUG\_FIREWALL\_MODE` environment variable specifies `iptables`.
When the firewall mode selection heuristic is used, the output looks like:
```
`router: router: nftables rule count: 0, iptables rule count: 0
router: router: nftables is available
router: router: using nftables
`
```
The possible reasons (shown in line 2 of the example output) are:
* `iptables is available`
* `iptables is currently in use`
* `nftables is available`
* `nftables is currently in use`
When neither `iptables` or `nftables` is supported, `tailscaled` silently chooses `iptables`, and
creates a runner that doesn't do anything. This is a scenario that usually only advanced users
experience, when they don't need Tailscale to configure the firewall rules and they prefer to do it
themselves.
On this page
* [How to set the firewall mode](#how-to-set-the-firewall-mode)
* [Firewall mode heuristic](#firewall-mode-heuristic)
* [Examples](#examples)
* [How to verify it's working](#how-to-verify-its-working)
Scroll to top