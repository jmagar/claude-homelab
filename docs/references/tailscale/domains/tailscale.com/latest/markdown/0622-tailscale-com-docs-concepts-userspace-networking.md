Userspace networking mode (for containers) · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Userspace networking mode (for containers)
Last validated: Nov 12, 2025
Userspace networking mode lets you run Tailscale where you don't have access to create a VPN tunnel device. This often happens in container environments.
Tailscale works on Linux systems using a device driver called `/dev/net/tun`, which lets you start the VPN tunnel as though it were any other network interface like Ethernet or Wi-Fi. This lets any Linux application—from a web browser to the `ping` CLI command—send its traffic through the Tailscale interface.
However, not all Linux systems support `/dev/net/tun`. For example, some container-based app platforms like [Heroku](/docs/install/cloud/heroku) and [Google Cloud Run](/docs/install/cloud/cloudrun) do not. For those environments, userspace networking mode offers a different way of running, where `tailscaled` functions as a SOCKS5 or HTTP proxy which other processes in the container can connect through.
Userspace networking mode with SOCKS5 is available in Tailscale v1.8 or later. The HTTP proxy is available in Tailscale v1.16 or later. [Update Tailscale](/docs/features/client/update) to use these features.
## [SOCKS5 vs. HTTP](#socks5-vs-http)
The functionality and purpose of the SOCKS5 and HTTP proxies varies. The SOCKS5 proxy is a more general and flexible proxy that can work with any traffic. The HTTP proxy is only for that protocol, so it only proxies HTTP and HTTPS traffic, for example, to web pages.
## [Start Tailscale in userspace networking mode](#start-tailscale-in-userspace-networking-mode)
You can enable userspace networking from the [Tailscale CLI](/docs/reference/tailscale-cli) by passing the `--tun=userspace-networking` flag to `tailscaled` before running `tailscale up`. You can also use a SOCKS5 proxy and an HTTP proxy on the same port (as shown in the following code block),
```
`tailscaled --tun=userspace-networking --socks5-server=localhost:1055 --outbound-http-proxy-listen=localhost:1055 &
tailscale up --auth-key=\<your-auth-key\>
`
```
Userspace networking mode is primarily for [serverless environments](/docs/integration-serverless-apps). We recommend using it with [ephemeral nodes and auth keys](/docs/features/ephemeral-nodes) (as shown above).
You can enable userspace networking mode on Ubuntu, RHEL, or any derivative by adding the flag `--tun=userspace-networking` to the `FLAGS` variable in `/etc/default/tailscaled`:
```
`FLAGS="--tun=userspace-networking"
`
```
The Tailscale Docker image supports a [`TS\_USERSPACE`](/docs/features/containers/docker#ts_userspace) parameter that is equivalent to `tailscaled --tun=userspace-networking`.
## [Configure your application to use SOCKS5 or HTTP](#configure-your-application-to-use-socks5-or-http)
After Tailscale is authenticated, your application can connect using a SOCKS5 or HTTP proxy or both. Many widely used networking packages support these proxies already, generally by setting the `ALL\_PROXY` and `HTTP\_PROXY`environment variables. For many applications, you'll need a command like this:
```
`ALL\_PROXY=socks5://localhost:1055/ HTTP\_PROXY=http://localhost:1055/ http\_proxy=http://localhost:1055/ ./my-app
`
```
Some libraries use `http\_proxy` instead of `HTTP\_PROXY`. You might need to experiment to find the right setting for your application. For instructions on how to use Tailscale on specific serverless platforms, refer to the topics below:
* [Tailscale on Heroku](/docs/install/cloud/heroku)
* [Tailscale on Google Cloud Run](/docs/install/cloud/cloudrun)
* [Tailscale on GitHub Actions](/blog/2021-05-github-actions-and-tailscale)
On this page
* [SOCKS5 vs. HTTP](#socks5-vs-http)
* [Start Tailscale in userspace networking mode](#start-tailscale-in-userspace-networking-mode)
* [Configure your application to use SOCKS5 or HTTP](#configure-your-application-to-use-socks5-or-http)
Scroll to top