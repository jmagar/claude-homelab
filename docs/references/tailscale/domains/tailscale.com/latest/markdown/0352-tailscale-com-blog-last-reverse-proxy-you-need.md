The Last Reverse Proxy You’ll Ever Need | Automate Remote Access with Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsSeptember 20, 2024
# The last reverse proxy you'll ever need
Today’s video walks through connecting a Virtual Private Server (VPS) in the cloud to your locally hosted infrastructure over an encrypted Tailscale tunnel, backed by WireGuard technology. We start by automatically spinning up and configuring the cloud VPS on DigitalOcean to act as our entrypoint to your self-hosted ecosystem.
I was inspired to create this tutorial by a fascinating video in which [Wendell from Level1techs used HAProxy-WI](https://www.youtube.com/watch?v=Kh21q7LY-F8) to tunnel a connection between a cloud VPS and his home network. The same basic idea could be done — even easier! — with Tailscale. Essentially, this turns a cheap cloud VPS instance into a gateway to your self-hosted services connected to your tailnet (our term for a Tailscale network of devices).
There are some important differences between our implementation and Wendell’s, though. Firstly, and perhaps most importantly, thanks to Tailscale’s NAT traversal technology we don’t need to open any ports on our local firewalls. Direct connections are established between the cloud VPS and your local systems.
Secondly, rather than utilizing HAProxy we’re going to use a newer reverse proxy called [Caddy](https://caddyserver.com/). This automatically handles TLS certificates for you via an extremely simple configuration file syntax which makes adding and removing proxied sites easy.
If you’ve ever looked into hosting an application or service in the cloud that requires big amounts of storage — and for a Jellyfin server as we’re discussing today, “big” may mean multiple terabytes of media — then you’ve likely come to the conclusion that it is cost prohibitive.
Well, in the immortal words of Hubert Farnsworth: “Good news everyone!” We can have our cake *and* eat it too, by exposing these services to the public internet via a cloud VPS and then using Tailscale on the backend to connect to local storage — where we aren’t paying an arm and a leg — transparently to the end user.
In Jellyfin’s case this is uniquely useful for us. That’s because when it comes to remote access Jellyfin is very much a “batteries not included” solution. It’s up to you to provide the connectivity required for remote access by opening ports, etc. But with Tailscale, we don't need to do any of that. All the connections are secure, and encrypted. And the best thing is, they don't require you to lift a finger. Simply connect both nodes to your tailnet and you are good to go (disclaimer: watch the video for full info as there's a little more to it than that the first time)!
If this is your first time using anything like Ansible or Terraform then please let us know how you found the experience in the YouTube comments. We’re always looking for ways to improve these tutorials and connect better with the folks that use them.
Share
Author
Alex Kretzschmar
Author
Alex Kretzschmar
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