Tailscale and the Synology Package Center: Secure Remote Access for Developers"
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 18, 2021
# Tailscale joins the Synology Package Center
Tailscale is officially supported in the [Synology package center](https://www.synology.com/en-global/dsm/packages/Tailscale?search=tailscale). Tailscale + Synology makes it effortless to securely access your Synology NAS from anywhere in the world, on any device. You can also use it as a relay back to other devices on your LAN.
You asked and we listened. Our most [requested feature](https://github.com/tailscale/tailscale/issues?q=is:issue+reactions:>2+sort:reactions-+1-desc+) was for Synology support, and today we are officially announcing our availability in the Synology Package Center. Whether you are someone who wants to securely access your Plex media while away from home, or a DevOps team at a Fortune 500 looking to share a file server now that no one is in the office – we’ve got you covered.
### So what does this mean?
In the modern world, file sharing is cumbersome. It is expensive. And even if you are an IT wizard (without the funny hat) it’s hard to secure. At Tailscale we believe file sharing is not a complete product until you can access the files remotely and securely. Together, Tailscale and Synology provide these features:
* Web-based login to any [supported identity provider](/kb/1013/sso-providers/).
* Access your Synology NAS from anywhere, [without opening firewall ports](/blog/how-nat-traversal-works/).
* Share your NAS with designated Tailscale users even outside your company, using [node sharing](/kb/1084/sharing/).
* Restrict access to your NAS using [ACLs](/kb/1018/acls/).
* Use your NAS as a [subnet router](/kb/1019/subnets/) to provide external access to your LAN, replacing a traditional standalone VPN server.
* Use your NAS as an [exit node](/kb/1103/exit-nodes/) for safe Internet access even when you’re in an untrusted location like an Internet cafe.
“Our number one feature request by far was for an official Tailscale Synology package. Getting it into the Package Center saves so much time: instead of dropping into a command line and SSH-ing in, you just install the app and suddenly you can access your Synology from anywhere, and securely share it with any other Tailscale user,” said Avery Pennarun, CEO and co-founder, Tailscale. “This gives anyone the ability to essentially build their own Dropbox-like tool without having to host any content in the cloud.”
To get started using Tailscale with your Synology, see our [Tailscale + Synology documentation](/kb/1131/synology/).
Special thanks to [Guilherme de Maio](https://github.com/nirev/), who contributed to the original Synology-Tailscale package. Tailscale now maintains the package builder and produces our official Synology packages.
Share
Author
Laura Franzese
Author
Laura Franzese
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