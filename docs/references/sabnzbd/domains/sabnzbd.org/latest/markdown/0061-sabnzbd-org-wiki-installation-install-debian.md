SABnzbd -
Wiki -
SABnzbd installation on Debian
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+SABnzbd+installation+on+Debian&amp;body=##+URL:+/wiki/installation/install-debian.html
Improvement:
>)
SABnzbd installation on Debian
## Notice About Application Versions
Debian has a *very* long development cycle as part of their intentional focus on stability. This means if you pull SABnzbd directly from APT you will *almost certainly* receive a version that is considered unsupported by the SABnzbd team. For example, at time of writing the version present in Debian Stable is two years out of date, and it will likely reach 2.5 years of being outdated by the time the next Stable version of Debian ships.
If your base distribution is Debian we *strongly* recommend using some kind of containerized solution to install SABnzbd, be it Docker, Flatpak, Snapcraft, or something else. Those options are documented on the main [Unix Installation page](/wiki/installation/install-unix).
## Installing from Debian Backports
If you *must* install from APT we recommend you use [Debian Backports](https://backports.debian.org/) to ensure you receive an actually up-to-date version of SABnzbd. These specific instructions are based on the current stable version of Debian 13 ‘Trixie’, but the instructions should hold true for most versions of Debian, including future releases. Just *literally* swap out all the references below from `trixie` to `forky` or whatever Debian release you’re running.
* Edit `/etc/apt/sources.list` with sudo / as root
* Confirm that your existing sources include Debian’s `main`, `contrib`, and `non-free` repos. Your configuration should look something like this:
```
` deb http://deb.debian.org/debian/ trixie main contrib non-free
deb-src http://deb.debian.org/debian/ trixie main contrib non-free
deb http://security.debian.org/debian-security trixie-security main contrib non-free
deb-src http://security.debian.org/debian-security trixie-security main contrib non-free
deb http://deb.debian.org/debian/ trixie-updates main contrib non-free
deb-src http://deb.debian.org/debian/ trixie-updates main contrib non-free
`
```
* NOTE: You may have *other* repos like `non-free-firmware`, that’s OK please keep any extra lines, just make sure you at least have `main`, `contrib`, and `non-free` and add whichever of them you don’t already have to each line.
* Add the `trixie-backports` repo at the bottom:
```
` deb http://deb.debian.org/debian trixie-backports main contrib non-free
`
```
* Save the file
* Update apt: `sudo apt update`
* It should show you downloading any contrib / non-free repo metadata you didn’t previously have
* Install SABnzbd from backports: `sudo apt install -t trixie-backports sabnzbdplus`
* NOTE: This will JUST install the packages from backports if it provides specific versions we request (like `python3-sabctools`), but will prefer your stable packages if possible (like `unrar`)
* That’s it, you’ve installed SABnzbd from Debian Backports.
With installation completed you can start SABnzbd manually by running:
```
`sabnzbdplus
`
```
Or alternatively, you can proceed to the [How to Run as a Service](/wiki/installation/install-ubuntu-repo#toc3) section of the Ubuntu instructions to have SABnzbd run automatically on boot.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)