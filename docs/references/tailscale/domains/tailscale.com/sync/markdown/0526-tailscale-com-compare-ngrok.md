ngrok vs. Tailscale | Comparing Business VPN Replacements
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Go back](/compare#vpn-comparisons)
[Compare](/compare)
ngrok
# ngrok vs. Tailscale
On this page
[
Use Tailscale
](https://login.tailscale.com/start)[
Contact Sales
](/contact/sales)
ngrok is a developer-oriented tunneling product that generates public URLs for web servers running on a local machine. It allows others with access to the URL to connect to your machine, even through NATs and firewalls.
Both ngrok and Tailscale allow users to share what’s on their [local network](https://tailscale.com/kb/1103/exit-nodes) with other users. In this article, we’ll compare Tailscale to ngrok so you can decide what’s best for your use case.
### [Comparison matrix](#comparison-matrix)
||Tailscale|ngrok|
|Share localhost via URL
|Yes
|Yes
|
|WireGuard-based
|Yes
|No
|
|Open source
|Yes (clients but not coordination server)
|No
|
|End-to-end encryption
|Yes
|Yes\*
|
|Role-based access control
|Yes (uses ACLs)
|No (can use passwords)
|
|Integrates with identity providers for single sign-on
|Yes
|Yes (Google only, paid)
|
|Custom aliases
|Yes ([MagicDNS](/kb/1081/magicdns/))
|Yes ([stable URL](https://ngrok.com/docs#getting-started-stable), paid)
|
|Traffic can be inspected
|No (end to end encrypted)
|Yes ([all traffic logged](https://ngrok.com/docs#getting-started-inspect))
|
|Certificates for HTTPS traffic to your machine
|Yes ([must be enabled](/kb/1153/enabling-https/))
|No ([terminates at ngrok.com, must obtain certificates for your own domain](https://ngrok.com/docs#tls))
|
|Works for all traffic
|Yes
|Yes (HTTP/S tunnels and TCP tunnels)
|
|Pricing
|Freemium model (free for individual users, costs for teams and enterprise)
|Freemium model (free for 1 online process, paid for more)
|
*\*Only when using ngrok TLS Tunnels*
### [Initial setup](#initial-setup)
With ngrok, once you’ve built your web service locally, you can use the ngrok CLI to generate a URL. All you need to do is pass it the type of tunnel and port.
As an alternative to ngrok, Tailscale lets you generate a publicly accessible URL and proxy HTTP traffic directly to a node in your Tailnet using [Tailscale Funnel (beta)](https://tailscale.com/blog/introducing-tailscale-funnel/). Tailscale needs to be configured at both ends of your connection. You simply install and log into Tailscale on each device using your organization’s SSO identity provider, and ([create an ACL](https://tailscale.com/kb/1018/acls/)) that allows the two machines to communicate. If you’re on different networks, you can use ([node sharing](https://tailscale.com/kb/1084/sharing/)) to share one host with another.
### [Connectivity](#connectivity)
Both ngrok and Tailscale allow you to [connect directly](https://tailscale.com/kb/1257/connection-types) to your local machine hosting a web server from other machines.
ngrok tunnels a connection from your machine to the machine hosting the web server through ngrok.com. A user connects to the url through their browser, which terminates at ngrok.com before forwarding the request to your local machine.
Tailscale allows you to connect directly from your machine to the machine hosting the web server with a peer to peer connection.
### [Security](#security)
By default, ngrok uses a URL address that is public and visible to anyone on the internet. Anyone who has the URL can access your service. For additional security, paid plans include the ability to use IP allowlisting. This allows you to specify exactly which IPs should be able to see the service, but requires manual configuration steps for each new IP. You can also protect URLs using HTTP basic [authentication](https://tailscale.com/kb/1085/auth-keys), so that a user needs a password to access your URL.
With Tailscale, everything is private. There are no public addresses ever exposed. The only people who can access your local service over Tailscale are people in your Tailscale network or people you’ve explicitly [shared your device with](https://tailscale.com/kb/1084/sharing/).
### [Performance](#performance)
Both ngrok and Tailscale allow you to connect directly from your machine to the machine hosting the web server.
ngrok tunnels a connection from your machine to the machine hosting the web server through ngrok.com. A user connects to the url through their browser, which terminates at ngrok.com before forwarding the request to your local machine.
Tailscale allows you to connect directly from your machine to the machine hosting the web server, with a low latency peer to peer connection.
### [Domain customization](#domain-customization)
Remembering IP addresses is hard. It can often be easier to type or remember human-readable domain names.
With ngrok, by default the URL address they give you is randomly generated each time you want to expose a service. Their paid plans support custom domain creation which is easier to remember when sharing out your local web servers, such as `https://myapp.ngrok.io`.
With Tailscale, [MagicDNS](https://tailscale.com/kb/1081/magicdns/) automatically registers human-readable names to your Tailscale devices. If you enable MagicDNS, you can use your device’s DNS name to access your services from other machines.
Suppose your [device’s name](https://tailscale.com/kb/1098/machine-names) is “happy-mac.” With MagicDNS enabled, your colleague can just visit `happy-mac:3000` in their browser to view your [website](https://tailscale.com/kb/1214/site-to-site). No need to type out the Tailscale IP. Your DNS name doesn’t change, so you don’t have to share new URLs each time you restart your server.
### [Support for other types of services](#support-for-other-types-of-services)
ngrok allows you to configure both web services over HTTP and HTTPS, as well as other TCP service types over TLS tunnels.
Tailscale doesn’t limit you to TCP. Tailscale supports any IP protocol (TCP, UDP, etc), whereas ngrok only supports TCP. Users often use Tailscale to share other services between their different devices. One example would be sharing an IP camera over Tailscale, or streaming RTSP video over UDP.
### [The bottom line](#the-bottom-line)
If you’re developing a service locally, and are trying to share it over HTTP/S and TCP only, ngrok generates a very simple URL for sharing, so that anyone can access your service from a browser. ngrok is also a good choice when the user you’re sharing with is unable to install a client.
If you’re trying to share a service without it being publicly accessible and with end-to-end encryption, try Tailscale. Tailscale also lets you share more than just TCP based services. Tailscale lets you restrict sharing to a particular set of people, such as those in your organization; security features like SSO are available even on the free tier.
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)