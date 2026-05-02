Configure a subnet router · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Configure a subnet router
Last validated: Jan 5, 2026
This topic is a quick guide for configuring subnet routers in a tailnet. For more detailed information, see [Subnet routers](/docs/features/subnet-routers).
To use a tailnet device as a subnet router, select your platform and complete the steps.
[Linux](/docs/features/subnet-routers/how-to/setup?tab=linux)[macOS](/docs/features/subnet-routers/how-to/setup?tab=macos)[Windows](/docs/features/subnet-routers/how-to/setup?tab=windows)[tvOS](/docs/features/subnet-routers/how-to/setup?tab=tvos)[Android](/docs/features/subnet-routers/how-to/setup?tab=android)
1. [Download and install](/docs/install/linux) the Tailscale client.
2. Open a terminal session on the device and enable IP forwarding.
If your Linux system has a `/etc/sysctl.d` directory, use:
```
`echo 'net.ipv4.ip\_forward = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.d/99-tailscale.conf
sudo sysctl -p /etc/sysctl.d/99-tailscale.conf
`
```
Otherwise, use:
```
`echo 'net.ipv4.ip\_forward = 1' | sudo tee -a /etc/sysctl.conf
echo 'net.ipv6.conf.all.forwarding = 1' | sudo tee -a /etc/sysctl.conf
sudo sysctl -p /etc/sysctl.conf
`
```
3. In the terminal session, advertise subnet routes for the device. Replace the subnets in the example below with the subnets for your network.
```
`sudo tailscale set --advertise-routes=192.0.2.0/24,198.51.100.0/24
`
```
4. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and locate the device in the list. It should display the **Subnets** badge.
5. Select the menu, then select **Edit route settings**.
6. Check the IP range boxes that correspond to the subnet routes you want to advertise, then select **Save**.
For more information about subnet router configuration with Tailscale, review [Subnet routers](/docs/features/subnet-routers).
Scroll to top