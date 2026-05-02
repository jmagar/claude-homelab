Tailscale's Terraform module for predictable multi-cloud deployments
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productJanuary 15, 2026
# Tailscale the Terraform way
If you’ve ever provisioned virtual machines (VMs) across a mix of cloud providers, you’ll know that “bootstrap time” is when things tend to fall apart. [Cloud-init](https://cloudinit.readthedocs.io/en/latest/index.html) is powerful, but also where all the details conspire against you: YAML indentation, distro differences, network setup, and early-boot timing, to name a few. And if (when) it goes wrong, debugging can be extremely painful.
Despite these known pain points, our customers have a reasonable request: “I just want the VM to come up already connected to my tailnet.”
So we built something to do exactly that—cleanly, consistently, and in a way that works for all Tailscale and Terraform users: a [Terraform module for installing Tailscale](https://github.com/tailscale/terraform-cloudinit-tailscale)**.**
The Solutions Engineering team at Tailscale collectively spends **thousands of hours every year** working with customers who are trying to deploy Tailscale in real infrastructure. Not at the tidy diagrams level, but inside the complicated, overlapping, half-migrated reality most organisations live in.
Across AWS, Azure, GCP, DigitalOcean, Proxmox, Equinix, KubeVirt, VMware—you name it, we see the same patterns:
* People writing bespoke cloud-init templates full of fragile shell scripts
* Auth keys baked into images incorrectly
* Systemd timing issues preventing Tailscale from bringing up routes
* Devices joining the tailnet in unexpected states
* Teams maintaining 4-5 variations of “the same” bootstrap script
So we attempted something simple: **capture all that hard-won operational knowledge in one place**, ship it as an open-source Terraform module, and support it properly. Having a single, predictable, Tailscale-backed module reduces support load, reduces customer pain, and gives us a clean foundation to build on as the product evolves.
## [Cloud-init still matters—and it still hurts](#cloud-init-still-mattersand-it-still-hurts)
Cloud-init is both universal and annoying. It’s universally supported across cloud providers, and it’s the very first thing that runs on a VM, so it’s the perfect moment to configure Tailscale, before anything else on the system has a chance to go sideways. It’s also the place where things—like the aforementioned YAML, distro, and systemd quirks—quietly break.
And when cloud-init *does* break, you’re in a bad spot. You don’t get logs, you don’t get networking, and you often don’t get Tailscale SSH to help fix it. You end up staring at a VM that’s “running” but completely unreachable.
That’s exactly why we wanted something **we know works**. A module we can point customers toward with confidence, because it bundles the patterns we’ve seen succeed across thousands of hours of solution engineering calls, support tickets, and troubleshooting sessions. By codifying all of that into a Tailscale-supported module, you get a bootstrap path that is consistent, predictable, and battle-tested across the messy reality of multi-cloud deployments.
This module handles:
* Multi-part MIME encoding
* OS package installation
* Service enablement
* Tailscale auth and tagging
* Route configuration
* Exit-node support
* Ephemeral vs persistent devices
* Systemd ordering to avoid flapping or race conditions
Using this module when provisioning virtual machines handles all of the tricky parts of getting Tailscale onto the VM’s operating system reliably, without maintaining a stack of custom bootstrap scripts.
Using the Tailscale module can be done quickly and easily via [Terraform’s Modules](https://developer.hashicorp.com/terraform/language/modules):
```
`module "tailscale\_cloudinit" {
source = "github.com/tailscale/terraform-cloudinit-tailscale"
auth\_key = var.tailscale\_auth\_key
enable\_ssh = true
hostname = "example-client"
advertise\_tags = ["tag:client"]
}
resource "aws\_instance" "web" {
ami = "ami-123456"
instance\_type = "t3.micro"
user\_data = module.tailscale\_cloudinit.rendered
}
`
```
Boot the VM, and within seconds it appears in your admin console with the right tags, routes, and configuration.
## [Built for the future: More Tailscale CLI features coming](#built-for-the-future-more-tailscale-cli-features-coming)
One of the reasons we wanted this module under the Tailscale umbrella is that it becomes the foundation for future improvements. We’re actively expanding the Tailscale CLI byadding richer configuration options, more automation hooks, and cleaner escape hatches for operators.
As those features land, the module will support them. Our recently announced peer-relays feature is already supported, right out of the box.
This module is the first step toward a **stable, supported, cross-provider way to bring VMs into a tailnet via IaC**.
## [Ephemeral machines, edge nodes, CI runners](#ephemeral-machines-edge-nodes-ci-runners)
Because the module handles ephemeral registration correctly, it works extremely well for:
* Short-lived CI/CD VMs
* Blue/green rollouts
* Autoscaling fleets
* Remote lab environments
* GPU or ARM test machines
* Edge nodes that need to appear and disappear cleanly
Just set:
`ephemeral = true`
and the machine removes itself from your tailnet at shutdown.
# **Give it a try**
The module is available here:
* [GitHub](https://github.com/tailscale/terraform-cloudinit-tailscale)
* [Terraform Registry](https://registry.terraform.io/modules/tailscale/tailscale/cloudinit/latest)
* [OpenTofu Registry](https://search.opentofu.org/module/tailscale/tailscale/cloudinit/latest)
If you’re using Terraform or OpenTofu to manage VMs, this should feel like a natural addition to your stack. No surprises, no bespoke cloud-init fragments, no “Why is this failing on Ubuntu but not Amazon Linux?” mysteries. Just a predictable, supported way to get Tailscale running at the exact moment it needs to be.
And if there’s something else you’d like to see, tell us. Want new CLI integrations, expanded route controls, OIDC authentication flows, multi-cloud examples, or better handling of secrets? Got boilerplate code you keep manually copy-pasting? We’re listening.
This module exists because customers need it, and the development will continue to grow the same way: driven by real-world pain, real-world use cases, and real-world feedback, gathered from thousands of hours of calls.
You can open an [issue](https://github.com/tailscale/terraform-cloudinit-tailscale/issues), send a [PR](https://github.com/tailscale/terraform-cloudinit-tailscale/pulls), or reach out through [Discord](https://discord.com/invite/tailscale), [Reddit](https://www.reddit.com/r/Tailscale/), or by starting a conversation with the solutions engineering team. The more real-world examples we see, the better we can make this module, and the more reliably future users will benefit from your discoveries and edge cases.
This isn’t meant to be a one-off artefact. It’s something we intend to grow alongside the Tailscale CLI and the product itself. Your feedback directly shapes what comes next.
Share
Author
Lee Briggs
Author
Lee Briggs
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