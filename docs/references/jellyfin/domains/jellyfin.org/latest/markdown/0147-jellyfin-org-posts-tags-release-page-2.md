27 posts tagged with "release" | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
We are pleased to announce the latest stable release of Jellyfin, version 10.9.0!
This major release brings many new features, improvements, and bugfixes to improve your Jellyfin experience.
You may upgrade your Jellyfin instances at any time now, however please read on for a complete detailing of what's new and changed, including some very important release notes. For those who were running Unstable builds for testing, we thank you immensely, and you may now switch back to the Stable repository and forcibly reinstall/repull the latest version.
Happy watching!
- Joshua
We are pleased to announce that we are now in our feature freeze window for the 10.9.0 release! That means that from now until the release, we'll be focusing only on merging bugfixes and other improvements, while all features will be on hold until the release is finalized.
That also means it's time to start testing. As outlined in our last blog post, we're doing things a bit differently this release, so this post will provide the steps one would need to take to help us test the new release.
If you want to help out, please read on!
- Joshua
Over the last several weeks, I've been driving a major push to revamp and improve our CI, in an effort to improve our release workflow, our velocity of releases, and the burden they have on me as the release manager. This post will detail the changes we've made, how they might affect you as a user or contributor, and how we're planning to proceed with our 10.9.0 release cycle.
## The TL;DR[​](#the-tldr)
1. We have [a new repository browser UI](https://repo.jellyfin.org) along with a new file layout, on a new master repository machine, built by new CI, that will hopefully make it nicer to look around and get right to what you need. This has now been cut over into production, but is still a bit of a work in progress, so please report any bugs you find to us! Note that quite a number of paths will have changed (anything under `/server` especially), but some will remain the same. If you get a 404 and can't find it through the browser UI, best to check in. **3rd party packagers downloading files manually from us are advised to contact us if needed.**
2. We are dropping non-LTS Ubuntu packages, dropping our own Fedora/CentOS packages in favour of [RPMFusion builds](https://admin.rpmfusion.org/pkgdb/package/free/jellyfin/), and adding [GHCR as a container repository](https://ghcr.io/jellyfin/jellyfin) for our Docker images.
3. For 10.9.0, we will not be producing explicit "beta" releases. Instead, we will test using our new Weekly Unstable builds. Once the master branch is sufficiently stable and good, we will release 10.9.0 directly from there (via our standard release branch process).
4. The 10.9.0 feature freeze (bugfix PRs only after this) will tentatively begin on **Monday, March 18th**. The hope is that all of the above will be ready by then so that obtaining Unstable builds for testing will be easy.
5. The 10.9.0 release itself is tentatively planned for the **last weekend in April**. To all **3rd parties who build packages of our releases, please read until the end for an important note about this release**.
Read on for more details.
- Joshua
Improvements to the Jellyfin mobile experience are here. A new update for the Jellyfin Android app is ready! Read along to learn everything
new in this update!
- Niels & Max
When we say this 2.0.0 release is a major milestone, we honestly mean it. New features and bug fixes abound, but even behind the scenes the updates continue all the way to the foundation with us updating every single file in the app to support a new programming language. You can't get more monumental than that!
Read more to learn about some of the exciting new features.
- 1hitsong
It has been a busy year with a lot of work on the Android TV app. After an extended beta period today is finally the day to share this work
to the public. Read along to learn everything about improved music playback, the new screensaver and more!
- Niels
It has been a long while since the last update, but after an extended beta testing period
with plenty of bug reports (thanks, by the way!) and subsequent fixes,
we're excited to finally announce a new major update to the Jellyfin app for Android.
Version 2.5.0 again focuses on improvements to the integrated player, and brings various new features,
many bug fixes and a lot of technical maintenance and rewrites.
Read on to learn more!
We are excited to announce the release of Jellyfin 1.6.4 for Roku! With so many new featues and bug fixes, you'll wonder how we crammed it all into one release. Keep reading to learn more.
- 1hitsong
280 commits, +28000 lines added, +43000 lines removed since November 2022: The results of the biggest refactor we ever tackled
and an ecosystem upgrade we've been looking forward since we started working on this client on 2020.
* Fernando
We are excited to announce the release of Jellyfin 1.6.3 for Roku! The primary goal of this release is resolving bugs & issues,
but we still managed to add some new items too. Keep reading to learn more.
- 1hitsong