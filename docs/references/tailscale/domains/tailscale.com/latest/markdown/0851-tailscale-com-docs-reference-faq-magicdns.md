Why is MagicDNS fetching records on port 443? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Why is MagicDNS fetching records on port 443?
Last validated: Sep 18, 2025
When you use popular DNS providers, Tailscale will transparently upgrade you to [DNS over HTTPS](https://en.wikipedia.org/wiki/DNS_over_HTTPS) (DoH) to make your DNS lookups end-to-end encrypted with the DNS server.
DNS is traditionally done in clear text over UDP port 53. This lets unsophisticated attackers in the same coffee shop or network to be able to sniff your DNS traffic to discover what websites you are connecting to. DNS over HTTPS changes this by making all DNS requests over HTTPS, which uses TLS for [encryption](/docs/concepts/tailscale-encryption).
With this feature, applications will make DNS lookups to the local MagicDNS server at the virtual IP address `100.100.100.100`, instead of your OS level DNS servers. MagicDNS will then upgrade any DNS queries to DoH transparently. This provides legacy environments and applications with end-to-end encrypted DNS lookups for free.
If you use any of the default nameservers listed in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console, Tailscale will automatically use DoH when possible. When you use [NextDNS](/docs/integrations/nextdns), it only lets connections over DoH, meaning all lookups will be end-to-end encrypted with your DNS server.
Your outbound connection monitoring software will need to be adjusted to account for this behavior. This may manifest as an unexpected TCP connection to port 443 (the standard HTTPS port).
Scroll to top