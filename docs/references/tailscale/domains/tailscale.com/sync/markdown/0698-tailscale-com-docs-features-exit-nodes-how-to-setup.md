Use exit nodes · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Use exit nodes
Last validated: Sep 19, 2025
This topic is a quick guide for configuring exit nodes in a tailnet. For more detailed information, see [Exit nodes](/docs/features/exit-nodes).
## [Advertise a device as an exit node](#advertise-a-device-as-an-exit-node)
To use a tailnet device as an exit node, select an OS and complete the steps.
[Linux](/docs/features/exit-nodes/how-to/setup?tab=linux)[macOS](/docs/features/exit-nodes/how-to/setup?tab=macos)[Windows](/docs/features/exit-nodes/how-to/setup?tab=windows)[tvOS](/docs/features/exit-nodes/how-to/setup?tab=tvos)[Android](/docs/features/exit-nodes/how-to/setup?tab=android)
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
3. In the terminal session, advertise the device as an exit node.
```
`sudo tailscale set --advertise-exit-node
`
```
4. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
5. Locate the device in the list. It should display the **Exit Node** badge.
6. Select the menu, then select **Edit route settings**.
7. Check the **Use as exit node** box, then select **Save**.
## [Use an exit node](#use-an-exit-node)
Each device must enable the exit node separately. The instructions for enabling an exit node vary depending on the device's operating system.
[Android](/docs/features/exit-nodes/how-to/setup?tab=android)[iOS](/docs/features/exit-nodes/how-to/setup?tab=ios)[Linux](/docs/features/exit-nodes/how-to/setup?tab=linux)[macOS](/docs/features/exit-nodes/how-to/setup?tab=macos)[tvOS](/docs/features/exit-nodes/how-to/setup?tab=tvos)[Windows](/docs/features/exit-nodes/how-to/setup?tab=windows)
1. Open the Tailscale app on the Android device and go to the **Exit Node** section.
2. Select the exit node that you want to use. If you want to allow direct access to your local network when routing traffic through an exit node, toggle **Allow LAN access** on.
3. On the app home screen, confirm that the selected device displays in the **Exit Node** section. When an exit node is being used for the device, the section will turn blue.
To stop a device from using an exit node, go to the **Exit Node** section and select **None**.
You can turn off routing through an exit node by selecting **None** from the **Exit Node** drop-down.
On this page
* [Advertise a device as an exit node](#advertise-a-device-as-an-exit-node)
* [Use an exit node](#use-an-exit-node)
Scroll to top