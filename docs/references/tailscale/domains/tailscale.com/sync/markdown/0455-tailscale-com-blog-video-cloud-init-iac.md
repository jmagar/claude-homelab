Video: Tailscale automation with cloud-init
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsAugust 02, 2024
# Automating Tailscale installs with cloud-init: Infrastucture as Code, part 1
When you're installing Tailscale on more than a device or two, it can make sense to automate the process. That kind of automation is part of a field called "Infrastructure as Code," which is the focus of a [new video series](https://www.youtube.com/playlist?list=PLbKN2w7aG8EIbpIcZ2iGGsFTIZ-zMqLOn) we're launching on automating the set-up of Tailscale in the cloud.
In today's video, I cover how to manually deploy a VPS instance on DigitalOcean (a "droplet," in their terminology), pre-configured to join your tailnet using [cloud-init](https://cloud-init.io/).
In the next installment I'll cover automating this deployment using Terraform, and then we'll move on to an Ansible configuration. You can find all the code snippets you need in [the Tailscale documentation](https://tailscale.com/kb/1293/cloud-init) on cloud-init, as well as [this GitHub repo](https://github.com/tailscale-dev/video-code-snippets/tree/main/2024-07-cloud-init) where I've open sourced the code used in this series.
Share
Author
Alex Kretzschmar
Author
Alex Kretzschmar
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