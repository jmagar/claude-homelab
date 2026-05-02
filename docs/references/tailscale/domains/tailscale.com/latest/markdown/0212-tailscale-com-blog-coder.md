Tailscale for developers: Connect to your resources from Coder
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|October 27, 2021
# Tailscale for developers: Connect to your resources from Coder
When you’re developing software, you need to access all kinds of resources, including package registries, container image registries, databases, and other network services. You want to work with those services securely and with low latency, wherever they are, even if they’re behind a firewall or don’t have a public IP address. Most importantly, though, you need to be able to access your co-workers: when you need a code review, or you’re pair programming, you want to be able to easily share your development environment with others so they can see what you’re working on. From a development workspace in Coder, you can access resources you need for development, and share what you’re working with your co-workers with Tailscale.
### Using Tailscale with Coder
[Coder](https://coder.com/) is a developer workspace platform: it lets you develop code in a remote environment, such as a VM running on a public cloud provider. In Coder, you define your developer workspace as a Dockerfile, and installing Tailscale means that you can have bidirectional access between your developer workspace and other devices on your tailnet. Using Tailscale with Coder means that you benefit from Tailscale’s [robust, fine-grained access controls](/blog/rbac-like-it-was-meant-to-be/) and [observability with the services feature](/kb/1100/services/), while also being able to work with the editor of your choice, whether you’re using your iPad at a coffee shop or your desktop at home.
To do so, you need to add tailscaled to your Dockerfile, ensure that Tailscale’s persistent state is stored in the workspace’s persistent home volume, and enable [userspace networking](https://tailscale.com/kb/1112/userspace-networking/). If you want to be able to have outbound connections, you also need to configure Tailscale as either a SOCKS5 or HTTP proxy. See the [instructions in Coder’s](https://coder.com/docs/coder/latest/guides/customization/tailscale) or [Tailscale’s docs](https://tailscale.com/kb/1163/coder/).
Two Coder workspaces connected as part of the same tailnet can ping each other—a great tool for remote pair programming.
So, what can you do with Tailscale in Coder?
* Share a staged resource with a colleague, as part of a review
* Access a cloud or on-prem resource, like a production database
* Pair program
* Access a package registry
* Complete a coding interview
### Tailscale also works with code-server
Coder also maintains [code-server](https://github.com/cdr/code-server), which is an open-source project for running VSCode in your browser. Tailscale works with code-server too!
A developer over at Render set up code-server to run VSCode locally, and using Tailscale, can connect to their private SSH server via a subnet router:
>
> I’m feeling good. I have VS Code running remotely within a secure private network and am connecting to it using a secure protocol. All my extensions and config are there.
>
[Read how in Render’s blog](https://render.com/blog/host-a-dev-environment-on-render-with-vs-code-and-tailscale), or [check out our docs](https://tailscale.com/kb/1164/codeserver/).
To connect to your tailnet from a Coder developer workspace, follow [the instructions in Coder’s docs](https://coder.com/docs/coder/latest/guides/customization/tailscale).
Share
Author
David Crawshaw
Author
David Crawshaw
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