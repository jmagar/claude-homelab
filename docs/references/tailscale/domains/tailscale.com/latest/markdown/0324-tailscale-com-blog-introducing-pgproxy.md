Protect Your PostgreSQL Database with Tailscale’s pgproxy
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 04, 2022
# Don’t make databases available on the public internet
… But if you must, we made something that can help you do it right.
The folks at [bit.io](https://bit.io/) just published an [excellent review of PostgreSQL security](https://innerjoin.bit.io/the-majority-of-postgresql-servers-on-the-internet-are-insecure-f1e5ea4b3da3), with a startling conclusion: the vast majority of PostgreSQL connections that are happening over the public internet are insecure, due to a combination of server misconfigurations and most clients unfortunately defaulting to unsafe settings.
In short: most Postgres clients either don’t enforce TLS at all on the connections to servers, or enforce that a TLS handshake happens but don’t verify that the certificate is valid and matches the expected hostname. What this means in practice is that those connections can be trivially interposed by anyone sitting between the client and server - a classic Machine in the Middle (MitM) attack.
You might think that a MitM is hard to pull off, so it’s not *that* bad. And it’s true, it’s not a completely trivial attack. But if your data is precious enough, someone will absolutely just [hijack your IP address space](https://web3isgoinggreat.com/?collection=domain-attack&amp;id=celernetwork-suffers-dns-hijacking-attack) to get at your connections. And I hope nobody at your company ever connects to your database over any kind of public wifi, because [that can end quite badly](https://shop.hak5.org/products/wifi-pineapple).
Let’s say we want to make sure we’re not vulnerable to this. Turns out, that’s fairly difficult. Of course, you should select a database vendor that supports TLS for incoming connections *and* gives you the associated CA certificate out of band, so that you can verify the connection. The bigger problem is the clients. You have to configure every single one to do strict TLS verification, and missing just one makes you vulnerable.
Worse, there’s no way for the server to know if the client did strict verification! From the server’s perspective, a client that requests a TLS handshake but doesn’t check the certificate properly is indistinguishable from a client that did TLS correctly. It’s a bit of a remediation and monitoring nightmare.
## Introducing pgproxy
Fortunately, Tailscale can help! We’re open-sourcing a [TLS-enforcing Postgres proxy](https://github.com/tailscale/tailscale/tree/main/cmd/pgproxy) that we wrote when we discovered this problem in our own infrastructure.
Please excuse the crudity of this drawing, I didn’t have time to build it to scale or paint it.
As the name suggests, this proxy sits between your Postgres client and your cloud-hosted database. It only accepts connections from clients over Tailscale, by using our [tsnet](https://pkg.go.dev/tailscale.com/tsnet) library. This makes the client’s configuration irrelevant from a security perspective: no matter what transport security settings Postgres is using, the connection to the proxy is secured, authenticated, and authorized by Tailscale.
When the proxy receives a connection from a client, it connects to the upstream database. It supports exactly one mode for this connection: TLS with full verification (aka “what you would have hoped every TLS client already did, but here we are”, sob). So, the connection from the proxy to the cloud database is as secure as any HTTPS session from your browser.
Finally, once the upstream connection is established and verified, the proxy splices the two connections together, and gets out of the way. The Postgres wire protocol is such that we can get away with just parsing the initial handshake from the client, in order to determine if the client wants plaintext or a homeopathic TLS connection. We give it whichever one it wants (remember, with Tailscale in the picture it doesn’t matter), and then get out of the way and let the client and server talk amongst themselves.
Deploying the proxy is quite simple: run it somewhere, get it logged onto your tailnet, and verify by hand that you’re able to connect through to your cloud database, for example with the `psql` command line client. Then migrate your existing clients to connect through the proxy, and finally set an IP address allowlist on the cloud database to only permit connections from the proxy.
You get a couple of bonus features with this setup: now that clients use Tailscale for part of the datapath, you can use [Tailscale’s network ACLs](http://tailscale.com/kb/1018/acls/) to add fine-grained control over who can connect to the database at all, regardless of whether they have database credentials. And the proxy writes out an audit log of all the connections it relays, complete with the Tailscale identity (both machine name and user name) of the client.
This is a good example of a very powerful property of Tailscale: because it operates at the IP layer rather than as a layer on top of HTTP requests, you can use it to give older or misconfigured software a transparent security upgrade, without having to rewrite everything or change your workflows.
Share
Author
David Anderson
Author
David Anderson
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