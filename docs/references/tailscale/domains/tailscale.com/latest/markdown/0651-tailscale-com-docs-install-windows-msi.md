Install Tailscale on Windows with MSI · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Install Tailscale on Windows with MSI
Last validated: Jan 5, 2026
The current version of the Tailscale client available for [download](/download/windows) requires Windows 10 or later or Windows Server 2016 or later.
This topic shows how to install Tailscale with the Windows Installer (MSI) package. If you want to use the Tailscale
`.exe` installer, refer to [Install Tailscale on Windows](/docs/install/windows).
## [To install](#to-install)
1. Download the latest `.msi` file from the [Tailscale Packages](https://pkgs.tailscale.com/stable/#windows) page. You need to choose the version for your
CPU architecture. If your architecture is based on `ARM64`, use the `x86` version.
2. Run the installer. You can double select the download, or you can use the [`msiexec`](https://docs.microsoft.com/en-us/windows-server/administration/windows-commands/msiexec) command:
`msiexec /i \<path\_to\_tailscale\_msi.msi\>`
Optionally, write logging information from `msiexec` to a file. The folder used for the log file must already exist.
`msiexec /L \<path\_to\_log.log\> /i \<path\_to\_tailscale\_msi.msi\>`
3. Note the new Tailscale icon in your system tray once installation is complete. If it is not
visible, select the up arrow to find it in the system tray overflow area.
4. Select the Tailscale icon to expose configuration options and status messages.
5. Under your account, select **Log in** to launch a browser window, and authenticate
using [your SSO identity provider](/docs/integrations/identity).
## [To uninstall](#to-uninstall)
Users can [uninstall Tailscale](/docs/features/client/uninstall) through the Windows control panel.
For system administration or debugging purposes, you can also uninstall with `msiexec`. If you uninstall with
`msiexec`, you must use the same `.msi` file that you used to install the client.
```
`msiexec /x \<path\_to\_tailscale\_msi.msi\>
`
```
You can also use the `/L` option to write logging information from `msiexec` to a file.
```
`msiexec /L \<path\_to\_log.log\> /x \<path\_to\_tailscale\_msi.msi\>
`
```
## [Properties](#properties)
If you use the `msiexec` command-line tool, you can set several MSI properties that control the user's experience with
the Tailscale client. For example, this installation command hides the **Network Devices** menu item in the Tailscale client:
```
`msiexec TS\_NETWORKDEVICES="hide" /i tailscale-setup-1.22.0-amd64.msi
`
```
Tailscale MSI properties, if set, are stored in the `HKEY\_LOCAL\_MACHINE\\SOFTWARE\\Policies\\Tailscale` registry key.
The [registry value type](https://learn.microsoft.com/en-us/windows/win32/sysinfo/registry-value-types) for all Tailscale MSI properties is `REG\_SZ`.
The following properties can be used with MSI.
### [INSTALLDIR](#installdir)
Specifies the path of the installation directory on disk. The installation path
defaults to `C:\\Program Files\\Tailscale`.
### [TS\_ADMINCONSOLE](#ts_adminconsole)
Controls visibility of the **Admin Console** menu
* Registry name: `AdminConsole`
* Possible values: "show", "hide"
### [TS\_ADVERTISEEXITNODE](#ts_advertiseexitnode)
Controls how the [Run As Exit Nodes](/docs/features/exit-nodes) option is configured
* Registry name: `AdvertiseExitNode`
* Possible values: "always", "never", "user-decides"
### [TS\_ALLOWINCOMINGCONNECTIONS](#ts_allowincomingconnections)
Controls the **Preferences** \> **Allow Incoming Connections** menu item
* Registry name: `AllowIncomingConnections`
* Possible values: "always", "never", "user-decides"
### [TS\_CHECKUPDATES](#ts_checkupdates)
This policy does not currently change Windows behavior. It corresponds to `tailscale set --update-check` but the Windows client does not currently look at this because it always checks for updates.
* Registry name: `CheckUpdates`
* Possible values: "always", "never", "user-decides"
### [TS\_ENABLEDNS](#ts_enabledns)
Controls whether to apply its DNS configuration when the tunnel is connected
* Registry name: `UseTailscaleDNSSettings`
* Possible values: "always", "never", "user-decides"
### [TS\_ENABLESUBNETS](#ts_enablesubnets)
Controls whether to accept subnets advertised by other nodes in your tailnet
* Registry name: `UseTailscaleSubnets`
* Possible values: "always", "never", "user-decides"
### [TS\_EXITNODEMENU](#ts_exitnodemenu)
Controls the visibility of the **Exit Nodes** menu
* Registry name: `ExitNodesPicker`
* Possible values: "show", "hide"
### [TS\_FLUSHDNSONSESSIONUNLOCK](#ts_flushdnsonsessionunlock)
Enables additional DNS cache flushing for debugging purposes. This should only be enabled if recommended by Tailscale Support.
* Registry name: `FlushDNSOnSessionUnlock`
* Possible values: "1", "0"
### [TS\_INSTALLUPDATES](#ts_installupdates)
Controls how **Automatically Install Updates** is configured
* Registry name: `InstallUpdates`
* Possible values: "always", "never", "user-decides"
### [TS\_KEYEXPIRATIONNOTICE](#ts_keyexpirationnotice)
Enables a warning message that will be displayed up to time prior to the login's
actual expiry. The default is 24 hours.
* Registry name: `KeyExpirationNotice`
* Possible values: String value that can be parsed by Go's [`time.ParseDuration` function](https://pkg.go.dev/time#ParseDuration). For example, "12h".
### [TS\_LOGINURL](#ts_loginurl)
Controls the required use of a particular Tailscale coordination server. For more information, refer to [Set a custom control server URL](/docs/features/tailscale-system-policies#set-a-custom-control-server-url).
* Registry name: `LoginURL`
* Possible values: URL for the coordination server
### [TS\_NETWORKDEVICES](#ts_networkdevices)
Controls the visibility of the **Network Devices** menu
* Registry name: `NetworkDevices`
* Possible values: "show", "hide"
### [TS\_NOLAUNCH](#ts_nolaunch)
Controls whether the Tailscale client is launched as part of the installation. This property is applicable only during silent installation.
* Registry name: Not applicable—no value is saved to the registry.
* Possible values: Any string. Set this to a non-empty string to prevent the Tailscale GUI client from launching as part of installation.
### [TS\_ONBOARDING\_FLOW](#ts_onboarding_flow)
Controls visibility of the onboarding flow
* Registry name: `OnboardingFlow`
* Possible values: "show", "hide"
### [TS\_PREFERENCESMENU](#ts_preferencesmenu)
Controls the visibility of the **Preferences** menu
* Registry name: `PreferencesMenu`
* Possible values: "show", "hide"
### [TS\_TESTMENU](#ts_testmenu)
Controls whether it is possible for users to bring up the debug menu by holding either `CTRL` or `SHIFT` when opening the Tailscale menu.
* Registry name: `TestMenu`
* Possible values: "show", "hide"
### [TS\_UNATTENDEDMODE](#ts_unattendedmode)
Controls the **Preferences** \> **Run Unattended** menu item
* Registry name: `UnattendedMode`
* Possible values: "always", "never", "user-decides"
### [TS\_UPDATEMENU](#ts_updatemenu)
Controls the visibility of the **Update Tailscale** menu item.
* Registry name: `UpdateMenu`
* Possible values: "show", "hide"
On this page
* [To install](#to-install)
* [To uninstall](#to-uninstall)
* [Properties](#properties)
* [INSTALLDIR](#installdir)
* [TS\_ADMINCONSOLE](#ts_adminconsole)
* [TS\_ADVERTISEEXITNODE](#ts_advertiseexitnode)
* [TS\_ALLOWINCOMINGCONNECTIONS](#ts_allowincomingconnections)
* [TS\_CHECKUPDATES](#ts_checkupdates)
* [TS\_ENABLEDNS](#ts_enabledns)
* [TS\_ENABLESUBNETS](#ts_enablesubnets)
* [TS\_EXITNODEMENU](#ts_exitnodemenu)
* [TS\_FLUSHDNSONSESSIONUNLOCK](#ts_flushdnsonsessionunlock)
* [TS\_INSTALLUPDATES](#ts_installupdates)
* [TS\_KEYEXPIRATIONNOTICE](#ts_keyexpirationnotice)
* [TS\_LOGINURL](#ts_loginurl)
* [TS\_NETWORKDEVICES](#ts_networkdevices)
* [TS\_NOLAUNCH](#ts_nolaunch)
* [TS\_ONBOARDING\_FLOW](#ts_onboarding_flow)
* [TS\_PREFERENCESMENU](#ts_preferencesmenu)
* [TS\_TESTMENU](#ts_testmenu)
* [TS\_UNATTENDEDMODE](#ts_unattendedmode)
* [TS\_UPDATEMENU](#ts_updatemenu)
Scroll to top