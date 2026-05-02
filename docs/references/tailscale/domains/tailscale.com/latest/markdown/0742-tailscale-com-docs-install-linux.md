Install Tailscale on Linux · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Install Tailscale on Linux
Last validated: Jan 5, 2026
You can install the Tailscale client on a variety of Linux distributions using either our automated install script or distribution-specific package managers. This topic covers both mainstream distributions and those with alternative package management systems. For detailed, version-specific instructions for supported platforms, refer to the [Tailscale Packages - stable track](https://pkgs.tailscale.com/stable) page.
## [Mainstream distributions](#mainstream-distributions)
If you're installing the client on a distribution of Linux that contains a package manager such as `apt`, `yum`, or `zypper`, run the following command:
```
`curl -fsSL https://tailscale.com/install.sh | sh
`
```
This is the same script available on our [Download](/download/linux) page. If you prefer not to use `curl | sh`, visit the [Tailscale Packages - stable track](https://pkgs.tailscale.com/stable) page for manual installation instructions for your distribution.
After installation completes, start the Tailscale client:
```
`sudo tailscale up
`
```
The output will display a URL that you can use to authenticate to your Tailscale network (known as a tailnet). After you authenticate, check the [Machines](https://login.tailscale.com/admin/machines) page of the admin console to confirm the device appears in your tailnet.
This method works on the following distributions:
* Ubuntu-based distributions
* Debian-based distributions
* Red Hat Enterprise Linux (RHEL), CentOS, Fedora, and derivatives
* Raspberry Pi OS
* Amazon Linux
* openSUSE and SUSE Linux Enterprise
* Oracle Linux
* VMware Photon OS
If there is a distribution that you would like us to officially support, contact [Tailscale Support](/contact/support) so that we can consider adding official support for the distribution.
## [Other distributions](#other-distributions)
You can install the Tailscale client on distributions with alternative package managers.
* [Arch Linux](/docs/install/arch)
* [NixOS](/docs/install/nixos)
## [Static binaries](#static-binaries)
For other Linux distributions not covered by the install script, we provide static binaries as an alternative.
To install a static binary version of the Tailscale client:
1. [Download](https://pkgs.tailscale.com/stable/#static) the static binaries for your CPU architecture.
2. Unpack the archive:
```
`tar xvf tailscale\_\<version\>\_\<architecture\>.tgz
`
```
For example, if you've downloaded version 1.90.6 of the Tailscale client for AMD64, the command is `tar xvf tailscale\_1.90.6\_amd64.tgz`.
3. Start [tailscaled daemon](/docs/reference/tailscaled):
```
`sudo tailscaled --state=tailscaled.state
`
```
If you want to configure systemd to run tailscaled automatically, a service configuration is available in the `systemd/` subdirectory of the unpacked archive.
4. Start the Tailscale client:
```
`sudo tailscale up
`
```
The output will display a URL that you can use to authenticate to your tailnet. After you authenticate, check the [Machines](https://login.tailscale.com/admin/machines) page of the admin console to confirm the device appears in your tailnet.
## [Verify the installation](#verify-the-installation)
When you add a machine to a tailnet, it's assigned a Tailscale IPv4 and IPv6 address. This helps other machines, nodes, and devices know how to reach it over the secure tailnet.
To display the Tailscale IPv4 and IPv6 addresses for your device, run:
```
`tailscale ip
`
```
Check the connection status:
```
`tailscale status
`
```
## [Further exploration](#further-exploration)
### [Disable key expiry](#disable-key-expiry)
Devices in a tailnet periodically re-authenticate to stay secure through device key expiry, which requires re-authentication after a set period. For devices that should remain continuously connected, such as servers, Raspberry Pis, media centers, smart home hubs, Docker hosts, and NAS devices, you can disable key expiry to avoid any unnecessary disruptions.
To disable key expiry for a device, go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, select the icon next to the device, then select **Disable key expiry**.
Disabling key expiry reduces security and can expose your network if the device or key is compromised. Only do this for trusted devices and revoke the key immediately if the device is lost or replaced. For more information, refer to [Key expiry](/docs/features/access-control/key-expiry).
If your device's key is already expired, you can use the following command to force re-authentication:
```
`sudo tailscale up --force-reauth
`
```
### [Use Tailscale SSH](#use-tailscale-ssh)
[Tailscale SSH](/docs/features/tailscale-ssh) lets you manage SSH access to your machine, secure SSH access through your tailnet without exposing SSH to the public internet.
You can enable Tailscale SSH on your machine by running the following:
```
`tailscale set --ssh
`
```
### [Install unstable versions](#install-unstable-versions)
We offer unstable versions of the Tailscale client for users who want to test new features and fixes before they're distributed to the wider community. If you'd like to help test new features, you can download and install unstable clients from the [Tailscale Packages - unstable track](https://pkgs.tailscale.com/unstable) page.
For more information, refer to [Tailscale client versions and release tracks](/docs/reference/tailscale-client-versions).
## [Troubleshooting](#troubleshooting)
### [Issues using the install script](#issues-using-the-install-script)
If the install script fails, it displays diagnostic output information in the terminal session. Include this output when contacting our [support team](/contact/support).
### [Missing kernel modules](#missing-kernel-modules)
Tailscale requires the `tun` kernel module. Most distributions include this by default. If you encounter errors about missing `tun`, load it manually:
```
`sudo modprobe tun
`
```
To load it automatically on boot, add `tun` to `/etc/modules` or `/etc/modules-load.d/tun.conf`.
### [Disable logging](#disable-logging)
By default, Tailscale sends logs to Tailscale servers about device connectivity to a tailnet. We use this data to diagnose and troubleshoot issues when users reach out to Tailscale with an issue. To disable logging:
Edit `/etc/default/tailscaled` and add:
```
`TS\_NO\_LOGS\_NO\_SUPPORT=true
`
```
Or add `--no-logs-no-support` to the `FLAGS` variable.
Disabling logs may prevent Tailscale from providing technical support.
## [Distribution and version links](#distribution-and-version-links)
You can find individual topics for Linux distributions below.
### [Ubuntu](#ubuntu)
* [Ubuntu 16.04 LTS (xenial)](/docs/install/ubuntu/ubuntu-1604)
* [Ubuntu 18.04 LTS (bionic)](/docs/install/ubuntu/ubuntu-1804)
* [Ubuntu 19.10 (eoan)](/docs/install/ubuntu/ubuntu-1910)
* [Ubuntu 20.04 LTS (focal)](/docs/install/ubuntu/ubuntu-2004)
* [Ubuntu 20.10 (groovy)](/docs/install/ubuntu/ubuntu-2010)
* [Ubuntu 21.04 (hirsute)](/docs/install/ubuntu/ubuntu-2104)
* [Ubuntu 21.10 (impish)](/docs/install/ubuntu/ubuntu-2110)
* [Ubuntu 22.04 (jammy)](/docs/install/ubuntu/ubuntu-2204)
* [Ubuntu 22.10 (kinetic)](/docs/install/ubuntu/ubuntu-2210)
* [Ubuntu 23.04 (lunar)](/docs/install/ubuntu/ubuntu-2304)
* [Ubuntu 23.10 (mantic)](/docs/install/ubuntu/ubuntu-2310)
* [Ubuntu 24.04 (noble)](/docs/install/ubuntu/ubuntu-2404)
* [Ubuntu 24.10 (oracular)](/docs/install/ubuntu/ubuntu-2410)
* [Ubuntu 25.04 (plucky)](/docs/install/ubuntu/ubuntu-2504)
* [Ubuntu 25.10 (questing)](/docs/install/ubuntu/ubuntu-2510)
### [Debian](#debian)
* [Debian Trixie (stable)](/docs/install/debian/debian-trixie)
* [Debian Bookworm (oldstable)](/docs/install/debian/debian-bookworm)
* [Debian Bullseye (oldoldstable)](/docs/install/debian/debian-bullseye)
* [Debian Buster (archived)](/docs/install/debian/debian-buster)
* [Debian Sid (unstable)](/docs/install/debian/debian-sid)
* [Debian Stretch (archived)](/docs/install/debian/debian-trixie)
* [Raspberry Pi OS (Trixie)](/docs/install/rpi/rpi-trixie)
* [Raspberry Pi OS (Bookworm)](/docs/install/rpi/rpi-bookworm)
* [Raspberry Pi OS (Bullseye)](/docs/install/rpi/rpi-bullseye)
* [Raspberry Pi OS (Buster)](/docs/install/rpi)
* [Raspberry Pi OS (Stretch)](/docs/install/rpi/rpi-stretch)
### [CentOS](#centos)
* [CentOS 7](/docs/install/centos/centos-7)
* [CentOS 8](/docs/install/centos/centos-8)
* [CentOS Stream 9](/docs/install/centos/centos-stream-9)
* [CentOS Stream 10](/docs/install/centos/centos-stream-10)
### [openSUSE](#opensuse)
* [openSUSE Leap 15.1](/docs/install/opensuse/opensuse-leap-15-1)
* [openSUSE Leap 15.2](/docs/install/opensuse/opensuse-leap-15-2)
* [openSUSE Leap 15.3](/docs/install/opensuse/opensuse-leap-15-3)
* [openSUSE Leap 15.4](/docs/install/opensuse/opensuse-leap-15-4)
* [openSUSE Leap 15.5](/docs/install/opensuse/opensuse-leap-15-5)
* [openSUSE Leap 15.6](/docs/install/opensuse/opensuse-leap-15-6)
* [openSUSE Leap 16.0](/docs/install/opensuse/opensuse-leap-16.0)
* [openSUSE Tumbleweed](/docs/install/opensuse/opensuse-tumbleweed)
### [Oracle Linux](#oracle-linux)
* [Oracle Linux 7](/docs/install/oracle-linux/oracle-linux-7)
* [Oracle Linux 8](/docs/install/oracle-linux/oracle-linux-8)
* [Oracle Linux 9](/docs/install/oracle-linux/oracle-linux-9)
* [Oracle Linux 10](/docs/install/oracle-linux/oracle-linux-10)
### [Red Hat® Enterprise Linux](#red-hat-enterprise-linux)
* [RHEL 8](/docs/install/rhel/rhel-8)
* [RHEL 9](/docs/install/rhel/rhel-9)
* [RHEL 10](/docs/install/rhel/rhel-10)
### [Fedora Linux](#fedora-linux)
* [Fedora](/docs/install/fedora/fedora-1) (version 40 and earlier)
* [Fedora](/docs/install/fedora/fedora-2) (version 41 and later)
### [Other](#other)
* [Amazon Linux 2](/docs/install/amazon-linux-2)
* [Arch Linux](/docs/install/arch)
* [NixOS](/docs/install/nixos)
* [Static binaries](/docs/install/static)
If you are interested in support for another platform or architecture, run the script above then [contact us](/contact/support) by creating a feature request on GitHub, and include the output of the `install.sh` script.
On this page
* [Mainstream distributions](#mainstream-distributions)
* [Other distributions](#other-distributions)
* [Static binaries](#static-binaries)
* [Verify the installation](#verify-the-installation)
* [Further exploration](#further-exploration)
* [Disable key expiry](#disable-key-expiry)
* [Use Tailscale SSH](#use-tailscale-ssh)
* [Install unstable versions](#install-unstable-versions)
* [Troubleshooting](#troubleshooting)
* [Issues using the install script](#issues-using-the-install-script)
* [Missing kernel modules](#missing-kernel-modules)
* [Disable logging](#disable-logging)
* [Distribution and version links](#distribution-and-version-links)
* [Ubuntu](#ubuntu)
* [Debian](#debian)
* [CentOS](#centos)
* [openSUSE](#opensuse)
* [Oracle Linux](#oracle-linux)
* [Red Hat® Enterprise Linux](#red-hat-enterprise-linux)
* [Fedora Linux](#fedora-linux)
* [Other](#other)
Scroll to top