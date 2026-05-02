SABnzbd -
Wiki -
SABCTools 3
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+SABCTools+3&amp;body=##+URL:+/wiki/installation/sabctools.html
Improvement:
>)
SABCTools 3
# Introduction to SABCTools
In SABnzbd 4.0.0 we introduced a new module called `sabctools` to optimise (essential) CPU intensive tasks.
The Windows- and macOS-packages of SABnzbd automatically contain that module. On other platforms (like Linux and FreeBSD) you have to make sure the module is installed. The information below is for packagers and source code users on those platforms.
# Installation with Python’s packaging manager `pip`
These instructions assume that `python` and `pip` refer to the Python 3 installation on your system.
On some older systems Python 2 is the default `python` and you should instead use the `python3` and `pip3` commands.
Inside the source directory of SABnzbd, run this command
```
`pip install -r requirements.txt
`
```
It will take care of installing the right version of `sabctools`. This will work for x86 and ARM.
You might need to first install the python-development module (`python3-dev` or `python3-devel`), and then run the above `pip` command.
If you need to install a specific version to match your version of SABnzbd, you can specify this in the command:
```
`pip install sabctools==7.0.1
`
```
# Installation on Linux
**Jump to: [Ubuntu (via PPA)](#installation-on-ubuntu-via-ppa), [Ubuntu](#installation-on-ubuntu-without-ppa), [Fedora / RedHat](#installation-on-fedora--redhat), [OpenSuSE](#installation-on-opensuse) or [FreeBSD](#installation-on-freebsd).**
### Installation on Ubuntu via PPA
For Ubuntu there is a PPA with `sabctools`, by the same creator (JCFP) as the SABnzbd PPA. This will work on X86, X86-64, ARM (32bit) and ARM64 architectures.
Install it like this:
```
`sudo add-apt-repository ppa:jcfp/sab-addons
sudo apt-get update
sudo apt-get install sabctools
`
```
### Installation on Ubuntu (without PPA)
Short method, only works on X86 and X86-64
```
`sudo apt-get install python3-pip
sudo -H pip install sabctools --upgrade
`
```
Long, with your own compiling:
```
`sudo apt-get install python3-dev python3-pip
sudo -H pip install -r requirements.txt
`
```
### Installation on Fedora / RedHat
Short method, only works on X86 and X86-64
All as root:
```
`pip install --upgrade pip
pip install -r requirements.txt
`
```
Long, with your own compiling:
```
`yum install -y python-devel gcc redhat-rpm-config
pip install --upgrade pip
pip install -r requirements.txt
`
```
### Installation on OpenSuSE
All as root
Short, works on X86 and X86-64
```
`zypper install -y python-pip
pip install --upgrade pip
pip install -r requirements.txt
`
```
Long, with your own compiling:
```
`zypper install -y python-pip python-devel gcc
pip install --upgrade pip
pip install -r requirements.txt
`
```
## Multiple installations of python
If you have multiple installations of Python on your machine (`python`/`python2`/`python3` or different versions of Python 3), you have to make sure SABCTools is installed into the correct Python environment. And ‘correct’ means the Python installation used by SABnzbd. The command is then:
```
`/path/to/correct/python -m pip install -r requirements.txt
`
```
## Check if SABCTools is correctly installed
To check if SABCTools is correctly installed, run this Python oneliner:
```
`python -c "import sabctools; print(sabctools.\_\_version\_\_, sabctools.\_\_file\_\_);"
`
```
It should print the version of the installed `sabctools` module, without any errors.
## SABnzbd’s Checking & Logging
SABnzbd will check if SABCTools is installed.
If SABCTools is installed, and the version is correct, SABnzbd will print in the log:
```
`SABCTools module (v7.0.1)... found!
`
```
If your version of `sabctools` does not match the version required by SABnzbd, you get:
```
`SABCTools disabled: no correct version found! (Found v6.0.0, expecting v7.0.1)
`
```
## Issues
If you experience any issues, please let us know on our [Forums](https://forums.sabnzbd.org/) or [Github](https://github.com/sabnzbd/sabnzbd/issues)!
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)