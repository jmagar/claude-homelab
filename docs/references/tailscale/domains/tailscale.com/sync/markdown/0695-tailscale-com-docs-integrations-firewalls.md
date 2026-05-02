Using Tailscale with your firewall · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Using Tailscale with your firewall
Last validated: Jan 28, 2026
Most of the time, Tailscale works with existing firewalls without additional configuration. Thanks to [NAT traversal](/blog/how-nat-traversal-works), devices in a Tailscale network (known as a tailnet) can connect directly peer to peer, even through firewalls. When this isn't the case, you can usually resolve it by [opening a firewall port to establish a direct connection](/docs/reference/faq/firewall-ports).
For some firewalls, though, it is particularly difficult to establish a direct connection, so your traffic relies on [DERP relay servers](/docs/reference/derp-servers) as a fallback, which might lead to slower connections. Refer to the list below for known issues and workarounds when using Tailscale with your firewall provider.
You can set up a Tailscale Peer Relay server to help devices connect when direct connections aren't possible. These are relay servers that you host on your own infrastructure. For more information, refer to the [Tailscale Peer Relay documentation](/docs/features/peer-relay).
Refer to [connection types in Tailscale](/docs/reference/connection-types) to understand how to determine the connection type between two devices in your tailnet.
## [Latency vs security](#latency-vs-security)
Your organization might have configured a firewall to protect their network from unsolicited, unnecessary, or malicious traffic. Although the workarounds below might help Tailscale to establish direct connectivity between devices, these might also make it easier for other traffic to reach your network. Before implementing any of these changes, consider the pros and cons of making this trade-off between security and latency.
Specifically:
* By enabling NAT-PMP and UPnP, your network can allow in and forward all traffic.
* By opening a firewall port, your network will allow traffic on a certain port and meeting certain rules to leave your network. Restrict this traffic only to what is needed. [Subscribe to this GitHub issue](https://github.com/tailscale/tailscale/issues/1872) for updates on a Tailscale ruleset.
## [Firewall compatibility and workarounds](#firewall-compatibility-and-workarounds)
The following table summarizes the expected behavior of Tailscale with various firewall platforms, along with any known workarounds.
Tailnet devices only connect using a peer relay if you've configured at least one [Tailscale Peer Relay server](/docs/features/peer-relay) in your tailnet and created the appropriate [access control rules](/docs/features/access-control/grants) to use them. Tailscale devices try to connect in the following order: directly peer to peer, using a [Tailscale Peer Relay server](/docs/features/peer-relay) if configured, then using a [DERP relay server](/docs/reference/derp-servers).
|**Firewall**|**Expected behavior**|**Workaround**|
|Barracuda|Connects using DERP or a peer relay|Increase Max UDP sessions, and open a firewall port|
|Check Point|Connects directly|n/a|
|Cisco|Connects using DERP or a peer relay|Open a firewall port|
|Cisco with Cisco Umbrella Endpoint Security|Connects using DERP or a peer relay|None|
|Fortinet|Connects using DERP or a peer relay|Randomize port|
|Fortinet with FortiGate deep packet inspection|Unable to connect to control plane|None|
|OPNsense|Connects using DERP or a peer relay|Enable NAT-PMP, or static NAT port mappings|
|pfSense|Connects using DERP or a peer relay|Enable NAT-PMP, or static NAT port mappings|
|Palo Alto Networks|Connects using DERP or a peer relay|Use Persistent Dynamic IP and Port|
|Sophos|Connects directly|n/a|
|UniFi Gateways|Connects using DERP or a peer relay|Allow peer-to-peer traffic|
For other firewalls, if your connections are using DERP relays by default, try [opening a port to establish a direct connection](/docs/reference/faq/firewall-ports). You can also set up a [peer relay server](/docs/features/peer-relay) in your tailnet to help devices connect when direct connections aren't possible.
If you experience an issue with a firewall not listed here, or need help configuring a particular firewall with Tailscale, [contact support](/contact/support).
### [Barracuda](#barracuda)
In networks with Barracuda firewalls, Tailscale devices will have difficulties making direct connections, and often resort to DERP relays.
To help Tailscale make direct connections, modify the maximum number of UDP sessions that a Barracuda firewall permits, making it easier for multiple Tailscale clients to connect, without competing with each other for UDP ports. To modify this, increase the ["Max UDP" parameter](https://campus.barracuda.com/product/cloudgenfirewall/doc/95258827/general-firewall-configuration/?sl=AX5zwzvyOBUvMAhoTe4U&amp;so=2) in your firewall configuration.
You can also consider [opening a firewall port](/docs/reference/faq/firewall-ports) or setting up a [Tailscale Peer Relay server](/docs/features/peer-relay) in your tailnet.
### [Check Point](#check-point)
In networks with Check Point firewalls, Tailscale devices should be able to establish direct connections by default.
### [Cisco](#cisco)
In networks with Cisco firewalls, Tailscale devices will have difficulties making direct connections, and often resort to DERP relays.
To help Tailscale make direct connections, consider [opening a firewall port](/docs/reference/faq/firewall-ports).
#### [Cisco Umbrella Endpoint Security](#cisco-umbrella-endpoint-security)
If you are using Cisco Umbrella Endpoint Security, then [the above](#cisco) will not work to establish direct connections, and your traffic will always resort to DERP relays.
#### [Cisco Umbrella DNS Filtering](#cisco-umbrella-dns-filtering)
For DNS filtering using Cisco Umbrella (formerly OpenDNS), Umbrella/OpenDNS will override DNS settings set by Tailscale without additional configuration. To configure the two together:
1. Configure Umbrella/OpenDNS to send `\*.\<your-tailnet-name\>.ts.net` queries to `100.100.100.100`. [`100.100.100.100` or Quad100](/docs/reference/quad100) is a special Tailscale IP address in your Tailscale network (known as a tailnet) that provides essential local services including a DNS resolver.
2. [Disable MagicDNS](/docs/features/magicdns#disabling-magicdns) in the Tailscale admin console.
3. Disable [Override DNS servers](/docs/reference/dns-in-tailscale#override-dns-servers) in the Tailscale admin console and on end-user clients with [an MDM system policy](/docs/features/tailscale-system-policies#set-whether-the-device-uses-tailscale-dns-settings).
This configures clients to continue to use Umbrella for all DNS queries, while configuring Umbrella to use Tailscale's Quad100 DNS resolver for tailnet-specific queries.
### [Fortinet](#fortinet)
In networks with Fortinet firewalls, Tailscale devices will have difficulties making direct connections, and often resort to DERP relays. This issue might not be present at a smaller scale, with issues occurring once more than 5 individuals are using Tailscale behind the same firewall.
To allow direct connections, in the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, include an option in your [tailnet policy file](/docs/features/access-control) to [randomizeClientPort](/docs/reference/syntax/policy-file#network-policy-options). This makes devices use a random port for WireGuard rather than the default static port `41641`.
```
`{
// Tailnet policy file settings and other configurations
"randomizeClientPort": true
}
`
```
If you are using FortiGate application control rules with certain configurations, your firewall will intercept HTTPS connections to the Tailscale control plane, and nodes in your network will be unable to connect to Tailscale. If this happens, a certificate verification error similar to the one below will display in the Tailscale client UI and in the output of the Tailscale CLI [`tailscale status`](/docs/reference/tailscale-cli#status) command:
```
`fetch control key: Get "https://controlplane.tailscale.com/key?v=123": x509: "controlplane.tailscale.com" certificate is not trusted
`
```
To address the issue, go to the FortiOS admin console from a browser, select **Security Profiles**, then **Application Control**. Disable or reduce the scope of any security profiles that perform SSL inspection. In particular, verify that you are not using any default rules that block traffic belonging to the **Proxy** category or match against the [Tailscale application defined in FortiGuard](https://fortiguard.fortinet.com/appcontrol/51457). This is currently the only known workaround.
### [Netskope](#netskope)
In networks with Netskope, Tailscale devices will have difficulties making direct connections and often resort to using [relayed connections](/docs/reference/connection-types#relayed-connections).
You can configure Netskope to ignore Tailscale and allow its traffic to bypass Netskope's filtering and cloud proxy. To do so:
1. [Create a Custom Certificate Pinned Application](https://docs.netskope.com/en/creating-a-custom-certificate-pinned-application) for your platforms in use with the following process names:
|**Platform**|**Type**|**Process Names**|
|Android/ChromeOS|Exact|`com.tailscale.ipn`|
|iOS|Exact|`io.tailscale.ipn.ios`, `io.tailscale.ipn.ios.network-extension`|
|Linux|Exact|`tailscaled`|
|[macOS (from Mac App Store)](/docs/concepts/macos-variants#mac-app-store-variant)|Exact|`io.tailscale.ipn.macos`, `io.tailscale.ipn.macos.network-extension`|
|[macOS (standalone)](/docs/concepts/macos-variants#standalone-variant)|Exact|`io.tailscale.ipn.macsys`, `io.tailscale.ipn.macsys.network-extension`|
|Windows|Exact|`tailscale-ipn.exe`, `tailscale.exe`, `tailscaled.exe`|
2. [Add steering bypass exceptions](https://docs.netskope.com/en/add-bypasses-in-netskope#steering-bypasses) for the following criteria:
|**Criteria**|**Values**|
|Domains|`\*.tailscale.com`, `\*.ts.net`|
### [OPNsense and pfSense](#opnsense-and-pfsense)
In networks with OPNsense and pfSense firewalls, Tailscale devices will have difficulties making direct connections and often resort to using [relayed connections](/docs/reference/connection-types#relayed-connections).
However, there are options to allow direct connections, such as NAT Port Mapping Protocol (NAT-PMP), static NAT port mapping, and Universal Plug and Play (UPnP). For more information, refer to the instructions for [pfSense](/docs/integrations/firewalls/pfsense#direct-connections-for-lan-clients) and [OPNsense](/docs/install/opnsense#direct-connections-for-lan-clients).
You can also run Tailscale directly on these routers using a plugin for pfSense and the [FreeBSD Tailscale package for OPNsense](/docs/install/opnsense).
### [Palo Alto Networks](#palo-alto-networks)
Using [Persistent Dynamic IP and Port](https://docs.paloaltonetworks.com/pan-os/10-1/pan-os-new-features/networking-features/persistent-nat-for-dipp) in the NAT Policy translation type lets Tailscale to establish direct WireGuard connections through the firewall.
Persistent Dynamic IP support is available in PAN-OS 11.1.1 and later. There is a separate topic for [Palo Alto Networks firewalls](/docs/integrations/firewalls/palo-alto-firewall) covering more detail and several additional options.
### [Sophos](#sophos)
In networks with Sophos security gateways, the default firewall settings work well for Tailscale connectivity. It chooses a random port for the very first mapping, then uses that same port for all subsequent flows using the same source port. This lets Tailscale at the other end to know what port it should use for sending traffic.
To confirm this, use the [Tailscale CLI](/docs/reference/tailscale-cli) command [`tailscale netcheck`](/docs/reference/tailscale-cli#netcheck) to ensure that `MappingVariesByDestIP: false` is the relevant point.
### [UniFi Gateways](#unifi-gateways)
If you have a UniFi security gateway with threat detection enabled, make sure to allow peer-to-peer traffic for the nodes in your tailnet.
In UniFi Network version 9.0.107 and earlier, select to **Settings, Firewall & Security, Edit threat categories**, and uncheck **P2P**.
In UniFi Network version 9.0.108 and later, select to **Network, Security, Protection, Peer to Peer and Dark Web**, and uncheck **P2P**.
## [Only allow traffic over Tailscale](#only-allow-traffic-over-tailscale)
You can also use a firewall to restrict traffic in your network to require the use of Tailscale. For example, refer to instructions on [using ufw to lock down an Ubuntu server](/docs/how-to/secure-ubuntu-server-with-ufw).
On this page
* [Latency vs security](#latency-vs-security)
* [Firewall compatibility and workarounds](#firewall-compatibility-and-workarounds)
* [Barracuda](#barracuda)
* [Check Point](#check-point)
* [Cisco](#cisco)
* [Cisco Umbrella Endpoint Security](#cisco-umbrella-endpoint-security)
* [Cisco Umbrella DNS Filtering](#cisco-umbrella-dns-filtering)
* [Fortinet](#fortinet)
* [Netskope](#netskope)
* [OPNsense and pfSense](#opnsense-and-pfsense)
* [Palo Alto Networks](#palo-alto-networks)
* [Sophos](#sophos)
* [UniFi Gateways](#unifi-gateways)
* [Only allow traffic over Tailscale](#only-allow-traffic-over-tailscale)
Scroll to top