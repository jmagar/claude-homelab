Enhance Security with Tailscale Device Posture Management
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|December 14, 2023
# Device Posture Management in Tailscale: Restrict Access for Non-Compliant Devices
Restrict access for non-compliant devices with Tailscale Device Posture Management, now available in beta.
You can manage additional attributes of your devices and use them as part of connectivity rules within your Tailscale network (known as a tailnet). This is a powerful building block that allows you to integrate third-party systems with Tailscale and use external device trust data as part of your network policy. Here’s what it looks like in action:
```
`"postures": {
"posture:trusted": [
"node:os == 'windows'",
"custom:edrScore \>= 70",
],
},
"acls": [
{
"action": "accept",
"src": ["autogroup:member"],
"srcPosture": ["posture:trusted"],
"dst": ["tag:production:\*"],
},
]`
```
In this example, Tailscale ACL policy allows members of a given network to access production machines only from devices that are running Windows and have an EDR score of 70 or higher. Let's explore how this works.
## [Device attributes and postures](#device-attributes-and-postures)
Your Tailscale devices now have posture attributes: typed key/value pairs. We provide a set of built-in attributes that all customers can use right away: device OS name and version, and Tailscale client version. Customers on our Free and Enterprise plans can use the new [Posture Attributes API](https://tailscale.com/kb/1288/device-posture#posture-attributes-api) to set additional attributes.
For attributes to be used as part of network policy, you can now define sets of attribute assertions that we call postures. We added a new top-level "postures" field to the policy for that:
```
`"postures": {
"posture:desktop": [
"node:os IN ['macos', 'linux', 'windows']",
],
"posture:ios": [
"node:os == 'ios'",
"node:osVersion \>= '17.1'",
],
},`
```
In this example, we have defined two postures:
* "posture:desktop" will match any device running macOS, Linux or Windows.
* "posture:ios" will only match devices running iOS 17.1 or later.
A posture allows you to group multiple assertions, all of which need to be true for a device to match. To use a posture as an additional condition in a particular ACL rule, reference it in the `srcPosture` field.
## [Device Posture Integrations](#device-posture-integrations)
You can easily connect third-party trust data using our integrations, or by building your own integration with the device posture APIs we provide.
To help match devices between Tailscale and other systems, you can now use MDM to enable [collection of device identifiers](https://tailscale.com/kb/1326/device-identity/) (like serial numbers) from machines that run the Tailscale client.
Our first integration allows Tailscale customers who use [Crowdstrike Falcon](https://www.crowdstrike.com/falcon-platform/) to configure network policy based on Falcon’s Zero Trust Assessment (ZTA) scores of individual devices:
```
`"postures": {
"posture:trusted": ["falcon:ztaScore \>= 70"],
},
"acls": [
{
"action": "accept",
"src": ["autogroup:member"],
"srcPosture": ["posture:trusted"],
"dst": ["tag:production:\*"],
},
]`
```
This ACL policy allows members of a tailnet to access production machines only from devices that have a Crowdstrike Falcon ZTA score of 70 or higher.
## [Interested in more?](#interested-in-more)
Please refer to [our documentation](https://tailscale.com/kb/1288/device-posture/) for more details and examples. All tailnets support postures that refer to built-in attributes.
Customers on our Free and Enterprise plans can configure a [Crowdstrike Falcon integration](https://tailscale.com/kb/1289/crowdstrike-zta/) in Admin Console, or integrate any other source of device trust information with Tailscale policy by setting custom posture attributes via the API. If you want to talk to us about implementing an integration with your endpoint protection tool, please [get in touch](https://tailscale.com/contact/sales)!
With Tailscale Device Posture Management, you can enhance the security of your tailnet and control access based on device attributes. Additional conditions based on device posture attributes can be incorporated into new or existing ACLs. The end result is a simple and easy-to-manage way to limit tailnet access only to devices that meet the defined security requirements of your organization.
Share
Authors
Tinku Thomas
Anton Tolchanov
Kristoffer Dalby
James Sanderson
Paul Scott
Ross Zurowski
Ben Lee-Cohen
Authors
Tinku Thomas
Anton Tolchanov
Kristoffer Dalby
James Sanderson
Paul Scott
Ross Zurowski
Ben Lee-Cohen
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