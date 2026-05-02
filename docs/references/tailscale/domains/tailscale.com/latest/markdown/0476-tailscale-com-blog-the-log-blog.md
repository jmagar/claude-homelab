The Log Blog
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 14, 2020
# The Log Blog
Did you know that our CEO, apenwarr, is something of a B-list Internet celebrity? Part of his claim to fame is a pithy-but-informational blog, which contains a [pithy-but-informational post](https://apenwarr.ca/log/20190216) detailing exactly how to handle and parse a distributed logging system correctly. Tailscale’s logging infrastructure follows this system in broad strokes.
In apenwarr’s design, many embedded Linux devices buffer logs locally (to preserve them in case of crashes), and push them to a collection service. A separate grinder service extracts structured data from the logs and feeds that into a data pipeline.
There are a few points of difference between Tailscale’s system and the example provided. There’s a lot less kernel authoritarianism to contend with since Tailscale isn’t embedded. Goodbye, dmesg buffers. We also have fewer log producers to deal with (for now!). To be entirely honest, our pipeline is less of a straight path and more of an eldritch pipe cleaner horror with dependencies sticking out to an unconscionable number of data receptacles. In short, it removes a lot of the client-side complexity, so our log reading ends up looking like a simplified version of apenwarr’s:
1. Clients produce logs and try to stream them to our logs server. If the logs server can’t receive them for whatever reason, client machines temporarily store them locally. A cool logarithmic backoff timer coordinates retries.
2. The log catcher process running on the logs cluster catches the logs and stores them on disk. The idea is that it has *one job*: to make absolutely sure that the logs don’t get lost, and not much else.
3. Grinder is a separate process that also runs on the logs cluster. Each time a file is changed, this process ingests the new log lines for parsing. Following apenwarr’s log structure, we don’t intercept the line as it’s received — we read the new line that has already been stored.
4. Grinder stores parsed state mostly in memory for now. The majority of the data is either real-time or very short-term, so it’s not particularly important to persist. We do have the infrastructure in place to store processed information in an external database, however.
The first two pieces listed have existed for a while. The grinder components were less built out, so we worked on that over the past few months. With these improvements, users can now view their real-time network connection status from [the admin console](https://login.tailscale.com/admin).
### What do we log, anyway?
Generally, we avoid logging personally-identifying information. When we do, it’s to help us understand the health of the Tailscale processes running on a machine: how the frontend is communicating with the backend, what WireGuard encrypted tunnels are being made, the topology of your Tailscale network.
You can poke around at your Tailscale logs yourself! The shell command `journalctl -u tailscaled` will bring them up on Linux, and they’re searchable under the `IPNExtension` process on the Console app on macOS. A snippet of some logs could look something like this:
```
`magicsock: starting endpoint update (periodic)
netcheck: udp=true v6=true mapvarydest=false hair=false portmap=? v4a=50.65.165.51:59645 v6a=[2604:3d09:667f:e5e0:b57b:ae87:cffe:4a20]:51510 derp=10 derpdist=2v4:86ms,2v6:86ms,9v4:104ms,10v4:61ms,10v6:72ms
magicsock: netInfo update: NetInfo{varies=false hairpin=false ipv6=true udp=true derp=#10 portmap=? link=&quot;&quot;}
`
```
You can see a lot of connection metadata here (for example, do we have IPV6 connectivity? If so, what’s our IPV6 address?) that’s also accessible via the admin console — these are things that the coordination server knows. You’ll also get logs like
```
`peer keys: [as35d] [12=zq] [1/;3u] [w02m5] [29sn;] [+po12]
peers: 345682/189366 1223565/618917 52598/10478 327257367/4779195 524/444 816/440
`
```
which logs the currently active WireGuard tunnels and bytes sent/received. This info isn’t immediately accessible elsewhere.
As you can see, this logs nothing about the actual traffic going through Tailscale connections, only metadata about the tunnels themselves. The first lists the (abbreviated) keys of the nodes you’ve established tunnels with. The second line outputs the total number of bytes transmitted and received on each tunnel; these numbers reset each time your Tailscale restarts.
### Parsing the logs
First off, some terminology:
* A **user** is an account using Tailscale, typically associated with an email.
* A **device** is a machine — the hardware running Tailscale. Multiple users can be on one machine.
* A **node** is the combination of a user and a machine. Two users logging in on the same machine generates two different nodes; one user logging in on two different machines also generates two different nodes. 32-byte node keys identify nodes.
* A **log ID** identifies the logs produced on a specific machine. Machines can have different nodes at different times, so the mapping from log ID to machine isn’t one-to-one.
When the logs server reads a logline, it knows (1) the contents of the line and (2) the associated log ID. It doesn’t know any other information on its own, such as user email or node key — if it wants this information, it’ll have to get it from the coordination server.
The logs server does just that — it gets the mapping from log ID to user, and stores it only in memory. For connectivity data, it parses the lines mentioned above into a directed network graph, keying nodes by node keys (shocker) and weighting edges with the amount of data sent on that link.
These graphs are all associated with anonymized log IDs in the grinder process. When an end-user queries this data, we combine the log server’s responses and the coordination server to assemble log IDs by domain and display the node keys more intelligibly. This data is more or less real-time — grinder generally processes logs within 150μs of receipt!
The admin console queries this data and does some additional processing to display the connections your machines have made recently. It double-checks the data with the coordination server and pulls in some more relevant details to reveal to the user.
The grinder also parses out other user-facing and analytics data — things like sparklines of recent data activity, or kicking off an event when new nodes are registered. These visualizations haven’t made it to the admin console yet, but they branch out of the same general structure. Real-time log parsing carries a lot of potential, especially for user-facing benefits. We’re very excited to keep improving this system so that users can understand their Tailscale networks better!
Share
Author
Wendi Yu
Author
Wendi Yu
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