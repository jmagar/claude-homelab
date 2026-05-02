Key expiry · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Key expiry
Last validated: Jan 5, 2026
As a security feature, users need to periodically reauthenticate on
each of their devices. The default expiration period depends on your
domain setting. By default, new domains are set with an expiry period
of 180 days.
If reauthentication does not occur, keys expire and connections to/from the
given endpoint will stop working.
## [Disabling key expiry](#disabling-key-expiry)
Disabling key expiry is available for [all plans](/pricing).
You may want to disable key expiry on some devices, such as trusted servers, [subnet routers](/docs/features/subnet-routers), or remote IoT devices that are hard to reach.
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Find the row corresponding to the device you are interested in.
3. Select the menu at the far right and select the **Disable Key Expiry** option:
4. Done. The keys for that device will no longer expire.
## [Enabling key expiry](#enabling-key-expiry)
Enabling key expiry is available for [all plans](/pricing).
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Find the row corresponding to the device you are interested in.
3. Select the menu at the far right and select the **Enable Key Expiry** option:
4. Done. The keys for that device are now set with an expiration.
## [Renewing keys for an expired device](#renewing-keys-for-an-expired-device)
If keys expire for a device, connections to/from the given endpoint will stop working. For devices that
have the [Tailscale CLI](/docs/reference/tailscale-cli), running [`tailscale up --force-reauth`](/docs/reference/tailscale-cli/up) (using `sudo` if needed)
will renew the keys.
Be aware that `tailscale up --force-reauth` might bring down the tailnet connection and thus should not be done remotely over SSH or RDP without an alternate means to log in if the connection is lost.
However, for remote devices that you've [restricted to Tailscale-only traffic](/docs/how-to/secure-ubuntu-server-with-ufw), signing in again without Tailscale access can be difficult or impossible. In these cases, we allow admins of a network to temporarily extend a key's lifetime to help the device owner regain access and reauthenticate.
To regain access to an expired device:
1. Open the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
2. Find the row corresponding to the device you are interested in.
3. Select the menu at the far right and select the **Temporarily extend key** option. This option only appears for devices with expired keys:
4. The key will be extended for 30 minutes. Instruct the owner of the machine to log in and reauthenticate within the extended timeframe, or disable key expiry for this device within that window.
5. Once the machine has been reauthenticated, the key should be renewed for your standard expiry time (6 months by default).
If you're renewing keys for a machine that belongs to you, and it has already signed a new authentication URL, we provide a one-select **Reauthenticate** option in place of **Temporarily extend key**. However, extending the key is the far more common way to regain access.
## [Using key expiry with tagged devices](#using-key-expiry-with-tagged-devices)
When you apply a tag to a device for the first time and authenticate it, the tagged device will have [key expiry](/docs/features/access-control/key-expiry) disabled by default. For more information, refer to [Key expiry for tagged devices](/docs/features/tags#key-expiry).
## [Setting a custom authentication period](#setting-a-custom-authentication-period)
Setting a custom authentication period is available for [all plans](/pricing).
1. Open the [Device management](https://login.tailscale.com/admin/settings/device-management) page of the admin console.
2. In the **Key Expiry** section, select from 1 to 180 days as the custom authentication period.
3. Select **Save**.
A change to the **Key Expiry** value applies to any devices that are logged in after you make the change. The key expiration for any devices that are already logged in remains unchanged, until the next time the device is logged in.
## [Admin console session expiry](#admin-console-session-expiry)
A browser session that is accessing the Tailscale [admin console](https://login.tailscale.com/admin) has an expiry of 30 days. This expiry is unrelated to any key expiry. For more information, refer to the topic [Do admin console sessions expire?](/docs/reference/admin-console-session-expiry)
On this page
* [Disabling key expiry](#disabling-key-expiry)
* [Enabling key expiry](#enabling-key-expiry)
* [Renewing keys for an expired device](#renewing-keys-for-an-expired-device)
* [Using key expiry with tagged devices](#using-key-expiry-with-tagged-devices)
* [Setting a custom authentication period](#setting-a-custom-authentication-period)
* [Admin console session expiry](#admin-console-session-expiry)
Scroll to top