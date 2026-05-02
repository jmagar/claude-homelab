Tailscale for developers: Connect to your resources from Gitpod
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 26, 2021
# Tailscale for developers: Connect to your resources from Gitpod
Remote development is hard. You need access to *all the things* from wherever you happen to be working from this week. It could be a coffee shop, the train, or even (gasp!) the office. In an ideal world, it shouldn’t take longer to gain access to what you need to get your work done, including cloud and on-prem resources, than it does to complete the tasks at hand.
Developing remotely should be a boon, not a bottleneck, that’s why we’re excited to [partner with Gitpod](https://www.gitpod.io/blog/tailscale). We aim to make it easy to connect a running workspace in Gitpod to your resources and your colleagues using Tailscale—with Tailscale available by default in Gitpod workspaces, and Gitpod free for a year to Tailscale customers.
### Tailscale available by default in Gitpod
[Gitpod](https://www.gitpod.io/) lets you spin up automated development environments in the cloud, from any Git context. To connect your pre-configured workspace to cloud development resources, or to share with colleagues, you can use Tailscale.
Connecting your Gitpod workspace to Tailscale is easy—in fact, Tailscale is now part of the [default `full` workspace base image](https://hub.docker.com/r/gitpod/workspace-full) for Gitpod! To use it, in your workspace, run `tailscale up` and authenticate using your browser. That’s it—you’re connected. Now for the hard part, writing code.
Check out the [docs on Tailscale](https://tailscale.com/kb/1161/gitpod-io/) and [Gitpod](https://www.gitpod.io/docs/configure/tailscale) to get started.
### Tailscale ‘just works’ in any Gitpod workspace
If you’re managing your own base image, you can still use Tailscale, and automatically connect any new workspace you spin up in Gitpod. Add the Tailscale client as part of a [custom Docker image](https://www.gitpod.io/docs/config-docker) for your project in Gitpod, and authenticate to Tailscale with an [auth key](<https://tailscale.com/kb/1085/auth-keys/?q=auth key>) stored as a Gitpod environment variable. We recommend using an ephemeral auth key if you plan to treat your Gitpod workspaces as ephemeral. Otherwise, use a reusable auth key, so that your environment always reconnects as the same Tailscale node. You’ll also need to add a task to start up Tailscale as part of your [`.gitpod.yml`](https://www.gitpod.io/docs/config-gitpod-file) configuration file.
Check out [Gitpod’s repo for a sample `.gitpod.Dockerfile` and `.gitpod.yml` to get started](https://github.com/gitpod-io/template-tailscale).
### Do more with Tailscale and OpenVSCode Server
Gitpod also maintains [OpenVSCode Server](https://github.com/gitpod-io/openvscode-server), which allows you to run a version of VSCode remotely and access it through a browser. Tailscale works with OpenVSCode Server too! ([Even while living your best life in Australia](https://ghuntley.com/anywhere/)!)
You can install Tailscale on the node on which you are running OpenVSCode Server, following the [installation instructions for your OS](https://tailscale.com/download) and [cloud provider](https://tailscale.com/kb/guides/). This means that the entire node is on your tailnet, not just your workspace—if you’d prefer to connect only your workspace, then consider running OpenVSCode in a container (grab the container at [`docker pull gitpod/openvscode-server`](https://hub.docker.com/r/gitpod/openvscode-server)).
[Follow the docs](https://tailscale.com/kb/1162/openvscode/) to connect OpenVSCode Server to Tailscale.
### Gitpod and Tailscale
Tailscale and Gitpod are both fully remote. At Tailscale, we believe in building private networks to [connect personal networks](https://tailscale.com/blog/social-proximity-networks/), so you can communicate as if you were in the same room—or in the same office. Remote development allows you to collaborate with your colleagues, without “works on my machine” issues. We worked hard to make your network not get in your way. We’re excited to make remote work better together.
So, what can you do with Tailscale in your Gitpod environment?
* Share a staged resource with a colleague, as part of a review
* Access a cloud or on-prem resource, like a production database
* Pair program (easily and securely!)
* Access a package registry
* Complete a coding interview
If you’re already a customer of Tailscale (on any paid [pricing plan](https://tailscale.com/pricing/)), you get access to [Gitpod Professional](https://www.gitpod.io/pricing) free for a year. To redeem access, [fill in this form](https://bit.ly/tailscale-gitpod-code) with a screenshot of your Tailscale settings page to verify your eligibility and the Gitpod team will send you a coupon code.
[Check out the docs](https://tailscale.com/kb/1161/gitpod-io/) to get started connecting from Gitpod using Tailscale now.
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