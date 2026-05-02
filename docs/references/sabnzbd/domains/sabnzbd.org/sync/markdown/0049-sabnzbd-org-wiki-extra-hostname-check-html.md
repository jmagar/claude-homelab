SABnzbd -
Wiki -
Hostname verification
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Hostname+verification&amp;body=##+URL:+/wiki/extra/hostname-check.html
Improvement:
>)
Hostname verification
This article is about the message `Refused connection with hostname "sabnzbd.special.com"`, and how to solve it.
# Introduction
Due to something called [DNS hijacking](https://en.wikipedia.org/wiki/DNS_hijacking), attackers could access your SABnzbd installation even if you have not exposed it to the internet.
To prevent this, in SABnzbd 2.3.3 measures were taken and a new [Special](/wiki/configuration/5.0/special) setting was introduced called `host\_whitelist` where you can specify what URL’s that are allowed to represent your SABnzbd.
For normal usage (i.e., access from your LAN), SABnzbd will fill out this setting automatically with your hostname and you don’t have to do anything at all.
# How can I access my setup again from a custom URL, or: How can I get can rid of the error message?
You can choose **one** of the following methods to allow access:
* Just add the host name or the full name (‘FQDN’) shown in the error message to `host\_whitelist` in the [Specials](/wiki/configuration/5.0/special) page of the Config. You can also edit the `sabnzbd.ini` [directly](/wiki/advanced/directory-setup). So, if you use for example `http://sabnzbd.special.com:8080/` to access SABnzbd, then add `sabnzbd.special.com` to `host\_whitelist` (separate multiple hostnames by a comma), **or**
* Access SABnzbd directly through its IP address, **or**
* Enable a Username and Password in the [General](/wiki/configuration/5.0/general) page of the Config.
# Technical background
In short, when you visit a website `evil.com` your browser will not allow it to access your SABnzbd running on `localhost`. However, attackers can use DNS hijacking with a sub-domain `attack.evil.com` that points to `127.0.0.1` (same as `localhost`).
Your browser will allow Javascript running on `evil.com` to access `attack.evil.com`, since that domain now actually points to your SABnzbd they can access it from within the browser. This can also happen if `evil.com` is somehow injected as a hidden frame into a hacked non-evil website.
This attack path was identified in January 2018 in other software ([CVE-2018-5702](http://www.cvedetails.com/cve/CVE-2018-5702/)) that uses a web-interface setup similar to SABnzbd.
# Why do I get an `Access denied` error?
If SABnzbd is accessed via an unexpected name, this will happen:
In the web browser trying to access SABnzbd, you’ll see
```
`Access denied - Hostname verification failed: https://sabnzbd.org/hostname-check
`
```
In the SABnzbd GUI (with access) and `sabnzbd.log` you will see
```
`Refused connection with hostname "superbox" from: ::1\>Mozilla/5.0 (X11; Linux x86\_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.181 Safari/537.36
`
```
or
```
`Refused connection with hostname "mysabhost.duckdns.org" from: ::ffff:2.14.253.70\>Mozilla/5.0 (Linux; Android 7.0; SM-G930F Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/65.0.3325.109 Mobile Safari/537.36
`
```
# Disabling the error message
If you just want to disable the error message, you can do so by turning off `api\_warnings` on the [Special](/wiki/configuration/5.0/special) page of the Config.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)