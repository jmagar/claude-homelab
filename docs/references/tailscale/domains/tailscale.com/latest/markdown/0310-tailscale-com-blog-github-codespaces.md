Tailscale for Developers: Seamlessly Connect GitHub Codespaces to Internal Resources
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 27, 2021
# Tailscale for developers: Connect to your resources from GitHub Codespaces
Have you moved to a remote development environment? In reality, you can rarely develop fully in isolation—you need access to internal tools and services to make sure your code works as expected. So although your development environment moved, well, it’s likely nothing else did.
If you already didn’t have a great way to access internal development resources before, then having an ephemeral VM in a cloud provider spinning up and down as you need it for development doesn’t make that any easier. Especially if it’s not just your development environment, but every user in your organization’s.
Luckily, Tailscale works as part of a [dev container](https://code.visualstudio.com/docs/remote/containers) with a reusable auth key, so that every GitHub Codespace you spin up can automatically connect to your tailnet. You can use Tailscale to access resources on your tailnet, or to [share](https://tailscale.com/kb/1084/sharing/) your development environment with others.
### What’s a dev container?
There are many valid reasons to have a remote development environment: availability, so you can code from anywhere, like an iPad; more resources, for training an ML model, say; and security, to restrict where your production code is stored. Another great reason is standardization, to ensure consistent development environments for different projects, or for all members of your team.
One of the most annoying things about getting a new laptop (other than changing charging cables) is having to set up your development environment just the way you like it. A [`devcontainer.json` file](https://code.visualstudio.com/docs/remote/devcontainerjson-reference) for VSCode aims to address that problem—allowing you to specify your personal preferences, or a project’s preferences, to make it easier for other developers to contribute—including hardware, extensions, and settings. The extensions are launched alongside your development environment when it’s started up.
### Tailscale in your dev container
By including Tailscale in your dev container, you can make sure that any new environment you spin up in GitHub Codespaces will connect to your tailnet. To set this up, you’ll need to add a Tailscale client, and authenticate to Tailscale with an [auth key](<https://tailscale.com/kb/1085/auth-keys/?q=auth key>). We recommend using a reusable auth key, rather than an ephemeral key, so that your environment always reconnects as the same Tailscale node. You can store this as a [Codespaces secret](https://docs.github.com/en/codespaces/managing-your-codespaces/managing-encrypted-secrets-for-your-codespaces).
Check out [the docs](https://tailscale.com/kb/1160/github-codespaces/) and [our repo for a sample GitHub Codespaces `devcontainer.json`](https://github.com/tailscale/codespace) using Tailscale with a reusable auth key.
So, what can you do with Tailscale in your GitHub Codespace?
* Share a staged resource with a colleague, as part of a review
* Access a cloud or on-prem resource, like a production database
* Pair program
* Access a package registry
* Complete a coding interview
[Jasper](https://www.jasper.io/) is an Asia-Pacific real estate investment company, providing a digital platform for large and small investors to invest in commercial real estate. Jasper already uses Tailscale as their corporate VPN. Since Jasper uses a service oriented-architecture, their testing environment handles the brunt of tests directly. With Tailscale from GitHub Codespaces, Jasper’s developers can access their test environment:
>
> Using Tailscale from GitHub Codespaces, our developers can access our entire test environment, as well as limited non-business critical services from our production environment, such as our Business Intelligence service. This lets us make sure that developers can move quickly, without compromising the security of our production network.
>
- *Oliver Shaw, Chief Technology Officer, Jasper*
### Tailscale plays well with GitHub
There are many ways you can use Tailscale with GitHub. You can authenticate to Tailscale using [GitHub as your identity provider](https://tailscale.com/kb/1013/sso-providers). This lets you use your existing GitHub account, and share a tailnet with others in the same [GitHub organization](https://docs.github.com/en/organizations/collaborating-with-groups-in-organizations/about-organizations). And if you’re an open source project, or sharing with friends and family, you can [use Tailscale for free with your GitHub organization](https://tailscale.com/kb/1154/free-plans-discounts/).
If you’re using GitHub Actions as a CI/CD tool, [connect Tailscale](https://github.com/tailscale/github-action) with an ephemeral auth key to reach a private set of packages for a build, or securely deploy your application to an internal server.
### Not just for GitHub Codespaces
You don’t have to use GitHub Codespaces to use a dev container, as that’s part of VSCode. Connecting to Tailscale also works from [VSCode running in a container environment](https://code.visualstudio.com/docs/remote/containers) on your desktop.
[Follow the docs](https://tailscale.com/kb/1160/github-codespaces/) and try it out yourself by checking a `devcontainer.json` file into your project.
Share
Authors
David Crawshaw
Denton Gentry
Authors
David Crawshaw
Denton Gentry
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