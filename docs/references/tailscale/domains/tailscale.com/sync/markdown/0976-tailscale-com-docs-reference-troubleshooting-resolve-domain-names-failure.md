Can't resolve domain names · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Can't resolve domain names
Last validated: Jan 23, 2026
An inability to resolve domain names indicates a problem with the DNS. However, this could be an issue related to the local, network, or Tailscale DNS configurations. Use the following instructions to isolate why a device can't resolve domain names.
1. **[Test the device's local DNS configuration](/docs/reference/dns-in-tailscale#test-dns-configurations) to ensure you can resolve domain names**. You should also check the device's DNS configuration settings for invalid options. The location of these settings varies by operating system.
After testing your DNS configuration, disconnect Tailscale, then repeat your connection attempt to check if the problem is related to Tailscale.
If the device uses corporate or internet service provider (ISP) DNS servers, it might encounter problems with a feature called [DNS rebinding protection](/docs/reference/faq/dns-rebinding) when attempting to resolve private IP addresses. You can [work around](/docs/reference/faq/dns-rebinding#workarounds-to-consider-when-using-tailscale) these problems using Tailscale DNS settings and [MagicDNS](/docs/features/magicdns).
2. **Check the network DNS settings**.
Make sure the upstream or network DNS configuration settings are valid. For example, ensure no incorrect IP addresses, typos, or syntax errors exist.
If the device is on premises, you can find these settings on the default gateway (router) or the firewall. If the device is a cloud or virtual machine (VM), you can access the settings from the cloud provider (such as Amazon Web Services, Google Cloud, or Microsoft Azure).
3. **Check Tailscale's DNS settings**.
You can check if the device uses [Tailscale's DNS settings](/docs/reference/dns-in-tailscale) from the Tailscale client.
If the client is set to use Tailscale's DNS settings, verify the settings from the [DNS](https://login.tailscale.com/admin/dns) page of the admin console. Make sure the device has permission to access the configured [nameservers](/docs/reference/dns-in-tailscale#nameservers). For example, an access control policy could block its access or require the device to access the nameserver through a subnet router.
Scroll to top