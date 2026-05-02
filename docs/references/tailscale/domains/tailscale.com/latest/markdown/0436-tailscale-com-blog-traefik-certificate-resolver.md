Traefik Proxy now offers Tailscale as certificate resolver
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 24, 2023
# Traefik Proxy now offers Tailscale as certificate resolver
[Traefik](https://traefik.io/traefik/), the popular load balancing and reverse proxy tool, has added support for Tailscale as a certificate resolver in Traefik Proxy 3.0 beta, the latest release of its forward proxy offering. Today, one of the engineers behind this integration has published [a fun deep dive into how it works](https://traefik.io/blog/exploring-the-tailscale-traefik-proxy-integration) and how they’re using Tailscale to help with testing at Traefik.
This new feature means you can now access HTTPS-enabled services on your tailnet behind Traefik Proxy, without the headache of separately handling certificates or exposing an endpoint to resolve TLS challenges from Let’s Encrypt. Instead, Tailscale can manage your certificate life cycle and automatically renew your Let’s Encrypt certificate, and will do so under this setup as long as Traefik is running.
Since Tailscale v1.14, Tailscale has made it [easy to provision and renew certificates with Let’s Encrypt](https://tailscale.com/blog/tls-certs/) by handling all of the DNS settings to make the whole process painless. Nevertheless, Tailscale users still had to jump through additional hoops if they wanted to access devices and services behind Traefik Proxy.
No longer! Now, once Traefik Proxy is configured to use Tailscale as its certificate resolver, it can make a quick request to the Tailscale API and provide that certificate to any routers it exposes. In the [beta announcement of this feature](https://traefik.io/blog/traefik-proxy-3-0-scope-beta-program-and-the-first-feature-drop/#tailscale-certificate-resolver), Traefik thanked its engineers Kevin and Mathieu for building a solution in their off-work hours — our thanks as well, Kevin and Mathieu.
To use this feature, first enable [HTTPS](/kb/1153/enabling-https/) in Tailscale, then, when launching Proxy, [add Tailscale as a certificate resolver in your Traefik config as a file or a command-line argument](https://doc.traefik.io/traefik/master/https/tailscale/). We’ve got [sample config files and more information in our documentation](/kb/1234/traefik-certificates/) if you’re interested. And make sure to check out [Traefik’s new deep dive post](https://traefik.io/blog/exploring-the-tailscale-traefik-proxy-integration) and its [documentation of this feature](https://doc.traefik.io/traefik/master/https/tailscale/) for more information.
Share
Author
Parker Higgins
Author
Parker Higgins
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