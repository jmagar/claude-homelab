Troubleshoot DERP traffic routing issues · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot DERP traffic routing issues
Last validated: Mar 16, 2026
To get in-depth information to troubleshoot [direct and relayed connections](/docs/reference/connection-types), use the [Tailscale CLI](/docs/reference/tailscale-cli) to run the [`tailscale status`](/docs/reference/tailscale-cli#status) command. If you observe output in the form of `relay "code"`, then your traffic is being routed through a [DERP server](/docs/reference/derp-servers) that has "code" as its location. For example, the second line in this `tailscale status` output indicates traffic is being routed through the "sea" (Seattle) relay server:
```
`100.99.98.97 device1 linux active; direct 1.2.3.4:1234; tx 1000 rx 1000
100.99.98.96 device2 linux active; relay "sea", tx 1000 rx 1000
`
```
If there is no `relay "code"` line in the `tailscale status` output, then your traffic is not being routed through DERP.
Also, the [`tailscale ping`](/docs/reference/tailscale-cli#ping) command will indicate whether a successful ping was by direct path or using DERP. `tailscale ping` will keep trying until it either sends 10 pings (the default if not using the `--c` flag) through the relays, or finds a direct path. For example, if the first five pings were relayed and the sixth ping was a direct path, `tailscale ping` will stop. This `tailscale ping device2` example indicates the device was reached using the "sea" relay on the first ping, and by direct path on the second ping, at which time `tailscale ping` stopped.
```
`tailscale ping device2
pong from device2 (100.99.98.96) via DERP(sea) in 242ms
pong from device2 (100.99.98.96) via 1.2.3.4:1234 in 127ms
`
```
Scroll to top