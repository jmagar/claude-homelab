Ephemeral Nodes in Tailscale Now More Easily Removed
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|August 25, 2022
# Ephemeral nodes… now more ephemeral!
If you’re using Tailscale with short-lived devices such as containers or frequently redeployed infrastructure, you are probably already using [ephemeral nodes](/kb/1111/ephemeral-nodes/). Ephemeral nodes are meant for automated, frequently redeployed workloads because they’re automatically removed from your network once they are no longer active. However, this automatic process could potentially take an hour or longer while the coordination server waits to see if the ephemeral node will come back online. This clutters your network with containers or functions that are no longer running.
Previously, there was no way for an ephemeral node to inform the coordination server that it is never coming back online, allowing it to be deleted promptly. **Starting today, you can run `tailscale logout` on an ephemeral node to remove it from your network immediately**. And starting with Tailscale v1.30, available in the next few days, ephemeral nodes created using the CLI, which never stored a state file, will be immediately deleted from your network when they shut down.
Ephemeral nodes let you automatically remove short-lived devices from your network when they’re no longer in use. This is convenient when you’re working with containers, CI/CD jobs, functions, and other frequently redeployed parts of your infrastructure.
There are two ways to create an ephemeral node:
1. You can [generate an auth key](/kb/1085/auth-keys/) for the workload you’re deploying and specify that it be ephemeral. (Also consider using an [auth key that is tagged](/kb/1068/acl-tags#generate-an-auth-key-with-a-tag) for easier ACL management, and reusable if it will be used for multiple deployments.) This allows your workload to spin up and connect to Tailscale by passing in the auth key, with `tailscale up –authkey=$key`. This is great for automation and scripts, in which case you can add `tailscale logout` as a last step when the job is complete to remove the node immediately.
2. You can use the CLI to make an existing node ephemeral by running `tailscaled -state=mem:`. This tells the Tailscale daemon `tailscaled` running on the node not to persist state and to only keep it in memory. Starting in v1.30, when the daemon runs in this mode and is about to exit, it also performs a `tailscale logout` which immediately removes the node from your tailnet.
One major benefit of promptly deleting nodes is that you can now reuse MagicDNS names that were previously held by a now-defunct ephemeral node that has not yet been deleted from the tailnet.
Add `tailscale logout` to deployments you’ve scripted for ephemeral nodes to have them more quickly removed.
[Read the documentation to learn more about using ephemeral nodes](/kb/1111/ephemeral-nodes).
Share
Author
Maisem Ali
Author
Maisem Ali
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