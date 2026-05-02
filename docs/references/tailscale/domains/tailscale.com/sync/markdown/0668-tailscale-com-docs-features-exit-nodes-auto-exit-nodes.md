Recommended exit nodes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Recommended exit nodes
Last validated: Jan 7, 2025
Recommended exit nodes are available for [Standard, Premium, and Enterprise plans](/pricing), or customers who have purchased the [Mullvad](/docs/features/exit-nodes/mullvad-exit-nodes) add-on.
A recommended exit node (also called a suggested exit node) is an [exit node](/docs/features/exit-nodes) or [Mullvad exit node](/docs/features/exit-nodes/mullvad-exit-nodes) that Tailscale selects automatically based on client information such as location and latency.
## [How it works](#how-it-works)
Tailscale prefers non-Mullvad exit nodes when selecting a recommended exit node. If the tailnet has any standard exit nodes available, Tailscale recommends them first. If no standard exit nodes are available, Tailscale recommends an available Mullvad exit node if one exits.
The selection logic varies between standard and Mullvad exit nodes. Tailscale uses latency and performance information to select a recommended standard exit node. Because Tailscale doesn't have performance information for Mullvad exit nodes, it selects one to recommend based on location.
## [Use a suggested exit node](#use-a-suggested-exit-node)
You can use a recommended exit node from the [Tailscale CLI](/docs/reference/tailscale-cli) or the Tailscale client.
[Tailscale CLI](/docs/features/exit-nodes/auto-exit-nodes?tab=tailscale+cli)[Tailscale client](/docs/features/exit-nodes/auto-exit-nodes?tab=tailscale+client)
To select a suggested exit node using the Tailscale CLI:
1. Use the following command to view the recommended exit node:
```
`tailscale exit-node suggest
`
```
The command returns the ID of the suggested exit node.
```
`Suggested exit node: \<ID\>.
To accept this suggestion, use `tailscale set --exit-node=\<ID\>`.
`
```
2. Run `tailscale set` with the `--exit-node=\<ID\>` flag to use the suggested exit node.
```
`tailscale set --exit-node=\<ID\>
`
```
## [Force use of an exit node](#force-use-of-an-exit-node)
You can force devices to use an exit node based on system policies, which you can deploy using mobile device management (MDM) solutions. For details, refer to [Mandatory exit nodes](/docs/features/exit-nodes/mandatory-exit-nodes).
On this page
* [How it works](#how-it-works)
* [Use a suggested exit node](#use-a-suggested-exit-node)
* [Force use of an exit node](#force-use-of-an-exit-node)
Scroll to top