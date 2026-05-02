Use Control D · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use Control D
Last validated: Dec 8, 2025
[Control D](https://controld.com/) is a customizable anycast [DNS](/docs/reference/dns-in-tailscale) service that blocks malicious threats, unwanted content, trackers, and ads. Tailscale uses Control D with [DNS over HTTPS](https://en.wikipedia.org/wiki/DNS_over_HTTPS) (DoH). You can configure Control D as a [global nameserver](/docs/reference/dns-in-tailscale#global-nameservers) to leverage Control D throughout your tailnet. You cannot use Control D as a split DNS server (also known as a [restricted nameserver](/docs/reference/dns-in-tailscale#restricted-nameservers)).
Currently, Tailscale only shares device hostnames with Control D.
## [Prerequisites](#prerequisites)
Using Control D with Tailscale requires:
* Tailscale v1.70.0 or later
* A [Control D endpoint](https://docs.controld.com/docs/devices).
## [Use Control D as a global nameserver](#use-control-d-as-a-global-nameserver)
Use Control D as a global nameserver to route DNS queries from all devices in your tailnet to Control D.
If you configure Control D as a global nameserver, avoid configuring another global nameserver for your tailnet, as this might circumvent privacy and content restrictions enforced by Control D.
To add Control D as a global nameserver:
1. Open the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
2. Go to **Nameservers**, then select **Add nameserver** \> **Control D**.
3. Enter the [resolver ID](https://docs.controld.com/docs/devices#setting-up) for your Control D endpoint.
4. Select **Save** to save Control D endpoint as a global nameserver for your tailnet.
5. Select **Override DNS servers** to force devices to use Control D as a global nameserver instead of the locally configured DNS settings.
## [Use different Control D profiles for different devices](#use-different-control-d-profiles-for-different-devices)
Control D lets you create multiple profiles (also known as profile IDs) to control access for different types of devices. For example, you can create an administrator Control D profile and a user Control D profile for your devices.
You must be using Control D as a global nameserver to use different profiles for different devices.
To specify a different profile than the global profile for a specific Tailscale device:
1. Set up Control D as a global nameserver for your tailnet.
2. Add a `nodeAttrs` section to your [tailnet policy file](/docs/features/tailnet-policy-file) and set a `target` for the devices that apply to the Control D profile. You can use tags, users, groups, or `\*`.
3. Add an `attr` section with `controld:\<resolver-uid\>`, where `\<resolver-uid\>` is your Control D Endpoint's unique resolver ID.
For example, in your tailnet policy file:
```
`{
"grants": ["..."],
"nodeAttrs": [
{
"target": ["user@example.com", "tag:server"],
"attr": [
"controld:\<resolver-uid\>",
],
},
],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Priority for tagged devices](#priority-for-tagged-devices)
Since `nodeAttrs` are additive and can apply to multiple devices, you can use priority values to control which Control D profile takes precedence. For example, a single tailnet node might match multiple profiles. One targeting `tag:server`, and another targeting both `tag:server` and `tag:secure-server`.
If the `tag:server` profile includes a Control D override, but you want a more specific override for `tag:secure-server`, you can assign a higher priority to that profile. To do this, add a priority suffix `?priority=1` and `?priority=2` (and so on) to the `attr` entries. The higher the priority number, the higher the priority.
For example, in these `attr` entries:
```
`{
"nodeAttrs": [
{
"target": ["tag:server"],
"attr": [
"controld:\<resolver-uid-1\>?priority=1",
],
},
{
"target": ["tag:secure-server"],
"attr": [
"controld:\<resolver-uid-2\>?priority=2",
],
},
],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
In the above example, devices with only `tag:server` match the lower priority `\<resolver-uid-1\>` profile. Devices with both `tag:server` and `tag:secure-server` match both profiles, but Tailscale prioritizes `\<resolver-uid-2\>` because of the higher priority.
Tailscale strips the priority suffix before sending the data to Control D.
On this page
* [Prerequisites](#prerequisites)
* [Use Control D as a global nameserver](#use-control-d-as-a-global-nameserver)
* [Use different Control D profiles for different devices](#use-different-control-d-profiles-for-different-devices)
* [Priority for tagged devices](#priority-for-tagged-devices)
Scroll to top