Tailscale with GitLab CI/CD · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Tailscale with GitLab CI/CD
Last validated: Dec 4, 2025
The [Tailscale GitLab configuration](https://gitlab.com/tailscale-dev/gitlab-ci-cd) enables connecting your Tailscale network
(known as a tailnet) to a [GitLab Runner](https://docs.gitlab.com/runner).
With this configuration, you can access nodes in your tailnet directly from your GitLab Runner. Some example uses are:
* Securely deploy your application to an internal server
* Securely reach your private test runners for specific platforms
* Reach your database of test data without leaving it exposed on the internet
* Access an internal deployment monitoring tool
## [How it works](#how-it-works)
When you add the Tailscale GitLab configuration to your runner, subsequent steps in your runner
can then access nodes in your tailnet. For example, the runner could access a node that has a
database of test data.
The Tailscale GitLab configuration requires an [auth key](/docs/features/access-control/auth-keys), which is tagged, reusable, ephemeral, and (if applicable) pre-approved. You store the auth key as an
[external GitLab secret](https://docs.gitlab.com/ee/ci/secrets). The tag grants the access permission
to any node created by your runner.
When your runner executes, it uses the auth key to create an
[ephemeral node](/docs/features/ephemeral-nodes). The node can then access nodes in your tailnet, subject to the
access applied to the tags.
Because the node is ephemeral, shortly after the action completes, the node is automatically removed
from your tailnet. The next time the action runs, it creates a new ephemeral node, available only
for the new runner.
Any node that the Tailscale GitLab configuration creates is [pre-approved](/docs/features/access-control/auth-keys#types-of-auth-keys) on
tailnets that use [device approval](/docs/features/access-control/device-management/device-approval).
## [Add Tailscale to a GitLab Runner](#add-tailscale-to-a-gitlab-runner)
1. Create at least one [tag](/docs/features/tags) for the nodes that the GitLab configuration will create.
For example, `tag:ci`, which is used for this example. The access permissions that you grant to
the tags are applied to the nodes that will be created by the runner.
2. Create an [auth key](/docs/features/access-control/auth-keys). We recommend that the [key type](/docs/features/access-control/auth-keys#types-of-auth-keys) is tagged,
reusable, and ephemeral. If the tailnet uses [device approval](/docs/features/access-control/device-management/device-approval), ensure that the
key type is also pre-approved.
3. Create a [GitLab secret](https://docs.gitlab.com/ee/ci/secrets) with the name `TAILSCALE\_AUTHKEY` and the value set to your auth key.
Then use the `authkey` field to reference the secret in your runner. For example:
```
`tailscale up --auth-key=${TAILSCALE\_AUTHKEY} --hostname="gitlab-$(cat /etc/hostname)" --accept-routes
`
```
When the action runs, it creates an ephemeral node. The node can access nodes in your tailnet,
subject to the access rules applied to the specified tag or tags. In the rest of your runner,
access other nodes in your tailnet as needed.
The ephemeral node is automatically cleaned up shortly after the action finishes.
On this page
* [How it works](#how-it-works)
* [Add Tailscale to a GitLab Runner](#add-tailscale-to-a-gitlab-runner)
Scroll to top