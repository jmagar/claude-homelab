SABnzbd -
Wiki -
Firewalls and Virus scanners
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Firewalls+and+Virus+scanners&amp;body=##+URL:+/wiki/extra/firewalls-and-virus-scanners.html
Improvement:
>)
Firewalls and Virus scanners
# Firewalls
Firewalls are only too happy to interfere with a program's Internet communication.
Of course they don't tell you about this :)
So check your Firewall logging and settings.
SABnzbd uses the following types of communication:
**Outgoing**:
DNS traffic: during startup it may communicate with an external DNS server to find out network information.
It communicates with external Usenet servers (obviously!) (port 119 and maybe others).
It may communicate with NZB sites (port 80 and 443).
It may try to send email (port 25, 587 or others).
It may access sourceforge.net to check for the latest release (port 80)
**Incoming**:
Webserver: The user interface is a website, so SABnzbd has to "listen" on a port of your choice (default 8080).
Some firewalls will even complain about the use of localhost.
# Virus scanners
Some virus scanner behave like firewalls, so look under "Firewalls".
Some virus scanners see SABnzbd as a problematic program.
Especially the sqlite3.dll file is disliked and some just remove that file.
SABnzbd needs sqlite3.dll to maintain its history database.
Further not all virus scanners handle large and growing files very well.
Suppose you are downloading a large ISO file, the scanner may want to scan every time a piece is added to the ISO.
It's probably better to disable the so-called on-access scan for all SABnzbd's working folders.
Your scanner's scheduled system scan will check for viruses later.
SABnzbd doesn't execute any downloaded file, so no viruses will be activated.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)