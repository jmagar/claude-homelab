SABnzbd -
Wiki -
Downloads cannot be completed
[
](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wc1)
#
Wiki menu
Wiki
[User Manual](/wiki/)
[FAQ](/wiki/faq)
[Contact](/wiki/contact)
[
Introduction
](#wiki-menu-start)
* [Quick Setup](/wiki/introduction/quick-setup)
* [Using SABnzbd](/wiki/introduction/usage)
* [NZB Sources](/wiki/introduction/nzb-sources)
* [How To's](/wiki/introduction/howto)
* [Known issues](/wiki/introduction/known-issues)
[
Installation
](#wiki-menu-installation)
* [Windows](/wiki/installation/install-windows)
* [macOS](/wiki/installation/install-macos)
* [Unix](/wiki/installation/install-unix)
* [NAS](/wiki/installation/install-nas)
* [From source](/wiki/installation/install-off-modules)
[
Configuration
](#wiki-menu-configure)
* [Configure](/wiki/configuration/5.0/configure)
* [General](/wiki/configuration/5.0/general)
* [Folders](/wiki/configuration/5.0/folders)
* [Servers](/wiki/configuration/5.0/servers)
* [Categories](/wiki/configuration/5.0/categories)
* [Switches](/wiki/configuration/5.0/switches)
* [Sorting](/wiki/configuration/5.0/sorting)
* [Notifications](/wiki/configuration/5.0/notifications)
* [Scheduling](/wiki/configuration/5.0/scheduling)
* [RSS](/wiki/configuration/5.0/rss)
* [Special Settings](/wiki/configuration/5.0/special)
* [API Reference](/wiki/configuration/5.0/api)
[
Scripts
](#wiki-menu-scripts)
* [Pre-queue scripts](/wiki/configuration/5.0/scripts/pre-queue-scripts)
* [Post-processing scripts](/wiki/configuration/5.0/scripts/post-processing-scripts)
* [Notification scripts](/wiki/configuration/5.0/scripts/notification-scripts)
[
Advanced Topics
](#wiki-menu-advanced)
* [High-Speed Tweaks](/wiki/advanced/highspeed-downloading)
* [HTTPS for the Web UI](/wiki/advanced/https)
* [Command line options](/wiki/advanced/command-line-parameters)
* [Folder setup](/wiki/advanced/directory-setup)
* [Unix permissions](/wiki/advanced/unix-permissions)
* [RAR with password](/wiki/advanced/password-protected-rars)
* [IPv6](/wiki/advanced/ipv6)
* [SSL/TLS security](/wiki/advanced/certificate-errors)
* [SSL Ciphers](/wiki/advanced/ssl-ciphers)
* [Windows Service](/wiki/advanced/sabnzbd-as-a-windows-service)
* [Android](/wiki/advanced/android)
[Extensions for SABnzbd](/wiki/extensions-for-sabnzbd)
[Special Newshosting offer for SABnzbd users: 70% Off + 3 FREE MONTHS!](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=wt)
##
[
Incorrect or missing information?
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Downloads+cannot+be+completed&amp;body=##+URL:+/wiki/introduction/downloads-cannot-be-completed.html
Improvement:
>)
Downloads cannot be completed
If you get one of these messages, it means there are not enough "blocks" that can be downloaded to recreate the complete post.
* `Aborted, cannot be completed`
* `Download failed - Not on your server(s)`
## There can be different causes for this:
1. The most likely cause: the post is not available (anymore) on the news server you use because the post has been (partly) removed because of DMCA notices. [More info on DMCA](https://en.wikipedia.org/wiki/Digital_Millennium_Copyright_Act).
2. The post is not yet available on the news server you use. This can happen in the first few minutes or hours after posting. Wait an hour longer or use the [Propagation Delay](/wiki/configuration/5.0/switches#toc2) feature.
3. The post is not available anymore on the news server you use because the post is older than the news server retention. For example: retention is 1000 days, and the post is 1200 days old.
4. The post itself has too little repair blocks (`par2` files).
## Things worth trying:
First of all: you could be out of luck. If you want to still want to try things:
* Use another or an additional news server that is not using the same [backbone](https://upload.wikimedia.org/wikipedia/commons/7/7d/Usenet_Providers_and_Backbones.svg).
*
For example, we recommend trying [Newshosting](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=it) for the fastest downloads, longest retention and best search results.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=df2)
* Find another post with the same contents.
* Check on an Usenet search engine to see if the post was completely available.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=df2)