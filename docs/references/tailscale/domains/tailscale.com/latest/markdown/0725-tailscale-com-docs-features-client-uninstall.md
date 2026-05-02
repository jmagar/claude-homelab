Uninstall Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Uninstall Tailscale
Last validated: Aug 20, 2025
Here's how to uninstall Tailscale from your device, or completely reset
Tailscale for debugging purposes.
[Windows](/docs/features/client/uninstall?tab=windows)[macOS (App Store)](/docs/features/client/uninstall?tab=macos+(app+store))[macOS (Standalone)](/docs/features/client/uninstall?tab=macos+(standalone))[iOS](/docs/features/client/uninstall?tab=ios)[tvOS](/docs/features/client/uninstall?tab=tvos)[Android](/docs/features/client/uninstall?tab=android)[Linux](/docs/features/client/uninstall?tab=linux)[Synology](/docs/features/client/uninstall?tab=synology)
Tailscale for Windows can be uninstalled like any Windows app, by using the
Windows Control Panel. Go to **Settings** \> **Apps**, find **Tailscale**, and press the
**Uninstall** button.
If you'd like to *completely* delete Tailscale, destroying any state or local
information, you can also remove the files at the following paths:
```
`C:\\ProgramData\\Tailscale
C:\\Users\\%USERNAME%\\AppData\\Local\\Tailscale
C:\\Windows\\System32\\config\\systemprofile\\AppData\\Local\\Tailscale
`
```
The path under `System32` was only used in older versions of the Tailscale
client and may not be present on your system.
After uninstalling Tailscale, if you install Tailscale on a device again at a later time, it will have a [new IP address](/docs/concepts/ip-and-dns-addresses).
Scroll to top