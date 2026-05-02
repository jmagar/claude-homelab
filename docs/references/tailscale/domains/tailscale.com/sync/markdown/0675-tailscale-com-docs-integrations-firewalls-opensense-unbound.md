Unbound DNS in OPNsense · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Unbound DNS in OPNsense
Last validated: May 6, 2025
[OPNsense](https://opnsense.org) is an open source router and firewall platform built using
FreeBSD. Tailscale can be [installed on an OPNsense platform](/docs/install/opnsense),
joining it to your WireGuard-based mesh network.
## [Unbound DNS configuration](#unbound-dns-configuration)
OPNsense is often configured with a local Unbound DNS server to use for
its own lookups and to provide as a recursive DNS service to LAN clients.
Tailscale DNS settings are not currently implemented for Unbound DNS;
instead, the 100.100.100.100 DNS server will be written to
`/etc/resolv.conf`. This will effectively disable Unbound.
It may be preferable to not use the Tailscale DNS settings:
`tailscale set --accept-dns=false`.
Instead, Unbound can be configured to be able to resolve MagicDNS names.
The tiny 100.100.100.100 DNS server running within the `tailscaled` process
will always answer queries specifically sent to it.
In **System \> Settings \> General**, add a search domain for the [MagicDNS name](/docs/features/magicdns)
of the tailnet such as `tails-scales.ts.net` or `tail0123456.ts.net`.
In **Services \> Unbound DNS \> Query Forwarding**, add an entry for the [MagicDNS name](/docs/features/magicdns)
directed to 100.100.100.100.
On this page
* [Unbound DNS configuration](#unbound-dns-configuration)
Scroll to top