SABnzbd -
Wiki -
User Manual
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+User+Manual&amp;body=##+URL:+/wiki/
Improvement:
>)
User Manual
SABnzbd is a program to download binary files from Usenet servers. Many people upload all sorts of interesting material to Usenet and you need a special program to get this material with the least effort.
If you are a beginner with Usenet, you should first find a website explaining the concepts (for example, this [English](http://www.binaries4all.com/beginners/) and [Dutch](http://www.binaries4all.nl) website explains everything in great detail).
You should especially find out about how to obtain NZB files that define your downloads. On this Wiki you can find all the information you'll need to setup SABnzbd and customize it. If you experience trouble, please post on our [Forum](https://forums.sabnzbd.org/).
SABnzbd is certainly not the only program of its kind, but it does have characteristics that make it attractive:
|**Server-oriented**|SABnzbd does not have a Windows or macOS specific interface. SABnzbd happily runs in the background, either on your desktop system or on a real server, and you can access the interface through your browser. This way you can run the program on one computer and access the user interface [from another](/wiki/configuration/5.0/general).|
|**Automated**|SABnzbd takes care of all the hassle of downloading, verifying, repairing, unpacking and deleting garbage. You throw an NZB file at SABnzbd and some time later a complete and directly usable download is available. You can even throw in your own [post-processing script](/wiki/configuration/5.0/scripts/post-processing-scripts) to suit your needs.|
|**Light-weight**|SABnzbd has a relatively low impact on the computer it runs on. Only when PAR2 repairing and unpacking occurs, you might notice some heavy disk and CPU activity. You can, for example, run it on a [NAS device](/wiki/installation/install-nas).|
|**Responsive design**|We have multiple skins, but the main one is Glitter. It scales to any screen size, so you can manage your downloads on your desktop, tablet or phone. It has a Light and Dark mode and also offers Compact and Tabbed modes if you prefer. Other tips and tricks for working with Glitter can be found [here](/wiki/extra/glitter-tips-and-tricks).
Others have made Android ([nzb360](http://nzb360.com/)) and iOS ([nzbUnity](https://nzbunity.dozenzb.com/)) apps to manage SABnzbd.|
|**Extensible**|Several people have created utilities to support SABnzbd. Apps like [Sonarr](https://sonarr.tv/), [SickRage](https://sickrage.github.io/), [Radarr](https://radarr.video/) and [Headphones](https://github.com/rembo10/headphones) can integrate with SABnzbd and automate your download process.
Browser-extensions are also available for FireFox ([NZB Unity](https://addons.mozilla.org/addon/nzb-unity)) and Chrome ([SABConnect++](https://chrome.google.com/webstore/detail/sabconnect++/okphadhbbjadcifjplhifajfacbkkbod)).
Full list of [extensions](/wiki/extensions-for-sabnzbd).
|
|**Well supported**|There is an active [Forum](https://forums.sabnzbd.org/) available and you can reach the developers on [GitHub](https://github.com/sabnzbd/sabnzbd/issues).|
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)