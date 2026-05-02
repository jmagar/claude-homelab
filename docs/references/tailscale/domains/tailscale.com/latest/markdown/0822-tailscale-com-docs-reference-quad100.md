What is 100.100.100.100? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# What is 100.100.100.100?
Last validated: Jan 12, 2026
`100.100.100.100` or Quad100 is a special [Tailscale IP address](/docs/concepts/tailscale-ip-addresses) in your Tailscale network (known as a tailnet) that provides essential local services. It operates similarly to the localhost address (`127.0.0.1`) but serves only Tailscale-specific services and has network-aware functionality. These services include a [DNS resolver](#dns-resolver) and a [device management interface](#device-management-interface).
Quad100 operates as a device-local service, meaning local traffic connecting to `100.100.100.100` doesn't leave your device unless it's necessary to provide a service, such as when forwarding DNS requests. Other devices cannot access your device using `100.100.100.100`, and Tailscale has no visibility over its contents.
Quad100 also has the IPv6 address `fd7a:115c:a1e0::53`. Quad100 is one of Tailscale's [reserved IP addresses](/docs/reference/reserved-ip-addresses).
## [DNS resolver](#dns-resolver)
One of the services provided by Quad100 is a DNS resolver running on port `53` (`100.100.100.100:53`). A DNS resolver is a service that translates IP addresses to hostnames like `google.com` or `macbook.tailnetname.ts.net`. Quad100 is a [stub resolver](https://www.rfc-editor.org/rfc/rfc1123.html#section-6.1.3.1), similar to [`systemd-resolved`](https://wiki.archlinux.org/title/Systemd-resolved), except with extra features.
The Quad100 DNS resolver resolves hostnames in your tailnet locally using [MagicDNS](/docs/features/magicdns) and forwards DNS requests to exit nodes (when configured). It also provides [DNS-over-HTTPS (DoH)](https://en.wikipedia.org/wiki/DNS_over_HTTPS) encryption when available and implements settings like [overriding DNS servers](/docs/reference/dns-in-tailscale#override-dns-servers) and [split DNS (for Android)](/docs/features/client/android-app-split-tunneling).
While Quad100's DNS resolver operates locally without logging, forwarded requests might be logged by configured [nameservers](/docs/reference/dns-in-tailscale#nameservers).
## [Device management interface](#device-management-interface)
Quad100 provides a [device management interface](/docs/features/client/device-web-interface) on port `80`. The interface lets you configure settings for the local device from a web browser. These include device-specific settings, [exit node](/docs/features/exit-nodes) settings, [Tailscale SSH](/docs/features/tailscale-ssh) settings, and [subnet routes](/docs/features/subnet-routers).
You can access the interface at `http://100.100.100.100` locally, even if your device doesn't have a [native Tailscale client](/docs/install).
For Tailscale v1.64.0 and later, the device management interface is enabled by default. For earlier versions, you can [enable it manually](/docs/features/client/device-web-interface#expose-the-web-interface-on-a-device).
On this page
* [DNS resolver](#dns-resolver)
* [Device management interface](#device-management-interface)
Scroll to top