Secure Tailscale Internal Services with Easy TLS Certificates
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|September 22, 2021
# Provision TLS certificates for internal Tailscale services
Connections between Tailscale nodes are already [secured with end-to-end encryption](/blog/how-tailscale-works/)—that’s a huge benefit of being built on [WireGuard®](https://www.wireguard.com/). However, browsers are not aware of that because they rely on verifying the TLS certificate of a domain.
To protect a website with an HTTPS URL, you need a TLS certificate from a public Certificate Authority. Tailscale now makes that easily available for the machines in your Tailscale network, also known as a tailnet, with certificates provisioned from [Let’s Encrypt](https://letsencrypt.org/).
### Your browser doesn’t know about Tailscale
Tailscale is built on WireGuard. WireGuard protects connections between machines with end-to-end encryption at the network layer. This means that the packets you’re sharing between nodes on your network are encrypted over UDP.
However, when you’re connecting to a public website using a browser, you’re verifying that the website you’re connecting to is authenticated and encrypted over the HTTP protocol. This is done by [verifying the validity of a TLS certificate for that domain](https://howhttps.works/).
It’s common to use SSH to access services on your secure, private Tailscale network. You can also use Tailscale to access an internally hosted service like a dashboard that you can view in your browser. However, if your service doesn’t have a valid TLS certificate, despite the fact that your connection is encrypted using Tailscale, [your browser will warn you that the connection is not secure](https://support.google.com/chrome/answer/95617) (it’s doing the right thing—it doesn’t know about Tailscale!). So, to avoid confusing your users, you might want to provision a TLS certificate to validate your internal services. This isn’t a new concept—many internal networks rely on certificates from an internal Certificate Authority to verify that the services are legitimate.
### Automatically generate a certificate for each node in your network
Tailscale now makes it easy to obtain certificates for nodes in your tailnet.
Nodes generate a certificate private key and a Let’s Encrypt account private key, while the Tailscale client, via API calls to the Tailscale control plane, sets the TXT record needed for your nodes to complete a DNS-01 challenge.
To enable this feature, make sure you’re running Tailscale v1.14 or later, and go to the [Settings page of the admin console](https://login.tailscale.com/admin/settings/general).
Select “Configure HTTPS” and follow the steps, then run `tailscale cert` (with `sudo` as needed) on the nodes you’re obtaining a certificate for.
(If you’re using Go, the [tailscale.com/client/tailscale.GetCertificate](https://pkg.go.dev/tailscale.com/client/tailscale#GetCertificate) function implements the [tls.Config.GetCertificate](https://pkg.go.dev/crypto/tls#Config.GetCertificate) to [do it all automatically](https://github.com/tailscale/tailscale/blob/main/client/tailscale/example/servetls/servetls.go).)
That’s it, we’ll handle the rest!
Share
Authors
David Crawshaw
Brad Fitzpatrick
Charlotte Brandhorst-Satzkorn
Alessandro Mingione
Authors
David Crawshaw
Brad Fitzpatrick
Charlotte Brandhorst-Satzkorn
Alessandro Mingione
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