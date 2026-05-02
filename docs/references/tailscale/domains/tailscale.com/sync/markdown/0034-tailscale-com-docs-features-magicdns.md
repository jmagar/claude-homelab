MagicDNS · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# MagicDNS
Last validated: Jan 5, 2026
MagicDNS automatically registers DNS names for devices in your network.
MagicDNS is available for [all plans](/pricing).
If you add a new web server called `my-server` to your network, you no longer need to use its Tailscale IP: using the name `my-server` in your browser's address bar or on the command line will work.
MagicDNS does not require a [DNS nameserver](/docs/reference/dns-in-tailscale#tailscale-dns-settings) if running Tailscale v1.20 or later. Otherwise, your network must have **at least one DNS nameserver set** in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console. These nameservers will receive all DNS queries not handled by MagicDNS.
## [Enabling MagicDNS](#enabling-magicdns)
Tailnets created on or after October 20, 2022 have MagicDNS enabled by default.
If not already enabled, you can enable MagicDNS in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console:
## [Accessing devices over MagicDNS](#accessing-devices-over-magicdns)
Once MagicDNS is enabled, any device signed in to your network can access other devices by using their [machine name](/docs/concepts/machine-names). For example, if you have a server named "monitoring":
* To SSH into it, run `ssh username@monitoring`
* To ping it, run `ping monitoring`
* To open it in your browser, type `monitoring` in your address bar.
Some CLI tools on macOS such as `host` or `nslookup` circumvent system DNS resolution, and will not work with MagicDNS. For example, `host johns-iphone-6s` will not work on macOS, even if `ping johns-iphone-6s` will.
Devices that are [shared with you](/docs/features/sharing) are only accessible via MagicDNS on Tailscale v1.4 or later. You must also use the shared device's [full domain name](#fully-qualified-domain-names-vs-machine-names). For example, `ping webserver.example2.ts.net`.
## [Assigning and editing machine names](#assigning-and-editing-machine-names)
MagicDNS automatically uses a device's [machine name](/docs/concepts/machine-names) as part of the DNS entry. If you change your device's name, the MagicDNS entry will automatically change.
If you have a specific name you'd like to use to reference your device, then [edit the machine name](/docs/concepts/machine-names#renaming-a-machine) of the device.
## [Fully qualified domain names vs. machine names](#fully-qualified-domain-names-vs-machine-names)
Under the hood, MagicDNS generates a **fully qualified domain name** for every device on your Tailscale network (known as a tailnet). The fully qualified domain name is made up of two parts:
1. A [**machine name**](/docs/concepts/machine-names), which you can change.
2. Your [**tailnet DNS name**](/docs/concepts/tailnet-name#tailnet-dns-name). You can find your tailnet DNS name in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
Previously, you might have used a [tailnet name](/docs/concepts/tailnet-name) ending in `.beta.tailscale.net`. If so, migrate to the new tailnet name ending in `.ts.net`. Support for the existing `beta.tailscale.net` name ended on **September 13, 2024**.
The table below shows how some example machine names and domains combine to create the full domain name.
|Machine Name|Tailnet Name|Fully Qualified Domain Name|
|monitoring|yak-bebop.ts.net|`
monitoring.yak-bebop.
ts.net
`|
|johns-iphone-6s|tailab12.ts.net|`
johns-iphone-6s.tailab12.
ts.net
`|
|free-form|example.ts.net|`
free-form.example.
ts.net
`|
Full domain names can be cumbersome to type, so when you enable MagicDNS, Tailscale automatically adds [search domains](/docs/reference/dns-in-tailscale#tailscale-dns-settings) to your network. With these search domains you only need to type the machine name to access a device.
For the *yak-bebop* network, **the following two commands are equivalent**:
```
`ping monitoring
ping monitoring.yak-bebop.ts.net
`
```
In most situations, you'll want to use the machine name. But for security reasons, accessing [devices shared with you](/docs/features/sharing) requires using the full domain name.
You can find the full domain name of any device in your network by opening its page from the [Machines](https://login.tailscale.com/admin/machines) page of the admin console.
## [Disabling MagicDNS](#disabling-magicdns)
MagicDNS can be disabled for your whole network by toggling the same button you used to enable it in the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
If you are experiencing trouble with MagicDNS on a particular device and wish to disable it only there, the current solution is to stop accepting network DNS settings in general.
**On Linux**, stop accepting DNS with:
```
`tailscale set --accept-dns=false
`
```
**On macOS**, stop accepting DNS by selecting the Tailscale menu bar icon. From here, select **Preferences**, and then you can uncheck **Use Tailscale DNS settings** from the menu.
**On Windows**, stop accepting DNS by holding `SHIFT` while right-clicking on the Tailscale system tray icon, and deselecting **Use Tailscale DNS** from the menu.
In the future, we will have robust enough DNS configuration and resolution logic that disabling MagicDNS separately will never be necessary. At this point, the toggle will disappear.
## [Removing the `beta.tailscale.net` nameserver](#removing-the-betatailscalenet-nameserver)
Support for the legacy `\*.beta.tailscale.net` nameserver ended on **September 13, 2024**. If you haven't already, migrate your tailnet to use the [tailnet DNS name](/docs/concepts/tailnet-name#tailnet-dns-name) format nameserver. If you are no longer using the `beta.tailscale.net` nameserver, you can delete it. Once deleted, you cannot recover it.
You need to be an [Owner, Admin, or IT admin](/docs/reference/user-roles) of a tailnet to remove the `beta.tailscale.net` nameserver.
1. Open the [DNS](https://login.tailscale.com/admin/dns) page of the admin console.
2. Under **Nameservers**, look for the nameserver whose name ends in `.beta.tailscale.net`, for example, `yak-bebop.beta.tailscale.net`. (If you don't find a `.beta.tailscale.net` nameserver, there is nothing to delete.)
3. Select the menu and then select **Delete**.
4. Confirm that you want to delete the `beta.tailscale.net` nameserver and then select **Delete**.
On this page
* [Enabling MagicDNS](#enabling-magicdns)
* [Accessing devices over MagicDNS](#accessing-devices-over-magicdns)
* [Assigning and editing machine names](#assigning-and-editing-machine-names)
* [Fully qualified domain names vs. machine names](#fully-qualified-domain-names-vs-machine-names)
* [Disabling MagicDNS](#disabling-magicdns)
* [Removing the beta.tailscale.net nameserver](#removing-the-betatailscalenet-nameserver)
Scroll to top