Access TrueNAS SCALE from anywhere · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access TrueNAS SCALE from anywhere
Last validated: Sep 19, 2025
[TrueNAS SCALE](https://www.truenas.com/truenas-scale/) is a Linux-based network-attached storage (NAS) operating system maintained by [iX Systems](https://www.ixsystems.com/). It provides OpenZFS storage technology and lets users run self-hosted applications, remote offsite backups, and virtual machine management capabilities. You can connect your TrueNAS SCALE server to a Tailscale network (known as a tailnet) and securely configure multiple TrueNAS SCALE servers for ZFS replication.
There are two kinds of TrueNAS offerings. TrueNAS SCALE is the Linux version and is what we recommend for use with Tailscale. TrueNAS SCALE uses our officially supported and maintained [Tailscale Docker image](https://hub.docker.com/r/tailscale/tailscale).
TrueNAS Core is the BSD version and is not officially supported. The FreeBSD versions of Tailscale for TrueNAS Core is community-maintained, and the client is available in [FreshPorts](https://www.freshports.org/security/tailscale).
## [Requirements](#requirements)
* At least one TrueNAS SCALE server with administrative access.
* An existing tailnet with admin access. For instructions, refer to [Tailscale quickstart](/docs/how-to/quickstart).
* You must be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet for some actions needed in the admin console.
## [Generate authentication keys](#generate-authentication-keys)
There are multiple ways of [adding new devices](/docs/features/access-control/device-management/how-to/set-up) to a tailnet. For servers, such as TrueNAS SCALE, we recommend generating and using [authentication (auth) keys](/docs/features/access-control/auth-keys). Specifying an auth key during Tailscale setup will automatically join the device to your tailnet.
To generate an auth key:
1. Go to the [Keys](https://login.tailscale.com/admin/settings/keys) page of the admin console and select **Generate auth key**.
2. In the **Description** field, enter a name for the TrueNAS SCALE server.
3. (Optional) Toggle **Reusable** to on if you want to assign the same auth key to multiple TrueNAS SCALE servers if you plan on adding multiple TrueNAS SCALE server to your tailnet.
## [Install and configure Tailscale](#install-and-configure-tailscale)
1. Open TrueNAS SCALE and select the **Apps** tab.
2. Select **Check for available apps**, then find and install the Tailscale app.
If this is not a new set up, the **Check for available apps** button may not appear.
1. Select **Edit** for the Tailscale app.
2. In the **Auth Key** field, add the authentication key you generated in the previous section.
3. In the **Hostname** field, enter the hostname for the server in the tailnet.
4. Check the **Userspace** box.
5. Select **Save**.
You can now verify that your TrueNAS SCALE server is connected to the tailnet in the Tailscale by going to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and verifying that you can find the TrueNAS SCALE server in your tailnet.
## [Route tailnet traffic through TrueNAS](#route-tailnet-traffic-through-truenas)
You can configure TrueNAS SCALE as an [exit node](/docs/features/exit-nodes) to route traffic for other devices in the tailnet through your TrueNAS SCALE server. This is useful when accessing untrusted Wi-Fi in a cafe or using an online service (such as banking) only available in your home country from overseas.
1. Open TrueNAS SCALE.
1. Select the **Apps** tab and open the Tailscale app settings.
2. Check the **Exit node** box.
3. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
1. Locate the TrueNAS SCALE server in the list. It should display the **Exit Node** badge.
2. Select the menu, then select **Edit route settings**.
3. Check the **Use as exit node** box, then select **Save**.
To allow other devices to use the TrueNAS SCALE server as an exit node, refer to [Use exit nodes](/docs/features/exit-nodes/how-to/setup#use-an-exit-node).
## [Route non-tailnet traffic through TrueNAS](#route-non-tailnet-traffic-through-truenas)
You can configure TrueNAS as a [subnet router](/docs/features/subnet-routers) for your tailnet, in cases where you can't install Tailscale on every device on your physical network.
1. Open TrueNAS SCALE.
1. Select the **Apps** tab and open the Tailscale app settings.
2. In the **Route** field, add a CIDR IP range to indicate which subnet will have access to the tailnet such as `192.168.0.0/24`. You can add multiple routes for multiple subnets.
3. Go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console and locate the TrueNAS server in the list. It should display the **Subnets** badge.
1. Select the menu, then select **Edit route settings**.
2. Check the IP range boxes that correspond to the subnet routes you want to advertise, then select **Save**.
## [Configure TrueNAS ZFS replication](#configure-truenas-zfs-replication)
Configure TrueNAS SCALE settings to allow ZFS replication for backing up files across multiple TrueNAS SCALE servers over your tailnet. This lets you replicate to remote systems without opening ports or routing traffic through bastion servers or proxies using Tailscale's direct device-to-device connections.
1. Open TrueNAS SCALE, go to the **Apps** tab, locate the installed Tailscale app, and select **Edit**.
1. Uncheck the **Userspace** box and check the **Host Network** box.
2. Select **Save**.
3. Go to the **Network** tab and in the **Interfaces** section, locate `tailscale0` to confirm that rebinding occurred and there is a two-way Tailscale connection between the two TrueNAS SCALE servers.
4. Go to the **System Settings** tab, and select **General**.
1. In the **GUI** section, select **Settings**.
2. In the **Web Interface IPv4 Address** field make sure the IP address is `0.0.0.0`.
3. Select **Save**.
4. Go to the **System Settings** tab and select **Services**.
1. Locate **SSH**, select the **Edit** icon, and select **Advanced Settings**.
2. In the **Bind Interfaces** drop-down, select `tailscale0`.
3. Select **Save**.
4. Go to the **Credentials** tab, then **Backup Credentials**.
1. In the **SSH Connections** section, select **Add**.
2. In the **Name** field, enter a name to identify the SSH connection.
3. In the **Host** field, enter the `100.x.y.z` tailnet address for the TrueNAS SCALE server. This IP address can be found in the [Machines](https://login.tailscale.com/admin/machines) page of the Tailscale admin console.
4. Select **Save**.
5. Go to the **Data Protection** tab. In the **Replication Tasks** section, select **Add**.
1. In the **SSH Connections** drop-down box, select the SSH name added in the previous step.
2. In the **SSH Transfer Security** section, make sure **Encryption** is selected.
3. In the same window, select **Advanced Replication Creation**.
4. In the **Transport** drop-down box, select `SSH+NETCAT` to optimize file transfer speed between two TrueNAS SCALE servers.
5. Select **Save**.
Special thanks to [Tom Lawrence](https://x.com/tomlawrencetech) at [Lawrence Systems](https://lawrencesystems.com/) for the guidance on this topic.
On this page
* [Requirements](#requirements)
* [Generate authentication keys](#generate-authentication-keys)
* [Install and configure Tailscale](#install-and-configure-tailscale)
* [Route tailnet traffic through TrueNAS](#route-tailnet-traffic-through-truenas)
* [Route non-tailnet traffic through TrueNAS](#route-non-tailnet-traffic-through-truenas)
* [Configure TrueNAS ZFS replication](#configure-truenas-zfs-replication)
Scroll to top