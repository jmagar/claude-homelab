MagicDNS is Now Generally Available in Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 20, 2022
# MagicDNS is Now Generally Available in Tailscale
[Tailscale automatically assigns IP addresses](/kb/1033/ip-and-dns-addresses/) for every unique device in your network, giving each device an IP address no matter where it is located. We further improved on this with [MagicDNS](/kb/1081/magicdns/), which automatically registers a human-readable, easy-to-remember DNS name for each device — so you don’t need to use an IP address to access your devices. This means you can access the device `monitoring`, even if it moves from on-prem to the cloud, without ever needing to know its IP address in the first place.
MagicDNS is *such* a useful feature that it’s been frustrating for us that not all Tailscale users know about it. We’re surprised that we often get suggestions like, “It would be great if Tailscale could just run a small DNS server for me” — when it already does! So we’re particularly excited to share that as of today, **MagicDNS is generally available, and it’s enabled by default for new tailnets!** (Already a Tailscale user, but not using MagicDNS yet? Click “Enable MagicDNS” in the [DNS page](https://login.tailscale.com/admin/dns) of the admin console to get going.)
With MagicDNS enabled, you can access a device with human-readable DNS name.
**If you’re already using MagicDNS, your tailnet has been automatically assigned a new tailnet name of the form `tail\<hex\>.ts.net`, in addition to the existing name `\<domain\>.beta.tailscale.net`**. If you’re sharing nodes with the `beta` name, we ask you to migrate to the new tailnet name. The existing `beta` name will be supported until at least November 1, 2023.
### MagicDNS automatically creates a DNS entry for your device name
“All” MagicDNS does is automatically register a DNS name for every device in your network. With MagicDNS enabled, every device in your tailnet runs its own DNS server, built into the Tailscale client. Then, when you add a new device to your tailnet or modify ACLs, the set of devices the new device can access (known as a *netmap*) is pushed to your device from the Tailscale coordination server, including registering DNS entries for other devices you can access. If you try to access `http://monitoring` on your device, it will first check your built-in Tailscale DNS server to see if it’s an address specified by Tailscale. If it is, it will forward the traffic to that device; if it’s not, it will pass the request on to your other DNS servers. This works wherever you’re using the device’s IP address, including in your browser or on the command line. Keeping all of these DNS entries on the device is also great for security and privacy, as unencrypted DNS queries don’t leave your device.
Your device is automatically registered in MagicDNS based on the device name — for example, `alices-macbook-pro`. If you change your device’s name, the MagicDNS entry will automatically change. If you have a specific machine name you’d like to use to reference your device, then [edit the device’s name in Tailscale](/kb/1098/machine-names/#renaming-a-machine), or if you’re scripting servers for easy access, [use `tailscale up` and pass in the `--hostname` flag](/kb/1241/tailscale-up/).
To learn more about how MagicDNS works, see [our blog post covering just this](/blog/magicdns-why-name).
### Fixing a long tail of DNS bugs
We’ve been working heads-down on MagicDNS for several months now. To get to the point where we could call MagicDNS generally available, we had to fix a lot of bugs. (It basically became a rite of passage for new Tailscalars to fix a MagicDNS bug before they could move on to other projects.) We’ve implemented these fixes and improvements in the last several client releases:
* In [v1.20](/changelog/#2022-01-12-client), we removed Android’s dependency on fallback resolvers. An Android device making a DNS query that Tailscale could not resolve now forwards the query to the OS’ DNS server, instead of requiring a global DNS server to be specified in Tailscale.
* Also in v1.20, Tailscale clients using an [exit node](/kb/1103/exit-nodes/) started forwarding DNS queries to the exit node.
* In [v1.24](/changelog/#2022-04-22-client), we added pointer records for Tailscale services to MagicDNS to return records with Tailscale service IP information.
* In [v1.26](/changelog/#2022-06-06-client), we made MagicDNS use [the netstack](https://pkg.go.dev/tailscale.com/wgengine/netstack) for packet handling, which added DNS-over-TCP and reassembly of fragmented UDP responses to handle particularly large responses.
* In v1.26, we also added the built-in DNS server to [tailscaled running on macOS](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS).
* In [v1.28](/changelog/#2022-07-18-client), we updated the iOS client to use netstack for DNS.
* Also in v1.28, we implemented automatic support for servers running on AWS, GCP, and Azure, and removed the requirement for fallback DNS servers.
All to say, this has been a long time coming. We’re at a point where we believe (and hope!) that we’ve addressed all the known bugs with MagicDNS. (As always, if you find any issues with Tailscale, please let us know by [contacting support](/contact/support/) or [filing an issue on GitHub](https://github.com/tailscale/tailscale).)
Just because MagicDNS is [generally available](/kb/1167/release-stages/#general-availability-ga) doesn’t mean we’re done with MagicDNS. We still have work to do — for example, we know you’d like us to add support for [custom records](https://github.com/tailscale/tailscale/issues/1543) and [subdomains](https://github.com/tailscale/tailscale/issues/3847) — and it’s [something we’ve been hoping to do for a long time, too](/blog/2021-09-private-dns-with-magicdns/#future-work).
### MagicDNS is enabled by default for new tailnets
Now that we feel confident MagicDNS will work in even the most thorny edge cases and haunted networks, we’ve enabled MagicDNS by default for all new tailnets.
If you already have a tailnet but aren’t using MagicDNS, all you have to do is enable it! Given the fixes to the past several client releases, we recommend you first update your devices to at least Tailscale v1.20 ([see your devices that are running older versions](https://login.tailscale.com/admin/machines?q=version:<1.20.0)), and then turn MagicDNS on in the [DNS page](https://login.tailscale.com/admin/dns) of the admin console, by clicking “Enable MagicDNS”.
### New `tail\<hex\>.ts.net` tailnet name format
As we enable MagicDNS for all tailnets, we’re changing how tailnet names are assigned. All tailnets will have a tailnet name of the form `tail\<hex\>.ts.net`, with a random hex. This is what will be used for MagicDNS, node sharing, and HTTPS in Tailscale. You can see your tailnet’s name in the [DNS page](https://login.tailscale.com/admin/dns) of the admin console. From there, you can also change your tailnet name to a randomly selected set of words (at this time, you can’t customize it further).
If you’ve already enabled MagicDNS, node sharing, or HTTPS, your tailnet already has a name in the form `\<domain\>.beta.tailscale.net`, `tailnet-\<hex\>.ts.net` or `tail-scale.ts.net`. Your unique tailnet name is used when registering DNS entries, [sharing your device to other tailnets](/kb/1084/sharing/), and [issuing TLS certificates](/kb/1153/enabling-https/).
Going forward, if you’re using a `beta` tailnet name, we ask you to migrate to the newly added tailnet name. For node sharing, this means [asking your sharees to use the new tailnet name](/kb/1084/sharing#sharing-and-magicdns). The existing `beta` name will be supported until at least November 1, 2023.
### Access a device without remembering an IP address
Using MagicDNS, you can access a device on your tailnet by its name on the command line:
```
`ssh prod-database
`
```
Or you can just navigate to a web address with the device name:
```
`http://monitoring
`
```
Charlotte demonstrates how to use MagicDNS.
To live in the magical world where this is possible, [enable MagicDNS on your tailnet](https://login.tailscale.com/admin/dns), and [read more about using MagicDNS in our documentation](/kb/1081/magicdns/).
Share
Authors
Charlotte Brandhorst-Satzkorn
Maisem Ali
Authors
Charlotte Brandhorst-Satzkorn
Maisem Ali
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)