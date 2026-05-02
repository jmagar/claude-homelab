Troubleshoot multiple devices with the same 100.x IP address · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot multiple devices with the same 100.x IP address
Last validated: Mar 16, 2026
Multiple devices with the same [100.x IP address](/docs/concepts/tailscale-ip-addresses) can occur if you use a backup of one device to create another, or clone a file system from one device to another. The Tailscale configuration files are duplicated. The Tailscale files will need to be removed from one of the two.
You can identify duplicated devices in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console by looking for a **Duplicate node key** badge underneath the device name.
On one of the systems, uninstall and *completely* delete the Tailscale client. For more information, refer to [Uninstall Tailscale](/docs/features/client/uninstall). It is especially important to remove the files listed for your platform, the goal is to make a new Tailscale IP address when it is installed again. Then, reinstall the Tailscale client, by following the instructions at [Install Tailscale](/docs/install).
Scroll to top