Tailscale Funnel · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale Funnel
Last validated: Jan 20, 2026
Tailscale Funnel is currently [in beta](/docs/reference/tailscale-release-stages#beta). To try it, follow the steps below to enable it for your network using Tailscale v1.38.3 or later.
Tailscale Funnel is available for [all plans](/pricing).
Tailscale Funnel lets you route traffic from the broader internet to a local service running on a device in your Tailscale network (known as a tailnet). You can use it to share a local service, like a web app, for anyone to access—even if they don't use Tailscale.
If you'd like to share local services only with other devices in your tailnet, use [Tailscale Serve](/docs/features/tailscale-serve) instead. Also check out [Funnel vs. sharing](/docs/reference/funnel-vs-sharing).
Explore the following topics to find more information about Tailscale Funnel:
* [Get started with Funnel](#get-started-with-funnel)
* [How Funnel works](#how-funnel-works)
* [The `tailscale funnel` command](/docs/reference/tailscale-cli/funnel)
* [Troubleshoot Funnel](#troubleshoot-funnel)
* [Funnel examples](/docs/reference/examples/funnel)
## [How Funnel works](#how-funnel-works)
Funnel exposes a local resource to the internet through a unique Funnel URL. Using Funnel to share a local resource creates an encrypted tunnel from the internet to a specific resource on your device. Tailscale does this using a TCP proxy and Funnel relay servers.
When you share a local resource with Funnel, it creates a unique Funnel URL that you can share. When someone uses your Funnel URL, their device sends a request to the Funnel relay server. After receiving the request, the Funnel relay server will establish a TCP proxy to your device using Tailscale. This proxy is an encrypted tunnel between the local resource and the device accessing the Funnel URL that points to it. Using a TCP proxy protects the shared data and lets Tailscale hide the IP address of your local device. The Funnel relay server cannot decrypt data sent over this proxy.
Where to go next
The process, from creating a Funnel to accessing a resource shared through it, involves:
* [Creating and sharing the Funnel URL](#creating-and-sharing-the-funnel-url).
* [Resolving the Funnel URL to an IP address](#resolving-the-funnel-url-to-an-ip-address).
* [Establishing an encrypted proxy](#establishing-an-encrypted-proxy).
* [Serving the shared resource through the proxy](#serving-the-shared-resource-through-the-proxy).
### [Creating and sharing the Funnel URL](#creating-and-sharing-the-funnel-url)
When you share a local resource with Funnel, it creates a unique Funnel URL that you can share. The generated URL points only to the specific resource you used Funnel to share. So, if you share a local web server, the Funnel only shares that specific web server. Likewise, if you share a file or directory, the Funnel only shares the specific file or directory.
### [Resolving the Funnel URL to an IP address](#resolving-the-funnel-url-to-an-ip-address)
When a device tries to access a Funnel URL, it first contacts public DNS servers to resolve the URL to an IP address. These DNS servers respond with the IP address of a Funnel relay server, not your device's IP address. This step hides your device's location from the public internet. After resolving the URL to an IP address, the device sends a request to the Funnel relay server.
### [Establishing an encrypted proxy](#establishing-an-encrypted-proxy)
After receiving the request, the Funnel relay server creates a TCP proxy to your device over Tailscale. This proxy acts as an encrypted relay between the Funnel relay server and your device. It ensures that your device's IP address is never exposed to the internet.
Funnel relay servers do not decrypt the traffic between public devices and your device. This ensures that Tailscale cannot access or read any content. It maintains end-to-end [encryption](/docs/concepts/tailscale-encryption) and privacy.
The Tailscale server running on your device receives the encrypted request from the TCP proxy. It then terminates the [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security) connection and passes the decrypted request to the local service you exposed through Funnel. The local service processes the request and generates a response.
### [Serving the shared resource through the proxy](#serving-the-shared-resource-through-the-proxy)
After the local server on your device processes the request, it sends the response to the Tailscale server on your device. The Tailscale server then encrypts the response and sends it back to the Funnel relay server over the established TCP proxy.
Upon receiving the encrypted response, the Funnel relay server forwards it to the user's device. It does not decrypt its contents; it maintains the end-to-end encryption of the data. Finally, the user's device ends the TLS connection. It then decrypts the response and shows the requested information to the user accessing the Funnel URL.
## [Get started with Funnel](#get-started-with-funnel)
Tailscale Funnel is disabled by default, but you can use the [Tailscale CLI](/docs/reference/tailscale-cli) to enable the Funnel service and create Funnels.
### [Requirements and limitations](#requirements-and-limitations)
Funnel requires the following to work:
* Tailscale v1.38.3 or later.
* [MagicDNS](/docs/features/magicdns) enabled for your tailnet.
* [HTTPS](/docs/how-to/set-up-https-certificates) enabled and valid HTTPS certificates for your tailnet.
* A funnel [node attribute](/docs/reference/syntax/policy-file#node-attributes) in your tailnet policy file. This attribute tells Tailscale which tailnet users can use Funnel.
Additionally, Funnel has the following limitations:
* Funnel can only use DNS names in your [tailnet's domain](/docs/concepts/tailnet-name) (`tailnet-name.ts.net`).
* Funnel can only listen on ports `443`, `8443`, and `10000`.
* Funnel only works over [TLS](https://en.wikipedia.org/wiki/Transport_Layer_Security)-encrypted connections.
* Traffic sent over a Funnel is subject to non-configurable bandwidth limits.
* Funnel only works on platforms that can run the Tailscale CLI.
* To use Funnel on macOS, you must use one of the [open source variants of the Tailscale application for macOS](/docs/concepts/macos-variants).
* The same port number cannot be used for Serve (available only within the tailnet) and Funnel (available within the tailnet and to the public) at the same time.
* If the most recent command to configure the port was `serve`, then the port will be completely private.
* If the most recent command to configure the port was `funnel`, then the port will be completely public.
When you enable Funnel using the Tailscale CLI, Tailscale automatically creates valid HTTPS certificates and updates your tailnet policy file. By default, it lets any users in the `autogroup:member` [autogroup](/docs/reference/syntax/policy-file#autogroups) to use Funnel. You can adjust this by manually updating your tailnet policy file.
It is possible to frequently request a new certificate and exceed Let's Encrypt's rate limits. As a result, you may find yourself waiting 34 hours until you can try again. For more information, refer to Let's Encrypt's [rate limits documentation](https://letsencrypt.org/docs/rate-limits/).
### [Enable Funnel](#enable-funnel)
Use the [`tailscale funnel`](/docs/reference/tailscale-cli/funnel) command to enable Funnel. The command triggers a web interface that prompts you to approve enabling Funnel. After you approve it, Tailscale will create valid HTTPS certificates for your tailnet and add a funnel node attribute to your tailnet policy file.
### [Create a Funnel](#create-a-funnel)
To create a Funnel, use the `tailscale funnel` command and pass the target you want to share. You can share a service, a file, or a directory. You can also optionally pass any of the [available flags](/docs/reference/tailscale-cli/funnel#funnel-command-flags).
```
`tailscale funnel 3000
Available on the internet:
https://amelie-workstation.pango-lin.ts.net
|-- / proxy http://127.0.0.1:3000
Press Ctrl+C to exit.
`
```
When you use Tailscale Funnel, the Funnel relay servers show up in your device's list of Tailscale peers. All peers using the command [`tailscale status --json`](/docs/reference/tailscale-cli#status) display.
Sharing files and directories with Funnel only works with the [open source variants](/docs/concepts/macos-variants) of the Tailscale client for macOS. Other variants have sandbox limitations.
You can only use Funnel to share ports if you installed Tailscale for macOS from the App Store or as a Standalone variant system extension.
## [Resources](#resources)
* Explore the collection of [Funnel use case examples](/docs/reference/examples/funnel) for inspiration and ideas.
* [Use the PROXY protocol](/docs/reference/tailscale-cli/funnel#use-the-proxy-protocol).
* [Use the TCP forwarder](/docs/reference/tailscale-cli/funnel#use-a-tcp-forwarder).
* [Reset the Funnel configuration](/docs/reference/tailscale-cli/funnel#reset-tailscale-funnel).
* [Disable Funnel](/docs/reference/tailscale-cli/funnel#disable-tailscale-funnel).
## [Troubleshooting](#troubleshooting)
Trouble with Funnels is usually related to one of the following issues:
* [Funnel node attribute](#funnel-node-attribute)
* [HTTPS certificates](#https-certificates)
* [Access controls](#access-controls)
* [DNS propagation](#dns-propagation)
### [Funnel node attribute](#funnel-node-attribute)
Tailscale Funnel requires a [node attribute](/docs/reference/syntax/policy-file#node-attributes) (`nodeAttrs`) of `funnel` in your tailnet policy file to tell Tailscale who can use Funnel. If you use the Tailscale CLI to enable Funnel, Tailscale ensures this requirement is met. Alternatively, you can manually add the node attribute for Funnel. You need to be an [Owner, Admin, or Network admin](/docs/reference/user-roles) of a tailnet to modify a tailnet policy file.
1. Open the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console.
2. Expand the Funnel section and select **Add Funnel to policy**.
This adds the default `nodeAttrs` section and saves the tailnet policy file automatically.
```
`"nodeAttrs": [
{
"target": ["autogroup:member"],
"attr": ["funnel"],
},
],
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
### [HTTPS certificates](#https-certificates)
Tailscale Funnel requires valid [HTTPS certificates](/docs/how-to/set-up-https-certificates) for your tailnet to automatically provision TLS certificates for your unique tailnet DNS name. If you use the Tailscale CLI to enable Funnel, Tailscale ensures this requirement is met.
### [Access controls](#access-controls)
If the funnel node attribute in your tailnet policy file doesn't permit you to use Funnel, you won't be able to. The default node attribute to enable Funnel includes all tailnet members by default, but [Owners, Admins, and Network admins](/docs/reference/user-roles) can modify this to further restrict access.
### [DNS propagation](#dns-propagation)
Public DNS records can take up to 10 minutes to show up for your tailnet domain. This delay might prevent someone from using a Funnel URL until the public DNS records are updated.
On this page
* [How Funnel works](#how-funnel-works)
* [Get started with Funnel](#get-started-with-funnel)
* [Requirements and limitations](#requirements-and-limitations)
* [Enable Funnel](#enable-funnel)
* [Create a Funnel](#create-a-funnel)
* [Resources](#resources)
* [Troubleshooting](#troubleshooting)
* [Funnel node attribute](#funnel-node-attribute)
* [HTTPS certificates](#https-certificates)
* [Access controls](#access-controls)
* [DNS propagation](#dns-propagation)
Scroll to top