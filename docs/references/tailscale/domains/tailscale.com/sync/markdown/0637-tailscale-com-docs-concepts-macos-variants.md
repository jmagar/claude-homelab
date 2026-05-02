Three ways to run Tailscale on macOS · Tailscale Docs
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
# Three ways to run Tailscale on macOS
Last validated: Jan 5, 2026
The current version of the Tailscale client requires macOS Monterey 12.0 or later.
The best way to install Tailscale on macOS is to download and install our application from our package server.
[Download Tailscale](https://pkgs.tailscale.com/stable/Tailscale-latest-macos.pkg)
However, there are three ways (variants) to run Tailscale on macOS. You can choose the method that best fits your needs.
* Download and install our Standalone variant of the application directly [from Tailscale's package server](https://pkgs.tailscale.com/stable/#macos) (recommended).
* Install Tailscale from [the Mac App Store](https://apps.apple.com/app/tailscale/id1475387142).
* Download and install the open source `tailscale` + `tailscaled` CLI-only distribution from our [GitHub repository](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS).
All three variants share the same core functionality for connecting your macOS device to Tailscale. However, there are subtle differences in the way that the variants are packaged and how they interact with macOS. You should choose the variant that best fits your use case.
We recommend downloading and installing the Standalone variant Tailscale app directly from our package server, as this variant offers more features, is not subject to limitations imposed on apps distributed through the App Store, and provides more control over the deployment of updates.
## [What are the differences?](#what-are-the-differences)
### [Standalone variant](#standalone-variant)
We always recommend installing the [Standalone variant](https://pkgs.tailscale.com/stable/#macos) of the Tailscale application on macOS.
In macOS Catalina 10.15, Apple added support for the [system extensions](https://developer.apple.com/system-extensions)
approach to implement VPNs. System extensions offer a more secure alternative to the legacy Kernel Extensions technology
previously used by many security and networking tools on older macOS versions. These extensions run with root privileges
but remain within a sandbox, ensuring that Tailscale operates isolated from the macOS kernel. A key advantage of system extensions
is their ability to be distributed outside of the Mac App Store. This lets us offer a version of Tailscale that doesn't require
an Apple ID for installation — you can open our `.pkg` installer to begin using Tailscale.
With the Standalone variant of our app, security updates are promptly distributed since they don't need to undergo Apple's App Store review process.
Additionally, Tailscale can detect third-party tools interfering with the VPN tunnel and notify you when conflicts are detected.
### [Mac App Store variant](#mac-app-store-variant)
To be in the Mac App Store, applications are required by Apple to run in the [macOS App Sandbox](https://developer.apple.com/library/archive/documentation/Security/Conceptual/AppSandboxDesignGuide/AboutAppSandbox/AboutAppSandbox.html),
isolating the app from the rest of the system. When running in a sandbox, VPN applications need to be a [Network Extension](https://developer.apple.com/documentation/networkextension)
to implement VPNs or VPN-like functionality. The Network Extension system does not work for applications distributed outside of the Mac App
Store.
The main advantage of installing Tailscale through the Mac App Store is that it is very easy to get started. However, because both the Tailscale app and its Network Extension are sandboxed and running as the local user, there are a number of limitations.
For instance, a very common issue is that the Screen Time web filter can conflict with the Tailscale version distributed on the App Store.
### [Open source `tailscaled` variant](#open-source-tailscaled-variant)
It is possible to run the [open source Tailscale code (tailscaled)](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS) on macOS.
This uses the kernel [`utun` interface](https://en.wikipedia.org/wiki/TUN/TAP),
rather than the Network Extension or System Extension frameworks. However, this variant does not include a graphical user interface (GUI); all functionality must be managed from the command line. Additionally when using the open source `tailscaled` variant, you won't be able to manage Tailscale from the VPN settings on macOS.
`tailscaled` on macOS is only recommended for unattended installs managed by
experienced macOS system administrators.
## [Which should I choose?](#which-should-i-choose)
Always start by downloading and installing our [Standalone variant macOS app](https://pkgs.tailscale.com/stable/#macos). Install Tailscale from the Mac App Store only if you are unable to install the Standalone variant, or
if you're deploying Tailscale in an environment where relying on the Mac App Store for install and updates is essential.
Do not install the Mac App Store variant and the Standalone variant on the same machine. Having both variants running simultaneously can prevent the Tailscale extension from launching. To safely switch between macOS variants, delete the `Tailscale.app` currently installed, empty the Trash, and reboot your Mac before attempting to install a different variant.
### [Comparison table](#comparison-table)
This table presents the major differences in functionality between the three variants:
||**App Store**
Network Extension|**Standalone**
System Extension|**tailscaled**
`utun` interface|
|Available|[yes](https://apps.apple.com/app/tailscale/id1475387142)|[yes](https://pkgs.tailscale.com/stable/#macos)|[yes](https://github.com/tailscale/tailscale/wiki/Tailscaled-on-macOS)|
|GUI|yes|yes|no|
|[CLI](/docs/reference/tailscale-cli)|yes|yes|yes|
|Minimum macOS|macOS Monterey 12.0|macOS Monterey 12.0|macOS Monterey 12.0|
|Requires Apple ID|yes|no|no|
|Run before login|no; sandboxed|no|yes|
|Keychain used|user|none; files on disk|none; files on disk|
|Sandboxed|yes|system ext only|no|
|[Auto-updates](/docs/features/client/update?tab=macos#auto-updates)|yes; managed by the App Store|yes; managed in-app ([Sparkle](https://sparkle-project.org/))|no|
|Open Source|no|no|yes|
|MagicDNS|yes|yes|yes|
|Taildrop|yes|yes|incomplete|
|Funnel|no|no|yes|
|Exit nodes|yes|yes|partial; can advertise as exit node but cannot use them|
|[MDM support](/docs/integrations/mdm/mac)|yes|yes|no|
|Can be a [Tailscale SSH](/docs/features/tailscale-ssh) server|no|no|yes|
|Can be a [Tailscale SSH](/docs/features/tailscale-ssh) client|yes|yes|yes|
|Supports [`tailscale ssh`](/docs/reference/tailscale-cli#ssh) CLI command|no, must use the regular `ssh` command|yes|yes|
|Supports [services collection](/docs/features/services)|no|yes|yes|
|Compatible with Screen Time web filter|no|yes|yes|
|Can generate configuration reports for support|limited|yes|no|
## [Automating App Store installs](#automating-app-store-installs)
To automate installs of the Mac App Store version of Tailscale, the
[`mas-cli` tool](https://github.com/mas-cli/mas) lets you run:
```
`mas install 1475387142
`
```
## [Troubleshooting](#troubleshooting)
To review common macOS issues and suggestions to help resolve them, refer to the [Troubleshooting guide](/docs/reference/troubleshooting/apple).
On this page
* [What are the differences?](#what-are-the-differences)
* [Standalone variant](#standalone-variant)
* [Mac App Store variant](#mac-app-store-variant)
* [Open source tailscaled variant](#open-source-tailscaled-variant)
* [Which should I choose?](#which-should-i-choose)
* [Comparison table](#comparison-table)
* [Automating App Store installs](#automating-app-store-installs)
* [Troubleshooting](#troubleshooting)
Scroll to top