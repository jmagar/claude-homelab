Tailscale's GitHub Action v4, built in TypeScript for better CI/CD pipelines
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productNovember 17, 2025
# Tailscale GitHub Action v4: faster, more reliable, and new features
Tailscale has a unique ability to connect any machine to any machine, and [CI/CD pipelines](https://tailscale.com/use-cases/ci-cd/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=new-github-action) are no exception. The [Tailscale Github Action](https://github.com/tailscale/github-action) has, as of this writing, nearly 800 stars since its first release in April 2021.
The first three versions of the Tailscale GitHub Action were written in bash, and bash had served us well. As we received feedback from power users of the Action, and started to form ideas about how we’d like to improve, it became clear that we needed to port the Action to a more powerful language.
Version 4 of the Tailscale GitHub Action now uses TypeScript and the core of the [GitHub Actions Toolkit](https://github.com/actions/toolkit). This rewrite opens doors to new functionality and allows us to fix long-standing issues with the Bash action that will make the experience even smoother.
## [Community Feedback](#community-feedback)
For many Tailscale users, the GitHub action seamlessly unlocks workflows that weren’t previously possible. GitHub’s managed runners run outside the security boundary that you have inside your network, so it can be incredibly difficult to run workflows that involve activities like integration tests against internal APIs, database migrations against private databases, or infrastructure as code (IaC) tasks against secret managers. By adding a single step to your workflow to include a Tailscale device, you can connect your GitHub managed runner to your infrastructure following [zero trust principles](https://tailscale.com/kb/1123/zero-trust/?utm_source=blog&amp;utm_medium=content&amp;utm_campaign=new-github-action), enabling automation that saves time and dollars.
Our bash-based Action provided that upgrade, but it had several areas that needed to improve.
One common piece of feedback we heard was that since the propagation of firewall rules and device presence in the tailnet network can take some time, CI workloads sometimes couldn't reach the rest of the network right away. When you add a device to the tailnet, it takes a moment for the other devices to appear in the netmap. When logging into a human device like a laptop or phone, this is generally transparent to the user, but in a GitHub workflow, this could sometimes affect the user experience.
Another note from Action users was that the GitHub Action device “hung around” in the Tailscale console as a disconnected device for a time after the action had terminated. This could potentially cause confusion to Tailscale admins, and counted against overall device limits for a tailnet until they were periodically removed by our backend systems, so users had to clean up devices “out of band.”
Finally, GitHub Actions are billed based on the amount of time they operate, so performance is critical when connecting to Tailscale. The act of downloading, installing, and initiating Tailscale is generally in the low seconds, but as the number of CI/CD jobs scales, every second counts. Improving performance could save existing and new users of the action meaningful money over time.
The newly released version of the GitHub Action addresses all of these issues and provides a drastically improved experience. Here are its new features and upgrades.
## [DNS Setup & Connectivity](#dns-setup-and-connectivity)
The GitHub Action supports a new parameter: [ping](https://github.com/tailscale/github-action/blob/main/action.yml#L60).
The ping parameter blocks the workflow until connectivity and DNS resolution for the specified devices is established within the tailnet, ensuring that workflow runs connect to other devices only once those devices are ready to accept the workflow's connections.
Ping accepts IP and DNS names like so:
```
`- name: Tailscale
uses: tailscale/github-action@v4
with:
ping: 100.x.y.z,my-machine.my-tailnet.ts.net`
```
## [Device Cleanup](#device-cleanup)
The new GitHub action now automatically runs `tailscale logout` on completion of the workflow. This capability is not available in bash-based Actions, but is enabled by default on TypeScript-based Actions. By upgrading to the v4 version of the GitHub Actions, users will be able to keep their tailnets clean, without any manual steps.
## [Speed Improvements](#speed-improvements)
The TypeScript SDK enables much more efficient caching capabilities inside the runner. This results in a notable speed increase compared to the bash-based runner, and enables more reliable performance. We made the decision to enable binary caching by default with this major version bump of the runner, and we’re excited to hear from customers how much time this saves!
## [Give it a try](#give-it-a-try)
Upgrading to the v4 version of the Action should be a simple change for most organizations. Simply update your workflows to reference v4 of the Action:
```
`- name: Tailscale
uses: tailscale/github-action@v4`
```
Feedback, of course, is always appreciated. Let us know—via [Discord](https://discord.com/invite/tailscale), [Reddit](https://www.reddit.com/r/Tailscale/) or [GitHub Issues](https://github.com/tailscale/tailscale/issues)—what else you’d like to see in Tailscale’s CI/CD tools.
Share
Author
Lee Briggs
Contributor
Percy Wegmann
Author
Lee Briggs
Contributor
Percy Wegmann
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