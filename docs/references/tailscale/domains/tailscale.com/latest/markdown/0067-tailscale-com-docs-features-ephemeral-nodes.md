Ephemeral nodes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Ephemeral nodes
Last validated: Dec 4, 2025
Ephemeral node usage is included at no cost up to a monthly limit (measured in minutes), which varies by [pricing plan](/pricing).
If an ephemeral node is present in the tailnet for four or more hours, it will not count against your balance of ephemeral minutes, and will count as a standard [tagged device](/docs/reference/syntax/policy-file#tags) instead.
Ephemeral nodes make it easier to connect and then clean up short-lived devices such as containers, cloud functions, or CI/CD systems that spin up and spin down on a regular basis.
By default, when you add a new device to your Tailscale network, it appears in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and in Tailscale client apps. However, short-lived devices can make your network difficult to check, as devices remain in the admin console until removed.
Ephemeral nodes differ from regular nodes in a few ways:
* They are auto-removed from your network after a short period of inactivity. The next time an ephemeral node is created, it will have a new IP address.
* They are immediately removed from your network if you run [`tailscale logout`](/docs/reference/tailscale-cli#logout).
* They can only be created using [ephemeral auth keys](/docs/features/access-control/auth-keys) (not through the regular authentication flow) or by running the `tailscaled` daemon with the
`state=mem:` flag.
To avoid updating [every device's netmap](/docs/concepts/device-visibility) when an ephemeral device is added to the Tailscale network, consider using an ephemeral [tagged auth key](/docs/features/tags#best-practices), and update [access control policies](/docs/features/access-control) to restrict what tagged devices can access. If you are deploying multiple instances of the same container, use a [reusable auth key](/docs/features/access-control/auth-keys) instead of baking the Tailscale node key into the container image to avoid [duplicate devices](/docs/reference/troubleshooting/network-configuration/multiple-devices-same-100.x-ip-address).
You can identify ephemeral nodes in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console by looking for an "Ephemeral" badge underneath the device name.
## [Authenticating an ephemeral node](#authenticating-an-ephemeral-node)
### [Step 1: Generate an ephemeral auth key](#step-1-generate-an-ephemeral-auth-key)
To create an ephemeral node, you'll first need to generate an ephemeral auth key from the [Keys](https://login.tailscale.com/admin/settings/keys) of the admin console.
**Be careful with auth keys!** These can be very dangerous if stolen.
They're best kept in a key vault product specially designed for the purpose.
The **Pre-approved** option will only display in the dialog if [device approval](/docs/features/access-control/device-management/device-approval) is enabled in your Tailscale network.
### [Step 2: Configure your infrastructure to use the key](#step-2-configure-your-infrastructure-to-use-the-key)
The simplest way to do this is to update your usual scripts to use the new auth key:
```
`sudo tailscale up --auth-key=\<your ephemeral key\>
`
```
Instructions vary by platform. Refer to our guides on setting up common platforms:
* [Tailscale on Heroku](/docs/install/cloud/heroku)
* [Tailscale on Google Cloud Run](/docs/install/cloud/cloudrun)
* [Tailscale on GitHub Actions](/blog/2021-05-github-actions-and-tailscale)
* [Tailscale on AWS Lambda](/docs/install/cloud/aws/aws-lambda)
* [Tailscale on Kubernetes](/docs/kubernetes)
### [Step 3: Trigger a build](#step-3-trigger-a-build)
The next time your infrastructure spins up a new device, it appears in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console as an ephemeral node. It will be able to connect to your network, and will be auto-removed shortly after going offline.
### [FAQ](#faq)
#### [Can an ephemeral device remove itself from my tailnet?](#can-an-ephemeral-device-remove-itself-from-my-tailnet)
Yes. Run the [`tailscale logout`](/docs/reference/tailscale-cli#logout) command on an ephemeral device to remove it from your tailnet
immediately. For example, you can add `tailscale logout` as a last step in your ephemeral node deployment script to immediately remove it from your tailnet
when the script completes.
Another way is if you created an ephemeral device by running `tailscaled` with the `--state=mem:` flag. If the device is running Tailscale v1.30
or later, when the device exits, the `tailscaled` daemon itself performs `tailscale logout` which immediately removes the device from your tailnet.
#### [How long before ephemeral devices are auto-removed?](#how-long-before-ephemeral-devices-are-auto-removed)
Ephemeral devices are auto-removed anywhere normally from 30 to 60 minutes after the last activity. This timeframe is subject to change as we learn more about what works best for Tailscale users. If you want to remove an ephemeral device immediately, run [`tailscale logout`](/docs/reference/tailscale-cli#logout) as described above.
#### [Can I create an ephemeral node without an auth key?](#can-i-create-an-ephemeral-node-without-an-auth-key)
Yes, running Tailscale v1.22 or later. You can run `tailscaled` with the `--state=mem:` flag. `tailscaled` is the
Tailscale daemon that runs on devices that have installed the Tailscale client. The `--state=mem:` flag registers the
node as an ephemeral node so that the daemon stores state in memory, instead of writing it to disk.
On this page
* [Authenticating an ephemeral node](#authenticating-an-ephemeral-node)
* [Step 1: Generate an ephemeral auth key](#step-1-generate-an-ephemeral-auth-key)
* [Step 2: Configure your infrastructure to use the key](#step-2-configure-your-infrastructure-to-use-the-key)
* [Step 3: Trigger a build](#step-3-trigger-a-build)
* [FAQ](#faq)
* [Can an ephemeral device remove itself from my tailnet?](#can-an-ephemeral-device-remove-itself-from-my-tailnet)
* [How long before ephemeral devices are auto-removed?](#how-long-before-ephemeral-devices-are-auto-removed)
* [Can I create an ephemeral node without an auth key?](#can-i-create-an-ephemeral-node-without-an-auth-key)
Scroll to top