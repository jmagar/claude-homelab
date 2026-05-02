Troubleshoot Windows upgrade error · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Troubleshoot Windows upgrade error
Last validated: Feb 18, 2026
As part of some Windows 10 and Windows 11 updates, the SYSTEM user's `%LocalAppData%` directory, usually at `C:\\WINDOWS\\system32\\config\\systemprofile\\AppData\\Local`, is empty after the update. This directory is where Tailscale 1.14.3 and earlier stored its internal state.
If you upgraded your Windows device and lost connectivity to Tailscale, you can either:
1. **(Recommended)** Remove the old device using the admin console, and then re-login to Tailscale from the affected Windows device. This needs both a Tailscale admin and someone with access to the device to take action.
* Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console. Find the row corresponding to the device that is affected. Select the menu at the far right and select the **Remove** option. This will remove the device from your tailnet.
* [Upgrade](/docs/features/client/update) the affected Windows device to Tailscale v1.14.4 or later.
* The affected Windows device should now prompt you to log in again to rejoin your tailnet. If [device approval](/docs/features/access-control/device-management/device-approval) is enabled, the device will need to be re-approved.
* With this option, the device will retain the same name, but have a new IP address.
* Remove the remaining Tailscale state files from the Windows device, and then re-login to Tailscale. This does not require an admin to take action, unless [device approval](/docs/features/access-control/device-management/device-approval) is enabled.
* For the affected device, remove all files in the `%LocalAppData%\\Tailscale` directory. To do this, you can open cmd.exe and run
`rmdir /s %LocalAppData%\\Tailscale\\`
* [Upgrade](/docs/features/client/update) the affected Windows device to Tailscale v1.14.4 or later.
* Re-login to Tailscale on the device. If [device approval](/docs/features/access-control/device-management/device-approval) is enabled, the device will need to be re-approved by an administrator.
* With this option, the device will be assigned a new name (for example, `old-name-1`), and have a new IP address. The device's old name will still be listed in the admin console until it is removed. At that time, the admin can rename the new device to the old name.
To avoid this issue in the future, upgrade Windows device to v1.14.4 or later prior to performing a Windows update.
Scroll to top