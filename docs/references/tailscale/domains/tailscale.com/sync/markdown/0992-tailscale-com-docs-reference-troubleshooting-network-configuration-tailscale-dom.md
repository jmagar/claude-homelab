Troubleshoot Tailscale domains and sites unreachable · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot Tailscale domains and sites unreachable
Last validated: Mar 16, 2026
If your network and internet connectivity are working as expected, but you cannot reach any of the Tailscale sites, including our corporate site, documentation, and admin console, this may be because we were erroneously added to an internet blocklist. To prevent temporary DNS blocking to our sites, we recommend adding the following entries to your DNS service allowlists.
```
`\*.tailscale.com
\*.tailscale.io
`
```
We support a wide variety of DNS services, including [Control D](/docs/integrations/control-d), [Linux DNS](/docs/reference/linux-dns), [NextDNS](/docs/integrations/nextdns), and [Unbound DNS in OPNsense](/docs/integrations/firewalls/opensense-unbound).
Scroll to top