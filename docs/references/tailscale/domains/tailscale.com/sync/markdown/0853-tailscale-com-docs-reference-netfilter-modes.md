Tailscale netfilter modes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale netfilter modes
Last validated: Dec 29, 2025
This topic applies only to Linux devices running Tailscale.
[Netfilter](https://www.netfilter.org/documentation/) is a framework built into the Linux kernel that provides hooks at key points in the networking stack that let you inspect, modify, drop, and redirect packets as they flow through the system. It's the underlying engine for firewall tools like [iptables](https://netfilter.org/projects/iptables/) and [nftables](https://wiki.nftables.org/wiki-nftables/index.php). By default, when you install Tailscale on a Linux device, Tailscale creates its own firewall rules and configures them to be evaluated automatically. This approach lets Tailscale manage its required rules while preserving your ability to add custom rules when needed.
This default configuration (`on` mode) works for most deployments, but there are other Tailscale netfilter modes, including `nodivert` and `off`. You might consider using another mode and customizing Tailscale's netfilter behavior in the following scenarios:
* You need exceptions to Tailscale's [CGNAT](https://en.wikipedia.org/wiki/Carrier-grade_NAT) traffic filtering. For example, you might need exceptions when other software conflicts with Tailscale's automatic rule management.
* You need to prevent [`tailscaled`](/docs/reference/tailscaled) from periodically repositioning its rules to ensure they're evaluated first.
* You need other firewall rules evaluated before Tailscale's rules.
You can customize how Tailscale integrates with netfilter by setting the netfilter mode. There are several places where you can configure netfilter mode in Tailscale including the `tailscaled` configuration file's `netfilterMode` option and the [Tailscale CLI](/docs/reference/tailscale-cli) `--netfilter-mode` flag (which applies to `tailscale up`, `tailscale login`, and `tailscale set`).
## [Netfilter mode options](#netfilter-mode-options)
Tailscale has three netfilter mode options: `on`, `nodivert`, and `off`. These values are the same for the Tailscale CLI flag (`--netfilter-mode`) and the Tailscale daemon configuration file value (`netfilterMode`).
|Mode|Description|
|[`on`](#on)|(Default) Tailscale creates its firewall rules and ensures they're evaluated for relevant traffic.|
|[`nodivert`](#nodivert)|Tailscale creates its firewall rules but does not activate them. Traffic does not automatically flow through Tailscale's rules.|
|[`off`](#off)|Tailscale does not create or manage any firewall rules. You must write all required rules yourself.|
### [`on`](#on)
On is the default mode. When using `on` mode, Tailscale creates firewall rules and ensures they're evaluated for relevant traffic. How Tailscale integrates depends on which tool is in use:
* **With iptables**: Tailscale creates custom chains and inserts [jump rules](https://wiki.nftables.org/wiki-nftables/index.php/Jumping_to_chain) at the start of the built-in chains (`INPUT` and `FORWARD` in the `filter` table, `POSTROUTING` in the `nat` table) to direct traffic through its rules.
* **With nftables**: Tailscale creates its own table containing chains that are [registered directly at hooks](https://wiki.nftables.org/wiki-nftables/index.php/Configuring_chains) with high priority, ensuring its rules are evaluated early.
Tailscale's rules enforce several security policies:
* **Accept tailnet traffic**: Traffic arriving through the `tailscale0` interface is accepted.
* **Prevent CGNAT spoofing**: Traffic from the CGNAT range (`100.64.0.0/10`) that does not arrive through the `tailscale0` interface is dropped. This prevents attackers from spoofing [Tailscale IP addresses](/docs/concepts/tailscale-ip-addresses) on other interfaces.
* **Accept Tailscale protocol traffic**: UDP traffic on Tailscale's listening port is accepted to maintain connectivity.
* **Enable routing features**: Forwarded traffic is marked and accepted appropriately for [subnet routing](/docs/features/subnet-routers) and [exit node](/docs/features/exit-nodes) functionality.
When set to `on`, Tailscale periodically verifies its rules remain positioned for early evaluation. If other software changes this, Tailscale restores its configuration.
### [`nodivert`](#nodivert)
No divert (`nodivert`) mode creates Tailscale's firewall rules but does not activate them. The rules exist, but traffic doesn't automatically flow through them.
How this works depends on which tool is in use:
* **With iptables**: Tailscale creates its custom chains but does not insert jump rules into the built-in chains.
* **With nftables**: Tailscale creates its table and chains but does not register them at hooks.
Use `nodivert` mode when you need to:
* Control the order of firewall rules so that your custom rules are evaluated before Tailscale's rules.
* Add exceptions to Tailscale's default behavior of dropping [CGNAT](https://en.wikipedia.org/wiki/Carrier-grade_NAT) traffic that does not pass through the `tailscale0` interface.
* Prevent [`tailscaled`](/docs/reference/tailscaled) from periodically repositioning its rules for early evaluation.
When using `nodivert` mode, Tailscale's rules exist but are not referenced. You must manually configure your firewall to direct traffic through Tailscale's rules. With iptables, this means adding jump rules to the built-in chains. With nftables, this means registering Tailscale's chains at the appropriate hooks.
### [`off`](#off)
Use the `off` mode to prevent Tailscale from making any changes to netfilter. There's usually not a good reason to set the netfilter mode to `off`. When using this mode, Tailscale makes no changes to `iptables` or `nftables`. You must write all required firewall rules yourself, including the rules that Tailscale would normally create in its chains.
Only use `off` mode if you have a specific requirement that `nodivert` cannot address. With netfilter mode set to `off`, you are responsible for:
* Accepting traffic on the `tailscale0` interface.
* Accepting UDP traffic on Tailscale's listening port.
* Configuring NAT rules for subnet routing and exit node functionality.
On this page
* [Netfilter mode options](#netfilter-mode-options)
* [on](#on)
* [nodivert](#nodivert)
* [off](#off)
Scroll to top