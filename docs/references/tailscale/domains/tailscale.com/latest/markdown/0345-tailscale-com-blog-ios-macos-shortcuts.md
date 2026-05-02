Automate Network Connectivity with actions for iOS and macOS Shortcuts
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|January 25, 2023
# Tailscale actions for iOS and macOS Shortcuts
End-user programming and automation has a long history on Apple’s platforms. It began with [BASIC](https://en.wikipedia.org/wiki/Integer_BASIC) being included in the ROM of the Apple II, continued in the 1980s with [HyperCard](https://en.wikipedia.org/wiki/HyperCard), and was further expanded with [AppleScript](https://en.wikipedia.org/wiki/AppleScript) in the ’90s and [Automator](https://en.wikipedia.org/wiki/List_of_macOS_built-in_apps#Automator) in the 2000s. The modern successor to those systems is [Shortcuts](https://en.wikipedia.org/wiki/Shortcuts_(app)), which was launched in iOS 13 and macOS 12. There are a lot of creative uses for Shortcuts, whether it’s [quickly detecting allergens](https://fosstodon.org/@ross/109671294741113929), [making the Fediverse easier to use](https://www.macstories.net/ios/masto-redirect-a-mastodon-shortcut-to-redirect-profiles-and-posts-to-your-own-instance/), or [automating your way into a new job](https://www.reddit.com/r/shortcuts/comments/uzze1c/shortcuts_has_literally_changed_my_life/).
If you were trying to automate Tailscale functionality, you could always use the [Tailscale CLI](/kb/1080/cli/) with the “Run Shell Script” action — but it would only work on macOS, and would not be particularly user friendly. **Starting with Tailscale v1.36 (and in no small part thanks to** [***user feedback***](https://github.com/tailscale/tailscale/issues/2504)**!) Tailscale actions can be directly triggered and automated with Shortcuts on iOS and macOS.** We’ve added actions for managing the connection state, [using exit nodes](/kb/1103/exit-nodes/), and [switching between profiles](/kb/1225/fast-user-switching/).
See the [documentation](/kb/1233/mac-ios-shortcuts/) for more details, or read on for some ideas for how you might use Tailscale to (automatically!) make your life easier.
## Tailscale: don’t leave home without it
On iOS, shortcuts can be triggered by [automations](https://support.apple.com/en-gb/guide/shortcuts/apd690170742/ios), which include location-based triggers. You can set up an automation whenever you’ve left your house, ensuring that you always have control of how your traffic is routed:
As an alternative, you can use a [time-based](https://support.apple.com/en-gb/guide/shortcuts/apd932ff833f/6.0/ios/16.0) automation to trigger this, or [one based on other factors](https://support.apple.com/en-gb/guide/shortcuts/apde31e9638b/6.0/ios/16.0), such as joining a specific Wi-Fi network or your battery level.
## Switch between accounts
If you find yourself frequently [switching between two tailnets](/kb/1225/fast-user-switching/?tab=macos#switching-between-accounts), you may find the repeated mousing around the submenu tiring. A shortcut can instead turn this into one action:
Once that’s set up, you can [bind it to a keyboard shortcut](https://support.apple.com/en-gb/guide/shortcuts-mac/apd163eb9f95/mac#apd94a0e7c32) or launch it from Spotlight for *even faster* fast user switching.
## Toggle features from the home screen
On iOS, shortcuts can be added to the home screen for easy access, complete with custom icons. This allows you to have one-tap access to your preferred Tailscale workflows, such as using an exit node.
## Announce status
You can use the [“Get Status” action](/kb/1233/mac-ios-shortcuts/#get-status-action) to get a spoken summary of Tailcale announced via Siri.
## Give it a try
We’re sure there are a lot more creative uses, and we’re looking forward to seeing how Tailscale plays in this new ecosystem – [read the documentation](/kb/1233/mac-ios-shortcuts/) to get started setting up shortcuts. Let us know what you automated with shortcuts for Tailscale: mention [@Tailscale](https://twitter.com/tailscale) on Twitter and [@tailscale@hachyderm.io](https://hachyderm.io/@tailscale@hachyderm.io) on Mastodon, or post on [/r/tailscale](https://www.reddit.com/r/tailscale) on Reddit.
Share
Author
Mihai Parparita
Author
Mihai Parparita
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