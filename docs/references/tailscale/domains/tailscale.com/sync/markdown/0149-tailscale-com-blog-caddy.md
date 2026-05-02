Use Caddy to Manage Tailscale HTTPS Certificates
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|March 15, 2022
# Use Caddy to manage Tailscale HTTPS certificates
When you connect to a web application on your tailnet over plain HTTP, you might get a security warning in your browser. Although your tailnet’s connections use WireGuard, which provides end-to-end encryption at the network layer, your browser isn’t aware of that encryption—so it looks for a valid TLS certificate for that domain. For internal web apps, this can be confusing to your users, so Tailscale already allows you to [provision HTTPS certificates](/kb/1153/enabling-https/) from Let’s Encrypt for your internal web applications, with `tailscale cert`.
If you’re running a public web server, though, it will need to get the certificate from Tailscale to serve your sites over HTTPS on your tailnet. [Caddy](https://caddyserver.com/) is an open source web server—and unlike most web servers, it provisions and manages HTTPS certificates for you. (We love it because it uses HTTPS by default!) Caddy also manages renewing these certificates automatically.
**With the [beta release of Caddy 2.5](https://github.com/caddyserver/caddy/releases/tag/v2.5.0-beta.1), Caddy automatically recognizes and uses certificates for your Tailscale network (`\*.ts.net`), and can use Tailscale’s HTTPS certificate provisioning when spinning up a new service.**
To use Caddy with your Tailscale network, first make sure you have HTTPS certificates enabled on your tailnet. Then you will either need to run Caddy as root, or [configure the Caddy user to have access to Tailscale’s socket](/kb/1190/caddy-certificates/#provide-non-root-users-with-access-to-fetch-certificate).
There’s nothing else you need to do: Caddy will automatically get its certificates for `\*.ts.net` domains from Tailscale without any special configuration. See the [documentation](/kb/1190/caddy-certificates/) to learn more.
To demonstrate, here’s a minimal Caddyfile example:
```
`machine-name.domain-alias.ts.net
root \* /var/www
file\_server
`
```
[Get started with Caddy](https://caddyserver.com/docs/getting-started) to run web servers on Tailscale.
Share
Author
Brad Fitzpatrick
Author
Brad Fitzpatrick
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