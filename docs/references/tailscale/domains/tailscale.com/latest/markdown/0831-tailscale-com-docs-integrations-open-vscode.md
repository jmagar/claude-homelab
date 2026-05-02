Access your tailnet from OpenVSCode · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access your tailnet from OpenVSCode
Last validated: Sep 18, 2025
[OpenVSCode](https://www.gitpod.io/blog/openvscode-server-launch) is a way to run Visual Studio
Code on a remote machine accessed through a modern web browser.
Tailscale can be installed within an OpenVSCode VM to be able to access private resources securely,
such as databases or continuous integration nodes or servers in the dev/test environment.
## [Integration](#integration)
OpenVSCode is installed within a VM with [instructions for a number of hosting providers](https://github.com/gitpod-io/openvscode-server/tree/docs/guides).
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