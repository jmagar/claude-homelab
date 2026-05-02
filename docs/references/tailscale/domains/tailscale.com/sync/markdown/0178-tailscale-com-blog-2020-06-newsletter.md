Shields Up, iOS Fixes, Android Beta & More | Tailscale June Updates
[Aperture beta is now available. Start building with AI safely in minutes.READ MORE -\>](https://tailscale.com/blog/aperture-public-beta)
[Blog](/blog)|June 21, 2020
# June Tailscale newsletter
Another month brings with it another set of Tailscale client updates and features. Here’s what we’ve been working on:
### Tailscale v0.99 & Shields Up
About a week ago we released Tailscale v0.99 ([full release notes](https://github.com/tailscale/tailscale/releases/tag/v0.99.0)). v0.99 includes more bug fixes and a new feature we’ve been calling “shields up.”
Tailscale can be used many ways, but it’s commonly used to connect to web servers, Raspberry Pis, build servers, or other headless “utility” devices.
You want to connect to these devices, but just because they’re on your network doesn’t mean you don’t want to let these devices connect to you.
This new feature lets any device put its “shields up” and reject all incoming connections over Tailscale. Outgoing connections will still work fine, so your personal computer can continue to SSH to your servers who don’t have their shields up, but all incoming connections will be blocked.
You can enable this feature from Tailscale’s menu bar icon, or by using `--shields-up` flag on Linux.
[Read more about “shields up” →](/kb/1072/client-preferences)
(Network admins can enforce network-wide connection restriction, including blocking specific ports or allowing particular user groups with [our ACL features](/kb/1018/acls))
### iOS App Updates
We’ve also released the most important update to our iOS app yet.
For a while now, our iOS app would lose its connection after a few hours. iOS automatically closes background applications using too much memory, and the Tailscale iOS client was going over the limit and being silently closed.
Tailscale team member [@bradfitz](https://twitter.com/bradfitz) went on an odyssey to fix this: he built tools to [dig into Go binary sizes](https://twitter.com/bradfitz/status/1255972647449448449), modified our fork of the Go compiler to minimize memory, and produced [all manner of diagnostic charts](https://twitter.com/bradfitz/status/1272997368208621569), reducing our memory usage significantly. But no luck, the connection loss remained. After more intensive profiling, he located the issue: the problem wasn’t in the majority Go portion of our app, but in our small Swift wrapper layer, which was slowly leaking memory. Several `autoreleaseblock` calls later, our team felt a wave of relief: the iOS app is now slimmer than ever before, and should stay connected as long as needed.
### Android Beta
As promised in our last newsletter, we’ve officially launched our Android beta!
Those with a tolerance for a few bugs are welcome to [join our beta on the Play Store](https://play.google.com/apps/testing/com.tailscale.ipn). Bug reports are welcome [via email](mailto:support+android@tailscale.com) or [GitHub](https://github.com/tailscale/tailscale/issues/new).
If you’d prefer to hold out until most of the bugs have been found, you can also [pre-register to be notified when the production version is ready](https://play.google.com/store/apps/details?id=com.tailscale.ipn).
### Welcome to our Interns
At the beginning of May we welcomed our first ever class of interns students to the team. Hailing from Waterloo University, Zijie, Wendi, and Dmytro have been hard at work on several exciting new Tailscale features.
[Read more on our blog](/blog/meet-wendi-zijie-and-dmytro/)
### Community Contributions
From large companies to individuals, people are continuing to explore how Tailscale can make their networks simpler. This month, we have a few new articles from the community:
* For our Japanese users: 日本語を喋る人ために、[@masa\_iwasaki](https://twitter.com/masa_iwasaki)さんは [Tailscale で簡単に自宅開発サーバーを実現する記事](https://mstshiwasaki.hatenablog.com/entry/2020/06/15/101239)を書きました。 記事中で How Tailscale Works の便利な大筋もあります。@masa\_iwasaki さん、書いてくれてありがとうございます！
* [@nativeclouddev](https://twitter.com/nativeclouddev) wrote [*Scale Out Your Raspberry Pi Kubernetes Cluster to the Cloud*](https://nativecloud.dev/scale-out-your-raspberry-pi-k3s-cluster-to-the-cloud), which, like[@mrkaran\_’s article](https://mrkaran.dev/posts/home-server-updates/) last month,explores the details of running Tailscale inside Kubernetes. Complete with network diagrams likeHow Tailscale Works, anda feature request:)
Thanks to [@masa\_iwasaki](https://twitter.com/masa_iwasaki), [@nativeclouddev](https://twitter.com/nativeclouddev), and all the Tailscale community members writing and contributing to our mission of fixing networking once and for all.
Share
Author
Ross Zurowski
Author
Ross Zurowski
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