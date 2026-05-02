Disable subnet route masquerading · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Disable subnet route masquerading
Last validated: Mar 25, 2026
Source Network Address Translation (SNAT) affects how source IP addresses appear to devices in different parts of your network. By default, Tailscale performs SNAT on traffic passing through [subnet routers](/docs/features/subnet-routers), but this behavior can be modified when necessary.
You can disable subnet route masquerading with the following command (Linux only):
```
`tailscale up --snat-subnet-routes=false
`
```
SNAT enables transparent communication to the rest of the network by re-writing the source IP address to that of the subnet router. If you disable subnet route masquerading, NAT traffic to local routes that are advertised with `--advertise-routes` will need to have routing manually configured.
For more information, refer to [Disable SNAT](/docs/features/subnet-routers#disable-snat).
Scroll to top