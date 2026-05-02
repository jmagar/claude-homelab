Traefik certificates on Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Traefik certificates on Tailscale
Last validated: Jan 5, 2026
[Traefik](https://doc.traefik.io) simplifies networking complexity while designing, deploying, and operating applications. Starting with
the release of [Traefik Proxy 3.0 Beta 1](https://github.com/traefik/traefik/blob/master/CHANGELOG.md#v300-beta1-2022-12-05), Traefik Proxy supports Tailscale. When Traefik gets
an HTTPS request for a `\*.ts.net` site, it gets the HTTPS certificate from the machine's local Tailscale daemon.
No configuration is required for the certificate.
For example, you can define a certificate resolver in the [static configuration](https://doc.traefik.io/traefik/getting-started/configuration-overview/#the-static-configuration), and it automatically enables HTTPS:
[YAML](/docs/integrations/web-servers/traefik/traefik-certificates?tab=yaml)[TOML](/docs/integrations/web-servers/traefik/traefik-certificates?tab=toml)[CLI](/docs/integrations/web-servers/traefik/traefik-certificates?tab=cli)
```
`certificatesResolvers:
myresolver:
tailscale: {}
`
```
Then, for each router or entrypoint where you want to use it, explicitly reference the
resolver in the [dynamic configuration](https://doc.traefik.io/traefik/getting-started/configuration-overview/#the-dynamic-configuration):
[YAML](/docs/integrations/web-servers/traefik/traefik-certificates?tab=yaml)[TOML](/docs/integrations/web-servers/traefik/traefik-certificates?tab=toml)
```
`http:
routers:
routertailscale:
service: "myservice"
rule: "Host(`example.foo.ts.net`) && Path(`/tailscale`)"
tls:
certResolver: tailscale
services:
myservice:
loadBalancer:
servers:
- url: "http://localhost:6060"
`
```
For complete details, refer to the [Traefik Tailscale documentation](https://doc.traefik.io/traefik/master/https/tailscale) at Traefik's web site.
For more information about Traefik, refer to [Traefik Quick Start](https://doc.traefik.io/traefik/getting-started/quick-start).
Scroll to top