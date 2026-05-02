Troubleshoot CGNAT conflicts · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot CGNAT conflicts
Last validated: Mar 16, 2026
Tailscale assigns each device in your tailnet a unique [100.x.y.z](/docs/concepts/tailscale-ip-addresses) IP address. This is called the carrier grade NAT (CGNAT) address space, reserved by [RFC6598](https://www.rfc-editor.org/rfc/rfc6598.html), *IANA-Reserved IPv4 Prefix for Shared Address Space*. CGNAT conflicts can arise, for example, if your internet service provider (ISP), or [other VPN](/docs/reference/faq/other-vpns), also uses the `100.64.0.0/10` subnet (from `100.64.0.0` to `100.127.255.255`).
If you are experiencing CGNAT conflicts, you can disable IPv4 in your tailnet. This will cause Tailscale to use IPv6 only. Be aware that disabling IPv4 will prevent you from accessing IPv4-only resources on your network. For example, IPv4-only exit nodes will not be accessible.
## [Selectively disable IPv4](#selectively-disable-ipv4)
To selectively disable IPv4, apply the `disable-ipv4` [node attribute](/docs/reference/syntax/policy-file#nodeattrs) to the targets that require it in your tailnet's access control policies:
```
`{
"nodeAttrs": [
{
"target": ["tag:lab-foo"],
"attr": ["disable-ipv4"],
},
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
## [Disable IPv4 tailnet-wide](#disable-ipv4-tailnet-wide)
To disable IPv4 tailnet-wide, apply the `disable-ipv4` [node attribute](/docs/reference/syntax/policy-file#nodeattrs) to all targets in your tailnet's access control policies:
```
`{
"nodeAttrs": [
{
"target": ["\*"],
"attr": ["disable-ipv4"],
},
]
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
On this page
* [Selectively disable IPv4](#selectively-disable-ipv4)
* [Disable IPv4 tailnet-wide](#disable-ipv4-tailnet-wide)
Scroll to top