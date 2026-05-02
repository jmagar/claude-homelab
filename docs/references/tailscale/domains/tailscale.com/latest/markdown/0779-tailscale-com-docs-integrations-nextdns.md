Use NextDNS · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use NextDNS
Last validated: Dec 8, 2025
[NextDNS](https://nextdns.io) is a personalized DNS nameserver, that can be used to increase the security of your network by blocking malicious domains, block ads and trackers, and limit the browsing experience users in your tailnet. Tailscale only uses NextDNS with DNS over HTTPS (DoH).
You can configure NextDNS as a global nameserver in Tailscale, and set different NextDNS profiles for different devices.
## [What information is shared with NextDNS?](#what-information-is-shared-with-nextdns)
By default, when using NextDNS with Tailscale, your device information is sent to your NextDNS logs so you can have detailed logs and analytics. This includes: device name, OS, Tailscale IP, and Tailscale node ID.
You can [disable this metadata sharing](#disable-sharing-device-metadata-with-nextdns).
## [Prerequisites](#prerequisites)
Using NextDNS with Tailscale requires Tailscale v1.32 or later.
You'll need a NextDNS profile. If you don't already have one, [create a NextDNS profile](https://my.nextdns.io/start).
## [Use NextDNS as a global nameserver](#use-nextdns-as-a-global-nameserver)
Use NextDNS as a global nameserver to route DNS queries from all devices in your tailnet to NextDNS.
To add NextDNS as a global nameserver:
1. Open the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
2. Go to **Nameservers**, then select **NextDNS** from the **Add nameserver** drop-down list.
3. Enter the IPv6 address for your NextDNS profile. This address is available in the **Endpoints** section of the [setup tab](https://my.nextdns.io/setup) of the NextDNS web console.
4. Select **Save**. The NextDNS profile will save as a global nameserver for your profile ID. One NextDNS IPv6 address will automatically add all IPv6 addresses for that profile.
5. Select **Override DNS servers** to force devices to use NextDNS as a global nameserver instead of what is locally configured on each device.
If you configure NextDNS as a global nameserver, you should not configure another global nameserver for your tailnet. This is because queries denied by NextDNS could be answered by other nameservers, accidentally circumventing privacy or content restrictions. Additionally, NextDNS cannot be used as a split DNS server.
## [Use different NextDNS profiles for different devices](#use-different-nextdns-profiles-for-different-devices)
NextDNS lets you create multiple profiles (also known as configurations) to protect different devices differently. For example, you might create a administrator control profile and a user control profile for your devices.
You must be using NextDNS as a global nameserver to use different profiles for different devices.
To specify a different profile than the global profile for a specific Tailscale device:
1. Set up NextDNS as a global nameserver for your tailnet.
2. Add a node attributes `nodeAttrs` section to your tailnet policy file. Set a `target` for the devices you want the profile to apply to. This can be a tag, user, group, or `\*`.
3. Set the attribute `nextdns:abc123` to use the desired NextDNS profile ID `abc123`.
For example, in your tailnet policy file:
```
`{
"grants": ["..."],
"nodeAttrs": [
{
"target": ["user@example.com", "tag:server"],
"attr": [
"nextdns:abc123",
],
},
],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Disable sharing device metadata with NextDNS](#disable-sharing-device-metadata-with-nextdns)
To block sharing device metadata with NextDNS, in your tailnet policy file, set the attribute `nextdns:no-device-info`:
```
`{
"grants": ["..."],
"nodeAttrs": [
{
"target": ["\*"],
"attr": [
"nextdns:no-device-info",
],
},
],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
On this page
* [What information is shared with NextDNS?](#what-information-is-shared-with-nextdns)
* [Prerequisites](#prerequisites)
* [Use NextDNS as a global nameserver](#use-nextdns-as-a-global-nameserver)
* [Use different NextDNS profiles for different devices](#use-different-nextdns-profiles-for-different-devices)
* [Disable sharing device metadata with NextDNS](#disable-sharing-device-metadata-with-nextdns)
Scroll to top