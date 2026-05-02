Caddy certificates on Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Caddy certificates on Tailscale
Last validated: Jan 5, 2026
[Caddy](https://caddyserver.com) is a web server that makes HTTPS easy. Starting with the beta release of
[Caddy 2.5](https://github.com/caddyserver/caddy/releases/tag/v2.5.0-beta.1), Caddy supports Tailscale. When Caddy gets an HTTPS request for a `\*.ts.net`
site, it gets the HTTPS certificate from the machine's local Tailscale daemon. There's no
configuration required for the certificate. For example, you can use a [Caddyfile](https://caddyserver.com/docs/caddyfile/patterns) for a
static file server, and it automatically enables HTTPS:
```
`machine-name.domain-alias.ts.net
root \* /var/www
file\_server
`
```
## [Provide non-root users with access to fetch certificate](#provide-non-root-users-with-access-to-fetch-certificate)
If Caddy is running as a non-root user, such as when it runs on Debian as `caddy`, you need to
modify `/etc/default/tailscaled` to grant the user access to fetch the certificate.
In `/etc/default/tailscaled`, set the `TS\_PERMIT\_CERT\_UID` environment variable to the name or ID
of the non-root user:
```
`TS\_PERMIT\_CERT\_UID=caddy
`
```
For more information about Caddy, refer to [Get started with Caddy](https://caddyserver.com/docs/getting-started).
On this page
* [Provide non-root users with access to fetch certificate](#provide-non-root-users-with-access-to-fetch-certificate)
Scroll to top