Tailscale Serve · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale Serve
Last validated: Jan 20, 2026
The CLI commands for both [Tailscale Funnel](/docs/reference/tailscale-cli/funnel) and [Tailscale Serve](/docs/reference/tailscale-cli/serve) have changed in the 1.52 version of the Tailscale client. If you've used Funnel or Serve in previous versions, we recommend reviewing the CLI documentation.
Tailscale Serve lets you route traffic from other devices on your Tailscale network (known as a tailnet) to a local service running on your device. You can think of this as sharing the service, such as a website, with the rest of your tailnet. This page provides information about how Serve works and how to get started with it in your tailnet. For more specific use cases, refer to [Tailscale Serve examples](/docs/reference/examples/serve).
If you'd like to share local services publicly over the internet, use [Tailscale Funnel](/docs/features/tailscale-funnel) instead.
## [Get started with Serve](#get-started-with-serve)
Tailscale Serve requires you to enable HTTPS certificates in your tailnet.
Additionally, keep in mind that [access control rules](/docs/features/access-control) apply to Serve just like any other service. If you have access control rules that restrict access to certain devices or users, those rules will also apply to the services you're sharing with Serve.
If you don't have HTTPS enabled in your tailnet, the Tailscale CLI command [`tailscale serve`](/docs/reference/tailscale-cli) provides an interactive web UI that prompts you to allow Tailscale to enable HTTPS on your behalf.
The `serve` command prompts you as needed and sends you to a web consent page to enable any unmet requirements.
**Tailscale Funnel** is enabled by default. If you don't plan to use [Tailscale Funnel](/docs/features/tailscale-funnel) on the device, you can turn it off.
## [Run Tailscale Serve](#run-tailscale-serve)
If you run the [`tailscale serve`](/docs/reference/tailscale-cli) command and your tailnet isn't properly configured to use Tailscale Serve, it presents a login server URL that you can follow to enable the feature.
Tailscale Serve lets you serve local directories, files, plain text, or local ports with other devices in your tailnet. For example, you can proxy requests to a web server running at `http://127.0.0.1:3000` using the following command:
```
`tailscale serve 3000
`
```
Run `tailscale serve --help` for more examples.
The CLI opens a foreground session that displays the status of what it's serving and the URL you can use to access your server:
```
`tailscale serve 3000
Available within your tailnet:
https://amelie-workstation.pango-lin.ts.net
|-- / proxy http://127.0.0.1:3000
Press Ctrl+C to exit.
`
```
## [Identity headers](#identity-headers)
Serve traffic includes identity headers when serving traffic from your tailnet using Tailscale Serve. Funnel traffic, which is publicly available, does not include identity headers.
When you use Serve to proxy traffic to a local service running on your device, it adds a few [Tailscale identity](/docs/concepts/tailscale-identity) headers to the request sent to your backend. The destination server can use these headers to identify the Tailscale user associated with the request. If Serve finds the following headers on an incoming request, it will remove them for security reasons, to avoid header spoofing.
* `Tailscale-User-Login`: Filled with the requester's login name (for example, `alice@example.com`).
* `Tailscale-User-Name`: Filled with the requester's display name (for example, `Alice Architect`).
* `Tailscale-User-Profile-Pic`: Filled with the requester's profile picture URL, if their identity provider provides one (for example, `https://example.com/photo.jpg`).
If the values contain non-ASCII values, Tailscale might use [RFC2047](https://www.rfc-editor.org/rfc/rfc2047.html) "Q" encoding (for example, `=?utf-8?q?Ferris\_B=C3=BCller?=`).
These identity headers are not populated for traffic originating from [tagged devices](/docs/features/tags).
You can use the identity headers with a custom backend or third-party services that offer authentication proxy authentication, such as [Grafana](https://grafana.com/docs/grafana/latest/setup-grafana/configure-security/configure-authentication/auth-proxy/#configure-auth-proxy-authentication).
Although identity headers are only populated for tailnet traffic, this includes traffic from external users who have accepted a share of your device. For example, if you share a device with a friend and have it configured with a Serve proxy, Tailscale populates the identity headers when your friend visits the Serve URL.
When you use the identity headers to authenticate to a backend service, it's best practice to only have the service listen on localhost. Otherwise, any user that can call your service directly (rather than with the Serve URL) could trivially provide their own values for these HTTP headers. By listening only on localhost, this limits tampering to only other services running on the Serve device, and not anyone on your LAN or tailnet.
## [App capabilities header](#app-capabilities-header)
Serve traffic can be configured to forward a header with selected app capabilities of the connected user or tagged device. Similar to identity headers, this isn't available for Funnel traffic, which is publicly available.
This feature is available in Tailscale v1.92 or later.
When you use Serve to proxy traffic to a local service running on your device, you can use the `--accept-app-caps` command line flag to specify which [app capabilities](/docs/features/access-control/grants/grants-app-capabilities) of a user or tagged node Serve should forward.
If a user or tagged node that makes a request has been granted any of the app capabilities specified, Serve will convert them into serialised JSON and forward them in a header called `Tailscale-App-Capabilities`.
For an example of what this can look like, refer to the [Tailscale Serve examples](/docs/reference/examples/serve#forward-app-capabilities-with-serve).
Tailscale uses [RFC2047](https://www.rfc-editor.org/rfc/rfc2047.html) "Q" encoding for values that contain non-ASCII characters (for example, `=?utf-8?q?{"example.com/cap/monitoring":[{"role":"=F0=9F=90=BF=EF=B8=8F"}]}?=`).
If Serve finds the `Tailscale-App-Capabilities` header on an incoming request, Serve will remove it for security reasons, just like any Tailscale identity headers, to avoid header spoofing.
When you use the capability headers to authorize users or tagged nodes at a backend service, it's best practice to only have the service listen on localhost. Otherwise, any user that can call your service directly (rather than with the Serve URL) could trivially provide their own values for these HTTP headers. By listening only on localhost, this limits tampering to only other services running on the Serve machine, and not anyone on your LAN or tailnet.
## [Resources](#resources)
* Explore the collection of [Serve use case examples](/docs/reference/examples/serve) for inspiration and ideas.
* [Use the PROXY protocol](/docs/reference/tailscale-cli/serve#use-the-proxy-protocol).
* [Use the TCP forwarder](/docs/reference/tailscale-cli/serve#use-a-tcp-forwarder).
* [Reset the Serve configuration](/docs/reference/tailscale-cli/serve#reset-tailscale-serve).
* [Disable Serve](/docs/reference/tailscale-cli/serve#disable-tailscale-serve).
## [Limitations](#limitations)
* DNS names are restricted to your tailnet's domain name (`device-name.tailnet-name.ts.net`).
* Because of macOS app sandbox limitations, serving files and directories is limited to the [open source variant of the Tailscale client for macOS](/docs/concepts/macos-variants).
* The same port number cannot be used for Serve (available only within the tailnet) and Funnel (available within the tailnet and to the public) at the same time.
* If the most recent command to configure the port was `serve`, then the port will be completely private.
* If the most recent command to configure the port was `funnel`, then the port will be completely public.
## [Troubleshooting](#troubleshooting)
Tailscale Serve requires that you [enable HTTPS](/docs/how-to/set-up-https-certificates) in your tailnet to automatically provision TLS certificates for your unique [tailnet DNS name](/docs/concepts/tailnet-name). If you use the interactive CLI flow as described in the [Get started with Serve](#get-started-with-serve) section, Tailscale automatically enables HTTPS if it is not already enabled.
On this page
* [Get started with Serve](#get-started-with-serve)
* [Run Tailscale Serve](#run-tailscale-serve)
* [Identity headers](#identity-headers)
* [App capabilities header](#app-capabilities-header)
* [Resources](#resources)
* [Limitations](#limitations)
* [Troubleshooting](#troubleshooting)
Scroll to top