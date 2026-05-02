Deploy Tailscale on macOS using MDM · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy Tailscale on macOS using MDM
Last validated: Jan 5, 2026
This page contains technical information which you might find useful if you are a system administrator deploying Tailscale for macOS in a corporate environment using MDM solutions such as [Microsoft Intune](/docs/integrations/mdm/microsoft-intune), [Jamf Pro](/docs/integrations/mdm/jamf), [JumpCloud](/docs/integrations/mdm/jumpcloud), [Iru](/docs/integrations/mdm/kandji) (formerly Kandji), or [SimpleMDM](/docs/integrations/mdm/simplemdm).
We are always working on providing more options for system administrators to programmatically manage their Tailscale deployments. If you are deploying Tailscale and feel the need for a specific configuration option that is currently missing on this page, contact our support team.
The examples listed on this page use the bundle identifier for the Mac App Store variant of Tailscale, `io.tailscale.ipn.macos`. If you are configuring the Standalone variant of the app, replace it with the `io.tailscale.ipn.macsys` bundle identifier.
If you're looking to configure system policies on the Tailscale clients for iOS and tvOS, refer to the [dedicated topic](/docs/integrations/mdm/ios).
## [Configuration profiles](#configuration-profiles)
If you are deploying Tailscale for macOS using MDM, you can use configuration profiles to automate parts of the setup process, reducing prompt fatigue for the user. You can also use configuration profiles to enforce specific system policies or set up automatic updates.
### [Deploying system policies in a configuration profile](#deploying-system-policies-in-a-configuration-profile)
Configuration profiles can be used to specify user defaults for Tailscale. The Tailscale client will read its user defaults every time it launches, and apply any system policies it finds in the user defaults. Deploying a configuration profile containing user defaults by using your MDM solution can let you configure specific settings of the Tailscale client on behalf of the user, providing an easier setup process.
Refer to our [full list of system policies](/docs/features/tailscale-system-policies) to discover all settings you can configure.
This is an example of a configuration profile to set the [**ManagedByOrganizationName**](/docs/features/tailscale-system-policies#set-your-organization-name) and [**IPAddressCopiedAlertSuppressed**](/docs/features/tailscale-system-policies#suppress-ip-address-copied-notifications) system policy values:
```
`\<?xml version="1.0" encoding="UTF-8"?\>
\<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
\<plist version="1.0"\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>Tailscale: System Policy Configuration Profile\</string\>
\<key\>PayloadType\</key\>
\<string\>Configuration\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>io.tailscale.ipn.macos.mdm.797d4461-837c-4f5a-b18e-7e300b057018\</string\>
\<key\>PayloadUUID\</key\>
\<string\>0f451881-7ac4-4171-80ed-b55251053231\</string\>
\<key\>PayloadContent\</key\>
\<array\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>System Policies\</string\>
\<key\>PayloadType\</key\>
\<string\>io.tailscale.ipn.macos\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>io.tailscale.ipn.macos.f4806335-6703-4680-8f41-f40e6f281c71\</string\>
\<key\>PayloadUUID\</key\>
\<string\>3e44f9b0-d309-48d3-b055-6dc683d438c8\</string\>
\<key\>ManagedByOrganizationName\</key\>
\<string\>Tailscale, Inc.\</string\>
\<key\>IPAddressCopiedAlertSuppressed\</key\>
\<true/\>
\</dict\>
\</array\>
\</dict\>
\</plist\>
`
```
The above configuration profile is equivalent to the following two instances of the `defaults` CLI tool.
For the [Mac App Store] variant use the bundle identifier.
```
`defaults write io.tailscale.ipn.macos ManagedByOrganizationName "Tailscale, Inc."
defaults write io.tailscale.ipn.macos IPAddressCopiedAlertSuppressed -bool true
`
```
For the [Standalone] variant specify the explicit Property List (`.plist`) path.
```
`defaults write \~/Library/Preferences/io.tailscale.ipn.macsys.plist ManagedByOrganizationName "Tailscale, Inc."
defaults write \~/Library/Preferences/io.tailscale.ipn.macsys.plist IPAddressCopiedAlertSuppressed -bool true
`
```
Using this technique of writing directly to the application preferences can be used to test the effects of various MDM configurations without the need to set up a full MDM environment. Some settings will not be applied until the client and network extension are restarted.
Installing the configuration profile above, or running the commands will display **Managed by Tailscale, Inc.** in the app menu and suppress the notification banner when an IP address is copied to the Clipboard.
Refer to the [list of system policies](/docs/features/tailscale-system-policies) for other values you can configure on behalf of the user.
#### [Using the Tailscale profile manifest](#using-the-tailscale-profile-manifest)
Tailscale maintains configuration profile manifests for both the [Mac App Store](https://github.com/ProfileCreator/ProfileManifests/blob/master/Manifests/ManagedPreferencesApplications/io.tailscale.ipn.macos.plist) and [Standalone](https://github.com/ProfileCreator/ProfileManifests/blob/master/Manifests/ManagedPreferencesApplications/io.tailscale.ipn.macsys.plist) variants of the client.
Profile manifests contain a machine-readable description of all available system policies and their possible values. Apps such as [iMazing Profile Editor](https://imazing.com/profile-editor) or [ProfileCreator](https://github.com/ProfileCreator/ProfileCreator) automatically fetch these manifests, and can provide you with a user-friendly GUI to create a configuration profile.
To get started, download either iMazing Profile Editor or ProfileCreator. Both Tailscale variants will appear in the sidebar among the applications you can configure, as shown in the screenshot below.
### [Allow push notifications automatically](#allow-push-notifications-automatically)
Tailscale for macOS may sometimes use system notifications to inform the user. For instance, you will receive a notification when:
* the device key is about to expire
* a file was received using Taildrop
* an IP address was copied to the clipboard
This is an example of a configuration profile payload to automatically allow notifications for Tailscale.
Make sure you replace the bundle identifier `io.tailscale.ipn.macos` with `io.tailscale.ipn.macsys` if you are creating a configuration profile for the Standalone variant of Tailscale for macOS.
```
`\<dict\>
\<key\>NotificationSettings\</key\>
\<array\>
\<dict\>
\<key\>AlertType\</key\>
\<integer\>1\</integer\>
\<key\>BadgesEnabled\</key\>
\<true/\>
\<key\>BundleIdentifier\</key\>
\<string\>io.tailscale.ipn.macos\</string\>
\<key\>CriticalAlertEnabled\</key\>
\<true/\>
\<key\>NotificationsEnabled\</key\>
\<true/\>
\<key\>ShowInNotificationCenter\</key\>
\<true/\>
\</dict\>
\</array\>
\<key\>PayloadDisplayName\</key\>
\<string\>Allow Tailscale Notifications\</string\>
\<key\>PayloadIdentifier\</key\>
\<string\>b3dc3535-1b06-4f2d-a684-4518a6589dff\</string\>
\<key\>PayloadOrganization\</key\>
\<string\>Tailscale Inc.\</string\>
\<key\>PayloadType\</key\>
\<string\>com.apple.notificationsettings\</string\>
\<key\>PayloadUUID\</key\>
\<string\>056ec734-91b7-45a3-8787-98ebf2e84024\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\</dict\>
`
```
### [Install the Tailscale VPN configuration](#install-the-tailscale-vpn-configuration)
On the first time it launches on a Mac, the Tailscale app will install a NetworkExtension VPN configuration. You can choose to skip this step by providing a configuration profile which will configure the VPN configuration *before* the app launches. During the first launch, the Tailscale app will detect the pre-existing configuration and skip the installation step.
The following is a valid `.mobileconfig` Property List (`.plist`) file to set up such a VPN configuration.
Make sure you replace `io.tailscale.ipn.macos` with `io.tailscale.ipn.macsys`, and `io.tailscale.ipn.macos.network-extension` with `io.tailscale.ipn.macsys.network-extension` if you are creating a configuration profile for the Standalone variant of Tailscale for macOS.
```
`\<?xml version="1.0" encoding="UTF-8"?\>
\<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
\<plist version="1.0"\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>Tailscale VPN Configuration Profile\</string\>
\<key\>PayloadType\</key\>
\<string\>Configuration\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>com.your-company-name.tailscale.797d4461-837c-4f5a-b18e-7e300a057018\</string\>
\<key\>PayloadUUID\</key\>
\<string\>0f451881-7ac4-4171-80fd-b55251053231\</string\>
\<key\>PayloadContent\</key\>
\<array\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>Tailscale VPN Configuration\</string\>
\<key\>PayloadType\</key\>
\<string\>com.apple.vpn.managed\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>com.your-company-name.tailscale-tunnel\</string\>
\<key\>PayloadUUID\</key\>
\<string\>7ec957e2-b165-4d1f-9946-3a7a16ae0f9b\</string\>
\<key\>UserDefinedName\</key\>
\<string\>Tailscale MobileConfig\</string\>
\<key\>VPNType\</key\>
\<string\>VPN\</string\>
\<key\>VPNSubType\</key\>
\<string\>io.tailscale.ipn.macos\</string\>
\<key\>VPN\</key\>
\<dict\>
\<key\>RemoteAddress\</key\>
\<string\>Tailscale Mesh\</string\>
\<key\>AuthenticationMethod\</key\>
\<string\>Password\</string\>
\<key\>ProviderBundleIdentifier\</key\>
\<string\>io.tailscale.ipn.macos.network-extension\</string\>
\</dict\>
\</dict\>
\</array\>
\</dict\>
\</plist\>
`
```
### [Approve the Tailscale system extension automatically](#approve-the-tailscale-system-extension-automatically)
This section exclusively applies to the Standalone variant of Tailscale for macOS. The variant of Tailscale distributed in the Mac App Store does not use a system extension, and only requires installing a VPN configuration.
The section above explained how you can create a configuration profile to pre-install the Tailscale VPN configuration. However, when starting the Standalone variant of Tailscale for the first time, the app will also attempt to install a system extension. By default, macOS blocks this, and requires the user to manually approve Tailscale in the System Settings app:
You can allow the system extension by default by adding a system extension policy to the configuration profile. The first thing to do is to set the scope of your configuration profile payload to `System`, as system extensions affect all users on a Mac. Add the following at the top level of your configuration file:
```
`\<key\>PayloadScope\</key\>
\<string\>System\</string\>
`
```
Then, add the system extension policy inside the `PayloadContent` array of the configuration file:
```
`\<dict\>
\<key\>PayloadUUID\</key\>
\<string\>1d08bf7d-7898-43b3-88e3-76cfb74a7c33\</string\>
\<key\>PayloadType\</key\>
\<string\>com.apple.system-extension-policy\</string\>
\<key\>PayloadOrganization\</key\>
\<string\>Tailscale\</string\>
\<key\>PayloadIdentifier\</key\>
\<string\>8a790b57-16da-4371-8baf-d6f65e7b50ee\</string\>
\<key\>PayloadDisplayName\</key\>
\<string\>Allows system extensions signed by Tailscale to run without user approval.\</string\>
\<key\>PayloadDescription\</key\>
\<string/\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadEnabled\</key\>
\<true/\>
\<key\>AllowedTeamIdentifiers\</key\>
\<array\>
\<string\>W5364U7YZB\</string\>
\</array\>
\</dict\>
`
```
Note that macOS enforces that a payload with system scope can only by deployed by a MDM server. This means that users won't be able to install the configuration profile you just created by themselves: your organization will need to push it using the MDM server.
### [Deploy a VPN On Demand Configuration using MDM](#deploy-a-vpn-on-demand-configuration-using-mdm)
This is an advanced deployment option. Misconfigured VPN On Demand settings may prevent your users from connecting to their tailnet. Exercise caution when deploying VPN On Demand rules, especially if you're using any rule to disconnect the VPN on certain networks.
If you are deploying your own VPN configuration (by following the steps in Install the Tailscale VPN configuration), Apple configuration profiles give you the ability to deploy a predefined VPN On Demand configuration to your users. This will automatically connect or disconnect Tailscale, depending
on the rules you configure. Refer to [VPN On Demand](/docs/features/client/ios-vpn-on-demand) for more information about this feature.
VPN On Demand through configuration profiles for Tailscale is configured in two separate steps. First, you need to deploy two system policy keys. Then, use the `OnDemandRules` key in the VPN payload of your VPN configuration profile to define the rules. Rules can be used to do things like:
* Detect when the iOS/macOS device is connected to your enterprise Wi-Fi network, so connecting to Tailscale is not required.
* Detect when an unfamiliar Wi-Fi network is being used, so the Tailscale tunnel should be established.
#### [Configure the required system policy keys](#configure-the-required-system-policy-keys)
Before adding the `OnDemandRules` object to your VPN configuration profile, deploy the following two system policies as part of the configuration profile you use to configure Tailscale:
1. `VPNOnDemandIsUserConfigured`=`true`
2. `VPNOnDemandSettings`=`hide`
The combination of these policies instructs Tailscale to not modify the on demand configuration to ensure automatic restarts of the client, and hides the VPN On Demand configuration UI from the user.
As an example, deploy this configuration profile:
```
`\<?xml version="1.0" encoding="UTF-8"?\>
\<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
\<plist version="1.0"\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>Tailscale: System Policy Configuration Profile\</string\>
\<key\>PayloadType\</key\>
\<string\>Configuration\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>io.tailscale.ipn.macos.mdm.797d4461-837c-4f5a-b18e-7e300b057018\</string\>
\<key\>PayloadUUID\</key\>
\<string\>0f451881-7ac4-4171-80ed-b55251053231\</string\>
\<key\>PayloadContent\</key\>
\<array\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>System Policies\</string\>
\<key\>PayloadType\</key\>
\<string\>io.tailscale.ipn.macos\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>io.tailscale.ipn.macos.f4806335-6703-4680-8f41-f40e6f281c71\</string\>
\<key\>PayloadUUID\</key\>
\<string\>3e44f9b0-d309-48d3-b055-6dc683d438c8\</string\>
\<key\>ManagedByOrganizationName\</key\>
\<string\>Tail and Scales, Inc.\</string\>
\<key\>VPNOnDemandIsUserConfigured\</key\>
\<true/\>
\<key\>VPNOnDemandSettings\</key\>
\<string\>hide\</string\>
\</dict\>
\</array\>
\</dict\>
\</plist\>
`
```
#### [Configure the OnDemandRules dictionary](#configure-the-ondemandrules-dictionary)
Once the above two system policies have been deployed, you can configure the `OnDemandRules` dictionary on the VPN configuration. Refer to the [Apple Configuration Profile Reference](https://developer.apple.com/business/documentation/Configuration-Profile-Reference.pdf) for the appropriate rules you can configure.
As an example of a common configuration, this profile will automatically connect Tailscale on any Wi-Fi or Cellular network, but disconnect on any Wi-Fi network matching the `TailAndScales` SSID:
```
`\<?xml version="1.0" encoding="UTF-8"?\>
\<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
\<plist version="1.0"\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>Tailscale VPN Configuration Profile\</string\>
\<key\>PayloadType\</key\>
\<string\>Configuration\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>com.your-company-name.tailscale.797d4461-837c-4f5a-b18e-7e300a057018\</string\>
\<key\>PayloadUUID\</key\>
\<string\>0f451881-7ac4-4171-80fd-b55251053231\</string\>
\<key\>PayloadContent\</key\>
\<array\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>Tailscale VPN Configuration\</string\>
\<key\>PayloadType\</key\>
\<string\>com.apple.vpn.managed\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>com.your-company-name.tailscale-tunnel\</string\>
\<key\>PayloadUUID\</key\>
\<string\>7ec957e2-b165-4d1f-9946-3a7a16ae0f9b\</string\>
\<key\>UserDefinedName\</key\>
\<string\>Tailscale MobileConfig\</string\>
\<key\>VPNType\</key\>
\<string\>VPN\</string\>
\<key\>VPNSubType\</key\>
\<string\>io.tailscale.ipn.macos\</string\>
\<key\>VPN\</key\>
\<dict\>
\<key\>RemoteAddress\</key\>
\<string\>Tailscale Mesh\</string\>
\<key\>AuthenticationMethod\</key\>
\<string\>Password\</string\>
\<key\>ProviderBundleIdentifier\</key\>
\<string\>io.tailscale.ipn.macos.network-extension\</string\>
\<!-- Instruct the system to enable VPN On Demand --\>
\<key\>OnDemandEnabled\</key\>
\<integer\>1\</integer\>
\<!-- The actual on-demand configuration rules: --\>
\<key\>OnDemandRules\</key\>
\<array\>
\<!-- Disconnect on the 'TailAndScales' Wi-Fi network... --\>
\<dict\>
\<key\>InterfaceTypeMatch\</key\>
\<string\>WiFi\</string\>
\<key\>SSIDMatch\</key\>
\<string\>TailAndScales\</string\>
\<key\>Action\</key\>
\<string\>Disconnect\</string\>
\</dict\>
\<!-- ... but connect on any other Wi-Fi... --\>
\<dict\>
\<key\>InterfaceTypeMatch\</key\>
\<string\>WiFi\</string\>
\<key\>Action\</key\>
\<string\>Connect\</string\>
\</dict\>
\<!-- ... or any Cellular network. --\>
\<dict\>
\<key\>InterfaceTypeMatch\</key\>
\<string\>Cellular\</string\>
\<key\>Action\</key\>
\<string\>Connect\</string\>
\</dict\>
\</array\>
\</dict\>
\</dict\>
\</array\>
\</dict\>
\</plist\>
`
```
#### [MDM install ordering recommendations](#mdm-install-ordering-recommendations)
If you are experiencing issues when deploying both the Tailscale `.pkg` installer and a set of configuration profiles at the same time, make sure your MDM solution is configured according to these rules:
* The MDM solution should reboot the Mac after successfully running the `.pkg` installer and deploying the configuration profiles. Rebooting your Mac ensures all caches are updated, preventing errors during the first launch.
* If you are unable to reboot the Mac as part of the deployment process, the MDM solution should run the `.pkg` installer and clear the LaunchServices cache before deploying the VPN configuration profile. Refer to the following section.
##### [Workarounds for macOS NetworkExtension framework bugs](#workarounds-for-macos-networkextension-framework-bugs)
Long-standing bugs on macOS may cause issues when a VPN app is deployed simultaneously with a VPN configuration profile. These problems arise if the VPN configuration profile is applied before the app is fully installed and registered in the LaunchServices database, which tracks installed applications and extensions on macOS.
Specifically, if the VPN configuration profile is deployed before the application is fully installed, macOS may fail to start the VPN network extension when the Tailscale GUI asks the system to do so, or [VPN On Demand](/docs/features/client/ios-vpn-on-demand) rules are triggered. The `nesessionmanager` process may print one of the following errors to the system log:
* `The VPN app used by the VPN configuration is not installed`
* `status changed to disconnected, last stop reason Plugin was disabled`
A reboot of the Mac will generally solve any issues, so we recommend that you reboot the Mac after deploying Tailscale.
If you're unable to reboot your managed Macs (for instance, because you want to provide a button to install Tailscale by using the **Jamf Self-Service** app) and you observe the symptoms above, configure your MDM solution to do the following upon triggering the installer:
1. Deploy the `.pkg` installer and ensure the installer has finished running.
2. After running the installer, run a shell script on the Mac that will clear the LaunchServices caches (with some delays to ensure no timing issues will occur):
```
`#!/bin/bash
echo "Tailscale was installed, sleeping for 10 seconds before clearing the LaunchServices cache" | logger
sleep 10
echo "Clearing the LaunchServices cache" | logger
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister \\
-kill -r -domain local -domain system -domain user
echo "LaunchServices cache cleared successfully, sleeping another 10 seconds" | logger
sleep 10
`
```
Configure your MDM to deploy the VPN configuration profile only after executing the shell script. macOS should then allow the network extension to start correctly.
On this page
* [Configuration profiles](#configuration-profiles)
* [Deploying system policies in a configuration profile](#deploying-system-policies-in-a-configuration-profile)
* [Using the Tailscale profile manifest](#using-the-tailscale-profile-manifest)
* [Allow push notifications automatically](#allow-push-notifications-automatically)
* [Install the Tailscale VPN configuration](#install-the-tailscale-vpn-configuration)
* [Approve the Tailscale system extension automatically](#approve-the-tailscale-system-extension-automatically)
* [Deploy a VPN On Demand Configuration using MDM](#deploy-a-vpn-on-demand-configuration-using-mdm)
* [Configure the required system policy keys](#configure-the-required-system-policy-keys)
* [Configure the OnDemandRules dictionary](#configure-the-ondemandrules-dictionary)
* [MDM install ordering recommendations](#mdm-install-ordering-recommendations)
* [Workarounds for macOS NetworkExtension framework bugs](#workarounds-for-macos-networkextension-framework-bugs)
Scroll to top