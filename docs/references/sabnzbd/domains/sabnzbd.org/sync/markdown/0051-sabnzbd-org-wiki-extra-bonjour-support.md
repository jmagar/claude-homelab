SABnzbd -
Wiki -
Bonjour support
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Bonjour+support&amp;body=##+URL:+/wiki/extra/bonjour-support.html
Improvement:
>)
Bonjour support
SABnzbd supports Apple's Bonjour protocol to some extent.
Bonjour shows available network services without you having mess around with IP addresses and port numbers.
All Apple devices support it and will therefore be able to find your SABnzbd server easily. On other operating systems you'll have to install some add-ons to get Bonjour working; see the details below.
The Bonjour protocol is also known as ZeroConfig or Avahi on other platforms.
Only the Safari browser has built-in support for Bonjour,
but there are add-ons for Firefox and Chrome.
Unfortunately our Bonjour implementation doesn't work on macOS El Capitan. We're not sure whether we can fix this.
### Limitation
Note that Bonjour will only work when you setup SABnzbd to communicate with other computers on your local network. A completely local installation (using 127.0.0.1 or localhost) will not be advertised on Bonjour. The protocol doesn't support this.
The speed may be disappointing. For some reason Bonjour likes to communicate over IPv6, which can be slow on some browsers.
### macOS
There's nothing to install.
Start SABnzbd with the host name 0.0.0.0 (or empty) and it will advertise itself to all Bonjour clients on your local network.
Note that you need to enable Bonjour support in the Safari browser: Preferences-\>Bookmarks
### Windows
If you have iTunes installed, then Bonjour is installed too.
Otherwise, you'll have to install [Bonjour Print services for Windows](http://support.apple.com/kb/DL999) from Apple's website.
All Apple devices will be able to find your SABnzbd server.
On Windows itself, only Safari for Windows supports Bonjour.
### Debian/Ubuntu:
Install two packages to get Bonjour working:
```
`sudo apt-get install avahi-daemon libavahi-compat-libdnssd1`
```
The separate tool "avahi-discover" (package name "avahi-discover") can be handy as it will show all bonjour services on your LAN.
All Apple devices will be automatically able to find your SABnzbd server.
On Linux, the Konqueror browser (part of KDE) has built-in support for Bonjour/Avahi.
Some background info: [Zeroconf for Linux in a Snap](http://www.enterprisenetworkingplanet.com/netos/article.php/3618026/Run-Zeroconf-for-Linux-in-a-Snap.htm)
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)