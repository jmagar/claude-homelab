Deploy multiple Tailscale SSH session recorder nodes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy multiple Tailscale SSH session recorder nodes
Last validated: Dec 8, 2025
Tailscale SSH session recording supports using multiple recorder nodes, both for a failover configuration and to separate recordings to different recorders based on your SSH access rules in your tailnet policy file.
## [Deploy multiple recorders for failover](#deploy-multiple-recorders-for-failover)
If you are running Tailscale SSH session recording in a production environment, you may want to deploy multiple recorders in a failover configuration to prevent unwanted downtime.
To deploy multiple recorder nodes in a failover configuration, tag each node with the [tag](/docs/features/tags) that is defined in the `recorder` field in SSH access rules. While you can tag as many recorder nodes as you want, you can only assign one tag to each `recorder` field in SSH access rules.
Tailscale determines which recorder node will receive session recordings by choosing the node with the lowest IP address value. If that recorder is unavailable, Tailscale will attempt to reach the node with the next highest IP address value. It will continue attempting to reach recorder nodes in this manner until it successfully connects to a recorder node.
## [Deploy different recorders for each SSH access rule](#deploy-different-recorders-for-each-ssh-access-rule)
Sometimes, it might be helpful to deploy multiple groups of recorder nodes, and direct traffic to different recorder nodes based on the underlying SSH access rule.
For example, the following access control policy snippet shows two SSH access rules. The first rule specifies that all members can use Tailscale SSH to connect to their own devices, and the second rule specifies that members of the `eng` group can connect to servers with the `prod` tag.
SSH session recording is enabled for both SSH access rules, but each SSH access rule defines a different tag in the `recorder` field: The first SSH access rule sends recordings to nodes with the tag `dev-recorders`, and the second SSH access rule sends recordings to nodes with the tag `prod-recorders`.
```
`"ssh": [
{
"action": "check",
"src": ["autogroup:member"],
"dst": ["autogroup:self"],
"users": ["autogroup:nonroot"],
"recorder": ["tag:dev-recorders"]
},
{
"action": "check",
"src": ["group:eng"],
"dst": ["tag:prod"],
"users": ["list-of-ssh-users"],
"recorder": ["tag:prod-recorders"]
}
]
`
```
You may want to deploy recorders in this configuration if you need to isolate recordings based on the sensitivity of data, like recordings that contain user PII.
If a Tailscale SSH connection is allowed by multiple SSH access rules that each specify a different recorder tag, Tailscale will follow the instructions of the rule that is listed first in the tailnet policy file.
On this page
* [Deploy multiple recorders for failover](#deploy-multiple-recorders-for-failover)
* [Deploy different recorders for each SSH access rule](#deploy-different-recorders-for-each-ssh-access-rule)
Scroll to top