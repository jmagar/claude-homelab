SABnzbd -
Wiki -
Servers
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+Servers&amp;body=##+URL:+/wiki/configuration/5.0/servers.html
Improvement:
>)
Servers
If you want to download anything, you need to have access to one or more Usenet servers. For each server you need to specify its parameters.
## Priorities
You assign each server a priority, a number between `0` (highest) and `99` (lowest).
SABnzbd will first try to get articles from the group of servers with the highest priority.
Within the priority group, the first server with a free connection will be tried.
When the first tried server doesn't have an article, then another server with the same priority is tried.
When none of the primary servers has a specific article, a lower priority group is tried. Within the lower priority group, the same method is used: the first server with a free slot is tried.
## Article availability
This statistic will show you how many of the requested articles were available on this server. The number of requested articles is included, to offer a comparison between the servers.
It could be that some higher priority servers are tried less often. If they are tried less often but still have a low article availability, it might not be worth having this subscription.
## Basic settings
NOTE Check your Usenet provider's documentation for the proper values!
|**Enable**|
If you have multiple servers, you can use this field to quickly enable or disable servers.
This field can be set/reset by the [Scheduler](/wiki/configuration/5.0/scheduling).
|
|**Server description**
Advanced|The name of the server in the Config and download reports.|
|**Host**|The DNS name of the server. Example: `news.my-isp.com`|
|**Port**|The standard port is `119`. Some servers use a different port number.
SSL is usually port `563` or `443`.|
|**SSL**|
Use a secure connection to the server.
NOTE Most providers use port `563` for SSL, do not use port `119`.
|
|**Username**|Often you need to supply the user account of your Usenet subscription.|
|**Password**|Often you need to supply the password of your Usenet subscription.|
|**Connections**|
Usenet providers offer different amounts of simultaneous connections.
You may need to specify the maximum amount allowed in order to get full speed. Do not use a large number.
Most servers work best with anything between `8` and `30`.
See [High speed downloading](/wiki/advanced/highspeed-downloading) for more information.
|
|**Priority**|See Priorities section above.|
|**Retention**
Advanced|
Set here the maximum retention time of your server. Retention means the number of days that articles are kept by the server. `0` means infinite retention.
Only use this when you have multiple servers and you want to avoid that SABnzbd wastes time on asking servers for articles it cannot have.
Be aware that retention times advertised by Usenet providers are not absolute. If you set it too low, your others servers will be used more intensely.
There is no reason to set a retention time when you have only one server.
|
|**Timeout**
Advanced|Time out in seconds for error recovery. Be careful, do not set this to a very low value, your provider will not like that. A common value is `60`.|
|**Certificate verification**
Advanced|
SABnzbd will verify the certificates your server uses in order to verify its identity.
Read more on [Certificate verification](/wiki/advanced/certificate-errors).
WARNING Disabling or setting this check to `Minimal` allows anyone to redirect and intercept your traffic using *any* valid certificate! It is comparable to not using SSL at all.
* `Strict` = Enforce full certificate verification. This is the most secure setting.
* `Medium` = Verify that the certificate is valid and matches the server address, but allow certificates locally injected (for example by firewall or virus scanner).
* `Minimal` = Verify that the certificate is valid. This is not secure, any valid certificate could be used.
* `None` = No certification verification. This is not secure at all, anyone could intercept your connection.|
|**SSL Ciphers**
Advanced|See [SSL Ciphers](/wiki/advanced/ssl-ciphers).|
|**Required**
Advanced|
In case of connection failures, the download queue will be paused for a few minutes instead of skipping this server. This way you can prevent secondary (block) servers to be used when there is a temporary problem with your main server.
NOTE If you enable this on multiple servers, they all need to be available before the download queue will be unpaused.
|
|**Optional**
Advanced|
If you use multiple servers and some of these servers are not very reliable, you can declare them "optional". This means that if such a server causes too much problems (like time-outs) it will be ignored for some time.
NOTE When you declare a server with a long retention time as optional and the server is temporary out-of-service, SABnzbd will fall back to another server.
If the alternative server has a shorter retention time, you will miss articles if the articles are beyond the retention time of the alternative server.
It is best to set your most reliable and longest retention time server as a lower priority server but not as optional.
Secondary servers (cheaper, less reliable, shorter retention time) can be set as *high priority* and *optional*.
|
|**Articles per request**
Advanced|
Number of articles to request per connection (pipelining). The default is `2`. Higher values can improve download speed but may cause issues with some servers or connections. Set to `1` to disable pipelining.
See [NNTP Pipelining documentation](/wiki/advanced/nntp-pipelining.html) for more information.
|
|**Account expiration date**
Advanced|
If you supply the expiration date of your server subscription, SABnzbd will warn you 5 days in advance.
NOTE The server will not be automatically disabled.
|
|**Quota**
Advanced|
If you have a block account, SABnzbd can warn you when your quota has expired. Most useful if you set it at around 75% of the block size that you bought, so you are warned early.
NOTE The server will not be automatically disabled.
|
|**Personal notes**
Advanced|In case extra information is necessary to identify this server to you on this Configuration page.|
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)