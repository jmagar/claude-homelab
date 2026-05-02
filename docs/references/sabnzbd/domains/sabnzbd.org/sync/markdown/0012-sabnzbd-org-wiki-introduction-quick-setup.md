SABnzbd -
Wiki -
Getting started
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Getting+started&amp;body=##+URL:+/wiki/introduction/quick-setup.html
Improvement:
>)
Getting started
## Usenet basics
If you're a beginner with Usenet, you should first find a website explaining the concepts (for example, this [English](http://www.binaries4all.com/beginners/) and [Dutch](http://www.binaries4all.nl) website explains everything in great detail).
You should especially find out about how to obtain NZB files that define your downloads. On this Wiki you can find all the information you'll need to setup SABnzbd and customize it. If you experience trouble, please post on our [Forum](https://forums.sabnzbd.org/).
## Windows & macOS
Download the latest build listed on [our download page](/downloads). For Windows we suggest the installer exe, for macOS we suggest the dmg.
## Ubuntu/Debian via PPA
[Installation guide](/wiki/installation/install-ubuntu-repo).
## Other Unix/Linux distributions
Get the latest Python Source Zip listed on [our download page](/downloads).
# Installing SABnzbd
## Windows
Run the installer, follow the prompts. When prompted for installation options, decide if you want SABnzbd to launch in the background when you log in, if you want it to be associated with `.nzb` files, and if you want a desktop icon created.
## macOS
Double-click the `.dmg`, drag the `.app` to Applications. You're done!
## Ubuntu Linux
You already installed it via apt. After installing, edit `/etc/default/sabnzbdplus` if you want SABnzbd to run at startup.
# Upgrading SABnzbd
For all operating systems, to upgrade SABnzbd simply shut down SABnzbd and re-install. In it's a major release (e.g. from 0.7.20 to 1.1.0), it's always better to finish the queue first before updating.
# The Wizard
After launching SABnzbd for the first time, you'll be presented with our quick-start wizard which will hopefully get you up and running as soon as possible. All settings can be changed later in the various Configuration pages.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)