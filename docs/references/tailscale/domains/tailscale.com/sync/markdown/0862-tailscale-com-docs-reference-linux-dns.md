Configuring Linux DNS · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Configuring Linux DNS
Last validated: Jan 5, 2026
There are [an incredible number of ways](/blog/sisyphean-dns-client-linux) to configure DNS on Linux.
Tailscale attempts to interoperate with any Linux DNS configuration it
finds already present. Unfortunately, some are not entirely amenable
to cooperatively managing the host's DNS configuration.
## [Common problems](#common-problems)
### [NetworkManager + systemd-resolved](#networkmanager--systemd-resolved)
If you're using both NetworkManager and systemd-resolved (as in
common in many distros), you'll want to make sure that
`/etc/resolv.conf` is a symlink to
`/run/systemd/resolve/stub-resolv.conf`. That should be the
default. If not,
```
`sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
`
```
When NetworkManager sees that symlink is present, its default behavior
is to use systemd-resolved and not take over the resolv.conf file.
After fixing, restart everything:
```
`sudo systemctl restart systemd-resolved
sudo systemctl restart NetworkManager
sudo systemctl restart tailscaled
`
```
### [DHCP `dhclient` overwriting `/etc/resolv.conf`](#dhcp-dhclient-overwriting-etcresolvconf)
Without any DNS management system installed, DHCP clients like
`dhclient` and programs like `tailscaled` have no other options than
rewriting the `/etc/resolv.conf` file themselves, which results in
them sometimes fighting with each other. (For instance, a DHCP renewal
rewriting the `resolv.conf` resulting in loss of MagicDNS functionality.)
Possible workarounds are to use `resolvconf` or `systemd-resolved`.
[Issue 2334](https://github.com/tailscale/tailscale/issues/2334) tracks making Tailscale react to other
programs updating `resolv.conf` so Tailscale can add itself back.
### [DNS issues with Amazon Linux](#dns-issues-with-amazon-linux)
On Amazon Linux, Tailscale's DNS can break due to an infinite forwarding loop. When Tailscale backs up and replaces `/etc/resolv.conf` with its own DNS server (`100.100.100.100`), `systemd-resolved` adds that address to the backup file. Later, when Tailscale re-reads the backup to find upstream DNS servers, it forwards queries to itself, creating a loop that breaks DNS resolution. This is especially known to occur on Amazon Linux 2023.
A workaround to this issue is to reconfigure `systemd-resolved` from Amazon's legacy mode to stub resolver mode by masking Amazon's custom configuration and pointing `/etc/resolv.conf` to the stub resolver.
```
`mkdir -p /etc/systemd/resolved.conf.d
ln -sf /dev/null /etc/systemd/resolved.conf.d/resolved-disable-stub-listener.conf
ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf
`
```
On this page
* [Common problems](#common-problems)
* [NetworkManager + systemd-resolved](#networkmanager--systemd-resolved)
* [DHCP dhclient overwriting /etc/resolv.conf](#dhcp-dhclient-overwriting-etcresolvconf)
* [DNS issues with Amazon Linux](#dns-issues-with-amazon-linux)
Scroll to top