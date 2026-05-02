IP pool · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# IP pool
Last validated: Jan 12, 2026
IP pool is currently [in beta](/docs/reference/tailscale-release-stages#beta).
By default, Tailscale assigns IPv4 addresses to nodes in your tailnet
from the 100.64.0.0/10 [CGNAT range](/docs/concepts/tailscale-ip-addresses).
This is a private IP range not used on the public internet.
The following IP ranges are [reserved by Tailscale](/docs/reference/reserved-ip-addresses), and cannot be used in IP pools:
* 100.100.0.0/24
* 100.100.100.0/24
* 100.115.92.0/23
For corporate networks that use parts of the same range for other
purposes, you can configure Tailscale to use a specific smaller
subset of the CGNAT range.
To do this, you can configure an "IP pool" in your tailnet policy file.
This is done using a node attribute that specifies an `ipPool`:
```
`{
"grants": ["..."],
"nodeAttrs": [
{
"target": ["autogroup:admin"],
"ipPool": ["100.81.0.0/16"],
},
{
"target": ["group:dev"],
"ipPool": ["100.85.0.0/16"],
},
],
}
`
```
You can use the [visual policy editor](/docs/features/visual-editor) to manage your tailnet policy file. Refer to the [visual editor reference](/docs/reference/visual-editor) for guidance on using the visual editor.
With this [node attribute](/docs/reference/syntax/policy-file#nodeattrs) set, all new nodes managed by admins in your tailnet will be assigned an IP
from the range: `100.81.0.0/16`, whereas nodes managed by members of `group:dev` will be assigned an IP from a subset
from the range: `100.85.0.0/16`.
You can also change the IPv4 address of a node at any time by an admin in your tailnet.
Scroll to top