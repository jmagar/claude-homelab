Authorizing the Tailscale system extension on macOS · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Authorizing the Tailscale system extension on macOS
Last validated: Jan 5, 2026
When launching Tailscale for the first time on your Mac, you may be presented with one or more of the following warnings.
*
*
* The above messages indicate that Tailscale launched successfully. However, granting permission to install the Tailscale system extension is necessary before Tailscale can connect your Mac to the network.
System extensions are a macOS technology used by Tailscale to extend the networking features of your Mac. For further information on system extensions, refer to [below](#what-is-a-system-extension).
## [Configuration steps](#configuration-steps)
The steps for granting permission to install the Tailscale extension will vary depending on the version of macOS you are using.
### [macOS Sequoia 15 and later](#macos-sequoia-15-and-later)
1. Go to **System Settings** and open the **General** tab.
2. In the **Login Items & Extensions** section, scroll down to **Network Extensions**, and select the information ⓘ icon.
3. Toggle **Tailscale Network Extension** to on, then authorize the operation using Touch ID, or by providing an administrator password.
4. Select **Done**. If a window appears asking to install a VPN configuration, choose **Allow**.
Tailscale will begin connecting. If you have never logged into Tailscale before, you'll have to log in by using the Tailscale menu bar item at the top right of your screen.
### [macOS Sonoma 14 and earlier](#macos-sonoma-14-and-earlier)
1. Go to **System Settings** and open the **Privacy & Security** tab.
2. Scroll down the list of options until you reveal the message **System software from application "Tailscale.app" was blocked from loading.**, and select **Allow**.
3. Authorize the operation using Touch ID, or by providing an administrator password. If a window appears asking to install a VPN configuration, choose **Allow**.
Tailscale will begin connecting. If you have never logged into Tailscale before, you'll have to log in by using the Tailscale menu bar item at the top right of your screen.
## [Manage using the CLI](#manage-using-the-cli)
You can manage system extensions for a device using the CLI command [`tailscale configure sysext`](/docs/reference/tailscale-cli#configure).
## [What is a system extension?](#what-is-a-system-extension)
You might wonder why this is necessary. Behind the scenes, the Standalone variant of Tailscale for macOS uses a technology introduced in macOS Catalina 10.15 called [System Extensions](https://support.apple.com/HT210999).
System extensions represent a safer replacement for the legacy Kernel Extensions technology used by many security and networking tools in previous versions of macOS. They run within a sandbox, meaning that Tailscale runs isolated from the operating system kernel in your Mac. This can provide additional security guarantees. Additionally, system extensions can be distributed outside the Mac App Store. This lets us provide a variant of Tailscale which doesn't depend on Apple for distribution.
Because system extensions are shared with other users of your Mac, explicit consent is required before they can be installed.
## [Automate this process for your users](#automate-this-process-for-your-users)
If you are a system administrator managing a fleet of Macs, you can use a mobile device management (MDM) solution to automatically pre-approve the Tailscale system extension. Refer to the [MDM documentation](/docs/integrations/mdm/mac#approve-the-tailscale-system-extension-automatically) for further details.
On this page
* [Configuration steps](#configuration-steps)
* [macOS Sequoia 15 and later](#macos-sequoia-15-and-later)
* [macOS Sonoma 14 and earlier](#macos-sonoma-14-and-earlier)
* [Manage using the CLI](#manage-using-the-cli)
* [What is a system extension?](#what-is-a-system-extension)
* [Automate this process for your users](#automate-this-process-for-your-users)
Scroll to top