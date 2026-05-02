Deploy Tailscale on iOS/tvOS using MDM · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Deploy Tailscale on iOS/tvOS using MDM
Last validated: Jan 5, 2026
This page contains technical information which you might find useful if you are a system administrator deploying Tailscale for iPhone, iPad, Vision Pro, or Apple TV in a corporate environment using MDM solutions such as [Microsoft Intune](/docs/integrations/mdm/microsoft-intune), [Jamf Pro](/docs/integrations/mdm/jamf), [Iru](/docs/integrations/mdm/kandji) (formerly Kandji), or [SimpleMDM](/docs/integrations/mdm/simplemdm).
We are always working on providing more options for system administrators to programmatically manage their Tailscale deployments. If you are deploying Tailscale on the devices listed above and feel the need for a specific configuration option that is currently missing on this page, contact our support team.
If you're looking to configure system policies in the Tailscale client for macOS, refer to the [dedicated topic](/docs/integrations/mdm/mac).
## [Configuration profiles](#configuration-profiles)
If you are deploying Tailscale for iOS/tvOS using MDM, you can use configuration profiles to automate parts of the onboarding process for the app, reducing prompt fatigue for the user.
### [Allow push notifications automatically](#allow-push-notifications-automatically)
The Tailscale app for tvOS does not use notifications as third-party apps are not allowed to deliver notifications on Apple TV.
Unlike the other configuration profiles on this page, notification settings can only be deployed to supervised iOS devices.
Tailscale for iOS may sometimes use system notifications to inform the user. For instance, you will receive a notification when:
* the device key is about to expire
* a file was received using Taildrop
This is an example of a configuration profile payload to automatically allow notifications for Tailscale on iOS.
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
\<string\>io.tailscale.ipn.ios\</string\>
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
\<string\>b3dc3535-1b06-4f2d-a684-4518a6589dfe\</string\>
\<key\>PayloadOrganization\</key\>
\<string\>Tailscale Inc.\</string\>
\<key\>PayloadType\</key\>
\<string\>com.apple.notificationsettings\</string\>
\<key\>PayloadUUID\</key\>
\<string\>056ec734-91b7-45a3-8787-98ebf2e84025\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\</dict\>
`
```
### [Install the Tailscale VPN configuration](#install-the-tailscale-vpn-configuration)
On the first time it launches on an iOS/tvOS device, the Tailscale app will install a NetworkExtension VPN configuration. You can choose to skip this step by providing a configuration profile which will configure the VPN configuration *before* the app launches. During the first launch, the Tailscale app will detect the pre-existing configuration and skip the installation step.
The following is a valid `.mobileconfig` property list file to set up such a VPN configuration.
When creating a configuration profile for Tailscale for tvOS, replace the value `io.tailscale.ipn.ios.network-extension` with `io.tailscale.ipn.ios.network-extension-tvos` in the `ProviderBundleIdentifier` field. Leave the `VPNSubType` field untouched (our tvOS app uses the same bundle identifier as the iOS app).
```
`\<?xml version="1.0" encoding="UTF-8"?\>
\<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
\<plist version="1.0"\>
\<dict\>
\<key\>PayloadDisplayName\</key\>
\<string\>Tailscale iOS VPN Configuration Profile\</string\>
\<key\>PayloadType\</key\>
\<string\>Configuration\</string\>
\<key\>PayloadVersion\</key\>
\<integer\>1\</integer\>
\<key\>PayloadIdentifier\</key\>
\<string\>com.your-company-name.tailscale.797d4461-837c-4f5a-b18e-7e300a057020\</string\>
\<key\>PayloadUUID\</key\>
\<string\>0f451881-7ac4-4171-80fd-b55251053233\</string\>
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
\<string\>7ec957e2-b165-4d1f-9946-3a7a16ae0f9c\</string\>
\<key\>UserDefinedName\</key\>
\<string\>Tailscale MobileConfig\</string\>
\<key\>VPNType\</key\>
\<string\>VPN\</string\>
\<key\>VPNSubType\</key\>
\<string\>io.tailscale.ipn.ios\</string\>
\<key\>VPN\</key\>
\<dict\>
\<key\>RemoteAddress\</key\>
\<string\>Tailscale Mesh\</string\>
\<key\>AuthenticationMethod\</key\>
\<string\>Password\</string\>
\<key\>ProviderBundleIdentifier\</key\>
\<string\>io.tailscale.ipn.ios.network-extension\</string\>
\</dict\>
\</dict\>
\</array\>
\</dict\>
\</plist\>
`
```
### [Deploying system policies using AppConfig](#deploying-system-policies-using-appconfig)
System policies can only be deployed to the Tailscale apps for iOS and tvOS if the Tailscale app was installed/managed using an MDM solution. This is a limitation imposed by iOS/tvOS. You cannot deploy policies on these platforms by manually installing a `.mobileconfig` configuration profile file.
If you're deploying the iOS/tvOS app using an MDM solution, AppConfig can be used to specify system policies for Tailscale. The Tailscale client will read these policies every time it launches, and apply them. Deploying AppConfig by using your MDM solution can let you configure specific settings of the Tailscale client on behalf of the user, providing an easier setup process.
Refer to our [full list of system policies](/docs/features/tailscale-system-policies) to discover all settings you can configure.
To configure this, locate the Tailscale app within the admin console of your MDM solution, then go to the **Managed Configuration** or **AppConfig** settings for the app. The specific wording depends on the MDM solution you're using.
This is an example of an AppConfig XML to set the [**ManagedByOrganizationName**](/docs/features/tailscale-system-policies#set-your-organization-name) system policy value:
```
`\<dict\>
\<key\>ManagedByOrganizationName\</key\>
\<string\>Tailscale, Inc.\</string\>
\</dict\>
`
```
Deploying the AppConfig above will display **Managed by Tailscale, Inc.** in the Settings screen of the iOS app.
Note that the **ManagedByOrganizationName** system policy is not currently available on Apple TV, and won't result in any user-facing change.
Refer to the [list of system policies](/docs/features/tailscale-system-policies) for other values you can configure on behalf of the user.
On this page
* [Configuration profiles](#configuration-profiles)
* [Allow push notifications automatically](#allow-push-notifications-automatically)
* [Install the Tailscale VPN configuration](#install-the-tailscale-vpn-configuration)
* [Deploying system policies using AppConfig](#deploying-system-policies-using-appconfig)
Scroll to top