macOS Screen Time and Tailscale · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# macOS Screen Time and Tailscale
Last validated: Jan 5, 2026
This topic addresses an incompatibility issue between the App Store variant of Tailscale for macOS and the Screen Time web filter built into macOS. Users experiencing connectivity issues with Tailscale while using Screen Time content restrictions should be aware of this conflict.
## [Issues with Screen Time and Tailscale](#issues-with-screen-time-and-tailscale)
The App Store version of Tailscale for macOS will not function correctly if the Screen Time web filter is active. This is because Screen Time is monitoring and tampering with web traffic, including traffic necessary for Tailscale's correct operation.
Starting in v1.70, Tailscale detects this behavior, and displays the following notification:
If you are using an older version of Tailscale and have the Screen Time web filter enabled, you will notice that Tailscale won't connect. In particular, the Tailscale icon will display a loading animation forever, and **Loading Backend...** will appear in the menu UI. An error similar to `read tcp [::1]:51178-\>[::1]:10011: read: connection reset by peer` will also appear in the Tailscale logs.
## [Identify the conflict](#identify-the-conflict)
Screen Time uses a process called `webfilterproxyd` to filter web traffic. To determine if `webfilterproxyd` is running and potentially causing issues with Tailscale:
1. Open the **Activity Monitor** app on your Mac, by selecting **Applications**, then **Utilities**.
2. Go to **View** then **All Processes** and ensure processes belonging to the `root` user are displayed.
3. Use the search field to type `webfilterproxyd`. If `webfilterproxyd` appears in the list of running processes, the Screen Time web filter is active and might conflict with Tailscale.
Alternatively, you may type `ps aux | grep "[w]ebfilterproxyd"` in the Terminal app. If an entry appears, it means that the web filter is active.
## [Options if `webfilterproxyd` is running](#options-if-webfilterproxyd-is-running)
You have two options:
* You can attempt to disable the Screen Time web filter, or disable Screen Time entirely.
* You can switch to the [Standalone variant](/docs/concepts/macos-variants) of Tailscale for macOS (distributed outside the App Store), which is not affected by this issue. The Standalone variant requires administrator privileges on your Mac. Make sure to uninstall the Mac App Store variant before installing the Standalone one to avoid conflicts.
## [Disable Screen Time](#disable-screen-time)
To disable Screen Time in the System Settings app follow these steps, then reboot your Mac:
1. Open the **System Settings** app on your Mac.
2. Select **Screen Time** in the sidebar.
3. Select **Restrictions**, then **Content & Privacy**.
4. Select **Store, Web, Siri & Game Center Content**.
5. In the **Safari** section, ensure **Access to Web Content** is set to **Unrestricted Access**.
6. Reboot your Mac to fully apply the new settings.
You must reboot your Mac after disabling Screen Time. We have observed in our testing that macOS does not terminate the `webfilterproxyd` process until the Mac is restarted. This appears to be a bug on macOS.
### [Identify an imposed web filter](#identify-an-imposed-web-filter)
If after following the steps above and rebooting your Mac `webfilterproxyd` is still running, there might be a configuration profile installed on your Mac that is enforcing the enablement of the web filter. This is independent of Screen Time enablement, and is particularly common on Macs managed within an organization by using an MDM solution.
To identify a configuration profile that is forcing the enablement of `webfilterproxyd`, follow these steps:
1. Open the **Terminal** app on your Mac.
2. Type `system\_profiler SPManagedClientDataType` and hit Return.
3. Scroll through the output, and check for entries titled `com.apple.familycontrols.contentfilter` where the `restrictWeb` or `useContentFilter` properties are set to `1` (enabled).
If the output contains an entry for `com.apple.familycontrols.contentfilter`, it means that your administrator has configured the web filter on your Mac. You should ask your administrator to disable it. You will not be able to disable this web filter on your own, and Tailscale support is unable to help you in doing so.
On this page
* [Issues with Screen Time and Tailscale](#issues-with-screen-time-and-tailscale)
* [Identify the conflict](#identify-the-conflict)
* [Options if webfilterproxyd is running](#options-if-webfilterproxyd-is-running)
* [Disable Screen Time](#disable-screen-time)
* [Identify an imposed web filter](#identify-an-imposed-web-filter)
Scroll to top