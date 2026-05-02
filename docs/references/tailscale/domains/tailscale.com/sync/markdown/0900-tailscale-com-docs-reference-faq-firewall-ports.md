What firewall ports should I open to use Tailscale? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# What firewall ports should I open to use Tailscale?
Last validated: Feb 2, 2026
Most of the time, you [don't need to open any firewall ports for Tailscale](/docs/integrations/firewalls). Tailscale uses
[various NAT traversal techniques](/blog/how-nat-traversal-works) to safely connect to other Tailscale nodes
without manual intervention—it "just works."
However, when both devices are on difficult networks Tailscale may not be able to
connect devices peer-to-peer. You'll still be able to send and receive traffic,
thanks to [our secure relays (DERP)](/docs/reference/derp-servers),
but the relayed connection won't be as fast as a peer-to-peer one.
In these cases, you may consider opening a firewall port to help Tailscale
connect peer-to-peer:
* Let your internal devices start TCP connections to `\*:443`.
Connections to the [coordination server](/docs/concepts/control-data-planes#coordination-server) and other backend systems and data connections to the DERP relays use HTTPS on port `443`.
The set of DERP relays, in particular, grows over time. We recommend `\*:443` because attempting to enumerate the set of
allowed destinations is almost certain to break your connectivity in the future in ways which won't immediately resemble a
firewall issue. Nodes might lose all contact, or might only partially lose contact between what will appear to be random
pairs of devices because one of them is blocked from communicating with a specific DERP.
* Let your internal devices start UDP **from** `:41641` to `\*:\*`.
Direct WireGuard tunnels use UDP with source port `41641`. We recommend `\*:\*` because you cannot possibly predict every guest
Wi-fi, coffee shop, LTE provider, or hotel network that your users may be using.
* Let your internal devices start UDP to `\*:3478`.
The STUN protocol lets a machine behind NAT ask a machine on the open internet what IP address it sees, allowing the machine
behind NAT to figure out its public IP address. STUN also reports the port number seen, which lets `tailscaled` to
determine if it is behind "easy NAT" (source port maps to the same external port for all destinations) or "hard NAT" (port
number varies per destination). `tailscaled` only sends STUN to DERP servers, but the set of DERP servers expands over time
so we recommend `\*:3478` in the rule.
* Let your internal devices start HTTP (TCP) connections to `\*:80`.
Connections to the [coordination server](/docs/concepts/control-data-planes#coordination-server) prefer to use HTTP on port `80` with an efficient encrypted transport. However, if the coordination server doesn't respond on this port, the client will fall back to using HTTPS on port `443`.
For [captive portal](/docs/integrations/captive-portals) detection and notifications, Tailscale attempts to contact a set of relay servers that are known to accept incoming connections on TCP port `80`. The client executes an unencrypted HTTP request reaching out to a `/generate\_204` endpoint on the relay server. This endpoint is expected to return an HTTP response with a `204` status code.
It is not mandatory to allow these connections, and you can choose to drop them in your firewall rules, resulting in a timeout. If disabled, clients might experience delays when connecting to Tailscale and captive portal detection won't function properly.
In July of 2025, the domains `login.tailscale.com` and `controlplane.tailscale.com` began resolving to static IP address ranges registered to Tailscale.
We recommend configuring firewalls using domain names rather than hardcoding IP addresses. However, if IP-based rules are required, the following ranges should be explicitly allowed:
* **IPv4**: `192.200.0.0/24`
* **IPv6**: `2606:B740:49::/48`
Scheduled for November of 2025, the domain `log.tailscale.com` will resolve to static IP address ranges registered to Tailscale.
We recommend configuring firewalls using domain names rather than hardcoding IP addresses. However, if IP-based rules are required, the following ranges should be explicitly allowed:
* **IPv4**: `199.165.136.0/24`
* **IPv6**: `2606:B740:1::/48`
## [How can I tell if my devices are using a relay?](#how-can-i-tell-if-my-devices-are-using-a-relay)
Relays are used per-device-pair. To check if a device is talking to another device over a relay, run
`tailscale status` ([docs](/docs/reference/tailscale-cli)) from either device.
The `tailscale status` command will return a table of results for every device it can access over Tailscale. For
example:
```
`1 2 3 4 5
100.1.2.3 device-a alice@ linux active; direct \<ip-port\>, tx 1116 rx 1124
100.4.5.6 device-b bob@ macOS active; relay \<relay-server\>, tx 1351 rx 4262
100.7.8.9 device-c charlie@ windows idle; tx 1214 rx 50
100.0.1.2 device-d diane@ iOS -
`
```
If a device is active in the tailnet, for the connection status (column 5) will contain "direct" for peer-to-peer connections,
along with the IP address used to connect, or "relay" for connections using DERP, along with a city code, such as `nyc` or `fra`, for the respective location.
## [My devices are using a relay. What can I do to help them connect peer-to-peer?](#my-devices-are-using-a-relay-what-can-i-do-to-help-them-connect-peer-to-peer)
If two of your devices are on difficult networks, allowing connections to UDP
port `41641` on one of them may help Tailscale make a peer-to-peer connection,
rather than falling back to a relay.
On Ubuntu, for example, you can do this with the built-in `ufw` command by running:
```
`sudo ufw allow 41641/udp
`
```
For more information on NAT traversal, our blog post [*How NAT Traversal Works*](/blog/how-nat-traversal-works)
shares all the details.
## [What if I really, really want to specify the hostnames that Tailscale uses to operate its service?](#what-if-i-really-really-want-to-specify-the-hostnames-that-tailscale-uses-to-operate-its-service)
In situations where this is unavoidable you can allow exceptions for a list of fully qualified domain names (FQDNs). We
strongly recommend automating the process of keeping the allowed hostnames in sync to ensure you minimize disruption from
changes made to Tailscale's infrastructure.
The list of **coordination servers** (required for authentication, key exchange, firewall updates, and so on) is likely
to change, but infrequently:
* `console.tailscale.com`
* `controlplane.tailscale.com`
* `log.tailscale.com`
* `login.tailscale.com`
Additionally, the **DERP relay servers** (which will definitely change from time to time) are accessed at TCP port `443`.
DERP servers are named as `derpN` where `1 \<= \*N\* \<= 28` as of August 2025 (the upper range for *N* is likely to increase). Tailscale creates a `derpN-all` entry with multiple A (IPv4) and AAAA (IPv6) records, one record per DERP server in the region.
So your allowlist of DERP DNS entries would look like:
* `derp1-all.tailscale.com`
* `derp2-all.tailscale.com`
* `...`
* `derp28-all.tailscale.com`
If you have [removed Tailscale's DERP regions](/docs/reference/derp-servers/custom-derp-servers#optional-remove-tailscales-derp-servers) from your DERP map, you can skip the DNS entries for the
removed regions.
DERP servers are frequently added or changed, depending on user locations, to optimally serve Tailscale customers. After
a DERP server is added or changed, Tailscale updates DNS entries about 15 minutes later. To access the up-to-date list of
Tailscale DERP servers, visit the [DERP map](https://login.tailscale.com/derpmap/default).
Alternatively, you can run this command:
```
`curl https://login.tailscale.com/derpmap/default | jq
`
```
Once you've identified the servers, add the relevant A and AAAA records to your firewall configuration.
If your firewall is able to accept a DNS entry to add L3 tailnet policy file entries, will add all the A and AAAA
records it finds, and will periodically refresh its tailnet policy file entries by re-fetching from DNS, you can configure the `derpN-all.tailscale.com` entries and then not need to constantly update the list of DERP servers.
On this page
* [How can I tell if my devices are using a relay?](#how-can-i-tell-if-my-devices-are-using-a-relay)
* [My devices are using a relay. What can I do to help them connect peer-to-peer?](#my-devices-are-using-a-relay-what-can-i-do-to-help-them-connect-peer-to-peer)
* [What if I really, really want to specify the hostnames that Tailscale uses to operate its service?](#what-if-i-really-really-want-to-specify-the-hostnames-that-tailscale-uses-to-operate-its-service)
Scroll to top