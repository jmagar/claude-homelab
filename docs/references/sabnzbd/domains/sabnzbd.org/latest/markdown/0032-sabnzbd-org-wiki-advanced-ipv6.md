SABnzbd -
Wiki -
IPv6
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+IPv6&amp;body=##+URL:+/wiki/advanced/ipv6.html
Improvement:
>)
IPv6
SABnzbd is fully IPv6 enabled: it can download from IPv6 enabled news servers, and you can access SABnzbd's web-interface over IPv6.
### Download from IPv6 enabled news servers
SABnzbd will automatically use IPv6 if available when connecting to news servers.
Based on HappyEyeballs, SABnzbd will choose the quickest connection to a newsserver: via IPv4 or via IPv6
### Access SABnzbd's web-interface over IPv6
To access SABnzbd's web-interface over IPv6, you need to fill out `::` in [General](/wiki/configuration/5.0/general) at the field "SABnzbd Host". Press Save Changes, and then restart SABnzbd.
As a first test, you should be able to access SABnzbd via `http://[::1]:8080/`.
If that works you can fill out the public IPv6 address of your system running SABnzbd,
so something like `http://[2001:dead:beef:cafe:123:4567:b055]:8080/`
### Access SABnzbd over IPv6 from your LAN without login
To access SABnzbd over IPv6 from your LAN without login,
you can fill out your IPv6 network prefix in Config -\> Special -\> local\_range,
so something like `2001:dead:beef:cafe:` (replace with your actual prefix).
### Access SABnzbd over IPv6 from the outside world
To access SABnzbd over IPv6 from the outside world,
you need to configure your router to allow incoming connections on the SABnzbd port (default is 8080) for the local IPv6 addresses.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)