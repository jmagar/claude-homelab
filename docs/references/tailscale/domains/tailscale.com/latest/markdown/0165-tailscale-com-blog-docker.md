Tailscale extension for Docker Desktop launches at DockerCon
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|May 10, 2022
# Tailscale extension for Docker Desktop launches at DockerCon
You can use Tailscale to securely connect to the resources you need for development, including internal tools and databases, no matter where you are or where your development environment lives.
**Today, as part of [DockerCon](https://docker.events.cube365.net/dockercon/2022), we’re excited to launch our Tailscale [Docker Desktop extension](https://www.docker.com/blog/docker-extensions-discover-build-integrate-new-tools-into-docker-desktop).** The Tailscale extension for Docker Desktop makes it easy to share exposed container ports from your local machine with other users and devices on your tailnet.
Use Tailscale in Docker Desktop to share a staged copy of your work with a colleague as part of a code review, or share in-progress feedback with teammates. Or access production resources from your development environment, such a database, a package registry, or a licensing server. Because Tailscale works with SSO from your identity provider, Tailscale makes it easier to safely share what you’re working on with anyone in your organization, based on access controls.
Tailscale doesn’t need an entire kernel to run, as long as there’s some sort of internet connection. That means that Tailscale also works in containers: [userspace networking mode](/kb/1112/userspace-networking/) allows you to run Tailscale where you don’t have access to create a VPN tunnel device, such as in container environments. Using the device driver /dev/net/tun, Tailscale can instantiate a VPN tunnel and give your containers a static IP to communicate with each other, even if there are container layers between devices.
To get started, add the Tailscale extension in Docker Desktop and log in to your tailnet. This will expose your running containers’ public ports to your tailnet. From there, you can [share](/kb/1084/sharing/) and [manage access](/kb/1018/acls/) to these containers just like any other nodes in your tailnet.
Ross explains how to install and use the Tailscale extension in Docker Desktop.
To get the most from the Tailscale extension for Docker Desktop:
* Run Tailscale on both your host device and in Docker Desktop. If your host device is not running Tailscale, you will not be able to access your containers locally via Tailscale, such as in your browser.
* [Enable MagicDNS](/kb/1081/magicdns/#enabling-magicdns) to give your containers short, human-readable DNS names to easily access them.
Learn more about [Docker Desktop extensions](https://www.docker.com/blog/docker-extensions-discover-build-integrate-new-tools-into-docker-desktop), and [read our documentation](/kb/1184/docker-desktop/) to get started with the Tailscale extension in Docker Desktop.
Let us know what you think on Twitter by mentioning [@Tailscale](https://twitter.com/Tailscale).
Share
Authors
Ross Zurowski
Aaron Klotz
Authors
Ross Zurowski
Aaron Klotz
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