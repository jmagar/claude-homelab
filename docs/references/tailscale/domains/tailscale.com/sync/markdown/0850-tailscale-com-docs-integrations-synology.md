Access Synology NAS from anywhere · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Access Synology NAS from anywhere
Last validated: Jan 5, 2026
Tailscale lets you remotely access your Synology NAS. In the video below, Alex covers the basics you need know to get up and running.
## [Features and benefits](#features-and-benefits)
When a Synology NAS device is connected, Tailscale supports the following:
* Log in using a [supported identity provider](/docs/integrations/identity).
* Access your Synology device from anywhere, [without opening firewall ports](/blog/how-nat-traversal-works).
* Share your Synology device with designated Tailscale users, using [node sharing](/docs/features/sharing).
* Restrict and control access to your Synology device using [access control policies](/docs/features/access-control).
* Use your Synology device as a [subnet router](/docs/features/subnet-routers) to provide external access to your LAN.
* Designate your Synology device as an [exit node](/docs/features/exit-nodes) for secure internet access for your other tailnet devices from anywhere.
## [Install using Synology Package Center](#install-using-synology-package-center)
Installation from the Synology Package Center is the easiest way to get started.
We recommend that you [schedule automatic updates](#schedule-automatic-updates) as the version published in the Synology app store may not always reflect the most recently released Tailscale version.
1. Go to the Synology Package Center ([tutorial](https://kb.synology.com/en-sg/DSM/tutorial/How_to_install_applications_with_Package_Center)).
2. Search for and install the **Tailscale** app.
3. After the Tailscale app is installed, follow the instructions to log in to your Tailscale network (known as a tailnet) using your preferred identity provider. If you don't already have a Tailscale account, a free account will be created automatically.
4. After you authenticate to the tailnet, you can connect to your Synology device from your PC, laptop, phone, or tablet by [installing Tailscale on another device](/download).
## [Schedule automatic updates](#schedule-automatic-updates)
You can create a scheduled task to check for Tailscale client updates and install them automatically.
1. In Synology, go to **Control Panel** \> **Task Scheduler**, select **Create**, and select **Scheduled Task**.
2. Select **User-defined script**.
3. In the **General Settings** tab, enter a task name and select the **User:** as `root`.
4. Go to the **Schedule** tab, select **Run on the following days**, then **Run on the follow days**, and choose an increment such as **Daily**.
5. Go to the **Task Settings** tab and enter the following for **User-defined script**:
```
`tailscale update --yes
`
```
6. Select **OK** to save the settings.
## [Enable outbound connections](#enable-outbound-connections)
Synology DSM7 introduced tighter restrictions on what packages are allowed to do. If you're running DSM6, Tailscale runs as root with full permissions and these steps are not required.
By default, Tailscale on Synology with DSM7 only lets you make inbound connections to your Synology device but outbound Tailscale access from other apps running on your Synology is not enabled.
The reason for this is that the Tailscale package does not have permission to create a [TUN device](https://en.wikipedia.org/wiki/TUN/TAP).
To enable TUN, to permit outbound connections from other things running on your Synology device:
1. Make sure you're running Tailscale v1.22.2 or later
2. In Synology, go to **Control Panel** \> **Task Scheduler**, select **Create**, and select **Triggered Task**.
3. Select **User-defined script**.
4. When the **Create task** window appears, select **General**.
5. In **General Settings**, enter a task name, select **root** as the user that the task will run for, and select **Boot-up** as the event that triggers the task. Ensure the task is enabled.
6. Select **Task Settings** and enter the following for **User-defined script**.
```
`/var/packages/Tailscale/target/bin/tailscale configure-host; synosystemctl restart pkgctl-Tailscale.service
`
```
If you're curious what it does, you can read the [`configure-host` code](https://github.com/tailscale/tailscale/blob/main/cmd/tailscale/cli/configure-synology.go).
7. Select **OK** to save the settings.
8. Reboot your Synology device. Alternatively, to avoid a reboot, run the above user-defined script as root on the device to restart the Tailscale package.
Your TUN settings should now be persisted across reboots of your device.
Upgrading the Tailscale package will require the above script to run again. When you upgrade Tailscale, run the above script as root, or reboot your Synology device.
## [Adjust Synology firewall settings](#adjust-synology-firewall-settings)
By enabling TUN, Tailscale traffic will be subject to Synology's built-in firewall.
The firewall is disabled by default. However, if you have it enabled, add an exception for the Tailscale subnet, 100.64.0.0/10. In **Main menu** \> **Control Panel** \> **Security** \> **Firewall**, add a firewall rule in the default profile that lets traffic through from the source IP subnet 100.64.0.0 with subnet mask 255.192.0.0.
## [Troubleshooting](#troubleshooting)
If your Synology NAS cannot connect to your tailnet after uninstalling and re-installing the Tailscale app, we recommend the following steps:
1. SSH into your NAS and run the command:
```
`sudo tailscale up
`
```
2. Enter the password for your NAS (if prompted), then copy the provided URL.
```
`To authenticate, visit:
https://login.tailscale.com/a/xxxxxxxxxx
Success.
`
```
3. Paste the URL into your web browser, authenticate to your tailnet, then open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console to verify that your NAS is connected to the tailnet.
## [Install Tailscale on DSM manually](#install-tailscale-on-dsm-manually)
Synology Package Center updates Tailscale approximately once per quarter. To use the latest version of Tailscale, you may either [configure automatic scheduled updates](#schedule-automatic-updates) or manually install the package.
1. [Download](https://pkgs.tailscale.com/stable/#spks) the DSM package from the Tailscale package server site.
To determine which download is appropriate for your Synology device, visit the [Synology and SynoCommunity Package Architectures](https://github.com/SynoCommunity/spksrc/wiki/Synology-and-SynoCommunity-Package-Architectures) page and look up your architecture by Synology model. Then, find the SPK download at [Tailscale Packages](https://pkgs.tailscale.com) that corresponds to your model. Synology packages (SPKs) are available from both [stable](https://pkgs.tailscale.com/stable/#spks) and [unstable](https://pkgs.tailscale.com/unstable/#spks) release tracks.
2. [Manually install](https://kb.synology.com/en-sg/DSM/tutorial/How_to_install_applications_with_Package_Center) the DSM package onto your Synology device
3. After the Tailscale app is installed, follow the instructions to log in to your Tailscale network (known as a tailnet) using your preferred identity provider. If you don't already have a Tailscale account, a free account will be created automatically.
4. After you authenticate to the tailnet, you can connect to your Synology device from your PC, laptop, phone, or tablet by [installing Tailscale on another device](/download).
5. The Tailscale daemon [`tailscaled`](/docs/reference/tailscaled) should now be running on your Synology device. You can configure it either by using the Tailscale package's Synology web UI or by using the [Tailscale CLI](/docs/reference/tailscale-cli) over SSH.
For instructions on using SSH to access Synology, refer to [How can I sign in to DSM/SRM with root privilege via SSH?](https://kb.synology.com/en-id/DSM/tutorial/How_to_login_to_DSM_with_root_permission_via_SSH_Telnet).
## [Limitations and known issues](#limitations-and-known-issues)
* If you upgrade Synology from DSM6 to DSM7, you will need to uninstall and then reinstall the Tailscale app. Do not perform the Synology DSM7 upgrade over Tailscale or you may lose your connection during the upgrade.
* If you uninstall then re-install the Tailscale app and the NAS can no longer connect to your tailnet, refer to the [Troubleshooting](#troubleshooting) section for instructions.
* Tailscale uses [hybrid networking mode](/docs/concepts/userspace-networking) on Synology, which means that if you share subnets, they will be reachable over UDP and TCP, but not necessarily pingable.
* Other Synology packages cannot make outgoing connections to your other Tailscale nodes by default on DSM7. Refer to the following instructions to enable.
* Tailscale on Synology currently can do `--advertise-routes` but not `--accept-routes`. This means that if you have other [subnet routers](/docs/features/subnet-routers), devices on those other subnets will not yet be able to reach your NAS or devices on its local subnet.
* [Tailscale SSH](/docs/features/tailscale-ssh) does not run on Synology. You can use the provided SSH server in DSM instead.
Some of these limitations are imposed on Tailscale by the DSM7 sandbox. Refer to our [Synology tracking issue on GitHub](https://github.com/tailscale/tailscale/issues/1995) for the latest status on the above issues.
## [Special thanks](#special-thanks)
Special thanks to [Guilherme de Maio (nirev)](https://github.com/nirev), who contributed the original [Synology-Tailscale package builder](https://github.com/tailscale/tailscale-synology). Tailscale now maintains this package builder and produces our official Synology packages.
On this page
* [Features and benefits](#features-and-benefits)
* [Install using Synology Package Center](#install-using-synology-package-center)
* [Schedule automatic updates](#schedule-automatic-updates)
* [Enable outbound connections](#enable-outbound-connections)
* [Adjust Synology firewall settings](#adjust-synology-firewall-settings)
* [Troubleshooting](#troubleshooting)
* [Install Tailscale on DSM manually](#install-tailscale-on-dsm-manually)
* [Limitations and known issues](#limitations-and-known-issues)
* [Special thanks](#special-thanks)
Scroll to top