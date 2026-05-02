Can't connect to other tailnet devices · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Can't connect to other tailnet devices
Last validated: Nov 14, 2025
Use the following steps to help you troubleshoot why a device can't connect to another device in the same tailnet.
1. **Ensure the Tailscale client is up-to-date**.
Make sure both devices are running the latest version of Tailscale. You can [check the version](/docs/features/client/update) of every device in your tailnet from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
You can also check the version of each device locally using the Tailscale application or the [`tailscale version`](/docs/reference/tailscale-cli#version) command. This command also has flags available to check the version of the Tailscale client or the [`tailscaled` daemon](/docs/reference/tailscaled) specifically.
If the Tailscale version is outdated, [download and install the latest version](/docs/features/client/update).
2. **Check the status of the Tailscale client**.
Check the Tailscale client status of each device using the [`tailscale status`](/docs/reference/tailscale-cli#status) command. This command lists the status of the current device's connection to every other device in the tailnet *to which it has access*. If a device isn't listed, check your [tailnet policy file](/docs/features/tailnet-policy-file) for access control policies that might prevent a connection.
3. **Verify Tailscale connectivity**.
Use the [`tailscale ping`](/docs/reference/tailscale-cli#ping) command to verify each device's connection to other tailnet devices. This command also has additional flags, such as `--verbose`, which you can use to get more information.
4. **Check each device's firewall settings**.
Check each device's local and network firewall settings to ensure no firewall rules prevent a connection between the two devices or to Tailscale.
5. **Check Tailscale access control policies**.
It's possible that you can't access an endpoint despite the absence of connection problems. This could be due to your tailnet's [access control policies](/docs/features/access-control).
Owners, Admins, and Network admins can check these policies from the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console. Pay special attention to the ACLs, grants, and SSH sections of the tailnet policy file.
Ensure the device can access the IP address or subnet of the other device and the port number of the service you're trying to access. For example, if the service you're connecting to is on port `53`, ensure no access control policies prevent you from using port `53`.
You can use the [Preview rules](https://login.tailscale.com/admin/acls/preview) tab to better understand what your access control policies allow.
You can also check Tailscale's logs on the receiving device. Each time a device attempts a connection, the receiving device logs whether it allowed or denied the connection.
6. **Confirm each device's authentication status**.
Confirm that each device is authenticated with the correct credentials (whether a user account or a [tag-based identity](/docs/features/tags)). It's also possible that a device's authentication has [expired](/docs/features/access-control/key-expiry).
7. **Check exit node and subnet router configurations**.
If either device uses an [exit node](/docs/features/exit-nodes), ensure the exit node (or subnet router) is online and configured correctly. For example, ensure no access control policies prevent the exit node from accessing the other device.
If either device is behind a [subnet router](/docs/features/subnet-routers), ensure the other device can access the routes the subnet router is advertising. For example, if the subnet router advertises `192.0.2.0/24`, the other device must have access to `192.0.2.0/24`.
Scroll to top