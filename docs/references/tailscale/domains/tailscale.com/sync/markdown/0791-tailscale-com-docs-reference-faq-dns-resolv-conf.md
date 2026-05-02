Why is resolv.conf being overwritten? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Why is resolv.conf being overwritten?
Last validated: Jan 5, 2026
Tailscale overwrites `/etc/resolv.conf` when
[MagicDNS](/docs/features/magicdns) is enabled in the tailnet and
`--accept-dns` is enabled on the machine running Tailscale and there
doesn't appear to be a DNS manager running on the system.
## [Common questions](#common-questions)
### [How do I stop tailscaled from overwriting `/etc/resolv.conf`?](#how-do-i-stop-tailscaled-from-overwriting-etcresolvconf)
For Linux, refer to [Linux DNS](/docs/reference/linux-dns). The short summary is
that you'll have the best experience by using
`systemd-resolved`. Tailscale tries to interoperate with a number of
other DNS managers before resorting to overwriting `/etc/resolv.conf`.
If a DNS manager isn't available for your system, or you don't want to run one,
and don't want Tailscale to overwrite `/etc/resolv.conf`, you can either
[disable MagicDNS](/docs/features/magicdns) for all devices in your tailnet or
run `tailscale set --accept-dns=false` to disable MagicDNS on a single device.
Even if you set `--accept-dns=false`, Tailscale's MagicDNS server
still replies at `100.100.100.100` (or `fd7a:115c:a1e0::53`), as long
as MagicDNS is enabled in the tailnet. If you'd like to manually
configure your DNS configuration, you can point `\*.ts.net` queries at
`100.100.100.100`. The [`100.100.100.100`](/docs/reference/quad100) resolver runs inside
`tailscaled` on the device and replies authoritatively to Tailscale
DNS names without needing to forward queries out to the network.
On this page
* [Common questions](#common-questions)
* [How do I stop tailscaled from overwriting /etc/resolv.conf?](#how-do-i-stop-tailscaled-from-overwriting-etcresolvconf)
Scroll to top