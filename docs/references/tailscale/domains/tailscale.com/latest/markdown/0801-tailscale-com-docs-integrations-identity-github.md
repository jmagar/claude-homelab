Setting up GitHub to work with Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Setting up GitHub to work with Tailscale
Last validated: Feb 4, 2026
You can create a Tailscale network (known as a tailnet) using either a GitHub organization account or a GitHub personal account. For more information about GitHub accounts, refer to [Types of GitHub accounts](https://docs.github.com/en/get-started/learning-about-github/types-of-github-accounts).
## [Create a GitHub personal tailnet](#create-a-github-personal-tailnet)
1. Go to the Tailscale [Sign up](https://login.tailscale.com/start) page and select **Sign up with GitHub**. You will be redirected to the GitHub **Authorize Tailscale** page.
2. Select **Authorize tailscale**. You will be redirected to the Tailscale **Select a tailnet** page.
3. Select the GitHub personal account that you want to use for your tailnet. You will be redirected to the Tailscale [admin console](https://login.tailscale.com/admin), where you can manage your tailnet.
After your tailnet is created, you can [invite any user](/docs/features/sharing/how-to/invite-any-user) to join your GitHub personal tailnet, including other GitHub users. Invited users will not have access to the GitHub repository unless you deliberately share it.
## [Create a GitHub organization tailnet](#create-a-github-organization-tailnet)
You must be the owner of the GitHub organization that you want to use for creating a tailnet.
1. Go to the Tailscale [Sign up](https://login.tailscale.com/start) page and select **Sign up with GitHub**. You will be redirected to the GitHub **Authorize Tailscale** page.
2. Select **Authorize tailscale**. You will be redirected to the Tailscale **Select a tailnet** page.
3. Select the GitHub organization that you want to use for your tailnet. You will be redirected to the Tailscale [admin console](https://login.tailscale.com/admin), where you can manage your tailnet.
After your tailnet is created, any user in your GitHub organization can join your tailnet. You can also [invite any user](/docs/features/sharing/how-to/invite-any-user) outside of your GitHub organization. Invite links can only be sent to non-members of a GitHub organization and will not work for GitHub organization members. Invited users will not have access to the GitHub repository unless you deliberately share it.
## [Join a GitHub personal tailnet](#join-a-github-personal-tailnet)
Any user wanting to join a GitHub personal tailnet must use the [invite](/docs/features/sharing/how-to/invite-any-user) link provided by the tailnet administrator.
1. Go to the URL in the provided invite link.
2. Select **Sign up with GitHub**. You will be redirected to the GitHub **Authorize Tailscale** page.
3. Select **Authorize tailscale**. You will be redirected to the Tailscale **Select a tailnet** page.
4. Select the tailnet that you want to join. A confirmation message will display along with a link to download and [install](/docs/how-to/quickstart) the Tailscale client on your device.
## [Join a GitHub organization tailnet](#join-a-github-organization-tailnet)
If you belong to the GitHub organization, you can automatically join the tailnet from the Tailscale [Sign up](https://login.tailscale.com/start) page. If you are not a member of the GitHub organization, a tailnet administrator must send you an [invite](/docs/features/sharing/how-to/invite-any-user) link to join.
### [GitHub organization members](#github-organization-members)
1. Go to the Tailscale [Login](https://login.tailscale.com/login) page.
2. Select **Sign up with GitHub**. You will be redirected to the GitHub **Authorize Tailscale** page.
3. Select **Authorize tailscale**. You will be redirected to the Tailscale **Select a tailnet** page.
4. Select the tailnet that you own or a tailnet that you want to join. A confirmation message will display along with a link to download and [install](/docs/how-to/quickstart) the Tailscale client on your device.
### [Non-GitHub organization members](#non-github-organization-members)
1. Go to the URL in the provided invite link.
2. Select your preferred identity provider to use for authentication. Once you are authenticated, a confirmation message will display along with a link to download and [install](/docs/how-to/quickstart) the Tailscale client on your device.
## [Migration to and from a GitHub tailnet](#migration-to-and-from-a-github-tailnet)
Currently, we cannot migrate your tailnet from/to GitHub as an identity provider.
## [Multiple tailnets](#multiple-tailnets)
Currently, we cannot enable or create [multiple tailnets](/docs/features/multiple-tailnets) for GitHub organizations.
On this page
* [Create a GitHub personal tailnet](#create-a-github-personal-tailnet)
* [Create a GitHub organization tailnet](#create-a-github-organization-tailnet)
* [Join a GitHub personal tailnet](#join-a-github-personal-tailnet)
* [Join a GitHub organization tailnet](#join-a-github-organization-tailnet)
* [GitHub organization members](#github-organization-members)
* [Non-GitHub organization members](#non-github-organization-members)
* [Migration to and from a GitHub tailnet](#migration-to-and-from-a-github-tailnet)
* [Multiple tailnets](#multiple-tailnets)
Scroll to top