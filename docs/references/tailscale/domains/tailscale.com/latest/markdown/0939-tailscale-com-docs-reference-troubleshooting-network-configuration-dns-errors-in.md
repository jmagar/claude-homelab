Troubleshoot DNS errors for internal services · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot DNS errors for internal services
Last validated: Mar 16, 2026
Some DNS servers have a feature called DNS rebinding protection. This can prevent a [particular type of security issue](https://en.wikipedia.org/wiki/DNS_rebinding) but can impact the ability to access your internal services, particularly those hosted behind a subnet router using [private IP addresses](https://www.rfc-editor.org/rfc/rfc1918.html). Some DNS servers might also apply this policy to the [Tailscale IP address](/docs/concepts/tailscale-ip-addresses) range (addresses defined in [RFC6598](https://www.rfc-editor.org/rfc/rfc6598.html)).
This issue can affect home routers (for example, [Google Wi-Fi](https://support.google.com/googlenest/answer/9144137)), corporate DNS servers, and internet service provider (ISP) DNS servers.
For troubleshooting guidance, refer to [DNS problems with internal services and DNS rebinding protection](/docs/reference/faq/dns-rebinding).
Scroll to top