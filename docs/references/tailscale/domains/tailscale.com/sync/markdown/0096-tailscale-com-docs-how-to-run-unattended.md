Keep Tailscale running when I'm not logged in to my computer · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Keep Tailscale running when I'm not logged in to my computer
Last validated: Jan 5, 2026
## [Linux](#linux)
On Linux, Tailscale runs as the system, and is available even when no users are logged in.
For other platforms Tailscale runs as the logged in user, not as the system. This means that if a device is restarted, or multiple users are logged in at the same time, Tailscale won't automatically connect.
## [Windows](#windows)
On Windows, you can solve this by using "Run Unattended" mode. This configures Tailscale to run as the system instead of the currently logged in user. For example, a machine running Windows Server Edition might want to enable this to permit multiple users to connect using RDP at once.
You may be required to be logged in as a user with elevated permissions for this to work properly.
Set unattended mode on Windows with the client:
* Right-click the Tailscale icon in the Windows system tray.
* Hover over **Preferences**.
* Select the **Run unattended** option.
Or with the command line:
* Open PowerShell or `cmd.exe`.
* Run the following command:
```
`tailscale up --unattended=true
`
```
## [macOS](#macos)
On macOS, there's no ability to run as the system just yet. You can follow [this GitHub issue for updates](https://github.com/tailscale/tailscale/issues/987).
On this page
* [Linux](#linux)
* [Windows](#windows)
* [macOS](#macos)
Scroll to top