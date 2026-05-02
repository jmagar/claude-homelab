Add a device · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Add a device
Last validated: Jan 5, 2026
Devices that you want to make available in your Tailscale network (known as a tailnet) such as personal computers, mobile devices, and servers must be added to the tailnet. Tailscale network administrators can control and monitor the status of devices from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
## [Prerequisites](#prerequisites)
* An existing tailnet to add the device to.
* A user account that can authenticate to the tailnet.
## [Install Tailscale on a device](#install-tailscale-on-a-device)
1. From your browser, go to the [Download Tailscale](/download) page.
2. Download the Tailscale client for the OS version on your device.
3. Follow the installation steps for your OS version, in the [Install Tailscale](/docs/install) topic.
Alternatively, you can go to the [Machines](https://login.tailscale.com/admin/machines) page of the admin console, select the **Add device** button, select your OS, then select the **Download Tailscale** button. This will redirect you to the download page for your chosen OS.
## [Add a device to a tailnet](#add-a-device-to-a-tailnet)
Open the Tailscale client on the device and log in to your tailnet. When you authenticate from a new device, it is automatically added to the tailnet, unless [device approval](/docs/features/access-control/device-management/device-approval) is enabled. If device approval is enabled, the device will display in the [Machines](https://login.tailscale.com/admin/machines) page of the admin console with a status of [Needs approval](https://login.tailscale.com/admin/machines?q=disabled:needs-approval).
If you are adding a server to a tailnet, it is recommended that you use an [tag](/docs/features/tags) as the identity of the server, and provision the server using an [auth key](/docs/features/access-control/auth-keys). For more information, refer to [Setting up a server on your Tailscale network](/docs/how-to/set-up-servers).
## [Add a device using a QR code](#add-a-device-using-a-qr-code)
You can add devices to your Tailscale network (known as a tailnet) using a QR code instead of logging in with your [identity provider](/docs/integrations/identity) credentials. For details, refer to [Add a device using a QR code](/docs/features/access-control/device-management/how-to/set-up-qr-code).
## [Permissions](#permissions)
* If [device approval](/docs/features/access-control/device-management/device-approval) is not enabled, any user that has login access to the tailnet can add devices.
* If device approval is enabled, users with the [Owner, Admin, or IT admin](/docs/reference/user-roles) role can approve devices from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
* To review existing [tags](/docs/features/tags) in the [Access controls](https://login.tailscale.com/admin/acls) page of the admin console, users must have admin console access.
* To add new tags in the **Access Controls** page of the admin console, users must be assigned the [Owner, Admin, or IT admin](/docs/reference/user-roles) role.
* To generate [auth keys](/docs/features/access-control/auth-keys), users must be assigned the [Owner, Admin, Network Admin, or IT Admin](/docs/reference/user-roles) role.
On this page
* [Prerequisites](#prerequisites)
* [Install Tailscale on a device](#install-tailscale-on-a-device)
* [Add a device to a tailnet](#add-a-device-to-a-tailnet)
* [Add a device using a QR code](#add-a-device-using-a-qr-code)
* [Permissions](#permissions)
Scroll to top