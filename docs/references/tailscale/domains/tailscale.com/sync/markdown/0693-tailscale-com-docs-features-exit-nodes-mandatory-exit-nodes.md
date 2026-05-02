Mandatory exit nodes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Mandatory exit nodes
Last validated: Dec 20, 2024
Mandatory exit nodes are available for [Premium and Enterprise plans](/pricing), or customers who have purchased the [Mullvad](/docs/features/exit-nodes/mullvad-exit-nodes) add-on.
Mandatory exit nodes require that the Tailscale client run Tailscale v1.69.3 or later.
You can mandate always-on [exit nodes](/docs/features/exit-nodes) using mobile device management (MDM) tools. To do so, specify a single exit node to use as the always-on exit node, or use [auto exit nodes](/docs/features/exit-nodes/auto-exit-nodes) across your entire fleet of devices.
Mandating exit nodes requires an [MDM solution](/docs/mdm) to set the relevant [system policies](/docs/features/tailscale-system-policies). This can be useful in hybrid or remote working environments where employees must route network traffic through corporate or branch offices.
To enable a single exit node in an always-on fashion, configure the [`ExitNodeID`](/docs/features/tailscale-system-policies#force-an-exit-node-to-always-be-used) policy to that of the mandatory exit node.
To enable a fleet of regionally-routed exit nodes in an always-on fashion, configure the [`ExitNodeID`](/docs/features/tailscale-system-policies#force-an-exit-node-to-always-be-used) policy value to `auto:any` and optionally provide a list of permitted exit nodes in the [`AllowedSuggestedExitNodes`](/docs/features/tailscale-system-policies#suggest-allowed-forced-exit-nodes) policy. If the `AllowedSuggestedExitNodes` policy is unset, then all exit nodes are allowed. If the `AllowedSuggestedExitNodes` policy is set but empty, then no exit nodes are allowed.
Mandating exit nodes in an always-on fashion can cause service disruptions when exit nodes lose connectivity or during captive portal workflows (such as when needing to authenticate to Tailscale). Use caution if combining mandatory exit nodes with a policy that prevents disconnecting the Tailscale client.
Scroll to top