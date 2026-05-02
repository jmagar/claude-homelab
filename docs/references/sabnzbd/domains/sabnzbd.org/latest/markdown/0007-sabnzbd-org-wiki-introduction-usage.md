SABnzbd -
Wiki -
Using SABnzbd
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Using+SABnzbd&amp;body=##+URL:+/wiki/introduction/usage.html
Improvement:
>)
Using SABnzbd
## Usenet basics
If you're a beginner with Usenet, you should first find a website explaining the concepts (for example, this [English](http://www.binaries4all.com/beginners/) and [Dutch](http://www.binaries4all.nl) website explains everything in great detail).
You should especially find out about how to obtain NZB files that define your downloads. On this Wiki you can find all the information you'll need to setup SABnzbd and customize it. If you experience trouble, please post on our [Forum](https://forums.sabnzbd.org/).
## General Workflow
Here's how you'll generally download things with SABnzbd:
1. Search for something you want to download, using your [usenet indexer](/wiki/introduction/nzb-sources) of choice,
2. Download an NZB describing that data,
3. Give that NZB to SABnzbd in one of a wide variety of ways,
4.
SABnzbd then downloads from your usenet provider(s), and optionally does several things:
* Verifies files
* Repairs files if necessary
* Unrars
* Moves files into the correct directory (see [Categories](/wiki/configuration/5.0/categories))
* Post-processing (see [Categories](/wiki/configuration/5.0/categories) and [User Scripts](/wiki/configuration/5.0/scripts/post-processing-scripts))
## Adding an .nzb file to SABnzbd
* **Upload an NZB** - On the index of the web interface there's a box to upload an NZB you've downloaded to your hard drive. You can upload the raw .NZB file, or an NZB that has been zipped, gzipped or rar'ed.
* **Open with SABnzbd** - SABnzbd includes the ability to associate NZBs with SABnzbd. Simply have your browser open the NZB with SABnzbd, or set your OS to associate NZBs with SABnzbd.
* **Add by watched folder** - In Config -\> Folders, you can set a folder to be "watched" by SABnzbd for downloaded NZBs. Once you've specified a directory to be watched, any NZBs (zipped, gzipped or rar'ed ones) will be automatically added to SABnzbd and deleted.
* **Add by RSS** - Many [indexing sites](/wiki/introduction/nzb-sources) offer RSS feeds of their content. Set one up under [Config -\> RSS](/wiki/configuration/5.0/rss) and SABnzbd will automatically download from it.
* **Add by URL** - On the index of the web interface there's a box to enter the URL of an NZB file. Many indexing sites require that you enter an API Key as part of your URL, so this might not be the easiest method depending on your indexing site.
* **Third-Party Tools** - SABnzbd's [powerful API](/wiki/configuration/5.0/api) allows developers to create tools that can directly add things to SABnzbd's queue. We have a [forum for discussing third party tools](https://forums.sabnzbd.org/index.php?board=6.0).
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)