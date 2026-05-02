Roll out Tailscale as a standalone macOS app
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 07, 2022
# Roll out Tailscale as a standalone macOS app
Tailscale runs on many platforms, including macOS, and has a [macOS version](/download/mac) available in the App Store. If you’re using macOS at work, however, your team might not be able to roll out Tailscale to your entire organization if not everyone has an Apple ID. In this case, it’s common to use a mobile device management (MDM) solution that allows you to distribute applications that are not available in the App Store.
**Starting with [Tailscale v1.26](/changelog/#2022-06-06-client), you can install Tailscale as a standalone macOS application.** The standalone macOS application has all the same functionality as the version distributed in the App Store.
In macOS, there are two primary ways to manage VPNs: [Network Extension](https://developer.apple.com/documentation/networkextension), a specific system extension, and other more generic [system extensions](https://developer.apple.com/system-extensions/). Network Extension can be used as part of a sandbox application distributed via the App Store, but is not available for applications outside the App Store. Conversely, generic system extensions can be used with applications outside of the App Store, but not for applications inside it. But Tailscale on macOS works with both! Learn more about Tailscale’s [multiple variants for running on macOS](/kb/1065/macos-variants/), which use these different implementations.
To get started, [download the standalone macOS application](https://pkgs.tailscale.com/stable/#macos).
Share
Author
Nick O'Neil
Author
Nick O'Neil
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