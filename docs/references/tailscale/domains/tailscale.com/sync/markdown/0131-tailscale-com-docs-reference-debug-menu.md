Debug menu and options · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Debug menu and options
Last validated: Mar 23, 2026
The macOS and Windows versions of the Tailscale client contain a debug mode of the menu that provides advanced settings for monitoring and troubleshooting.
[macOS](/docs/reference/debug-menu?tab=macos)[Windows](/docs/reference/debug-menu?tab=windows)
To access the debug options on macOS, hold down Option and select the Tailscale icon in the menu bar. Available options include:
* Sent and received traffic information.
* Device key expiry information.
* The **Debug** menu provides the following options:
* **Bug report**: [Generates a bug report ID and a configuration report](/docs/account/bug-report) that you can send to us to help you troubleshoot issues more effectively.
* **Reauthenticate**: Logs the user out of the tailnet, requiring them to re-authenticate from the Tailscale [Login](https://login.tailscale.com/login) page.
* **Reset All Settings**: Sets the client settings back to default while keeping the user logged in.
* **Show Onboarding**: Displays the walk-through onboarding screens that a user typically sees when they first install the client.
* **Flush DNS Cache**: Clears the macOS DNS cache. This requires administrative credentials.
* **Add Account**: Displays a dialog for adding the client to a custom coordination server.
* **System Extension**: Displays the health of the Tailscale system extension. You can also use the [`tailscale configure sysext status`](/docs/reference/tailscale-cli#configure) CLI command.
* **Reset**: Deletes and reinstalls the macOS VPN configuration. Using this option may be helpful if Tailscale refuses to start even after rebooting your Mac. This option won't work if your organization is deploying a VPN configuration profile on your Mac using an MDM solution.
* **Quit (Leave VPN Active)**: Terminates the Tailscale GUI app, but leaves the VPN network extension running in the background. If you use this option, you may then separately toggle the network extension in the macOS System Settings app.
If you use [Group Policy](https://learn.microsoft.com/en-us/windows-server/identity/ad-ds/manage/group-policy/group-policy-overview) or an [MDM solution](/docs/mdm) to manage your fleet of devices, you can [control the visibility of the Debug menu](/docs/features/tailscale-system-policies#hide-the-debug-menu).
Scroll to top