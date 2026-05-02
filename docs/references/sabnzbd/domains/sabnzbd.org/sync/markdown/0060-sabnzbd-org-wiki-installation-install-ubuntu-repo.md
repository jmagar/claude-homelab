SABnzbd -
Wiki -
Ubuntu PPA Repository
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Ubuntu+PPA+Repository&amp;body=##+URL:+/wiki/installation/install-ubuntu-repo.html
Improvement:
>)
Ubuntu PPA Repository
# PPA Setup
JCFP maintains an unofficial repository with the latest version of SABnzbd[1](#toc4). Whenever an even newer version of the program is released, you will be automatically notified the same as with any other package update.
There are two channels on offer: regular or `nobetas`. The former includes most alpha/beta/rc releases, while the latter is a less risky option that only ever gets final releases. In order to satisfy all dependencies, both Ubuntu's universe and multiverse repositories must be enabled on your system.
# Quick Install Guide for Ubuntu Desktop 20.04 and higher
On a standard Ubuntu Desktop 20.04 and higher, installation of the PPA is easy:
```
`sudo add-apt-repository ppa:jcfp/nobetas
sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install sabnzbdplus
`
```
After that, you have the newewst stable SABnzbd, and it is updated automatically each time you update Ubuntu.
# Full Install Guide
If the above does not work, follow this guide.
First, some preparation to make sure your system can handle extra repositories:
```
`sudo apt-get install software-properties-common`
```
Then, make sure multiverse and universe are enabled:
```
`sudo add-apt-repository multiverse
sudo add-apt-repository universe
`
```
Now add the repository. Choose either the `nobetas` channel, to receive **only final stable releases**:
```
`sudo add-apt-repository ppa:jcfp/nobetas`
```
**Or** if you wish to receive alpha/beta/rc releases, go for the regular option:
```
`sudo add-apt-repository ppa:jcfp/ppa`
```
Tell `apt` to update so it learns of the new packages and proceed to install the program and its dependencies:
```
`sudo apt-get update && sudo apt-get dist-upgrade
sudo apt-get install sabnzbdplus`
```
# How To Start
To start the program, find the SABnzbd item in the Networking section of your desktop menu, or from the command line just execute:
```
`sabnzbdplus`
```
You should run SABnzbd as a normal user: the program does not need root access or any other special permissions.
# How To Run as a Service
If you want the program to be started as a service (i.e., in the background on system boot), edit (as root) the text file `/etc/default/sabnzbdplus` and set the required `USER= ` and the optional settings to your liking. If your system uses systemd, which has been the default since Ubuntu 15.04, run `sudo systemctl daemon-reload` after modifying the settings.
Once configured correctly, the service can be started and stopped with the usual commands:
```
`sudo service sabnzbdplus start`
```
and
```
`sudo service sabnzbdplus stop`
```
Although for obvious reasons no browser is auto-started when running the program like this, the web interface is still available at the usual location of `http://localhost:8080/sabnzbd/` (or whatever other host and port you configured).
# The Fine Print
1. Remember that this package is not created and therefore **not** supported by the SABnzbd team! But do feel free to ask questions on the forum, which is frequently vistited by JCFP.
2. For always up-to-date information about supported Ubuntu versions, read the package [forum post](https://forums.sabnzbd.org/viewtopic.php?f=16&t=387).
3. This is an unofficial package from an unofficial repository. Don't file bugs about packages installed from this repository in Ubuntu's bug tracker, instead complain in a [forum](https://forums.sabnzbd.org/viewforum.php?f=16) topic.
4. The `sabnzbdplus` package is also available from the official [Ubuntu](https://launchpad.net/ubuntu/+source/sabnzbdplus) repositories (jaunty/9.04 and newer, in multiverse) as well as from [Debian](http://packages.debian.org/search?keywords=sabnzbdplus) (debian 6.0/squeeze and newer, in contrib). In case the PPA and the official repositories both have the same release the design of the package will cause the official repositories to take precedence.
If you are interested in packaging, want to grab the source package, or just check out the build logs, visit the [launchpad ppa page](https://launchpad.net/~jcfp/+archive) of the repository.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)