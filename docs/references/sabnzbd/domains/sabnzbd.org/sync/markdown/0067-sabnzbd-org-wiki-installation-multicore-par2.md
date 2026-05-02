SABnzbd -
Wiki -
Installing par2cmdline-turbo
[
](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&amp;chan=wc1)
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
[Special Newshosting offer for SABnzbd users: 70% Off + 3 FREE MONTHS!](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&amp;chan=wt)
##
[
Incorrect or missing information?
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Installing+par2cmdline-turbo&amp;body=##+URL:+/wiki/installation/par2cmdline-turbo.html
Improvement:
>)
Installing par2cmdline-turbo
`par2cmdline-turbo` is a drop-in replacement for the original `par2cmdline` and it’s forks (`mt` and `tbb`).
It greatly improves verification and repair performance by using optimizations on x86 and ARM platforms.
## Installation on Ubuntu via PPA
For Ubuntu there is a PPA by the same creator (JCFP) as the SABnzbd PPA that has `par2cmdline-turbo`.
Run these commands to install the PPA and `par2cmdline-turbo`:
```
`sudo add-apt-repository ppa:jcfp/sab-addons
sudo apt-get update
sudo apt-get install par2-turbo
`
```
## Installation of pre-built binaries
On https://github.com/animetosho/par2cmdline-turbo/releases you can find pre-built binaries for different Linux (plus MacOS and Windows) versions. Download the correct version, unpack, and install.
Example of unpacking and putting into `/usr/local/bin/` on Linux x86\_64:
```
`xz -dv par2cmdline-turbo-v1.1.0-linux-amd64.xz
chmod +x par2cmdline-turbo-v1.1.0-linux-amd64
which par2 # note the location, and use that:
sudo mv /usr/bin/par2 /usr/bin/par2.old
sudo cp par2cmdline-turbo-v1.1.0-linux-amd64 /usr/bin/par2
par2 --version # check it says "par2cmdline-turbo"
`
```
## Installation on other distributions
Tools required: `git`, `automake` and `make` (install via your distribution’s package manager)
```
`git clone https://github.com/animetosho/par2cmdline-turbo.git
cd par2cmdline-turbo
aclocal
automake --add-missing
autoconf
./configure
make
make install
`
```
NOTE You might need to run the last command as `sudo` because it will install the `par2` command in the `bin` directory.
NOTE Safest to uninstall your existing `par2` first!
After this, you can delete the `par2cmdline-turbo` folder.
## Checking of par2 version
With `par2 --version` you can check the version of par2. After installing par2cmdline-turbo you should see “-turbo” in the output.
```
`$ par2 --version
par2cmdline-turbo version 0.9.0
`
```
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&amp;chan=mb2)