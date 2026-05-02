Blog | Jellyfin
[Skip to main content](#__docusaurus_skipToContent_fallback)
**Unstable users: we are planning to merge our pending EFCore conversion of `library.db` in the next couple of weeks. It is imperative that all unstable users understand what is going on, what the plan is, and how to mitigate issues that will inevitably arise from this.** Stable (`10.y.z`) users require no action.
Unstable builds are currently paused for roughly 4 weeks post-release of 10.10.0, and during this time, we plan to merge these extensive database changes. There will be breakage - bugs, fixes, and database migrations - during this time. This is your fair warning to either (a) prepare yourself with [a good backup and recovery strategy](/docs/general/administration/backup-and-restore) and disable automatic upgrades; or (b) move off of unstable onto 10.10.0 stable until the dust settles (but, please don't, as we need your help to test!)
Please read on for a more detailed overview if you are interested.
- Joshua
We are pleased to announce the latest stable release of Jellyfin, version 10.10.0!
This major release brings several new features, improvements, and bugfixes to improve your Jellyfin experience. With our faster release cadence between 10.9.0 and 10.10.0, this release should be far less daunting, so please read on for a quick peek at what's new and some important-to-know breaking changes!
You may upgrade your Jellyfin instances at any time now. For those who were running Unstable builds for testing, we thank you immensely, and you may now switch back to the Stable repository and forcibly reinstall/repull the latest version. As always, **ensure you [back up your Jellyfin data and configuration directories](/docs/general/administration/backup-and-restore) before upgrading**. With a major release, it's possible you will hit a bug and want to revert, and to do so, you will need to restore from a backup.
Happy watching!
- Joshua
We are pleased to announce that we are now beginning the process for the 10.10.0 release, with a *planned* release date of Saturday, October 26th (updated - see below), 2024! We said 6 months in our 10.9.0 release posts, and we're sticking by that! The feature freeze proper starts next week, with a soft "new PR freeze" today, so here's what you need to know about the timeline and a recap of how to help us test 10.10.0 before release. Remember, the more people who help test it out before release, the less bugs we're likely to find *after* release, so fire up those secondary servers and warn your users: 10.10.0 is coming!
Developers/contributors, and those users who want a bit more information, please read on!
- Joshua
The latest Android TV app release features enhanced stability, improved navigation with a new home button, and an updated screensaver with
age rating filters. Check out the full blog post to see all the new features and update now!
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