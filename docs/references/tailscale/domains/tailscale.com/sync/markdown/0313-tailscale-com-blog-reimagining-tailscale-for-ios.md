Tailscale for iOS: Better Design and Performance Enhancements
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|July 20, 2023
# Tailscale for iOS: Better Design and Performance Enhancements
Tailscale gives you access to your devices regardless of their location, it follows that Tailscale should work wherever you are too! That said, while we’ve had an iOS app since the early days, this app hasn’t received much love in a long time. **That changes today: with version 1.46 we are happy to introduce a major update, both in design and engineering.**
From a design perspective, we polished some of our core user workflows. Many of you told us that you frequently used the app to connect to an [exit node](/kb/1103/exit-nodes/), such as when you are traveling. As a result, we made exit nodes more prominent and easier to manage: they are not only faster to access, but the app will now remember your last used exit node, and turning it on or off is just one tap away.
We also refreshed the visual design to match that of our admin console: we updated the color scheme and typography to reflect that of our design system; to mirror the information display, we now have status indicators, and your avatar is displayed in the top right corner. Wherever possible, we’ve leveraged Apple design patterns to make the app feel more familiar and performant.
This is also possible thanks to a complete re-engineering of the UI layer of the app, which we completely rewrote with SwiftUI. It’s good news for us, because the code is more readable and easier to manage, but also for our users, because we can now rapidly prototype and ship new features across the entire Apple ecosystem.
Since we were deep in the code, we added [Tailnet lock](/kb/1226/tailnet-lock/) support for iOS and macOS—a crucial feature for some of our enterprise customers.
We also threw in a couple of quick wins for everyone:
* Tapping a machine will open a view that shows machine details like the different IP addresses and the key expiration status.
* Long pressing a machine will now bring up a context menu that allows you to copy its IPv4 address or ping the machine.
## A note on battery life
While we started exploring potential design directions more than a year and a half ago, we held development off because of the urgent battery life issues that plagued some of our users. Much has changed since then:
* Our team has grown significantly, giving us the bandwidth to work on new features and battery life improvements in parallel (and updates to our Android client as well, because we want every platform to reach the same quality of experience).
* We set up privacy-aware instrumentation that allows us to gauge how much and how often the Tailscale app is transmitting data on mobile devices, which will allow us to assess whether our future improvements will make things better.
[Based on the data we gathered](https://tailscale.dev/blog/battery-life), we know that about 2% of iOS clients running our latest stable release are still experiencing pronounced battery life problems. That’s still a lot of you — our work on Tailscale’s battery life impact isn’t something we’ll ever declare “done”. We’re going to continue monitoring, making improvements, and reporting back to you on our progress.
## Give us feedback
Your continued feedback drove much of the direction we pursued in this redesign. We would like to thank all our iOS users for providing feedback in GitHub issues and TestFlight.
If you too want to try out new features early and give us feedback as we build, you can join our [TestFlight program](https://testflight.apple.com/join/tLcYLZJV). You’ll then be able to share your feedback with us by taking a screenshot of the app, just like you’re normally used to. After taking a screenshot, tap the preview that appears in the bottom left corner to access the screenshot editor (here you can sketch on top of the screenshot). From there, tap “Done” in the top-left corner, then tap “Share Beta Feedback…”. We read and treasure every single message you send us this way.
[Download the iOS app](https://apps.apple.com/us/app/tailscale/id1470499037?ls=1) to connect your iPhone or iPad to your Tailscale network today.
Share
Authors
Alessandro Mingione
Andrea Gottardo
Sam Linville
Authors
Alessandro Mingione
Andrea Gottardo
Sam Linville
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