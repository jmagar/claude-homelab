Access your tailnet from Coder · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access your tailnet from Coder
Last validated: Mar 3, 2025
[Coder](https://coder.com) is a developer workspace platform which lets you develop code in a remote environment like a VM running in a cloud provider. In Coder, you define your developer workspace as a Dockerfile.
Tailscale can be installed within a Coder workspace to be able to access private
resources securely, such as package registries, or to share an environment with
your colleagues for code review or pair programming.
## [Integration](#integration)
Follow [Coder's instructions for getting Tailscale working in a Coder workspace](https://coder.com/docs/coder/latest/guides/customization/tailscale). You'll need to:
1. Add `tailscaled` in your [workspace's Dockerfile](https://coder.com/docs/coder/latest/images/writing). You'll also need to ensure that Tailscale's persistent state is stored in the workspace's persistent home volume, so that Tailscale can persist connections across workspace rebuilds
2. Enable [userspace networking](/docs/concepts/userspace-networking), and if you want to be able to have outbound connections, configure Tailscale as either a SOCKS5 or HTTP proxy
## [Authorization](#authorization)
To allow the Coder workspace to join your tailnet, authenticate to Tailscale from your workspace using `sudo tailscale up`.
On this page
* [Integration](#integration)
* [Authorization](#authorization)
Scroll to top