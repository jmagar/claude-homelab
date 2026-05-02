Zero Trust SSH Access with Enhanced Security | Tailscale
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productMarch 22, 2024
# Zero Trust SSH Access with Enhanced Security
We’re thrilled to announce that [Tailscale SSH](https://tailscale.com/ssh) is now Generally Available. Tailscale SSH allows Tailscale to manage the authentication and authorization of SSH connections on your tailnet. From the user’s perspective, you use SSH as normal—authenticating with Tailscale according to configurable rules—and we handle SSO, MFA, and key rotation, and allow you to enforce precise permissions in ACLs. Combined with other enterprise features like user and group provisioning with SCIM, you can use Tailscale SSH to craft a fully zero-trust remote access solution.
Thanks to that flexibility and strong security-by-default, Tailscale SSH has already become a key component of many of our users’ workflows, including as a foundational piece of enterprise ZTNA strategies. With no additional hardware or firewall rules to manage, it’s basically a drop-in upgrade for ubiquitous—and sometimes somewhat fiddly—SSH processes.
We’ve got more conceptual background on how Tailscale SSH works, and what motivated us to release it, in [its original launch post](https://tailscale.com/blog/tailscale-ssh). You may also be interested in the tutorial video we recently published as part of our Tailscale Explained video series:
We’ve learned a lot from the Beta period of Tailscale SSH, and built up features alongside it, so today it’s entering a much more robust ecosystem of tooling than when we first launched in 2022. Some highlights include:
* We released the Tailscale SSH Console, allowing designated users to create browser-based SSH sessions to nodes on their tailnet
* We added support for remote port forwarding and SELinux
* We launched [session recording for Tailscale SSH](https://tailscale.com/kb/1246/tailscale-ssh-session-recording), enabling teams to meet compliance requirements and monitor SSH sessions across their tailnet without needing to trust a third party with their session data—including us.
* We built our [VS Code extension](https://marketplace.visualstudio.com/items?itemName=tailscale.vscode-tailscale), which allows you to edit remote files on nodes across your tailnet, on top of Tailscale SSH
If you’re already using SSH for remote access, but haven’t yet gotten started with Tailscale SSH, [there’s no time like the present](https://tailscale.com/kb/1193/tailscale-ssh). It is available today on our Personal, Premium, and Enterprise plans.
Share
Author
Sam Linville
Author
Sam Linville
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