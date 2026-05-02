Video: Tailscale and Ansible are a DevOps dream
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|insightsAugust 27, 2024
# An Ansible primer for DevOps: Infrastructure as Code, part 3
Ansible is one of those tools that once you learn it, you wonder why it took you so long to do so. Ansible can simplify your deployments whether you're deploying one node or 100,000, and is a staple in the toolbelt of any aspiring DevOps engineer.
In today's video I go into detail on using Ansible with Tailscale, using Tailscale SSH to simplify the sometimes-complicated story of identity and SSH keys. We're going to deploy a DigitalOcean droplet using cloud-init and Terraform that we covered in parts 1 and 2 of the [Infrastructure as Code (IaC) series](https://www.youtube.com/playlist?list=PLbKN2w7aG8EIbpIcZ2iGGsFTIZ-zMqLOn), automatically enroll that node to your tailnet (our term for a Tailscale network) before configuring a Jellyfin server running on the other side of the planet to stream video over Tailscale via a Caddy reverse proxy with no middleman.
I'll show you one of my absolute favorite tricks with Ansible — templating configuration files using the Jinja2 templating engine. In the video I use it to programatically declare my Caddyfile and the directives it contains to configure my reverse proxy up on DigitalOcean.
Today's video is the third in our Infrastructure as Code series. To recap: part 1 covered the basics of cloud-init, a tool which lets you bootstrap a cloud system and automatically enroll it on to your tailnet. Then, in part 2 I demonstrated how you can use Terraform and cloud-init together to create a fully automated cloud tailnet node.
You can find all the code snippets you need in [the Tailscale documentation](https://tailscale.com/kb/1293/cloud-init) on cloud-init, as well as [this GitHub repo](https://github.com/tailscale-dev/video-code-snippets) where I've open sourced the code used in this series.
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