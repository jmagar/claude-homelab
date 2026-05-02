What happens if the coordination server is down? · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# What happens if the coordination server is down?
Last validated: May 2, 2025
As described in [our blog post about how Tailscale works](/blog/how-tailscale-works), the coordination server is the single, centralized component of Tailscale's architecture. It is responsible for distributing public keys and firewall rules to all Tailscale devices on your network. However, if the coordination server goes down your Tailscale network will mostly continue to function:
* Tailscale does not route any traffic through the coordination server. Instead, Tailscale makes a best effort to create a direct connection between each pair of devices communicating with each other. In cases where a direct connection cannot be established, devices will bounce traffic off of one or more DERP servers, located in different regions all over the world.
* Devices' keys are stored locally. Devices can continue to communicate with each other until one of the device's keys expires. Note that the expiry time is device-dependent (based on the last time an authentication took place), which might be different between devices in a given network.
* Firewall rules are cached and enforced on each device, meaning that your existing rules and access control policies will continue to function.
On the other hand, without the coordination server in place:
* New users and devices cannot be added to the network.
* Keys cannot be refreshed and exchanged, meaning that existing devices will gradually lose access to each other.
* Firewall rules cannot be updated.
* Existing users cannot have their keys revoked.
Scroll to top