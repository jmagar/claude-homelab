Access your tailnet from code-server · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access your tailnet from code-server
Last validated: Sep 18, 2025
[code-server](https://github.com/cdr/code-server) is a way to run Visual Studio Code anywhere and access it in through a browser.
Tailscale can be installed within a code-server VM to be able to access private resources securely,
such as databases or continuous integration nodes or servers in the dev/test environment.
## [Integration](#integration)
code-server is installed within a VM with [instructions for a number of hosting providers](https://github.com/cdr/code-server/blob/main/docs/install.md).
Tailscale can be [installed in VMs](/docs/install/linux)
for many common hosting providers like
[AWS](/docs/install/cloud/aws),
[Azure](/docs/install/cloud/azure/linux),
[Google Cloud](/docs/install/cloud/gce), and
[Hetzner](/docs/install/cloud/hetzner).
## [Authorization](#authorization)
The VM will need to be authorized to join the tailnet using either a browser to log in,
or a [one-time auth key](/docs/features/access-control/auth-keys).
On this page
* [Integration](#integration)
* [Authorization](#authorization)
Scroll to top