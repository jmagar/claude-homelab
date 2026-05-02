SABnzbd -
Wiki -
NNTP Pipelining
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
](<https://github.com/sabnzbd/sabnzbd.github.io/issues/new?title=Improve:+NNTP+Pipelining&amp;body=##+URL:+/wiki/advanced/nntp-pipelining.html
Improvement:
>)
NNTP Pipelining
NNTP pipelining is a performance optimization that allows SABnzbd to send multiple article requests to your Usenet server without waiting for each response.
This significantly improves download speeds, especially on connections with higher latency.
# When to Use Pipelining
Pipelining provides the most benefit in these situations:
* **Higher latency connections** (80+ ms) - The performance improvement is most dramatic when your connection to the news server has noticeable delay
* **Fast internet connections** - If you have bandwidth to spare, pipelining helps utilize it more effectively
NOTE Pipelining can be configured per server with a default value of 2 requests per connection.
# Configuration
## Adjusting Pipelining
Pipelining is configured per server in **[Config → Servers](/wiki/configuration/5.0/servers)** under Advanced settings. The setting is called **Articles per request**.
## Recommended Settings
The default value of **2** enables light pipelining out of the box. Ping time to your news server is the most important factor, it determines how aggressively you need to pipeline to keep connections busy.
* **Disable pipelining (1)**: Safe fallback for servers that do not support pipelining
* **Default (2)**: Light pipelining, works with most servers
* **Low latency connections (\< 20 ms)**: The default of 2 is often sufficient; increasing the number of connections has more impact than raising pipelining
* **Higher latency connections (\> 50 ms)**: Try values of 5–10; pipelining has the largest impact here
* **Fast internet connections (\> 1 Gbit)**: Try 5–10, combined with 20 or more connections
NOTE The pipeline depth should be tuned carefully. Values that are too high can reduce performance due to increased overhead and the amount of responses buffered. Increase gradually while monitoring your speeds. Also be mindful of server connection limits, exceeding them causes errors.
## Troubleshooting
**Speeds didn’t improve:**
* For high-latency connections (\> 50ms), try increasing `Articles per request` to 5–10, this has the largest impact
* For low-latency connections, try increasing the number of connections instead
* Verify your server supports pipelining (check with your provider)
* Check if your connection is already saturated
**Getting connection errors:**
* Set `Articles per request` to 1 to disable pipelining
* Reduce the number of server connections — many providers enforce a limit (e.g. 50 connections) and exceeding it causes errors
**Unstable downloads:**
* Reduce the `Articles per request` value incrementally
* Ensure your network connection is stable
* Check server load with your provider
# How It Works
## Traditional NNTP Download
Without pipelining, SABnzbd must wait for each article response before requesting the next:
```
`Client: BODY \<article1\>
[wait for network round-trip]
Server: 222 Article retrieved
[receive article data]
Client: BODY \<article2\>
[wait for network round-trip]
Server: 222 Article retrieved
[receive article data]
`
```
## Pipelined NNTP Download
With pipelining, SABnzbd sends multiple requests immediately:
```
`Client: BODY \<article1\>
Client: BODY \<article2\>
Client: BODY \<article3\>
...
Server: 222 Article retrieved
[receive article1 data]
Server: 222 Article retrieved
[receive article2 data]
Server: 222 Article retrieved
[receive article3 data]
`
```
This eliminates idle waiting time and keeps the connection continuously busy.
[](https://www.newshosting.com/partners/exclusive-usenet-offer/?a_aid=sabnzbd&chan=mb2)