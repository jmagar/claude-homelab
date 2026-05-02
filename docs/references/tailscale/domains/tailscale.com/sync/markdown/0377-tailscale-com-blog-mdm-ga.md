Customize Tailscale at Work Using MDM Policies for Secure Access
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|productFebruary 12, 2024
# Customize Tailscale at work with MDM Policies
Tailscale Mobile Device Management policies enter General Availability today, and we are thrilled to share this new feature set with our **Premium** and **Enterprise** customers. Mobile Device Management (MDM) policies bring new levels of control and security to your Tailscale experience.
Teams from small start-ups to large corporations already trust Tailscale to provide a secure and private identity-based VPN with a flexible topology, resilient networking, and a streamlined setup. It’s a network that just works, built on the WireGuard® protocol for peer-to-peer mesh networking and end-to-end encryption. Integrating that network with MDM solutions offers organizations the ability to supervise and secure their corporate networks, irrespective of geographical location. This convergence of VPN and MDM offers security advantages for remote workers while also ensuring the integrity of your corporate network management.
## [What are Tailscale's Mobile Device Management policies?](#what-are-tailscales-mobile-device-management-policies)
Tailscale offers a list of System policies that you can use across your Windows and Apple devices to configure the Tailscale client experience for your users. If your organization is using an MDM solution like [JAMF, Microsoft Intune, Kandji](https://tailscale.com/kb/integrations/mdm), etc. you can leverage these system policies to manage Tailscale client deployments and improve the user experience for your users.
System policies allow your System Administrator to tailor the Tailscale experience for your users based on their tech-savviness. If you want to hide certain Tailscale client menu options from some users to avoid possible confusion, or if your compliance needs require that Tailscale is always running on in end user devices, we’ve got you covered.
There are also [system policies to offer full tunneling](https://tailscale.com/kb/1315/mdm-keys#configure-the-exit-node-settings) via a forced exit node with no LAN access. Additionally, you can configure split tunneling by allowing LAN access where local LAN traffic is still routable, but anything outside of your LAN is routed through the exit node. With MDM policies you can automatically update Tailscale to its latest version on end user devices and can also restrict corporate devices from accessing personal tailnets.
This is just a teaser and you can take a deeper look at all available [system policies in our documentation](https://tailscale.com/kb/1315/mdm-keys).
### [Microsoft Windows](#microsoft-windows)
The Tailscale client for Windows reads and applies system policies stored in the Windows registry. This approach is compatible with all standard endpoint management software.
For more information, refer to the platform-specific documentation for [Windows](https://tailscale.com/kb/1318/windows-mdm).
### [Apple macOS / iOS / tvOS](#apple-macos-ios-tvos)
The Tailscale clients for macOS, iOS, and tvOS read and apply system policies stored in the user’s defaults database. You can impose these policies by deploying a configuration profile using MDM solutions like [Jamf](https://tailscale.com/blog/jamf-pro) or Kandji. Tailscale also maintains configuration profile manifests for both the [Mac App Store](https://github.com/ProfileCreator/ProfileManifests/blob/master/Manifests/ManagedPreferencesApplications/io.tailscale.ipn.macos.plist) and [Standalone](https://github.com/ProfileCreator/ProfileManifests/blob/master/Manifests/ManagedPreferencesApplications/io.tailscale.ipn.macsys.plist) variants of the client, which allows you to define your policies with a user-friendly GUI.
For more information, refer to the platform-specific documentation for [macOS/iOS/tvOS](https://tailscale.com/kb/1286/macos-mdm).
## [Unlock the power of Tailscale’s MDM policies](#unlock-the-power-of-tailscales-mdm-policies)
The Tailscale client can be both deployed and configured using popular MDM solutions like [Microsoft Intune, Jamf, Kandji, SimpleMDM](https://tailscale.com/kb/integrations/mdm) and we’ve written [step-by-step guides](https://tailscale.com/kb/integrations/mdm) for several of these MDM tools.
If you need help using any of the system policies, or would like to suggest any new policies or integrate a new MDM solution, [contact our support or sales teams](https://tailscale.com/contact/sales).
Share
Authors
Adrian Dewhurst
Andrea Gottardo
Claire Wang
Nick O'Neil
Tinku Thomas
Authors
Adrian Dewhurst
Andrea Gottardo
Claire Wang
Nick O'Neil
Tinku Thomas
Share
Loading...
## Try Tailscale for free
[
Get started
](https://login.tailscale.com/start)
Schedule a demo
[
Contact sales
](/contact/sales)